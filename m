Return-Path: <linux-usb+bounces-19535-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B430A16B5D
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2025 12:17:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4642188461F
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2025 11:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE9501DEFD4;
	Mon, 20 Jan 2025 11:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Phy0+VyT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAD61B4F02
	for <linux-usb@vger.kernel.org>; Mon, 20 Jan 2025 11:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737371832; cv=none; b=WVA44NKEWPBnaN3+6U4vIQMKWC3BX6/oLgw/n4CP2C0kAA4RfxgNiiFTcfrEUeAjw5vLO9i8ArnKfxBRp8lXoY23n2Xai3N8t/n04Cl7Ncc8udaSURHfoyspYMa6KYaQ+GDINpgxeG7MPzKMoB9ovW5fV+N8KHXVdT87ok/XUc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737371832; c=relaxed/simple;
	bh=oWuiLsuwyvgSF9DQroHWumglqEl7K2P9W7WXiEEOPgI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eCf02M7Rwa933OLlZbP0+BcxNWwiA/Xucj8xQKnHSyHGDG/3aHZdkEDD4WgKr1M94z3KFGAVsx8HuGl3z2tR4f+qqBUNPUH6RV2oGmvuPHPRyCFK2VjGAiCZPoGPEFOp05p8NU7ZsP4CkQEr1zIkH1/kByYjE1tvE6rz0347k3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Phy0+VyT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K6ZZgN016284
	for <linux-usb@vger.kernel.org>; Mon, 20 Jan 2025 11:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GCrdy22Zg6uJkDlw+8S8ZNs+PFquKK9bM1D
	cBTHtlow=; b=Phy0+VyTD0aekcjmuXA5a6bdhTGIxFMczRAHFl/0MbRl1bYXcTq
	hG5HoP64zwOQMBG2hIrfAbWd/V54Ym56FtVjlPEfUEV9nmUQk60SGwOUOR3qKU4M
	sWuy2zUnfvGKesQskyZ/78eHPpL7MO3juSxA1PCWgCNBqgsYjNvb+HvmA+XK46cU
	EpMZrcIulUuNWgfPD3n5CoTbXMQjQEeoUAILfFCQnd7IErppmM3cxBFt70YuSsB7
	zdNaCo5yPAoy5oahkYENGpqB+t6A0P5kedQXY4TEiXvFqtvimjNivH4nvwTaz+i4
	aJoLbkhKaPaJ+Fi6hUQAQ0JNcukT7YwQn8g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 449hbw8q1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 20 Jan 2025 11:17:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2166e907b5eso84683275ad.3
        for <linux-usb@vger.kernel.org>; Mon, 20 Jan 2025 03:17:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737371829; x=1737976629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GCrdy22Zg6uJkDlw+8S8ZNs+PFquKK9bM1DcBTHtlow=;
        b=M33JgrFDfoYDMU4gO576t2owf/r7WsRMKe1x7hwHKRkZLPtclObuT8ndAPZOLZwEcD
         xbpagJd4N36sTyBHy4gHr+R83dI1XHoC/uCP5QW157YT+YAaPaiEGHWjMSHnzY+gtIpJ
         pGov7Qc5q3haGueu0ZcH5i1Q+pJCaydLtA7i8TFZucloCL5NXPQhzJ9cKtP4cwEs7UVT
         hARlxW2E0lW98WAvYrA62EmatWO6ui27n30Prxw6ufRTg17hDW1dpEJ6MPFCCFJYC07F
         hayUkDHNH9G3G4puiOZDNCi2Vo8RirwSL7JF8Tl1wFdkOdLR4CWAg86Q3Chn5L8vpsuQ
         TPtA==
X-Gm-Message-State: AOJu0YwZovr+gsI8NvBi5NUC6Bj5R6hcpus0Shad0JwNGj5mMJ3BPpE8
	KuRId1cQz8Wbfq4eXEnNkektdxc71PfUeU2qCFYwbj2AKpKmV8x0FtXfbV2uGYRUKuBo0q68GGd
	vspnpJ7Z64+ROi8gNyJ/8QzE4XvPGZ2+1DVGxz54+HB6RnKTqbHah6skLjb8=
