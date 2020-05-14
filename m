Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 025D31D3241
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 16:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbgENOJ1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 10:09:27 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38532 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbgENOJ1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 10:09:27 -0400
Received: by mail-lf1-f65.google.com with SMTP id b26so2751502lfa.5
        for <linux-usb@vger.kernel.org>; Thu, 14 May 2020 07:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dJ0pyxdpHXxReKFgKeAYfWi1MVSAk9k61Hi9HOaPo14=;
        b=m6xkbVGMkQKi9Rvoc7qjdm/L1kDbt2rcT6PQPDRj8l1PAN/S/+dQxIIZRSWqaXaADe
         AVXaYp1TyJ98Z94c93ZH3UraQOXQknYJzRUXZIGt6chTSF8ejEamu0nc3hqh/yA7/SDC
         7y+n9DStsVHes6x+6SMG4OKvBXQiZ+bSdqMPr2fbLZ99vL97sZ+fAKEWtwuxqkeRvdq4
         x/XcLSYPtar8Xf2D7t6+vUoAgfDbcseEpREiDULQYWILVJPNwVHAcnmZqKEvC6mQ58wr
         RvqkcLr3VTIZUfJTiY0hwEG5/g1I0QFuKTGFVrrIf1X1w5RTaMZfA/z1dQ4nmzcSxzwZ
         cL0A==
X-Gm-Message-State: AOAM531Mg2eH5Fdopm5obCaeCbrMznuFcgfMw44uOK2p3aEkPd67WCYI
        Gx007DzBsZ7t6YnBd+DzpkDVnect
X-Google-Smtp-Source: ABdhPJw6EDLOVZTiRSeEHShKCyMeRaN7jMSaza4AbECrM9biomRUFxOhpKpVxQ3bchTfoKyzTFyefQ==
X-Received: by 2002:a05:6512:3ea:: with SMTP id n10mr3508278lfq.127.1589465364094;
        Thu, 14 May 2020 07:09:24 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id y19sm1911317lfg.25.2020.05.14.07.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 07:09:23 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1jZEYA-0006cG-ER; Thu, 14 May 2020 16:09:26 +0200
Date:   Thu, 14 May 2020 16:09:26 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Michael Hanselmann <public@hansmi.ch>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
Subject: Re: [PATCH v2 2/6] USB: serial: ch341: Add basis for quirk detection
Message-ID: <20200514140926.GD25962@localhost>
References: <cover.1585697281.git.public@hansmi.ch>
 <1e1ae0da6082bb528a44ef323d4e1d3733d38858.1585697281.git.public@hansmi.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e1ae0da6082bb528a44ef323d4e1d3733d38858.1585697281.git.public@hansmi.ch>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 31, 2020 at 11:37:18PM +0000, Michael Hanselmann wrote:
> A subset of CH341 devices does not support all features, namely the
> prescaler is limited to a reduced precision and there is no support for
> sending a RS232 break condition. This patch adds a detection function
> which will be extended to return quirk flags as they're implemented.
> 
> The author's affected device has an imprint of "340" on the
> turquoise-colored plug, but not all such devices appear to be affected.
> 
> Signed-off-by: Michael Hanselmann <public@hansmi.ch>

I've applied this one now after making some minor changes.

> ---
>  drivers/usb/serial/ch341.c | 49 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
> index 85e7125d0194..9c839f67c3d4 100644
> --- a/drivers/usb/serial/ch341.c
> +++ b/drivers/usb/serial/ch341.c
> @@ -87,6 +87,7 @@ struct ch341_private {
>  	u8 mcr;
>  	u8 msr;
>  	u8 lcr;
> +	u8 quirks;

I used unsigned long to avoid any false sharing with the locked fields
even if that's likely not an issue here.

>  };
>  
>  static void ch341_set_termios(struct tty_struct *tty,
> @@ -330,6 +331,45 @@ out:	kfree(buffer);
>  	return r;
>  }
>  
> +static int ch341_detect_quirks(struct usb_device *dev)
> +{
> +	const unsigned int size = 2;
> +	char *buffer;
> +	int r;
> +
> +	buffer = kmalloc(size, GFP_KERNEL);
> +	if (!buffer)
> +		return -ENOMEM;
> +
> +	/*
> +	 * A subset of CH34x devices does not support all features. The
> +	 * prescaler is limited and there is no support for sending a RS232
> +	 * break condition. A read failure when trying to set up the latter is
> +	 * used to detect these devices.
> +	 */
> +	r = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0), CH341_REQ_READ_REG,
> +			    USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN,
> +			    CH341_REG_BREAK, 0, buffer, size, DEFAULT_TIMEOUT);
> +	if (r == -EPIPE) {
> +		dev_dbg(&dev->dev, "%s - reading break condition register"
> +			" failed (%d)\n", __func__, r);

Log message strings should not be broken (even if that violates the 80
column rule) so that they are easier to grep for.

No need need to include the errno, here and reworded the message.

I also used passed in the port structure and used the port->dev for
logging (I know, the driver isn't consistent here).

> +		r = 0;
> +		goto out;
> +	}
> +
> +	if (r < 0) {

We generally need to check for short transfers as well when reading.

> +		dev_err(&dev->dev, "%s - USB control read error (%d)\n",
> +			__func__, r);
> +		goto out;
> +	}
> +
> +	r = 0;
> +
> +out:
> +	kfree(buffer);
> +	return r;
> +}
> +
>  static int ch341_port_probe(struct usb_serial_port *port)
>  {
>  	struct ch341_private *priv;
> @@ -351,6 +391,15 @@ static int ch341_port_probe(struct usb_serial_port *port)
>  	if (r < 0)
>  		goto error;
>  
> +	r = ch341_detect_quirks(port->serial->dev);
> +	if (r < 0)
> +		goto error;
> +	if (r != 0) {
> +		dev_dbg(&port->serial->dev->dev,
> +			"%s - enabling quirks flags %08x\n", __func__, r);
> +		priv->quirks |= r;

And finally I moved this bit into the helper itself.

> +	}
> +
>  	usb_set_serial_port_data(port, priv);
>  	return 0;

Johan
