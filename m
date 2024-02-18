Return-Path: <linux-usb+bounces-6689-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D1285959C
	for <lists+linux-usb@lfdr.de>; Sun, 18 Feb 2024 09:25:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1B6A282C2B
	for <lists+linux-usb@lfdr.de>; Sun, 18 Feb 2024 08:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2667BF9CF;
	Sun, 18 Feb 2024 08:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eLqIpQAp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09464CA62
	for <linux-usb@vger.kernel.org>; Sun, 18 Feb 2024 08:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708244723; cv=none; b=jor56fzu6zHvyZFdtryInjffI3ThPfludfCbChDVu5TWoMpfjptJIlSkc2XzB9rbZIG5YstHRYK8ZRUV+N4mIfVpGtPk9kZOINiCYg7tug0Icxh85rUNRBB/XzmIwI4MLbefQf6lQKOmrU3q5NYf5fkx2xO456wDGXAZnrR5ONM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708244723; c=relaxed/simple;
	bh=grhQeXDPjBUwHUmA5OGumLsZ/JUYB4TcUJx2gqBQvKg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KgkwWkIeB2i8TP73HfQUqYKyL/oh1S0VPgeYcug4GgRY+nuQhlWuMwCOP16PzbfYebeG2w+2p2AA+ON4iAQ2yH/e3CfDSljNX9BS6kJFUSgaLXexBOsylhJDJzW/nItXI/NYbUgsOoZrs4fpSxYpMZr0Tq3nhlYtQ8fmZ0XDcHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eLqIpQAp; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5611e54a92dso4460281a12.2
        for <linux-usb@vger.kernel.org>; Sun, 18 Feb 2024 00:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708244720; x=1708849520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOBsVVWHmB3VNd7FB4s/vpPxDIRFvDYmgDJyc9czWLc=;
        b=eLqIpQAprFlpdSeJChUwBSY6ln9MGMh00qDTdw6KlLg9LUzMbic7HDAtQ1xyGIiBPK
         ORBxqMQmvKw05g21CTUPH5lRsyxGHUzwG5hjIeFZr9aGFtMbfV+eBlvfxSo2CljaOb8k
         WNdZDlD8SW+HOL5tZrJFS77rfwv2MmUar9ML3xZDAd0rULamDWpaAxxg2E3FGdC2LKie
         ue9UdKgiCmcVBoj5j+UKIhK5jBTlMFuNKOpLCSbPfnJxNX20FZxSDrzmTdVvTw7phKeW
         cGQdJobNKs3XWqy0DAducmkDVttZcjVzZ3t4rLpthB/Zog3bJZOTc3vQlxbk2BeqSXIG
         Stkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708244720; x=1708849520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BOBsVVWHmB3VNd7FB4s/vpPxDIRFvDYmgDJyc9czWLc=;
        b=bVx2YQRdO5myMa3CZQRoD36dwob3WyJFnNQlA67RAEjIe3B89BkJ6iBtIMlX6vPseg
         F2h/+Au2sgmDdrzl6GWxnfQUaiZdD+cUvNmjQSfDSl0x36RHmxVs/Byg5IS3Spu3SCPb
         g+zaf+UdXfGVqX7qQDc8dt2CJyuGebOrc8lgx6AqKtrK9Fx27Fyc9Tv0Dn0KdPLnOXTe
         qpKdOlJu8za0QxmVw8GzdfIu4yUPQ0RXYZtvpZYC86vOgQMO+bk6DvK0DCzmv90o2AbL
         igconosuSvdHAXSjJ2ksq8b1iJYzqBiK6IXYGCxrvGV6XzoFghGj4lYEyj4oOGhU76G1
         QpbA==
X-Forwarded-Encrypted: i=1; AJvYcCXlXRHNa7eHSJHvwhYQ6/fH6H9nl7Q32A/sTOBUlu5mOFDKCu7U13/Y13cnd0hkXB3yOIs6irMO5G5iuf37kQxLvExXgJRkcDnq
X-Gm-Message-State: AOJu0YyEv3YgA1LZMr8T84ZWwr3txhIxpb5YKySgnbCpM6/s36ae54bD
	zUdB5yUfSSadWaFYn4bjCreQtTcpCRVCq9FxhRMAF+hGGkpCpLSXzAY8sJ3I
