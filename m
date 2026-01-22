Return-Path: <linux-usb+bounces-32618-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLEEECLwcWlKZwAAu9opvQ
	(envelope-from <linux-usb+bounces-32618-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 10:38:42 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B9E64A62
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 10:38:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 26761620D6B
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 09:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A1A285060;
	Thu, 22 Jan 2026 09:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RiRAELHm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KxvT/DHp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D91A3C1971
	for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 09:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769074169; cv=none; b=pCprLVOxDdVYDDazuv2VZzD6W4wKahvfwylCHm5ZL6dh1xg9OVPzhAV3q3u0dTlOFBWlTXi5y9wLgzqPL11TTGwxBGIuO/SfiFT2SJkHR/YV8m/93meI9s9fHd4iTSOZ1N/UHepxtme6gKt05TTIG/a3Pv76v/dotrwd79ZD4II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769074169; c=relaxed/simple;
	bh=Xkww8B1bvxwpIcKpy1JewYNymNIwaL0b3k48QMs66Fw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O1oz5m3bfgi/FN9lRvfRzQZkF4TInatj4g7r75QB2urpnAWqi7+BDJhyzOytj8c63RwTfLrN30qusHmDPu1wCBGf9LjibQPWT4RIbGIcsFhzmPJ68uGnGHNcaT+uHED1vREU7MxPNDC1Te6bZKRqsT+AqVZpKJ1idAyXWxG15/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RiRAELHm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KxvT/DHp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M88uZP646072
	for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 09:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zbZ9dEOX181
	iqiCrxrmv1ex1DUncYQRrvsx5WfV8NQM=; b=RiRAELHm9mwB+lX1GXgED9U2XCN
	cfagUNfDgo/jHyc1UWTh5hWBwhcpTKbJiOwLVk3HxRDrj64tJvWLOOWcUqmuGn0Q
	UbuvIF2+tCcLYPxTd90uBAF7huE4e6fuRgQDUlWc/Ir3j8Og5AlMNHbwa+/bYR1S
	0dj3QczutvN/UJtiIhPgbHQs0/e7zcI7025ZJx+vGjlSznRDoW+ie1opPWUTm6vk
	TdUxX+wgATYhK9x06UQdNFE/1QKcqyGKbMbCCsaqKe7Lx5NYspD6FuXt3xv8AhkJ
	SxG6VMclHaD6EXEuKRJxEdIZi4h5fyRph9a9N2NqCXa76YwnyS+YfrcPUGQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu8j9sj51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 09:29:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a7701b6328so15607415ad.2
        for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 01:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769074165; x=1769678965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbZ9dEOX181iqiCrxrmv1ex1DUncYQRrvsx5WfV8NQM=;
        b=KxvT/DHpaI35CHwE3qsq2WRHvE+33JmLl6LFORq5sk+iK61r89ity1slwDoc4FbJ3t
         2cAd+ge6gZ7g8XaXbKht/AjitbHXsrsxR9okAizeHSLWWoA8IFWJA/qhzZGar7DY06aX
         1ymvz6VKq4sTfD3G4uv7hjeSHq8MaHoZ0+xDnbJ3Db6zjodIgli+hvLTlRwT6cEOE+HF
         umsNcsMsV54Wq7zSwu50B3u2dHTa7C0tEVFQsO96uW05xcimaPOtx7saoRFSykBji+ap
         IT5XF5708Dsk0cvAxdRDcGp2XEC2/4OLLVUAfitst0YTnmBltYKyuPws9HMgkYi1XUOJ
         iJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769074165; x=1769678965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zbZ9dEOX181iqiCrxrmv1ex1DUncYQRrvsx5WfV8NQM=;
        b=DO1LJtUgFAIm4VJ0hIlQ2DQiNfVC8rKkPCrUmSIUJzX5mCaV+xbD96jaIe4llH2iXK
         rkIoZ0k5gjxcRzj0RzLrm22K6tASB/Y5XGTOA/L0tavRBU5NdUV3Ej9A1LYwg8dMZpFp
         qp8PPfxI3nV+4lCbK03lbmrivUZwKYQPl/nJg1tHCyoC/WMyv8WJFs0eOUPuRopB4zIV
         FsE6vzaCpnkmHpM2R7q0L/ZRxYyDjrgHZjsfvjv01uMywbmQMRhcvrBsewRnJIorbeCi
         y54dhFfvx9eT47ILGkOMy4iUIWPTkhmcLM6bIJHK1s6MH4qB5NsvBrVtjuNPrbsD9hZH
         IRWA==
X-Gm-Message-State: AOJu0YxHjHyVn3uygDvQPoi/IobhROo4Ah/RnQHwqcHBCdNHkf3j3emD
	bOoKmGWdPJcOen1qQHuYFUuhVWBaie2tzC99zXgBVnV9+5AJEoCV3REk185VLAXxtDMEjJqCLNv
	EqWxryVNOkuLIriEOxZIBX/euIvyOL2TsRbU+iutbzOrLUSyVaiEO6jhq58tM4mU=
X-Gm-Gg: AZuq6aK/MNvx0UWT9ZnyyUicvG/cJZ6UuNG67Hcu03PLgB4LKs6G4eedAEyRjEpmZHU
	GvNzk78tYHfkTBsoMOFm7ZR9CQN8HmYvsdheitgaBpFWNGwiGqANQV6Ij/xVOWqRjfs7zT/v/Ri
	6b+Qk3b3XgH5G9fZxqtGHTWGilhI06bobrBEzAQIxrMSCGw/SNnFY5T7afbcQZ7Y/ytqquy4U9C
	pHmbWny+vDJTD3QwPLakwYTUcDf07Ucn4ngeBBdxahRMNLCmS6d+mCF+ciHSV/NB5HEfd+tc6BL
	rLk8Og4EY6boKr8qSVfuNGi8CeSi2vYC2pdDpt4ivH0/aDF2qbche+Fh0dvtJMXLRjpA8bn4XLt
	C7LIVPLFasf3tBLtrkg2/AIFh8iePAlVRGBwcuO90vaU=
X-Received: by 2002:a05:6a21:e8f:b0:34f:1623:2354 with SMTP id adf61e73a8af0-38e45e414c7mr7626134637.42.1769074165098;
        Thu, 22 Jan 2026 01:29:25 -0800 (PST)
X-Received: by 2002:a05:6a21:e8f:b0:34f:1623:2354 with SMTP id adf61e73a8af0-38e45e414c7mr7626113637.42.1769074164621;
        Thu, 22 Jan 2026 01:29:24 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf355ca7sm17395247a12.27.2026.01.22.01.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 01:29:24 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Pin-yen Lin <treapking@chromium.org>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v5 3/4] arm64: dts: qcom: lemans-evk: Rename hd3ss3220_ instance for primary port controller
