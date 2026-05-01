Return-Path: <linux-usb+bounces-36830-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLOjKKXg9GkoFgIAu9opvQ
	(envelope-from <linux-usb+bounces-36830-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 01 May 2026 19:19:33 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B4E4AE7DD
	for <lists+linux-usb@lfdr.de>; Fri, 01 May 2026 19:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 536F13068DF8
	for <lists+linux-usb@lfdr.de>; Fri,  1 May 2026 17:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5967425CFF;
	Fri,  1 May 2026 17:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gjKSu3Zs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jxq7EVA8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEDC413225
	for <linux-usb@vger.kernel.org>; Fri,  1 May 2026 17:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655210; cv=none; b=dpzNk7AJ+pndsgl0LMZGzxCQG5HC0UnmvaKoRb7VSU10iVGySlSV+A9E5I4ngrja+rFIkZiOjKFOxAZGC4SGFsRkeFMD8d8eDLQfobHnuN40r11sea2T+AsSBts+fuolXUtjLv4IWr2ewvSHJsUvg89xqd/vx4n/EKDQOUjwJKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655210; c=relaxed/simple;
	bh=6JM6P67fIL3JFqTkarnSr/o3rEQMX0AqvoNb7WENFzs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gd62TwQtynwpmdkMyreW/gY/GTmB3vv6K1s1Je4jRvlxulvKCbcANOgWNHk9K/NPwqbQlVfFjznjQoMNm0q9+6qhpkj+vc+wUvTH7OdKBl6AHWa5NcO1zMK2A32dXSD6Bgm06/lar3FCb4MYY1tHQZedeaKMs/3BDWv/0KNtaFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gjKSu3Zs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jxq7EVA8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLSwi2660950
	for <linux-usb@vger.kernel.org>; Fri, 1 May 2026 17:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=15rwOOVjpjC
	8zHr4qmTaFvFtfoo5O5r3leDyOlmAhrc=; b=gjKSu3ZsOtVq2NV2cNIQxJQtv9p
	6casmzGBVBIsmy+ch+AjdfliJ+cXWkHlewx1ybOWlweR13QgOFLyigZjIW28OgOi
	Fn+2Zzo6CUbCFbneF9PS7+RVKXQZOeHnD+0/TpH30Yp9T5W6tlxUdP2fnSyuDe6f
	ADZ3//vXABU4siW8eMzDEbcM6/mXhLl3TI/21GDx0+PM61BcyWueIr8eAb0npyw1
	6Zgv9HSQfGqbbAwMfpqMLCXCWv4b3bTakJ5TT7UIHMknQOZWtm3XTNgUFg0GmHij
	2TSY3L7EdhId9Y/Vr/t14sjoyjaeLzHSRJorxL4dK5O4PvZJ9uoXk8RPmQg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvhbtj992-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 01 May 2026 17:06:47 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2eebb099efbso1829665eec.0
        for <linux-usb@vger.kernel.org>; Fri, 01 May 2026 10:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777655206; x=1778260006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15rwOOVjpjC8zHr4qmTaFvFtfoo5O5r3leDyOlmAhrc=;
        b=Jxq7EVA81vR9z6cH0IkodKNEcP7S3YEVXF1xuA0P3ETMmX9Lyb3H2NOhoBtsWACrLU
         2IFX6yq59H66DaFnjr/szE6V++hGH1MxV21SMgs9oNwgX/sjChSsUl2X41qpB5o5cSSd
         FL63BfNGF5SpUNYJqGYxi66pEsHwJH1peBQs4Rv+XwdIMIHRrY66W3wl+a5ukiW1z9Zq
         mUsPXy8qEYtG2KFgpdHX2V7SZ4TXTKLsvH3MHZ0hV5gyjTz45jTkWWNEsP20D04gDOYz
         vj+a7dCnLoYyFZSMYlgDs4uo2sLCQ3mEM5ibWuO1Y0K0zaaYDXUhjAVC2+lK4cHkcLYc
         a+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655206; x=1778260006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=15rwOOVjpjC8zHr4qmTaFvFtfoo5O5r3leDyOlmAhrc=;
        b=LgIlubZdcKTVPsWIrFnJeYlO0rnXJ/Bjnz6bV5KLJWt/fhfM9bD8Tb0ZbKMbcw6B6W
         nNyLPVgNTlfqL8XGoVSAoTxT+9wVny14hFfjScvfYxTrhqWioGQXqOwwPxi9v/bYRuER
         ULAULcGlD8AQ6tWQsQeL1YrkIypdgnyWvDj+ayOO9PuHX+mwzearpGaxZJ/3EpH/X0Ix
         AP2A/sZWprkOnqLwTFsQYUh9WobecPa+/rhSuCz+z2sHdjquHxRY7PSU0cCmqKLuXpth
         D71mFvmg9d1B0hbJQNZbaYXQf3JW20nkp2jcmmgKb+KsnUAb2D1GK+2nj5n8XmmoGEcE
         wfqg==
X-Forwarded-Encrypted: i=1; AFNElJ96M3eimj/L/93bLIf8kVGDeeovVuhLdmhWyRSzh0LsXjiNBd3gzGRuFEkait6NCrdAwIJkWcugrsA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIk7m61sf7bNiHNL1fSWK4xX70lGo0x3TQ9ozLz9qBjpBrlkN3
	0NZJsehB+p29fNGxclCxCY5xbYtOaAbIuxciJDflNBVSc1XAzslvpfnUEwNH9F2zWfHCKz51hV9
	yJLjLEDy1bRWGSJfwBTYtFR0sjlE0+kQyL5E+CDplPTf/MoFWDkRPwF7hwaAv2Cg=
X-Gm-Gg: AeBDieuxV+bLQB7E5VyA91iH5NgDhGAJ4kewoUsjw31F3n0PhQeeztQ61JchgGNcN6+
	xq3Ohun+0HxeYefZ1b71L4zcGQhryuz6ZWXuGie2unBib6piiugV4M4wurzoaTBIi3N3SD68gEY
	9amOqOW8d0YIhkMv2szHYfnF5KSTD+vhMtGrxKWkHy4hhKaFG6nIGiF/0qKKbH/72LTyE86nqI1
	S+9axmcJ24wadV3JB9Wy4kwTIAE5boxwiWj5zaLsMfpT/G2IL8+JA63FoT1uf8ztO4bkTf3kbFN
	tddULK2+s5WCIpobUJvAcF7n8uzwmMS6umDUv+aPQ7wF1rGmUcMia17+UkNdy8Q9/Zh2Bj36uOh
	1+8IfUcgcYevR7UcMzspR28nI4dMYRQOyyOuwXLztMJNtVVWP/WYyhqWSkIDtbOqWfnllkpr0MS
	30lVdFnYCAJQ==
X-Received: by 2002:a05:7300:5b9e:b0:2e5:5bf4:8869 with SMTP id 5a478bee46e88-2efb9a97fbdmr113840eec.21.1777655206245;
        Fri, 01 May 2026 10:06:46 -0700 (PDT)
X-Received: by 2002:a05:7300:5b9e:b0:2e5:5bf4:8869 with SMTP id 5a478bee46e88-2efb9a97fbdmr113808eec.21.1777655205595;
        Fri, 01 May 2026 10:06:45 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3537d300sm6655978eec.0.2026.05.01.10.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:06:45 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 9/9] arm64: dts: qcom: Map USB connector to EUD on Kodiak boards
