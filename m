Return-Path: <linux-usb+bounces-37688-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULEsDvFBDGq4bwUAu9opvQ
	(envelope-from <linux-usb+bounces-37688-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 12:56:49 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F8457CFB8
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 12:56:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1A5FA3090596
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 10:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC7783F1ACF;
	Tue, 19 May 2026 10:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NEEwQRvB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZFu8UJ3A"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588FC3ABD88
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 10:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187701; cv=none; b=tq5vPjuM9Icj24QFe05WJ1cKUA+0cdvKqGX14L0792CTdh0Rfoy00yOwa/vTZOz9zp2uyk1Z5ZxaEJoFkEKJ+t+Lcx78c3aFAXDxOvX7hHs4FVYRBb8oXRZiVst3B2TIUH5+PcBIGhVbP+hiWO8Ahy7Kv5AmFpvbYksZ60eS37U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187701; c=relaxed/simple;
	bh=xYRU6BVEc7MoqdSBzkA9NAynnrccJmvjoEv9mNGS6kY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hToxMHMRoAPmmrPOXGAFooj6em7X6ECxNyq6gZpjfLFml2+BI1VKXKQHWzlO5I2Bd4/YnnwxJE2ofMoZodpg0w98w4ucTXzNhBCrffHxEdraKomNfQcOOPKcgMcff09UnS2db/8RlWZRBodhWMtR/H56eJp5lRhFQfXg5cAEKQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NEEwQRvB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZFu8UJ3A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J81mcq1146383
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 10:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	35REuCbpcVViy035ouXJ2Yq1Y9m+z5h75tFEcnvtUk8=; b=NEEwQRvBN2Ysw8Am
	Hy2tNhFLRxp5YjEiY34NSRWEI2s4X5TsKW9Qumq1lfE4lk3nAY3JWoALhT3aqOZm
	4G25y1YMCX+CIhA2ct995gYSBChWjhnpZBtvEYGau3F+bnYwnR/LGp+JhFFNnUCe
	DJH599fjuxgkEvQtvCjdK49C/54ZKfqiTteCmwImL7iGZxwHzARFbVYK8gmw9oXv
	wg5PEpx9mjDLDjS7OEjJDs2aMsW8sE16pnekseSRCikg1U7IZiskxVqsoeSFO3QO
	DvmaCuKcTzpfseVIbg1yzC4ZK5A6N2xT6++hD3p63Jk8syUYLurQUExf20TaVGfX
	MQNthg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8e7ej376-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 10:48:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5163ade1583so69984691cf.1
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 03:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779187697; x=1779792497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=35REuCbpcVViy035ouXJ2Yq1Y9m+z5h75tFEcnvtUk8=;
        b=ZFu8UJ3AqI9tcVDWEZZdSFdb83fsPr2Q70MqxvAD9sFi5C/MdRlLDDmfDrZSk+xWW2
         WDI9Boo668SQ31qPvK72fP+og3MqevPrv56jTpt7QBbIbUhm5KWmuhp7Hn4H0zk/pSJ9
         v8KfhL/4M8BeTX5IYGGwBFsgv2KdKMwe3Pcraw0GmKI9M5v20LiCWIb7oJWw36OvT69L
         myRbW3x7t9Camkc4vHkgj0D8j9U2QEJFSPufr5Z44VAKRRI1YEgBZekf+SjrTvJJwDch
         P3iLaKOMq6w3OHr3FPs22h01FXaAvSSqPu3LJyqo9GDi0JWgNr720Q1ngDvO9eBsVzP+
         HlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779187697; x=1779792497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=35REuCbpcVViy035ouXJ2Yq1Y9m+z5h75tFEcnvtUk8=;
        b=nZKSmITFJjm2D9jA43wjxYK1YEkZSnyq2G71lcHbnNQVVuGUvYT0hB/IIK3C3KbVDP
         QKNRmF2acPJ97gTyKyjpJIpd+f0YkILMSPuYKvS1CC312NiHMpm6C372gf6+ZeFkCkk4
         YlkcjOJJYmJWUCPoEZmQjA+z8oD89pJEyNuHVRHd0imYubrowNRISSbEJHnUjuHACOoE
         iOKRO+WxzW8IC4tsw10frbHSPZhi+/IONB9iyuzHfvHH2d9kwRti4Spn38b9b+wqUMf7
         UZ3N+BdS+n7DzoeTtttZpwafP9j8lKBQrbq0uK6onWO4u0qsrxsFHffgqjMNklk1jIb3
         4mAg==
X-Forwarded-Encrypted: i=1; AFNElJ8xrFV6hXbIeqMuU2tv6FSfuceX0MYh5o2gSE/HeJgeQvm7mGq9nxUMAz6nRGMRQBLFv52Pj94wuBA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf9fjoikggP6uIgC91cO/V/B6ICPu9Z2UtQzsGZ1tE1EedLiO7
	yGYtZuP+ZCIuwS2Fvh3bVdWgB7Eb9+Y614LW1Sm+0pk9iTzWdp9pp2HAez/XhBCT/Ml4P2NoDaP
	qju6ew9kivDYBerG8Az2GNV7aQ11mlPxUYxQTzAfbNas2cpvHsYBpu9SQK8LTkRs=
X-Gm-Gg: Acq92OHEc38kMy7zsBvrEn9IduI6Oip+cNsIjgj2KslOqwaXiUo6rwu7JQCoQnfgsIr
	DYbVZOX8PGxsft5yQCeLSGq+PxolVSJXOAGJFL6q/tTju+CdDWp38eOWTVZ65Zfszs3w0NOXA9f
	RkdfFcbqeWEnknIxMhq8fQfw27Un3bRc6X/ijxOxsMOBsrc0j+a1CDZkwaPhvLVpdOWTl57jAFv
	JJZWXklDfh6laNZ9isAOTW2svgjnzuam9G7n79Yo7W3fi5MWlWNyRz4RG/6Wy/zxX9OO6EyRK9y
	Y2oNuD6Uqp7bbwxqoZ1TPsqzasuimbZz0YZte0hQMKszimm0EvMfqRFL8anOcY3DfntZ6570dZS
	svCwGZn5hkToFLC6W5HP9AvnjuFN570jRFi49bCULIWYi3RQRjIsTJPTzKjYP98nkwWUv3qfrzy
	I/IOfLYNHoKuc7LqMhMYQUJEYtgHUpNJ+VATdbeErKCIutqQ==
X-Received: by 2002:a05:622a:996:b0:50f:de06:45e2 with SMTP id d75a77b69052e-5165a0d077bmr241432511cf.31.1779187696671;
        Tue, 19 May 2026 03:48:16 -0700 (PDT)
X-Received: by 2002:a05:622a:996:b0:50f:de06:45e2 with SMTP id d75a77b69052e-5165a0d077bmr241432281cf.31.1779187696221;
        Tue, 19 May 2026 03:48:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a59dsm4031413e87.25.2026.05.19.03.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:48:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 May 2026 13:48:07 +0300
Subject: [PATCH 5/6] arm64: dts: qcom: pm8150b: move vdd-vbus-supply to
 connector nodes
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-fix-tcpm-vbus-v1-5-14754695282d@oss.qualcomm.com>
References: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
In-Reply-To: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2428;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xYRU6BVEc7MoqdSBzkA9NAynnrccJmvjoEv9mNGS6kY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDD/mkFspQoJLegLkYv9FlQQPdVRasWCokg8YT
 +MaN2NW3eiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagw/5gAKCRCLPIo+Aiko
 1YToB/9/CbyLaoTjhEspKcExQXJN+jofoDLLW/BYnAhuBV0H2L0YvkcSrSr2Df8+JziYHE+FLKi
 P1uqzK1gEGYjwMdiju47i0yToZhZktwT6HHNE7yQ62Q7H0qxmM8ryjI6ebAhLieWj19zA5/R5MF
 fK/rwhYqoqEcIT02LRNzd31T1MXYZTQBrV0lZ+1/t00rfSUBClU09uaDq3yYi48sFk65u9ukYUx
 iWfy4ao05sveH6iYHFvsNx4YjNOeiLHrI/ozp5vkAjEOeWYwkHdlPJ0lo3qMCODwMEu0EYoZ3Jl
 7Ydtzhlkf5XCkwpfSAKGPfe2F6C/eccp4wB4vnXUHpTlyoFB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Rt316imK c=1 sm=1 tr=0 ts=6a0c3ff1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=W78v0XRATXHzZ1sILyoA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: IIj22Buqp4Z851c8jWg-3rHeu_ndpcQo
X-Proofpoint-GUID: IIj22Buqp4Z851c8jWg-3rHeu_ndpcQo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNiBTYWx0ZWRfX7l6SLoGj1MI2
 XcqIKNenss9oKR//S6UBOv1bbwUnvsqMT1xyD/dXAATXRbMj+nAIEfa1m5c5PGUGiWNjCx5xGfD
 0hsOBIhDfsjmM/Ukbq0+P8e9W1lrx5yqQvCHsnm1XFqfj1mlgwY4CquWdp6DxTKAuXw8Ze0H5vv
 eduybOi51UsUFcNbAT0GBhW+BIZZ2XEUx7dV0au7kQHL/h1jM8WeIl8aqAczkCBQSqocO0gfzPI
 1ry5g5tYD9UpHvlncysPb/3g3VKryAbx6bYLDYlZTKECTTTmVqdI9+AM3yisAuzyHwG7O/Roc+o
 gt579N97cC4A6TvjixlsSwrozYSjoaOPIaER+JS8FmBLzHeLU+ccAtFzM+1xxdfkHYpWYeN9EGA
 5YY6SFyQrx86JeAO61FlxoWoqFn88Ab+WdBexAdevdMuITP3cKDVqeX1pzOVico1wYxuQwBsKPq
 /TjmDLkIHjvtydkEM9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190106
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37688-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.9.96:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,linuxfoundation.org,kernel.org,linux.intel.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.5.220:email];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D5F8457CFB8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Instead of specifying the VBUS supply as powering on the Type-C block in
the PMIC, follow the standard schema and use vbus-supply property of the
usb-c connector itself.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8150b.dtsi                    | 1 -
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts                 | 2 ++
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts                  | 2 ++
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi | 2 ++
 4 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
