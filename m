Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F0A36A436
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jul 2019 10:49:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731691AbfGPItD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Jul 2019 04:49:03 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41737 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726465AbfGPItC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Jul 2019 04:49:02 -0400
Received: by mail-lf1-f65.google.com with SMTP id 62so8196088lfa.8
        for <linux-usb@vger.kernel.org>; Tue, 16 Jul 2019 01:49:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kL50jzzK/8VHtX1nIcdZh9QBCxRnkP+nytMm5FY3fPI=;
        b=lu4YrHyxFK4uAOunEda09HY0W5n1/6q0gOCS2wLSxAwjw+VMITP1t5qsfhFF4/e/0x
         JOWU3COVKSoWmL0cfw7WSGOHpQPVh4f1zDLhK9pnDTtrQzY490m5yZnvEcszQ7k7U4XE
         v1CDao9Dm3hWPesDYDHGxt/v38s+zHBsJ8jLUGU4H7xc9A1MVS0FT5iq46K+0I6zXRDF
         8iv06fpChZztmD4/aQRy1raku6NhmQhuLRwAdS5v4xBSD9rTj73OFalGtF7vnGporbhS
         sTNdduCwQ+TQ7r7gKTTLv0ZiGozxOM0cmo841iyltp/JsicQvnLMSOpRitY7+S5Bm3H1
         Boeg==
X-Gm-Message-State: APjAAAWRG40h+aZGtRreIMxeGUul65baGW2iB9jG0elJ+AMsx0nIjeXT
        4bAj8BftZSJFDkCK1irnVQc=
X-Google-Smtp-Source: APXvYqxDfGbrbWJVudow6pEWLkz/+b2CQQHWUWk2n/jCl2vwvZCgQMPTrLPPg6F1ji1Bhb+9L40ysw==
X-Received: by 2002:ac2:5337:: with SMTP id f23mr14310675lfh.15.1563266941057;
        Tue, 16 Jul 2019 01:49:01 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id v86sm3599377lje.74.2019.07.16.01.48.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 01:49:00 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1hnJ91-0002zd-CP; Tue, 16 Jul 2019 10:49:08 +0200
Date:   Tue, 16 Jul 2019 10:49:07 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Charles Yeh <charlesyeh522@gmail.com>
Cc:     gregkh@linuxfoundation.org, johan@kernel.org,
        linux-usb@vger.kernel.org, charles-yeh@prolific.com.tw
Subject: Re: [PATCH] [PATCH v7] USB: serial: pl2303: Add new PID to support
 PL2303HXN (TYPE_HXN)
Message-ID: <20190716084907.GB10939@localhost>
References: <20190702123006.11320-1-charlesyeh522@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190702123006.11320-1-charlesyeh522@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 02, 2019 at 08:30:06PM +0800, Charles Yeh wrote:
> Prolific has developed a new USB to UART chip: PL2303HXN
> PL2303HXN : PL2303GC/PL2303GS/PL2303GT/PL2303GL/PL2303GE/PL2303GB
> The Vendor request used by the PL2303HXN (TYPE_HXN) is different from
> the existing PL2303 series (TYPE_HX & TYPE_01).
> Therefore, different Vendor requests are used to issue related commands.

> Signed-off-by: Charles Yeh <charlesyeh522@gmail.com>
> ---
> changelog:
> v7:
> 1. Add PL2303_HXN_RESET_CONTROL_MASK define.
> 2. In pl2303_open,use PL2303_HXN_RESET_CONTROL_MASK & PL2303_HXN_RESET_CONTROL
>    to reset the upstream and downstream pipe data
> 3. Ignore "WARNING: line over 80 characters" at #776,#782,#790
 
>  #define PL2303_FLOWCTRL_MASK		0xf0
> +#define PL2303_HXN_FLOWCTRL_MASK	0x1C
> +#define PL2303_HXN_FLOWCTRL		0x0A

I asked you to keep related defines together (and to move the mask where
the register define was, not the other way round). Please move these to
the other HXN defines below, and keep the register address defines
before the corresponding bit defines.

> +#define PL2303_READ_TYPE_HX_STATUS	0x8080
> +
> +#define PL2303_HXN_RESET_CONTROL_MASK	0x03

This makes no sense. The whole register is used for reset. If you want a
define that can be used for resetting both pipes then add two separate
defines for up and down respectively, and add a third define for
resetting both buffer as a bitwise OR of the two.

Remember that the code should be self-documenting as far as possible so
picking descriptive names is important.

Also move this one after the corresponding register address define
below.

> +#define PL2303_HXN_RESET_CONTROL	0x07
> +#define PL2303_HXN_CTRL_XON_XOFF	0x0C
> +#define PL2303_HXN_CTRL_RTS_CTS		0x18
> +#define PL2303_HXN_CTRL_NONE		0x1C

> @@ -765,8 +835,11 @@ static int pl2303_open(struct tty_struct *tty, struct usb_serial_port *port)
>  	if (spriv->quirks & PL2303_QUIRK_LEGACY) {
>  		usb_clear_halt(serial->dev, port->write_urb->pipe);
>  		usb_clear_halt(serial->dev, port->read_urb->pipe);
> -	} else {
> +	} else if (spriv->type == &pl2303_type_data[TYPE_HXN]) {
>  		/* reset upstream data pipes */

This comment belongs in the last else block. Your new code shouldn't
need one.

> +		pl2303_update_reg(serial, PL2303_HXN_RESET_CONTROL,
> +				PL2303_HXN_RESET_CONTROL_MASK, 0x03);

So two things; first, do you really need to read back the current value?
I would assume that it always reads back as 0 and that writing 0x03 in
this case would be sufficient to reset both buffers.

Second, please use a define for 0x03; no magic constants, as we have
discussed before. You don't need a separate mask define if you're always
resetting both buffers together (just use the same value define twice).

> +	} else {
>  		pl2303_vendor_write(serial, 8, 0);
>  		pl2303_vendor_write(serial, 9, 0);
>  	}

Johan
