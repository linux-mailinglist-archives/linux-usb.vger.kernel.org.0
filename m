Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F4AC27C22A
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 12:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727468AbgI2KPZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Sep 2020 06:15:25 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41603 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbgI2KPY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Sep 2020 06:15:24 -0400
Received: by mail-lf1-f67.google.com with SMTP id y17so4827166lfa.8
        for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2020 03:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9FmSZbSvGDPjtgbZA1tlu+w33XPuCVnU0yB3ZtvK1L4=;
        b=OQ7fM1R9V2jZltA2ytlmZ+tmxLr4bxcUM+HX4c1l21I7tRcTCWr0My+FwexBFFmgTf
         bjIp+TF8G+ZOEDsIuMqtiubPezlCcqtC6Sa/l3DXhOg+HaP8cV6Iop9I4pQUGWO4R+mX
         4A0QbOQUk76TUhPXwE8QY9HfQ6qpcV5G4sqZS31yA5eRxIweX8DQ6pwJ7Y1+emt2XJeN
         8apzT43GRovB9uQz1C81CttjhyxVU4Sn8TcyMZfEXfYDGl1arzzhiTUGRzEK+MjAG4W1
         W/nM1c1ju/CvP6JNao5b28kbAbGp9e2gi6yeNcC0E3NBNDbkUBaNs8xC3xRTsIFF/vmH
         lKxA==
X-Gm-Message-State: AOAM533MfkAUVxsIjRZ8F5Jin4qGRqQbfOjpBnA8LjsfuCd5BkCMvk4R
        6T3HFxtSJIxl7yIc5hZAapIlt7mCGas=
X-Google-Smtp-Source: ABdhPJxok9VZJYt41IE2KUySZSoy2bKZEPru78xP0PqdEAenIN5x1VTD/PhOAISPl3vaFWWWfI/Wjg==
X-Received: by 2002:a19:404:: with SMTP id 4mr925007lfe.343.1601374522624;
        Tue, 29 Sep 2020 03:15:22 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id d1sm3218146lfe.180.2020.09.29.03.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 03:15:21 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kNCfE-0001UW-IL; Tue, 29 Sep 2020 12:15:16 +0200
Date:   Tue, 29 Sep 2020 12:15:16 +0200
From:   Johan Hovold <johan@kernel.org>
To:     "Mychaela N. Falconia" <falcon@freecalypso.org>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        mychaela.falconia@gmail.com
Subject: Re: [PATCH 2/3] USB: serial: ftdi_sio: pass port to quirk port_probe
 functions
Message-ID: <20200929101516.GR24441@localhost>
References: <20200916015637.32BAC3740245@freecalypso.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916015637.32BAC3740245@freecalypso.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 16, 2020 at 01:56:36AM +0000, Mychaela N. Falconia wrote:
> The original code passed only the pointer to the ftdi_private struct
> to quirk port_probe functions.  However, some quirks may need to be
> applied conditionally only to some channels of a multichannel FT2232x
> or FT4232H device, and if a given quirk's port_probe function needs
> to figure out which channel of a multichannel device is currently
> being considered, it needs access to the port pointer passed to the
> ftdi_sio_port_probe() function, so it can traverse USB data structures
> from there.
> 
> Signed-off-by: Mychaela N. Falconia <falcon@freecalypso.org>
> ---
>  drivers/usb/serial/ftdi_sio.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
> index 8d89a1650dad..cdf4f4e05fb2 100644
> --- a/drivers/usb/serial/ftdi_sio.c
> +++ b/drivers/usb/serial/ftdi_sio.c
> @@ -88,15 +88,17 @@ struct ftdi_private {
>  struct ftdi_sio_quirk {
>  	int (*probe)(struct usb_serial *);
>  	/* Special settings for probed ports. */
> -	void (*port_probe)(struct ftdi_private *);
> +	void (*port_probe)(struct usb_serial_port *, struct ftdi_private *);
>  };
 
>  static const struct ftdi_sio_quirk ftdi_jtag_quirk = {
>  	.probe	= ftdi_jtag_probe,
> @@ -2253,7 +2255,7 @@ static int ftdi_sio_port_probe(struct usb_serial_port *port)
>  	mutex_init(&priv->cfg_lock);
>  
>  	if (quirk && quirk->port_probe)
> -		quirk->port_probe(priv);
> +		quirk->port_probe(port, priv);
>  
>  	usb_set_serial_port_data(port, priv);

I'd prefer setting the port data before calling quirk->port_probe and
just pass in the port structure.

Johan
