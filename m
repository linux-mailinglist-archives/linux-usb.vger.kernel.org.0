Return-Path: <linux-usb+bounces-19169-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C93A07C13
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 16:34:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A1BE1889359
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 15:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 105E821CFE2;
	Thu,  9 Jan 2025 15:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="dSZiXVeP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E962021CA1F
	for <linux-usb@vger.kernel.org>; Thu,  9 Jan 2025 15:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736436874; cv=none; b=VlubalFKLx3yTtUypUTaEF/DZd16lpMZUOF31be5HtpDzsDL+uu9i6AsVIkYAlDiEf/DL4ZiJ04v0BB9/Iu5iy7nOTjOdAxy0lDL+3rgswsxBaRvje5Ki7DH19e8XfMnBml5HnYSnUBgdKVN+1m3EPuYiIebAekzhVZPNnDBp70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736436874; c=relaxed/simple;
	bh=DT9CIAnVRiN2PnqrJuhSJoh7qfkKM7j/ZnVYY3aqjGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+2nLPJMda1xOCoov99JxYB75IhOu1PIc8CAsEf9LVNM52xOlgom99QgB907G9i5XRwRLoK4q/6wXk7/QDKBFK9JPUBj6BFZf8VeDJAJSG6H07bkyMKXywbhicZxh5V/ovy7JXOFr7UWBqP3IqwSnoeQO8IhHtIUTw2Oe7L9nzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=dSZiXVeP; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b6f0afda3fso106016385a.2
        for <linux-usb@vger.kernel.org>; Thu, 09 Jan 2025 07:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1736436872; x=1737041672; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jbUVZ9XRJFi5euaz9QC5eJqXsL1tEwWDbYO8wlBC7bI=;
        b=dSZiXVePg/gMwYZ6uErPICYmrcFt214nbulDbrB9i+92sqxQZtMT53lv1FdAHgW8k/
         sSEzpk6mZbITTd+DK8jKN0Joouhwx0d0OkwLlJspKG8oPa2yZhzoq/GXrJOrb5fVs/b0
         x7ody1m/QfexTG4Lgw16w1yNhlTQC89tK28acvYdp+zb+xILQhXksMBqrI1/7S55UuR4
         1LhU/Kk291tYRrJ5nOi4fXJ45O5L+zytVGAkAHslJyBaE/9Wd3XO2TsAKHdus0utL/bH
         E/Z/wcY7bP0/6YC0DeEL1ZdC4mWzEFxclPYSRcat+WRY+CXHwncAm2/Rla7rZfayCgjx
         G+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736436872; x=1737041672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbUVZ9XRJFi5euaz9QC5eJqXsL1tEwWDbYO8wlBC7bI=;
        b=apWw2nuwHUU1r3H5vL3qyLxdFY7ooteFWpMiISXDuL40cDevT0SkDm7zJKgeOesP8i
         QuoR03yBE5hIOtAM//of8bA0cNdTVL3ASwhCPCGZVmt+9v4WXrwZ6mYNyPe5l8D0EQa6
         P/eLU1Za2kP2cFEBnc5f/xb/8cmmZg2lvGlGYFJtSB5lK7srjNkZGsB9mLBu++KjcLQw
         Gkawe1pqC1CVKKqWhW+cYRtRFVRNWsyqy7Z8jlKUrdSIGDc1tmVjLIc0xivUjezCxwv7
         83eQzxS/xbN0hIAEXS3sG8yLKNReEhK+MQkYhoUZM2N0xKmhphtJPXbvE8Z+XC68gXHi
         LCqg==
X-Gm-Message-State: AOJu0YxUCKrVD/rDYs2e+SIYP7qKtCocm4KdssMV5C1wslaNCgVwI0mH
	SlJL7Hoy2FYfngd/0DqVD0HF+yQ82NIEOoCPIoxV9zNjpJLxYMvjKOrIDDWXz4TZoRhbhEaUlVA
	=
X-Gm-Gg: ASbGncvwUVz5iHtHhu3gCIE2O9Co9x9LWRa/9YDLa4zQtyKZFa/7xhaDuPWDti+GfLG
	7SNK91YBquvtBkNhAmXiTPTWdiNrTQqu6JgKqmjtIU+2c1OWRBmXPnQjK0h7JIOPuWDTqsoH6Rz
	w2tNjJ/O1lR84IV/rKl2vLwd/m2d9EClcUrkaKm87ScZC2u8BpGUc5p5Rn20iSv0/Jsm08GI+yF
	h5NJjLpjEYCn81atmd5bKgs2MI7sfUMD9/5cb5CODqA1dOiHTeH0xC0hOp0l/j7m5uTiYjkhX0=
