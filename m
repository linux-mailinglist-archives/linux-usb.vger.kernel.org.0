Return-Path: <linux-usb+bounces-20966-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E74B0A417F0
	for <lists+linux-usb@lfdr.de>; Mon, 24 Feb 2025 09:56:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48EA416F334
	for <lists+linux-usb@lfdr.de>; Mon, 24 Feb 2025 08:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F30243369;
	Mon, 24 Feb 2025 08:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fjWEf4zj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E6A241CA2
	for <linux-usb@vger.kernel.org>; Mon, 24 Feb 2025 08:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740387377; cv=none; b=Ju7NGmBl7uKC/4ZFhzcVOTOvwROuyMsbj9RPHbXQVAESeP5qQaq3sLITEzb+L/3Oz1ANSYo8WzFLbvtWJcI+9QjQWEsgz78Tzs3EZz+zhxy3kLP1e1CNXp8sIbPhTmEwlluThrr84I26m1zZFz50FLG1KXSSETESEbmizg7I7/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740387377; c=relaxed/simple;
	bh=ycAwiMbxF3n0lZ9z26ElUzrRQcR5Owt3AdSg+tGrPXY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H6Pw9blCxIDBrckiasuYqSdR6rl5oli4QKOIzmgEjMO4oyMpayTdwwYRxQVFcLH4wj8V1/0gSK2FALWsSQf+n4KsfMuj6gPQhqwPikMVz26m8+K70yWVlRu8Myy0WmozmniXotBeQgHScatypLJZrD101KHe+2JF1vb3yxv3Kcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fjWEf4zj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51O0TgVQ008537
	for <linux-usb@vger.kernel.org>; Mon, 24 Feb 2025 08:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TeXXCbYN/NL6nm0TIhtB7ORF7skKDF6mo30
	jLzYZfoM=; b=fjWEf4zjHwzpUQY7T33v9fYwr3sykKHfc682wdJSe/YCv1v1WTN
	/lDeRdM5zE6HfRX7eXc0B/B6EtJDLYZ7LgeU8HchSfQO/Bo0tEI5IGprX2UdpglQ
	xMob63sLxVsEEJ0lrktmesHDPH8JuZ15XadXLJnTHEUpjuiK5p6ZJjY9ZfLfg10J
	48v1KKDWw0X7tUj9tI33LKNRCpcp2ifPl5wWavGDQZFI4XRhxVrzf6+wYan9zPQ9
	+rvlGlsWwEq6OSyHj0sOw7mg2JGUU2zHlDRKYN4R5AfqS0jqGiZ6swEGyz/yINqm
	Dhmxz05HyYx7LkVApfyKQ0qSyrXDLLh/pmg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y6ntv86d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 24 Feb 2025 08:56:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-220d6c10a17so94666305ad.0
        for <linux-usb@vger.kernel.org>; Mon, 24 Feb 2025 00:56:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740387373; x=1740992173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TeXXCbYN/NL6nm0TIhtB7ORF7skKDF6mo30jLzYZfoM=;
        b=de9l//1sI/9dwIKDeZq2RVQiDGr0XH/eQInPcsUn+g5/oADyux9uBA2PhYoD9zMlzn
         KDF0Ccirwl5A9eZHlp/AG5tHzkyBX/v8dealzbEYkHmeYtqzi2yYnguiaN0d4/fqvaIC
         99abzqCSvnwild4Fgdi1HzOpuylE6SegqA6ybCn4Y5Odq6rQX/tJu7lVPte4KMqZixpy
         gnqd85nljc5OyeCPPMj3TleFG0loeIWgDxEa2oVtTdGav+9N8L3bfuSvwMdSy2siPWHB
         +eOzTnOqp7qdkhBPrLYbDEAEkUtdHjD48eHqM05hOxorXCaETLXVjW6HE3YUX8SAusej
         SuFw==
X-Gm-Message-State: AOJu0Yzk1btIHTpnzIJpd37O2fLnR/R0kB090enMYC8uz/j67tEWeNu7
	bIlkNJapGm6n7vgzCbV5EtJrqbldsmGUj8rJQ41DhBs1oFC2U0T4Gr4ppTxpZtvVQ7ANAiAyj+T
	4ZfnJFjHrXO8ZXMocRJgQnixThOo07LQVNzLswR95kgwkOnxiQumrk4HS6uE=
X-Gm-Gg: ASbGnctR8Mr8QCXoHpADk/zoSeabY28xUwMNBUAIZdCIqn6Na07Rp1MTtQxkUkApDm+
	EBxwuriCjf1daV6IwOjITVrARxMoePwfrwcdJ58ppc5MtNUOnT5miGFcPpgxKfq4bpYC0RbF6Xk
	7Av6vLWG2sX563jHSdMzxAE5li6b6O9fpJk4NHhskayJ/Vh7EqzWHJwPrrflKtYxsRTxGRFV1TA
	SEMdB+Ba6CYpTosMkvvxG6kopkuGVr/eYMPjJ279A3rVvFw93E0K+Hi24mXgATvsZE9BgzpMlZR
	AY94RERfZlw58k3UecV5aPWML8ynkw3CfntntwCe3NVy
X-Received: by 2002:a05:6a21:99a7:b0:1ee:c7c8:cae with SMTP id adf61e73a8af0-1eef3cbe826mr22651561637.9.1740387373189;
        Mon, 24 Feb 2025 00:56:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGODOh9bvtWJ+Wd/yTYPKP51Y5HpfVfLQY6VnaKmCSDPUuwobspDsFFqALPPRN8NBLX7OhXIw==
X-Received: by 2002:a05:6a21:99a7:b0:1ee:c7c8:cae with SMTP id adf61e73a8af0-1eef3cbe826mr22651528637.9.1740387372762;
        Mon, 24 Feb 2025 00:56:12 -0800 (PST)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242568af8sm20161399b3a.48.2025.02.24.00.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 00:56:12 -0800 (PST)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Bakker <kees@ijzerbout.nl>,
        William McVicker <willmcvicker@google.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>, stable@vger.kernel.org
Subject: [PATCH] usb: gadget: Check bmAttributes only if configuration is valid
Date: Mon, 24 Feb 2025 14:26:04 +0530
Message-Id: <20250224085604.417327-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GtluE2Th_nb0HxAnFjFJTG6a1baiRvHv
X-Proofpoint-GUID: GtluE2Th_nb0HxAnFjFJTG6a1baiRvHv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_03,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=584 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502240064

If the USB configuration is not valid, then avoid checking for
bmAttributes to prevent null pointer deference.

Cc: stable@vger.kernel.org
Fixes: 40e89ff5750f ("usb: gadget: Set self-powered based on MaxPower and bmAttributes")
Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/usb/gadget/composite.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index 4bcf73bae761..869ad99afb48 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -1051,7 +1051,7 @@ static int set_config(struct usb_composite_dev *cdev,
 		usb_gadget_set_remote_wakeup(gadget, 0);
 done:
 	if (power > USB_SELF_POWER_VBUS_MAX_DRAW ||
-	    !(c->bmAttributes & USB_CONFIG_ATT_SELFPOWER))
+	    (c && !(c->bmAttributes & USB_CONFIG_ATT_SELFPOWER)))
 		usb_gadget_clear_selfpowered(gadget);
 	else
 		usb_gadget_set_selfpowered(gadget);
-- 
2.25.1


