Return-Path: <linux-usb+bounces-2552-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 394937E1418
	for <lists+linux-usb@lfdr.de>; Sun,  5 Nov 2023 16:33:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93E09B20DE2
	for <lists+linux-usb@lfdr.de>; Sun,  5 Nov 2023 15:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB7AFC02;
	Sun,  5 Nov 2023 15:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MkJQX93U"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8CD9453
	for <linux-usb@vger.kernel.org>; Sun,  5 Nov 2023 15:33:08 +0000 (UTC)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CAC5A7
	for <linux-usb@vger.kernel.org>; Sun,  5 Nov 2023 07:33:04 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-543923af573so6269136a12.0
        for <linux-usb@vger.kernel.org>; Sun, 05 Nov 2023 07:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699198383; x=1699803183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vf8SDKt9XMBJ13UWbcS5wxSzvxBa7ocOOzB4bWcYnA=;
        b=MkJQX93UVtMoXMmlWIS/QoKBIALG6zJmj4DcTGL1w7jq1JqZNV4y/FEC+XDb9wQ+rz
         ltyUpIN5ZRrS9oRQFIzU7VrMYUalwmeUYNzvcngH+X0Fe3IZ7qOLUr3meeWX41/5huD3
         HNlThxrk80h2lc1+khoDB1n4nFJGUVoL5HmOeIf1Xg/yRpDpuqLobj0nKGfNFvL5Irf8
         rgRt4smUqqd+Xe0MReovoHVKXbgKSkcrCYJswmllaOohyCLkil0DQvf5bBQXk5Eptfja
         F+J0FdS+a4Xqw7QFtPjmORSJP9LqiS3VBQ998/RWv+LyBZ0CO8hURYUUpJBNNjvvfyjm
         Aeow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699198383; x=1699803183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vf8SDKt9XMBJ13UWbcS5wxSzvxBa7ocOOzB4bWcYnA=;
        b=PVkbCIegS09B2IlNwkVnfl8n995lBzk/dSUmXPmFO4gZ8khfx3wTDcJnUaw9JG4KAi
         Bp/Rp2I7hkdV2FgWggsyiDYSUfDs3Yjny4W5Sh2EKk7ft1jxmsYNCGWC0+41BTzm2Wpj
         Rn3sqYYWLtD4rOQCoNnhjsvPEiNxoVcQUQcF0rBAs8kXZMJkmSNqx2DZEhX6pKyUNTAv
         C+RnfkVzi6HQLhaHzEttbHqq4q+z6VSTCx+Tbb3EhxZJYG6hRzLP9zIsTsU/zqRnNkgN
         LYHVQxGmqSvnCjM7444olzoiq0aDDnL4m3ZOdLGN6q23RIXsSJhd7O+S+I++DyFmbLPj
         SYvQ==
X-Gm-Message-State: AOJu0YybpOR/d7SCn2nAh8QBu1mGqIhROi/yAfsZXSe1aghImsgKP3GX
	AEBCffhUIfN4ODmKs4HHnbs=
X-Google-Smtp-Source: AGHT+IEUmhzZ+yVr0qWwryoqNcKBP3oFXZiCPliOOPtQvUESGa//IR+TOfGO5XaBWfm7YD7SjuejVA==
X-Received: by 2002:a17:906:eec3:b0:9b2:b153:925 with SMTP id wu3-20020a170906eec300b009b2b1530925mr10136209ejb.21.1699198382868;
        Sun, 05 Nov 2023 07:33:02 -0800 (PST)
Received: from ping (dynamic-2a01-0c23-614a-dd00-5305-d3a4-0b23-147e.c23.pool.telefonica.de. [2a01:c23:614a:dd00:5305:d3a4:b23:147e])
        by smtp.gmail.com with ESMTPSA id bw4-20020a170906c1c400b00992e94bcfabsm3088615ejb.167.2023.11.05.07.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 07:33:02 -0800 (PST)
Date: Sun, 5 Nov 2023 16:33:00 +0100
From: Fabian Melzow <fabian.melzow@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org
Subject: Re: 0bda:b812 USB "3.0" WLAN devices only report a maximum of 480
 Mbps
