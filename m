Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65CD938C24
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2019 16:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729230AbfFGOCr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jun 2019 10:02:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:33852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729125AbfFGOCr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 Jun 2019 10:02:47 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 09F2A208E3;
        Fri,  7 Jun 2019 14:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559916165;
        bh=dszgfHUclvDJfqaLlLYoEcQ6TUqNQU3DcrVC8zvEV5c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ubCH3g8HFNkfR7GAoauYwXmwMdVB3nAu8ya9TU7K+Y13H3uoTHa18dg8OcQIPcJvi
         w61VAB0Rz3wZV1W66c2YLwhvkOjMk3xjlgPEbneKJHkKqa+tj9ZRJU13EVCIKpPzU/
         yNyh9rg/Nu81FnPn0dp7Z2RSqoiWLVPVkI/vqTPU=
Date:   Fri, 7 Jun 2019 16:02:42 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Prabhat Chand Pandey <prabhat.chand.pandey@intel.com>
Cc:     linux-usb@vger.kernel.org, mathias.nyman@intel.com,
        rajaram.regupathy@intel.com, abhilash.k.v@intel.com,
        m.balaji@intel.com
Subject: Re: [PATCH 1/5] usb: xhci: dbc: make DbC modular, introducing
 dbc_function structure
Message-ID: <20190607140242.GD14665@kroah.com>
References: <20190607063306.5612-1-prabhat.chand.pandey@intel.com>
 <20190607063306.5612-2-prabhat.chand.pandey@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190607063306.5612-2-prabhat.chand.pandey@intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 07, 2019 at 12:03:02PM +0530, Prabhat Chand Pandey wrote:
> This patch introduces the dbc_function structure as a first step in
> making DbC modular and capable in exposing different user interfaces using
> different "functions", which may implement the callbacks exposed here
> according to the driver's need.
> 
> Only one "function" can be registered at a time.
> The generic way to enable a DbC function would be, using sys-fs:

"sysfs"

> 
> Locate the directory for PCI enumerated XHCI host controller in the
> sysfs path.
> e.g.: cd /sys/bus/pci/devices/0000:00:14.0
> $ echo "enable" > dbc

You are adding a new sysfs file to the pci device?  why?

> This is done AFTER the function is selected at build time. Only 1 function
> can be selected at a time.

Why?

And "dbc" is debug port, right?  Or is it something else?

