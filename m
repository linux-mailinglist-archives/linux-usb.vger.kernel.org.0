Return-Path: <linux-usb+bounces-37386-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFDHH9OMBGqvLQIAu9opvQ
	(envelope-from <linux-usb+bounces-37386-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 16:38:11 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD4B535398
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 16:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0CF24300D4D7
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 14:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80617449EA6;
	Wed, 13 May 2026 14:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="clrZphC1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X6Bq21oE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CC343DA42
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 14:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682696; cv=none; b=RJk4+YArL2ZA8cjjNxHaDwRt0AMyB4OrsdJqd7Qo02+jwZTIcJ0RsrbU73cR8pzVqL2PqQGvOEUQep71z/zf7ETmdvk8SZEHDFzOhSl1aTHucBE9Qt3b1XVq6J+BRDRUjzuhcYYGTbB4wF6DTJwS99LBkov92sWLbL7tAjdTqGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682696; c=relaxed/simple;
	bh=wUc9lMKXkCeotpgFm95ubkEbe9ZQWC+fBE/j+Hm0hDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NVx5Jsw40bCXYor5jvWoq4W//sddJxHG7ID1ej0rIpmN6YoCNGmMNoerXOJy6zKOpd+JiboGGNzWlEaSHRzOsYk8woYq2Y4TVwiN7c2dvZjsVn5EDMNSISpzY3c0mdAWkSN0h4lBDQ3QvFVJ/5JSKBbtOmEmDbW49vm01KZEBu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=clrZphC1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X6Bq21oE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DCROTF2965200
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 14:31:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/lRuLzIXlukujnHHTg5x8pIPyqWqQhCl4lFaASY0Pd8=; b=clrZphC1X3MFyXIN
	AGBmOgAA0apGMkojnBUd0zElQPipNJCE8yCywlJL4G9ICNYp4eJPaQ9owhxfcxwL
	X3TfbzBBPO2H1710f/an80qFgb7aNQjNRqNyOLJtsrfDkyd6Vxnll3lU3LZDdcw2
	xH/Dk0roz+cMqEeWnAy/LoszF2YzNfLvZQlFZ5P4Q+z+lTb6RtCojfcMrrOPXnOG
	aP2ntd/21CVtIiwuAFqBe++LCUCT1bMtQf+k10dngWnotYsIlJX8QqfNcXFKqu8f
	2GPkkiZdJy+8YQ2ub1R9SSpZgIrASZvyG88dGf3uAHePTE26BgJjUexOPeQYT9c8
	IxsIQg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma59t69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 14:31:32 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7dbc09d4e43so16719635a34.1
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 07:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778682692; x=1779287492; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/lRuLzIXlukujnHHTg5x8pIPyqWqQhCl4lFaASY0Pd8=;
        b=X6Bq21oELhQ9BkY1DEhVYIc3y9cGSBirt88E2LfsmZaWSppWhm84R5TKBbjmnPiNNC
         4DfkrNNYyeHwfN+HCfFJfwQ0Ht7PAsnglEDAk/RLv5t9H7VGiLZ+3hPi3x9M1EQviF8+
         Jpgw3yOoaYagxjy2+1S8KIpguClCu6ZCqo5f0/MLalOwyCiwkPrue3XzsTPBnhZ2pAOD
         qfV0UaaAJLPGfFF6ZXuBSF67c3dy+L1Ol9FdyZa1EOPgBARfh8MzgbErq6BXktza/oTT
         c+8J8/m7FJqx6Dria8UH18wd/+oorxhG9fQQxPSbB1GhuFGyVEEc+KM91LHiyekHbzU0
         oMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682692; x=1779287492;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/lRuLzIXlukujnHHTg5x8pIPyqWqQhCl4lFaASY0Pd8=;
        b=sL8TnXh0dYw5DH4w9xSg5J7RN1FIx4YdZMbcLXWYNCvbXO9WUPXRja7hg+krMfDrwf
         INFtd9INhyQy+HzceHSeD8WCWYOomZNvH9ufWz5PSB+NKQ0Be+sEEt6Gedi7U5s2Jelm
         Mq+jh14POxgodTf/DtQuVqwenjSVVB6c32wRiPDTnHaYmdVABn8w+Qgez8cJWcWcOBXk
         yBGLe2sGZ1wuDNKghap7twv+fVJOc6BEwbe3vPDTraOlKscie8FTUb8IzD+8E1SN/WOj
         HWV+z8lr5n0T916ESwfmQD0wfNcWpi1x+vnB1vytmJEO7YMPaUnJb/+yOTtY11I9sjh3
         MWGQ==
X-Forwarded-Encrypted: i=1; AFNElJ+mZqDH0pWTvKAYXYFn4iAHwW5p0vLnwxMNG+ZtGDIMBjv9jLSTfBdF813yRVX7/Q923vjZVx5b7SM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8kw9LkFBZaFwfJBZZ5gyBQvP6GS0xsN8+pPX/H7pHR79qi7oy
	19UhtiuQWej4GA3/JHoKLf/DCpVLA1rGchlk3N3rrswF54hVG1zF4qNSUVEbKUfdJsWSEMt3SA9
	Vu9YNsqTZ+oqL9suxHBeTyrWEiSdtfhItuuChGVToA86kfTUAm49ztKU1t3BRma0=
X-Gm-Gg: Acq92OHaIHraMZyzzO0OdVUWtvTboBfO9kyeZMlGesW7Rur0LKyXGI6QPqRMoUuh6rZ
	ISJKPfJ73+ftgDuTc4tObUSPDQHB1M+icBFRu2xI7SxTUb6zOjngezQshSrPeSXn/Nu4tkP94So
	HJa38WjMAyElczN/5z7nLEL7DocZednjdGsaCGNEhqx9ozRSd5bT3K7+Yow41yEpH39bkXYc2Z7
	536Mk5AD5kFhJG4OIAc8f7k6lzaQL7M3Kvuz201rwkq8B6Pv1ZZKWbajE6e2uQ2F1w1XjAOOU9j
	6pKwd8JxXCIx2nTAkBhNOQoyaQQVNfnLQqKsjMirhDJn0QY2ud75TzUfe5iTCQYSXt3TVgf8mOr
	Dlt0+NBtKDcGnXUrZ+TK8g2oYvloTe5ll7kQ53NLNFvfFqu+26oV7LAzPpG7LX4ctVBY1Pyt++I
	A5PXeqK5SGoAMCSpUaGpblBUV0Q5hqxt2kTrY=
X-Received: by 2002:a05:6830:6e89:b0:7dc:cf5d:df17 with SMTP id 46e09a7af769-7e3bd3b5102mr3695432a34.18.1778682691695;
        Wed, 13 May 2026 07:31:31 -0700 (PDT)
X-Received: by 2002:a05:6830:6e89:b0:7dc:cf5d:df17 with SMTP id 46e09a7af769-7e3bd3b5102mr3695403a34.18.1778682691234;
        Wed, 13 May 2026 07:31:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a9515087sm4106065e87.12.2026.05.13.07.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:31:30 -0700 (PDT)
Date: Wed, 13 May 2026 17:31:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: lemans: Enable eud support
Message-ID: <rwf5xrib7dba5clavznhhmvyqbjejeujy6omotnheisu2ke7de@zpm6ea7f7f46>
References: <20260512091422.1395490-1-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260512091422.1395490-1-akash.kumar@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0OSBTYWx0ZWRfX5cvjAPrv5Amj
 lAIgjoSb5cPrfcQ2LdhNfGOT8pRZLxCYi9eV4RWlCbMiw41HfsaZT703vvATJl6dPDSZ8bB/nKO
 upfiYLQM2lohJ5jCO9nrR71l71Bb7pYoVDMZ0Wuw/Ow3v+2IruZPFKbvArrtS4Sk4UW6YuMK2z4
 8zH5n9a1z0RUxGl0BZbYQQwFPsHhrsqUQPrTeH8hIjJVamkulSbrUTAcZ/ahm/wnyRxGACfCKwo
 3AvCfhiXLwOdRIYu3S6vFW8+SFnNZgWoMLn8vGHMbqe0VYkvQ/8/AQ7bUgJmQLgeEkLCZ96cWhi
 BaZN3c+IIt7CAXzANicn9arnHK5qs52jRK4+bQOrOeLd//OKIesMCveIQUdOrgeljCL/dEtg+Hu
 X3VZmq2NIyJ85EVY9IQKjZvaeDe4i7gBPwBm4GOfg0nLJrtyLcG+TxlTk2kVzaPrzB23mAcXfbC
 7wvfEVlpcbBXgyhTo1A==
X-Proofpoint-ORIG-GUID: 2BQY_FmgEHTKzdqtJM9x0ZTOurmhe17E
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a048b44 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=clN1VyBAevDfDM2Nx5IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: 2BQY_FmgEHTKzdqtJM9x0ZTOurmhe17E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130149
X-Rspamd-Queue-Id: 1DD4B535398
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37386-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:url,qualcomm.com:dkim,0.0.0.1:email,0.0.0.0:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 02:39:26PM +0530, Akash Kumar wrote:
> Add the EUD controller node in lemans.dtsi and update the USB HS
> endpoint routing on lemans-evk to pass through EUD instead of linking
> the connector directly to usb_0_dwc3_hs.
> 
> Wire the OF graph endpoints between the connector, EUD and DWC3 HS
> controller to enable the EUD path on lemans EVK.
> 
> This change is part of series "Improve Qualcomm EUD driver and
> platform support" and has been validated on the Qualcomm Dragonwing platform
> (RB8 board), confirming successful OpenOCD connectivity to the EUD
> interface. For detailed usage instructions, refer to Qualcomm’s Linux
> kernel debugging guide:
> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-12/debugging_linux_kernel.html#debug-using-openocd
> 
> Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 12 ++++++++++--
>  arch/arm64/boot/dts/qcom/lemans.dtsi    | 26 +++++++++++++++++++++++++
>  2 files changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> index c665db6a4595..96d316867c0e 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> @@ -55,7 +55,7 @@ port@0 {
>  				reg = <0>;
>  
>  				usb0_con_hs_ep: endpoint {
> -					remote-endpoint = <&usb_0_dwc3_hs>;
> +					remote-endpoint = <&eud_con>;
>  				};
>  			};
>  
> @@ -510,6 +510,14 @@ queue3 {
>  	};
>  };
>  
> +&eud_ep {
> +	remote-endpoint = <&usb_0_dwc3_hs>;
> +};

