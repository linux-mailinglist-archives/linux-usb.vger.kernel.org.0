Return-Path: <linux-usb+bounces-5089-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C07082E821
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jan 2024 04:17:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 284901F238AA
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jan 2024 03:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009B26FD5;
	Tue, 16 Jan 2024 03:17:44 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 68DA779C0
	for <linux-usb@vger.kernel.org>; Tue, 16 Jan 2024 03:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 732488 invoked by uid 1000); 15 Jan 2024 22:17:34 -0500
Date: Mon, 15 Jan 2024 22:17:34 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: Eric Van Hensbergen <ericvh@kernel.org>,
  Latchesar Ionkov <lucho@ionkov.net>,
  Dominique Martinet <asmadeus@codewreck.org>,
  Christian Schoenebeck <linux_oss@crudebyte.com>,
  Jonathan Corbet <corbet@lwn.net>,
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>, v9fs@lists.linux.dev,
  linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 1/3] usb: gadget: function: 9pfs
Message-ID: <4856923e-3ce8-4372-9451-f9c8aa157111@rowland.harvard.edu>
References: <20240116-ml-topic-u9p-v1-0-ad8c306f9a4e@pengutronix.de>
 <20240116-ml-topic-u9p-v1-1-ad8c306f9a4e@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240116-ml-topic-u9p-v1-1-ad8c306f9a4e@pengutronix.de>

On Tue, Jan 16, 2024 at 02:49:41AM +0100, Michael Grzeschik wrote:
> Add the new gadget function for 9pfs transport. This function is
> defining an simple 9pfs transport interface that consists of one in and
> one out endpoint. The endpoints transmit and receive the 9pfs protocol
> payload when mounting a 9p filesystem over usb.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
>  Documentation/filesystems/9p.rst     |  12 +
>  drivers/usb/gadget/Kconfig           |  11 +
>  drivers/usb/gadget/function/Makefile |   2 +
>  drivers/usb/gadget/function/f_9pfs.c | 849 +++++++++++++++++++++++++++++++++++
>  4 files changed, 874 insertions(+)
> 

> diff --git a/drivers/usb/gadget/Kconfig b/drivers/usb/gadget/Kconfig
> index b3592bcb0f966..72cdecaef6aa9 100644
> --- a/drivers/usb/gadget/Kconfig
> +++ b/drivers/usb/gadget/Kconfig
> @@ -153,6 +153,10 @@ config USB_F_ACM
>  config USB_F_SS_LB
>  	tristate
>  
> +config USB_F_9PFS
> +	tristate
> +	select NET_9P
> +
>  config USB_U_SERIAL
>  	tristate
>  
> @@ -363,6 +367,13 @@ config USB_CONFIGFS_F_LB_SS
>  	  test software, like the "usbtest" driver, to put your hardware
>  	  and its driver through a basic set of functional tests.
>  
> +config USB_CONFIGFS_F_9PFS
> +	bool "9pfs over usb gadget"
> +	depends on USB_CONFIGFS
> +	select USB_F_9PFS
> +	help
> +	  9pfs support for usb gadget

This may be a dumb question, but what is the purpose of this CONFIG
symbol?  It doesn't get used by any of the patches in this series, as
far as I can see.

Alan Stern

