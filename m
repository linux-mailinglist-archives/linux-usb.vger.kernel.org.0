Return-Path: <linux-usb+bounces-12156-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 645AB92EAF1
	for <lists+linux-usb@lfdr.de>; Thu, 11 Jul 2024 16:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 959321C21B6F
	for <lists+linux-usb@lfdr.de>; Thu, 11 Jul 2024 14:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75753169AE3;
	Thu, 11 Jul 2024 14:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="iD9gWC1G"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2688479
	for <linux-usb@vger.kernel.org>; Thu, 11 Jul 2024 14:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720708916; cv=none; b=rOW0TCk4H35p4n3efhaFtul+vMlM9LcGj5dtKrelAqZjQX2olOWOI/73AAirZVq5vgt9C7FgQxMTIEeCg/MaraJ6GkDk9ov9nIySPYYZr/oX1HJS+CowzX2kCsCsdl1r5swQ+416oRzpH42lxbB+orUtDCKOoSD0Xq0csAXLkoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720708916; c=relaxed/simple;
	bh=bumUfNtZX7zKc1PGX2lQso+2aukmr1DgKwJdGhViIm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rG2U4fSk5E3+bKcpkoo8pAjHiBVOYzGvXPH1uYxqKv0v6IOvN2oo4AAGEmZBPy6ot4bopX5P6Jho1e07SI36X+g8NU66jWH+DfLRurUykunsRAh3uWVZ0aqzgzhA1503lkIANL8imXfHNdDYL1PgDqJZJj1jLSQ1BNxwxMKRYww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=iD9gWC1G; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-703775e4d5dso457476a34.0
        for <linux-usb@vger.kernel.org>; Thu, 11 Jul 2024 07:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1720708913; x=1721313713; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xn5M1hLYtpFruiWyFR2wbyMwFhBFuceObgrjMoeSEWY=;
        b=iD9gWC1GpJVV8Ri4G3HpL+H4wQ/Tfbhk4zOoY3DilcjEaZqgAshxXTDI/s87AioflT
         EQsfPCf8ZNIlTe4HtljrfpFlUO5RiTF+XNvT/2zFk+c+eB9Ov7JV7gjSUyF7p102xo8u
         Ik6PYgq+WyXmktDI7d/h9IuLnOuo7pHhW5xkdKdxsSsuIyjF44IShnsW2J/QTnt75quK
         agMX6OmucLYC/maO2UF+y/AcaBBMMqtMwqI60cvBv56wqHPCzsamoJSs6a0ZuzKbU5Dm
         waqqyvB4tv0ZUpWx9Nk2Ev7L4iiP9HvpREweSB1P01UjVF82YhlyX9jNnkduc72BNx/u
         TqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720708913; x=1721313713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xn5M1hLYtpFruiWyFR2wbyMwFhBFuceObgrjMoeSEWY=;
        b=qhMdxBHFq1bEL2sGVJ+rO0kv+IZAWx7IgdgTpGjJFh6tuTMxxBSs+VBXfKwb+Dbqev
         eBMmrzioJgikzEbdY1gxRVbtuNQILmNJcZ8+8DYgw2aGnqCOP03Bg/yRaaNCSPVsrGfz
         AG/+ZjWqeSun76ZQ6LNIt+UInzQRxp+vAqkHhUcNa2N6kEceW+7GfMKmCsDGRXhanuSK
         l7PSwCu2yM8ZQOCs+0mzsrTDl1DjPLGwaFfMFjpyCQZZ4ivcaJKf3+nGuepbO+LRwBDn
         dR9q5XXGf4YDaK5TQmd/GguB9f7XTR8IJAXYxyxi4rngbiI8efDeO3pyE1ImZCe9rBCG
         sQPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0zBoPqgXPjDqs7arpTKMk50ddYeJLxqymA3BasGtN7XzxdsMV90FKR5CLFUV/qAjBhcxBG+Tt99wUnMJ9oeV63ZhDmWEmx8nk
X-Gm-Message-State: AOJu0YyN/1Xupvi1vjYyvsbb4DZyEJ4xyQFeYoJ9ZQCwcCeog2yZY89F
	vs5E9G6Vnd0ruqDEg7LGVehKe5sfAEYTZVnhhD2Dnt4bbtDBAi1epPSbi6bWhg==
X-Google-Smtp-Source: AGHT+IE7angxxeLKZr6AHNasAGDfXEnzNLp3R8D/Daoxso2P5Y9YKBHJIk5rV/6aHJBt5fVOr9/wkw==
X-Received: by 2002:a9d:6842:0:b0:703:77b1:c653 with SMTP id 46e09a7af769-70377b1c771mr7899342a34.24.1720708913607;
        Thu, 11 Jul 2024 07:41:53 -0700 (PDT)
Received: from rowland.harvard.edu (iolanthe.rowland.org. [192.131.102.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b61b9d56bfsm26230136d6.32.2024.07.11.07.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 07:41:53 -0700 (PDT)
Date: Thu, 11 Jul 2024 10:41:50 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: Hongyu Xie <xiehongyu1@kylinos.cn>, gregkh@linuxfoundation.org,
	brauner@kernel.org, jlayton@kernel.org, jack@suse.cz,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH next] usb: usbfs: Add reset_resume for usbfs
Message-ID: <9ef72886-13b8-46cf-a0aa-54dad36102e9@rowland.harvard.edu>
References: <20240711084321.44916-1-xiehongyu1@kylinos.cn>
 <527927b8-9475-47da-bf2b-7a5d9e81e470@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <527927b8-9475-47da-bf2b-7a5d9e81e470@suse.com>

On Thu, Jul 11, 2024 at 10:59:56AM +0200, Oliver Neukum wrote:
> 
> 
> On 11.07.24 10:43, Hongyu Xie wrote:
> > During hibernation, usb_resume_interface will set needs_binding to 1 if
> > the usb_driver has no reset_resume implimentation. The USB interface
> > will be rebind after usb_resume_complete.
> > 
> > Normally, that's fine. But if a USB interface has a matched kernel
> > driver, and a userspace driver or application is using this USB
> > interface through usbfs during hibernation, usbfs will be
> > detatched with the USB interface after resume. And this USB interface
> > will be bind with a kernel driver instead of usbfs.
> > 
> > So add reset_resume to fix this.
> 
> The device has lost all settings, yet we continue like nothing
> changed. That strikes me as a very bad idea. If a device has undergone
> a reset user space has not requested, we need to return an error upon
> the next interaction.
> 
> I am sorry, but this implementation has some fundamental issues.

Agreed, but the solution is pretty simple.  Because the device was 
suspended, the userspace driver must have enabled suspend via the 
USBDEVFS_ALLOW_SUSPEND ioctl.  

At that point, although the driver _could_ try to do some I/O to the 
device, the safest approach is for the driver to call the 
USBDEVFS_WAIT_FOR_RESUME or USBDEVFS_FORBID_SUSPEND ioctl.  So those two 
places are where we can return a specific error code to indicate that 
the device was reset while resuming.

Alan Stern

