Return-Path: <linux-usb+bounces-32442-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E324D389E0
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jan 2026 00:25:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44957314D11C
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jan 2026 23:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F2873491DB;
	Fri, 16 Jan 2026 23:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gVsbH5jZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JfdTpncJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4AD320A34
	for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 23:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768605682; cv=none; b=KPlgIDlC5Kk+rCyqRZyWDwkd91yKJz+eL4ATClClFx6VPeyk4zTBBeyIa6RZ5TOjHc89Fg4Q533pWkaRLzB0IgEMZzcV8S1dcBWhHFSp+YUZgx6zQUXa0IVijmpRbtUkAikt09ehlcAhj6Rza9tvxUhmzNcIWohQThUQ6kI5LA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768605682; c=relaxed/simple;
	bh=oJZEE75ljDhbxjPAjmqXX/qekCyAnUUIY+vndlyCRTs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BnR74o5IcwFGzAxoGARWyLnGr1m12KCGVa8bSIWVa/URrJBIQzikM9YPgoP7ZBS8ZNxn8C094baNK94ZyybQMj2F33pLK4nlAyLj6ZA+dHFKczLlBCjVbxTBJa9Hmal/eEwir41dmLy8GTGpmKIZaz9qEEfrWAU2ef7QB3x3+Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gVsbH5jZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JfdTpncJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GNDU5W2190833
	for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 23:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YodHWG0Qjmm
	xJvKMASHwO0ieWVY/Zym4kEuPLt9q2go=; b=gVsbH5jZTWKKD3qlhepO7EBZXDW
	qz7MdvwC6PVR8TU0rWp9UXaTIQIYUURXbZQ9/KP/jYSTx21KL04EzIPRwx9m1hUq
	PjFE/6YF+XklsQJ1+b7DjcKSNXBpUHhyzBvQSxsYOz6CjJG4TQyHIjGwMaTKMYsn
	tAiaqzzgQL5ZMYXXAaa3cb8cbT0uCKzPbPqtctpBbRXzpKb/opflF4M68UqOWOP1
	PQYLKYLqrHcaLjp+6bM4SQns0HNWpetAhzgru0QjhtmsjK+AokW+i1ab40kf8J0z
	GrFZua5Tw/HyaKGIS1r/fhD+Ktu+aLmBqfVI1tGAMSDnATjeNYUFFKPHH2w==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqvga0b31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 23:21:16 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-122008d48e5so4736729c88.1
        for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 15:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768605675; x=1769210475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YodHWG0QjmmxJvKMASHwO0ieWVY/Zym4kEuPLt9q2go=;
        b=JfdTpncJ/UDALHZLWF/JGuLIQy9rNR2d0Hy230JSAARNiUqkRFZBgjSy7q5PJ+3t8I
         /CIwdj3u7vbls0dMuLuRtWuIpKmNlr7MpRREfjmcR6OU5FUaLy28aEAiKiYFEStmMrnC
         tODceKXYCUfh2vKoPpNDt8giHkpIUM0gkvzJPwdYRZvQ07jHkpTYpRCI+YcS1NQiCr8U
         gwWTivVUOre8Muq3nvqSmqacHhGSt7IdLuHxxbZc5EcFmVY/6k5M8+8DmzirGM+DA6gP
         i/ZSJFOf26RB/fkrJMd/+pARXb2Y0EsUvJQJrxQmhifp8WCbF3Ojs6p/sh2b+/c0fSh3
         OY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768605675; x=1769210475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YodHWG0QjmmxJvKMASHwO0ieWVY/Zym4kEuPLt9q2go=;
        b=WylEUrduVZBdt7b+wkz7mIUtU07W3gtxZB+vSbZk203tyuWqllbYISYkZOeayEhBCO
         CuGddbo7Ow+sGtqHt/RWFNdyxkotT1B1xp5QcnIOS7DTuVaASwBTWPYOsyHtqkwj0tnx
         fwaHikiGtBTztszV01m2JRG7GYkjOKbxgb9KIO+LG/JUXzZx4vXRUOT6KqQON6gGBqKk
         2semaio0O0YZrqOr/ps88jN4mgcc5Bhslbz2OYRTDjz60kCDFcus4O1SCqaqb6lj2YOW
         NKr3X/HafOogNKmtVotNOJtN5zCuGK2vtbgBVS37cE3m6kk+3ulLL/LO8F+JsoNO5+zM
         GRTA==
