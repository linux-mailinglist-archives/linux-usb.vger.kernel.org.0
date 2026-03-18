Return-Path: <linux-usb+bounces-35011-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOy6MjIlumk3SAIAu9opvQ
	(envelope-from <linux-usb+bounces-35011-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 05:08:18 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE312B5B37
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 05:08:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 657B730B3D73
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 04:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5FA33C50D;
	Wed, 18 Mar 2026 04:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xwi5xlnu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gH4pwYI2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A677243964
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 04:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773806826; cv=none; b=OAd0Tgcnsg/tbwWqahwvXmZ6EFTtps4W1/7Gx2dsok/68aSKVU33n//MshGm45avqxlrfKfSh48Otyd722Pophk2HOYq3qlB8TsX8uEZ2nx8BAFXfc2rmC2VAZk7O7A+Q1QpaKCmz2p3ZMCYfiE3glf3KCO2cxnKsXg5du3r7sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773806826; c=relaxed/simple;
	bh=o2zRIyVnrK+K/Z8NB8eFZDC2LHxUxWG3udiN9D9rX9s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hzxEwDomEyOGOWhUcZ2ETT18NO29CiUuM4+2Z9nmrpSbKyDZ9RiBmaPZbCw6hquAMt+ydePsH0vgWBPVUs4Ew5mkXjY6nm0bjRY5XauPpPIw4T7GnNqGAk7Z6hH4F6TcW+B2HJY5tde23z6aUOUJYIc67fZ6mZlfBAvBc554lTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xwi5xlnu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gH4pwYI2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I2v6pF084731
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 04:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dnFUHnj6wfV
	nSKifpravZYf6kIMdlWwQd5zEO1oMM9A=; b=Xwi5xlnu9OsN86yTc19VM/xsmk+
	tsQg/t+B6r/a2qOaZR7b1u2vrav7mNSvH5AcSTTwPJ1hwfp1dHTiJB0QU97CRCAf
	84pibotQvaE36fv7crjeKSe31qB0SrfJ0PbOP9QPnLDFkJ9mSSeAyyy+MTb8Iolo
	Kbc9kf0lZYZNJg5v/qypbDWzfS2kOXt7KscDL9v/x3PY+i3FN4G/LPlSfpixoNGO
	M5b4elbb7a5oF/iy045YkqKiB55IKzeOFxiWMsz9vRWlfSx+nm/Y4DQqzAWw9sxl
	LSUhWeOvkMeLARnlF9mRy27SmZOGkj3JdPVpbJeewQ+c5hIhGmBuVoe/hHw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cykqer9s6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 04:07:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b059511554so170382745ad.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 21:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773806824; x=1774411624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnFUHnj6wfVnSKifpravZYf6kIMdlWwQd5zEO1oMM9A=;
        b=gH4pwYI2WIODaobi0GYmmbdGQaLG81yFEWNlQumLHBqcBri+FrvhMfqVbgvtR4LSBn
         wrr5B664Ba7pbr25ItgieGhi9s1nn7rBjMLwSOcQVdi59ksBSMy/297he8A/OGeuw0gn
         Je/X6IAxyIUCd2habe1FVizVVElSSjX4tt02oj32Er0RB65WJZO0fR7yrhzjDh4hi0lK
         7aIZQwp3bfdKNplnZflQ/O8/keqelqHtgYcpteBJlMGb1aNCpSCnDl8ef9/t1t/vb8G0
         Td1CfLpvLWezTIdQWii2qKoue+kxFzraPpW1jzLCqv2adG8VA+Zl2L8Fdx7434ibPSyX
         ayqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773806824; x=1774411624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dnFUHnj6wfVnSKifpravZYf6kIMdlWwQd5zEO1oMM9A=;
        b=BIKmdzBd9MqSU3R4o1BhrjA5L60B5DZf39AZhzSjb3MJfkO1PLYFkOKCoUB+x/1yQ8
         OaCJsCDf8SVlA8+HnppIGrU/kmGEqzu9Me2on12Cv8v86BZiwR46m3J1In0A26B6n5Ls
         uhz+vSXwXb3dM1uht/4Hp8M9GyY8GrVNlzhPdNAONLlobvIx/u79TBZfxpkHpR/6xgr8
         zeHrq1epPHgFOMBkEWDlYsp96sprdAlZMRmD1SUq7K5/Sk4q98Pvg7ge77+oV9Kh5RaT
         oC4uNfpcFFk9Mfilc32pYHRNSsW1G0Nqwhln+jKj+iTZc+f/C3QxWy6javBEMiETsjFu
         hdew==
X-Gm-Message-State: AOJu0YykGL4r/p4dX8GW/tVOGKig22FrY7cufHTvIElOd1q7StsQEahc
	niAn3ik4fg0RZ3Cb1Cjc6VPj92v6uu59za10l6zkx3PRfZe46K4WAwZbbOUi3OPa0Buj0KKO0FR
	J5DM7eIcV+9uLUOWG4S1PC/pSwrc+Ddd+bGw9xvPe0j0AZnnQNQYUj488PlzYXPY=
X-Gm-Gg: ATEYQzx/xuD8uZFYgGSlLYSc3r+P8B14tY3ly4DgqiqqrJKym+96onhfxHtakkjtx6Z
	eV7I1Nz4n6GrHnrHVVFPw1gwqvjGwipbLkgtmIOLeQfOp2nefGO56oReWEHtEp4fsCdurbCkcUg
	7JqXcYdAbZZ+bBmyHdHRBm7TUhTFKNUzRvWi2FF5o5S4raLUUQwwUbi9eONhGRslrg7bwlgfqis
	pKsaNwTyQjTzfogJNOX0Ut2W2GQgY0yWNdyf+Du1BvVR4ffdjpYutWClWnOrM3nbHH4ulS+cyhx
	6qBV02A2qhYOjeJ4x5lKaVsDM86pcLVdENN5GmaEAcm3dExYIrxZrBFJhk8dlNUc/T04ZtdYSFT
	gHb4hA9cMMIQt+caFHrEGpAXENp8c/lnWQoQztOaUWxfAXZEYOuHTUTA=
X-Received: by 2002:a17:902:d583:b0:2ae:55eb:f82d with SMTP id d9443c01a7336-2b06e32433bmr19445385ad.1.1773806823802;
        Tue, 17 Mar 2026 21:07:03 -0700 (PDT)
X-Received: by 2002:a17:902:d583:b0:2ae:55eb:f82d with SMTP id d9443c01a7336-2b06e32433bmr19445045ad.1.1773806823403;
        Tue, 17 Mar 2026 21:07:03 -0700 (PDT)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e5f12cesm10243425ad.41.2026.03.17.21.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 21:07:02 -0700 (PDT)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Pin-yen Lin <treapking@chromium.org>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v6 1/4] dt-bindings: usb: Add binding for Genesys Logic GL3590 hub
