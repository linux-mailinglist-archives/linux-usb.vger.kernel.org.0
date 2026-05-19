Return-Path: <linux-usb+bounces-37689-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PN5LflBDGq4bwUAu9opvQ
	(envelope-from <linux-usb+bounces-37689-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 12:56:57 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9625E57CFD7
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 12:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4135F3110D56
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 10:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B5B3F4DC2;
	Tue, 19 May 2026 10:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eV+rQgC0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ecqGFn+X"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3443A3A382A
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 10:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187702; cv=none; b=JqdFKKh4lyf/YLTJ1Ia3j1YqY4z9ZrLjWbq+xumyqC7ZhfPDg0c9/SIe0JLnHurpoxxPbEtGDGhDNVLlBeFjtGGgndM5Ad0j/P5RkPGCdrRT8mWYWSI3v2AesE905IIRnQRFj+kDIbdWh4FFnh5DrPltyKwTfXL3h6j+NBdlews=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187702; c=relaxed/simple;
	bh=woBdEwaHX80T54ZP+4+AwPFb6N5jfH30MDJZOeEVaJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GvGRALtbvVklsPJ++Mcseo75lEPH/isrxDTmbbUwXgx1Su+dapZiCRagI9SKElX9BEAYxpPsEVNFC5ADbzJ7PxYe1TG7GWr+PBdhJLvM7dHgCktAawCXPOFi14OT/09dnOQNtRm510JtlmgA+6AQDi4KaS6VGo8muHI8DLep73g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eV+rQgC0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ecqGFn+X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5cHLS2437998
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 10:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zJYjcv22h+Q/YGAvKfWRg3NhA6BXwprz8gvA9wNRuSw=; b=eV+rQgC0DLvW0Jh3
	KEPnfpgkwkktKAseIl/Gc8muIg4sSAjzXGQ1jtc8aRl8dmLz6WhYuNj3t2ARZXXP
	7s7nuVYpimJiynH7IwsYJJoL/o7HRT0BwzMv1p7F8nv0qcq2NJMohWtpdsGrWISZ
	TjmaU/zXTihoODsdir1cgUG+hKp4vLHZNFNkqj3ftf6j8WE2BbfQgrRf6sRG7Koa
	mpgoef0UV6NQZKAHn+szmFmZJvWwnK1TiNJ81+AVfDyEWUjMKHkM+t8XJq3op2lH
	RPM7gq0ASI6S6k16GrsNdySVyh9o+RDdeYLUojttoYsxfm1D4UFpjqyf0/aUldcl
	5jTt+Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e834v4m2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 10:48:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51009190feeso109056621cf.2
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 03:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779187698; x=1779792498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJYjcv22h+Q/YGAvKfWRg3NhA6BXwprz8gvA9wNRuSw=;
        b=ecqGFn+Xk+WThuQYzzhYLIUqjNWcL9UZtn3mqDkkb1MzK+Hvy85Bw/VVikqdJMRm+P
         f6DQG6cgLd+EtoBRgTlRL9kSqhTY/SS9R5iS0i4uBUZhyWivtO6s6x+N9IzYG0iVqWgl
         xcXRFtavKvSDk9mwFihYrGHNMga/uHH5GLSnKX76G0TMM5mb53nRK+EeCy8TbEWK1Cnq
         7Jp3xXYEyKxQBFHCL8Wzu0c3wHEU+vAZVJ8ENZAQIpzHXIJb66YjO7E5SayrAMnWNMaT
         8OCVB2JaghjEXv0G3rIonbyOhKQ3I29nEkO6ggOySvRJHQwNWt/2DJQjV1q1QY4aO1C0
         OD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779187698; x=1779792498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zJYjcv22h+Q/YGAvKfWRg3NhA6BXwprz8gvA9wNRuSw=;
        b=bnHjhOU9F+VwNSv+G+DJclcoK8LZhByREiVZ8Ii69JJAdLHDqTAqQH9lqLtyQrmeWv
         ea4Y3HKrIQmzYXSt+qVLS1E9M8nG475FHhijhtOcbXO8nAVk9Od+DaR2YXIs1CUzmoRT
         pm3sXYyC3NCY9DMV8X4EfWKexrDmS8lgy0A0DR+ywjuvEZ19Qrzk9+YCp7NSvXKb8tgD
         37VDmCpRi5F5SR3OYHaBdU3nBnBlTAdUqQ3batmEYBiIGRWpFkZAfvrKLe4bs26ikyKO
         tDza0OfAzPClPPGoc/g2KctFLIGGfANEVQ+AYSj9G2YMmVX1s2TI1Ax9u6LA3WYS2GIi
         HihA==
X-Forwarded-Encrypted: i=1; AFNElJ9Zi35zq0Q7phwnyym/ATRIGL3Kcfp/MTVXmkM9ekoPeTmWm0jqv/zg39MSN+gFQMrx+B+NXCHPoT4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjeur6CiRMWREKfx4p7XU7d9++1UkmMi8hth+H45sEChzvanZ+
	lGsyePzSf2HtL/MIkBWGHaRCWJ4Trl/Em6cxQKLTPjlT+Ojm3deJIsIQV4IYCMNRRTHlcUZkRFo
	Ix0fZJ6Is87yDsLx0H/+OnpgH8sOcXTf4bl7/UxaysbMQWds3BVWK2npvargTUIE=
X-Gm-Gg: Acq92OERZhVHNGkq850bb0G1byqfvSDUnEePSsm3+KT78ykviS4tcU2XISv/jKVfVdK
	5ZN2uhoQqiyFyypD20BF+JVfTMJGpksQcQctYgQkk7TSjuyRzrwgmk9CEDoT3tM/nJ+/BRnNkDJ
	7xhtFAhsCWjXJdcVfPPVgkhysVFyD7ZGPAEQkSs1p1GRRvKhy9UDhh9xIul6Vjc3DEni/ikOUTm
	2wKO570MAUZmyPZmJ5kUHDNRayYxFPWcR0DiN96BEPafFZW5jpI53yFjHCUer+XsKSur3WuVryu
	72Wnt2ABTNOwvXr+nJl076VIojm5/ux1UBR0ut7ssIas5Knafu95n8WNS+T6njiPHHlxIESKaHt
	rSrWIw3+OY4OSmsrVJKnwsU14Fv47QFMI42UPRyCAOjtiNAvZRu4IIpBzLdHjSo+oc4Hj0VRcaN
	UQ1+GpBkpMPdGWZNZZ14HUUzXI4rjs5UZhHZ4=
X-Received: by 2002:ac8:5d89:0:b0:50d:7aa1:f405 with SMTP id d75a77b69052e-5165a01227cmr255474071cf.9.1779187698401;
        Tue, 19 May 2026 03:48:18 -0700 (PDT)
X-Received: by 2002:ac8:5d89:0:b0:50d:7aa1:f405 with SMTP id d75a77b69052e-5165a01227cmr255473721cf.9.1779187697922;
        Tue, 19 May 2026 03:48:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a59dsm4031413e87.25.2026.05.19.03.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:48:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 May 2026 13:48:08 +0300
Subject: [PATCH 6/6] arm64: dts: qcom: pmi632: move vdd-vbus-supply to
 connector nodes
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-fix-tcpm-vbus-v1-6-14754695282d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2331;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=woBdEwaHX80T54ZP+4+AwPFb6N5jfH30MDJZOeEVaJA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqDD/mX5EmXCmzYenUlqenAJkkCNjuWXKTS7fGk
 KZ4tA4YyyWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagw/5gAKCRCLPIo+Aiko
 1X3ECACkeXKR3bKG4xY4b9e76o+zsGsxj8BCc8Mpl4CSpOHf1WaPA/GKwVTgjds6Y/+tIMfUUMN
 dnchufZ/JTNKyWTX/XW3pohL3KnSoZgJIS1wE3sfqJQVKbvTxhxGA03BEora522pFIupaYlzc+3
 NC2gXGt1W1AdL4+fYnl6XxkVb7j+UYnpNZXeLtTY+fzg497DXfmTQWPXOFSK1siNDIcCaSG/R1a
 iajQLU9k1i9tDyyqfIwwzEUxBaVSfV+WBA7070sDMnutGucU/nPn1ymqPAvtTwim6wIPqf5k74B
 IJzYbtjALC/jFHgWxZaVp+YdG47OD93ZsbI5hTGh8LgKLzT7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=F9ZnsKhN c=1 sm=1 tr=0 ts=6a0c3ff4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=izqt9FH4em4ppUy_EgwA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: hF0qEpKB_EzID-P1ajzGANpZX8Vey1ua
X-Proofpoint-GUID: hF0qEpKB_EzID-P1ajzGANpZX8Vey1ua
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEwNiBTYWx0ZWRfXyHtSJEuX+fUF
 sU64fu8PbAXT909AmKZ3/GknCc6qjDfAK4CwcYuv9iBBqV8++DCT567X0+YTQ0hKVjjhn+gpH/E
 JuwLHZUKxStGPscUAaoWYzQG/wpCkgw+sLIjRjUuMjLpI9apt1/Cyjfxn8nK7e3EyL0i9c3CO3W
 W+mjpZkFSMJ3tvDIhumnRczENzk2pK2g16kkezekuqzkrr8Xav1Zv6ypV+wAK1/88pVu1KvTVUT
 qIGTgb1xxuJeQrkoorfVjnj/Jj6YBPG0to11DNbimiH8WD0WL8NnpK9952K1+5HslvEKw8TnvCu
 8fRk8xMMCMv59P/U+6bwgfuQHtxjRN4/ssN3E90zwzQQ6QuF9efHwYeiLqQxrBgaGior2d7vYOy
 a1b1q92zOp8ap+6b/OCQCFBUkLdN5bSkzhvawaJG6/wrNnG81EoWBHnvoydr+sRy5PW/DvcW5PF
 HFm8HomIba1x7Gua6pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190106
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37689-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 9625E57CFD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Instead of specifying the VBUS supply as powering on the Type-C block in
the PMIC, follow the standard schema and use vbus-supply property of the
usb-c connector itself.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmi632.dtsi              | 1 -
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts          | 2 ++
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 2 ++
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts   | 2 ++
 4 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pmi632.dtsi b/arch/arm64/boot/dts/qcom/pmi632.dtsi
index 8c899d148e46..b0ed35094a98 100644
--- a/arch/arm64/boot/dts/qcom/pmi632.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi632.dtsi
@@ -69,7 +69,6 @@ pmi632_typec: typec@1500 {
 					  "attach-detach",
 					  "legacy-cable-detect",
 					  "try-snk-src-detect";
-			vdd-vbus-supply = <&pmi632_vbus>;
 
 			status = "disabled";
 		};
diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 1203172729fa..22baee407fbe 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -323,6 +323,8 @@ connector {
 		typec-power-opmode = "default";
 		pd-disable;
 
+		vbus-supply = <&pmi632_vbus>;
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
index 0edb2992b902..3223884f9cd6 100644
--- a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
+++ b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
@@ -252,6 +252,8 @@ connector {
 		typec-power-opmode = "default";
 		pd-disable;
 
+		vbus-supply = <&pmi632_vbus>;
+
 		port {
 			pmi632_hs_in: endpoint {
 				remote-endpoint = <&usb_dwc3_hs>;
diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
index 466ad409e924..0f23eaef01f2 100644
--- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
@@ -251,6 +251,8 @@ connector {
 		typec-power-opmode = "default";
 		pd-disable;
 
+		vbus-supply = <&pmi632_vbus>;
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;

-- 
2.47.3