Date: Fri,  1 May 2026 10:06:35 -0700
Message-Id: <20260501170635.2641748-10-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cP7QdFeN c=1 sm=1 tr=0 ts=69f4dda7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ZGDwSQe-amPQ6EBapEMA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: fk5gOft7lfYpL4vq0F0ObNlcODA6odLH
X-Proofpoint-GUID: fk5gOft7lfYpL4vq0F0ObNlcODA6odLH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE2OCBTYWx0ZWRfX0wasm5niFoAZ
 s2AdCIKX2h/ONr3B7aIWN/PAXGpvuYi6/n/QzYAYSsUhWUcv4F+kqC7CAPxPsZQ1pkrB6hbwPtL
 UCSTcmy3u8mV+QeoWRlNYs2CiV2BADQKF4qKSPX2IvsHMLTI9cU3ysKIYfmMaR06yWfxtVdVzy3
 tTGxZpLrjgOKe2bMuV9QsaNNcazuRTvD0eCpSZ8vIqc6ZB96pLNUg4YVK7s/o/sVyyyjUCdCj4n
 gW+49x+s9Rv6A4M7jhUpIxMtFxHeeD0NTsZ1/Of6KSzB3jf+kWWXr7kgML3r9GixUeWb40ds4lz
 CghG4D4ooqKFh8qSXER383NRQ/3lod5w6A7YxR3G++2Bi1Z3gmWRFRP49iA/gpigzraP6hlwD+g
 pu13ACFnO6KCsG9Y0i7dTDnp48YeFmztU0hY66ekm3jmPfDpJNu7u0zPjQ8ECK5M30IGrok3jQM
 hcA+EFk0km6/pBVYsyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010168
