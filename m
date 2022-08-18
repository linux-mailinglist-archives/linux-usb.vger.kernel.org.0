Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA5F359857C
	for <lists+linux-usb@lfdr.de>; Thu, 18 Aug 2022 16:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245435AbiHROLq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Aug 2022 10:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245222AbiHROLp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Aug 2022 10:11:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93B197C507
        for <linux-usb@vger.kernel.org>; Thu, 18 Aug 2022 07:11:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0EBA261736
        for <linux-usb@vger.kernel.org>; Thu, 18 Aug 2022 14:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D357C433C1;
        Thu, 18 Aug 2022 14:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660831903;
        bh=uoUUiskdRzeuA4zbybEe2NQuKk5ORYTATH9OFm93oL4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VwjfHU2Qvc8hksaGKKsd91hC9zw9/Q0RCH8xRlMMvvsYf/bvH2AbIjPFYe6/gu865
         +TjNIP12SFVTSKjZJU/xla+NmH6APCmmqXt1gCSOUPopMRfy8U4s8lyuMlbOlR1/YS
         9ia3Ta7aoFrzLVmVLQgbYDRz7RiyN4seHkZ4w/prnD6h23bfMOROT3WF4ZpnI9P1f1
         BjnlA+gNAyYzq/pcCb3sbaJGfN00HkjNNxjtWijJIYCQoBxB/RCdjYtWOZMB8GWn84
         JyQw3qMu+htNDLuXV485Oq4OzbGqI5F+2ThxlZ3tJlhAW+LgTCi/9X64vvqKzXMqjQ
         3OHxjSMZUVwEQ==
Received: by pali.im (Postfix)
        id 9B192622; Thu, 18 Aug 2022 16:11:40 +0200 (CEST)
Date:   Thu, 18 Aug 2022 16:11:40 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 3/7] USB: serial: ftdi_sio: Extract SIO divisor code
 to function
Message-ID: <20220818141140.m2yitpbeaddw3xjt@pali>
References: <20220712115306.26471-1-kabel@kernel.org>
 <20220712115306.26471-4-kabel@kernel.org>
 <Yt01zjWx7VTWnQo9@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yt01zjWx7VTWnQo9@hovoldconsulting.com>
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

On Sunday 24 July 2022 14:06:38 Johan Hovold wrote:
> On Tue, Jul 12, 2022 at 01:53:02PM +0200, Marek Behún wrote:
> > From: Pali Rohár <pali@kernel.org>
> > 
> > In preparation for following changes, extract divisor code for SIO chip
> > into new function ftdi_sio_baud_to_divisor(), as is done for other
> > chips.
> > 
> > No functional change.
> > 
> > Signed-off-by: Pali Rohár <pali@kernel.org>
> > Tested-by: Marek Behún <kabel@kernel.org>
> > Signed-off-by: Marek Behún <kabel@kernel.org>
> > ---
> >  drivers/usb/serial/ftdi_sio.c | 36 ++++++++++++++++++++---------------
> >  1 file changed, 21 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
> > index 717b97f4e094..5b109714612f 100644
> > --- a/drivers/usb/serial/ftdi_sio.c
> > +++ b/drivers/usb/serial/ftdi_sio.c
> > @@ -1150,6 +1150,23 @@ static struct usb_serial_driver * const serial_drivers[] = {
> >   * ***************************************************************************
> >   */
> >  
> > +static int ftdi_sio_baud_to_divisor(int baud)
> > +{
> > +	switch (baud) {
> > +	case 300: return ftdi_sio_b300;
> > +	case 600: return ftdi_sio_b600;
> > +	case 1200: return ftdi_sio_b1200;
> > +	case 2400: return ftdi_sio_b2400;
> > +	case 4800: return ftdi_sio_b4800;
> > +	case 9600: return ftdi_sio_b9600;
> > +	case 19200: return ftdi_sio_b19200;
> > +	case 38400: return ftdi_sio_b38400;
> > +	case 57600: return ftdi_sio_b57600;
> > +	case 115200: return ftdi_sio_b115200;
> > +	default: return -1;
> 
> Please add a line break after the colons.
> 
> Adding another enum for the invalid value might be preferable.

Enum describe HW values, so it cannot be added to hw list.

> > +	}
> > +}
> > +
> >  static unsigned short int ftdi_232am_baud_base_to_divisor(int baud, int base)
> >  {
> >  	unsigned short int divisor;
> > @@ -1286,7 +1303,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
> >  {
> >  	struct ftdi_private *priv = usb_get_serial_port_data(port);
> >  	struct device *dev = &port->dev;
> > -	u32 div_value = 0;
> > +	int div_value = 0;
> 
> And don't change the type here.

This type change was explicitly asked during v1 review. v1 had u32.

> >  	int div_okay = 1;
> >  	int baud;
> >  
> > @@ -1309,23 +1326,12 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
> >  		baud = 9600;
> >  	switch (priv->chip_type) {
> >  	case SIO: /* SIO chip */
> > -		switch (baud) {
> > -		case 300: div_value = ftdi_sio_b300; break;
> > -		case 600: div_value = ftdi_sio_b600; break;
> > -		case 1200: div_value = ftdi_sio_b1200; break;
> > -		case 2400: div_value = ftdi_sio_b2400; break;
> > -		case 4800: div_value = ftdi_sio_b4800; break;
> > -		case 9600: div_value = ftdi_sio_b9600; break;
> > -		case 19200: div_value = ftdi_sio_b19200; break;
> > -		case 38400: div_value = ftdi_sio_b38400; break;
> > -		case 57600: div_value = ftdi_sio_b57600;  break;
> > -		case 115200: div_value = ftdi_sio_b115200; break;
> > -		} /* baud */
> > -		if (div_value == 0) {
> > +		div_value = ftdi_sio_baud_to_divisor(baud);
> > +		if (div_value == -1) {
> >  			dev_dbg(dev, "%s - Baudrate (%d) requested is not supported\n",
> >  				__func__,  baud);
> > -			div_value = ftdi_sio_b9600;
> >  			baud = 9600;
> > +			div_value = ftdi_sio_baud_to_divisor(baud);
> >  			div_okay = 0;
> >  		}
> >  		break;
> 
> Johan