index 3f7b0b6a1d10..b83be4b6cb1c 100644
--- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
@@ -95,7 +95,6 @@ pm8150b_typec: typec@1500 {
 					  "msg-tx-discarded",
 					  "msg-rx-discarded",
 					  "fr-swap";
-			vdd-vbus-supply = <&pm8150b_vbus>;
 		};
 
 		pm8150b_temp: temp-alarm@2400 {
diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 54da0d759a67..690b484352ed 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1499,6 +1499,8 @@ connector {
 		data-role = "dual";
 		self-powered;
 
+		vbus-supply = <&pm8150b_vbus>;
+
 		source-pdos = <PDO_FIXED(5000, 3000,
 					 PDO_FIXED_DUAL_ROLE |
 					 PDO_FIXED_USB_COMM |
diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index 6ae6e07c37df..8fb04ce72f91 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -572,6 +572,8 @@ connector {
 		data-role = "dual";
 		self-powered;
 
+		vbus-supply = <&pm8150b_vbus>;
+
 		source-pdos = <PDO_FIXED(5000, 3000,
 					 PDO_FIXED_DUAL_ROLE |
 					 PDO_FIXED_USB_COMM |
diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index c017399297b9..51b57c697a75 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -725,6 +725,8 @@ connector {
 		data-role = "dual";
 		self-powered;
 
+		vbus-supply = <&pm8150b_vbus>;
+
 		source-pdos = <PDO_FIXED(5000, 3000,
 					 PDO_FIXED_DUAL_ROLE |
 					 PDO_FIXED_USB_COMM |

-- 
2.47.3


