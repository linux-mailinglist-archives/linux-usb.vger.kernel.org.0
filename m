Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5422F1D70B3
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2020 08:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbgERGHr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 May 2020 02:07:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:34756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726040AbgERGHq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 May 2020 02:07:46 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CFF4220715;
        Mon, 18 May 2020 06:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589782066;
        bh=y3lycjDyiclvJUciGJp+yfnl/46okNlvJABn3P8aP5o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lMp5SeXeulxwZB2oCGU0XA620JXmVgVJRKsaATWiCjKIUntUj02dVhBYbhpcFbk/4
         vAs1MgBWr3gzULNZdMvoVH4Aa5SKmSOq6+i7vyPZTanDSEzdPAMaia+uJw5kvoc3qr
         EQphvqogjq0z7aaUSfH5QZqlMFEbv4r8ls9O7b4o=
Date:   Mon, 18 May 2020 08:07:44 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     mani@kernel.org
Cc:     johan@kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, patong.mxl@gmail.com
Subject: Re: [PATCH v3 1/2] usb: serial: Add MaxLinear/Exar USB to Serial
 driver
Message-ID: <20200518060744.GA2845844@kroah.com>
References: <20200430184924.31690-1-mani@kernel.org>
 <20200430184924.31690-2-mani@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430184924.31690-2-mani@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 01, 2020 at 12:19:23AM +0530, mani@kernel.org wrote:
> +static int xr_set_reg(struct usb_serial_port *port, u8 block, u8 reg,
> +		      u8 val)
> +{
> +	struct usb_serial *serial = port->serial;
> +	int ret = -EINVAL;
> +
> +	/* XR21V141X uses custom command for writing UART registers */
> +	ret = usb_control_msg(serial->dev,
> +			      usb_sndctrlpipe(serial->dev, 0),
> +			      XR_SET_XR21V141X,
> +			      USB_DIR_OUT | USB_TYPE_VENDOR, val,
> +			      reg | (block << 8), NULL, 0,
> +			      USB_CTRL_SET_TIMEOUT);
> +
> +	if (ret < 0)
> +		dev_err(&port->dev, "Failed to set reg 0x%x status: %d\n",
> +			reg, ret);
> +
> +	return ret;
> +}

So if this call is successful, it would return the number of bytes
written in the control message.  Which is 0.  But that's kind of a hack,
right?  Why not just return 0 to make it more obvious and easier to
read, instead of returning 'ret' and making the reader have to realize
that you only are writing 0 bytes?

> +
> +static int xr_get_reg(struct usb_serial_port *port, u8 block, u8 reg,
> +		      u8 *val)
> +{
> +	struct usb_serial *serial = port->serial;
> +	void *dmabuf;

char *dmabuf; ?

> +	int ret = -EINVAL;
> +
> +	dmabuf = kmalloc(1, GFP_KERNEL);
> +	if (!dmabuf)
> +		return -ENOMEM;
> +
> +	/* XR21V141X uses custom command for reading UART registers */
> +	ret = usb_control_msg(serial->dev,
> +			      usb_rcvctrlpipe(serial->dev, 0),
> +			      XR_GET_XR21V141X,
> +			      USB_DIR_IN | USB_TYPE_VENDOR, 0,
> +			      reg | (block << 8), dmabuf, 1,
> +			      USB_CTRL_SET_TIMEOUT);
> +
> +	if (ret == 1) {
> +		memcpy(val, dmabuf, 1);

*val = *dmabuf; ?

> +		ret = 0;
> +	} else {
> +		dev_err(&port->dev, "Failed to get reg 0x%x status: %d\n",
> +			reg, ret);
> +		if (ret >= 0)
> +			ret = -EIO;
> +	}
> +
> +	kfree(dmabuf);
> +
> +	return ret;
> +}

Anyway, other than these minor things, this looks good to me:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
