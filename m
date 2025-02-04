Return-Path: <linux-usb+bounces-20080-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F29D4A26FB1
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 11:59:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 723297A1B62
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 10:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADCD620C005;
	Tue,  4 Feb 2025 10:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oliS+NTu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A15209F5B
	for <linux-usb@vger.kernel.org>; Tue,  4 Feb 2025 10:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738666766; cv=none; b=MaIGywNBTL3Nj4mIavLGpzyO0F336lzh75Pc7QfqGmrKB/yMSCPk7mKrTGVKOrY4tT0lk1ZLpOsG5XGgc9uZW1Wd5auZP+JaFeGuhhbfa8jbosLJNBDTm2oWFxI14oYyjAVBm7Lrl76Lx7lU/1c8bu0cSCeldLfqzrktz6jBUDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738666766; c=relaxed/simple;
	bh=KDUpqFH60In99EOYxcvh8+1IiNmgCdzqDbEQmebOkZo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=n91XpxpvY+CL1pO0PFoV8gFdGXq2384CvbKdO+GVICqbNgFdtxIRMgCdcSRULwBu9sppIaOwdc6hbh9bKlmNd+FoCXoFFsgX4EiNX+WzMbeyCXLGOtXh2EvHRbjoAphWZ6Tdr1mcH1ILDA6lB5QWpsQQ6NZGwvv5n+kPZQbHw9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oliS+NTu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5149sgdS005808
	for <linux-usb@vger.kernel.org>; Tue, 4 Feb 2025 10:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Bbk6v/28CZWZB/e8V3KywwDq5m0DSq4iiyz
	z/FZspds=; b=oliS+NTuxK6FfwG3/cxiqqd9Xm8pp5WBNBIMm6b3tuDEqRMyMPW
	D9ygEJtnm+3iG9X2uovhNKbRwdP28AmJgnBMxoNZQrnN4x2vek9syfJB8EjaWa4Q
	8v0NWTP+ycV737y57sNRq+TGw9Dnbu0eH0U1ZE69mpysPkX15K8QhX1Dp2EvgMwT
	t9MdEV/nMzelUkdFhGGgMMTksW0a7RVMSG628DYMgx9CQx+3wI7DXowPJevJ9NEi
	Lr1zA3rYZrKSpuPCdxRX7yOMkwB5CpgxT5tTwCrZ60VY00aw23YEtY1BqHRPJLLK
	DZxFPEVLpQ4un+r3C/9QKWLmy+xVnnvI0wg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kgp7050m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 04 Feb 2025 10:59:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ef91d5c863so10571857a91.2
        for <linux-usb@vger.kernel.org>; Tue, 04 Feb 2025 02:59:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738666760; x=1739271560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bbk6v/28CZWZB/e8V3KywwDq5m0DSq4iiyzz/FZspds=;
        b=YA2qOFmGm/LSo8LzeNdPbIi8ojHBB1e3hjPeS17KMptqvHLzaRHselyccAUe8HB8xc
         x6+X7o81cn9eEZoXVFfKTMg3QNMFAyiUXBxOlBRaUh87DwmwlZMHxHvCTJ1J7jikPyjb
         MqOWR7HTOwGWcJKa58Pg/zGlp3HOX6JnXFeyaGwKj3bA2PNgaz7hNNlC088cHWpsv4Ye
         OAIO34m/F4m8reAjBxNs9HfG4kmPtIXrObuAB+5VWWyf465nAyswkT0OGvmk1dzE9qX9
         rjxIakA90nfShHUnrPcmScO1/2rUh3qvq7Hy6s1IJhrJNBLUTm0Irw2P3PvSQhSyBRb3
         mvvA==
X-Gm-Message-State: AOJu0YynGQI6o4cOczTGOGmiuIKDC9wGsiLCKXjUm5w1P7IxXJ5BGUun
	uRET9hsjJaT/KLJQAAHujioP32kpJWu0IBbPNftDHepyq7leQlLqCqHVKx/XsOCJ5gnuumeSmD9
	fzftE2+4QlVaia+4ovE1gWbZRGq9LXmqsV3pA3HTquhNvozkzd1ZoeWn057I=
