Return-Path: <linux-usb+bounces-6684-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF328593A3
	for <lists+linux-usb@lfdr.de>; Sun, 18 Feb 2024 00:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4322281315
	for <lists+linux-usb@lfdr.de>; Sat, 17 Feb 2024 23:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A9BA80040;
	Sat, 17 Feb 2024 23:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eqjp+ARC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BEE7E586
	for <linux-usb@vger.kernel.org>; Sat, 17 Feb 2024 23:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708214083; cv=none; b=WqFtAzPcpNbdpB5n5VFqLURdUowWfNygk5BOaEV2rFgJLzFcbUsYW3VCyLYMah47Dy5EdAouQwxSrzn+Hf4f8E502xlHT3Uy6q3636vzKmYYmDMTf+CZTmwsByqCKeijvGiAdYp0K7Pn/JFdd13RuJ12IFgKZ2i+DymuKvoaupo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708214083; c=relaxed/simple;
	bh=BOXeVqxTGgEg23W6EIOmFDsWJ81uHUxKGPXOyjfsH+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PXJ8vwKNvn+KQV2XjL3JzLhM23e2kZKDXjZFpoAhA62jkBm2FIEnfTxgyKb7kmld5ZIkeLA3R/TEsKoYTPDxYPoAQeLE5f2yrj5uWr1HqWGCZwRiC6t9VZmK98c1Fjx0lWCvddFm+uOWvLcGFwj2HkfCdh6T2zEliyi7TtOrLkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eqjp+ARC; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-607d9c4fa90so30297757b3.2
        for <linux-usb@vger.kernel.org>; Sat, 17 Feb 2024 15:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708214081; x=1708818881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9g92BpN4bkhZXzxPqKpmrzeCbobpwF9nhABnxaCb0CY=;
        b=Eqjp+ARCpw7IdgRqX7PqTzR/+8AFm1Z2Rls8TBQlCFhmoG/jHsyNWrmBki3gmDx6eJ
         yVvp7PVvRCXq+A/wiF7Pw+l6yA/S+8TAgn1U5G2+VGfjPe9GClaF7MqVuL8v8NbZ/Z2y
         AtoJmnLA9UZGjuVXix8r5l0qfWeXcoS1IsF3Hvn+m4ECQD+Bj1h/e6sWASQx7gG2GhX7
         xqP0WMDw4vDo9ynOaa30w5qu4dy3oZF3Wj9OIrA2/eNJhi4N4KOsvsEBZinWyuTI0fnf
         UGbY4xD0lBJ0TO3igBmAli8P5aVbvirUkHCBg3UoBI0c5vJKxcI9GolvN5nXYvDwLNO7
         ISXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708214081; x=1708818881;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9g92BpN4bkhZXzxPqKpmrzeCbobpwF9nhABnxaCb0CY=;
        b=JcRifK4/IdPimSfGpvtwe3fiyLLZO2wLsJGGvP6QIrqvvFzYLSmalX8h3V2kUwC6xD
         6bhPLlz6zH7FIQx4OMD83viNggx5zQsdFLNv1nifU1PALIyjzPX/Z+UlCCDvtubQin0d
         skVc0OzXReAod+0AeQZoLsfYHsvv/FkR1rubfJ9eWS8WYeikXF/3Cett9NgBLWGaqicW
         8iLpVwOL95gHU8rdPBU4EWxZ6//tIXqPa1V64AD/GswA/CozcrkWF/s6qH30buS4zL4w
         iJ/QSwfTBathQGwcnCJQB+mO6Y/o4ubbQ/G8DdW2EP8l11MpMwkbP4vyKSXNNEcy6txD
         B84A==
X-Forwarded-Encrypted: i=1; AJvYcCVYL9qCtgtkCR2I51s7Q6fV5ysHfnVyWlBJiHodypAaf7Q4t/QDwi8LhaPycJ/uSMj5C40OeEuJgZvypP10PedKFtjX/bUT+9G0
X-Gm-Message-State: AOJu0YxybnthBTHF+nMbGYY4WY4nLwr8Q+6pYOjxJ7eFy9hTvcj89dVY
	KHoqsi58hiWWoX8nTgwYuDXCRf0So4C0nxnZNjSxClUBfYM5fBTF
X-Google-Smtp-Source: AGHT+IFDI7hvduZsdBoKVvey/LvHVwvH42iGWs8fRRVKGzcx5EcvGQ4mH/n58YXjf9BoBgWHOq4Byg==
X-Received: by 2002:a81:99d5:0:b0:607:90ec:f77b with SMTP id q204-20020a8199d5000000b0060790ecf77bmr8679692ywg.7.1708214081118;
        Sat, 17 Feb 2024 15:54:41 -0800 (PST)
Received: from foxbook (bfd245.neoplus.adsl.tpnet.pl. [83.28.41.245])
        by smtp.gmail.com with ESMTPSA id x69-20020a0dd548000000b00607843d95bfsm994198ywd.56.2024.02.17.15.54.40
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2024 15:54:40 -0800 (PST)
Date: Sun, 18 Feb 2024 00:54:36 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Subject: [PATCH] USB: document requirements of usb_set_interface on
 disconnection
Message-ID: <20240218005436.46a4ddca@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

A call to usb_set_interface() crashes if the device is deallocated
concurrently, such as due to physical removal or serious IO error.
It could also interfere with other drivers using the device if the
current driver is unbound before the call is done.

Document the need to delay driver unbinding until this call returns,
which solves both issues.

Explicitly mention finishing pending operations in the documentation
of the driver disconnect callback.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 Documentation/driver-api/usb/callbacks.rst | 4 +++-
 drivers/usb/core/message.c                 | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/usb/callbacks.rst b/Documentation/driver-api/usb/callbacks.rst
index 2b80cf54bcc3..c7fa55375e9a 100644
--- a/Documentation/driver-api/usb/callbacks.rst
+++ b/Documentation/driver-api/usb/callbacks.rst
@@ -100,7 +100,9 @@ This callback is a signal to break any connection with an interface.
 You are not allowed any IO to a device after returning from this
 callback. You also may not do any other operation that may interfere
 with another driver bound the interface, eg. a power management
-operation.
+operation. Outstanding operations on the device must complete or be
+aborted before this callback returns.
+
 If you are called due to a physical disconnection, all your URBs will be
 killed by usbcore. Note that in this case disconnect will be called some
 time after the physical disconnection. Thus your driver must be prepared
diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 077dfe48d01c..08acebd51823 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -1516,7 +1516,8 @@ void usb_enable_interface(struct usb_device *dev,
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

