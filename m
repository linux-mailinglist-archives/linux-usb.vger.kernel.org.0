Return-Path: <linux-usb+bounces-37163-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGY0IBNX/mmupQAAu9opvQ
	(envelope-from <linux-usb+bounces-37163-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 23:35:15 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D40354FBF79
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 23:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54A633083C8D
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2026 21:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4A030F932;
	Fri,  8 May 2026 21:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jNAdAH0Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q+606oG3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562282F5474
	for <linux-usb@vger.kernel.org>; Fri,  8 May 2026 21:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778275992; cv=none; b=ZA396jwUQj0Cosmx8i2Ki9n6FVR8UBXqhUYk1e1plh9HjamydGBAVD7t/qAffRKmRxgaeHkIXHO4RcX9Ohv6xeIoDQm33mHp0aRTh67qT0vJ1B+AgQEu+mQvPyWUm+6PGbYJzVDXPgKQvevHUtBnJOUebDexnjwRIGSk902pwmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778275992; c=relaxed/simple;
	bh=r7Z52qBn7Oiq3+44QCWlmOdEnbJHHdtV1GjdHQai3oU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MujLyRN18TV8gXidTz7hhJC35kn1F1sFg0frafpWis+rWtD/ACd1HhUgbaNc+a2OxD/ftesAjPJli9n6WNy7jERRw48PrBlaUzet6S8Qis4oinp+1VK9DwWCCWxKDMh4d7S7HMy5fGH8KXpjhKJn4+7W1FrjtdD4hvtogyElGVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jNAdAH0Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q+606oG3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648JddqL4041559
	for <linux-usb@vger.kernel.org>; Fri, 8 May 2026 21:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ecNTbhYHuyh
	QbhuoB+7vmARq36r7IGCdT0R1LSWjkRI=; b=jNAdAH0YKmnXVRc++ujA8I1EB3p
	SaaHA+r/Y0HkFFNG6dcFq3Opd+3AyegXgHzRdbJFTFb7ZztzO1dbrigMuxFzgRsO
	5PPRwGPXmWsDfRCciL4++sdaTpztMIL+3VAK0BuPftWFLdL3wXCo4m+JVN8nGnjT
	cP+nsnLyGeqVnVjlMIxr72vaOsBMil1cDZRSYzoH5/RlyxF9yGBZIYfz8XurX4bF
	mmIh15RZ3+7Vw9I6xDfvn/tY9v8QQshopZaP01or8L8JEJTwYmcKv3TqUoS3gLA8
	umjOYHALIIxAHA7C4cw3xWUeISzUJOIBwa9ueC8vt7c4IyJQZfa9UicilLg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1p68r9wb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 08 May 2026 21:33:06 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ee1da7a13fso3469380eec.1
        for <linux-usb@vger.kernel.org>; Fri, 08 May 2026 14:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778275985; x=1778880785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecNTbhYHuyhQbhuoB+7vmARq36r7IGCdT0R1LSWjkRI=;
        b=Q+606oG32tGpPg5KlolhOGJlX9UEqo8n82xtCl5OXzG6eSiHYT+P6SylvAa6Fzzf/w
         hpo5zSFpJAgdTxfFw281GgcH2YSM78sp/7vhPKbhBnSfO4Z7j0080J+xIk0OMn4meI3f
         0yS/+PQMOrREUSHi5uXymVZk9xtIjp9+OATlk6AmixPK3smVSD+puVSiAqTXdI5SW+A3
         Kf51q0SRpZOjxmi9Pzy2ifBGtjgV38eeyc/e/ho9ZtcGgH2SR+uVcVsSSycOzR4YBV1P
         P4JNw5+PEaAdq4Snsp3+LUZ8l78cV+CORWFuBo+H4wRC3TX5ZpVKiNeBvCIYs1b9Kg7e
         dOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778275985; x=1778880785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ecNTbhYHuyhQbhuoB+7vmARq36r7IGCdT0R1LSWjkRI=;
        b=kRNSJ8Q+ZFrPvWFyJCyMH7Es2ZIpM370U4CIKQQ8XJTUlelJr0nUDO+MvZMzvAeybr
         G2iYqLeQXX1WihXxC23IWa2i4xEJSwpJe7ICPYfE0fA1cF4fC7ikXmLh6P2Oh4+UHPLj
         xoA+yuKDIBRwylPEdERraZfklv30deDFu2PcM+JESHsRwS2jriJqacGnFsJOJCn84wJo
         d/WzPbh2ibbyf7Q3dBg+Gx+MFctq0liTHeMlGFAuEzAWR0SQGM3Vv8k1PTIEPj6VI7DK
         BroBRFS73AAPaNxAyRNC4u30VPnsEA6rGWDMyAEGTt2cUvp9YuYS9Gct4s6ulD8qgqgB
         ySOg==
X-Forwarded-Encrypted: i=1; AFNElJ/odVXmY1tdB/CXEfc+D7ajKCFCMlB5Uedh+4Kosly8dkGCfz+FBNrBqcKhdBPH3d0GyJ15J+atHeE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4J5Iz6lNbVFtXGvNP3lAGFI3d79QFS5Bb0dImAHcPYK0BAEXK
	kJInTXCW/kCrpoZbNxCeOc36lzR2vN4MRhDSDb2FptqKLOqkkq53XOE5GR/zTHR7/tO3ELsj1MG
	ye7ZHZ01GqMSDGmM/dYa8xZI1U7PQ7aMXdBR1AYGxNcsUOO1PmoxNP4Xig1rHUqA=
X-Gm-Gg: Acq92OHYjtca7FRwVu1Fv4myfPq6n6SzyQjSAPhXUZhsW2nabAls7jELhBxRIpIMIvE
	W2VYLDZlKFykvuys1QUUE/rRSiltDBK8t6JzIzDm3X+/wLbl8LIegprc+u5wLKRCm52AAHoEi1F
	BqS5ikLAPp6TU7KbkXR+KONXzcmpjVfScBLBzgd3x04hXHHvtqvdtrQeOQQfYcvx0PmONFAjEy4
	6IZYfhXx+8tWGCFK28T01KkCntbvP4SPqGs+/LBzMkRWodWhP2+yZ4+S4n+vwgABGaxzdD6HGR2
	uOvi87mZ3QjXiVZ93pHk4RT/5g8VU6UF/4m6QARcYoG+Jtm5vx9qhT5S8gS1TmnCgN/9elSaEha
	2z+IusOFUSpjaVZtO+PfwZvtpJw/WUvwNdRI9UN0wFvAAr0VFk53e66gojGA3LbsfP3VEU6fwox
	g=
X-Received: by 2002:a05:693c:394c:b0:2df:71f0:e5b3 with SMTP id 5a478bee46e88-2f54f9447a6mr6846205eec.20.1778275985286;
        Fri, 08 May 2026 14:33:05 -0700 (PDT)
X-Received: by 2002:a05:693c:394c:b0:2df:71f0:e5b3 with SMTP id 5a478bee46e88-2f54f9447a6mr6846176eec.20.1778275984797;
        Fri, 08 May 2026 14:33:04 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e3e285sm4871285eec.27.2026.05.08.14.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 14:33:04 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com
Cc: wesley.cheng@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com,
        ronak.raheja@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for Hawi
Date: Fri,  8 May 2026 14:32:32 -0700
Message-Id: <20260508213234.4643-3-ronak.raheja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260508213234.4643-1-ronak.raheja@oss.qualcomm.com>
References: <20260508213234.4643-1-ronak.raheja@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIxMyBTYWx0ZWRfX4lprfJPIWCbH
 bYKqxfonvE0KHNG4g1tm2/HSwGVjfx3/W9s2oRsyL6mneZ4DhhfMdY5GY1BmjqartGu1MIId66G
 uM59/gLSL4BcxUJU4x9qa1EU5xAI/H6XsxnuYneBRITxqzLB4hn6fqm9f976JhYGeJgaVCSLp8W
 i+0gj+oS470zpV4O6w0d/vAoUzhqKHlzHZ7ww7LG1rcKE4Pu33sGV3LZh+oAqkKXvXCG5/9y3/i
 UkoQ0csvmgSThU/iUsWUGS9SrH7L5AqzRJ7pYA+lA4FJTnNih3MvqxKKHZ7hBIopozZrqABtTZh
 8SWHY+Ln8OOq4yzIJTf1IVPNuvC8GxMkCuvBsI8z5RTZ/m/bQeUoPv8pTgDn7043cXA/rfmBUNW
 9QlhDmMNLuchZ5H7wPtrfij/L0p0zcrvBSAOPx2vWr7gJ4d+8N6iR6DNtJJjgyieM4228b8gfRe
 ge4vlGB8lPfFu7ujflg==
X-Proofpoint-GUID: whXC5pvnlqcV8p9OdmuzW_Z8OK4Q67UD
X-Proofpoint-ORIG-GUID: whXC5pvnlqcV8p9OdmuzW_Z8OK4Q67UD
X-Authority-Analysis: v=2.4 cv=b+uCJNGx c=1 sm=1 tr=0 ts=69fe5692 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=vC2bFTPnYnLVIQvTftgA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080213
X-Rspamd-Queue-Id: D40354FBF79
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[ronak.raheja@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37163-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the M31 eUSB2 PHY for Hawi which handles the USB2 path. Use
fallback to indicate the compatibility of the M31 eUSB2 PHY on the Hawi
with that on the SM8750.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
index cd6b84213a7c..c0e7e2963ce6 100644
--- a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
@@ -19,6 +19,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-m31-eusb2-phy
+              - qcom,hawi-m31-eusb2-phy
               - qcom,kaanapali-m31-eusb2-phy
           - const: qcom,sm8750-m31-eusb2-phy
       - const: qcom,sm8750-m31-eusb2-phy
-- 
2.34.1


