Return-Path: <linux-usb+bounces-29408-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 54335BE886E
	for <lists+linux-usb@lfdr.de>; Fri, 17 Oct 2025 14:13:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AA0A235B742
	for <lists+linux-usb@lfdr.de>; Fri, 17 Oct 2025 12:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A302E32ABC3;
	Fri, 17 Oct 2025 12:13:06 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11F5332EBB
	for <linux-usb@vger.kernel.org>; Fri, 17 Oct 2025 12:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760703186; cv=none; b=dSO3Rl/c2P/pZG2VqsxJXXvYvl4Ppr1L7WkzEhZBb48YoCk5scfoAGxX8j5ulInqdp5g5uPDCQQLp9wzGKGyx0WS3i6CF5i+6pcVGZRxjB0WTPNvMmY8iijigd2/wVkPy4B5XGcuOpaqlLkIt9rXQgT8kG2evzsH5h4pfmWDbU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760703186; c=relaxed/simple;
	bh=8mg+fNbsu+KeGEu7BuN5o0N6+N/QSVNQ6UDJqE5kDiE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=af1D96jU7ypIXxrQNNIC5y3fMOpGhRUaQNJkaPu2okyTg96QQQ+DQxYGgUSZENC92zwwc1Ys33M64NlgVxeWFMvV0jXrkhgvylhDUs0nJE3GtpnOKyOGQ3ZpAuhmyV/8JkGn4zaijIT8B7D5feQu9fGbTFm6q0svuJGuMB8pEps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-27d3540a43fso19880245ad.3
        for <linux-usb@vger.kernel.org>; Fri, 17 Oct 2025 05:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760703183; x=1761307983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AbvlmTTew8suBTsuq02Ewef+SzGUQT2VDP01I1YDZS4=;
        b=QkcAb7EM6YFgYl7qbnQEgrkURFyHeSosygHlRAKZd1QRduNB2NnVDnGpn5buOwIDlW
         0oQoH/fzs6n0jIsbm9wcCuEqjYJwKo+/MhZUT5w4C3bz3I1jVen71JJ/0x1uUIM0xowD
         sJYCyip05xcitn0GaG9SWPzpW98SESGq4CHynQVF0G+miJzk72Phevy83V9JP+YLA5Py
         Q7C5rj8eQQq7IcoRBVVQ2aNKFVyGMcuV03Ohfw01KSbVVXdAdAGFPsCldR0q5oYW0AqE
         1eZs/njqs/xo9JKgr00aKzZ30SE6/WkE+RbvBU0Ny/CI8JYtIbgLUceDzUqKwQD0sVg8
         42qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIIJXliyqJcLxUbjITMOfsc/AH5vpFWH7bx4u0kF4j07YniSsUVKRx4TtP6IjGLRmS536CuCq8TGs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKnTRu8j3o72vNKvznwBQyBGBlwYeXKe3FL+sdb8vyd6aJrynq
	Id2gZRjHTJBp6hb3/qlxF172p/NtUm+eQnIuFbbejSf/82Dg5fxbAUtD
X-Gm-Gg: ASbGncuNqt5OI+YoUb8RyeewHJ4pPUzignWCfUnAw2sa/L3mTvDp4AYnHYWQvJVYCRV
	c0W55afZNt17qp41gOql2HnW6foeh9PNoowgGNLtpRr8cXOWN7fW0uQBH/wgduhbzV+mJDdDjlE
	F1ne9TwHWFYnvQvr2znADAirUlgMFLUIBsfRSXh9+k4y12lFjKcj+v6CZCn8xD2HKuDAtTGXTte
	TGcLezVPs3brWtRfhTgXKNOrTCER8XuMX/0yTlnPO16Fbs6kwqKTcOzdIiMYcRjNxQPYFT6gild
	xpYpL6Qh+NbE9LH11rnLIm81P8R67xwLj9r9a4HihQWiZSxyDPZgrEGe0h5NkM1jVoeQ3FpqYoS
	bDURkPgiNjZCFdT1MPeEhu4GhJjZ5biR+0QLFY511SeZgpUOnFFHapVdWlomaeaROa9L86bXoqc
	8sloYUKHQUtvGSiMCg1mExfJzEfiIky9JkFNHa7A==
X-Google-Smtp-Source: AGHT+IHfpLf94DuGp8KVk2x2Wh18b+nC6KvwnJiN04mhJAqBLprpNtm8s3d7xOrQlj13RcC9M3vsrw==
X-Received: by 2002:a17:902:f552:b0:269:ae5a:e32b with SMTP id d9443c01a7336-290c9ca741bmr45567155ad.13.1760703182994;
        Fri, 17 Oct 2025 05:13:02 -0700 (PDT)
Received: from localhost.localdomain ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2923d9dc3dcsm281815ad.28.2025.10.17.05.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 05:13:02 -0700 (PDT)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To: mathias.nyman@intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hongyu Xie <xiehongyu1@kylinos.cn>
Subject: [PATCH v1] usb: xhci: limit run_graceperiod for only usb 3.0 devices
Date: Fri, 17 Oct 2025 20:12:54 +0800
Message-Id: <20251017121254.2887283-1-xiehongyu1@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

