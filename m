Return-Path: <linux-usb+bounces-24145-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EC8ABEB03
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 06:40:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B40817EEE2
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 04:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B7422F768;
	Wed, 21 May 2025 04:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hGrDxxhZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4214C22DA18
	for <linux-usb@vger.kernel.org>; Wed, 21 May 2025 04:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747802405; cv=none; b=BxJlI+FG6Iv+ZndeWqEzk1Z9ellUvi4+EUCpJH3Zk4A8zoIqiowxVW7miWBiFYU4CYrDuCm6ML1UyjWPL7xjjQcG8Gp3GCj1TpKaVrhH0qTfay174cTpswin2Gfrbjjwo0osWirgtV9msNgJikpkHLF7AKNrurfytuV6gI5uo80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747802405; c=relaxed/simple;
	bh=MXqYVLlIC857YO1MJUKMFQ6APvJH33Iga5WRljoMUTE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VdUdsJOAjAWG/DJ/IyeJt7pqtKq6SQAToQjE6soZNef4TlXS9gs1XrfjqcmvcUhtIVlmJQLTb7bXxndVnUBCWxmnOf6T8oeaoHtCPDF95W6e0VPZnbA1FyYfifOeEEU6fnWP4yM286c/WO5McF/ImKaM2seyX+eZAZcr4kd7ub0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hGrDxxhZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGdoho024716
	for <linux-usb@vger.kernel.org>; Wed, 21 May 2025 04:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1BT+9avoZ07YU8MroIjY3rzBacA3W/8MWgZ
	5I9HIHaY=; b=hGrDxxhZ41U9ZfGAFmB6ZfIH0mK0giqnxPsAUJS/9DkY8NqGIm4
	1Kxyf1ji4dFyTOmgRs31JJY2UiQpmqM5jkz8rNsVl/UoL1qUCiRmdpqGdyrQwt1Q
	mQaYfg1XcELGuKEtYTe06sOGphb50KCZcitZG4UzxU5a1mbJyOwwo4Yt76BZUK2E
	bDVuJZzXhwwfdQNET3vUWVHmPIMrJjFphJc73BJB7lYVe9AcNTBjm2BRkAmD/vs9
	5jLWeCLI68Y5qcg/R33Vy2Nt5n+suZ7dL6JW0KGSRyFw88SUEeVWWpbN9IkFpaDK
	CF5dDha9fF7sDaQgyMWTrMWcZOQi81x2g8g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf31grr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 21 May 2025 04:40:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-231d7f59e03so56679915ad.2
        for <linux-usb@vger.kernel.org>; Tue, 20 May 2025 21:40:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747802401; x=1748407201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1BT+9avoZ07YU8MroIjY3rzBacA3W/8MWgZ5I9HIHaY=;
        b=hdlbKkC8TkMHpBo/VpLemHR4sNurQ67n44gXYWiVQhX3b1pQSLht8gnzanXaHz3SmZ
         IH84fU80CYLoZyT9aTfcZrzp/7rEB7aVClo9rOOzF2xF/pBDq8Hfhn9yNC5ebwj6RmhW
         Q9XxFXcuC0/kUL/8iq0T0jcZlbqIpLO1SJ7lTYxqd3+BjfkN/Dgfc/SYLbpLR4ocWMIp
         /u0UubpHp6X5ZQES6wjST5IKx0/jPSzxRGwMG7mlN22u6BCJuSN85mzpgM3kTD3x1Pdh
         CbmFENYjsZMrD0fu9TIcomC75hhAi9J/ibFvl2Xrbl/SJeWJm67i/7twbcOwbkH3mC7V
         2dIQ==
X-Gm-Message-State: AOJu0Yxlw4jzzK1hf6ruWSKvRSo8z3MUa1idw6obFxUHJ+QifITUfqRM
	LZTeHh3TbH/9ALO4HwMWPFS8cBbtCoMYyTyRMOq3WUFkqtq6/josgxZEMV2z14k6dEbpG+klLUr
	K42ILcfAZMIaKM7WHQQSZF0DxrNcZLrI0/B7ErWJjS52dd+fPmhncYO1EDIuU/eA=