Message-ID: <20231105163300.3b8df5ad@ping>
In-Reply-To: <76fc65db-4efe-4da7-a13f-d7a451f836fa@rowland.harvard.edu>
References: <20231105130215.2b669c8b@ping>
	<2023110540-unseemly-mobilize-9e82@gregkh>
	<20231105134909.6c3f28d1@ping>
	<2023110534-fester-schematic-818a@gregkh>
	<20231105143051.2b28c316@ping>
	<76fc65db-4efe-4da7-a13f-d7a451f836fa@rowland.harvard.edu>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Sun, 5 Nov 2023 09:56:06 -0500
schrieb Alan Stern <stern@rowland.harvard.edu>:

> On Sun, Nov 05, 2023 at 02:30:51PM +0100, Fabian Melzow wrote:
> > Am Sun, 5 Nov 2023 14:11:02 +0100
> > schrieb Greg KH <gregkh@linuxfoundation.org>:
> >   
> > > On Sun, Nov 05, 2023 at 01:49:09PM +0100, Fabian Melzow wrote:  
> > > > Am Sun, 5 Nov 2023 13:20:38 +0100
> > > > schrieb Greg KH <gregkh@linuxfoundation.org>:
> > > >     
> > > > > On Sun, Nov 05, 2023 at 01:02:15PM +0100, Fabian Melzow
> > > > > wrote:    
> > > > > > These devices should report 5 Gbps for USB 3.0 in the Binary
> > > > > > Object Store Descriptor, but don't do so.      
> > > > > 
> > > > > Why do you think these should report 5 Gbps?  If the device
> > > > > descriptor does not show it, there's nothing that we can do
> > > > > about it in the operating system, sorry.    
> > > > 
> > > > Thanks. I don't look at the USB specification for USB >2.0,
> > > > which was long times ago and then only for a user space program
> > > > and thought that it at least theoretically could be possible to
> > > > set the device speed at some kind of initialization.    
> > > 
> > > There might be some vendor-specific way of doing this, and then
> > > the device resets itself, but other than that, no, descriptors
> > > are a static description of the device's capabilities.  
> > 
> > When this static description is also used by the host controller to
> > set the device speed, then these WLAN devices are limited to 480
> > Mbps. If  
> 
> The speed is not set by the host controller; it is set by the device.
> 
> If the device is capable of running at a higher speed than 480 Mbps
> then it should do so.  Have you checked the actual connection speed,
> as reported in the "speed" file in the device's sysfs directory or in
> the output from "lsusb -t"?

$ lsusb -t (only relevant output)
/:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/14p, 480M
    |__ Port 004: Dev 003, If 0, Class=Vendor Specific Class, Driver=rtw_8822bu, 480M
> 
> How do you know that the device's USB hardware supports more than 480 
> Mbps?  And even if the hardware does, maybe the firmware doesn't.
> 
> (Note: Just because the device's WLAN interface can run at 780 Mbps, 
> it does not follow that the USB interface can run that fast.)

These USB WLAN sticks are sold as "USB 3.0", and also have a blue
USB-3.0-A-plug. I don't really know the speed, but 480 Mbps is reported
by "lsusb -t" or in the descriptor. I did not open these devices, but
have assumed that they only use a single chip to handle everything,
WLAN and USB.

> > > > > What exactly is the hardware problem?  What is not working
> > > > > "properly" for them?    
> > > > 
> > > > All 0bda:b812 USB-WLAN-devices seems to only operate at 480
> > > > Mbps, but have a WLAN-chip which supports 780 Mbps at maximum.
> > > >   
> > > 
> > > Are you sure that those devices really can run at 480 Mbps?
> > > Perhaps the chip can support higher, but the firmware on the
> > > device, and the other stuff in the device does not?  
> > 
> > The used WLAN chipset should support more then 480 Mbps in hardware,
> > but I don't known whether the host controller limits the speed
> > based on the wrong descriptor of the device.  
> 
> The speed is not determined by the device's descriptors; it is 
> negotiated at the hardware level between the device and the upstream
> hub when the USB port is reset, which happens shortly after the
> device is plugged in, as part of initialization.
> 
> Another thing to watch out for: Even a 10-Gbps-capable device will be 
> forced to run at a measly 480 Mbps if it is connected via a USB-2
> cable rather than a USB-3 cable.

The above lsusb-output, is from plugging the stick direct into a
10 Gbps-USB 3.1-A-port, with it's A-plug in the case.

