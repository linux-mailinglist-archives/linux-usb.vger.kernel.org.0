Return-Path: <linux-usb+bounces-34365-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gErZGvcur2lzPQIAu9opvQ
	(envelope-from <linux-usb+bounces-34365-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 21:35:03 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A4776240E19
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 21:35:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3A9C030095D9
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 20:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00DB641C2EF;
	Mon,  9 Mar 2026 20:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YbsU/+qv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hRvxRUr7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8E1421EE7
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 20:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773088436; cv=none; b=Q7CsZCNria58wjBymm+eAIPpfN1L9k5n+cRMMaEXgwvPnnDK9ZUNXizdvgdyrgAKUv0JOYiwjVtQ2TiH6ELBEK/1v0zdM1E5KhrkHGPNpn/vUs3MPAyMgkHXBxlLbGOQm0YRlRJZJZUOK7U5I5N6Asr48ONOSwvL2Wczts1CtzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773088436; c=relaxed/simple;
	bh=0VJZGhuJkCUeAQcIHJgXxy7OZKjeOwICNMRpVoee1d0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dPeCRVlit7J120v7LxtxJCR1mFh5j6D5n0V+vwcB36+ePn7SKtQ78ZtntE3BVmg3Gp4KAGC+NUeVCcC8BHtOHHGl1ytThRa4fpHNOyEzmq85AmoOmowS9crjFXZ94ElkaRuTqX4l9AHwc5nMMd7zUoJkTr6gme6gWfqGak+VSFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YbsU/+qv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hRvxRUr7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HC0ge744365
	for <linux-usb@vger.kernel.org>; Mon, 9 Mar 2026 20:33:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kDE0gB5xYQL
	YngO7rvczlFLJwy5YaiWj5eLZwnq0DQk=; b=YbsU/+qvILRwve8u8+iW0soNsTR
	Egm1dx1k5gCuLiNfIu8N8Qgow+EZIkLhf4icvrtjGPAmDQHG1IEbg4QqYbBREO3s
	mqKz6iyUFr1P78sKLbYgKimQMGD9a7OBd7+8WxbGAyOHRZmqe8ouOGA810JsFetm
	QT/TE6Q1udq4TLUP3YPMZl3xKcKHQvTq7IQlehwQklb//vutVoNs0NT3KCg9WCVe
	dKph9LzP0AGECqxh3ieNBHL+UMoVGp7ngu7HBZ9k9FpmQF55XmIt9sUdojucPpaF
	80kpy5AN9tzGfOex9qAQO6ncIkzltI1Nji8Tdw/hGnm6Vbwnz7Z00RHzGmg==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsaad4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 20:33:51 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d74211ff80so7074422a34.3
        for <linux-usb@vger.kernel.org>; Mon, 09 Mar 2026 13:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773088431; x=1773693231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDE0gB5xYQLYngO7rvczlFLJwy5YaiWj5eLZwnq0DQk=;
        b=hRvxRUr7NQdTYX6f/xSAzQcfMCqGxnHVXCacFYUF8nAohINORgp0Yiy+1EP8rcjkXv
         287ijsT5dHuCnEheP8omNqkCZsyJUItN0M0U06vkXoioozZE/DYjZd3kRaSvP8HWJHGS
         eKZQXjFWp7oGGDPCYwOKeivH/yJiz6K+DZTqTyFNGrwoVUtqFi8+E+RoxZoigkAb4w4a
         AoczxnxciTnSIeLYZ+W4mmgAB9D9Q/CXIZ4IvjXsRZjJMsfhZ7qTKXs4Z97KqzgE/3f+
         Lw1V0q/iq1mcW7LT3IvRGyOL8+7IKfnmudisTS30f1HM5xyw+Xv8NiZGmOJG/FUQSlZn
         q4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773088431; x=1773693231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kDE0gB5xYQLYngO7rvczlFLJwy5YaiWj5eLZwnq0DQk=;
        b=M0Dc3IEHpmkXeo3iuPTtpnLPbeRzeCKEogSiYa3s94TNY17SEcSmpMgeDX6BgnSeh1
         ipZeMSJcTALHe6NXi0orSZZHfaR8apVP5U4ksCIBosVFMG8ntH4YSsCAdCt3GbIyIqf6
         C7kWK0AVJJfQv7XdEgq/cLV4OxXmGQ6/sgvgo/+a3OL3EEsjOKLot03fr65+tdILmQE9
         oXlEUF3CRYisf03YMyJZomze4fPggfQvCX5UTcdEEXFqj3REyhLeH8Z9CDa0qdLphZIs
         gQm86Y+ky/Ac/v/pYbGKXmQO5ZF9Vozd7T+cwj7BGITeHIxIlr9I1RDQPVWs5hVgxWKq
         A9ew==
X-Forwarded-Encrypted: i=1; AJvYcCXH20ffpoAzdFpwAnOM/EVRTns2iANqjaAGRinVc/QfPLzpd37rbAn/wqwla6LfqQr5C5Z/V9K+9k8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0+myz7nWEvrPrAnrm2L/xsE5mUfCzcSmZ6atdV2xzAHZ2ke8i
	jB8gqjANCkPBDdzjtXDuRG393iqD65rLrFdT4QkBm7lfA7j5AgOzYB1ywGfgPo14c6e7KU/lpqV
	8Gpn+K+3OGKyBc3g91Blhk/Fh+OU8OtH8xYvMBTS8W652F/gDK/onTPC5Zij1tj0=
X-Gm-Gg: ATEYQzxPcyyRrkQmV3NB3etUAmyPnV1jPDIFsC0AIiFQGVOP99mWYlDswV19e2N2LyX
	+msvRhjuaqnJ0NCXSkGzVcRd21Cy5h/QRVxlYSzRLJ06DJ/MthOu5WAcea3LZ45q5lUBwfSBujr
	+wL/w8nKzjXYHRq7+1K249MFhLOyFrCF07peqEwTqTR6PGwnAXvHpcCZaYXSvBiEhaAkGgjU8CI
	Gprp3b4ZtWsDDp05KEkiUjRfye5J6Tk04gcoPyMpx+qGJI8Lo7c34vo7drGJw+XT9BGMLssjDLc
	039+VYQaGh1hedoU+ZXoSkPvixLTGFmXv9gNunSPBAoA0BbrBEXXtKw+e7/5+Ynb71FVQMLtVJF
	ioswlapSPmmhTNUjfOa+/UqIQMEy/AMcAEyI2pE04cxxvac+6U59Pe26uhpaZdqnPeKSpfhz41k
	k=
X-Received: by 2002:a05:6830:6185:b0:7d5:17fb:6af6 with SMTP id 46e09a7af769-7d726e754femr7914801a34.2.1773088431231;
        Mon, 09 Mar 2026 13:33:51 -0700 (PDT)
X-Received: by 2002:a05:6830:6185:b0:7d5:17fb:6af6 with SMTP id 46e09a7af769-7d726e754femr7914783a34.2.1773088430855;
        Mon, 09 Mar 2026 13:33:50 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d74885b5a4sm3036494a34.23.2026.03.09.13.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:33:50 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC v3 09/10] arm64: dts: qcom: kodiak: Fix EUD USB controller connection
