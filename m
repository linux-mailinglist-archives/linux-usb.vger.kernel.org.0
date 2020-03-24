Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0EB8190AFB
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2020 11:31:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbgCXKbO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Mar 2020 06:31:14 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34906 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbgCXKbO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Mar 2020 06:31:14 -0400
Received: by mail-lj1-f196.google.com with SMTP id k21so1917089ljh.2
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2020 03:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Qrc1qyc7Nq/IkKrQljq07wehgmhqhMm1w5CY2YeuSQ8=;
        b=V/T6v5arn9R6fdtABaTdcyy0JS0wBTPxc2iDgT6VEMCdBH7PxK4zNlsLSEyntbeg9b
         /1dryFyL59W1UH7h2NUkqVDjoBRi4RbXDtehocA2y+QErmDn59AMr7kH3piiSrLsU9xy
         oHLuu3Nyi1n3RcLxDjrPJx0DBKYjXCOEor+c2w88b4Jm0nMdYfapiMpbQ1PjG7U49DfI
         4DLnEU3kuitpv0hzwUF7bUW4BrJekkNSMu0XhSVjTjtvZR+p0sd84hT8KBah0fWs04BC
         adSg5e/hztqbQ/FHmZGTjOVHqdbw0BYHiMBfnGjX3UrYHNPmvr1e7tVBmnI69Hx7oJTS
         Iw8A==
X-Gm-Message-State: ANhLgQ19LQmez7apDmV0wR7a9q3YcwH4uYKsYcWqDHQAkdNAJ+TIPmlO
        upB0ZNrg9e5MO/CyAYkTFQY=
X-Google-Smtp-Source: ADFU+vsbwkvFlEt+A4+xlKkR/aIgmQ47oufpK+CtICayXrj0ZpjgWpuw9wsBDaiC3LBZcKEotAE9BQ==
X-Received: by 2002:a2e:3c0b:: with SMTP id j11mr10776155lja.9.1585045872173;
        Tue, 24 Mar 2020 03:31:12 -0700 (PDT)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.170.18])
        by smtp.gmail.com with ESMTPSA id y2sm5977826ljy.70.2020.03.24.03.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 03:31:11 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1jGgpo-0006Y8-PE; Tue, 24 Mar 2020 11:31:00 +0100
Date:   Tue, 24 Mar 2020 11:31:00 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Michael Hanselmann <public@hansmi.ch>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
Subject: Re: [PATCH 2/4] ch341: Detect HL340 variant
Message-ID: <20200324103100.GF5810@localhost>
References: <cover.1583520568.git.public@hansmi.ch>
 <f89211ed90a3d3c99eea2850d3df29618e09e625.1583520568.git.public@hansmi.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f89211ed90a3d3c99eea2850d3df29618e09e625.1583520568.git.public@hansmi.ch>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 06, 2020 at 07:00:43PM +0000, Michael Hanselmann wrote:
> A subset of CH341 devices does not support all features, namely the
> prescaler is limited to a reduced precision and there is no support for
> sending a RS232 break condition.
> 
> These devices can usually be identified by an imprint of "340" on the
> turquoise-colored plug. They're called "HL340" in this driver.

As I mentioned in my reply to the cover letter, you need to come up with
a different designation as this does not apply to all HL340 devices.
 
> Signed-off-by: Michael Hanselmann <public@hansmi.ch>
> ---
>  drivers/usb/serial/ch341.c | 42 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
> index 518209072c50..0523f46f53c7 100644
> --- a/drivers/usb/serial/ch341.c
> +++ b/drivers/usb/serial/ch341.c
> @@ -89,6 +89,7 @@ struct ch341_private {
>  	u8 mcr;
>  	u8 msr;
>  	u8 lcr;
> +	u8 flags;
>  };
>  
>  static void ch341_set_termios(struct tty_struct *tty,
> @@ -315,6 +316,43 @@ out:	kfree(buffer);
>  	return r;
>  }
>  
> +/*
> + * A subset of CH341 devices, called "HL340" in this driver, does not support
> + * all features. The prescaler is limited and there is no support for sending
> + * a RS232 break condition. A read failure when trying to set up the latter is
> + * used to detect these devices.
> + */
> +static int ch341_detect_hl340(struct usb_device *dev)

Return bool? Rename ch341_is_xxx() ?

> +{
> +	const unsigned int size = 2;
> +	char *buffer;
> +	int r;
> +
> +	buffer = kmalloc(size, GFP_KERNEL);
> +	if (!buffer)
> +		return -ENOMEM;
> +
> +	r = ch341_control_in(dev, CH341_REQ_READ_REG,
> +			     CH341_REG_BREAK, 0, buffer, size);

This helper would already have logged an error message, which perhaps is
ok, but you could consider using usb_control_msg() directly here.

> +	if (r == -EPIPE) {
> +		dev_dbg(&dev->dev, "%s - Chip is a HL340 variant\n",
> +			__func__);
> +		r = 1;
> +		goto out;
> +	}
> +
> +	if (r < 0) {
> +		dev_err(&dev->dev, "%s - USB control read error (%d)\n",
> +			__func__, r);
> +		goto out;
> +	}

So this is currently redundant.

> +
> +	r = 0;

Not needed either, right?

> +
> +out:	kfree(buffer);

Line break after the label, please.

> +	return r;
> +}
> +
>  static int ch341_port_probe(struct usb_serial_port *port)
>  {
>  	struct ch341_private *priv;
> @@ -336,6 +374,10 @@ static int ch341_port_probe(struct usb_serial_port *port)
>  	if (r < 0)
>  		goto error;
>  
> +	r = ch341_detect_hl340(port->serial->dev);
> +	if (r < 0)
> +		goto error;

You never store the return value (and the "flags" variable you add is
unused) which indicates your series needs to be restructured.

At least update flags in this patch. Perhaps consider renaming it
"quirks" depending on how it ends up being used.

> +
>  	usb_set_serial_port_data(port, priv);
>  	return 0;

Johan