X-Rspamd-Queue-Id: 19B4E4AE7DD
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36830-lists,linux-usb=lfdr.de];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[12];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_SPAM(0.00)[0.703];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114:c];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Spam: Yes

On Kodiak-based boards, the primary USB connector is connected through
the EUD on the High-Speed path. Update the board-level descriptions to
map the USB connector endpoint to EUD, reflecting the intended hardware
topology.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts     | 10 +++++-----
 arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts  | 10 +++++-----
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts       | 10 +++++-----
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts           | 10 +++++-----
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts     | 10 +++++-----
 arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts   | 10 +++++-----
 6 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 04cb9230d29f..c213e06a4428 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -98,7 +98,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1478,10 +1478,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c>;
 	vdda18-supply = <&vreg_l1c>;
@@ -1521,3 +1517,7 @@ &wifi {
 	qcom,calibration-variant = "Fairphone_5";
 	status = "okay";
 };
+
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
index bf18c4852081..e9c0463daa53 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
@@ -74,7 +74,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -826,10 +826,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c_0p88>;
 	vdda33-supply = <&vreg_l2b_3p072>;
@@ -862,3 +858,7 @@ &usb_2_hsphy {
 &usb_dp_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in>;
 };
+
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index 797f37596bf1..650c4fbc1606 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -84,7 +84,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -952,10 +952,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c>;
 	vdda18-supply = <&vreg_l1c>;
@@ -986,6 +982,10 @@ &usb_dp_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in>;
 };
 
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
 &venus {
 	firmware-name = "qcom/qcm6490/SHIFT/otter/venus.mbn";
 
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index e393ccf1884a..a0db2a2745d2 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -194,7 +194,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1371,14 +1371,14 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_dwc3_ss {
 	remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
 };
 
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c_0p88>;
 	vdda33-supply = <&vreg_l2b_3p072>;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index f47efca42d48..387c38aa87d2 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -93,7 +93,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1090,10 +1090,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c_0p88>;
 	vdda33-supply = <&vreg_l2b_3p072>;
@@ -1127,6 +1123,10 @@ &usb_dp_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in>;
 };
 
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
 	vcc-supply = <&vreg_l7b_2p952>;
diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
index cb59c122f6f6..a2e160f3f46e 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
@@ -99,7 +99,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1440,10 +1440,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vdd_a_usbhs_core>;
 	vdda18-supply = <&vdd_a_usbhs_1p8>;
@@ -1459,3 +1455,7 @@ &venus {
 &wifi {
 	status = "okay";
 };
+
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
-- 
2.34.1