X-Forwarded-Encrypted: i=1; AJvYcCVRFBz4wl1Zu02rswN0yu+krJPVLRXEr9OAQz6W0JJgxQnrFSF6tfzt8DHl0skoBQygoDBI7X+RfNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxL8U28jlT8s8O69IszSuyTITB7n4X3EMKP4BJz8WS+RVnqZ7tp
	FkjaEaeCa2JylLTcKR8+OJNjRGfompW0/B8jZddjolbo6WkATDUgUEaYUBxqsHwF6srENVhJQKk
	AwK3c2w7LAHW+cWUcUEgrrKkHjPTl/Ism9bd/qMXdDaE499lbIYpLkIXhdTqRIqI=
X-Gm-Gg: AY/fxX6xbU+QP17+Xgw+M6fea//5AqSf6JII/8pLuCrUi5w2HZ3hU5aeyOaTotoarJr
	hk2XlNNVlrkl/bQbQaYF08oAIkP+lzW9/vRSfVsJ6JjIRl26MJDRHUnUwmtYgQkHnjHcYKupxqP
	FibfZ1nZX/M5c2kS0TIVOEjoV0drfX5CcuqdUxS9dz84pEa7QpMuNvCMmfcaEhOF58Or6obnv8C
	7MAXfHxqq3r5F2QPd+RGqo9E9fMnqKo6NTvDLIQalDIhfEmoiImlVcG50S04ubavQmUVGRwZHSu
	kobIapThkwREL7zqvjYB0mrzQq7vvRGJoLZiFzxLmsyErq+s5LtC2GSTymhrubj5hQukacx1Ou6
	DylEWyQ1A3T2ksLZknB05k3rblT3G0IexpLbWapydTdr5TNRo9ERyipUPUYEQ0ec=
X-Received: by 2002:a05:7022:128e:b0:11b:9e5e:1a40 with SMTP id a92af1059eb24-1244a72e9fcmr3479672c88.15.1768605675170;
        Fri, 16 Jan 2026 15:21:15 -0800 (PST)
X-Received: by 2002:a05:7022:128e:b0:11b:9e5e:1a40 with SMTP id a92af1059eb24-1244a72e9fcmr3479651c88.15.1768605674645;
        Fri, 16 Jan 2026 15:21:14 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10e21sm4611267c88.16.2026.01.16.15.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 15:21:14 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] arm64: dts: qcom: qcs6490-rb3gen2: Enable EUD debug functionality
Date: Fri, 16 Jan 2026 15:21:06 -0800
Message-Id: <20260116232106.2234978-10-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
References: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE3NSBTYWx0ZWRfXy+Jd1AKhnkPp
 0ZEocJbzN88W4/LGCabacmLJcNjxMukBdIdRapR/p8kTEl7dRwImW7vMV7wkpsgGYhmvs+xUkAb
 F/wks73wmg6DKSpTN44n6Hbj99AEMcF77l/zC1+n3Mj2YO/Pw9GiiU/hxqyNLRXTj0gEHbAKkqn
 FNvSg/cqtIICtR8qFX2pkVuc1r2fyfKBB8AAQwMdr2uMJv8c2Q0Te9ijPypCCFoydEc6E10jMYz
 vWnLjEU/S5pXtGCmRR31UTSIR/krZKVtpOGkWOwxgzTYL+OPtCBodRbzY9TsvZjj6dFL0AXq9rv
 WwRCyIr763hX07cNA1TYa9C66hQK+sJdACfDETxEomFPcjNxKPO5RviUOFCzgrfd4SeqAcDmBbO
 IDeqZqV5l3OH68HfSwjVWY9YRw3ERi4GPpSE7UjkF1lid/1qIYy1cVtRdRX7bkJW7JK+ASmfids
 OXvmQmU72BthUGr0fbw==
X-Proofpoint-GUID: 4zJfg5Pz4bo3NoYCyh9bwQqFV4hHw0XA
X-Authority-Analysis: v=2.4 cv=Kf3fcAYD c=1 sm=1 tr=0 ts=696ac7ec cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=bAolQom50hykzV7YMrMA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: 4zJfg5Pz4bo3NoYCyh9bwQqFV4hHw0XA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601160175

On this board, EUD resides on the primary High-Speed USB data path between
the connector and the DWC3 controller. Update the device tree connections
to correctly map the connector and controller endpoints, and describe
role-switch capability on the EUD primary path.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index f29a352b0288..2fc2d0aed8dd 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -194,7 +194,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con0>;
 					};
 				};
 
@@ -1176,13 +1176,29 @@ &usb_1 {
 };
 
 &usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
+	remote-endpoint = <&eud_usb0>;
 };
 
 &usb_1_dwc3_ss {
 	remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
 };
 
+&eud_con0 {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&eud_usb0 {
+	remote-endpoint = <&usb_1_dwc3_hs>;
+};
+
+&eud {
+	status = "okay";
+};
+
+&eud0 {
+	usb-role-switch;
+};
+
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c_0p88>;
 	vdda33-supply = <&vreg_l2b_3p072>;
-- 
2.34.1


