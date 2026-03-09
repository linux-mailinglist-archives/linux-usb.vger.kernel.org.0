Return-Path: <linux-usb+bounces-34366-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMinNFwvr2lzPQIAu9opvQ
	(envelope-from <linux-usb+bounces-34366-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 21:36:44 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC89240E9E
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 21:36:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A823C303C5B4
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 20:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE81A36BCF5;
	Mon,  9 Mar 2026 20:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NRuhVHHO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eO38a0Mx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2989423A7B
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 20:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773088442; cv=none; b=h9mvP/7rOjd+zRerxDZIZAxY4tB/z4NHUJG7D4QQark9/B7Fwq/SjHIwxZPZIJjiXBmX+WSnQDRU0QIzV0HOu09zdGqiw1745mQEgdBH9+zO5V1ic0nVzGehtQkCu1uoOjjxozty8ZH3aK+yB3nvqgJtlDlg4IF3G7h9b9sivVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773088442; c=relaxed/simple;
	bh=72e0odVrIypjYR4ieuCMj9dOvSQ7+aSIR3Eg3bckx20=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uxDSMWFmIEobhqh4ZRpAabZJRNNVVMLpIaRujgt4bwPDE84pTA0wNbBIxewal7ON8jPu9JBY/6L/9LCehwJBK5x6qIB/tXMu6DLBD1r6wco5bw7ePiTUXBewodIXnLg/j9zBSFFwmdBQPpY/aDKxlCcb6PFAq2RHHNQci1K2UkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NRuhVHHO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eO38a0Mx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBlQ31297342
	for <linux-usb@vger.kernel.org>; Mon, 9 Mar 2026 20:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KQayAJr7e80
	Xbo/ao7ZL1zptdQcZkdn0wbNdIDaamnc=; b=NRuhVHHOTo7H0/6cCUDoii8+gAD
	FYopBP4tY84Xn5h11Zvy6ugSafyhDkolIrOG3FUMdy1EiteAFOppO92xcnBqxuuW
	nFYC0wgQSj+jgWd62t1+1e719Yj6+wvSyT4a5X2yj+FbuJHkgT97BhxBNfb4/fde
	lRCu/OnZnUiI1GpIbBebivFZo8mYZgvnimXsF/FN4apUA+8xakBxaUZf/3aQPZDh
	j7eFEfk1DDA9K6DcVMraGaxNVq4r5u46/C45h2vJOC+YQBI8b+HEan7ETJReIwfS
	PetEGNoI5LyzC7bxTqGJ43M5NE7weSQzDIPkEeLRGRoOracnnnYD0vFxRxA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyv19afw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 20:33:53 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d7521130b6so7050172a34.3
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 13:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773088433; x=1773693233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQayAJr7e80Xbo/ao7ZL1zptdQcZkdn0wbNdIDaamnc=;
        b=eO38a0MxVfQsum+lFRd/T5N4qcmEx6g9TTK82Xn2ZG1PUOVpXgaSvop9mcqr1/E4PC
         lKAXrNdie9Q7xFITDQDZ1FFp8YNZY+8n2wyQdWxVtqr+eBJ6F+sG1DD/3LEp4+VevnhS
         OuGN70yNBhF5XQ3haG/C3BivYIDOB/M3NwYFqyRnZVxhOqr82ALakmF+L0kMXa8mlTHs
         raAIViagX+TUnNQpHb7CW97XyRQYx+iG8pv5grJ1paUcsR0xiZ6HYI5j3v/8WudoWBSD
         v5KC9hK9inmVd3/4zbrTYjm2DThG+2cKt9RUpzcSfNBGnCZ2SXIX4uTKfdsZxqJFFZA3
         y0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773088433; x=1773693233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KQayAJr7e80Xbo/ao7ZL1zptdQcZkdn0wbNdIDaamnc=;
        b=ceRGDPoFgGi4X5l1Z/pQ+5cOXP7NsxeVDJjjNVF4bi9YoAImUQh38/ZdPGa9zYKfH6
         aOpIvTj7qkSqsI47y9bfXXN40rpAH2WdhLdEwSrYQ/XxhB0k6zoGrPpkUTManGCd02nA
         rq2K0mY8LdmZNZU/eYF2jBdOjGBtBNCJuPDxltpcF3iutKw/v0O8hXP0QcvJ8bu53+jx
         vuGKucwBtaSxTzkr4Lz7dziEHBpbQIojWOUCQWdG+ETZ84HCAjXsCVC8ybKN2b3UVn6T
         Db5l2lfQyb23pbTLJauKyTIPvlLU1z1wEerYjyYVazF7T+uEqZY7J3pSFGM7d8tSFOPJ
         HeWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlhnAw/m7x0opxdOONHfrOlZseNBwRvMyeGTJ/23MeZanuwwn+f4/nUIixx6Qbl20j8G+e3fRV0vY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpp2n2xdOApwo8K3IYE96RM6y65PkWUB7xzowbdBT7oxOZRM61
	HsXsZL3WdnO4T6x/PRDMtn9lTLEgXaQaAs+VK7QKefsS8YsugdCqPPFyOtFL6lNoLJ9SkrEoael
	lUy5gRk2PFMnlNMrTFHq5zU/45wvt1Fn81tanKkT5VFRMKxSw+REqXXJy9FcVMzhl225VWJw=
X-Gm-Gg: ATEYQzzP/RhSqQfq5iS83QyxRI6JCgm9odNqJ+tuRP8j1LrDuawVWhjibNtItzRVXbF
	xRk9KbY+lukP5ERfWQG/N2Agp4ZLLiAoFUhDf9OOGQ/QnV8nKnlBu5/1q4cZnwsWNdHoLo0Kvr9
	WBOK0RmDwLjICM0C/ev44vUG14FXgYFIio8yWU2AIZKF513BJtnBPp5pEgLrpkwzRimVIdoWom/
	o2t6ii3d6uSd6HwOS47E8FqscQK44FxFVOo0xaketd845pKB7Y3RE/2kxP3P/AxnOjcgppAEP07
	dzifipGXUkpO/a8Ws8Oo2THRKhdunp0gGVzWUwKE5wZxNEjnH3MHHlxoAcDwPH56HdRQZPiVUL6
	+9Qsv9RwFd4elFnyiIjiHvk2yPJelMMLs4VkutoPGiH9kiEdc286phC3PJnpbsxSJuoyzak3RoV
	Y=
X-Received: by 2002:a05:6830:719c:b0:7d7:496f:c001 with SMTP id 46e09a7af769-7d7496fc174mr4132903a34.29.1773088432552;
        Mon, 09 Mar 2026 13:33:52 -0700 (PDT)
X-Received: by 2002:a05:6830:719c:b0:7d7:496f:c001 with SMTP id 46e09a7af769-7d7496fc174mr4132878a34.29.1773088432112;
        Mon, 09 Mar 2026 13:33:52 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d74885b5a4sm3036494a34.23.2026.03.09.13.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:33:51 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC v3 10/10] arm64: dts: qcom: Map USB connector to EUD for kodiak boards