X-Gm-Gg: ASbGncu4MPnX8s/zJHaxsj8ynaPgqNHduuDx9oAMlDYwWBkPRgCFS5FuxuhUiSgA/TE
	SYVZ3sphIXhWNLr+emMYuLFDcxP9qdU2AeySLHNdt2TRm7Omc8nkblSNeYvyF3VoNeh9rf1j0lW
	BcqYpOYWindiWnLh4PIrXAtAwqecgCwZuv/nG0CWRSA2XwaPqGihvTqhD16DsKwk/1IeN18mbNq
	Sy34HzC5SPFEitUV/F8GkW91QE3hN5Q4FUhLQhHzDY5xGAQrq48LDWe1OgkDhPV43wnd9gj/M39
	z0X+h94qbdC1ozpZVC7lBUbTp10tGCZnSvS5XUhW
X-Received: by 2002:a17:902:e78c:b0:21f:dbb:20a6 with SMTP id d9443c01a7336-231d459682fmr299636045ad.33.1747802401446;
        Tue, 20 May 2025 21:40:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGU4EJptW2RrlBGMP2/5O+s4rbOQfCsE5GvhR+3qiIpmTRK0+nzuEmADXMEIXCPu0RsvWZN5Q==
X-Received: by 2002:a17:902:e78c:b0:21f:dbb:20a6 with SMTP id d9443c01a7336-231d459682fmr299635825ad.33.1747802401017;
        Tue, 20 May 2025 21:40:01 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-232053579d7sm65632025ad.80.2025.05.20.21.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 21:40:00 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH RESEND] usb: gadget: u_serial: Avoid double unlock of serial_port_lock
Date: Wed, 21 May 2025 10:09:51 +0530
Message-Id: <20250521043951.1028481-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: EkxP7aB7nW3eItTcALBVp4j7Ce4wRIeH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA0MyBTYWx0ZWRfX0CzgetcPbLfZ
 RRotLlKTfQnO28vQVBzj+Etky/rO90Ts9Cb5GTxBz/E1Tq4LYt+YVaKE6Fk0AmrdHsYPuDBXSQy
 FRAUioaneN0R9NLdpZsANXzIrl4XFWM1XH8/1qXVzk9h1A07Yk72jbWGLvh2N3Q1OQImlNUSdBG
 5XLOisuDce040ElX8NQPAhmuVm2v6EmWdHAfYMgqPgen8+rnSwOn5NoPiqdxyRi1KQpAdaCEG/M
 j6mhJCuzuFTFsKIrtl7trZhK+iLJksm/WO/LSNYiCA4YCrSlhVAzBVN1QYokA8+6j3F6UvxmfGN
 y7Zqcb0DRezh88jXL8HzHjF3j8ThLQvT2Yvl2IJUkuAlE/4SRAuaPFgHfnB1cpsDWbt5RXdDQp5
 0loHnIPnp5hVKB53naVlDbBnfVZkq76bIozslEF8LxO4aWXBWiuUKYOe89eoSw910x33JAvD
X-Proofpoint-GUID: EkxP7aB7nW3eItTcALBVp4j7Ce4wRIeH
X-Authority-Analysis: v=2.4 cv=a9kw9VSF c=1 sm=1 tr=0 ts=682d5922 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=gJab5K-lH3zide7aClcA:9 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_01,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=828 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210043

Avoid unlocking serial_port_lock twice in gserial_suspend(), this can
occur if gserial_wakeup_host() fails. And since wakeup is performed
outside spinlock, check if the port is valid before proceeding again.

Fixes: 3baea29dc0a7 ("usb: gadget: u_serial: Implement remote wakeup capability")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aBHatifO5bjR1yPt@stanley.mountain/
Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/usb/gadget/function/u_serial.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index 41dee7c8cc7c..ab544f6824be 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -1505,6 +1505,13 @@ void gserial_suspend(struct gserial *gser)
 		spin_unlock_irqrestore(&serial_port_lock, flags);
 		if (!gserial_wakeup_host(gser))
 			return;
+
+		/* Check if port is valid after acquiring lock back */
+		spin_lock_irqsave(&serial_port_lock, flags);
+		if (!port) {
+			spin_unlock_irqrestore(&serial_port_lock, flags);
+			return;
+		}
 	}
 
 	spin_lock(&port->port_lock);
-- 
2.25.1


