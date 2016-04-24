// Simple emission map shader
Shader "Custom/EmissionSimple" {
	Properties{
		_MainTex("Albedo Texture", 2D) = "white" {}
		_EmTex("Emission Texture", 2D) = "black" {}
		_EmPower("Emission Power", Range(0.0,2.0)) = 0.0
	}
		SubShader{
			Tags{ "RenderType" = "Opaque" }
			CGPROGRAM
			#pragma surface surf Lambert
			struct Input {
			float2 uv_MainTex;
			float2 uv_EmTex;
		};
		sampler2D _MainTex;
		sampler2D _EmTex;
		half _EmPower;
		void surf(Input IN, inout SurfaceOutput o) {
			o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb + _EmPower * tex2D(_EmTex, IN._EmTex).rgb;
		}
		ENDCG
		}
	Fallback "Diffuse"
}