Date: Mon,  9 Mar 2026 13:33:36 -0700
Message-Id: <20260309203337.803986-10-elson.serrao@oss.qualcomm.com>
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
X-Proofpoint-GUID: fuDtRY4gVcKdzykRAG7Ngmewfo3bybde
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69af2eaf cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=BgTZCx5PUbG0OLn4eFUA:9 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE4MiBTYWx0ZWRfX+RkBhdpCukjw
 4MgOraM2ZBtaztQ37KSO3Hl3OoAZpUSLrBJCwuv09ge7jWKj0sVGmo+cURFod/EqzCWuXB000BP
 cf2nW+ni4KzzYCjX255wC9tRus3usDwpKN85nWWL7d52BkIkhg1jFLzqRBnSp+w8w6X4jZIANsO
 cx4tqNeiIpD6OJjq4LLw43M/AdBS6Rn6rQGn0oCnpYXJ4qHd0/zaNI3SdmF14bjDFUfKOxEfiW0
 8zRlIfeJbQs/lv7eYPKoaEmeWW1/AkoAIs0DgJZ9E3yj/rdsI6VrhzlSM66qj6C/36fDdlQXF9Z
 HDL0DNNVSHD48ncjH+DsGgybROql38FRR3FMbZafvQpMZG+hXyERp+yjyZ6Zo++CAp0bELgo/Au
 6wM0lMOHGhmgVo8o7liJ5I1FY+dD7IDw5fNbpDw8kFXixzxGWL6T9TyQj8ILxrUsuwHZAcMRhHs
 1wcHEMPLy1LW6opXfKw==
X-Proofpoint-ORIG-GUID: fuDtRY4gVcKdzykRAG7Ngmewfo3bybde
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090182
X-Rspamd-Queue-Id: A4776240E19
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-34365-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,0.0.0.1:email,88dc000:email,8c00000:email,qualcomm.com:dkim,qualcomm.com:email];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The EUD node is currently mapped to the secondary USB controller. This
SoC only supports EUD on the primary High-Speed USB path.

Fix the graph connections to properly map EUD to the primary USB
controller. Add an empty connector endpoint for board DTS files to
complete the connection. Also enable EUD so debug is available by
default on this SoC.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 6079e67ea829..24483ff2d5ce 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4294,12 +4294,6 @@ usb_2: usb@8c00000 {
 			phy-names = "usb2-phy";
 			maximum-speed = "high-speed";
 			usb-role-switch;
-
-			port {
-				usb2_role_switch: endpoint {
-					remote-endpoint = <&eud_ep>;
-				};
-			};
 		};
 
 		qspi: spi@88dc000 {
@@ -4623,16 +4617,22 @@ eud: eud@88e0000 {
 			      <0 0x88e2000 0 0x1000>;
 			interrupts-extended = <&pdc 11 IRQ_TYPE_LEVEL_HIGH>;
 
-			status = "disabled";
-
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
 				port@0 {
 					reg = <0>;
+
 					eud_ep: endpoint {
-						remote-endpoint = <&usb2_role_switch>;
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					eud_con: endpoint {
 					};
 				};
 			};
@@ -4858,6 +4858,7 @@ port@0 {
 					reg = <0>;
 
 					usb_1_dwc3_hs: endpoint {
+						remote-endpoint = <&eud_ep>;
 					};
 				};
 
-- 
2.34.1


