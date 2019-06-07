Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 070FC38CD9
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2019 16:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728906AbfFGOVg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jun 2019 10:21:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:43460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728311AbfFGOVg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 Jun 2019 10:21:36 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A9B63206E0;
        Fri,  7 Jun 2019 14:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559917295;
        bh=PPhaLs6o/v/rlYSISFdVhkY1NPprXyJk/i/vzqDO8mk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yzzjh/XKET9dQsOJKaZfuGlFQq7wojUjr8YIXf23CMtPpoXigUQPdTNojw4foi9iz
         lxjRp75xjUVLrq6wb8d1IQNb6+lmhAz4A3JCk6v4cSUC2LOnWhJVbmJpLHqMBjlZbQ
         Bv21IISuXMBTafxwWVOrkG0n2UYo3MzFfQlUohdY=
Date:   Fri, 7 Jun 2019 16:21:32 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Prabhat Chand Pandey <prabhat.chand.pandey@intel.com>
Cc:     linux-usb@vger.kernel.org, mathias.nyman@intel.com,
        rajaram.regupathy@intel.com, abhilash.k.v@intel.com,
        m.balaji@intel.com
Subject: Re: [PATCH 4/5] usb: xhci: dbc: Add a dbc raw driver to provide a
 raw interface on DbC
Message-ID: <20190607142132.GG14665@kroah.com>
References: <20190607063306.5612-1-prabhat.chand.pandey@intel.com>
 <20190607063306.5612-5-prabhat.chand.pandey@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190607063306.5612-5-prabhat.chand.pandey@intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 07, 2019 at 12:03:05PM +0530, Prabhat Chand Pandey wrote:
> From: Abhilash K V <abhilash.k.v@intel.com>
> 
> This patch provides a raw device interface on xhci Debug capability.

What is a "raw device"?

> This abstracts dbc functionality to user space inorder to facilitate
> various frameworks to utilize xhci debug capability.

I do not understand this sentance at all.  Please provide a lot more
information.

> It helps to render the target as an usb debug class device on host and
> establish an usb connection by providing two bulk endpoints.

provide bulk endpoints where?  To send data where?  This is very
confusing and does not make any sense to me...


