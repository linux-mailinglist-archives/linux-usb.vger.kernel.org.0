Return-Path: <linux-usb+bounces-2550-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 516DA7E13A5
	for <lists+linux-usb@lfdr.de>; Sun,  5 Nov 2023 14:31:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D31E3B20D78
	for <lists+linux-usb@lfdr.de>; Sun,  5 Nov 2023 13:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB87CC13D;
	Sun,  5 Nov 2023 13:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jc4az8v0"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897C6BE7D
	for <linux-usb@vger.kernel.org>; Sun,  5 Nov 2023 13:30:59 +0000 (UTC)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A7A097
	for <linux-usb@vger.kernel.org>; Sun,  5 Nov 2023 05:30:54 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-53df747cfe5so6050031a12.2
        for <linux-usb@vger.kernel.org>; Sun, 05 Nov 2023 05:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699191052; x=1699795852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gAm7tvQ5+lUqK2+gicwK79AWfNC3ovRMUZQU0rLgaDQ=;
        b=jc4az8v0TAVjXUJUvGsIsr4drNd2PlD2cieTYvkLmwx0jk1qBwllUfQ2B/mHu+T3uh
         EFhQT0FW6fnlkPy0Nrfa01/0cgUyNyFd6SgEBea0OQfr4bRkptgqx0HtxO7r3tlzR5rg
         G6oRwY4DwFjRiXytnGTEViE5TODqbL97d7wMMJSwIUmqldlOCZ6JAPrd6e4nWlqVw0+2
         6/e+SSurQAuOIa6sWov4hV4CI+13QO43PYUVrevlf/+VbldIU9u5DQujhaT8r8zkvvYe
         h1kAYNHivnCMWYJtBV1yD7i+h1HmNGC3LpWzcmqr5SZ5axIXLGoTjFL1eC0q36sz7wF+
         M48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699191053; x=1699795853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gAm7tvQ5+lUqK2+gicwK79AWfNC3ovRMUZQU0rLgaDQ=;
        b=SVmK0hR2sj2oYZQOE05tnjii4XbygRQEv8JGSZq57UpBNE6ama3ii9Qqo1hQSpDwrG
         gciCyLTHd+qEfjo6bvC75IJccgyHW95r5G0pLvyf5IdZ4uby3pdlTunB2r/MZUh6e4nm
         2wxXfBH8rgdc/8LsGeuspTlVQBHz/ClmMfId6el+4S7a3c0DgHGlKREqrDTSPW7r5JdD
         v9xmiG94ps+PbjuSKWtgGf2oJJLH+VAb84ZWnadgDn/fTbxxRsse0uY2pAE1I9mqPh01
         ujQ3pTKvCwHetHP72WxSEhnuVboZEhZ0wgsxN60Z6BJU7V05mHftrJLyGRvXtFZm6W4F
         K8Qg==
X-Gm-Message-State: AOJu0Yy/TkhIYUWkTY80aUrNl4w3M1nbhBLBJAsQQcl+oqbPhfyaIU9D
	O9FdlQtcs5L0yaPZnnrwlCZOT7VoaAPlEQ==
X-Google-Smtp-Source: AGHT+IGZeEDVapMcz4f+DUUy1BryHy04eyVDUkvB1qVY2OxQuKFBZGpBI0Ls86xiSh4auWlNjhnoIw==
X-Received: by 2002:aa7:d402:0:b0:540:fcc5:3ada with SMTP id z2-20020aa7d402000000b00540fcc53adamr22426844edq.9.1699191052507;
        Sun, 05 Nov 2023 05:30:52 -0800 (PST)
Received: from ping (dynamic-2a01-0c23-614a-dd00-ee41-07a6-62dd-2930.c23.pool.telefonica.de. [2a01:c23:614a:dd00:ee41:7a6:62dd:2930])
        by smtp.gmail.com with ESMTPSA id f14-20020a05640214ce00b0053db0df6970sm3197645edx.54.2023.11.05.05.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 05:30:52 -0800 (PST)
Date: Sun, 5 Nov 2023 14:30:51 +0100
From: Fabian Melzow <fabian.melzow@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: Re: 0bda:b812 USB "3.0" WLAN devices only report a maximum of 480
 Mbps
Message-ID: <20231105143051.2b28c316@ping>
In-Reply-To: <2023110534-fester-schematic-818a@gregkh>
References: <20231105130215.2b669c8b@ping>
	<2023110540-unseemly-mobilize-9e82@gregkh>
	<20231105134909.6c3f28d1@ping>
	<2023110534-fester-schematic-818a@gregkh>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Sun, 5 Nov 2023 14:11:02 +0100
schrieb Greg KH <gregkh@linuxfoundation.org>:

> On Sun, Nov 05, 2023 at 01:49:09PM +0100, Fabian Melzow wrote:
> > Am Sun, 5 Nov 2023 13:20:38 +0100
> > schrieb Greg KH <gregkh@linuxfoundation.org>:
> >   
> > > On Sun, Nov 05, 2023 at 01:02:15PM +0100, Fabian Melzow wrote:  
> > > > These devices should report 5 Gbps for USB 3.0 in the Binary
> > > > Object Store Descriptor, but don't do so.    
> > > 
> > > Why do you think these should report 5 Gbps?  If the device
> > > descriptor does not show it, there's nothing that we can do about
> > > it in the operating system, sorry.  
> > 
> > Thanks. I don't look at the USB specification for USB >2.0, which
> > was long times ago and then only for a user space program and
> > thought that it at least theoretically could be possible to set the
> > device speed at some kind of initialization.  
> 
> There might be some vendor-specific way of doing this, and then the
> device resets itself, but other than that, no, descriptors are a
> static description of the device's capabilities.

When this static description is also used by the host controller to set
the device speed, then these WLAN devices are limited to 480 Mbps. If
these descriptor are more a information for programmers, even if some
descriptors are uses to configure the device, but the hardware supports
more then 480 Mbps, as which in this case, then these devices are not
limited, but provide wrong information.

> > > What exactly is the hardware problem?  What is not working
> > > "properly" for them?  
> > 
> > All 0bda:b812 USB-WLAN-devices seems to only operate at 480 Mbps,
> > but have a WLAN-chip which supports 780 Mbps at maximum.  
> 
> Are you sure that those devices really can run at 480 Mbps?  Perhaps
> the chip can support higher, but the firmware on the device, and the
> other stuff in the device does not?

The used WLAN chipset should support more then 480 Mbps in hardware,
but I don't known whether the host controller limits the speed based on
the wrong descriptor of the device.