Date: Mon,  9 Mar 2026 13:33:37 -0700
Message-Id: <20260309203337.803986-11-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309203337.803986-1-elson.serrao@oss.qualcomm.com>
References: <20260309203337.803986-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: mJG870-aDF6K2gXdMAFg0GLBMOFCwZZl
X-Proofpoint-ORIG-GUID: mJG870-aDF6K2gXdMAFg0GLBMOFCwZZl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE4MiBTYWx0ZWRfX7IOd04CL/KJO
 zwRKaugH2KFM4zMaJ6lvW1NNgTXx/R0wtVrIVi4r1KUBFCqwQzx1k0zIQ8VDnhmTToe//1XIzVf
 n2DRaKjpKL8XJaTZCX/OXIGDXOEJHj8Gwb79Id8H2NswYDGi4xk4RZQMdsWPYhUjEm+Q+H98Wu2
 B21i02XCGn01L4cF9CiQgLXTp1aYm366S1yMM48GN1j9XmuSGb2Wdv9eYNJR4l3eCfHC21uTUdB
 spC9cLlXFC//DlcUXOUQsDhYpHw7iY0TIgr3VIZKAZqATs5Obl+kwUkfJH10LwiUUGVern7SVFU
 r5RhrtIFSA4rNd6eKKYzOYSaNF/ZN7Q8HXt3o0Z5eEKCTjiYsqlPlOdC3AhXi6+NAly53igm+wS
 t/IGf0ULQzoWc7tTCm3dh2FwbMALqnU2y9X2ApRv2yGVsmWQgsQVvnnDFpNaZvd7HiTMiGVQZdv
 lTJXMcir85Q0UnNw6dw==
