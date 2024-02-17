Return-Path: <linux-usb+bounces-6641-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF60859086
	for <lists+linux-usb@lfdr.de>; Sat, 17 Feb 2024 16:31:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84A022829FD
	for <lists+linux-usb@lfdr.de>; Sat, 17 Feb 2024 15:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07EE7C6D2;
	Sat, 17 Feb 2024 15:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WnIZknqG"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2427C6C8
	for <linux-usb@vger.kernel.org>; Sat, 17 Feb 2024 15:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708183886; cv=none; b=cD295fNWzfwEICNfeS84SYGng3/05ybv4JRHDYLvE8jzkZCl5JAPWHc1qtfiKi0elsLz5LQNWycaCvmme+fd0d5MLOPeRUImjOsoTD1YaUASkD5k7PU7mP3HI1X6y9NjGxkKZIsISASJhXYCnWLnlwhkVu487uiIBuBCifWcgCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708183886; c=relaxed/simple;
	bh=8GlhbK36eeRz6wli/rG4c1ShZruorIVLFR4GECz3EUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fFr1jVJneduXvv8k1v2Z2gz1XR//g4XZZM7GB6KallrXfh4T+L5FRmY4Ehj27E8UpJsUgx7TefBmo/5SsntItiJGe1n4oRMB+D93yaXGN3gJeHeEmxNhKauYd0R2VvTjbqiCdBoBKrpTVo4sElCWkagdiYA2fRAK3hzLD3LOa/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WnIZknqG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64B0AC433C7;
	Sat, 17 Feb 2024 15:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708183885;
	bh=8GlhbK36eeRz6wli/rG4c1ShZruorIVLFR4GECz3EUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WnIZknqGg98n1PMn17r3hHr3lwQIQ1tusdS/TjoZLm9sUSF9cgLwTtGdaZbYiRnGM
	 /W0waY6FujAilVUUgbDCjCC8y39HWmqNZaz2YqAjLC5mmbbPG1GLOlDT5R8dm/T/Xv
	 dNZW86dH3yzgrmjusHHMDW+dXN7KIdVJYN14f11w=
Date: Sat, 17 Feb 2024 16:31:23 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: NULL dereference on disconnection during usb_set_interface()
Message-ID: <2024021724-dweeb-peroxide-2036@gregkh>
References: <20240121181815.4ab01525@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240121181815.4ab01525@foxbook>

On Sun, Jan 21, 2024 at 06:18:15PM +0100, Michał Pecio wrote:
> Hi,
> 
> I encountered an interesting race. This USB camera appears to have got
> stuck and dropped by the bus during video stream initialization, leading 
> to an oops. This is a one time occurrence, not reproducible. Maybe not
> a very severe issue due to narrow window of opportunity, but still...
> 
> Linux v6.7, the host is XHCI.
> 
> The first message below comes from uvc_video_start_transfer(). It is
> meant to be followed immediately by a call to usb_set_interface() and
> apparently during this call things went weird.
> 
> After a half second delay the device was disconnected and another five
> seconds later a NULL pointer dereference occured.
> 
> The crashing function is usb_ifnum_to_if() and disassembly suggests that
> the dereferenced NULL value was config->interface[i], for unknown i.

There are a number of known-race-conditions in the v4l interface that
can happen when devices go away and userspace is still holding a
reference on the character device node. The developers there are working
on it, but I don't know of any recent changes to help resolve this,
sorry.

Try asking on the linux-media mailing list?

thanks,

greg k-h

