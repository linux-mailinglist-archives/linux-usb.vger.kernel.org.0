Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6A9642AFD
	for <lists+linux-usb@lfdr.de>; Mon,  5 Dec 2022 16:07:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231574AbiLEPHM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Dec 2022 10:07:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231535AbiLEPHK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Dec 2022 10:07:10 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A59218B15
        for <linux-usb@vger.kernel.org>; Mon,  5 Dec 2022 07:07:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F15BDB810DC
        for <linux-usb@vger.kernel.org>; Mon,  5 Dec 2022 15:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BF93C433D6;
        Mon,  5 Dec 2022 15:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1670252826;
        bh=Jw/yRbzn/AHQFAyCfoYd6bASIThsmlwRaDLgQ1BJUf0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=v8JBzTy58wppuRGqaNGoSW7Erey3dnA7zwJAr3gFj+evh9HzGc6bIwfmgXRPB9ohl
         vWZ8BbpQX3guZHy3bFbZPZl0m9KShibBuZF4ePn7cf1l5b1tmCtq0ny4/OcxoZhqrk
         RasljwlZQ9ZcQqBUsFBvqNfNybj1gwaV20nRxYs4=
Date:   Mon, 5 Dec 2022 16:07:04 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [RFC] Unify messaging in gadget functions
Message-ID: <Y44JGJb+LA66lPbP@kroah.com>
References: <266f2df3-75cf-5dcf-1e59-8a8da5dd001e@collabora.com>
 <Y43iISitEERfteOt@kroah.com>
 <5a44f991-fd77-09bf-658b-398d5545297a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a44f991-fd77-09bf-658b-398d5545297a@collabora.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 05, 2022 at 03:13:46PM +0100, Andrzej Pietrasiewicz wrote:
> Hi Greg,
> 
> W dniu 5.12.2022 o 13:20, Greg KH pisze:
> > On Mon, Dec 05, 2022 at 01:14:21PM +0100, Andrzej Pietrasiewicz wrote:
> > > Hi All,
> > > 
> > > include/linux/usb/composite.h contains:
> > > 
> > > /* messaging utils */
> > > #define DBG(d, fmt, args...) \
> > > 	dev_dbg(&(d)->gadget->dev , fmt , ## args)
> > > #define VDBG(d, fmt, args...) \
> > > 	dev_vdbg(&(d)->gadget->dev , fmt , ## args)
> > > #define ERROR(d, fmt, args...) \
> > > 	dev_err(&(d)->gadget->dev , fmt , ## args)
> > > #define WARNING(d, fmt, args...) \
> > > 	dev_warn(&(d)->gadget->dev , fmt , ## args)
> > > #define INFO(d, fmt, args...) \
> > > 	dev_info(&(d)->gadget->dev , fmt , ## args)
> > > 
> > > Gadget functions do use these, but not consistently:
> 
> <snip>
> 
> > > Questions:
> > > 
> > > 1) Should we make them use the messaging utils consitently?
> > 
> > Yes, converting to use the dev_*() calls is good to do.
> 
> Heh, I sent this RFC to prevent learning the hard way (by actually creating
> incorrect patches), that we want to be consistent, but using dev_*() calls
> rather than composite.h utils. That's ok.
> 
> Which brings an interesting question: should the ultimate goal be to remove the
> messaging utils altogether from composite.h? It _seems_ their purpose is mainly
> to wrap dereferencing a pointer two pointers away: &(d)->gadget->dev to make
> invocations shorter. With the default of 100 columns in checkpatch nowadays it
> is maybe a less important goal? Or maybe we should prevent such long
> dereferencing by introducing helper variables just like below in
> u_audio_start_capture()?

Yes, that should be the ultimate goal.  We did that in the USB drivers a
decade or so ago, but no one spent the time to do the same for the USB
gadget code.

thanks,

greg k-h
