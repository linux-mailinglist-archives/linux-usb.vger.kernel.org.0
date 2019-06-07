Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA5C38C2D
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2019 16:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728257AbfFGOGQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jun 2019 10:06:16 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:59449 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728199AbfFGOGQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Jun 2019 10:06:16 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 42EEE5E7;
        Fri,  7 Jun 2019 10:06:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 07 Jun 2019 10:06:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=pHGZ+LZ6yw2sG5llZMKmeaFD/ej
        dcKWBXyE7a3IM/Zo=; b=VdGAJHMFhuVfzLi+mybCwXKE88GPbVOc0sT1qGc/pEB
        uwiQiQatizlsMgWVS7MC92dmxobIPJNIfekbi3jpLtIXgMOlINM+taQGmWnKcrOj
        r9J8jTpPIqfsj6YikEitaH7GObt8ZkDF66ksIUJ9VHHkZ3/TfJMCn2mS342Nd2Oh
        2WtAYQ+HU8/Y/MENGPbzEejgRgkZfq2vLuJ/eLKNohJeq7FluKq7gvIX48kNGHWB
        +ey0RH5oVl+DtIH2Q78/20uDh/ePRTgbJKOeKCHrhzi+ecle4hunLq0xq0uXoRl4
        urn2JjKO0j651/+nD04etHgyWbqjx6BlqpFX7AzCCUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=pHGZ+L
        Z6yw2sG5llZMKmeaFD/ejdcKWBXyE7a3IM/Zo=; b=aYuS0qtV9ny2ZAV1z9PMvo
        onG7I8Sz9ZhzJHYuQiiQDcAjLE8yM3NhPrAoqN8n/Vmz8MXSQfNci8pR2BnY95qy
        u7AV3T3N22CcYdPMeH0E0tlT9UEBErWYVhyOSB6NZ17yswHKLOzFAmOVbaa9AhU9
        ZHvP5XuOqh3Yx1ZE6po926P0vTmvzXIF2hEIn5G+djUaKDTC+ufshLz7PlU2rpn7
        /AmYDH6TbNaHsOaXBhOoQOdYByC0p8dYOuRUl5lyTw0HXPbgsV6D+WoDJBZVMgRA
        co9GNq3RxUtxP6bEY8nzxshTDZZJEzsaWd79CX1GcsZ3cTXs6HkLrwpF3tFVqprg
        ==
X-ME-Sender: <xms:U2_6XPjqgiy4VvgQBKl3q8M1ENVjJEJ8un-4gSVUBuwrOS-xODzZjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudegiedgjedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecukfhppeekfedrkeeirdekledrud
    dtjeenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhmnecu
    vehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:U2_6XMJcCkpTLcY5cPkOdTTdIk9lIjdAal3TcTHsTxvcREhx6XCkDQ>
    <xmx:U2_6XHDUagJTOWLMV9s5lAdontrs4eZHYoV9FrZ9He-r4IhDGLxIhg>
    <xmx:U2_6XEjUx1wZRjI8HM4CDSbLhCe9m2-hShy2gZOMkALlxO3dQ5bs5A>
    <xmx:U2_6XCKXd3k6wWnju163M7A_ff4U3ntmG_DhQV4P-SQWYmGPVC40xQ>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id B775980064;
        Fri,  7 Jun 2019 10:06:10 -0400 (EDT)
Date:   Fri, 7 Jun 2019 16:06:08 +0200
From:   Greg KH <greg@kroah.com>
To:     Prabhat Chand Pandey <prabhat.chand.pandey@intel.com>
Cc:     linux-usb@vger.kernel.org, mathias.nyman@intel.com,
        rajaram.regupathy@intel.com, abhilash.k.v@intel.com,
        m.balaji@intel.com
Subject: Re: [PATCH 2/5] usb: xhci: dbc: DbC TTY driver to use new interface
Message-ID: <20190607140608.GE14665@kroah.com>
References: <20190607063306.5612-1-prabhat.chand.pandey@intel.com>
 <20190607063306.5612-3-prabhat.chand.pandey@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190607063306.5612-3-prabhat.chand.pandey@intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 07, 2019 at 12:03:03PM +0530, Prabhat Chand Pandey wrote:
