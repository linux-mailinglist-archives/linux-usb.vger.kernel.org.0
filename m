Return-Path: <linux-usb+bounces-19387-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C7CA12F88
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 01:18:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 062B7166133
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 00:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C3EB67E;
	Thu, 16 Jan 2025 00:18:30 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from c.mail.sonic.net (c.mail.sonic.net [64.142.111.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C804CBA53;
	Thu, 16 Jan 2025 00:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.142.111.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736986709; cv=none; b=mg42Yy1U59Rjm2KY0qjjEj2F6eZ5PTyP32zQIdoEIpuXlbfY+tCHSijerdJQ0hArQYWOv3I5nGHbHJn127KZyrLRJAmEUjBiHYaXv6kuCAPlS1pRSV77yMUQ+zlzetgb2jawaL5Cz0TNf9YFgwPoSmtMJwqshfo+GVC3eww8B3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736986709; c=relaxed/simple;
	bh=1nVlQPNYY1NMip5DppsjUt5iTpJVB+KpKtdw1nju3OM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M5lJYDLWj+74ylDs3liPfrCjwMSCW5UV23K0H4gq8W/CAHDME6Xsf8eBSXLCqUwOpb4Qa4umUHi5jMPI1ilMYOro3ZsZKQfXtTGjh+LFIVUtnmLgGTG/Ry3XvQlclNOt0TZTqK1eBxMB6LXiFcfjsNTzYMpGIIHwda95g7WO2qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nom.one; spf=pass smtp.mailfrom=nom.one; arc=none smtp.client-ip=64.142.111.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nom.one
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nom.one
Received: from 192-184-191-93.static.sonic.net (192-184-191-93.static.sonic.net [192.184.191.93])
	(authenticated bits=0)
	by c.mail.sonic.net (8.16.1/8.16.1) with ESMTPA id 50G0IMCl011238;
	Wed, 15 Jan 2025 16:18:22 -0800
From: Forest <forestix@nom.one>
To: linux-kernel@vger.kernel.org
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org,
        regressions@lists.linux.dev
Subject: [PATCH] USB: Add LPM quirk for sony xperia xz1 compact
Date: Wed, 15 Jan 2025 16:18:22 -0800
Message-ID: <10kgojpeckdq0pb4d95k1prma49du5itre@sonic.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Sonic-CAuth: UmFuZG9tSVYiFRQphqnthcKQScW74YG+DR9q9ojiZMfl32P5G6z0bu2PuGvpvcY9C8ArWUt/E0lJrVrwD8VoB4/tr2hAbMIq
X-Sonic-ID: C;Xjw3ZZ/T7xGoYaxkvwPenQ== M;WPBRZZ/T7xGoYaxkvwPenQ==
X-Spam-Flag: No
X-Sonic-Spam-Details: 0.0/5.0 by cerberusd

Since USB 2 LPM was enabled for this device by 63a1f8454962
("xhci: stored cached port capability values in one place"),
the fastboot tool for communicating with Android bootloaders no longer
works reliably. Various fastboot commands are affected, including the
following, which usually reproduces the problem within two tries:

  fastboot getvar kernel

A typical error message when that command fails:

  getvar:kernel  FAILED (remote: 'GetVar Variable Not found')

Adding the quirk resolves the regression. No drawbacks are expected,
since the device uses different USB product IDs outside of fastboot
mode, and since fastboot commands worked until LPM was enabled by the
aforementioned commit.

Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/hk8umj9lv4l4qguftdq1luqtdrpa1gks5l@sonic.net
Signed-off-by: Forest <forestix@nom.one>
---
 drivers/usb/core/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 13171454f959..375a64e7e188 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -432,6 +432,9 @@ static const struct usb_device_id usb_quirk_list[] = {
 	{ USB_DEVICE(0x0c45, 0x7056), .driver_info =
 			USB_QUIRK_IGNORE_REMOTE_WAKEUP },
 
+	/* Sony Xperia XZ1 Compact (lilac) smartphone in fastboot mode */
+	{ USB_DEVICE(0x0fce, 0x0dde), .driver_info = USB_QUIRK_NO_LPM },
+
 	/* Action Semiconductor flash disk */
 	{ USB_DEVICE(0x10d6, 0x2200), .driver_info =
 			USB_QUIRK_STRING_FETCH_255 },

base-commit: 619f0b6fad524f08d493a98d55bac9ab8895e3a6
-- 
2.39.5


