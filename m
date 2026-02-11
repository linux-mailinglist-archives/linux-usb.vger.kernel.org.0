Return-Path: <linux-usb+bounces-33269-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UM+dJLQJjGn/fAAAu9opvQ
	(envelope-from <linux-usb+bounces-33269-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 05:46:44 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1810C1213F4
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 05:46:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7030F302A53B
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 04:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B96231984E;
	Wed, 11 Feb 2026 04:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mHb6FPtb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Izh9ZWn9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC827191F94
	for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 04:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770785198; cv=none; b=DGQwjNIWqPXLCZzyz2V4ux7R+vPOoW0J63NUbqtES+dll4wwCsNXYb7YOjOD2j7eridO2pGRrZndmr2AEDNl3jC1FkynYZHUSHIJ5uF8mIhEe1md2tpKB25Gp27VrywlBn3tSARXyXru2BrWeUKvIV2m9rkkkdDZ4142J84FDiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770785198; c=relaxed/simple;
	bh=kWMCs8+srR7SkQIJklQj6U9T3w0o+P3u+mBrDWyWwKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NDD3RSg/BYlRz/R23wX+zX80Pb5yv/ZAg6ES0Pdls+AQuvHf/MmoF3FJqjLbnS0NrV19ZHTvXmxdRWhj739klJQoAA6mZMhcHxdeMF78eTWOsB5Q6r7P54gbhb7Nefot/uBrlC+KWi7wc8BY5D7tJpRoBtw9JsL9w6BBLqWlB80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mHb6FPtb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Izh9ZWn9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AKCL5E2640968
	for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 04:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mKLRl72Myq4avuA/EeMiT9OHKtbeC3tXWGoz2xCUjqs=; b=mHb6FPtbgR96Vcqe
	cs3CoSOqBQS6w6MSlv0MCclddwwtThUWnEiVqJ4Uw/mTQjngnaAI1pmcv+EXNM3j
	+MffTax5xtqn8oFIdLK7a19uL457+NcsZ0RQplU6UOfRW3t9IOMxlv9Q/UPOJwJj
	FqCKp/Pg69PVYngds1h+4dlsPhoQjMf1/YoRPrP3QCaztAUdpwerzkJMlYgObUpO
	ENVPscHC1+2r3Ie5K52luzZ8pBbDECrdc6UaMNVC+vnPMYsRnaTjJd3zaK1Kg0lX
	I0yeZ2vc8bLMLB0/GPaF01KmB4kyC06A/WrWtOCexdW79EQ5Y9vgKgxVw+eC/pvZ
	62bC8w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8bgnhd4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 04:46:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aaf2ce5d81so36509705ad.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 20:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770785195; x=1771389995; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mKLRl72Myq4avuA/EeMiT9OHKtbeC3tXWGoz2xCUjqs=;
        b=Izh9ZWn9DDYFGO/Wl2Isk3SWN7bDkUSkU6M0RxTUXsRit9w1WwGhXosp+x5t6AGsBs
         UcUlOoCj+T2WFAZeA3ttftTt/oiUPTvH1pVLOPGROivHUfqY2yucqwzTksyMPtvULn2I
         xMWZJ8ykQ5rFS77lbk0vpLLnNSgvAiK1bPIJseqdCvwKuOqrPA1IZS89NHEgx7svVDtg
         BRg364j96TNrNGmgQhXLNabS775Hx5SUZk5pzdf9ib5yKbhNBTlct65xr/XVMp7Cjuv9
         2bHFy8WksuzXDJCht2wlN719JDHaTzUedqgbCEU+/9F82UifVlQ9K3WYCYE1N9LHKF2n
         u0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770785195; x=1771389995;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mKLRl72Myq4avuA/EeMiT9OHKtbeC3tXWGoz2xCUjqs=;
        b=PWHl9uwJO3uJzm35lEDgymMhSHa1eD1vPlVFBc/vTOYB//cEKDBKaVThaau7WJqpp9
         g5X8mFD5jTnv1pvbEg1J3LhLRQTIwwW3czrt+NtzwIcKzXJmK/X5l7TnnYOLbqdU2rYn
         g+mdsEqYpINcMVKjO6xdb/sMqhxAq88T+HseZs2FW90HlW8y83azHUc25rLGt/MxlVTe
         LxSGUNSD+7PQwEs1/ZY5FBcNtiePhtckU7tykqfoHxMhIitzP7HkfNyzO56XlK6nQD07
         b+/YGmKs5J+c8hyIGSgFNxPIA3a3KrZmHXO+AtPbUVJsqeVzOGBVQuINavhe2CCp07DM
         VS2A==
X-Forwarded-Encrypted: i=1; AJvYcCXG1tsSXk0ZLhTdRHM56DRpsM1r4UEv5n390iCM5Qw5NYMEAT5bA3CfAstEdOMyNAeY3DjV4vMWdnM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdf9lwglXyF35Uqg47MZSy3ROSNdX5JQs/AYniAYbdbC66wLVn
	8iY6KP8i8XHX3H7IjftJ52/qywzUmwONRb4qxKsFR+ixNuKhTowS6+7wevoXVVpSW0Ge+eCqv81
	C+APOaWsp8VNurlHGCKhrNJx/0a1Aw3xLOtUhccXSIwRTx41UkoAtzGhvh1h3t1Ih2YO3SeE=
X-Gm-Gg: AZuq6aL76fpKMUf3L0BmdNHJO4diYYIVadwpNcIb7ACrHqUelkp7PXr8TItS39ou5F8
	rBgVC+R/reo1yA9S1pEt/sUxaN8EuWNbC4nJB5kNOkCimbBUAky9IKzWtvbGPMKXArzSsp+MC2F
	aYCJ4d2m54h4gUg9EUJHWejY8uWwsKHPHrs4C8reHRSFTD5K/OZXmGK5lSPa2/WG6FieqRBzpLC
	uO5ox8WW26pEmNS9ETMgkx6+ec+v+mxQ4r6BkV9pJOgOUGgGJ6yDggQ9NDIpI90rTdP8qSRb46q
	t4z0OQRuZxhufI4okO1GXqhI8kYTphjuwPGn/7+m7HyqnFOc7LXvWRBWZv325+c6Jfry7j+OUSB
	OmnbUPYhzIyHy8R7yGyfYmcrMI8O/+AeK0252c8OcbAN6NLCcBl8=
X-Received: by 2002:a17:903:2a90:b0:2a0:c1ca:20f7 with SMTP id d9443c01a7336-2ab275f1b56mr15352345ad.15.1770785195146;
        Tue, 10 Feb 2026 20:46:35 -0800 (PST)
X-Received: by 2002:a17:903:2a90:b0:2a0:c1ca:20f7 with SMTP id d9443c01a7336-2ab275f1b56mr15351985ad.15.1770785194561;
        Tue, 10 Feb 2026 20:46:34 -0800 (PST)
Received: from [10.217.219.187] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e197d61a0sm626729a12.19.2026.02.10.20.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 20:46:33 -0800 (PST)
Message-ID: <ad294a50-027f-4caa-a9b4-e145f709b50a@oss.qualcomm.com>
Date: Wed, 11 Feb 2026 10:16:29 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Enable USB2 controller
 Micro-USB OTG
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260210143931.3324647-1-akash.kumar@oss.qualcomm.com>
 <y32g3rpgfjtr6qyic6goj24uw24tucdsenninqqok3r5ofahj2@7cxcwf4cn6cc>
Content-Language: en-US
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
In-Reply-To: <y32g3rpgfjtr6qyic6goj24uw24tucdsenninqqok3r5ofahj2@7cxcwf4cn6cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDAzNiBTYWx0ZWRfX0KsjqcHkPcol
 NfwllSL5WJJ+m8qtkNJjppB360q/SZ8txjDeGtS63e2ddbH+dq7AvrqWXgkJ+sqEXMeoAQcaELf
 6A2o597FPZg2GJFDMW02qaXJMYBaZBGORG1DWKXGXiVSzKlxm/a9qq65Hp8LB93lXrK8TLsTOE1
 BIxL16KmfAzVE6eK3ptaTA1A3NnLf2QCjCgjZgpB7YpeDMM17X7Xj9mLzrKIO/UJWoil+1D4dua
 xNgI85H0gIBGK5XhT1p6245BFzfDKz+KEKw0tfbPetdQuNJP90Au33R3rQUJzUxhYH6QkZTn1fT
 MUbmW77OQUowm2bRa5UtQxahWI2/zMAVkpz1pldLg6fERmlpSAK/DpZjgIe8J+OkGrOGzaoGBB8
 EvxvxgQalV/48E4oS+o/4fZQMHYBUVBWB4CTFznBivtdEv4qvjweDIOCKVVBsh/tsO278p8tec8
 u19ymjbNqJ5ljbJ9rLQ==
X-Authority-Analysis: v=2.4 cv=TKVIilla c=1 sm=1 tr=0 ts=698c09ac cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=aB85t684Z1S4vwK0cisA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: tbuqCA7weTz2K0QPydbBEXxdEefAzmyw
X-Proofpoint-GUID: tbuqCA7weTz2K0QPydbBEXxdEefAzmyw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602110036
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33269-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akash.kumar@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1810C1213F4
X-Rspamd-Action: no action

Hi,

On 2/11/2026 2:45 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 10, 2026 at 08:09:26PM +0530, Akash Kumar wrote:
>> Enable the secondary USB controller (USB2) and its High-Speed PHY to
>> support OTG functionality via a Micro-USB connector.
>>
>> Define a dedicated 'usb2-connector' node using the 'gpio-usb-b-connector'
>> compatible to handle ID and VBUS detection. Link this connector to the
>> DWC3 controller via OF graph ports to satisfy schema requirements and
>> enable role switching.
>>
>> Specific hardware configuration:
>> - ID pin: TLMM 61
>> - VBUS detection: PM7325 GPIO 9
>> - VBUS supply: Fixed regulator controlled by TLMM 63
>> - Configure &usb_2 in OTG mode with role switching enabled.
>> - Define a gpio-usb-b-connector node for Micro-USB support, mapping the
>>   ID pin to TLMM 61 and VBUS detection to PM7325 GPIO 9.
>> - Add the 'vdd_micro_usb_vbus' fixed regulator (controlled by TLMM 63) to
>>   supply VBUS to the connector.
>> - Add the 'usb2_id_detect' pinctrl state to configure GPIO 61 for ID
>>   detection.
>> - Enable &usb_2_hsphy and populate necessary voltage supplies (VDDA PLL,
>>   VDDA 1.8V, VDDA 3.3V).
>>
>> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 68 ++++++++++++++++++++
>>  1 file changed, 68 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index f29a352b0288..ee472d8b2db1 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -217,6 +217,16 @@ pmic_glink_sbu_in: endpoint {
>>  		};
>>  	};
>>  
>> +	vdd_micro_usb_vbus: regulator-micro-usb-vbus {
>> +	       compatible = "regulator-fixed";
>> +	       regulator-name = "MICRO_USB_VBUS";
>> +	       gpio = <&tlmm 63 GPIO_ACTIVE_HIGH>;
>> +	       regulator-min-microvolt = <5000000>;
>> +	       regulator-max-microvolt = <5000000>;
>> +	       regulator-boot-on;
>> +	       enable-active-high;
>> +	};
>> +
>>  	vph_pwr: regulator-vph-pwr {
>>  		compatible = "regulator-fixed";
>>  		regulator-name = "vph_pwr";
>> @@ -262,6 +272,30 @@ active-config0 {
>>  		};
>>  	};
>>  
>> +	usb2-connector {
>> +		compatible = "gpio-usb-b-connector",
>> +			     "usb-b-connector";
>> +		label = "micro-USB";
>> +		type = "micro";
>> +		id-gpios = <&tlmm 61 GPIO_ACTIVE_HIGH>;
>> +		vbus-gpios = <&pm7325_gpios 9 GPIO_ACTIVE_HIGH>;
>> +		vbus-supply = <&vdd_micro_usb_vbus>;
>> +		pinctrl-0 = <&usb2_id_detect>;
>> +		pinctrl-names = "default";
>> +
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +				usb2_connector_ep: endpoint {
>> +					remote-endpoint = <&usb2_controller_ep>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>>  	wcn6750-pmu {
>>  		compatible = "qcom,wcn6750-pmu";
>>  		pinctrl-0 = <&bt_en>;
>> @@ -606,6 +640,7 @@ vreg_bob_3p296: bob {
>>  			regulator-max-microvolt = <3960000>;
>>  		};
>>  	};
>> +
> Stray empty line
will remove.
>>  };
>>  
>>  &gcc {
>> @@ -1137,6 +1172,12 @@ qup_uart7_sleep_tx: qup-uart7-sleep-tx-state {
>>  		 */
>>  		bias-pull-up;
>>  	};
>> +
>> +	usb2_id_detect: usb2-id-detect-state {
>> +		pins = "gpio61";
>> +		function = "gpio";
>> +		bias-pull-up;
>> +	};
>>  };
>>  
>>  &uart5 {
>> @@ -1200,6 +1241,33 @@ &usb_1_qmpphy {
>>  	status = "okay";
>>  };
>>  
>> +&usb_2 {
>> +	dr_mode = "otg";
> This is default and can be dropped
Sure.
>> +	usb-role-switch;
> THis should be moved to the kodiak.dtsi.
Kodiak.dtsi already has this property, so will remove from here.
>> +
>> +	status = "okay";
>> +
>> +	ports {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		port@0 {
>> +			reg = <0>;
>> +			usb2_controller_ep: endpoint {
>> +				remote-endpoint = <&usb2_connector_ep>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&usb_2_hsphy {
>> +	vdda-pll-supply = <&vreg_l10c_0p88>;
>> +	vdda18-supply = <&vreg_l1c_1p8>;
>> +	vdda33-supply = <&vreg_l2b_3p072>;
>> +
>> +	status = "okay";
>> +};
>> +
>>  &usb_dp_qmpphy_out {
>>  	remote-endpoint = <&redriver_phy_con_ss>;
>>  };
>> -- 
>> 2.43.0
>>
Thanks for review.

Will send v2 with these minor fixes.

Regards,
Akash.