> Change DbC TTY driver to use the new modular interface exposed by the DbC
> core. This will allow other function drivers with a different interface
> also to use DbC.

What are those other function drivers?  What is wrong with tty?

I'm missing a _lot_ of background information here...

> [no need to add running number to tty driver name, remove it. -Mathias]
> Signed-off-by: Rajaram Regupathy <rajaram.regupathy@intel.com>
> Signed-off-by: Abhilash K V <abhilash.k.v@intel.com>
> Signed-off-by: Prabhat Chand Pandey <prabhat.chand.pandey@intel.com>
> Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---
>  drivers/usb/host/Kconfig       | 15 ++++++-
>  drivers/usb/host/Makefile      |  4 +-
>  drivers/usb/host/xhci-dbgcap.h |  4 --
>  drivers/usb/host/xhci-dbgtty.c | 81 ++++++++++++++++++++++++++++++----
>  4 files changed, 90 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index d809671c5fea..c29ed8a61dcb 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -30,13 +30,26 @@ config USB_XHCI_HCD
>  if USB_XHCI_HCD
>  config USB_XHCI_DBGCAP
>  	bool "xHCI support for debug capability"
> -	depends on TTY
>  	---help---
>  	  Say 'Y' to enable the support for the xHCI debug capability. Make
>  	  sure that your xHCI host supports the extended debug capability and
>  	  you want a TTY serial device based on the xHCI debug capability
>  	  before enabling this option. If unsure, say 'N'.
>  
> +choice
> +	prompt "Select function for debug capability"
> +	depends on USB_XHCI_DBGCAP
> +
> +config USB_XHCI_DBGCAP_TTY
> +	tristate "xHCI DbC tty driver support"
> +	depends on USB_XHCI_HCD && USB_XHCI_DBGCAP && TTY
> +	help
> +	  Say 'Y' to enable the support for the tty driver interface to xHCI
> +	  debug capability. This will expose a /dev/ttyDBC* device node on device
> +	  which may be used by the usb-debug driver on the debug host.
> +	  If unsure, say 'N'.

Module name?

> +endchoice

So you have to choose at build time the "function"?  Why?  I thougth
this was to be dynamic?

> +
>  config USB_XHCI_PCI
>         tristate
>         depends on USB_PCI
> diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
> index 84514f71ae44..b21b0ea9e966 100644
> --- a/drivers/usb/host/Makefile
> +++ b/drivers/usb/host/Makefile
> @@ -16,9 +16,11 @@ xhci-hcd-y += xhci-ring.o xhci-hub.o xhci-dbg.o
>  xhci-hcd-y += xhci-trace.o
>  
>  ifneq ($(CONFIG_USB_XHCI_DBGCAP), )
> -	xhci-hcd-y += xhci-dbgcap.o xhci-dbgtty.o
> +	xhci-hcd-y += xhci-dbgcap.o
>  endif
>  
> +obj-$(CONFIG_USB_XHCI_DBGCAP_TTY) += xhci-dbgtty.o
> +
>  ifneq ($(CONFIG_USB_XHCI_MTK), )
>  	xhci-hcd-y += xhci-mtk-sch.o
>  endif
> diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
> index b4d5622a9030..302e6ca72370 100644
> --- a/drivers/usb/host/xhci-dbgcap.h
> +++ b/drivers/usb/host/xhci-dbgcap.h
> @@ -218,10 +218,6 @@ static inline struct dbc_ep *get_out_ep(struct xhci_hcd *xhci)
>  #ifdef CONFIG_USB_XHCI_DBGCAP
>  int xhci_dbc_init(struct xhci_hcd *xhci);
>  void xhci_dbc_exit(struct xhci_hcd *xhci);
> -int xhci_dbc_tty_register_driver(struct xhci_hcd *xhci);
> -void xhci_dbc_tty_unregister_driver(void);
> -int xhci_dbc_tty_register_device(struct xhci_hcd *xhci);
> -void xhci_dbc_tty_unregister_device(struct xhci_hcd *xhci);
>  struct dbc_request *dbc_alloc_request(struct dbc_ep *dep, gfp_t gfp_flags);
>  void xhci_dbc_flush_reqests(struct xhci_dbc *dbc);
>  void dbc_free_request(struct dbc_ep *dep, struct dbc_request *req);
> diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
> index aff79ff5aba4..f75a95006c51 100644
> --- a/drivers/usb/host/xhci-dbgtty.c
> +++ b/drivers/usb/host/xhci-dbgtty.c
> @@ -7,13 +7,15 @@
>   * Author: Lu Baolu <baolu.lu@linux.intel.com>
>   */
>  
> +#include <linux/module.h>
>  #include <linux/slab.h>
>  #include <linux/tty.h>
>  #include <linux/tty_flip.h>
> -
>  #include "xhci.h"
>  #include "xhci-dbgcap.h"
>  
> +#define DBC_STR_FUNC_TTY    "TTY"