If this is a static binding, this should be a part of the lemans.dtsi.

> +
> +&eud_con {
> +	remote-endpoint = <&usb0_con_hs_ep>;
> +};
> +
>  &gpi_dma0 {
>  	status = "okay";
>  };
> @@ -985,7 +993,7 @@ &usb_0 {
>  };
>  
>  &usb_0_dwc3_hs {
> -	remote-endpoint = <&usb0_con_hs_ep>;
> +	remote-endpoint = <&eud_ep>;

The same, this should go to lemans.dtsi.

>  };
>  
>  &usb_0_dwc3_ss {
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index fe6e76351823..a8ab11681476 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -4003,6 +4003,32 @@ opp-384000000 {
>  			};
>  		};
>  
> +		eud: eud@88e1000 {
> +			compatible = "qcom,sc7280-eud", "qcom,eud";

There should be a platform-specific compat too. The lemans.dtsi is
not sc7280.

> +			reg = <0 0x88e1000 0 0x2000>,
> +				<0 0x88e3000 0 0x1000>;

0x0 instead of just 0.

> +			interrupts-extended = <&pdc 11 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +			port@0 {
> +					reg = <0>;
> +
> +					eud_ep: endpoint {
> +					};
> +			};

Incorrect indentation.

> +
> +				port@1 {
> +					reg = <1>;
> +
> +					eud_con: endpoint {
> +					};
> +				};
> +			};
> +		};
> +
>  		usb_0_hsphy: phy@88e4000 {
>  			compatible = "qcom,sa8775p-usb-hs-phy",
>  				     "qcom,usb-snps-hs-5nm-phy";
> -- 
> 2.43.0
> 
> base-commit: https://lore.kernel.org/all/20260501170635.2641748-1-elson.serrao@oss.qualcomm.com/
> change-id: Improve Qualcomm EUD driver and platform support

-- 
With best wishes
Dmitry