Date: Thu, 22 Jan 2026 14:58:51 +0530
Message-Id: <20260122092852.887624-4-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260122092852.887624-1-swati.agarwal@oss.qualcomm.com>
References: <20260122092852.887624-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uL_HVerL3lOxzRmfF-A5lLCg8vkw648H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA2NCBTYWx0ZWRfXz0tlcdmD2hvY
 WAKfsRMmN3wAMmcDAU6qDOvPtT0MHz0WfjPRsCsqjt0Jvg1Yujdgcm/zqq14KyjDbCkvios5/3+
 e1kEuKIcr0Tub6Ds1/vkoqlS/GQKJRkfnxW7BB33TJBgsvl8h/TsY1Fg/SDYNaUi1TRyrz69i9K
 rlmipx2Lg+4bU80YdrsA65H2QO1iydut9WSAIBnFRCB6QceC0OxPB0N8CH33iB1fLbU2+UGw9Az
 tfutEMtV+XiRaNuqO0xWWdAHc7CqQuZJVhCwMI6+eQy0Gvsd3Iuzhatw3KsOZm6IiThg6Srabbg
 xlHEoaQZx4o+KfYIvnlektvNWKyj2b1doxtxzHCfXjqW3p6J4x4ykgOnopo1M4DJye4ZtH7WYiI
 PM0SR2tKJAil9QQmxVnSn6V5DMi3kQvIysVzRBjunWKEGVRIvDFzjr4rUfqutQ0ejDCgkpe58ge
 6mcPSlY/RGJePmj6zhg==
X-Authority-Analysis: v=2.4 cv=U4CfzOru c=1 sm=1 tr=0 ts=6971edf5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=917_i3xC6rPZgS4eXuUA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: uL_HVerL3lOxzRmfF-A5lLCg8vkw648H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-32618-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,0.0.0.0:email,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 22B9E64A62
X-Rspamd-Action: no action

Rename the hd3ss3220_ instance to improve clarity and simplify usage when
adding a secondary port controller.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 90fce947ca7e..074a1edd0334 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -62,7 +62,7 @@ port@1 {
 				reg = <1>;
 
 				usb0_con_ss_ep: endpoint {
-					remote-endpoint = <&hd3ss3220_in_ep>;
+					remote-endpoint = <&hd3ss3220_0_in_ep>;
 				};
 			};
 		};
@@ -522,7 +522,7 @@ ports {
 			port@0 {
 				reg = <0>;
 
-				hd3ss3220_in_ep: endpoint {
+				hd3ss3220_0_in_ep: endpoint {
 					remote-endpoint = <&usb0_con_ss_ep>;
 				};
 			};
@@ -530,7 +530,7 @@ hd3ss3220_in_ep: endpoint {
 			port@1 {
 				reg = <1>;
 
-				hd3ss3220_out_ep: endpoint {
+				hd3ss3220_0_out_ep: endpoint {
 					remote-endpoint = <&usb_0_dwc3_ss>;
 				};
 			};
@@ -904,7 +904,7 @@ &usb_0_dwc3_hs {
 };
 
 &usb_0_dwc3_ss {
-	remote-endpoint = <&hd3ss3220_out_ep>;
+	remote-endpoint = <&hd3ss3220_0_out_ep>;
 };
 
 &usb_0_hsphy {
-- 
2.34.1


