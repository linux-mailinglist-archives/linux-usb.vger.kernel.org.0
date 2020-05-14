Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 379911D32BB
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 16:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727876AbgENOYe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 10:24:34 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:36025 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbgENOYe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 10:24:34 -0400
Received: by mail-lf1-f68.google.com with SMTP id c21so2805949lfb.3
        for <linux-usb@vger.kernel.org>; Thu, 14 May 2020 07:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3AimrDPPvv2ior6Jtyml+gHziZA8Ox8SpctG0L6ikBU=;
        b=eWfIYspBN13hyyyNsw1PhZHJswfIcVrDkmx3L5TIzU3jzb053lDsi2X9PK7KIiLwqv
         U3x+ohw5s6JUEVktLLc8i6hJC4mly4tgZoB1rcYfZA6HDNvNbGtq2yxJep17YI/1Y6Om
         uM55U+04VvCIzBcbGOXW9SfBlsN30OnxPVLhVwZAm9hsAIkT5NPHvnuBlsBD/eb2fcTK
         XsWmrNLhKBBkgV+GNONFFYHycnESDZw2A93yF0SIXPqJdVlbu3T8HYfZ4T/vVjRSJR44
         DM3FFgw7oxMcZatdzxmRlRiFlTgysYwkYYobGyKwK84vLubGARDcZi6k9Ed9zV2irmps
         hJaQ==
X-Gm-Message-State: AOAM533rzfuywfgODyJFVLoHaRXw271Sr4fd+QXLhfvVLsUSZ7owcdn1
        BXw0zo4+5eKMr1BsRoWExlM=
X-Google-Smtp-Source: ABdhPJycuShY2+REgiLBqfVOGMY67zsO1kOKGw9DMcgvnsJfLcJT42KQPYRBVOP8nQ705iY8EkMOSA==
X-Received: by 2002:a05:6512:691:: with SMTP id t17mr3681390lfe.85.1589466272567;
        Thu, 14 May 2020 07:24:32 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id o18sm1557169ljc.73.2020.05.14.07.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 07:24:31 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1jZEmo-0006jA-Ty; Thu, 14 May 2020 16:24:34 +0200
Date:   Thu, 14 May 2020 16:24:34 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Michael Hanselmann <public@hansmi.ch>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
Subject: Re: [PATCH v2 4/6] USB: serial: ch341: Name prescaler, divisor
 registers
Message-ID: <20200514142434.GF25962@localhost>
References: <cover.1585697281.git.public@hansmi.ch>
 <65cfdf4a0600e86e89b3a3fb839e733ecebee688.1585697281.git.public@hansmi.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65cfdf4a0600e86e89b3a3fb839e733ecebee688.1585697281.git.public@hansmi.ch>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 31, 2020 at 11:37:20PM +0000, Michael Hanselmann wrote:
> Add constants for the prescaler and divisor registers.

...and document and name register 0x25, and put the LCR define to more
use. I still thinks this should go in its own patch as your not
replacing all magic register constants (or at least be mentioned in the
commit message).

> The 0x25 register is only used by CH341 chips before version 0x30 and is
> involved in configuring the line control parameters. It's not known to
> the author whether there any such chips in the wild, and the driver
> never supported them (other registers are also treated differently). The
> alternative would've been to not set the register, but that may have
> unintended effects.

How did you come to those conclusions? I see this register being written
the value zero in some older version of the vendor driver, but not in
more recent ones.

Are you sure it's at all related to LCR?

> Signed-off-by: Michael Hanselmann <public@hansmi.ch>
> ---
>  drivers/usb/serial/ch341.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
> index 67a5d4c3df42..9407e12d9fbc 100644
> --- a/drivers/usb/serial/ch341.c
> +++ b/drivers/usb/serial/ch341.c
> @@ -61,7 +61,11 @@
>  #define CH341_REQ_MODEM_CTRL   0xA4
>  
>  #define CH341_REG_BREAK        0x05
> +#define CH341_REG_PRESCALER    0x12
> +#define CH341_REG_DIVISOR      0x13
>  #define CH341_REG_LCR          0x18
> +#define CH341_REG_LCR2         0x25
> +
>  #define CH341_NBREAK_BITS      0x01
>  
>  #define CH341_LCR_ENABLE_RX    0x80
> @@ -294,11 +298,19 @@ static int ch341_set_baudrate_lcr(struct usb_device *dev,
>  	 */
>  	val |= BIT(7);
>  
> -	r = ch341_control_out(dev, CH341_REQ_WRITE_REG, 0x1312, val);
> +	r = ch341_control_out(dev, CH341_REQ_WRITE_REG,
> +			      CH341_REG_DIVISOR << 8 | CH341_REG_PRESCALER,
> +			      val);
>  	if (r)
>  		return r;
>  
> -	r = ch341_control_out(dev, CH341_REQ_WRITE_REG, 0x2518, lcr);
> +	/*
> +	 * Chip versions before version 0x30 (read using
> +	 * CH341_REQ_READ_VERSION) used separate registers for line control.
> +	 * 0x30 and above use CH341_REG_LCR only.
> +	 */
> +	r = ch341_control_out(dev, CH341_REQ_WRITE_REG,
> +			      CH341_REG_LCR2 << 8 | CH341_REG_LCR, lcr);

Keeping "0x25" here to indicate that it's purpose is still not known
should be ok too.

>  	if (r)
>  		return r;

Johan
