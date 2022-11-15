Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DDDC6295B2
	for <lists+linux-usb@lfdr.de>; Tue, 15 Nov 2022 11:23:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236128AbiKOKXW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Nov 2022 05:23:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232917AbiKOKXU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Nov 2022 05:23:20 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DE9B1F62A
        for <linux-usb@vger.kernel.org>; Tue, 15 Nov 2022 02:23:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 26B20B81889
        for <linux-usb@vger.kernel.org>; Tue, 15 Nov 2022 10:23:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4528C433C1;
        Tue, 15 Nov 2022 10:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668507796;
        bh=ujNdQw8NWmtkyygs6WvIm0wY/ubY+Nrs9zVyOD500QI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bZWI+FLEf1GsxLvBivZC/DNtxkOuDl72lmsSDj+eubSHv/A8ac5QMmyeMgQWtpBSc
         lI2Ajj7WFrBahV7qTitEe2rB0mAtFG2VR5xMaFvubbB22cLGcmWjcN2R2QG2NR6XMn
         uV+0QJLPD9Vx4X5JRSHiGKB2/sDJHo+K/7MATYrX8d1POSRKNxWA44Fr3ATbMHgMUY
         sfkiHyheJtKmNvxwY5LFy4ui5WsfA9eLUDR5ClJWFsRTJ7U64a7OtSTcSIXwVLsVJW
         eqD+F8/Y7WVLGcj7EPeiZ/RJ1TzQiKUTqXLDVGYuuwPMwYZ9fYPH/gH7PIWV3ODILA
         6ihi7Km5mYIhw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1out5a-00064L-Ok; Tue, 15 Nov 2022 11:22:46 +0100
Date:   Tue, 15 Nov 2022 11:22:46 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Davide Tronchin <davide.tronchin.94@gmail.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        larsm17@gmail.com, marco.demarco@posteo.net,
        cesare.marzano@gmail.com
Subject: Re: [PATCH v4 3/3] USB: serial: option: add u-blox LARA-L6 modem
Message-ID: <Y3NodufBpWHAl1qG@hovoldconsulting.com>
References: <Y1qRkuOghwRCGZIT@hovoldconsulting.com>
 <20221108163001.18454-1-davide.tronchin.94@gmail.com>
 <20221108163001.18454-3-davide.tronchin.94@gmail.com>
 <Y3NnaMkDraj5fwvu@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3NnaMkDraj5fwvu@hovoldconsulting.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 15, 2022 at 11:18:17AM +0100, Johan Hovold wrote:
> On Tue, Nov 08, 2022 at 05:30:01PM +0100, Davide Tronchin wrote:
> > Add LARA-L6 PIDs for three different USB compositions.
> > 
> > LARA-L6 module can be configured (by AT interface) in three different
> > USB modes:
> > * Default mode (Vendor ID: 0x1546 Product ID: 0x1341) with 4 serial
> > interfaces
> > * RmNet mode (Vendor ID: 0x1546 Product ID: 0x1342) with 4 serial
> > interfaces and 1 RmNet virtual network interface
> > * CDC-ECM mode (Vendor ID: 0x1546 Product ID: 0x1343) with 4 serial
> > interface and 1 CDC-ECM virtual network interface
> > 
> > In default mode LARA-L6 exposes the following interfaces:
> > If 0: Diagnostic
> > If 1: AT parser
> > If 2: AT parser
> > If 3: AT parser/alternative functions
 
> > @@ -1125,6 +1130,13 @@ static const struct usb_device_id option_ids[] = {
> >  	  .driver_info = RSVD(1) | RSVD(3) },
> >  	{ USB_DEVICE(QUALCOMM_VENDOR_ID, 0x908b), /* u-blox LARA-R6 00B */
> >  	  .driver_info = RSVD(4) },
> > +	/* u-blox products using u-blox vendor ID */
> > +	{ USB_DEVICE(UBLOX_VENDOR_ID, UBLOX_PRODUCT_LARA_L6),
> > +	  .driver_info = RSVD(4) },
> 
> Why are you reserving interface 4 here? This should be removed or
> explained in the commit message.

Apparently Lars already pointed this out, but again you ignored review
feedback without any comment and sent a v5.

Mistakes happen, but this is starting to look like more than that.

> > +	{ USB_DEVICE(UBLOX_VENDOR_ID, UBLOX_PRODUCT_LARA_L6_RMNET),
> > +	  .driver_info = RSVD(4) },
> > +	{ USB_DEVICE(UBLOX_VENDOR_ID, UBLOX_PRODUCT_LARA_L6_ECM),
> > +	  .driver_info = RSVD(4) },
> >  	/* Quectel products using Quectel vendor ID */
> >  	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC21, 0xff, 0xff, 0xff),
> >  	  .driver_info = NUMEP2 },
 
Johan
