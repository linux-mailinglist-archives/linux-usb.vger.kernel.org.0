Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 857C737369E
	for <lists+linux-usb@lfdr.de>; Wed,  5 May 2021 10:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232226AbhEEIvB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 May 2021 04:51:01 -0400
Received: from mx2.suse.de ([195.135.220.15]:48096 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232144AbhEEIvA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 5 May 2021 04:51:00 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1620204602; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XlreHJSFOa0zh8VVnpDZWGdPYd4/0cBdM7glQh7Ld9A=;
        b=k0ULywp2xsJxR0Mz78nWDgdSLChio96FaDSQTlafFs/Z/MrkODjxhZfj+xNioWQCCpEv2y
        /liRIqv3fbnh3mheAOHDP5KEtpJedbiBxWkyzuj//TVKs8hzRX5Nm9cU3+jEZrXYTWuw9R
        aV7QhcxVTV7LH9PRVRs0WYHOkwpKwBc=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id A16ECAECE;
        Wed,  5 May 2021 08:50:02 +0000 (UTC)
Message-ID: <df5bef579be9bee300c42cf3e03c9b029c83a800.camel@suse.com>
Subject: Re: [PATCH 2/3] media: rc: new driver for USB-UIRT device
From:   Oliver Neukum <oneukum@suse.com>
To:     Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>
Date:   Wed, 05 May 2021 10:50:01 +0200
In-Reply-To: <92bbe875e1783c7bc79cde33d783eab66ef9cd46.1620149665.git.sean@mess.org>
References: <cover.1620149665.git.sean@mess.org>
         <92bbe875e1783c7bc79cde33d783eab66ef9cd46.1620149665.git.sean@mess.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 04.05.2021, 18:52 +0100 schrieb Sean Young:
> See http://www.usbuirt.com/
> 

Hi,

nice driver, just a few issues.
I have marked them inline.

	Regards
		Oliver

> +
> +#define WDR_TIMEOUT 5000 /* default urb timeout */

That is the default ctrl timeout. Do you need this?

> +#define WDR_SHORT_TIMEOUT 1000	/* shorter urb timeout */
> +#define UNIT_US 50
> +#define IR_TIMEOUT 12500
> +#define MAX_PACKET 64
> 
> +static int uirt_tx(struct rc_dev *rc, uint *txbuf, uint count)
> +{
> +	struct uirt *uirt = rc->priv;
> +	u8 *out;
> +	u32 i, dest, unit_raw, freq, len;
> +	int err;
> +
> +	// streaming tx does not work for short IR; use non-streaming
> +	// tx for short IR
> +	if (count <= 24)
> +		return uirt_short_tx(rc, txbuf, count);
> +
> +	out = kmalloc(count * 2 + 3, GFP_KERNEL);
> +	if (!out)
> +		return -ENOMEM;
> +
> +	out[0] = 0x25; // Streaming Transmit
> +	out[1] = 0xdb; // checksum

A constant checksum? Now that is a new concept.

> +	out[2] = uirt->freq; // carrier frequency
> +
> +	dest = 3;
> +
> +	freq = uirt->freq & 0x7f;
> +
> +	for (i = 0; i < count; i++) {
> +		// width = (us / freq) * 2.5
> +		unit_raw = DIV_ROUND_CLOSEST(txbuf[i] * 5, freq * 2);
> +
> +		if (unit_raw == 0)
> +			unit_raw = 1;
> +		else if (unit_raw > 127)
> +			out[dest++] = (unit_raw >> 8) | 0x80;
> +
> +		out[dest++] = unit_raw;
> +	}
> +
> +	len = min_t(u32, dest, MAX_PACKET);
> +
> +	uirt->tx_buf = out + len;
> +	uirt->tx_len = dest - len;
> +
> +	err = uirt_command(uirt, out, len, CMD_STATE_STREAMING_TX);
> +	kfree(out);
> +	if (err != 0)
> +		return err;
> +
> +	return count;
> +}
> +
> 
> +static int uirt_probe(struct usb_interface *intf,
> +		      const struct usb_device_id *id)
> +{
> +	struct usb_host_interface *idesc = intf->cur_altsetting;
> +	struct usb_device *usbdev = interface_to_usbdev(intf);
> +	struct usb_endpoint_descriptor *ep_in = NULL;
> +	struct usb_endpoint_descriptor *ep_out = NULL;
> +	struct usb_endpoint_descriptor *ep = NULL;
> +	struct uirt *uirt;
> +	struct rc_dev *rc;
> +	struct urb *urb;
> +	int i, pipe, err = -ENOMEM;
> +
> +	for (i = 0; i < idesc->desc.bNumEndpoints; i++) {
> +		ep = &idesc->endpoint[i].desc;
> +
> +		if (!ep_in && usb_endpoint_is_bulk_in(ep) &&
> +		    usb_endpoint_maxp(ep) == MAX_PACKET)
> +			ep_in = ep;
> +
> +		if (!ep_out && usb_endpoint_is_bulk_out(ep) &&
> +		    usb_endpoint_maxp(ep) == MAX_PACKET)
> +			ep_out = ep;
> +	}
> +
> +	if (!ep_in || !ep_out) {
> +		dev_err(&intf->dev, "required endpoints not found\n");
> +		return -ENODEV;
> +	}
> +
> +	uirt = kzalloc(sizeof(*uirt), GFP_KERNEL);
> +	if (!uirt)
> +		return -ENOMEM;
> +
> +	uirt->in = kmalloc(MAX_PACKET, GFP_KERNEL);
> +	if (!uirt->in)
> +		goto free_uirt;
> +
> +	uirt->out = kmalloc(MAX_PACKET, GFP_KERNEL);
> +	if (!uirt->out)
> +		goto free_uirt;
> +
> +	rc = rc_allocate_device(RC_DRIVER_IR_RAW);
> +	if (!rc)
> +		goto free_uirt;
> +
> +	urb = usb_alloc_urb(0, GFP_KERNEL);
> +	if (!urb)
> +		goto free_rcdev;
> +
> +	pipe = usb_rcvbulkpipe(usbdev, ep_in->bEndpointAddress);
> +	usb_fill_bulk_urb(urb, usbdev, pipe, uirt->in, MAX_PACKET,
> +			  uirt_in_callback, uirt);
> +	uirt->urb_in = urb;
> +
> +	urb = usb_alloc_urb(0, GFP_KERNEL);
> +	if (!urb)
> +		goto free_rcdev;
> +
> +	pipe = usb_sndbulkpipe(usbdev, ep_out->bEndpointAddress);
> +	usb_fill_bulk_urb(urb, usbdev, pipe, uirt->out, MAX_PACKET,
> +			  uirt_out_callback, uirt);
> +
> +	uirt->dev = &intf->dev;
> +	uirt->usbdev = usbdev;
> +	uirt->rc = rc;
> +	uirt->urb_out = urb;
> +	uirt->rx_state = RX_STATE_INTERSPACE_HIGH;
> +
> +	err = usb_submit_urb(uirt->urb_in, GFP_KERNEL);
> +	if (err != 0) {
> +		dev_err(uirt->dev, "failed to submit read urb: %d\n",
> err);
> +		return err;

Massive memory leak. You cannot just return.


