Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49932283473
	for <lists+linux-usb@lfdr.de>; Mon,  5 Oct 2020 13:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbgJELAq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Oct 2020 07:00:46 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:42030 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725891AbgJELAq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Oct 2020 07:00:46 -0400
Received: by mail-lf1-f67.google.com with SMTP id b12so10289477lfp.9
        for <linux-usb@vger.kernel.org>; Mon, 05 Oct 2020 04:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=R+FjWWb/Gsxp5kEgzC3L4mnZugyNYs4HuWTe0REKeFw=;
        b=J24R1lNY1ogKY+2y8Rh5Mmzh0P2s3+LIs0jfQ+j0FaIPAZp0vPFsUXKIFYV8F+E9AO
         ZTCQgMunBdbH6XCDMEB4pfoeNwL0RtQ8nxVX9qL7g5VkKNIpb+H6bXmDToNf9dzLdAkW
         Kvh5P6LbaUmfVA4Xc8chLHOKT8jTDb2BmHgWhWOto2xwSBbffeTPXJOfAwlifOpDHXCP
         9TDmAdc11FR21QaC+EttgGIk4nmj5AYxUnrQLNoMvLeecIgVwssiEVQhMl0Goz8X6FRT
         ZkoE/wKojffiw3WIfxOoGYGYEw7iJUnC9fvbpNh0HgqapsriMPAKR+2vy6hefOeVYRTq
         hSZA==
X-Gm-Message-State: AOAM530e2Y9kKpjVXpq/N8EYTb57Ri03CB8gYtYvv2L7Zb0mhEgKmlrm
        8a9BoGsnlh8yV74Scz3jGdI=
X-Google-Smtp-Source: ABdhPJxCLvklVLDUWUHj7AzNOTn+g4CVD7r2NFhJ1m9IejSEHl/DESjlE6yF6SpKArYfPQXcMDM3Iw==
X-Received: by 2002:ac2:4e82:: with SMTP id o2mr4914492lfr.170.1601895643280;
        Mon, 05 Oct 2020 04:00:43 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id l4sm2679546lfg.296.2020.10.05.04.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 04:00:42 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kPOER-0004Wa-8u; Mon, 05 Oct 2020 13:00:39 +0200
Date:   Mon, 5 Oct 2020 13:00:39 +0200
From:   Johan Hovold <johan@kernel.org>
To:     "Mychaela N. Falconia" <falcon@freecalypso.org>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        mychaela.falconia@gmail.com
Subject: Re: [PATCH v3 1/3] USB: serial: ftdi_sio: use cur_altsetting for
 consistency
Message-ID: <20201005110039.GO5141@localhost>
References: <20201002184937.65BAB3740218@freecalypso.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201002184937.65BAB3740218@freecalypso.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 02, 2020 at 06:49:37PM +0000, Mychaela N. Falconia wrote:
> ftdi_determine_type() function had this construct in it to get the
> number of the interface it is operating on:
> 
>   inter = serial->interface->altsetting->desc.bInterfaceNumber;
> 
> Elsewhere in this driver cur_altsetting is used instead for this
> purpose.  Change ftdi_determine_type() to use cur_altsetting
> for consistency.
> 
> Signed-off-by: Mychaela N. Falconia <falcon@freecalypso.org>
> ---
> 
> Simply changing altsetting to cur_altsetting would have caused the
> offending line to exceed the 80 character limit.  Instead I changed
> the code structure to be the same as in Johan's recent JTAG quirk
> cleanup patch.
> 
> ---
>  drivers/usb/serial/ftdi_sio.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
> index 12a4b74ca1f4..a34c0d8b0cd3 100644
> --- a/drivers/usb/serial/ftdi_sio.c
> +++ b/drivers/usb/serial/ftdi_sio.c
> @@ -1571,7 +1571,8 @@ static void ftdi_determine_type(struct usb_serial_port *port)
>  	dev_dbg(&port->dev, "%s: bcdDevice = 0x%x, bNumInterfaces = %u\n", __func__,
>  		version, interfaces);
>  	if (interfaces > 1) {
> -		int inter;
> +		struct usb_interface *intf = serial->interface;
> +		int ifnum = intf->cur_altsetting->desc.bInterfaceNumber;
>  
>  		/* Multiple interfaces.*/
>  		if (version == 0x0800) {
> @@ -1586,14 +1587,13 @@ static void ftdi_determine_type(struct usb_serial_port *port)
>  			priv->chip_type = FT2232C;
>  
>  		/* Determine interface code. */
> -		inter = serial->interface->altsetting->desc.bInterfaceNumber;
> -		if (inter == 0) {
> +		if (ifnum == 0) {
>  			priv->interface = INTERFACE_A;
> -		} else  if (inter == 1) {
> +		} else  if (ifnum == 1) {
>  			priv->interface = INTERFACE_B;
> -		} else  if (inter == 2) {
> +		} else  if (ifnum == 2) {
>  			priv->interface = INTERFACE_C;
> -		} else  if (inter == 3) {
> +		} else  if (ifnum == 3) {
>  			priv->interface = INTERFACE_D;
>  		}

I've applied this one now after fixing the old style issues here
(unnecessary braces and random white space after else).

Thanks!

Johan