X-Google-Smtp-Source: AGHT+IFw04lVskRd/60WClL12cwgI20idzrAYG52Ch8vLGb3JQJXHSDMRfNwt6Vr54j2CbbtTIdiLQ==
X-Received: by 2002:a05:620a:40d2:b0:7b6:d7d8:7348 with SMTP id af79cd13be357-7bcd97165d3mr1141349585a.31.1736436871811;
        Thu, 09 Jan 2025 07:34:31 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7bce3503178sm76847485a.90.2025.01.09.07.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 07:34:31 -0800 (PST)
Date: Thu, 9 Jan 2025 10:34:28 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Bitterblue Smith <rtl8821cerfe2@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: MT7601U with on-board storage reports incorrect capacity
Message-ID: <2be45061-034f-4cbb-8ed1-f028bbb35936@rowland.harvard.edu>
References: <060301fe-17e2-4061-bb01-f5660b5d10a3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <060301fe-17e2-4061-bb01-f5660b5d10a3@gmail.com>

On Thu, Jan 09, 2025 at 04:02:58PM +0200, Bitterblue Smith wrote:
> Hi,
> 
> I have this wifi device with on-board storage for the Windows driver:
> 
> New USB device found, idVendor=148f, idProduct=2878, bcdDevice= 0.01
> 
> After switching to wifi mode, we can see it's a MT7601U:
> 
> New USB device found, idVendor=148f, idProduct=7601, bcdDevice= 0.00
> 
> The problem with this one is that it can't be mounted, nothing happens
> for a long time. I'm testing with kernel 6.12.8-arch1-1 but it's been
> like this for at least two years. 
> 
> The problem seems to be that reading from the "end" of the device
> takes 17 seconds. I assume the reason for that is the fake capacity:
> 
> SCSI Payload (Read Capacity(10) Response Data)
>     [LUN: 0x0000]
>     [Command Set:CD-ROM (0x05) ]
>     [MMC Opcode: Read Capacity(10) (0x25)]
>     [Request in: 212]
>     [Response in: 217]
>     LBA: 65280 
>     Block size in bytes: 2048
>     Read capacity: 133693440 bytes (127.50 MiB)
> 
> The real capacity is probably just 8 MiB. The driver files stored in
> it are ~7 MiB total.
> 
> This takes 17 seconds and returns 4096 bytes filled with 0xff:
> 
> SCSI CDB Read(10)
>     [LUN: 0x0000]
>     [Command Set:CD-ROM (0x05) ]
>     [Response in: 565]
>     Opcode: Read(10) (0x28)
>     Flags: 0x00
>     Logical Block Address (LBA): 0x0000fefc (65276)
>     ...0 0000 = Group: 0x00
>     Transfer Length: 2
>     Control: 0x00
> 
> Windows never tries to read that far. (The device works in Windows.)
> 
> How can this be fixed?

Upgrade the WiFi device's firmware.  If you can convince the vendor to 
fix the bug, which seems unlikely because it works okay with Windows.

Part of the partition probing (which tries to read the device's last 
sector) is done by various userspace programs.  But I think some of it 
is also done by the kernel, and as far as I know the only way to prevent 
it is to build a kernel without support for the partition schemes which 
store some of their data near the end of the device.

Probably your best approach is to tell usb-storage to ignore the device 
completely.  You can do this with a suitable module parameter for the 
usb-storage driver.  For example, add:

	usb-storage.quirks=148f:7601:i

on the kernel's boot command line (or put a similar entry in an 
/etc/modprobe.d/*.conf file if usb-storage is a loadable kernel module 
on your system).  Of course, then you wouldn't be able to mount the 
device or access the Windows driver files on it, but I imagine you don't 
care about them very much while you're running Linux.

> usb_modeswitch can switch it to wifi mode, so it's not a huge problem.
> I'm just curious.

If you really wanted, you could create a custom kernel which which 
adjust the storage capacity of this particular device down to 8 MB.  But 
you would never be able to convince anyone to include such a workaround 
in the main kernel.

Alan Stern

