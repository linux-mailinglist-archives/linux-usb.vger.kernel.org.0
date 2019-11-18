Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBB3C100419
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2019 12:28:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbfKRL2l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Nov 2019 06:28:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:40228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726539AbfKRL2l (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Nov 2019 06:28:41 -0500
Received: from localhost (unknown [89.205.134.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C83C92068D;
        Mon, 18 Nov 2019 11:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574076520;
        bh=voi5C54j0d8gps+HgNMJVuplMQHr4gWpa/+4eLi2x6E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yxEDn1vEKjg9u6zgao1tiW0LhE9+FaUGw4lTB7l2FSAkrWVRZUdQaxW6dAZSaq2Dj
         PGVRweSc8WCwiFDjud0GchTfAFjRWY9JFCaIojl59EqJBFsA7vknUY5XD39U+qY9PY
         VhlAdRNPEzOoI2Ri6YT8QQ7ZPFR43sq0MGOLaEx4=
Date:   Mon, 18 Nov 2019 12:28:37 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Pacho Ramos <pachoramos@gmail.com>,
        Laura Abbott <labbott@fedoraproject.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: JMicron USB to ATA/ATAPI Bridge requires usb-storage quirks to
 disable uas
Message-ID: <20191118112837.GE156486@kroah.com>
References: <CAHG43MtDYqiV6pye91D8_bA-4bMvVHWFHjsDgEMsmhh2n-Z2ww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHG43MtDYqiV6pye91D8_bA-4bMvVHWFHjsDgEMsmhh2n-Z2ww@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 18, 2019 at 11:07:55AM +0100, Pacho Ramos wrote:
> Hello,
> 
> I would like to forward the patch that is being used for years in
> Fedora and Gentoo to fix connectivity issues of JMicron devices with
> UAS when they got into idle state:
> https://bugzilla.redhat.com/show_bug.cgi?id=1260207
> https://bugs.gentoo.org/640082
> 
> The problem is still valid with current kernels, then, I guess the
> patch wasn't forwarded here or got forgotten for some reason. This
> patch works fine for current kernel 4.13.11 too

Laura, any reason this patch was never sent upstream to us?  Any
objection for the patch below to be merged?

thanks,

greg k-h

> From d02a55182307c01136b599fd048b4679f259a84e Mon Sep 17 00:00:00 2001
> From: Laura Abbott <labbott@fedoraproject.org>
> Date: Tue, 8 Sep 2015 09:53:38 -0700
> Subject: [PATCH] usb-storage: Disable UAS on JMicron SATA enclosure
> 
> Steve Ellis reported incorrect block sizes and alignement
> offsets with a SATA enclosure. Adding a quirk to disable
> UAS fixes the problems.
> 
> Reported-by: Steven Ellis <sellis@redhat.com>
> Signed-off-by: Laura Abbott <labbott@fedoraproject.org>
> ---
>  drivers/usb/storage/unusual_uas.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> index c85ea53..216d93d 100644
> --- a/drivers/usb/storage/unusual_uas.h
> +++ b/drivers/usb/storage/unusual_uas.h
> @@ -141,12 +141,15 @@ UNUSUAL_DEV(0x2109, 0x0711, 0x0000, 0x9999,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_NO_ATA_1X),
>  
> -/* Reported-by: Takeo Nakayama <javhera@gmx.com> */
> +/*
> + * Initially Reported-by: Takeo Nakayama <javhera@gmx.com>
> + * UAS Ignore Reported by Steven Ellis <sellis@redhat.com>
> + */
>  UNUSUAL_DEV(0x357d, 0x7788, 0x0000, 0x9999,
>  		"JMicron",
>  		"JMS566",
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> -		US_FL_NO_REPORT_OPCODES),
> +		US_FL_NO_REPORT_OPCODES | US_FL_IGNORE_UAS),
>  
>  /* Reported-by: Hans de Goede <hdegoede@redhat.com> */
>  UNUSUAL_DEV(0x4971, 0x1012, 0x0000, 0x9999,
> -- 
> 2.4.3
> 

