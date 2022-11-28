Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4642E63AEA7
	for <lists+linux-usb@lfdr.de>; Mon, 28 Nov 2022 18:16:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232820AbiK1RQR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Nov 2022 12:16:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232833AbiK1RQN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Nov 2022 12:16:13 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 699BC26AEC
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 09:16:08 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 023CB612C4
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 17:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 648ACC43470;
        Mon, 28 Nov 2022 17:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669655767;
        bh=59E6maMC3OA+jtDUJyY5jpn8sOosPwoinIAxcu9Fkbo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CHHtqiid6AL7wIMk+4NStkIALltyOKvdHSco0QEstaplABV2IN2dfDErHsNytpMiK
         n7kp60/NRLydeWscllEz8mZzhr4d83h5WUCwaVv6Mm84tcmYjgJt+AGvKEi0QgK7nx
         /1VL+0/lhsYNt3WO+bd3ASJ0qzUf1MaZjL9C2/KKu7wYwev3TklQFna07UH+FI5JbP
         Gq1GY5uU+ZDFpC2KKsaor86XIyZhQRHnywqF3gwWh3YQ+UMic/SBo5X+0NpC28rL55
         EiW+6+7OphUhpSL/xalPU06OLRjj14/vaoeVGG1SxR/CNTL03IapX2/Lohyhe8pfjy
         /lSxka/dbPVGw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1ozhjg-0008Gf-J4; Mon, 28 Nov 2022 18:16:05 +0100
Date:   Mon, 28 Nov 2022 18:16:04 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 7/7] USB: serial: ftdi_sio: Fill c_*speed fields with
 real baud rate
Message-ID: <Y4Ts1K6hhwm4ZtSx@hovoldconsulting.com>
References: <20220924102718.2984-1-pali@kernel.org>
 <20220924102718.2984-8-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220924102718.2984-8-pali@kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Sep 24, 2022 at 12:27:18PM +0200, Pali Rohár wrote:
> Calculate baud rate value in c_*speed fields to the real values which were
> set on hardware. For this operation, add a new set of methods
> *_divisor_to_baud() for each chip and use them for calculating the real
> baud rate values.
> 
> Each *_divisor_to_baud() method is constructed as an inverse function of
> its corresponding *_baud_to_divisor() method.
> 
> Signed-off-by: Pali Rohár <pali@kernel.org>
> Tested-by: Marek Behún <kabel@kernel.org>
> Signed-off-by: Marek Behún <kabel@kernel.org>
> ---
>  drivers/usb/serial/ftdi_sio.c | 93 +++++++++++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
> 
> diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
> index 79b00912c81c..350ed14b014c 100644
> --- a/drivers/usb/serial/ftdi_sio.c
> +++ b/drivers/usb/serial/ftdi_sio.c
> @@ -1183,6 +1183,34 @@ static u32 ftdi_sio_baud_to_divisor(int baud)
>  	}
>  }
>  
> +static int ftdi_sdio_divisor_to_baud(u32 divisor)
> +{
> +	switch (divisor) {
> +	case ftdi_sio_b300:
> +		return 300;
> +	case ftdi_sio_b600:
> +		return 600;
> +	case ftdi_sio_b1200:
> +		return 1200;
> +	case ftdi_sio_b2400:
> +		return 2400;
> +	case ftdi_sio_b4800:
> +		return 4800;
> +	case ftdi_sio_b9600:
> +		return 9600;
> +	case ftdi_sio_b19200:
> +		return 19200;
> +	case ftdi_sio_b38400:
> +		return 38400;
> +	case ftdi_sio_b57600:
> +		return 57600;
> +	case ftdi_sio_b115200:
> +		return 115200;
> +	default:
> +		return 9600;
> +	}
> +}

As I mentioned before, this one should no be needed as the SIO only
supports this discrete set of values (or errors out).

> +
>  static unsigned short int ftdi_232am_baud_base_to_divisor(int baud, int base)
>  {
>  	unsigned short int divisor;
> @@ -1205,11 +1233,28 @@ static unsigned short int ftdi_232am_baud_base_to_divisor(int baud, int base)
>  	return divisor;
>  }
>  
> +static int ftdi_232am_divisor_base_to_baud(unsigned short int divisor, int base)
> +{
> +	static const unsigned char divfrac_inv[4] = { 0, 4, 2, 1 };
> +	unsigned int divisor3;
> +
> +	if (divisor == 0)
> +		divisor = 1;
> +	divisor3 = (GENMASK(13, 0) & divisor) << 3;
> +	divisor3 |= divfrac_inv[(divisor >> 14) & 0x3];
> +	return DIV_ROUND_CLOSEST(base, 2 * divisor3);
> +}

Still no motivation to review these.

[...]
  
> @@ -1358,6 +1444,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
>  			}
>  			div_okay = 0;
>  		}
> +		baud = ftdi_sdio_divisor_to_baud(div_value);
>  		break;
>  	case FT8U232AM: /* 8U232AM chip */
>  		if (baud >= 183 && baud <= 3000000) {
> @@ -1371,6 +1458,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
>  			div_value = ftdi_232am_baud_to_divisor(baud);
>  			div_okay = 0;
>  		}
> +		baud = ftdi_232am_divisor_to_baud(div_value);
>  		break;
>  	case FT232BM: /* FT232BM chip */
>  	case FT2232C: /* FT2232C chip */
> @@ -1397,25 +1485,30 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
>  			div_value = ftdi_232bm_baud_to_divisor(baud);
>  			div_okay = 0;
>  		}
> +		baud = ftdi_232bm_divisor_to_baud(div_value);
>  		break;
>  	case FT2232H: /* FT2232H chip */
>  	case FT4232H: /* FT4232H chip */
>  	case FT232H:  /* FT232H chip */
>  		if ((baud <= 12000000) && (baud >= 1200)) {
>  			div_value = ftdi_2232h_baud_to_divisor(baud);
> +			baud = ftdi_2232h_divisor_to_baud(div_value);
>  		} else if (baud >= 183 && baud < 1200) {
>  			div_value = ftdi_232bm_baud_to_divisor(baud);
> +			baud = ftdi_232bm_divisor_to_baud(div_value);
>  		} else {
>  			dev_dbg(dev, "%s - Baud rate too high!\n", __func__);
>  			if (old_baud >= 183 && old_baud < 1200) {
>  				baud = old_baud;
>  				div_value = ftdi_232bm_baud_to_divisor(baud);
> +				baud = ftdi_232bm_divisor_to_baud(div_value);
>  			} else {
>  				if (old_baud >= 1200 && old_baud <= 12000000)
>  					baud = old_baud;
>  				else
>  					baud = 9600;
>  				div_value = ftdi_2232h_baud_to_divisor(baud);
> +				baud = ftdi_2232h_divisor_to_baud(div_value);

But this must be cleaned up as mentioned earlier in this thread.

>  			}
>  			div_okay = 0;
>  		}

Johan
