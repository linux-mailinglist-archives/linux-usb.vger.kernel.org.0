Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B282598583
	for <lists+linux-usb@lfdr.de>; Thu, 18 Aug 2022 16:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245222AbiHRONC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Aug 2022 10:13:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245133AbiHRONA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Aug 2022 10:13:00 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8435A00F4
        for <linux-usb@vger.kernel.org>; Thu, 18 Aug 2022 07:12:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 71583B821B9
        for <linux-usb@vger.kernel.org>; Thu, 18 Aug 2022 14:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3193C433C1;
        Thu, 18 Aug 2022 14:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660831977;
        bh=yiqtwxp00fCskI5+jT9WFFTvdFl0ivoWHkk5gMFhEsA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=re+Py7qdFUhfuoculIdopIV5auiPHjcObe6uWhczrk4Zsqv/WoqUG0qc4Os2I8fbW
         yoXpsh6AcutNyIwSNlIVpMzpJsSZeXIzMxwpmBTenS4L68pb9WDV3J0pNMkr5+sY77
         5dJCcMNFikNvP9dJtj1hsMawSytn4pSclL/WLNqYWajXLvUqqFuqGa5zp0ho+92DEB
         qlTAoD6r5i1Ch2dE3NjPSGhNtM6wWrBJ7p947B5neC2xwMfRGTEcAKxn2cZhXfMG56
         Unnffp4QHfijyAjDZScevdd1xurSEYtGmNx0nrDeHfcVJqvEAUhpW7byalszFAIJkr
         o2rObZvmG6tFA==
Received: by pali.im (Postfix)
        id 1F185622; Thu, 18 Aug 2022 16:12:54 +0200 (CEST)
Date:   Thu, 18 Aug 2022 16:12:54 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 4/7] USB: serial: ftdi_sio: Do not reset baud rate to
 9600 Baud on error
Message-ID: <20220818141254.4taurd2x6s273hda@pali>
References: <20220712115306.26471-1-kabel@kernel.org>
 <20220712115306.26471-5-kabel@kernel.org>
 <Yt05KkAwrkB0EnbN@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yt05KkAwrkB0EnbN@hovoldconsulting.com>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sunday 24 July 2022 14:20:58 Johan Hovold wrote:
> On Tue, Jul 12, 2022 at 01:53:03PM +0200, Marek Behún wrote:
> > From: Pali Rohár <pali@kernel.org>
> > 
> > If setting new baud rate fails, all other drivers leave the device at
> > previous baud rate, only ftdi_sio resets to 9600 Baud.
> 
> > Change this behavior to that of other drivers so that /dev/ttyUSB*
> > devices behave in the same way.
> 
> These statements are not true. Several USB serial driver set 9600 baud
> on errors for historical reasons. Yet others clamp. It's inconsistent at
> best.
> 
> > Signed-off-by: Pali Rohár <pali@kernel.org>
> > Tested-by: Marek Behún <kabel@kernel.org>
> > Signed-off-by: Marek Behún <kabel@kernel.org>
> > ---
> > Greg pointed out that this make break some people's workflow, that they
> > may depend on this behavior.
> > 
> > This is of course possible, although IMO improbable: it would be weird
> > to depend on the fall back to 9600 Baud on error, instead of expecting
> > that the baud rate didn't change at all (like in other /dev/ttyUSB*
> > drivers).
> > 
> > Nonetheless if someone complains that they workflow got broken, we will
> > need to revert this.
> 
> >  static u32 get_ftdi_divisor(struct tty_struct *tty,
> > -						struct usb_serial_port *port)
> > +			    struct usb_serial_port *port, speed_t old_baud)
> >  {
> >  	struct ftdi_private *priv = usb_get_serial_port_data(port);
> >  	struct device *dev = &port->dev;
> > @@ -1322,6 +1322,8 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
> >  			__func__, priv->custom_divisor, baud);
> >  	}
> >  
> > +	if (!baud)
> > +		baud = old_baud;
> >  	if (!baud)
> >  		baud = 9600;
> 
> This looks like it breaks B0 handling. Either way, an unrelated change.

Unreleased to this change.

> >  	switch (priv->chip_type) {
> > @@ -1330,8 +1332,12 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
> >  		if (div_value == -1) {
> >  			dev_dbg(dev, "%s - Baudrate (%d) requested is not supported\n",
> >  				__func__,  baud);
> > -			baud = 9600;
> > +			baud = old_baud ? old_baud : 9600;
> >  			div_value = ftdi_sio_baud_to_divisor(baud);
> > +			if (div_value == -1) {
> > +				baud = 9600;
> > +				div_value = ftdi_sio_baud_to_divisor(baud);
> > +			}
> >  			div_okay = 0;
> >  		}
> >  		break;
> > @@ -1340,8 +1346,8 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
> >  			div_value = ftdi_232am_baud_to_divisor(baud);
> >  		} else {
> >  			dev_dbg(dev, "%s - Baud rate too high!\n", __func__);
> > -			baud = 9600;
> > -			div_value = ftdi_232am_baud_to_divisor(9600);
> > +			baud = (old_baud >= 183 && old_baud <= 3000000) ? old_baud : 9600;
> 
> And please avoid using the ternary operator which tend to just hurt
> readability.
> 
> Looks like this needs to be refactored in some way.
> 
> > @@ -1525,7 +1536,7 @@ static int set_serial_info(struct tty_struct *tty, struct serial_struct *ss)
> >  		if (priv->flags & ASYNC_SPD_MASK)
> >  			dev_warn_ratelimited(&port->dev, "use of SPD flags is deprecated\n");
> >  
> > -		change_speed(tty, port);
> > +		change_speed(tty, port, 0);
> 
> Zero has a special meaning (B0).
> 
> >  	}
> >  	mutex_unlock(&priv->cfg_lock);
> >  	return 0;
> > @@ -2774,9 +2785,12 @@ static void ftdi_set_termios(struct tty_struct *tty,
> >  		/* Drop RTS and DTR */
> >  		clear_mctrl(port, TIOCM_DTR | TIOCM_RTS);
> >  	} else {
> > +		speed_t old_baud =
> > +			old_termios ? tty_termios_baud_rate(old_termios) : 0;
> 
> Just use 9600 if you don't have an old termios. The termios rate should
> be valid in that case.

Ok
