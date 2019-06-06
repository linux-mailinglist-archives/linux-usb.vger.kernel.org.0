Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1FC37694
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2019 16:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728850AbfFFO0r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jun 2019 10:26:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:36882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727133AbfFFO0r (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 6 Jun 2019 10:26:47 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 643CC20673;
        Thu,  6 Jun 2019 14:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559831206;
        bh=tMlmVuybP0ERSD6YOLf6b2aNJLVoDYwc0+8mbQx6Dxg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=z8hYAOtbpyhEYWM+kv9VABC8pppfgprB2ZXcKwT2A9/ISJWPj+NgJblQk5fAlksvF
         jXZE/Ve4KmkkgDbGJ5THTSs7Qv4+Pvk0l3U7rMkEO3jXVVTbIsUcCbNGBa8KgWTTMY
         L+X9qG5bc2nbJ3MiH6vtE9BhwqoOCUpYX+2eoS1w=
Date:   Thu, 6 Jun 2019 16:26:44 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH usbutils] usb-devices.1: don't mention bash
Message-ID: <20190606142644.GA10755@kroah.com>
References: <920def362c8890ea3bed391cd120df17ce00a0cd.1559043424.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <920def362c8890ea3bed391cd120df17ce00a0cd.1559043424.git.baruch@tkos.co.il>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 28, 2019 at 02:37:04PM +0300, Baruch Siach wrote:
> Since commit 508d1acf42e ("usb-devices: use /bin/sh hashbang")
> usb-devices does not require bash.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  usb-devices.1.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/usb-devices.1.in b/usb-devices.1.in
> index c5c1b798e4c3..2b142371cd67 100644
> --- a/usb-devices.1.in
> +++ b/usb-devices.1.in
> @@ -11,7 +11,7 @@ usb-devices \- print USB device details
>  
>  .SH DESCRIPTION
>  .B usb-devices
> -is a (bash) shell script that can be used to display details of USB
> +is a shell script that can be used to display details of USB
>  buses in the system and the devices connected to them.
>  
>  The output of the script is similar to the \fIusb/devices\fP file
> -- 
> 2.20.1
> 

Now applied, thanks!

greg k-h
