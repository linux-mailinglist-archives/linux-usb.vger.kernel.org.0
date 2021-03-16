Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C13233D85E
	for <lists+linux-usb@lfdr.de>; Tue, 16 Mar 2021 16:56:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238214AbhCPPze (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Mar 2021 11:55:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:57996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238236AbhCPPzY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Mar 2021 11:55:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0C9B9650F6;
        Tue, 16 Mar 2021 15:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615910124;
        bh=dEbogVuqzQr206q8OXxtN3iagOD5hUNXzczMaA7h1Po=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SydL5N3/izEIRdMMpYHfIf0nF8gosp4MdoqDBimdWZ9ieV08/QZZuQrCMA871Aapa
         UV12BNbqTpKddERv+dlVF3od/lv9wvVOVc//r0MYEubDJJrcPntWRTmxG5qt9/e2XI
         9H5GgzX8XgtlqjksbPC7cZWsyAuAM9r40FIb1qi96oqInkmhT5YvAyRJe/E4xT0Xrl
         x0wm99P5vCjRxqLR8jI9sKj+d/Z3tS6Akgzp9mWG1/BaZV1x8izQi4lXxeDETfDMTz
         iLFeUc8CVDUfcWWSTNR7lR2Cyg3vQJMQRadkBP4VuUsMJPz44gTyzxB954kvrBGZNz
         ShGypsiBj/Y4Q==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lMC2i-0002Jh-2z; Tue, 16 Mar 2021 16:55:36 +0100
Date:   Tue, 16 Mar 2021 16:55:36 +0100
From:   Johan Hovold <johan@kernel.org>
To:     michaelk@IEEE.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] USB: serial: pl2303: TA & TB alternate divider
Message-ID: <YFDU+De/mTMnRZQR@hovoldconsulting.com>
References: <20210316120620.888110-1-michaelk@IEEE.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316120620.888110-1-michaelk@IEEE.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 16, 2021 at 08:06:20AM -0400, michaelk@IEEE.org wrote:
> From: Michael Katzmann <michaelk@IEEE.org>
> 
> Use an alternate clock divider algorithm and bit ordering for the TA and
> TB versions of the pl2303. It was discovered that these variants do not
> produce the correct baud rates with the existing scheme.
> 
> see https://lore.kernel.org/r/3aee5708-7961-f464-8c5f-6685d96920d6@IEEE.org
> 
> Signed-off-by: Michael G. Katzmann <michaelk@IEEE.org>
> ---
>  drivers/usb/serial/pl2303.c | 45 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
 
> +static speed_t pl2303_encode_baud_rate_divisor_alt(unsigned char buf[4],
> +                                                                speed_t baud)
> +{
> +        unsigned int baseline, mantissa, exponent;
> +
> +        /*
> +         * Apparently, for the TA version the formula is:
> +         *   baudrate = 12M * 32 / (mantissa * 2^exponent)
> +         * where
> +         *   mantissa = buf[10:0]
> +         *   exponent = buf[15:13 16]
> +         */
> +        baseline = 12000000 * 32;
> +        mantissa = baseline / baud;
> +        if (mantissa == 0)
> +                mantissa = 1;   /* Avoid dividing by zero if baud > 32*12M. */
> +        exponent = 0;
> +        while (mantissa >= 2048) {
> +                if (exponent < 15) {
> +                        mantissa >>= 1; /* divide by 2 */
> +                        exponent++;
> +                } else {
> +                        /* Exponent is maxed. Trim mantissa and leave. */
> +                        mantissa = 2047;
> +                        break;
> +                }
> +        }
> +
> +        buf[3] = 0x80;
> +        buf[2] = exponent & 0x01;
> +        buf[1] = (exponent & ~0x01) << 4 | mantissa >> 8;
> +        buf[0] = mantissa & 0xff;
> +
> +        /* Calculate and return the exact baud rate. */
> +        baud = (baseline / mantissa) >> exponent;
> +
> +        return baud;
> +}

The code above is still indented using spaces rather than tabs.

> +
> +
>  static void pl2303_encode_baud_rate(struct tty_struct *tty,
>  					struct usb_serial_port *port,
>  					u8 buf[4])
> @@ -645,6 +688,8 @@ static void pl2303_encode_baud_rate(struct tty_struct *tty,
>  
>  	if (baud == baud_sup)
>  		baud = pl2303_encode_baud_rate_direct(buf, baud);
> +	else if (spriv->type->alt_divisors) 
> +                baud = pl2303_encode_baud_rate_divisor_alt(buf, baud);

Same here.

>  	else
>  		baud = pl2303_encode_baud_rate_divisor(buf, baud);

Please include a revision in the subject prefix when resending (e.g.
this would be "[PATCH v2]: USB: ...", generally there should be a
matching short changelog below the '---' cut-off line as well).

Johan
