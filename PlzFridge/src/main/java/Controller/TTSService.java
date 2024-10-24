package Controller;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.cloud.texttospeech.v1.AudioConfig;
import com.google.cloud.texttospeech.v1.AudioEncoding;
import com.google.cloud.texttospeech.v1.SsmlVoiceGender;
import com.google.cloud.texttospeech.v1.SynthesisInput;
import com.google.cloud.texttospeech.v1.SynthesizeSpeechResponse;
import com.google.cloud.texttospeech.v1.TextToSpeechClient;
import com.google.cloud.texttospeech.v1.VoiceSelectionParams;
import com.google.protobuf.ByteString;

public class TTSService extends HttpServlet {
	// 서비스 계정 JSON 파일 경로를 설정합니다.
	static {
		System.setProperty("GOOGLE_APPLICATION_CREDENTIALS",
				"C:/Users/smhrd/Downloads/reliable-vector-436306-d6-9fc67884af5e.json");
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("tts 서블릿 도착");
		request.setCharacterEncoding("UTF-8");
		String text = request.getParameter("text");
		System.out.println("TTS 요청 텍스트: " + text);

		// Google Cloud Text-to-Speech 클라이언트 생성
		try (TextToSpeechClient textToSpeechClient = TextToSpeechClient.create()) {

			// SynthesisInput 생성
			SynthesisInput input = SynthesisInput.newBuilder().setText(text).build();

			// Voice 설정
			VoiceSelectionParams voice = VoiceSelectionParams.newBuilder().setLanguageCode("ko-KR") // 한국어 설정
					.setSsmlGender(SsmlVoiceGender.NEUTRAL).build();

			// AudioConfig 설정
			AudioConfig audioConfig = AudioConfig.newBuilder().setAudioEncoding(AudioEncoding.MP3).build();

			// TTS API 호출
			SynthesizeSpeechResponse synthesizeSpeechResponse = textToSpeechClient.synthesizeSpeech(input, voice,
					audioConfig);

			// 변환된 오디오 파일을 응답으로 전송
			ByteString audioContents = synthesizeSpeechResponse.getAudioContent();
			response.setContentType("audio/mpeg");
			response.setContentLength(audioContents.size());
			OutputStream out = response.getOutputStream();
			out.write(audioContents.toByteArray());
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
