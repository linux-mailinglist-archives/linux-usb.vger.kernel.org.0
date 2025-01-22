Return-Path: <linux-usb+bounces-19647-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2DFA19929
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 20:26:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E36C63A27BE
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 19:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BCD02153F1;
	Wed, 22 Jan 2025 19:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="BlgQSrd2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6112153ED
	for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2025 19:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737573983; cv=none; b=s0UDcBzsyoyPnhwEdTWwXBl8pUT2eMp2XeM+poXF6pb39f5V7qgEWArzy28tWiO9t6QAXLuaBlTccPc9D3WtNHsEFV+/H8ePo+YPf9zSkAfvlEX69mg5A4gjYjmjwo9RYG5A8ND1XsbmqY9PHD2b5C8dTcUssHMNjTvr6IqJE/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737573983; c=relaxed/simple;
	bh=Z6tBA5RtnRuY8aHcAnLlAtHX3T/83wXqnvpmmyn1nEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qcvzt8Y1Kw7h15tpwMz2JiffX48ZyurbCgpSssqCkI1bVxueET2X343l5fqFudFCvrlfSySL+ScSLVz/V7lMdLfBYyNg3/ApI6GTLWwkQyNlpqO43OWvmyzTquxKEga0+5bHWIvP0U8qFxNtt2qinG8QnJZNP8zpzSQ0BXOSSi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=BlgQSrd2; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-467918c35easo1615771cf.2
        for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2025 11:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1737573981; x=1738178781; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F7qbRcJdlNs9JM/svl11ZnAzHm88/CR0NTmtow3VqEA=;
        b=BlgQSrd2aD/jHvd/pIfHj80G9pSwckZ34dG5GSa60bnxFfpij0SSEeqbyViUOSWjCL
         f4iaR5ZDD6VYn68rB/SLihpNK51Zjzl1Vzj8XcHO90RBNXnGOFOmOchMUAODZx8DgYIS
         oGbO2xBHnN6+Zeb4TyfJ6cZO1vfA+5Xx2CnCwuIG3O7S+KihcAaX0UC1Wrs7ffCUkWEM
         J1ARy7Zg4QvT+QnbzLT4XvSSY0VlRZKBWTyCQoRLgTQAI8zx8cWDfzbd1MyeIb+DfvBL
         c+PILv7AgoVRJF6qV0tx0XP7Nokdng2RUR4So5gAX9Il7nA24l0SD4nqRw1ig6PNyUrh
         1FkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737573981; x=1738178781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7qbRcJdlNs9JM/svl11ZnAzHm88/CR0NTmtow3VqEA=;
        b=mZ4QFesSoDDLTv0orF4oaQWNdN5k/c4kaoQ5nd9sPugeckdS8wOoeRdl+e0gySCne3
         jvHGjDjBis63h1VLT30FLzN7wUapQHNXnQR3RiMgJHKQIDdo0dqVpVurUMoaz7ZKDc3y
         S7McraaqQEWlvhp7MyXLX8ka54Vol5QFJ/BrfBj2Vs/B30KvLin5xS3NkYtEzhItqqkd
         9JWxIvVHW3V1xBPE3cwZq04BFcvo8adKrGdJDQ4NBFYKKAbls2v4od5Eql0GjXdmOLLt
         G0ZzkGFzXYnxXMsZv/unGCnbKcdUKW04KsrpoJXhpVmDk+0g6s4uifEeuRLeujYi995E
         /dAw==
X-Forwarded-Encrypted: i=1; AJvYcCVwpZiSmj/ZCe7k9EfUoVRYEU8PnHc63iPpx86PNtBqtvc0vqWABidiUqZ8hQMKKdr3ZyGQuXwEq8A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3LNEiUcoL8Rv49KdDHrk3wcFAbb44oI4VLbcFoSzha2uSyVMh
	lj8vLcZy00UuRvPOqW+JbrI9AJjxfVUb3CCPaUV5GhRJfGR8NonSMwxMV8ICew==
X-Gm-Gg: ASbGncvmcdljQnmmcsyBojm/dAgIYElZByhm9CfBurvOvr2LsnwUxA5BGZRxCqVCDZW
	VS3QDIw3NciSJkDouMciap8bAJ3Gwih2vrnvN9YCrP2AnEl3CO8EnA8NnK6zxAaQ8Q0o+RT5MDW
	+NvaGAMLwkAHj8bcDeyeCKQe3IJAAcG65M/AC3aezHufuNxFN83RJcbYJdmIxx+kVgTP66Ph2gO
	NW7kGQ9zjsH1gx6VW4V2Uk2XP4iWCMNv1c9e8ap7ue3LVxVPHKEk+/OvnnOroSL+G2861cUxuRm
	EvnMeaH/ELP4bRY23z4E8g0T26vS9IrDEPTGIp2VsgDpe5HpThLX/Z26yzjTwjk=
