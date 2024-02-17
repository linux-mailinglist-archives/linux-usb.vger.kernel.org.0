Return-Path: <linux-usb+bounces-6668-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A36A859235
	for <lists+linux-usb@lfdr.de>; Sat, 17 Feb 2024 20:55:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A8E2B21F64
	for <lists+linux-usb@lfdr.de>; Sat, 17 Feb 2024 19:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192707E588;
	Sat, 17 Feb 2024 19:55:22 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id EE00C7E57A
	for <linux-usb@vger.kernel.org>; Sat, 17 Feb 2024 19:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708199721; cv=none; b=rBeoDb9qnqQlc64T/YonRHWR4kFNX4BGLJJczv8Umppf6xPhXlrQ64Xdbu772FuINZhGVHaoKUps6LqF00GWS5yn1TnbSxSlhWKWsqiDdx3Grx19mUoR3Pjghxk8f4EkJQMAi1JUEGYKoA32dBXiEnxzoGZY7D2jrzPkXSGLy7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708199721; c=relaxed/simple;
	bh=1nFupjpkrFtI5zJaB9Pyehi1IMMg54ekvBJqQNc1QX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLmflyrJh5znJ1l8ioLCz0cjOxdb/kfDgfYb4zkDMfpzJv1BXjVwT7SqoawpP4THPvw+YgLkv8KYb3MgpqLbxSHcZe3R8VwZ8oTDspIw92QK5T0mYofR0Jwx1H1NnZDiYWxuJAYxfmV0VSjcLWzPzx4VbScH1ZTVCtuxFJl5WWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 499769 invoked by uid 1000); 17 Feb 2024 14:55:11 -0500
Date: Sat, 17 Feb 2024 14:55:11 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: =?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: NULL dereference on disconnection during usb_set_interface()
Message-ID: <261cbb28-60ec-4a0e-8bbd-2bd328a39c8a@rowland.harvard.edu>
References: <20240121181815.4ab01525@foxbook>
 <2024021724-dweeb-peroxide-2036@gregkh>
 <20240217202611.6337879c@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240217202611.6337879c@foxbook>

On Sat, Feb 17, 2024 at 08:26:11PM +0100, Michał Pecio wrote:
> Hi Greg,
> 
> > There are a number of known-race-conditions in the v4l interface that
> > can happen when devices go away and userspace is still holding a
> > reference on the character device node.
> 
> I wrote to linux-usb because I think this particular crash is a bug in
> the USB subsystem - namely, usb_set_interface() appears to crash when
> the device is disconnected during its execution.

No, the bug is not in the USB subsystem.  Drivers are not supposed to 
call usb_set_interface() unless they can guarantee that the device will 
not be removed while the call is in progress, generally by holding the 
device lock.

I suppose it could be considered a bug that this requirement is not 
documented at the start of the function.  You could submit a patch 
adding an appropriate section to the kerneldoc.

> Indeed, today I came up with an artificial way to reproduce this crash.
> I added msleep(1000) right before the call to usb_hcd_alloc_bandwidth()
> in usb_set_interface() and pulled the USB plug when it slept.
> 
> (BTW, previously the device was not physically disconnected, it looks
> like the host controller dropped it due to I/O errors).
> 
> Anyway, here's my new crash log:
> 
> # this is what normal execution looks like, nothing special happens yet
> [  210.644611] usb_set_interface called from uvc_video_start_transfer

Here you see usb_set_interface() called from the UVC driver under 
inappropriate circumstances.  To fix the problem it will be necessary 
to fix the UVC driver.  It should not allow itself to be unbound from 
the device while a user-driven operation, such as 
uvc_video_start_transfer(), is in progress.

Alan Stern

