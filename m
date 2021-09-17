Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D2CF40F1A3
	for <lists+linux-usb@lfdr.de>; Fri, 17 Sep 2021 07:32:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244881AbhIQFdU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Sep 2021 01:33:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:48120 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229704AbhIQFdQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 17 Sep 2021 01:33:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 70B4760F6D;
        Fri, 17 Sep 2021 05:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631856715;
        bh=wmw9k01/AvuhnEyQwRWm6jRIXEaJDV2SvbYKsXBqtDg=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=m0mP+HfIDtTMb5L9/45deKc6VMDcjk5SqjgJfhf6zy4aiJ3gqe+YgpHdTLlAlwKvx
         oe/v9jZjnQ7HXJf2b/IBClfIMRAYwTHq79I3p84DfV23bhp1pKqHHVwJdJmEe5an/6
         /a16i2FcgpLl9gPgxxILatO+08jt8DwhpkYnEy9tQw88UDYnlcycqSxpeCRoJBl7bE
         CWaxN0Q0Y0EgonEvg6jZKCLN32QD3v2NzM8srWUq5HA8nfYWpwBVy+o4SgGVoR4885
         NaFBqhRrYCGhxGR00Sgo8RObh3q8VXKH6GZdWrKk9LkiD3EpXXuLajpD0kAMgXg2Iy
         sDVMWMgaUXlNg==
References: <YUNbDyoTPa+5J9Od@ws2>
User-agent: mu4e 1.6.5; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Andreas Bauer <andreas.bauer.nexus@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget/legacy/ether: assume saner default power mode
Date:   Fri, 17 Sep 2021 08:28:16 +0300
In-reply-to: <YUNbDyoTPa+5J9Od@ws2>
Message-ID: <87pmt7ahtj.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Andreas Bauer <andreas.bauer.nexus@gmail.com> writes:

> I propose the included patch to the OTG USB ethernet gadget code:
>
>   Report default of bus powered and 500mA bMaxPower consumption.
>
> Reason:
>
>   The USB spec requires all devices consuming more than 100mA from
>   the bus to report in this manner. Devices such as Rpi Zero can operate
>   in this mode and will then falsly report being self-powered when they
>   are not.
>
>   The more sane default is to report being 500mA bus-powered than being
>   self-powered
>
> This patch was born from an issue within the Raspberry Pi Zero ecosystem,
> therefore I would invite comment regarding other usage of this OTG code.

Have a look at other commits to get examples of how to write commits for
upstream. You're missing your Signed-off-by, adding extra unnecessary
spaces and making your signature show up in the commit log. All of
these are described in kernel documentation this
(https://www.kernel.org/doc/html/latest/process/submitting-patches.html)
is a good starting point.

> $ diff -u linux-5.14.2/drivers/usb/gadget/legacy/ether.c.orig linux-5.14.2/drivers/usb/gadget/legacy/ether.c
> --- linux-5.14.2/drivers/usb/gadget/legacy/ether.c.orig	2021-09-08 13:52:41.000000000 +0700
> +++ linux-5.14.2/drivers/usb/gadget/legacy/ether.c	2021-09-16 21:25:06.782958554 +0700
> @@ -296,7 +296,8 @@
>  	/* .label = f(hardware) */
>  	.bConfigurationValue	= 1,
>  	/* .iConfiguration = DYNAMIC */
> -	.bmAttributes		= USB_CONFIG_ATT_SELFPOWER,
> +	.bmAttributes		= 0,   /* bus powered implied */
> +	.bMaxPower		= 250, /* 500mA in 2mA units */

right, your "sane" default now prevents this gadget driver from working
behind bus powered hubs. Considering that a linux-based device is likely
to have its own battery, this is not really a sane default.

The default value of "self powered", seems much saner ;-)

-- 
balbi