X-Google-Smtp-Source: AGHT+IFNNrw0v5sBGLvo5HdX8AMk8VHlnh5LNNynlSq6il8ziRmjFXK0pq5i9dG1uJyjm789fyJMBQ==
X-Received: by 2002:aa7:d956:0:b0:564:3820:fd92 with SMTP id l22-20020aa7d956000000b005643820fd92mr1327617eds.15.1708244720100;
        Sun, 18 Feb 2024 00:25:20 -0800 (PST)
Received: from foxbook (bfd245.neoplus.adsl.tpnet.pl. [83.28.41.245])
        by smtp.gmail.com with ESMTPSA id cs1-20020a0564020c4100b005617cebd051sm1578526edb.78.2024.02.18.00.25.19
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 18 Feb 2024 00:25:19 -0800 (PST)
Date: Sun, 18 Feb 2024 09:25:15 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Subject: [PATCH v2] USB: document some API requirements on disconnection
Message-ID: <20240218092515.7635ff8c@foxbook>
In-Reply-To: <20240218005436.46a4ddca@foxbook>
References: <20240218005436.46a4ddca@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

A call to usb_set_interface() crashes if the device is deallocated
concurrently, such as due to physical removal or a serious IO error.
It could also interfere with other drivers using the device if the
current driver is unbound before the call is finished.

Document the need to delay driver unbinding until this call returns,
which solves both issues.

Document the same regarding usb_clear_halt(), which is equally known
to be routinely called by drivers.

Explicitly mention finishing pending operations in the documentation
of the driver disconnect callback.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---

v2 changes:
- I noticed and fixed a typo in existing documentation near my change
- reworded the callbacks.rst change to focus on actions, not conditions
- I looked for drivers calling other functions from message.c and found
  that usb_clear_halt() is in widespread use and has the same needs


 Documentation/driver-api/usb/callbacks.rst | 6 ++++--
 drivers/usb/core/message.c                 | 5 ++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/driver-api/usb/callbacks.rst b/Documentation/driver-api/usb/callbacks.rst
index 2b80cf54bcc3..927da49b8f00 100644
--- a/Documentation/driver-api/usb/callbacks.rst
+++ b/Documentation/driver-api/usb/callbacks.rst
@@ -99,8 +99,10 @@ The disconnect() callback
 This callback is a signal to break any connection with an interface.
 You are not allowed any IO to a device after returning from this
 callback. You also may not do any other operation that may interfere
-with another driver bound the interface, eg. a power management
-operation.
+with another driver bound to the interface, eg. a power management
+operation. Outstanding operations on the device must be completed or
+aborted before this callback may return.
+
 If you are called due to a physical disconnection, all your URBs will be
 killed by usbcore. Note that in this case disconnect will be called some
 time after the physical disconnection. Thus your driver must be prepared
diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 077dfe48d01c..dc7c8c258870 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -1198,6 +1198,8 @@ EXPORT_SYMBOL_GPL(usb_get_status);
  * same status code used to report a true stall.
  *
  * This call is synchronous, and may not be used in an interrupt context.
+ * If a thread in your driver uses this call, make sure your disconnect()
+ * method can wait for it to complete.
  *
  * Return: Zero on success, or else the status code returned by the
  * underlying usb_control_msg() call.
@@ -1516,7 +1518,8 @@ void usb_enable_interface(struct usb_device *dev,
  * This call is synchronous, and may not be used in an interrupt context.
  * Also, drivers must not change altsettings while urbs are scheduled for
  * endpoints in that interface; all such urbs must first be completed
- * (perhaps forced by unlinking).
+ * (perhaps forced by unlinking). If a thread in your driver uses this call,
+ * make sure your disconnect() method can wait for it to complete.
  *
  * Return: Zero on success, or else the status code returned by the
  * underlying usb_control_msg() call.
-- 
2.43.0