X-Google-Smtp-Source: AGHT+IEnmtKP4SEBaA8L/M/3sAmg1+2Yf3epxF83Bnh3sui8dNE1QfTTfuJaIW5hBBYMddHqsk4FLw==
X-Received: by 2002:ac8:5955:0:b0:467:6486:beea with SMTP id d75a77b69052e-46e12b963e5mr369379731cf.38.1737573980369;
        Wed, 22 Jan 2025 11:26:20 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-51.harvard-secure.wrls.harvard.edu. [65.112.8.51])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e102fc639sm67785201cf.25.2025.01.22.11.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 11:26:20 -0800 (PST)
Date: Wed, 22 Jan 2025 14:26:17 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: rtm@csail.mit.edu, USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH] USB: hub: Ignore non-compliant devices with too many configs
 or interfaces
Message-ID: <c27f3bf4-63d8-4fb5-ac82-09e3cd19f61c@rowland.harvard.edu>
References: <d86313f9-e77b-47a5-9a84-01d71493b15c@rowland.harvard.edu>
 <96145.1737573668@localhost>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96145.1737573668@localhost>

Robert Morris created a test program which can cause
usb_hub_to_struct_hub() to dereference a NULL or inappropriate
pointer:

Oops: general protection fault, probably for non-canonical address
0xcccccccccccccccc: 0000 [#1] SMP DEBUG_PAGEALLOC PTI
CPU: 7 UID: 0 PID: 117 Comm: kworker/7:1 Not tainted 6.13.0-rc3-00017-gf44d154d6e3d #14
Hardware name: FreeBSD BHYVE/BHYVE, BIOS 14.0 10/17/2021
Workqueue: usb_hub_wq hub_event
RIP: 0010:usb_hub_adjust_deviceremovable+0x78/0x110
...
Call Trace:
 <TASK>
 ? die_addr+0x31/0x80
 ? exc_general_protection+0x1b4/0x3c0
 ? asm_exc_general_protection+0x26/0x30
 ? usb_hub_adjust_deviceremovable+0x78/0x110
 hub_probe+0x7c7/0xab0
 usb_probe_interface+0x14b/0x350
 really_probe+0xd0/0x2d0
 ? __pfx___device_attach_driver+0x10/0x10
 __driver_probe_device+0x6e/0x110
 driver_probe_device+0x1a/0x90
 __device_attach_driver+0x7e/0xc0
 bus_for_each_drv+0x7f/0xd0
 __device_attach+0xaa/0x1a0
 bus_probe_device+0x8b/0xa0
 device_add+0x62e/0x810
 usb_set_configuration+0x65d/0x990
 usb_generic_driver_probe+0x4b/0x70
 usb_probe_device+0x36/0xd0

The cause of this error is that the device has two interfaces, and the
hub driver binds to interface 1 instead of interface 0, which is where
usb_hub_to_struct_hub() looks.

We can prevent the problem from occurring by refusing to accept hub
devices that violate the USB spec by having more than one
configuration or interface.

Reported-and-tested-by: Robert Morris <rtm@csail.mit.edu>
Closes: https://lore.kernel.org/linux-usb/95564.1737394039@localhost/
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---

 drivers/usb/core/hub.c |   11 +++++++++++
 1 file changed, 11 insertions(+)

Index: usb-devel/drivers/usb/core/hub.c
===================================================================
--- usb-devel.orig/drivers/usb/core/hub.c
+++ usb-devel/drivers/usb/core/hub.c
@@ -1848,6 +1848,17 @@ static int hub_probe(struct usb_interfac
 	hdev = interface_to_usbdev(intf);
 
 	/*
+	 * The USB 2.0 spec prohibits hubs from having more than one
+	 * configuration or interface, and we rely on this prohibition.
+	 * Refuse to accept a device that violates it.
+	 */
+	if (hdev->descriptor.bNumConfigurations > 1 ||
+			hdev->actconfig->desc.bNumInterfaces > 1) {
+		dev_err(&intf->dev, "Invalid hub with more than one config or interface\n");
+		return -EINVAL;
+	}
+
+	/*
 	 * Set default autosuspend delay as 0 to speedup bus suspend,
 	 * based on the below considerations:
 	 *