X-Authority-Analysis: v=2.4 cv=Cuays34D c=1 sm=1 tr=0 ts=69af2eb1 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=a8XcMGiI3xzrQgkoEZ4A:9 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090182
X-Rspamd-Queue-Id: 4EC89240E9E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34366-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Map the USB connector HS endpoint to EUD for debug functionality on all
boards using kodiak.dtsi. Since the controller is no longer a direct
neighbor of the connector, add usb-role-switch phandle to map the USB
role switch provider for this connector.

Depends-on: 20260223191042.825136-2-elson.serrao@oss.qualcomm.com
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts    | 11 ++++++-----
 arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts | 11 ++++++-----
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts      | 11 ++++++-----
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts          | 11 ++++++-----
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts    | 11 ++++++-----
 arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts  | 11 ++++++-----
 6 files changed, 36 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 455e5c9bb072..dbd968967dd5 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -88,6 +88,7 @@ connector@0 {
 			reg = <0>;
 			power-role = "dual";
 			data-role = "dual";
+			usb-role-switch = <&usb_1>;
 
 			ports {
 				#address-cells = <1>;
@@ -97,7 +98,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1433,10 +1434,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c>;
 	vdda18-supply = <&vreg_l1c>;
@@ -1476,3 +1473,7 @@ &wifi {
 	qcom,calibration-variant = "Fairphone_5";
 	status = "okay";
 };
+
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
index bf18c4852081..ca9c1a09ca73 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
@@ -65,6 +65,7 @@ connector@0 {
 			reg = <0>;
 			power-role = "dual";
 			data-role = "dual";
+			usb-role-switch = <&usb_1>;
 
 			ports {
 				#address-cells = <1>;
@@ -74,7 +75,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -826,10 +827,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c_0p88>;
 	vdda33-supply = <&vreg_l2b_3p072>;
@@ -862,3 +859,7 @@ &usb_2_hsphy {
 &usb_dp_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in>;
 };
+
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index 797f37596bf1..eb7e228787c2 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -75,6 +75,7 @@ connector@0 {
 			reg = <0>;
 			power-role = "dual";
 			data-role = "dual";
+			usb-role-switch = <&usb_1>;
 
 			ports {
 				#address-cells = <1>;
@@ -84,7 +85,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -952,10 +953,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c>;
 	vdda18-supply = <&vreg_l1c>;
@@ -986,6 +983,10 @@ &usb_dp_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in>;
 };
 
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
 &venus {
 	firmware-name = "qcom/qcm6490/SHIFT/otter/venus.mbn";
 
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index e3d2f01881ae..3cb7494b16f7 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -185,6 +185,7 @@ connector@0 {
 			reg = <0>;
 			power-role = "dual";
 			data-role = "dual";
+			usb-role-switch = <&usb_1>;
 
 			ports {
 				#address-cells = <1>;
@@ -194,7 +195,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1303,14 +1304,14 @@ &usb_1 {
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
index 0b64a0b91202..a75b8e118deb 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -84,6 +84,7 @@ connector@0 {
 			reg = <0>;
 			power-role = "dual";
 			data-role = "dual";
+			usb-role-switch = <&usb_1>;
 
 			ports {
 				#address-cells = <1>;
@@ -93,7 +94,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1090,10 +1091,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c_0p88>;
 	vdda33-supply = <&vreg_l2b_3p072>;
@@ -1127,6 +1124,10 @@ &usb_dp_qmpphy_out {
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
index cb59c122f6f6..f99a47334452 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
@@ -90,6 +90,7 @@ connector@0 {
 			reg = <0>;
 			power-role = "dual";
 			data-role = "dual";
+			usb-role-switch = <&usb_1>;
 
 			ports {
 				#address-cells = <1>;
@@ -99,7 +100,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1440,10 +1441,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vdd_a_usbhs_core>;
 	vdda18-supply = <&vdd_a_usbhs_1p8>;
@@ -1459,3 +1456,7 @@ &venus {
 &wifi {
 	status = "okay";
 };
+
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
-- 
2.34.1


