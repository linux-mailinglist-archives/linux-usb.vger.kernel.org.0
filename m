Return-Path: <linux-usb+bounces-5559-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C31383F2C3
	for <lists+linux-usb@lfdr.de>; Sun, 28 Jan 2024 02:34:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3891E284E6E
	for <lists+linux-usb@lfdr.de>; Sun, 28 Jan 2024 01:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46AD11367;
	Sun, 28 Jan 2024 01:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="A9AMkG+f"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD1D3C17
	for <linux-usb@vger.kernel.org>; Sun, 28 Jan 2024 01:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706405676; cv=none; b=A7V4Ygbo1FKBRHiZgCKY44AyxSQoyAqOWNqik/21jIrbRSGJiBJ/wLbzJHrHZO7pSLDpFae95Z0oTm1WPBeXu5pVBvmllaSO6NgbdAW65eGQyQ5ZZRF1kKJm1ph028KhpR/7RwiyfaOujP6LK2VPcaBAuy+D5OQvBXEhSp/uuWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706405676; c=relaxed/simple;
	bh=np5K1REvEvmNEJnKg04n0qEvHnlZZa3bolM0i6h/Rp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GyPfvQIQUN/nO8eavxonRKZlWW8hPhjdTcvxKFEnV3GRToR+yKTD4mBjOHH1Z7WeP6BQuUSjXw5NUgwGeQwm3H45U8uZqT1V2pE9ZanIHEUTbXdWEF+iPz588BNUurMlN5tfWjxQNOl2L9jwP8MFYopJ1lF6YV7LvTIflNPL7zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=A9AMkG+f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E30CC433F1;
	Sun, 28 Jan 2024 01:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706405676;
	bh=np5K1REvEvmNEJnKg04n0qEvHnlZZa3bolM0i6h/Rp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A9AMkG+f8ugNSNs5k77jxS+Tc+WwuYTIkmUrviyzmNJAjSWRVRR3GUgdo9vFRWcM5
	 0k82pzbVPlxRwbPfW24dBgRI1QFN8Of0KCwd7epVEeJPY1gTQq2+t8m0qGw8NNk+3M
	 WLujW6EJ/4UD1vxbAMGZ86IGtjFUqBAAXHlPU9Vg=
Date: Sat, 27 Jan 2024 17:34:34 -0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Vicki Pfau <vi@endrift.com>
Cc: linux-usb@vger.kernel.org,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Maxim Devaev <mdevaev@gmail.com>,
	David Sands <david.sands@biamp.com>
Subject: Re: [PATCH v2 1/3] USB: gadget: Move gadget-related ioctl codes to
 gadget-ioctl.h
Message-ID: <2024012712-eskimo-rockiness-fa9e@gregkh>
References: <20240118003758.1870691-1-vi@endrift.com>
 <20240118003758.1870691-2-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240118003758.1870691-2-vi@endrift.com>

On Wed, Jan 17, 2024 at 04:37:55PM -0800, Vicki Pfau wrote:
> Since multiple different gadget types use similar ranges of ioctl IDs,
> put all of them in the same file to avoid accidentally creating
> overlaps.
> 
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Vicki Pfau <vi@endrift.com>
> ---
>  include/uapi/linux/usb/g_printer.h    | 23 ++----------------
>  include/uapi/linux/usb/g_uvc.h        |  4 +--
>  include/uapi/linux/usb/gadget-ioctl.h | 35 +++++++++++++++++++++++++++
>  include/uapi/linux/usb/gadgetfs.h     | 27 +--------------------
>  4 files changed, 39 insertions(+), 50 deletions(-)
>  create mode 100644 include/uapi/linux/usb/gadget-ioctl.h
> 
> diff --git a/include/uapi/linux/usb/g_printer.h b/include/uapi/linux/usb/g_printer.h
> index 7fc20e4b82f5..fc411ee3f5cc 100644
> --- a/include/uapi/linux/usb/g_printer.h
> +++ b/include/uapi/linux/usb/g_printer.h
> @@ -3,34 +3,15 @@
>   * g_printer.h -- Header file for USB Printer gadget driver
>   *
>   * Copyright (C) 2007 Craig W. Nadler
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
> - * This program is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> - * GNU General Public License for more details.
> - *
> - * You should have received a copy of the GNU General Public License
> - * along with this program; if not, write to the Free Software
> - * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
>   */

Note, this "boiler-plate" text should be removed, you are right, but not
in this commit, as it has nothing to do with it, and should be a
stand-alone change.

So can you please split this out?

Otherwise, nice work,

greg k-h