> Signed-off-by: Rajaram Regupathy <rajaram.regupathy@intel.com>
> Signed-off-by: Abhilash K V <abhilash.k.v@intel.com>
> Signed-off-by: Prabhat Chand Pandey <prabhat.chand.pandey@intel.com>
> Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---
>  drivers/usb/host/xhci-dbgcap.c | 159 ++++++++++++++++++++++-----------
>  drivers/usb/host/xhci-dbgcap.h |  32 ++++++-
>  2 files changed, 138 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
> index 52e32644a4b2..96adc53b0fdb 100644
> --- a/drivers/usb/host/xhci-dbgcap.c
> +++ b/drivers/usb/host/xhci-dbgcap.c
> @@ -9,11 +9,14 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/slab.h>
>  #include <linux/nls.h>
> +#include <linux/module.h>
>  
>  #include "xhci.h"
>  #include "xhci-trace.h"
>  #include "xhci-dbgcap.h"
>  
> +static struct dbc_function *dbc_registered_func;
> +
>  static inline void *
>  dbc_dma_alloc_coherent(struct xhci_hcd *xhci, size_t size,
>  		       dma_addr_t *dma_handle, gfp_t flags)
> @@ -35,41 +38,42 @@ dbc_dma_free_coherent(struct xhci_hcd *xhci, size_t size,
>  				  size, cpu_addr, dma_handle);
>  }
>  
> -static u32 xhci_dbc_populate_strings(struct dbc_str_descs *strings)
> +static u32 xhci_dbc_populate_strings(struct dbc_str_descs *strings,
> +					struct dbc_function *func)
>  {
>  	struct usb_string_descriptor	*s_desc;
>  	u32				string_length;
>  
>  	/* Serial string: */
>  	s_desc = (struct usb_string_descriptor *)strings->serial;
> -	utf8s_to_utf16s(DBC_STRING_SERIAL, strlen(DBC_STRING_SERIAL),
> +	utf8s_to_utf16s(func->string.serial, strlen(func->string.serial),
>  			UTF16_LITTLE_ENDIAN, (wchar_t *)s_desc->wData,
>  			DBC_MAX_STRING_LENGTH);
>  
> -	s_desc->bLength		= (strlen(DBC_STRING_SERIAL) + 1) * 2;
> +	s_desc->bLength		= (strlen(func->string.serial) + 1) * 2;
>  	s_desc->bDescriptorType	= USB_DT_STRING;
>  	string_length		= s_desc->bLength;
>  	string_length		<<= 8;
>  
>  	/* Product string: */
>  	s_desc = (struct usb_string_descriptor *)strings->product;
> -	utf8s_to_utf16s(DBC_STRING_PRODUCT, strlen(DBC_STRING_PRODUCT),
> +	utf8s_to_utf16s(func->string.product, strlen(func->string.product),
>  			UTF16_LITTLE_ENDIAN, (wchar_t *)s_desc->wData,
>  			DBC_MAX_STRING_LENGTH);
>  
> -	s_desc->bLength		= (strlen(DBC_STRING_PRODUCT) + 1) * 2;
> +	s_desc->bLength		= (strlen(func->string.product) + 1) * 2;
>  	s_desc->bDescriptorType	= USB_DT_STRING;
>  	string_length		+= s_desc->bLength;
>  	string_length		<<= 8;
>  
>  	/* Manufacture string: */
>  	s_desc = (struct usb_string_descriptor *)strings->manufacturer;
> -	utf8s_to_utf16s(DBC_STRING_MANUFACTURER,
> -			strlen(DBC_STRING_MANUFACTURER),
> +	utf8s_to_utf16s(func->string.manufacturer,
> +			strlen(func->string.manufacturer),
>  			UTF16_LITTLE_ENDIAN, (wchar_t *)s_desc->wData,
>  			DBC_MAX_STRING_LENGTH);
>  
> -	s_desc->bLength		= (strlen(DBC_STRING_MANUFACTURER) + 1) * 2;
> +	s_desc->bLength		= (strlen(func->string.manufacturer) + 1) * 2;
>  	s_desc->bDescriptorType	= USB_DT_STRING;
>  	string_length		+= s_desc->bLength;
>  	string_length		<<= 8;
> @@ -84,7 +88,9 @@ static u32 xhci_dbc_populate_strings(struct dbc_str_descs *strings)
>  	return string_length;
>  }
>  
> -static void xhci_dbc_init_contexts(struct xhci_hcd *xhci, u32 string_length)
> +static void xhci_dbc_init_contexts(struct xhci_hcd *xhci,
> +					struct dbc_function *func,
> +					u32 string_length)
>  {
>  	struct xhci_dbc		*dbc;
>  	struct dbc_info_context	*info;
> @@ -124,10 +130,10 @@ static void xhci_dbc_init_contexts(struct xhci_hcd *xhci, u32 string_length)
>  	/* Set DbC context and info registers: */
>  	xhci_write_64(xhci, dbc->ctx->dma, &dbc->regs->dccp);
>  
> -	dev_info = cpu_to_le32((DBC_VENDOR_ID << 16) | DBC_PROTOCOL);
> +	dev_info = cpu_to_le32((func->vid << 16) | func->protocol);
>  	writel(dev_info, &dbc->regs->devinfo1);
>  
> -	dev_info = cpu_to_le32((DBC_DEVICE_REV << 16) | DBC_PRODUCT_ID);
> +	dev_info = cpu_to_le32((func->device_rev << 16) | func->pid);
>  	writel(dev_info, &dbc->regs->devinfo2);
>  }
>  
> @@ -181,11 +187,13 @@ static void xhci_dbc_flush_endpoint_requests(struct dbc_ep *dep)
>  		xhci_dbc_flush_single_request(req);
>  }
>  
> -static void xhci_dbc_flush_requests(struct xhci_dbc *dbc)
> +
> +void xhci_dbc_flush_requests(struct xhci_dbc *dbc)
>  {
>  	xhci_dbc_flush_endpoint_requests(&dbc->eps[BULK_OUT]);
>  	xhci_dbc_flush_endpoint_requests(&dbc->eps[BULK_IN]);
>  }
> +EXPORT_SYMBOL_GPL(xhci_dbc_flush_requests);
>  
>  struct dbc_request *
>  dbc_alloc_request(struct dbc_ep *dep, gfp_t gfp_flags)
> @@ -205,6 +213,7 @@ dbc_alloc_request(struct dbc_ep *dep, gfp_t gfp_flags)
>  
>  	return req;
>  }
> +EXPORT_SYMBOL_GPL(dbc_alloc_request);
>  
>  void
>  dbc_free_request(struct dbc_ep *dep, struct dbc_request *req)
> @@ -213,6 +222,7 @@ dbc_free_request(struct dbc_ep *dep, struct dbc_request *req)
>  
>  	kfree(req);
>  }
> +EXPORT_SYMBOL_GPL(dbc_free_request);
>  
>  static void
>  xhci_dbc_queue_trb(struct xhci_ring *ring, u32 field1,
> @@ -344,6 +354,7 @@ int dbc_ep_queue(struct dbc_ep *dep, struct dbc_request *req,
>  
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(dbc_ep_queue);
>  
>  static inline void xhci_dbc_do_eps_init(struct xhci_hcd *xhci, bool direction)
>  {
> @@ -371,7 +382,9 @@ static void xhci_dbc_eps_exit(struct xhci_hcd *xhci)
>  	memset(dbc->eps, 0, sizeof(struct dbc_ep) * ARRAY_SIZE(dbc->eps));
>  }
>  
> -static int xhci_dbc_mem_init(struct xhci_hcd *xhci, gfp_t flags)
> +static int xhci_dbc_mem_init(struct xhci_hcd *xhci,
> +				struct dbc_function *func,
> +				gfp_t flags)
>  {
>  	int			ret;
>  	dma_addr_t		deq;
> @@ -418,8 +431,8 @@ static int xhci_dbc_mem_init(struct xhci_hcd *xhci, gfp_t flags)
>  	xhci_write_64(xhci, deq, &dbc->regs->erdp);
>  
>  	/* Setup strings and contexts: */
> -	string_length = xhci_dbc_populate_strings(dbc->string);
> -	xhci_dbc_init_contexts(xhci, string_length);
> +	string_length = xhci_dbc_populate_strings(dbc->string, func);
> +	xhci_dbc_init_contexts(xhci, func, string_length);
>  
>  	xhci_dbc_eps_init(xhci);
>  	dbc->state = DS_INITIALIZED;
> @@ -478,20 +491,9 @@ static int xhci_do_dbc_start(struct xhci_hcd *xhci)
>  	u32			ctrl;
>  	struct xhci_dbc		*dbc = xhci->dbc;
>  
> -	if (dbc->state != DS_DISABLED)
> +	if (dbc->state != DS_INITIALIZED)
>  		return -EINVAL;
>  
> -	writel(0, &dbc->regs->control);
> -	ret = xhci_handshake(&dbc->regs->control,
> -			     DBC_CTRL_DBC_ENABLE,
> -			     0, 1000);
> -	if (ret)
> -		return ret;
> -
> -	ret = xhci_dbc_mem_init(xhci, GFP_ATOMIC);
> -	if (ret)
> -		return ret;
> -
>  	ctrl = readl(&dbc->regs->control);
>  	writel(ctrl | DBC_CTRL_DBC_ENABLE | DBC_CTRL_PORT_ENABLE,
>  	       &dbc->regs->control);
> @@ -552,9 +554,13 @@ static void xhci_dbc_stop(struct xhci_hcd *xhci)
>  
>  	cancel_delayed_work_sync(&dbc->event_work);
>  
> -	if (port->registered)
> -		xhci_dbc_tty_unregister_device(xhci);
> -
> +	if (port->registered &&
> +	    dbc_registered_func &&
> +	    dbc_registered_func->post_disconnect) {
> +		ret = dbc_registered_func->post_disconnect(dbc);
> +		if (ret)
> +			xhci_err(xhci, "dbc post_disconnect error %d\n", ret);
> +	}
>  	spin_lock_irqsave(&dbc->lock, flags);
>  	ret = xhci_do_dbc_stop(xhci);
>  	spin_unlock_irqrestore(&dbc->lock, flags);
> @@ -798,16 +804,12 @@ static void xhci_dbc_handle_events(struct work_struct *work)
>  
>  	switch (evtr) {
>  	case EVT_GSER:
> -		ret = xhci_dbc_tty_register_device(xhci);
> -		if (ret) {
> -			xhci_err(xhci, "failed to alloc tty device\n");
> -			break;
> -		}
> -
> -		xhci_info(xhci, "DbC now attached to /dev/ttyDBC0\n");
> +		if (dbc_registered_func->post_config)
> +			dbc_registered_func->post_config(dbc);
>  		break;
>  	case EVT_DISC:
> -		xhci_dbc_tty_unregister_device(xhci);
> +		if (dbc_registered_func->post_disconnect)
> +			ret = dbc_registered_func->post_disconnect(dbc);
>  		break;
>  	case EVT_DONE:
>  		break;
> @@ -912,46 +914,76 @@ static ssize_t dbc_store(struct device *dev,
>  			 struct device_attribute *attr,
>  			 const char *buf, size_t count)
>  {
> +	struct xhci_dbc		*dbc;
>  	struct xhci_hcd		*xhci;
> +	int			ret = 0;
>  
>  	xhci = hcd_to_xhci(dev_get_drvdata(dev));
> +	dbc = xhci->dbc;
>  
> -	if (!strncmp(buf, "enable", 6))
> +	if (!strncmp(buf, "enable", 6) && dbc->state == DS_DISABLED) {
> +		if (!dbc_registered_func)
> +			return -EINVAL;
> +		if (!try_module_get(dbc_registered_func->owner))
> +			return -ENODEV;
> +		ret = xhci_dbc_mem_init(dbc->xhci, dbc_registered_func,
> +						GFP_ATOMIC);
> +		if (ret)
> +			goto err;
> +		if (dbc_registered_func->run)
> +			ret = dbc_registered_func->run(dbc);
> +		if (ret) {
> +			xhci_dbc_mem_cleanup(xhci);
> +			dbc->state = DS_DISABLED;
> +			goto err;
> +		}
>  		xhci_dbc_start(xhci);
> -	else if (!strncmp(buf, "disable", 7))
> +	} else if (!strncmp(buf, "disable", 7) && dbc->state != DS_DISABLED) {
> +		if (!dbc_registered_func)
> +			return -EINVAL;
>  		xhci_dbc_stop(xhci);
> -	else
> +		if (dbc_registered_func->stop)
> +			dbc_registered_func->stop(dbc);
> +		module_put(dbc_registered_func->owner);
> +	} else
>  		return -EINVAL;
>  
>  	return count;
> +err:
> +	module_put(dbc_registered_func->owner);
> +	return ret;
>  }
>  
>  static DEVICE_ATTR_RW(dbc);
>  
> +static struct attribute *dbc_dev_attributes[] = {
> +	&dev_attr_dbc.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group dbc_dev_attrib_grp = {
> +	.attrs = dbc_dev_attributes,
> +};
> +
> +
>  int xhci_dbc_init(struct xhci_hcd *xhci)
>  {
>  	int			ret;
>  	struct device		*dev = xhci_to_hcd(xhci)->self.controller;
>  
>  	ret = xhci_do_dbc_init(xhci);
> -	if (ret)
> -		goto init_err3;
> -
> -	ret = xhci_dbc_tty_register_driver(xhci);
>  	if (ret)
>  		goto init_err2;
>  
> -	ret = device_create_file(dev, &dev_attr_dbc);
> +	ret = sysfs_create_group(&dev->kobj, &dbc_dev_attrib_grp);
>  	if (ret)
>  		goto init_err1;
>  
>  	return 0;
>  
>  init_err1:
> -	xhci_dbc_tty_unregister_driver();
> -init_err2:
>  	xhci_do_dbc_exit(xhci);
> -init_err3:
> +init_err2:
>  	return ret;
>  }
>  
> @@ -963,11 +995,38 @@ void xhci_dbc_exit(struct xhci_hcd *xhci)
>  		return;
>  
>  	device_remove_file(dev, &dev_attr_dbc);
> -	xhci_dbc_tty_unregister_driver();
>  	xhci_dbc_stop(xhci);
>  	xhci_do_dbc_exit(xhci);
>  }
>  
> +static inline int is_invalid(int val)
> +{
> +	return (val <  0 || val > 0xffff);
> +}
> +
> +int xhci_dbc_register_function(struct dbc_function *func)
> +{
> +	if (dbc_registered_func)
> +		return -EBUSY;
> +
> +	if (is_invalid(func->protocol) ||
> +		is_invalid(func->vid) ||
> +		is_invalid(func->pid) ||
> +		is_invalid(func->device_rev))
> +		return -EINVAL;
> +	if (!func->run || !func->stop)
> +		return -EINVAL;
> +	dbc_registered_func = func;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(xhci_dbc_register_function);
> +
> +void xhci_dbc_unregister_function(void)
> +{
> +	dbc_registered_func = NULL;
> +}
> +EXPORT_SYMBOL_GPL(xhci_dbc_unregister_function);
> +
>  #ifdef CONFIG_PM
>  int xhci_dbc_suspend(struct xhci_hcd *xhci)
>  {
> diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
> index ce0c6072bd48..b4d5622a9030 100644
> --- a/drivers/usb/host/xhci-dbgcap.h
> +++ b/drivers/usb/host/xhci-dbgcap.h
> @@ -11,6 +11,7 @@
>  
>  #include <linux/tty.h>
>  #include <linux/kfifo.h>
> +#include <linux/kernel.h>
>  
>  struct dbc_regs {
>  	__le32	capability;
> @@ -48,9 +49,9 @@ struct dbc_info_context {
>  
>  #define DBC_MAX_PACKET			1024
>  #define DBC_MAX_STRING_LENGTH		64
> -#define DBC_STRING_MANUFACTURER		"Linux Foundation"
> -#define DBC_STRING_PRODUCT		"Linux USB Debug Target"
> -#define DBC_STRING_SERIAL		"0001"
> +#define DBC_STR_MANUFACTURER		"Linux Foundation"
> +#define DBC_STR_PRODUCT		"Linux USB Debug Target"
> +#define DBC_STR_SERIAL			"0001"
>  #define	DBC_CONTEXT_SIZE		64
>  
>  /*
> @@ -75,6 +76,7 @@ struct dbc_str_descs {
>  #define DBC_PRODUCT_ID			0x0010	/* device 0010 */
>  #define DBC_DEVICE_REV			0x0010	/* 0.10 */
>  
> +
>  enum dbc_state {
>  	DS_DISABLED = 0,
>  	DS_INITIALIZED,
> @@ -108,6 +110,25 @@ struct dbc_ep {
>  	unsigned			direction:1;
>  };
>  
> +struct dbc_function {
> +	char				func_name[32];
> +	/* string descriptors */
> +	struct dbc_str_descs            string;
> +	/* other device or interface descriptors */
> +	u16				protocol;
> +	u16				vid;
> +	u16				pid;
> +	u16				device_rev;

le16 for all of these?

> +	/* callbacks */
> +	int (*run)(struct xhci_dbc *dbc);
> +	int (*post_config)(struct xhci_dbc *dbc);
> +	int (*post_disconnect)(struct xhci_dbc *dbc);
> +	int (*stop)(struct xhci_dbc *dbc);
> +
> +	/* module owner */
> +	struct module			*owner;
> +};

Why would a function have a module owner?

What exactly is a "function"?  is it a driver?  If so, why not make it a
real driver, have a real bus, and bind drivers to the devices on the
bus?

thanks,

greg k-h