> 
> [don't dynamically allocate tiny space for name only -Mathias]
> Signed-off-by: Rajaram Regupathy <rajaram.regupathy@intel.com>
> Signed-off-by: Prabhat Chand Pandey <prabhat.chand.pandey@intel.com>
> Signed-off-by: Abhilash K V <abhilash.k.v@intel.com>
> Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> ---
>  drivers/usb/host/Kconfig       |   9 +
>  drivers/usb/host/Makefile      |   1 +
>  drivers/usb/host/xhci-dbgraw.c | 365 +++++++++++++++++++++++++++++++++
>  3 files changed, 375 insertions(+)
>  create mode 100644 drivers/usb/host/xhci-dbgraw.c
> 
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index c29ed8a61dcb..0f801977cd1e 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -48,6 +48,15 @@ config USB_XHCI_DBGCAP_TTY
>  	  debug capability. This will expose a /dev/ttyDBC* device node on device
>  	  which may be used by the usb-debug driver on the debug host.
>  	  If unsure, say 'N'.
> +
> +config USB_XHCI_DBGCAP_RAW
> +       tristate "xHCI DbC raw driver support"
> +       depends on USB_XHCI_HCD && USB_XHCI_DBGCAP
> +       help
> +         Say 'Y' to enable the support for the raw driver interface to xHCI
> +         debug capability. This will expose a device node corresponding to
> +         1 bulk IN and 1 bulk OUT endpoints to be presented to debug host.
> +         If unsure, say 'N'.

module name?

>  endchoice
>  
>  config USB_XHCI_PCI
> diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
> index b21b0ea9e966..a4aee6a5daf0 100644
> --- a/drivers/usb/host/Makefile
> +++ b/drivers/usb/host/Makefile
> @@ -20,6 +20,7 @@ ifneq ($(CONFIG_USB_XHCI_DBGCAP), )
>  endif
>  
>  obj-$(CONFIG_USB_XHCI_DBGCAP_TTY) += xhci-dbgtty.o
> +obj-$(CONFIG_USB_XHCI_DBGCAP_RAW) += xhci-dbgraw.o
>  
>  ifneq ($(CONFIG_USB_XHCI_MTK), )
>  	xhci-hcd-y += xhci-mtk-sch.o
> diff --git a/drivers/usb/host/xhci-dbgraw.c b/drivers/usb/host/xhci-dbgraw.c
> new file mode 100644
> index 000000000000..f7ca4b089dbd
> --- /dev/null
> +++ b/drivers/usb/host/xhci-dbgraw.c
> @@ -0,0 +1,365 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/**
> + * Raw DbC for xHCI debug capability
> + *
> + * Copyright (C) 2019 Intel Corporation
> + *
> + * Author: Rajaram Regupathy <rajaram.regupathy@intel.com>
> + * Author: Abhilash K V <abhilash.k.v@intel.com>
> + * Author: Prabhat Chand Pandey <prabhat.chand.pandey@intel.com>
> + */
> +
> +#include <linux/idr.h>
> +#include <linux/module.h>
> +#include <linux/miscdevice.h>
> +#include <linux/sizes.h>
> +#include <linux/slab.h>
> +
> +#include "xhci.h"
> +#include "xhci-dbgcap.h"
> +
> +#define DBC_XHCI_MINORS     8
> +#define DBC_STR_FUNC_RAW    "RAW"
> +#define DBC_RAW_BULK_BUFFER_SIZE  (SZ_64K)
> +
> +static DEFINE_IDR(dbc_minors);

These are not minor numbers, they are semi-random device ids.  Don't
confuse them with a minor number.

> +
> +struct dbc_dev {
> +	struct mutex dev_excl;
> +	struct mutex read_excl;
> +	struct mutex write_excl;

What do these protect?

> +	wait_queue_head_t read_wq;
> +	wait_queue_head_t write_wq;
> +
> +	int error;

error of what?

> +	bool in_use;
> +	char name[16];

why do you need this?  What's wrong with the misc device name?

> +	struct xhci_dbc *dbc;
> +	struct miscdevice misc_dev;
> +};
> +
> +static void xhci_dbc_free_req(struct dbc_ep *dep, struct dbc_request *req)
> +{
> +	kfree(req->buf);
> +	dbc_free_request(dep, req);
> +}
> +
> +struct dbc_request *xhci_dbc_alloc_requests(struct dbc_ep *dep,
> +		void (*fn)(struct xhci_hcd *, struct dbc_request *))
> +{
> +	struct dbc_request *req;
> +
> +	req = dbc_alloc_request(dep, GFP_KERNEL);
> +	if (!req)
> +		return req;
> +
> +	req->length = DBC_RAW_BULK_BUFFER_SIZE;
> +	req->buf = kmalloc(req->length, GFP_KERNEL);
> +	if (!req->buf)
> +		xhci_dbc_free_req(dep, req);
> +
> +	req->complete = fn;
> +
> +	return req;
> +}
> +
> +static void dbc_complete_in(struct xhci_hcd *xhci,
> +				struct dbc_request *req)
> +{
> +	struct xhci_dbc *dbc = (struct xhci_dbc *) xhci->dbc;
> +	struct dbc_dev *dev = (struct dbc_dev *) dbc->func_priv;
> +
> +	if (req->status)
> +		dev->error = req->status;
> +
> +	wake_up(&dev->write_wq);
> +}
> +
> +static void dbc_complete_out(struct xhci_hcd *xhci,
> +				struct dbc_request *req)
> +{
> +	struct xhci_dbc *dbc = (struct xhci_dbc *) xhci->dbc;
> +	struct dbc_dev *dev = (struct dbc_dev *) dbc->func_priv;
> +
> +	if (req->status)
> +		dev->error = req->status;
> +
> +	wake_up(&dev->read_wq);
> +}
> +
> +static ssize_t dbc_read(struct file *fp, char __user *buf,
> +				size_t count, loff_t *pos)
> +{
> +	int status = 0;
> +	struct dbc_dev *dev = (struct dbc_dev *) fp->private_data;
> +	struct xhci_dbc   *dbc = dev->dbc;
> +	struct dbc_request *req;
> +	struct dbc_port   *port = &dbc->port;
> +	int r = count, xfer;
> +	int ret;
> +
> +	if (dbc->state != DS_CONFIGURED)
> +		return -EAGAIN;
> +
> +	port->in = get_in_ep(dbc->xhci);
> +
> +	mutex_lock(&dev->read_excl);
> +
> +	req = xhci_dbc_alloc_requests(port->in, dbc_complete_out);
> +	if (!req) {
> +		r = -ENOMEM;
> +		goto alloc_fail;
> +	}
> +
> +	req->actual = 0;
> +
> +	xfer = min_t(size_t, count, DBC_RAW_BULK_BUFFER_SIZE);
> +	req->length = xfer;
> +
> +	status = dbc_ep_queue(port->in, req, GFP_ATOMIC);
> +	if (status) {
> +		dev->error = status;
> +		r = status;
> +		goto request_fail;
> +	}
> +
> +	ret = wait_event_interruptible(dev->read_wq,
> +			(req->status != -EINPROGRESS));
> +
> +	if (ret < 0) {
> +		r = ret;
> +		goto request_fail;
> +	}
> +
> +	if (dev->error) {
> +		r = dev->error;
> +		goto request_fail;
> +	}
> +
> +	xfer = (req->actual < count) ? req->actual : count;
> +	if (!req->actual) {
> +		r = 0;
> +	} else {
> +		r = copy_to_user(buf, req->buf, xfer);
> +		if (!r)
> +			r = xfer;
> +	}
> +
> +request_fail:
> +	xhci_dbc_free_req(port->in, req);
> +alloc_fail:
> +	mutex_unlock(&dev->read_excl);
> +
> +	return r;
> +}
> +
> +static ssize_t dbc_write(struct file *fp, const char __user *buf,
> +				size_t count, loff_t *pos)
> +{
> +	int status = 0;
> +	struct dbc_dev *dev = (struct dbc_dev *) fp->private_data;
> +	struct xhci_dbc *dbc = dev->dbc;
> +	struct dbc_request *req = 0;
> +	struct dbc_port   *port = &dbc->port;
> +	int r = count, xfer;
> +	int ret;
> +
> +	if (dbc->state != DS_CONFIGURED)
> +		return -EAGAIN;

Why?  What does this mean to userspace?  How do they configure it?

> +
> +	port->out = get_out_ep(dbc->xhci);
> +
> +	mutex_lock(&dev->write_excl);
> +
> +	/* get an idle tx request to use */
> +	req = xhci_dbc_alloc_requests(port->out, dbc_complete_in);
> +	if (!req) {
> +		r = -ENOMEM;
> +		goto alloc_fail;
> +	}
> +
> +	req->actual = 0;
> +	xfer = min_t(size_t, count, DBC_RAW_BULK_BUFFER_SIZE);
> +
> +	ret = copy_from_user(req->buf, buf, xfer);
> +	if (ret) {
> +		r = ret;
> +		goto request_fail;
> +	}

Ok, I'm going to blame Mathias for not actually reading this code before
acking it.  This is just not right, come on.

> +	r = xfer;
> +	req->length = xfer;
> +	status = dbc_ep_queue(port->out, req, GFP_ATOMIC);
> +	if (status) {
> +		dev->error = status;
> +		r = status;
> +		goto request_fail;
> +	}
> +
> +	ret = wait_event_interruptible(dev->write_wq,
> +			(req->status != -EINPROGRESS));
> +	if (ret < 0)
> +		r = ret;
> +
> +request_fail:
> +	xhci_dbc_free_req(port->out, req);
> +alloc_fail:
> +	mutex_unlock(&dev->write_excl);
> +
> +	return r;
> +}
> +
> +static int dbc_open(struct inode *ip, struct file *fp)
> +{
> +	struct dbc_dev *dbc_dev;
> +	struct xhci_dbc *dbc;
> +	int r = 0;
> +
> +	dbc_dev = container_of(fp->private_data, struct dbc_dev, misc_dev);
> +
> +	mutex_lock(&dbc_dev->dev_excl);
> +	if (dbc_dev->in_use) {
> +		r = -EBUSY;
> +		goto err;
> +	}

No, just no.  Don't try to enforce "only one user" in the kernel, it
always fails, is a horrible mess, and can be trivially worked around.
If a user wants to open the device multiple times and do crazy things
with it, they deserve the mess it creates.

For example, we don't forbid tty devices from being opened multiple
times, if someone is foolish enough to do that, they get to keep the
pieces.

Also, this code is wrong, and doesn't really prevent it from happening
:)

> +
> +	dbc = dbc_dev->dbc;
> +	if (!dbc) {
> +		r =  -ENODEV;
> +		goto err;
> +	}
> +
> +	dbc_dev->in_use = true;
> +	fp->private_data = dbc_dev;
> +
> +	/* clear the error latch */
> +	dbc_dev->error = 0;
> +err:
> +	mutex_unlock(&dbc_dev->dev_excl);
> +
> +	return r;
> +}
> +
> +static int dbc_release(struct inode *ip, struct file *fp)
> +{
> +	struct dbc_dev *dbc_dev = (struct dbc_dev *) fp->private_data;
> +
> +

extra whitespace???

And again with the pointless casting :(

> +	mutex_lock(&dbc_dev->dev_excl);
> +	dbc_dev->in_use = false;
> +	fp->private_data = NULL;

Why?  the file descriptor is about to be freed, no need to care about
this anymore.

> +	mutex_unlock(&dbc_dev->dev_excl);
> +
> +	return 0;
> +}
> +
> +static const struct file_operations dbc_fops = {
> +	.owner = THIS_MODULE,
> +	.read = dbc_read,
> +	.write = dbc_write,
> +	.open = dbc_open,
> +	.release = dbc_release,
> +};

So you have a new char device, with a undocumented and unknown format of
data flowing across it to the device.  How in the world are we supposed
to use this thing?  Where is it documented?  What does it do?  How can
you use it?

I don't mean to be so harsh here, but come on people, this stuff needs a
lot more background documentation, information, and explaination as to
exactly why in the world we need any of this, and what it even does!

Also, you need to fix the code, it doesn't work as pointed out in a few
places :)

greg k-h
