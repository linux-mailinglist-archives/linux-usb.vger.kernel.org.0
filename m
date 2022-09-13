Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F5B25B7813
	for <lists+linux-usb@lfdr.de>; Tue, 13 Sep 2022 19:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232957AbiIMRgD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Sep 2022 13:36:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232939AbiIMRfl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Sep 2022 13:35:41 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6A7778BFE
        for <linux-usb@vger.kernel.org>; Tue, 13 Sep 2022 09:25:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 652A8B80EF6
        for <linux-usb@vger.kernel.org>; Tue, 13 Sep 2022 14:49:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08B6FC433D6;
        Tue, 13 Sep 2022 14:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663080543;
        bh=RsML42YILI2efVyT2FQCIt3Tw3Z0Zhqn/iCQSNdfriA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rK17FfmVXURFLY8/h59goEjJ9WEIeoG0QZwCw4FlO3lDEf/LTHg8mmW9+jQyhWcuK
         JXerqnemRPJO+nrz9xjCj0XFRKDRsth9WZmofuoZREshZ5xNgAc7fZohbAoe6WXYxh
         TYIMUFREoVd7Z54NiiOUF8pHKsumescmt4jHdkwqNytGLUq9OXTitoHJsx2+anAb7b
         wCtWCXNbJlbMUUkvDwOZoCF1fewjnvg3DmYZ3NZgFW4OfBCyJ+GpIdF2tdYepgDItj
         0tRost/XRlCvs6oFFpUWWcr0n56Oh3RqUPnSsgCx8GKW9ybJm+1XD+kNKDQlrkoQSO
         JtQjm900D9loA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oY7Dh-0005Lu-Rk; Tue, 13 Sep 2022 16:49:02 +0200
Date:   Tue, 13 Sep 2022 16:49:01 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc:     Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 3/7] USB: serial: ftdi_sio: Extract SIO divisor code
 to function
Message-ID: <YyCYXar28dIkEnf2@hovoldconsulting.com>
References: <20220712115306.26471-1-kabel@kernel.org>
 <20220712115306.26471-4-kabel@kernel.org>
 <Yt01zjWx7VTWnQo9@hovoldconsulting.com>
 <20220818141140.m2yitpbeaddw3xjt@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220818141140.m2yitpbeaddw3xjt@pali>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 18, 2022 at 04:11:40PM +0200, Pali Rohár wrote:
> On Sunday 24 July 2022 14:06:38 Johan Hovold wrote:
> > On Tue, Jul 12, 2022 at 01:53:02PM +0200, Marek Behún wrote:
> > > From: Pali Rohár <pali@kernel.org>
> > > 
> > > In preparation for following changes, extract divisor code for SIO chip
> > > into new function ftdi_sio_baud_to_divisor(), as is done for other
> > > chips.
> > > 
> > > No functional change.
> > > 
> > > Signed-off-by: Pali Rohár <pali@kernel.org>
> > > Tested-by: Marek Behún <kabel@kernel.org>
> > > Signed-off-by: Marek Behún <kabel@kernel.org>
> > > ---
> > >  drivers/usb/serial/ftdi_sio.c | 36 ++++++++++++++++++++---------------
> > >  1 file changed, 21 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
> > > index 717b97f4e094..5b109714612f 100644
> > > --- a/drivers/usb/serial/ftdi_sio.c
> > > +++ b/drivers/usb/serial/ftdi_sio.c
> > > @@ -1150,6 +1150,23 @@ static struct usb_serial_driver * const serial_drivers[] = {
> > >   * ***************************************************************************
> > >   */
> > >  
> > > +static int ftdi_sio_baud_to_divisor(int baud)
> > > +{
> > > +	switch (baud) {
> > > +	case 300: return ftdi_sio_b300;
> > > +	case 600: return ftdi_sio_b600;
> > > +	case 1200: return ftdi_sio_b1200;
> > > +	case 2400: return ftdi_sio_b2400;
> > > +	case 4800: return ftdi_sio_b4800;
> > > +	case 9600: return ftdi_sio_b9600;
> > > +	case 19200: return ftdi_sio_b19200;
> > > +	case 38400: return ftdi_sio_b38400;
> > > +	case 57600: return ftdi_sio_b57600;
> > > +	case 115200: return ftdi_sio_b115200;
> > > +	default: return -1;
> > 
> > Please add a line break after the colons.
> > 
> > Adding another enum for the invalid value might be preferable.
> 
> Enum describe HW values, so it cannot be added to hw list.

Of course you can, but perhaps you'll figure out some other way to do
this.

> > > +	}
> > > +}
> > > +
> > >  static unsigned short int ftdi_232am_baud_base_to_divisor(int baud, int base)
> > >  {
> > >  	unsigned short int divisor;
> > > @@ -1286,7 +1303,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
> > >  {
> > >  	struct ftdi_private *priv = usb_get_serial_port_data(port);
> > >  	struct device *dev = &port->dev;
> > > -	u32 div_value = 0;
> > > +	int div_value = 0;
> > 
> > And don't change the type here.
> 
> This type change was explicitly asked during v1 review. v1 had u32.

Ok, but don't. This variable is used in other parts of this function.

> > >  	int div_okay = 1;
> > >  	int baud;
> > >  
> > > @@ -1309,23 +1326,12 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
> > >  		baud = 9600;
> > >  	switch (priv->chip_type) {
> > >  	case SIO: /* SIO chip */
> > > -		switch (baud) {
> > > -		case 300: div_value = ftdi_sio_b300; break;
> > > -		case 600: div_value = ftdi_sio_b600; break;
> > > -		case 1200: div_value = ftdi_sio_b1200; break;
> > > -		case 2400: div_value = ftdi_sio_b2400; break;
> > > -		case 4800: div_value = ftdi_sio_b4800; break;
> > > -		case 9600: div_value = ftdi_sio_b9600; break;
> > > -		case 19200: div_value = ftdi_sio_b19200; break;
> > > -		case 38400: div_value = ftdi_sio_b38400; break;
> > > -		case 57600: div_value = ftdi_sio_b57600;  break;
> > > -		case 115200: div_value = ftdi_sio_b115200; break;
> > > -		} /* baud */
> > > -		if (div_value == 0) {

Looks like there's another bug here in the current driver as b300 is
defined as 0.

I'll fix that up separately first.

> > > +		div_value = ftdi_sio_baud_to_divisor(baud);
> > > +		if (div_value == -1) {
> > >  			dev_dbg(dev, "%s - Baudrate (%d) requested is not supported\n",
> > >  				__func__,  baud);
> > > -			div_value = ftdi_sio_b9600;
> > >  			baud = 9600;
> > > +			div_value = ftdi_sio_baud_to_divisor(baud);
> > >  			div_okay = 0;
> > >  		}
> > >  		break;

Johan