X-Gm-Gg: ASbGncv3IALXSU57nYclnA/N7Kq7tBqpU4kGqPaUkGMspMB8ZERpbbpoeAWO2CeccMF
	Dv+0wOWuKzDVomjNOJ67m5AILdGldGhP/qtszV0NWH/uOmqW89naQv1WD1iGAnotEzk52rXtS+O
	5px66KC4PK7TYbpkLi+zeen2A3wsRAk6h658pZKLIcRJHEy6s55ktlob+NUjnDxI0BNTMDyituK
	cYeD4TNzOYB7vQBkyoCkr6qNeMDuE1qNJZgcYE1yvLd/viyrKj6u5KWKZLEC4cIgCx4f3ZWnoXP
	2r3nzEQ4dpt0sRH7BMlRWMeBYxmPJCrp2w==
X-Received: by 2002:a17:90b:2f44:b0:2ee:c91a:ad05 with SMTP id 98e67ed59e1d1-2f83abc3987mr34859257a91.3.1738666760461;
        Tue, 04 Feb 2025 02:59:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDFBGFgvL9ZTIMVPksGB4FYma4HsKeELqR3L2h5d2h1EDl6nl6eH11BUBbOegxde5u3k9NJQ==
X-Received: by 2002:a17:90b:2f44:b0:2ee:c91a:ad05 with SMTP id 98e67ed59e1d1-2f83abc3987mr34859233a91.3.1738666760104;
        Tue, 04 Feb 2025 02:59:20 -0800 (PST)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f8489d65a2sm11930665a91.29.2025.02.04.02.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 02:59:19 -0800 (PST)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Peter Korsgaard <peter@korsgaard.com>,
        Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>, stable@vger.kernel.org
Subject: [PATCH RFC] usb: gadget: Set self-powered based on MaxPower and bmAttributes
Date: Tue,  4 Feb 2025 16:29:08 +0530
Message-Id: <20250204105908.2255686-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HK_bXp7_roEM2jiMivteTARrlMx3ZyXm
X-Proofpoint-GUID: HK_bXp7_roEM2jiMivteTARrlMx3ZyXm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_05,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=386 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040087

Currently the USB gadget will be set as bus-powered based solely
on whether its bMaxPower is greater than 100mA, but this may miss
devices that may legitimately draw less than 100mA but still want
to report as bus-powered. Similarly during suspend & resume, USB
gadget is incorrectly marked as bus/self powered without checking
the bmAttributes field. Fix these by configuring the USB gadget
as self or bus powered based on bmAttributes, and explicitly set
it as bus-powered if it draws more than 100mA.

Cc: stable@vger.kernel.org
Fixes: 5e5caf4fa8d3 ("usb: gadget: composite: Inform controller driver of self-powered")
Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/usb/gadget/composite.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index bdda8c74602d..1fb28bbf6c45 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -1050,10 +1050,11 @@ static int set_config(struct usb_composite_dev *cdev,
 	else
 		usb_gadget_set_remote_wakeup(gadget, 0);
 done:
-	if (power <= USB_SELF_POWER_VBUS_MAX_DRAW)
-		usb_gadget_set_selfpowered(gadget);
-	else
+	if (power > USB_SELF_POWER_VBUS_MAX_DRAW ||
+	    !(c->bmAttributes & USB_CONFIG_ATT_SELFPOWER))
 		usb_gadget_clear_selfpowered(gadget);
+	else
+		usb_gadget_set_selfpowered(gadget);
 
 	usb_gadget_vbus_draw(gadget, power);
 	if (result >= 0 && cdev->delayed_status)
@@ -2615,7 +2616,9 @@ void composite_suspend(struct usb_gadget *gadget)
 
 	cdev->suspended = 1;
 
-	usb_gadget_set_selfpowered(gadget);
+	if (cdev->config->bmAttributes & USB_CONFIG_ATT_SELFPOWER)
+		usb_gadget_set_selfpowered(gadget);
+
 	usb_gadget_vbus_draw(gadget, 2);
 }
 
@@ -2649,8 +2652,11 @@ void composite_resume(struct usb_gadget *gadget)
 		else
 			maxpower = min(maxpower, 900U);
 
-		if (maxpower > USB_SELF_POWER_VBUS_MAX_DRAW)
+		if (maxpower > USB_SELF_POWER_VBUS_MAX_DRAW ||
+		    !(cdev->config->bmAttributes & USB_CONFIG_ATT_SELFPOWER))
 			usb_gadget_clear_selfpowered(gadget);
+		else
+			usb_gadget_set_selfpowered(gadget);
 
 		usb_gadget_vbus_draw(gadget, maxpower);
 	} else {
-- 
2.25.1