What is this for?  You only use it once, what does it mean?

> +
>  static unsigned int
>  dbc_send_packet(struct dbc_port *port, char *packet, unsigned int size)
>  {
> @@ -279,12 +281,11 @@ static const struct tty_operations dbc_tty_ops = {
>  	.unthrottle		= dbc_tty_unthrottle,
>  };
>  
> -static struct tty_driver *dbc_tty_driver;
> -
> -int xhci_dbc_tty_register_driver(struct xhci_hcd *xhci)
> +static int xhci_dbc_tty_register_driver(struct xhci_hcd *xhci)
>  {
>  	int			status;
>  	struct xhci_dbc		*dbc = xhci->dbc;
> +	struct tty_driver	*dbc_tty_driver;
>  
>  	dbc_tty_driver = tty_alloc_driver(1, TTY_DRIVER_REAL_RAW |
>  					  TTY_DRIVER_DYNAMIC_DEV);
> @@ -296,7 +297,6 @@ int xhci_dbc_tty_register_driver(struct xhci_hcd *xhci)
>  
>  	dbc_tty_driver->driver_name = "dbc_serial";
>  	dbc_tty_driver->name = "ttyDBC";
> -
>  	dbc_tty_driver->type = TTY_DRIVER_TYPE_SERIAL;
>  	dbc_tty_driver->subtype = SERIAL_TYPE_NORMAL;
>  	dbc_tty_driver->init_termios = tty_std_termios;

Unneeded change.

> @@ -315,16 +315,19 @@ int xhci_dbc_tty_register_driver(struct xhci_hcd *xhci)
>  		put_tty_driver(dbc_tty_driver);
>  		dbc_tty_driver = NULL;
>  	}
> +	dbc->func_priv = dbc_tty_driver;
>  
>  	return status;
>  }
>  
> -void xhci_dbc_tty_unregister_driver(void)
> +static void xhci_dbc_tty_unregister_driver(struct xhci_dbc *dbc)
>  {
> +	struct tty_driver	*dbc_tty_driver =
> +					(struct tty_driver *) dbc->func_priv;

Horrid formatting.  Checkpatch would have warned you about this mess, so
it's obvious you didn't run it :(

>  	if (dbc_tty_driver) {
>  		tty_unregister_driver(dbc_tty_driver);
>  		put_tty_driver(dbc_tty_driver);
> -		dbc_tty_driver = NULL;
> +		dbc->func_priv = NULL;
>  	}
>  }
>  
> @@ -440,12 +443,14 @@ xhci_dbc_tty_exit_port(struct dbc_port *port)
>  	tty_port_destroy(&port->port);
>  }
>  
> -int xhci_dbc_tty_register_device(struct xhci_hcd *xhci)
> +static int xhci_dbc_tty_register_device(struct xhci_hcd *xhci)
>  {
>  	int			ret;
>  	struct device		*tty_dev;
>  	struct xhci_dbc		*dbc = xhci->dbc;
>  	struct dbc_port		*port = &dbc->port;
> +	struct tty_driver	*dbc_tty_driver =
> +					(struct tty_driver *) dbc->func_priv;

Again, ick.  Why are you casting?

And again, checkpatch.pl please.

I give up here, sorry, this series is a mess :(

greg k-h
