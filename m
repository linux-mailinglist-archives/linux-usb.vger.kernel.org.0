Return-Path: <linux-usb+bounces-2062-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D967D28A6
	for <lists+linux-usb@lfdr.de>; Mon, 23 Oct 2023 04:41:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A47D21C208BC
	for <lists+linux-usb@lfdr.de>; Mon, 23 Oct 2023 02:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01F5D139C;
	Mon, 23 Oct 2023 02:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ZKwQb1XM"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1201A3D;
	Mon, 23 Oct 2023 02:41:12 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B42B13E;
	Sun, 22 Oct 2023 19:41:11 -0700 (PDT)
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 39F77490;
	Mon, 23 Oct 2023 02:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 39F77490
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1698028871; bh=zc4kfFzHO48AWJGRzKmqCj9dpg/VKmkjjYg4dvWoePo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZKwQb1XMeAOTpud0M+II07/7UK8ERKvIIE7XClNo21B8vKxsuXp655kxTiue4SAo8
	 T6pDm19f212PQVGGBFU16mPIE1egAeNeNfUxuSWwRLtE8bFF9QFU6W+xsHr/+mx8jK
	 ePDk/5nOpuqo9KOI5eJ1wVERUesVz8D1rVO0z6Q0Q+jXILIyB/hfV2VCkyrQwuEIPm
	 K0X9gmgSuYfVlYMaw7f+cOQHRTxTJZSzwfJorxbPg3vZVSxw7knFuPKKYxzKlJcoVP
	 Y6vOdRoM39MJ90gskjt8LaEOWpYfJ7g7O63fsLx0LadtH4ME27yMa/Hw+pV7WqVYBS
	 E+9fectTnOYfQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Vegard Nossum <vegard.nossum@oracle.com>, linux-usb@vger.kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Vegard Nossum
 <vegard.nossum@oracle.com>, Daniel Scally <dan.scally@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] docs: usb: fix reference to nonexistent file in UVC Gadget
In-Reply-To: <20231022185311.919325-1-vegard.nossum@oracle.com>
References: <20231022185311.919325-1-vegard.nossum@oracle.com>
Date: Sun, 22 Oct 2023 20:41:10 -0600
Message-ID: <87edhmjc1l.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Vegard Nossum <vegard.nossum@oracle.com> writes:

> Fix a typo in the path of this reference.
>
> Fixes: 094f391013ba ("docs: usb: Add documentation for the UVC Gadget")
> Cc: Daniel Scally <dan.scally@ideasonboard.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  Documentation/usb/gadget_uvc.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/usb/gadget_uvc.rst b/Documentation/usb/gadget_uvc.rst
> index 80a1f031b593..bf78fba3ce23 100644
> --- a/Documentation/usb/gadget_uvc.rst
> +++ b/Documentation/usb/gadget_uvc.rst
> @@ -126,7 +126,7 @@ might do:
>  	create_frame 1920 1080 uncompressed yuyv
>  
>  The only uncompressed format currently supported is YUYV, which is detailed at
> -Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst.
> +Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst.

Applied, thanks.

jon

