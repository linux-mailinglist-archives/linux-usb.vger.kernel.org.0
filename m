Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C39550FFC9
	for <lists+linux-usb@lfdr.de>; Tue, 26 Apr 2022 15:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351301AbiDZOAC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Apr 2022 10:00:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237966AbiDZOAA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Apr 2022 10:00:00 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 976D915F58A;
        Tue, 26 Apr 2022 06:56:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 52BD0B82003;
        Tue, 26 Apr 2022 13:56:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FAE2C385A0;
        Tue, 26 Apr 2022 13:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1650981410;
        bh=OiA3oPNCyrXhwyKWUy4NKn6s3hcdFgolymwJeKuT66g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UdzYaDsoqA/hPxD6YNWWM2DhlXM2zHm0RqD57O4ajI4FL28LwkbIB6VjGM+oCHZrE
         Hg/Ln6XNd9GfWcTCPTtOAsoGgCsVMSDwXKi7fgPaKdPNXdhZO9Yq21B2elk454EmOu
         SxThm8OkJxV8h6gfR6rHQK4S1f94pObOugI997bY=
Date:   Tue, 26 Apr 2022 15:56:45 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Daniels Umanovskis <du@axentia.se>
Cc:     richard.leitner@skidata.com, linux-usb@vger.kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: usb251xb: make power-up reset delay
 configurable in device tree
Message-ID: <Ymf6HT3xmnSmATjp@kroah.com>
References: <20220426123329.775-1-du@axentia.se>
 <20220426123329.775-3-du@axentia.se>
 <YmfpmJfWQwjLGCSF@kroah.com>
 <f3db0547-571c-d765-359e-8e84d34bffed@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3db0547-571c-d765-359e-8e84d34bffed@axentia.se>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 26, 2022 at 03:06:34PM +0200, Daniels Umanovskis wrote:
> On 4/26/22 2:46 PM, Greg KH wrote:
> > On Tue, Apr 26, 2022 at 12:34:13PM +0000, Daniels Umanovskis wrote:
> > > According to the datasheet, the hub should be operational 500us after
> > > the reset has been deasserted. Some individual circuits have been
> > > observed not to reset within the specified 500us and require a longer
> > > wait for subsequent configuration to succeed.
> > > 
> > > Signed-off-by: Daniels Umanovskis <du@axentia.se>
> > > ---
> > >   drivers/usb/misc/usb251xb.c | 6 +++++-
> > >   1 file changed, 5 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
> > > index 04c4e3fed094..e287e241ef96 100644
> > > --- a/drivers/usb/misc/usb251xb.c
> > > +++ b/drivers/usb/misc/usb251xb.c
> > > @@ -115,6 +115,7 @@ struct usb251xb {
> > >   	struct regulator *vdd;
> > >   	u8 skip_config;
> > >   	struct gpio_desc *gpio_reset;
> > > +	u32 reset_delay_us;
> > >   	u16 vendor_id;
> > >   	u16 product_id;
> > >   	u16 device_id;
> > > @@ -278,7 +279,7 @@ static void usb251xb_reset(struct usb251xb *hub)
> > >   	gpiod_set_value_cansleep(hub->gpio_reset, 0);
> > >   	/* wait for hub recovery/stabilization */
> > > -	usleep_range(500, 750);	/* >=500us after RESET_N deasserted */
> > > +	fsleep(hub->reset_delay_us);
> > >   	i2c_unlock_bus(hub->i2c->adapter, I2C_LOCK_SEGMENT);
> > >   }
> > > @@ -424,6 +425,9 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
> > >   		return err;
> > >   	}
> > > +	if (of_property_read_u32(np, "reset-delay-us", &hub->reset_delay_us))
> > > +		hub->reset_delay_us = 500;
> > So if this fails the delay is 0?
> of_property_read_u32 can fail with -EINVAL or -ENODATA, then delay is 500,
> unless I'm missing something more obvious.

Ah, no, you are right, sorry, I read this wrong.

greg k-h