Date: Wed, 18 Mar 2026 09:36:41 +0530
Message-Id: <20260318040644.3591478-2-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com>
References: <20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDAzMiBTYWx0ZWRfX8vxQRpF7j9HJ
 j+2EFotoUYjHR0AUva+BBNCKVB22U/OOJRG5zD0vh/abivGYPjEM8oVnVdkyl9bmuwDQVkARExA
 /9eHKabDrRmsCLj6pl6MIxKeLcwD7ui/pI9LL0qjWi0bT/CTLXf33NVT9xKjc9ziUfvOikzzZn+
 zcNYcnP1ttHACcZ95OtfCx0EpMkHP9J+LEp5zW0EhJqMfzqAux9JgauKJrjwUEM5c4FSsVMhpdO
 adZ2yP1eeVtJ2IMct48g3/tVfgLQvk/+Y/lTAy2OUpYkT0Y1FRrl28T/ZUciCm+bhEwnYtpbAyk
 xDL03aNbwVpPhjwDogx4ZmZVeeQCLbg5Zba0SmDIhfTyOjxJjhaQwMwlkE0+JNeQ2UOAh6Ew1lJ
 0jl30Mf4/+7kxudOor8Wko2TsCbFfNheBZNkcDPxJ1jXHqOTpAPvozX+GoP1UQoSaxdPwsUd+s/
 nMy0E2nzquYeEpiQyig==
X-Authority-Analysis: v=2.4 cv=Cd4FJbrl c=1 sm=1 tr=0 ts=69ba24e8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=1mrrX1IwxDsCUTwcy_oA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: cflZTCdHHvhMBawcCzG8OtnOYzAFiplk
X-Proofpoint-GUID: cflZTCdHHvhMBawcCzG8OtnOYzAFiplk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180032
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35011-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6AE312B5B37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the binding for the USB3.2 Genesys Logic GL3590 hub.
GL3590 hub requires 1.2V and 3.3V supplies for operation.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 .../devicetree/bindings/usb/genesys,gl850g.yaml  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
index 9a94b2a74a1e..d8ca9fe5a593 100644
--- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
+++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
@@ -15,6 +15,7 @@ properties:
       - usb5e3,608
       - usb5e3,610
       - usb5e3,620
+      - usb5e3,625
       - usb5e3,626
 
   reg: true
@@ -26,6 +27,10 @@ properties:
     description:
       The regulator that provides 3.3V or 5.0V core power to the hub.
 
+  vdd12-supply:
+    description:
+      The regulator that provides 1.2V power to the hub.
+
   peer-hub: true
 
   ports:
@@ -69,6 +74,17 @@ allOf:
         peer-hub: true
         vdd-supply: true
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - usb5e3,625
+    then:
+      properties:
+        peer-hub: true
+        vdd-supply: true
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


