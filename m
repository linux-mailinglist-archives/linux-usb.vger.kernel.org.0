Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAADB598595
	for <lists+linux-usb@lfdr.de>; Thu, 18 Aug 2022 16:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241592AbiHRORq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Aug 2022 10:17:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240240AbiHRORp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Aug 2022 10:17:45 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62554B99C1
        for <linux-usb@vger.kernel.org>; Thu, 18 Aug 2022 07:17:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1B21BB821B9
        for <linux-usb@vger.kernel.org>; Thu, 18 Aug 2022 14:17:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A828C433D7;
        Thu, 18 Aug 2022 14:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660832261;
        bh=uCUAJCmFVqQ3ZZ8gb3ZG+YMqOEbEv19umt/Yexu/cN8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JdpTh/FJ9hi/YTT3uP7tnCJJkYflH1LSWrUPIVXJmRllLUq1uH+rgDq0/leIZWlzF
         NpR4Ltj7ODLwMQpikI9CCpT282Ix/xf8EkMZb4uNqCXv5SSUWDrxTSYMqlesaQRzaX
         M1F61Pnim/jY9PDmhYkQrp6t+w7ni3bEB+dJTXQTOtX19ZqDAG+sINEd9tr5iE5S6f
         oPny4p5ec8gcOBePGiaK5xMEPjqp/uUz54cZiWeghM+lgJHsDznEhWOaT7rmSSBQXV
         fszKM7PkD7OjEhV5TRqSLCGTA7ZBzAe0B12cYC19W0a/3T9JlPz+D9tZtuOKNykLW1
         7IpvmlAiLFp/A==
Received: by pali.im (Postfix)
        id BA21F622; Thu, 18 Aug 2022 16:17:38 +0200 (CEST)
Date:   Thu, 18 Aug 2022 16:17:38 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 7/7] USB: serial: ftdi_sio: Fill c_*speed fields with
 real baud rate
Message-ID: <20220818141738.axssxkaizys4rphl@pali>
References: <20220712115306.26471-1-kabel@kernel.org>
 <20220712115306.26471-8-kabel@kernel.org>
 <Yt097+xTMPrMpfvX@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yt097+xTMPrMpfvX@hovoldconsulting.com>
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

On Sunday 24 July 2022 14:41:19 Johan Hovold wrote:
> On Tue, Jul 12, 2022 at 01:53:06PM +0200, Marek Behún wrote:
> > From: Pali Rohár <pali@kernel.org>
> > 
> > Calculate baud rate value in c_*speed fields to the real values which were
> > set on hardware. For this operation, add a new set of methods
> > *_divisor_to_baud() for each chip and use them for calculating the real
> > baud rate values.
> > 
> > Each *_divisor_to_baud() method is constructed as an inverse function of
> > its corresponding *_baud_to_divisor() method.
> > 
> > Signed-off-by: Pali Rohár <pali@kernel.org>
> > Tested-by: Marek Behún <kabel@kernel.org>
> > Signed-off-by: Marek Behún <kabel@kernel.org>
> > ---
> >  drivers/usb/serial/ftdi_sio.c | 83 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 83 insertions(+)
> > 
> > diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
> > index 39e8c5d06157..838acce53e69 100644
> > --- a/drivers/usb/serial/ftdi_sio.c
> > +++ b/drivers/usb/serial/ftdi_sio.c
> > @@ -1167,6 +1167,23 @@ static int ftdi_sio_baud_to_divisor(int baud)
> >  	}
> >  }
> >  
> > +static int ftdi_sdio_divisor_to_baud(u32 divisor)
> > +{
> > +	switch (divisor) {
> > +	case ftdi_sio_b300: return 300;
> > +	case ftdi_sio_b600: return 600;
> > +	case ftdi_sio_b1200: return 1200;
> > +	case ftdi_sio_b2400: return 2400;
> > +	case ftdi_sio_b4800: return 4800;
> > +	case ftdi_sio_b9600: return 9600;
> > +	case ftdi_sio_b19200: return 19200;
> > +	case ftdi_sio_b38400: return 38400;
> > +	case ftdi_sio_b57600: return 57600;
> > +	case ftdi_sio_b115200: return 115200;
> > +	default: return 9600;
> > +	}
> > +}
> 
> This one should not be needed as sio only supports this discrete set of
> values in the first place.
> 
> >  static unsigned short int ftdi_232am_baud_base_to_divisor(int baud, int base)
> >  {
> >  	unsigned short int divisor;
> > @@ -1189,15 +1206,33 @@ static unsigned short int ftdi_232am_baud_base_to_divisor(int baud, int base)
> >  	return divisor;
> >  }
> >  
> > +static int ftdi_232am_divisor_base_to_baud(unsigned short int divisor, int base)
> 
> I believe "base" was used as a function name suffix in the inverse
> function (due to the additional base argument).

Yes, in the same way as it used in name of ftdi_232am_baud_base_to_divisor.

> > +{
> > +	static const unsigned char divfrac_inv[4] = { 0, 4, 2, 1 };
> > +	unsigned int divisor3;
> > +
> > +	if (divisor == 0)
> > +		divisor = 1;
> > +	divisor3 = (GENMASK(13, 0) & divisor) << 3;
> > +	divisor3 |= divfrac_inv[(divisor >> 14) & 0x3];
> > +	return DIV_ROUND_CLOSEST(base, 2 * divisor3);
> > +}
> 
> I don't have the motivation to try to review these inverses right now.
> 
> Let's get the rest of the series in order first.
> 
> Johan