run_graceperiod blocks usb 2.0 devices from auto suspending after
xhci_start for 500ms.

Log shows:
[   13.387170] xhci_hub_control:1271: xhci-hcd PNP0D10:03: Get port status 7-1 read: 0x2a0, return 0x100
[   13.387177] hub_event:5779: hub 7-0:1.0: state 7 ports 1 chg 0000 evt 0000
[   13.387182] hub_suspend:3903: hub 7-0:1.0: hub_suspend
[   13.387188] hcd_bus_suspend:2250: usb usb7: bus auto-suspend, wakeup 1
[   13.387191] hcd_bus_suspend:2279: usb usb7: suspend raced with wakeup event
[   13.387193] hcd_bus_resume:2303: usb usb7: usb auto-resume
[   13.387296] hub_event:5779: hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
[   13.393343] handle_port_status:2034: xhci-hcd PNP0D10:02: handle_port_status: starting usb5 port polling.
[   13.393353] xhci_hub_control:1271: xhci-hcd PNP0D10:02: Get port status 5-1 read: 0x206e1, return 0x10101
[   13.400047] hub_suspend:3903: hub 3-0:1.0: hub_suspend
[   13.403077] hub_resume:3948: hub 7-0:1.0: hub_resume
[   13.403080] xhci_hub_control:1271: xhci-hcd PNP0D10:03: Get port status 7-1 read: 0x2a0, return 0x100
[   13.403085] hub_event:5779: hub 7-0:1.0: state 7 ports 1 chg 0000 evt 0000
[   13.403087] hub_suspend:3903: hub 7-0:1.0: hub_suspend
[   13.403090] hcd_bus_suspend:2250: usb usb7: bus auto-suspend, wakeup 1
[   13.403093] hcd_bus_suspend:2279: usb usb7: suspend raced with wakeup event
[   13.403095] hcd_bus_resume:2303: usb usb7: usb auto-resume
[   13.405002] handle_port_status:1913: xhci-hcd PNP0D10:04: Port change event, 9-1, id 1, portsc: 0x6e1
[   13.405016] hub_activate:1169: usb usb5-port1: status 0101 change 0001
[   13.405026] xhci_clear_port_change_bit:658: xhci-hcd PNP0D10:02: clear port1 connect change, portsc: 0x6e1
[   13.413275] hcd_bus_suspend:2250: usb usb3: bus auto-suspend, wakeup 1
[   13.419081] hub_resume:3948: hub 7-0:1.0: hub_resume
[   13.419086] xhci_hub_control:1271: xhci-hcd PNP0D10:03: Get port status 7-1 read: 0x2a0, return 0x100
[   13.419095] hub_event:5779: hub 7-0:1.0: state 7 ports 1 chg 0000 evt 0000
[   13.419100] hub_suspend:3903: hub 7-0:1.0: hub_suspend
[   13.419106] hcd_bus_suspend:2250: usb usb7: bus auto-suspend, wakeup 1
[   13.419110] hcd_bus_suspend:2279: usb usb7: suspend raced with wakeup event
[   13.419112] hcd_bus_resume:2303: usb usb7: usb auto-resume
[   13.420455] handle_port_status:2034: xhci-hcd PNP0D10:04: handle_port_status: starting usb9 port polling.
[   13.420493] handle_port_status:1913: xhci-hcd PNP0D10:05: Port change event, 10-1, id 1, portsc: 0x6e1
[   13.425332] hcd_bus_suspend:2279: usb usb3: suspend raced with wakeup event
[   13.431931] handle_port_status:2034: xhci-hcd PNP0D10:05: handle_port_status: starting usb10 port polling.
[   13.435080] hub_resume:3948: hub 7-0:1.0: hub_resume
[   13.435084] xhci_hub_control:1271: xhci-hcd PNP0D10:03: Get port status 7-1 read: 0x2a0, return 0x100
[   13.435092] hub_event:5779: hub 7-0:1.0: state 7 ports 1 chg 0000 evt 0000
[   13.435096] hub_suspend:3903: hub 7-0:1.0: hub_suspend
[   13.435102] hcd_bus_suspend:2250: usb usb7: bus auto-suspend, wakeup 1
[   13.435106] hcd_bus_suspend:2279: usb usb7: suspend raced with wakeup event

usb7 and other usb 2.0 root hub were rapidly toggling between suspend
and resume states. More, "suspend raced with wakeup event" confuses people.

So, limit run_graceperiod for only usb 3.0 devices

Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
 drivers/usb/host/xhci-hub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index b3a59ce1b3f4..5e1442e91743 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1671,7 +1671,7 @@ int xhci_hub_status_data(struct usb_hcd *hcd, char *buf)
 	 * SS devices are only visible to roothub after link training completes.
 	 * Keep polling roothubs for a grace period after xHC start
 	 */
-	if (xhci->run_graceperiod) {
+	if (hcd->speed >= HCD_USB3 && xhci->run_graceperiod) {
 		if (time_before(jiffies, xhci->run_graceperiod))
 			status = 1;
 		else
-- 
2.25.1


