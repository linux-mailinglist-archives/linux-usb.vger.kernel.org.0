Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E671170188
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2020 15:48:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727711AbgBZOsH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Feb 2020 09:48:07 -0500
Received: from netrider.rowland.org ([192.131.102.5]:48925 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727520AbgBZOsG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Feb 2020 09:48:06 -0500
Received: (qmail 4914 invoked by uid 500); 26 Feb 2020 09:48:05 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 26 Feb 2020 09:48:05 -0500
Date:   Wed, 26 Feb 2020 09:48:05 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Vladimir Stankovic <vladimir.stankovic@displaylink.com>
cc:     Greg KH <gregkh@linuxfoundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        mausb-host-devel <mausb-host-devel@displaylink.com>
Subject: Re: [PATCH v2 1/8] usb: Add MA-USB Host kernel module
In-Reply-To: <0dbf7da8-a0af-8750-6e91-c6d29f7e1a72@displaylink.com>
Message-ID: <Pine.LNX.4.44L0.2002260946020.3674-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 26 Feb 2020, Vladimir Stankovic wrote:

> Added utility macros, kernel device creation and cleanup, functions for
> handling log formatting and a placeholder module for MA-USB Host device
> driver.
> 
> Signed-off-by: Vladimir Stankovic <vladimir.stankovic@displaylink.com>
> ---
>   MAINTAINERS                         |  7 +++
>   drivers/usb/Kconfig                 |  2 +
>   drivers/usb/Makefile                |  2 +
>   drivers/usb/mausb_host/Kconfig      | 14 +++++
>   drivers/usb/mausb_host/Makefile     | 13 +++++
>   drivers/usb/mausb_host/mausb_host.c | 90 +++++++++++++++++++++++++++++
>   drivers/usb/mausb_host/utils.c      | 85 +++++++++++++++++++++++++++
>   drivers/usb/mausb_host/utils.h      | 40 +++++++++++++
>   8 files changed, 253 insertions(+)
>   create mode 100644 drivers/usb/mausb_host/Kconfig
>   create mode 100644 drivers/usb/mausb_host/Makefile
>   create mode 100644 drivers/usb/mausb_host/mausb_host.c
>   create mode 100644 drivers/usb/mausb_host/utils.c
>   create mode 100644 drivers/usb/mausb_host/utils.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8f27f40d22bb..6088f9aa640a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10226,6 +10226,13 @@ W:	https://linuxtv.org
>   S:	Maintained
>   F:	drivers/media/radio/radio-maxiradio*
>   +MA USB HOST DRIVER
> +M:	Vladimir Stankovic <vladimir.stankovic@displaylink.com>
> +L:	mausb-host-devel@displaylink.com
> +W:	https://www.displaylink.com
> +S:	Maintained
> +F:	drivers/usb/mausb_host/*
> +

You should mention somewhere (certainly in the patch description and in 
MAINTAINERS, maybe other places as well) that MA is an abbreviation for 
Media-Agnostic.  Otherwise people will wonder what on earth it is.

Alan Stern

