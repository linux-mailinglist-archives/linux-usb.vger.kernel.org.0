Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E091917470B
	for <lists+linux-usb@lfdr.de>; Sat, 29 Feb 2020 14:27:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727048AbgB2N1A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 29 Feb 2020 08:27:00 -0500
Received: from smtp.domeneshop.no ([194.63.252.55]:46055 "EHLO
        smtp.domeneshop.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726997AbgB2N1A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 29 Feb 2020 08:27:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201912; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=+YdZf3b8EV908eGQglSMqhB3nmvC2gAZH4VxYq+Nk+I=; b=fetyMTATfX6WstBvf5nivW29R2
        4IirO0OoFPLBGQ6Q2ENSphNb4WJil2NcFtb4oZpOuLVsRp4juws4KypB0+UTYybTqfRr3617WmnrQ
        LVh6Fz51pJjKwcMCsaB3Ns/9pRlpAEF9MFPvL7gd+xUk60s7303vy8udYLEV2Mw6n0SSVcqac770w
        FUNA0REHxKsp+oX46vZJ/Bgw76G7/hs1w55OyF8BdW5RatkFZ1jvTULLEJD3Y/HmszQOKJ4R5937f
        oJ4RLTNOs51wa0PNSFUtMHVtm6pnALrKNGhF6p2JDrhJiHne3dMb79XG50vxh3pdHzK380J0P2uKo
        DciPiT3Q==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:55869 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1j828v-0005xf-6q; Sat, 29 Feb 2020 14:26:57 +0100
Subject: Re: [RFC 2/9] mfd: Add driver for Multifunction USB Device
To:     Lee Jones <lee.jones@linaro.org>
Cc:     broonie@kernel.org, balbi@kernel.org, linux-usb@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20200216172117.49832-1-noralf@tronnes.org>
 <20200216172117.49832-3-noralf@tronnes.org> <20200227090901.GS3494@dell>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <58bf66ef-d772-83cf-a13c-2a1135e12560@tronnes.org>
Date:   Sat, 29 Feb 2020 14:26:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200227090901.GS3494@dell>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 27.02.2020 10.09, skrev Lee Jones:
> I'd really like someone from USB to have a look through this too.
> 
> I'll do a quick first pass and provide some general comments though.
> 
> On Sun, 16 Feb 2020, Noralf Trønnes wrote:
>> A Multifunction USB Device is a device that supports functions like gpio
>> and display or any other function that can be represented as a USB regmap.
>> Interrupts over USB is also supported if such an endpoint is present.
> 
> Do you have a datasheet?

As mentioned in the cover letter this is about turning a Linux board
like the Raspberry Pi into a USB gadget that presents functions like
display, gpio, spi, i2c to a host over USB. Patch 3 in this series
contains the gadget side of this mfd driver.

Patch 1 has the register over USB code implemented as a regmap. After
talking to Mark Brown I realised that regmap has a limitation (no
variable register value width) so my plan is to include that code into
this mfd driver instead.

> 
>> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
>> ---

>> +static void mud_irq_urb_completion(struct urb *urb)
>> +{
>> +	struct device *dev = &urb->dev->dev;
>> +	int ret;
>> +
>> +	mdebug("%s: actual_length=%u\n", __func__, urb->actual_length);
>> +
>> +	switch (urb->status) {
>> +	case 0:
>> +		mud_irq_queue(urb);
>> +		break;
>> +	case -EPROTO:	/* FIXME: verify: dwc2 reports this on disconnect */
> 
> What does this mean?  Why can't you fix it now?

I don't know if this is a dwc2 driver problem or if EPROTO is a valid
disconnect error. I haven't seen it in other gadget drivers, so I need
to look more into this or even better if someone from USB can answer this.

> 
>> +	case -ECONNRESET:
>> +	case -ENOENT:
>> +	case -ESHUTDOWN:
>> +		dev_dbg(dev, "irq urb shutting down with status: %d\n", urb->status);
> 
> s/irq/IRQ/ in all comments and prints.
> 
> Same with URB?
> 
>> +		return;
>> +	default:
>> +		dev_dbg(dev, "irq urb failure with status: %d\n", urb->status);
>> +		break;
> 
> So it's failed, but you're going to attempt to submit it anyway?

Yes, I don't know the reason why it failed, it might succeed the next
time. But this is also something that someone with real life experience
with USB failures could weigh in on. Maybe I should send a reset request
so the device can reset its state machine, I don't know.

> 
>> +	}
>> +
>> +	ret = usb_submit_urb(urb, GFP_ATOMIC);
>> +	if (ret && ret != -ENODEV)
>> +		dev_err(dev, "irq usb_submit_urb failed with result %d\n", ret);
>> +}


>> +static int mud_probe_regmap(struct usb_interface *interface, struct mfd_cell *cell,
>> +			    unsigned int index, struct mud_irq *mirq)
>> +{
>> +	struct mud_cell_pdata *pdata;
>> +	struct resource *res = NULL;
>> +	int ret;
>> +
>> +	pdata = kzalloc(sizeof(*pdata), GFP_KERNEL);
>> +	if (!pdata)
>> +		return -ENOMEM;
>> +
>> +	ret = regmap_usb_get_map_descriptor(interface, index, &pdata->desc);
> 
> Can you give an example of what a desc might look like?
> 
> I'm particularly interested in pdata->desc.name.
> 

This is the definition:

/**
 * struct regmap_usb_map_descriptor - Regmap descriptor
 * @bLength: Size of descriptor in bytes
 * @bDescriptorType: DescriptorType (REGMAP_USB_DT_MAP)
 * @name: Register name (NUL terminated)
 * @bRegisterValueBits: Number of bits in the register value
 * @bCompression: Supported compression types
 * @bMaxTransferSizeOrder: Maximum transfer size the device can handle
as log2.
 */
struct regmap_usb_map_descriptor {
	__u8 bLength;
	__u8 bDescriptorType;

	__u8 name[32];
	__u8 bRegisterValueBits;
	__u8 bCompression;
#define REGMAP_USB_COMPRESSION_LZ4	BIT(0)
	__u8 bMaxTransferSizeOrder;
} __packed;


>> +	if (ret)
>> +		goto error;
> 
> This will attempt to free 'res' which is currently NULL.
> 
>> +	mdebug("%s: name='%s' index=%u\n", __func__, pdata->desc.name, index);
>> +	mdebug("    bRegisterValueBits=%u\n", pdata->desc.bRegisterValueBits);
>> +	mdebug("    bCompression=0x%02x\n", pdata->desc.bCompression);
>> +	mdebug("    bMaxTransferSizeOrder=%u (%ukB)\n",
>> +	       pdata->desc.bMaxTransferSizeOrder,
>> +	       (1 << pdata->desc.bMaxTransferSizeOrder) / 1024);
>> +
>> +	if (mirq) {
>> +		res = kzalloc(sizeof(*res), GFP_KERNEL);
>> +		if (!res) {
>> +			ret = -ENOMEM;
>> +			goto error;
> 
> This will attempt to free 'res' which is currently NULL.
> 
>> +		}
>> +
>> +		res->flags = IORESOURCE_IRQ;
>> +		res->start = irq_create_mapping(mirq->domain, index);
>> +		mdebug("    res->start=%u\n", (unsigned int)res->start);
>> +		res->end = res->start;
>> +
>> +		cell->resources = res;
>> +		cell->num_resources = 1;
>> +	}
>> +
>> +	pdata->interface = interface;
> 
> This looks like something that should be stored in ddata.
> 
>> +	pdata->index = index;
> 
> Don't usually like indexes - what is this used for?

A maximum of 255 register maps are supported on one USB interface and
this index tells which one it is. It's passed in the USB transfer header.

> 
>> +	cell->name = pdata->desc.name;
>> +	cell->platform_data = pdata;
>> +	cell->pdata_size = sizeof(*pdata);
>> +	/*
>> +	 * A Multifunction USB Device can have multiple functions of the same
>> +	 * type. mfd_add_device() in its current form will only match on the
>> +	 * first node in the Device Tree.
>> +	 */
>> +	cell->of_compatible = cell->name;
>> +
>> +	return 0;
>> +
>> +error:
>> +	kfree(res);
> 
> I think you should remove this line, as it's never useful here.
> 
>> +	kfree(pdata);
>> +
>> +	return ret;
>> +}
>> +

>> +static const struct usb_device_id mud_table[] = {
>> +	/*
>> +	 * FIXME:
>> +	 * Apply for a proper pid: https://github.com/openmoko/openmoko-usb-oui
>> +	 *
>> +	 * Or maybe the Linux Foundation will provide one from their vendor id.
>> +	 */
> 
> Probably not a good idea to take this into the upstream kernel without
> a valid, registered PID.  Suggest you do this *first*.

I didn't know if my work was fundementally flawed in some way that made
it difficult to get merged. Hence the RFC to ask for help from people
knowledgeable in this area. So I'm hoping that some USB people will have
a look on this as well.

If this multifunction idea doesn't work out, then I'll just do the USB
display part and it will only be a drm driver. So at the moment I don't
know what kind of USB device this will be: multifuntion or display.
When I know then I'll get a PID.

Noralf.

> 
>> +	{ USB_DEVICE_INTERFACE_CLASS(0x1d50, 0x6150, USB_CLASS_VENDOR_SPEC) },
>> +	{ }
>> +};