X-Gm-Gg: ASbGnctknaGApFIDUMopRqrymfXJCZbB7KzoHkUXCAnXoCM17tToA/nhgYs0ifbJmqC
	EuClOg6TuAg3lxeXR3Gtc6FI/w3RyLaBZwZd9V/t7GRTwjyDV2axRg4U6edu/Kdv3k3AfkpX3i0
	tSS2cfO3098gmxItnrEi0VgMowkg9uUg+vU5Y3aehTgt9F5M6OhxYzo6ItoIbaJx+7/wAq9IHvJ
	prP0c/D442T+GYOp48gqceCJZAB4kUCEu3CynHziDKhztbj9CE1EdyeeqJLNuuShlSI1aR1p1vv
	0yZT+9lZlrNC2E4t3CIsGNA=
X-Received: by 2002:a17:902:db10:b0:215:a2e2:53fe with SMTP id d9443c01a7336-21c355c7a3dmr199818155ad.40.1737371828696;
        Mon, 20 Jan 2025 03:17:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjF0nO0PvOPLALsi3OpuDXqxMJSQpWPjAbBdggfW/E9JxCzDENI5fYuantGViJvQRd6icTHg==
X-Received: by 2002:a17:902:db10:b0:215:a2e2:53fe with SMTP id d9443c01a7336-21c355c7a3dmr199817865ad.40.1737371828290;
        Mon, 20 Jan 2025 03:17:08 -0800 (PST)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d403310sm58802645ad.203.2025.01.20.03.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 03:17:08 -0800 (PST)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simona Vetter <simona.vetter@ffwll.ch>, Takashi Iwai <tiwai@suse.de>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH] usb: gadget: Increase the limit of USB_GADGET_VBUS_DRAW to 900mA
Date: Mon, 20 Jan 2025 16:47:02 +0530
Message-Id: <20250120111702.3738161-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MA_9JxNHkzruARJacqKBaswJn-ec94fe
X-Proofpoint-ORIG-GUID: MA_9JxNHkzruARJacqKBaswJn-ec94fe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_02,2025-01-20_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 clxscore=1011 mlxlogscore=813
 lowpriorityscore=4 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0
 adultscore=0 bulkscore=4 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501200094

Currently CONFIG_USB_GADGET_VBUS_DRAW limits the maximum current
drawn from Vbus to be up to 500mA. However USB gadget operating
in SuperSpeed or higher can draw up to 900mA. Also, MaxPower in
ConfigFS takes its default value from this config. Hence increase
the allowed range of CONFIG_USB_GADGET_VBUS_DRAW to 900mA.

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/usb/gadget/Kconfig | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/Kconfig b/drivers/usb/gadget/Kconfig
index 76521555e3c1..904652c37385 100644
--- a/drivers/usb/gadget/Kconfig
+++ b/drivers/usb/gadget/Kconfig
@@ -97,8 +97,8 @@ config USB_GADGET_DEBUG_FS
 	   to conserve kernel memory, say "N".
 
 config USB_GADGET_VBUS_DRAW
-	int "Maximum VBUS Power usage (2-500 mA)"
-	range 2 500
+	int "Maximum VBUS Power usage (2-900 mA)"
+	range 2 900
 	default 2
 	help
 	   Some devices need to draw power from USB when they are
@@ -107,8 +107,11 @@ config USB_GADGET_VBUS_DRAW
 	   such as an AC adapter or batteries.
 
 	   Enter the maximum power your device draws through USB, in
-	   milliAmperes.  The permitted range of values is 2 - 500 mA;
-	   0 mA would be legal, but can make some hosts misbehave.
+	   milliAmperes. The permitted range of values depends on the
+	   connection speed, for SuperSpeed and higher it's 2 - 900 mA,
+	   but connections with High-Speed or slower can draw power
+	   ranging from 2 - 500 mA; 0 mA would be legal, but can make
+	   some hosts misbehave.
 
 	   This value will be used except for system-specific gadget
 	   drivers that have more specific information.
-- 
2.25.1


