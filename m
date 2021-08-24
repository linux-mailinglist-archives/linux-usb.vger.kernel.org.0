Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A3393F59BF
	for <lists+linux-usb@lfdr.de>; Tue, 24 Aug 2021 10:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235262AbhHXISb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Aug 2021 04:18:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:54770 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235167AbhHXISa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 24 Aug 2021 04:18:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 11DD061220;
        Tue, 24 Aug 2021 08:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629793067;
        bh=Uqh9V7RiyCOOsjNNGZXQDRCdogTxCQ6i/WZpirnIPUQ=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=ZIO4STnhpm5yWomrTKSgkienTK9APTPRnjHapfckD0oDZ0e3b4sfuGfmrDh4T+PgM
         bAmozx7n1LHoUY4RXshwicbrlBCGcF1p4grgqh84hM+xdZmEnC+X25pP9tloKzuJ+a
         kAQiJGqS/3F9bttcujQBEpjGHa5HlAVwE22tIYd+wbS9J+R6nlB6v+4skcHn+C5SId
         q8H19mAsT8zh7R7BYnsT9bJwxpYvEkCJWYPKQQPrO2vI1kzmUErQRIJUFSo3Fm0BDO
         ACjpfr65eBQ2hgaOEq8IZlEFC5toYyky5w7NH1IgzKTa2/AfCKx4QW7ADh97DR4ERU
         t/CFfSSdW8oUQ==
References: <1629777281-30188-1-git-send-email-quic_linyyuan@quicinc.com>
 <1629777281-30188-2-git-send-email-quic_linyyuan@quicinc.com>
User-agent: mu4e 1.6.4; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH V4 1/3] usb: gadget: configfs: add UDC trace entry
Date:   Tue, 24 Aug 2021 11:15:34 +0300
In-reply-to: <1629777281-30188-2-git-send-email-quic_linyyuan@quicinc.com>
Message-ID: <8735qz8deg.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Linyu Yuan <quic_linyyuan@quicinc.com> writes:
> add trace in function gadget_dev_desc_UDC_store()
> will show when user space enable/disable the gadget.
>
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
>  drivers/usb/gadget/Makefile         |  1 +
>  drivers/usb/gadget/configfs.c       |  3 +++
>  drivers/usb/gadget/configfs_trace.c |  7 +++++++
>  drivers/usb/gadget/configfs_trace.h | 39 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 50 insertions(+)
>  create mode 100644 drivers/usb/gadget/configfs_trace.c
>  create mode 100644 drivers/usb/gadget/configfs_trace.h
>
> diff --git a/drivers/usb/gadget/Makefile b/drivers/usb/gadget/Makefile
> index 130dad7..8e9c2b8 100644
> --- a/drivers/usb/gadget/Makefile
> +++ b/drivers/usb/gadget/Makefile
> @@ -9,5 +9,6 @@ ccflags-y				+= -I$(srctree)/drivers/usb/gadget/udc
>  obj-$(CONFIG_USB_LIBCOMPOSITE)	+= libcomposite.o
>  libcomposite-y			:= usbstring.o config.o epautoconf.o
>  libcomposite-y			+= composite.o functions.o configfs.o u_f.o
> +libcomposite-y			+= configfs_trace.o
>  
>  obj-$(CONFIG_USB_GADGET)	+= udc/ function/ legacy/
> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> index 477e72a..f7f3af8 100644
> --- a/drivers/usb/gadget/configfs.c
> +++ b/drivers/usb/gadget/configfs.c
> @@ -9,6 +9,7 @@
>  #include "configfs.h"
>  #include "u_f.h"
>  #include "u_os_desc.h"
> +#include "configfs_trace.h"
>  
>  int check_user_usb_string(const char *name,
>  		struct usb_gadget_strings *stringtab_dev)
> @@ -270,6 +271,8 @@ static ssize_t gadget_dev_desc_UDC_store(struct config_item *item,
>  	if (name[len - 1] == '\n')
>  		name[len - 1] = '\0';
>  
> +	trace_gadget_dev_desc_UDC_store(config_item_name(item), name);

why tracing only the names? This gives us no insight into whatever bug
may happen and we may want to use trace events to debug. Rather, try to
think of trace events as tracking the lifetime of the UDC and
gadget. Trace values that may change over time.

I also think that all three patches could be combined into a single
commit, but that's up to discussion.


-- 
balbi
