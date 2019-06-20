Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0884CF35
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2019 15:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbfFTNnW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jun 2019 09:43:22 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:44879 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbfFTNnW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jun 2019 09:43:22 -0400
Received: by mail-lf1-f65.google.com with SMTP id r15so2453704lfm.11
        for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2019 06:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8EIFYg/uMDy4vnwfa1YzGDkCLZrwizQ6DlIcVFmBQak=;
        b=Do2PoU2nSPbmX+h6PxV0W/NcgTBleMMuiI0TvzsUj0ZDALon1CCXAQ8SPYiOooQHFO
         fAzHqxFamdWFUWcwPahy8uCtTO7ggAvk7dyiY4AmqLFoe0vh8Hxhjqp+PvQ21qMz2wfw
         3212VnXjs2cPymKZLRBbjLorDw7qQ/n0up7AKNACR+MgGaIxHwpiue1h3Ohdak0Aiach
         lXqXwymVAblCdzj9HGxUjWc8v9vTdjPc7wzqNzXGxQpUrWPmWPzpRfvNv7L2nO8dJfif
         MllixwU6ST/jTHgS3qCQciOv6r7pnWkfRLq1cI8aFBFXMMDA5/Yf2nl72IC1rmWL6Zm4
         /Svw==
X-Gm-Message-State: APjAAAWN/uy5VJ5EVD+BEaEU55RyDa/+WoYQyI+5nRsudeQ9hSwgfJT+
        UzDM0I5lJdJYlGF81qfk+p8=
X-Google-Smtp-Source: APXvYqxoGEBh3sU3i3fFbsywN7ySlacPriNmX+LSyleIuFRKze4adEFqD/GAiznxolCYEWZFzQpxxA==
X-Received: by 2002:ac2:41d7:: with SMTP id d23mr62056575lfi.118.1561038200039;
        Thu, 20 Jun 2019 06:43:20 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id u9sm3144929lfb.38.2019.06.20.06.43.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jun 2019 06:43:18 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1hdxLS-0000ie-0R; Thu, 20 Jun 2019 15:43:18 +0200
Date:   Thu, 20 Jun 2019 15:43:18 +0200
From:   Johan Hovold <johan@kernel.org>
To:     jontio <jontio@i4free.co.nz>
Cc:     johan@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: ch341: fix wrong baud rate setting
 calculation
Message-ID: <20190620134318.GL6241@localhost>
References: <jontio@i4free.co.nz>
 <20190608051309.4689-1-jontio@i4free.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190608051309.4689-1-jontio@i4free.co.nz>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jun 08, 2019 at 05:13:09PM +1200, jontio wrote:
> For some wanted baud rates ch341_set_baudrate_lcr() calculates the "a"
> value such that it produces a significantly different baud rate than the
> desired one. This means some hardware can't communicate with the CH34x
> chip. Particularly obvious wrong baud rates are 256000 and 921600 which
> deviate by 2.3% and 7.4% respectively. This proposed patch will bring the
> errors for these baud rates to below 0.5%. This patch will significantly
> improve the error of some other unusual baud rates too (such as 1333333
> from 10% error to 0% error). Currently ch341_set_baudrate_lcr() will
> accept any baud rate and can produce a practically arbitrary large error
> (for example a 40% error for 5000000) this patch does not address this
> issue.

It doesn't hurt to expand the commit message with further details from
your other mail.

> Signed-off-by: jontio <jontio@i4free.co.nz>

You need to sign off with your full name. It should also match the From
line (author).

> ---
>  drivers/usb/serial/ch341.c | 45 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/drivers/usb/serial/ch341.c b/drivers/usb/serial/ch341.c
> index 3bb1fff02bed..7cd1d6f70b56 100644
> --- a/drivers/usb/serial/ch341.c
> +++ b/drivers/usb/serial/ch341.c
> @@ -54,6 +54,9 @@
>  #define CH341_BAUDBASE_FACTOR 1532620800
>  #define CH341_BAUDBASE_DIVMAX 3
>  
> +/* Chip frequency is 12Mhz. not quite the same as (CH341_BAUDBASE_FACTOR>>7) */
> +#define CH341_OSC_FREQUENCY 12000000
> +
>  /* Break support - the information used to implement this was gleaned from
>   * the Net/FreeBSD uchcom.c driver by Takanori Watanabe.  Domo arigato.
>   */
> @@ -168,6 +171,48 @@ static int ch341_set_baudrate_lcr(struct usb_device *dev,
>  	factor = 0x10000 - factor;
>  	a = (factor & 0xff00) | divisor;
>  
> +	/*
> +	 * Calculate baud error using the 0,1,2,3 LSB and
> +	 * also the error without the divisor (LSB==7).
> +	 * Decide whether the divisor should be used.

Wrap also comments at 72 cols or so.

> +	 */
> +	uint32_t msB = (a>>8) & 0xFF;
> +	uint32_t lsB = a & 0xFF;
> +	int32_t baud_wanted = priv->baud_rate;
> +	uint32_t denom = ((1<<(10-3*lsB))*(256-msB));

It's not obvious from just looking at the above chunk that 3*lsB < 10.

And some style issues:

 - declare variables at the start of the function (or possibly start of
   block), and defer non-trivial initialisation
 - use the kernel types u32, s32 or plain (unsigned) int instead of the
   c99 types.
 - no camel case, msb, lsb is fine
 - add a space on both sides of operators (also in your comments)
 - drop the denom outmost parenthesis (also in some expressions below)
 - please use lowercase hex notation for consistency with the rest of
   the driver (function)

> +	/*
> +	 * baud_wanted==(CH341_OSC_FREQUENCY/256) implies MSB==0 for no divisor
> +	 * the 100 is for rounding.
> +	 */
> +	if (denom && ((baud_wanted+100) >= (((uint32_t)CH341_OSC_FREQUENCY)>>8))) {
> +
> +		/* Calculate error for divisor */
> +		int32_t baud_expected = ((uint32_t)CH341_OSC_FREQUENCY) / denom;
> +		uint32_t baud_error_difference = abs(baud_expected-baud_wanted);
> +
> +		/* Calculate a for no divisor */
> +		uint32_t a_no_divisor = ((0x10000-(((uint32_t)CH341_OSC_FREQUENCY)<<8) /
> +			baud_wanted+128) & 0xFF00) | 0x07;
> +
> +		/* a_no_divisor is only valid for MSB<248 */
> +		if ((a_no_divisor>>8) < 248) {
> +
> +			/* Calculate error for no divisor */
> +			int32_t baud_expected_no_divisor = ((uint32_t)CH341_OSC_FREQUENCY) /
> +				(256-(a_no_divisor>>8));
> +			uint32_t baud_error_difference_no_divisor =
> +				abs(baud_expected_no_divisor-baud_wanted);
> +
> +			/*
> +			 * If error using no divisor is less than using
> +			 * a divisor then use it instead for the "a" word.
> +			 */
> +			if (baud_error_difference_no_divisor < baud_error_difference)
> +				a = a_no_divisor;
> +		}
> +

Stray newline.

> +	}
> +
>  	/*
>  	 * CH341A buffers data until a full endpoint-size packet (32 bytes)
>  	 * has been received unless bit 7 is set.

Ok, I'm gonna have to look at this again, but perhaps you can consider
the style input meanwhile.

Johan
