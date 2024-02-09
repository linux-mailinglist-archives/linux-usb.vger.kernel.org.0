Return-Path: <linux-usb+bounces-6170-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ABC84F85C
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 16:19:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D373B210F7
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 15:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EDF26E2C1;
	Fri,  9 Feb 2024 15:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=devnull.tasossah.com header.i=@devnull.tasossah.com header.b="cdOKjp8I"
X-Original-To: linux-usb@vger.kernel.org
Received: from devnull.tasossah.com (devnull.tasossah.com [91.121.165.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AEA28DB5
	for <linux-usb@vger.kernel.org>; Fri,  9 Feb 2024 15:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.121.165.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707491963; cv=none; b=Wl3DVEvz7v+5gEW20mrCFi3IpXkP94ZbFfhYbfkeEIGwvefR14UjWTWPXey/LkuFxJOuSgCVyRNCcUcMBI7pQm0C6WB7JAR7XakhcXQ75D8+BTGFtlt4rAs/C+tgiiXyDslx96okSjDgS4NR8rnVPQ8sbLyupvUtAxzdS0JGpLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707491963; c=relaxed/simple;
	bh=r5TtTnFhh9w8NysyYXvYa1/q7OcuuBZemOWtV9PR264=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GFKQJng9cCsOjKP8dAkm4+S8l0tGdJ7H5S0pdC5trBr9pia4HMaTJ+i4d8MNWcZhtScr+5Kpw9+9/0jX8FpuaQHUZuLuW4Mv+0AvSOocUS6vbSyK0LNQ+GU+Fpm95YLYsiMQlWIN06Zrgq90dJ6FRGu1WM5PVcOCts4/I4+FsmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tasossah.com; spf=pass smtp.mailfrom=tasossah.com; dkim=pass (1024-bit key) header.d=devnull.tasossah.com header.i=@devnull.tasossah.com header.b=cdOKjp8I; arc=none smtp.client-ip=91.121.165.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tasossah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tasossah.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=devnull.tasossah.com; s=vps; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BPqdKXa9AyUsOmy+i+Hh8eNoidDlikq7lWB2zzpV9h4=; b=cdOKjp8IsfqYY/eHPHSoqRhXK4
	7CKPHdRBwxinafdjCwufLcArD3oy8n/wyPh8DtfAW+NxKXDNcr6x+JpPpQYib3GtOQOuZaVbCa+bP
	/LFmDjiPbSKmIOuAugXrhzRi2LmT4Pr4KIxNcprT28VuCGPvHYe6afffp/8qYfFAc8dI=;
Received: from [2a02:587:6a0e:de00::d54] (helo=localhost.localdomain)
	by devnull.tasossah.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <tasos@tasossah.com>)
	id 1rYSYZ-007Q6t-1b; Fri, 09 Feb 2024 17:12:47 +0200
From: Tasos Sahanidis <tasos@tasossah.com>
To: linux-usb@vger.kernel.org
Cc: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org,
	Tasos Sahanidis <tasos@tasossah.com>
Subject: [PATCH] usb-storage: Ignore UAS for LaCie Rugged FW USB3
Date: Fri,  9 Feb 2024 17:11:21 +0200
Message-Id: <20240209151121.1004985-1-tasos@tasossah.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This external HDD fails when plugged in to a USB 3 port. Ignoring UAS and
falling back to mass storage resolves this issue.

[   56.338088] scsi 4:0:0:0: Direct-Access     LaCie    Rugged FW USB3   1081 PQ: 0 ANSI: 4
[   56.339162] sd 4:0:0:0: Attached scsi generic sg2 type 0
[   56.343484] sd 4:0:0:0: [sdc] 976773153 512-byte logical blocks: (500 GB/466 GiB)
[   56.343600] sd 4:0:0:0: [sdc] Write Protect is off
[   56.343604] sd 4:0:0:0: [sdc] Mode Sense: 47 00 10 08
[   87.365885] sd 4:0:0:0: tag#26 uas_eh_abort_handler 0 uas-tag 1 inflight: IN
[   87.365897] sd 4:0:0:0: tag#26 CDB: Mode Sense(6) 1a 00 08 00 04 00
[   87.381852] scsi host4: uas_eh_device_reset_handler start
[   87.514256] usb 3-1: reset SuperSpeed USB device number 2 using xhci_hcd
[   87.538153] usb 3-1: LPM exit latency is zeroed, disabling LPM.
[   87.539720] scsi host4: uas_eh_device_reset_handler success
[  118.102578] scsi host4: uas_eh_device_reset_handler start
[  118.102733] sd 4:0:0:0: tag#26 uas_zap_pending 0 uas-tag 1 inflight:
[  118.102745] sd 4:0:0:0: tag#26 CDB: Mode Sense(6) 1a 00 08 00 04 00
[  118.231029] usb 3-1: reset SuperSpeed USB device number 2 using xhci_hcd

Signed-off-by: Tasos Sahanidis <tasos@tasossah.com>
---
 drivers/usb/storage/unusual_uas.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
index 1f8c9b16a0fb..b1d99c57cf8a 100644
--- a/drivers/usb/storage/unusual_uas.h
+++ b/drivers/usb/storage/unusual_uas.h
@@ -45,6 +45,17 @@ UNUSUAL_DEV(0x059f, 0x105f, 0x0000, 0x9999,
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_NO_REPORT_OPCODES | US_FL_NO_SAME),
 
+/*
+ * Patch by Tasos Sahanidis <tasos@tasossah.com>
+ * UAS hangs during Mode Sense(6). The quirks for the similar "Rugged USB3-FW"
+ * disk (US_FL_NO_REPORT_OPCODES | US_FL_NO_SAME) do not resolve the issue.
+ */
+UNUSUAL_DEV(0x059f, 0x104b, 0x0000, 0x9999,
+		"LaCie",
+		"Rugged FW USB3",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_IGNORE_UAS),
+
 /* Reported-by: Julian Sikorski <belegdol@gmail.com> */
 UNUSUAL_DEV(0x059f, 0x1061, 0x0000, 0x9999,
 		"LaCie",
-- 
2.25.1


