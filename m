Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D2F91713B5
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2020 10:08:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728629AbgB0JId (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Feb 2020 04:08:33 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52084 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728624AbgB0JId (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Feb 2020 04:08:33 -0500
Received: by mail-wm1-f68.google.com with SMTP id t23so2593455wmi.1
        for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2020 01:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=I2q3wRcarwjZ9eH2CrTrMP7bcDd6hwrrwJwiMDwkoTU=;
        b=ezQQsGeBUp45SCKfdDGcLfc4vOJdShy1kuEZaWaD4G94b8zwm07ng61TirY6SenE8n
         IShimkAc8QxADATLp++O4dwYEQ46fiyBWXI0JHwyQokQ/77Ut/2ts9d5lA4TouLWhaZg
         NXA0gNqon3jZ9jnqcOv41+YDn1HCw4tHH1vWnuBIjkL0zM29hMbRUXUtJM8LWXtkuxeW
         dIgX8gASTMTCz+uw3e6tSls82d5Qrw8Wz4RQAv9Rx1LaK/kuImoPxFxTvaYMymNlKgyi
         SAimDyhse13SxoFRxczSwDa0F62JGMBOy+4Zu2bfPGd0bluCcHFw59Lbg9NMt0dvXOXj
         rYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=I2q3wRcarwjZ9eH2CrTrMP7bcDd6hwrrwJwiMDwkoTU=;
        b=RrtPMYR9e9iTrwcSODIacNvlxicCSM4WV4GFadijHap76Qv3Hh3yQAOVsFvIC54O4P
         SMLSUX53N1fy/Msg7OypTUPnxDSkSDN5s83z8UPTFkFJNts1q4rTJONca/ABskzI2y/J
         3Rw9Oa4ugqAJyX+reu9YFuLjD3Z8f9GVOgDtZFqYUF0HV5+zSem5aU1dQbd1Dra0v+vA
         0DTRnM/hU57jHEjClMtV8cwMZQ0xdzeK7Lh4dDQFfr1K4Qh4sTVWwy3wIXQVHIKxtIoY
         JVCDiOZ5xjFbzRzmXD6P3lsycX7odYZZXM2JKZswVXJKNlEozZyVMsxnquL9wo7w3O6j
         1mAQ==
X-Gm-Message-State: APjAAAUonNw+4nfrNF2UgN5pZYQcBXhJU+m+fIQ64A+Zx27PyUfPJqzz
        bWgEwWLpu1ffNGgYS/DPCQ4FDA==
X-Google-Smtp-Source: APXvYqxwu0i9yHnAUj6GA+Hodev4ltgimXSuyc2ppEW1tnCyRsD+CgG/45jbzNeIQQWFfVqw6x0/Lw==
X-Received: by 2002:a1c:6884:: with SMTP id d126mr3940251wmc.38.1582794509256;
        Thu, 27 Feb 2020 01:08:29 -0800 (PST)
Received: from dell ([2.31.163.122])
        by smtp.gmail.com with ESMTPSA id g206sm6089102wme.46.2020.02.27.01.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 01:08:28 -0800 (PST)
Date:   Thu, 27 Feb 2020 09:09:01 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc:     broonie@kernel.org, balbi@kernel.org, linux-usb@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [RFC 2/9] mfd: Add driver for Multifunction USB Device
Message-ID: <20200227090901.GS3494@dell>
References: <20200216172117.49832-1-noralf@tronnes.org>
 <20200216172117.49832-3-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200216172117.49832-3-noralf@tronnes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I'd really like someone from USB to have a look through this too.

I'll do a quick first pass and provide some general comments though.

On Sun, 16 Feb 2020, Noralf Trønnes wrote:
> A Multifunction USB Device is a device that supports functions like gpio
> and display or any other function that can be represented as a USB regmap.
> Interrupts over USB is also supported if such an endpoint is present.

Do you have a datasheet?

> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---
>  drivers/mfd/Kconfig     |   8 +
>  drivers/mfd/Makefile    |   1 +
>  drivers/mfd/mud.c       | 580 ++++++++++++++++++++++++++++++++++++++++

As interesting as a "mud driver" sounds.  Something more forthcoming
might be better, "multi_usb" as a very quick example, but perhaps
something more imaginative/distinguishing would be better.

>  include/linux/mfd/mud.h |  16 ++
>  4 files changed, 605 insertions(+)
>  create mode 100644 drivers/mfd/mud.c
>  create mode 100644 include/linux/mfd/mud.h
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 52818dbcfe1f..9950794d907e 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1968,6 +1968,14 @@ config MFD_STMFX
>  	  additional drivers must be enabled in order to use the functionality
>  	  of the device.
>  
> +config MFD_MUD
> +	tristate "Multifunction USB Device core driver"
> +	depends on USB
> +	select MFD_CORE
> +	select REGMAP_USB
> +	help
> +	  Select this to get support for the Multifunction USB Device.
> +
>  menu "Multimedia Capabilities Port drivers"
>  	depends on ARCH_SA1100
>  
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 29e6767dd60c..0adfab9afaed 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -255,4 +255,5 @@ obj-$(CONFIG_MFD_ROHM_BD70528)	+= rohm-bd70528.o
>  obj-$(CONFIG_MFD_ROHM_BD718XX)	+= rohm-bd718x7.o
>  obj-$(CONFIG_MFD_STMFX) 	+= stmfx.o
>  obj-$(CONFIG_MFD_RPISENSE_CORE)	+= rpisense-core.o
> +obj-$(CONFIG_MFD_MUD)		+= mud.o
>  
> diff --git a/drivers/mfd/mud.c b/drivers/mfd/mud.c
> new file mode 100644
> index 000000000000..f5f31478656d
> --- /dev/null
> +++ b/drivers/mfd/mud.c
> @@ -0,0 +1,580 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright 2020 Noralf Trønnes
> + */
> +
> +#include <linux/bitmap.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/list.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/mud.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/regmap_usb.h>
> +#include <linux/seq_file.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/usb.h>
> +#include <linux/workqueue.h>
> +
> +/* Temporary debugging aid */
> +#undef dev_dbg
> +#define dev_dbg dev_info
> +
> +#define mdebug(fmt, ...)			\
> +do {						\
> +	if (1)					\
> +		pr_debug(fmt, ##__VA_ARGS__);	\
> +} while (0)

No thank you.

We already have quite a few debugging facilities in the kernel.

> +struct mud_irq_event {
> +	struct list_head node;
> +	DECLARE_BITMAP(status, REGMAP_USB_MAX_MAPS);
> +};
> +
> +struct mud_irq {
> +	struct irq_domain *domain;
> +	unsigned int num_irqs;
> +
> +	struct workqueue_struct	*workq;
> +	struct work_struct work;
> +	struct urb *urb;
> +
> +	spinlock_t lock; /* Protect the values below */
> +	unsigned long *mask;
> +	u16 tag;
> +	struct list_head eventlist;
> +
> +	unsigned int stats_illegal;
> +	unsigned int stats_already_seen;
> +	unsigned int stats_lost;
> +};

I think this should have a Kerneldoc header.

> +struct mud_device {

s/device/ddata/

> +	struct usb_device *usb;
> +	struct mud_irq *mirq;

> +	struct mfd_cell *cells;

Why does this need to be in here?

> +	unsigned int num_cells;

Why do these need to be stored in device data?

> +};
> +
> +static void mud_irq_work(struct work_struct *work)
> +{
> +	struct mud_irq *mirq = container_of(work, struct mud_irq, work);
> +	struct mud_irq_event *event;
> +	unsigned long n, flags;
> +	unsigned int irq;
> +
> +	mdebug("%s: IN\n", __func__);

All of these prints need to go.  They have no place in an upstreamed
driver and the whole thing reads much better without them.

> +	while (true) {
> +		spin_lock_irqsave(&mirq->lock, flags);
> +		event = list_first_entry_or_null(&mirq->eventlist, struct mud_irq_event, node);
> +		if (event) {
> +			list_del(&event->node);
> +			mdebug("    status: %*pb\n", mirq->num_irqs, event->status);
> +			bitmap_and(event->status, event->status, mirq->mask, mirq->num_irqs);
> +		}
> +		spin_unlock_irqrestore(&mirq->lock, flags);

'\n'

> +		if (!event)
> +			break;
> +
> +		for_each_set_bit(n, event->status, mirq->num_irqs) {
> +			irq = irq_find_mapping(mirq->domain, n);
> +			mdebug("        n=%lu irq=%u\n", n, irq);
> +			if (irq)
> +				handle_nested_irq(irq);
> +		}
> +
> +		kfree(event);
> +	}
> +
> +	mdebug("%s: OUT\n", __func__);
> +}
> +
> +#define BYTES_PER_LONG	(BITS_PER_LONG / BITS_PER_BYTE)
> +
> +static void mud_irq_queue(struct urb *urb)
> +{
> +	u8 *buf = urb->transfer_buffer + sizeof(u16);

Comment.

> +	struct mud_irq *mirq = urb->context;
> +	struct device *dev = &urb->dev->dev;
> +	struct mud_irq_event *event = NULL;
> +	unsigned int i, tag, diff;
> +	unsigned long flags;
> +
> +	if (urb->actual_length != urb->transfer_buffer_length) {
> +		dev_err_once(dev, "Interrupt packet wrong length: %u\n",
> +			     urb->actual_length);
> +		mirq->stats_illegal++;
> +		return;
> +	}
> +
> +	spin_lock_irqsave(&mirq->lock, flags);
> +
> +	tag = le16_to_cpup(urb->transfer_buffer);
> +	if (tag == mirq->tag) {
> +		dev_dbg(dev, "Interrupt tag=%u already seen, ignoring\n", tag);
> +		mirq->stats_already_seen++;
> +		goto unlock;
> +	}
> +
> +	if (tag > mirq->tag)
> +		diff = tag - mirq->tag;
> +	else
> +		diff = U16_MAX - mirq->tag + tag + 1;

Comment.

> +	if (diff > 1) {
> +		dev_err_once(dev, "Interrupts lost: %u\n", diff - 1);
> +		mirq->stats_lost += diff - 1;
> +	}
> +
> +	event = kzalloc(sizeof(*event), GFP_ATOMIC);
> +	if (!event) {
> +		mirq->stats_lost += 1;
> +		goto unlock;
> +	}

This hides a potential OOM issue.

Not sure what to do about that.  Maybe the USB guys have an idea.

> +	list_add_tail(&event->node, &mirq->eventlist);
> +
> +	for (i = 0; i < (urb->transfer_buffer_length - sizeof(u16)); i++) {
> +		unsigned long *val = &event->status[i / BYTES_PER_LONG];
> +		unsigned int mod = i % BYTES_PER_LONG;
> +
> +		if (!mod)
> +			*val = buf[i];
> +		else
> +			*val |= ((unsigned long)buf[i]) << (mod * BITS_PER_BYTE);
> +	}

Comment.  In fact, comments throughout please.

(I'm going to stop saying "comment" from here on).

> +	mdebug("%s: tag=%u\n", __func__, tag);
> +
> +	mirq->tag = tag;
> +unlock:
> +	spin_unlock_irqrestore(&mirq->lock, flags);
> +
> +	if (event)
> +		queue_work(mirq->workq, &mirq->work);
> +}
> +
> +static void mud_irq_urb_completion(struct urb *urb)
> +{
> +	struct device *dev = &urb->dev->dev;
> +	int ret;
> +
> +	mdebug("%s: actual_length=%u\n", __func__, urb->actual_length);
> +
> +	switch (urb->status) {
> +	case 0:
> +		mud_irq_queue(urb);
> +		break;
> +	case -EPROTO:	/* FIXME: verify: dwc2 reports this on disconnect */

What does this mean?  Why can't you fix it now?

> +	case -ECONNRESET:
> +	case -ENOENT:
> +	case -ESHUTDOWN:
> +		dev_dbg(dev, "irq urb shutting down with status: %d\n", urb->status);

s/irq/IRQ/ in all comments and prints.

Same with URB?

> +		return;
> +	default:
> +		dev_dbg(dev, "irq urb failure with status: %d\n", urb->status);
> +		break;

So it's failed, but you're going to attempt to submit it anyway?

> +	}
> +
> +	ret = usb_submit_urb(urb, GFP_ATOMIC);
> +	if (ret && ret != -ENODEV)
> +		dev_err(dev, "irq usb_submit_urb failed with result %d\n", ret);
> +}
> +
> +static void mud_irq_mask(struct irq_data *data)
> +{
> +	struct mud_irq *mirq = irq_data_get_irq_chip_data(data);
> +	unsigned long flags;
> +
> +	mdebug("%s: hwirq=%lu\n", __func__, data->hwirq);
> +
> +	spin_lock_irqsave(&mirq->lock, flags);
> +	clear_bit(data->hwirq, mirq->mask);
> +	spin_unlock_irqrestore(&mirq->lock, flags);
> +}
> +
> +static void mud_irq_unmask(struct irq_data *data)
> +{
> +	struct mud_irq *mirq = irq_data_get_irq_chip_data(data);
> +	unsigned long flags;
> +
> +	mdebug("%s: hwirq=%lu\n", __func__, data->hwirq);
> +
> +	spin_lock_irqsave(&mirq->lock, flags);
> +	set_bit(data->hwirq, mirq->mask);
> +	spin_unlock_irqrestore(&mirq->lock, flags);
> +}
> +
> +static struct irq_chip mud_irq_chip = {
> +	.name			= "mud-irq",
> +	.irq_mask		= mud_irq_mask,
> +	.irq_unmask		= mud_irq_unmask,
> +};

This tabbing seems excessive.

> +static void __maybe_unused
> +mud_irq_domain_debug_show(struct seq_file *m, struct irq_domain *d,
> +			  struct irq_data *data, int ind)

Best not to over-shorten variable names for no good reason.

'm', 'd' and 'ind' aren't good choices.

> +{
> +	struct mud_irq *mirq = d ? d->host_data : irq_data_get_irq_chip_data(data);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&mirq->lock, flags);
> +
> +	seq_printf(m, "%*sTag:          %u\n", ind, "", mirq->tag);
> +	seq_printf(m, "%*sIllegal:      %u\n", ind, "", mirq->stats_illegal);
> +	seq_printf(m, "%*sAlready seen: %u\n", ind, "", mirq->stats_already_seen);
> +	seq_printf(m, "%*sLost:         %u\n", ind, "", mirq->stats_lost);
> +
> +	spin_unlock_irqrestore(&mirq->lock, flags);
> +}
> +
> +static int mud_irq_domain_map(struct irq_domain *d, unsigned int virq,
> +			      irq_hw_number_t hwirq)
> +{
> +	irq_set_chip_data(virq, d->host_data);
> +	irq_set_chip_and_handler(virq, &mud_irq_chip, handle_simple_irq);
> +	irq_set_nested_thread(virq, true);
> +	irq_set_noprobe(virq);
> +
> +	return 0;
> +}
> +
> +static void mud_irq_domain_unmap(struct irq_domain *d, unsigned int virq)
> +{
> +	irq_set_chip_and_handler(virq, NULL, NULL);
> +	irq_set_chip_data(virq, NULL);
> +}
> +
> +static const struct irq_domain_ops mud_irq_ops = {
> +	.map		= mud_irq_domain_map,
> +	.unmap		= mud_irq_domain_unmap,
> +#ifdef CONFIG_GENERIC_IRQ_DEBUGFS
> +	.debug_show	= mud_irq_domain_debug_show,
> +#endif
> +};
> +
> +static int mud_irq_start(struct mud_irq *mirq)
> +{
> +	if (!mirq)
> +		return 0;
> +
> +	return usb_submit_urb(mirq->urb, GFP_KERNEL);
> +}
> +
> +static void mud_irq_stop(struct mud_irq *mirq)
> +{
> +	if (!mirq)
> +		return;
> +
> +	usb_kill_urb(mirq->urb);
> +	flush_work(&mirq->work);
> +}
> +
> +static void mud_irq_release(struct mud_irq *mirq)
> +{
> +	if (!mirq)
> +		return;
> +
> +	if (mirq->workq)
> +		destroy_workqueue(mirq->workq);
> +
> +	if (mirq->domain) {
> +		irq_hw_number_t hwirq;
> +
> +		for (hwirq = 0; hwirq < mirq->num_irqs; hwirq++)
> +			irq_dispose_mapping(irq_find_mapping(mirq->domain, hwirq));
> +
> +		irq_domain_remove(mirq->domain);
> +	}
> +
> +	usb_free_coherent(mirq->urb->dev, mirq->urb->transfer_buffer_length,
> +			  mirq->urb->transfer_buffer, mirq->urb->transfer_dma);
> +	usb_free_urb(mirq->urb);
> +	bitmap_free(mirq->mask);
> +	kfree(mirq);
> +}
> +
> +static struct mud_irq *mud_irq_create(struct usb_interface *interface,
> +				      unsigned int num_irqs)
> +{
> +	struct usb_device *usb = interface_to_usbdev(interface);
> +	struct device *dev = &interface->dev;
> +	struct usb_endpoint_descriptor *ep;
> +	struct fwnode_handle *fn;
> +	struct urb *urb = NULL;
> +	struct mud_irq *mirq;
> +	void *buf = NULL;
> +	size_t buf_size;
> +	int ret;
> +
> +	mdebug("%s: dev->id=%d\n", __func__, dev->id);
> +
> +	ret = usb_find_int_in_endpoint(interface->cur_altsetting, &ep);
> +	if (ret == -ENXIO)
> +		return NULL;
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	mirq = kzalloc(sizeof(*mirq), GFP_KERNEL);
> +	if (!mirq)
> +		return ERR_PTR(-ENOMEM);
> +
> +	mirq->mask = bitmap_zalloc(num_irqs, GFP_KERNEL);
> +	if (!mirq->mask) {
> +		ret = -ENOMEM;
> +		goto release;
> +	}
> +
> +	spin_lock_init(&mirq->lock);
> +	mirq->num_irqs = num_irqs;
> +
> +	urb = usb_alloc_urb(0, GFP_KERNEL);
> +	if (!urb) {
> +		ret = -ENOMEM;
> +		goto release;
> +	}
> +
> +	buf_size = usb_endpoint_maxp(ep);
> +	if (buf_size != (sizeof(u16) + DIV_ROUND_UP(num_irqs, BITS_PER_BYTE))) {
> +		dev_err(dev, "Interrupt endpoint wMaxPacketSize too small: %zu\n", buf_size);
> +		ret = -EINVAL;
> +		goto release;
> +	}
> +
> +	buf = usb_alloc_coherent(usb, buf_size, GFP_KERNEL, &urb->transfer_dma);
> +	if (!buf) {
> +		usb_free_urb(urb);
> +		ret = -ENOMEM;
> +		goto release;
> +	}
> +
> +	usb_fill_int_urb(urb, usb,
> +			 usb_rcvintpipe(usb, usb_endpoint_num(ep)),
> +			 buf, buf_size, mud_irq_urb_completion,
> +			 mirq, ep->bInterval);
> +	urb->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
> +
> +	mirq->urb = urb;
> +
> +	if (dev->of_node) {
> +		fn = of_node_to_fwnode(dev->of_node);
> +	} else {
> +		fn = irq_domain_alloc_named_fwnode("mud-irq");
> +		if (!fn) {
> +			ret = -ENOMEM;
> +			goto release;
> +		}
> +	}
> +
> +	mirq->domain = irq_domain_create_linear(fn, num_irqs, &mud_irq_ops, mirq);
> +	if (!dev->of_node)
> +		irq_domain_free_fwnode(fn);
> +	if (!mirq->domain) {
> +		ret = -ENOMEM;
> +		goto release;
> +	}
> +
> +	INIT_LIST_HEAD(&mirq->eventlist);
> +	INIT_WORK(&mirq->work, mud_irq_work);
> +
> +	mirq->workq = alloc_workqueue("mud-irq/%s", WQ_HIGHPRI, 0, dev_name(dev));
> +	if (!mirq->workq) {
> +		ret = -ENOMEM;
> +		goto release;
> +	}
> +
> +	return mirq;
> +
> +release:
> +	mud_irq_release(mirq);
> +
> +	return ERR_PTR(ret);
> +}
> +
> +static int mud_probe_regmap(struct usb_interface *interface, struct mfd_cell *cell,
> +			    unsigned int index, struct mud_irq *mirq)
> +{
> +	struct mud_cell_pdata *pdata;
> +	struct resource *res = NULL;
> +	int ret;
> +
> +	pdata = kzalloc(sizeof(*pdata), GFP_KERNEL);
> +	if (!pdata)
> +		return -ENOMEM;
> +
> +	ret = regmap_usb_get_map_descriptor(interface, index, &pdata->desc);

Can you give an example of what a desc might look like?

I'm particularly interested in pdata->desc.name.

> +	if (ret)
> +		goto error;

This will attempt to free 'res' which is currently NULL.

> +	mdebug("%s: name='%s' index=%u\n", __func__, pdata->desc.name, index);
> +	mdebug("    bRegisterValueBits=%u\n", pdata->desc.bRegisterValueBits);
> +	mdebug("    bCompression=0x%02x\n", pdata->desc.bCompression);
> +	mdebug("    bMaxTransferSizeOrder=%u (%ukB)\n",
> +	       pdata->desc.bMaxTransferSizeOrder,
> +	       (1 << pdata->desc.bMaxTransferSizeOrder) / 1024);
> +
> +	if (mirq) {
> +		res = kzalloc(sizeof(*res), GFP_KERNEL);
> +		if (!res) {
> +			ret = -ENOMEM;
> +			goto error;

This will attempt to free 'res' which is currently NULL.

> +		}
> +
> +		res->flags = IORESOURCE_IRQ;
> +		res->start = irq_create_mapping(mirq->domain, index);
> +		mdebug("    res->start=%u\n", (unsigned int)res->start);
> +		res->end = res->start;
> +
> +		cell->resources = res;
> +		cell->num_resources = 1;
> +	}
> +
> +	pdata->interface = interface;

This looks like something that should be stored in ddata.

> +	pdata->index = index;

Don't usually like indexes - what is this used for?

> +	cell->name = pdata->desc.name;
> +	cell->platform_data = pdata;
> +	cell->pdata_size = sizeof(*pdata);
> +	/*
> +	 * A Multifunction USB Device can have multiple functions of the same
> +	 * type. mfd_add_device() in its current form will only match on the
> +	 * first node in the Device Tree.
> +	 */
> +	cell->of_compatible = cell->name;
> +
> +	return 0;
> +
> +error:
> +	kfree(res);

I think you should remove this line, as it's never useful here.

> +	kfree(pdata);
> +
> +	return ret;
> +}
> +
> +static void mud_free(struct mud_device *mud)
> +{
> +	unsigned int i;
> +
> +	mud_irq_release(mud->mirq);
> +
> +	for (i = 0; i < mud->num_cells; i++) {
> +		kfree(mud->cells[i].platform_data);
> +		kfree(mud->cells[i].resources);
> +	}
> +
> +	kfree(mud->cells);
> +	kfree(mud);
> +}
> +
> +static int mud_probe(struct usb_interface *interface,
> +		     const struct usb_device_id *id)
> +{
> +	struct device *dev = &interface->dev;
> +	unsigned int i, num_regmaps;
> +	struct mud_device *mud;
> +	int ret;
> +
> +	mdebug("%s: interface->dev.of_node=%px usb->dev.of_node=%px",
> +	       __func__, interface->dev.of_node,
> +	       usb_get_dev(interface_to_usbdev(interface))->dev.of_node);
> +
> +	ret = regmap_usb_get_interface_descriptor(interface, &num_regmaps);
> +	if (ret)
> +		return ret;
> +	if (!num_regmaps)
> +		return -EINVAL;
> +
> +	mdebug("%s: num_regmaps=%u\n", __func__, num_regmaps);
> +
> +	mud = kzalloc(sizeof(*mud), GFP_KERNEL);
> +	if (!mud)
> +		return -ENOMEM;
> +
> +	mud->mirq = mud_irq_create(interface, num_regmaps);
> +	if (IS_ERR(mud->mirq)) {
> +		ret = PTR_ERR(mud->mirq);
> +		goto err_free;
> +	}
> +
> +	mud->num_cells = num_regmaps;
> +	mud->cells = kcalloc(num_regmaps, sizeof(*mud->cells), GFP_KERNEL);
> +	if (!mud->cells)
> +		goto err_free;
> +
> +	for (i = 0; i < num_regmaps; i++) {
> +		ret = mud_probe_regmap(interface, &mud->cells[i], i, mud->mirq);
> +		if (ret) {
> +			dev_err(dev, "Failed to probe regmap index %i (error %d)\n", i, ret);
> +			goto err_free;
> +		}
> +	}
> +
> +	ret = mud_irq_start(mud->mirq);
> +	if (ret) {
> +		dev_err(dev, "Failed to start irq (error %d)\n", ret);
> +		goto err_free;
> +	}
> +
> +	ret = mfd_add_hotplug_devices(dev, mud->cells, mud->num_cells);
> +	if (ret) {
> +		dev_err(dev, "Failed to add mfd devices to core.");

"MFD" is not a thing.  It's made up.

"Failed to register child devices" makes more sense.

NIT: I don't see full stops in any of your other messages.

> +		goto err_stop;
> +	}
> +
> +	mud->usb = usb_get_dev(interface_to_usbdev(interface));
> +
> +	usb_set_intfdata(interface, mud);
> +
> +	if (mud->usb->product)
> +		dev_info(dev, "%s\n", mud->usb->product);
> +
> +	return 0;
> +
> +err_stop:
> +	mud_irq_stop(mud->mirq);
> +err_free:
> +	mud_free(mud);
> +
> +	return ret;
> +}
> +
> +static void mud_disconnect(struct usb_interface *interface)
> +{
> +	struct mud_device *mud = usb_get_intfdata(interface);
> +
> +	mfd_remove_devices(&interface->dev);
> +	mud_irq_stop(mud->mirq);
> +	usb_put_dev(mud->usb);
> +	mud_free(mud);
> +
> +	dev_dbg(&interface->dev, "disconnected\n");
> +}
> +
> +static const struct usb_device_id mud_table[] = {
> +	/*
> +	 * FIXME:
> +	 * Apply for a proper pid: https://github.com/openmoko/openmoko-usb-oui
> +	 *
> +	 * Or maybe the Linux Foundation will provide one from their vendor id.
> +	 */

Probably not a good idea to take this into the upstream kernel without
a valid, registered PID.  Suggest you do this *first*.

> +	{ USB_DEVICE_INTERFACE_CLASS(0x1d50, 0x6150, USB_CLASS_VENDOR_SPEC) },
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(usb, mud_table);
> +
> +static struct usb_driver mud_driver = {
> +	.name		= "mud",
> +	.probe		= mud_probe,
> +	.disconnect	= mud_disconnect,
> +	.id_table	= mud_table,
> +};
> +
> +module_usb_driver(mud_driver);
> +
> +MODULE_DESCRIPTION("Generic USB Device mfd core driver");
> +MODULE_AUTHOR("Noralf Trønnes <noralf@tronnes.org>");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/mud.h b/include/linux/mfd/mud.h
> new file mode 100644
> index 000000000000..b2059fa57429
> --- /dev/null
> +++ b/include/linux/mfd/mud.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#ifndef __LINUX_MUD_H
> +#define __LINUX_MUD_H
> +
> +#include <linux/regmap_usb.h>
> +
> +struct usb_interface;
> +
> +struct mud_cell_pdata {
> +	struct usb_interface *interface;

Shouldn't be here - more of a ddata thing.

> +	unsigned int index;

Indexes are generally not a good idea.

> +	struct regmap_usb_map_descriptor desc;

Shouldn't be here - more of a ddata thing.

> +};
> +
> +#endif

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
