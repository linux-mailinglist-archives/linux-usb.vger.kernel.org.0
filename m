Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17AC776B90F
	for <lists+linux-usb@lfdr.de>; Tue,  1 Aug 2023 17:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234524AbjHAPuo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Aug 2023 11:50:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbjHAPun (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Aug 2023 11:50:43 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 1FC71171C
        for <linux-usb@vger.kernel.org>; Tue,  1 Aug 2023 08:50:40 -0700 (PDT)
Received: (qmail 170381 invoked by uid 1000); 1 Aug 2023 11:50:39 -0400
Date:   Tue, 1 Aug 2023 11:50:39 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Badhri Jagan Sridharan <badhri@google.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Avichal Rakesh <arakesh@google.com>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: Gadget: core: Help prevent panic during UVC
 unconfigure
Message-ID: <7ab22884-9708-4ede-855f-14034ab65710@rowland.harvard.edu>
References: <48b2f1f1-0639-46bf-bbfc-98cb05a24914@rowland.harvard.edu>
 <CAPTae5K4T0yd4ZOQ8zrB6dWgntWH_Q+RKwePuFaFK5fuOg7-PA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPTae5K4T0yd4ZOQ8zrB6dWgntWH_Q+RKwePuFaFK5fuOg7-PA@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 01, 2023 at 06:36:53AM -0700, Badhri Jagan Sridharan wrote:
> Hi Alan,

> > @@ -1639,7 +1644,11 @@ static void gadget_unbind_driver(struct
> >         usb_gadget_disable_async_callbacks(udc);
> >         if (gadget->irq)
> >                 synchronize_irq(gadget->irq);
> > +       mutex_unlock(&udc->connect_lock);
> > +
> 
> In my humble opinion, this should be OK.
> I was wondering what would happen if soft_connect_store() is invoked
> right after the udc->connect_lock is dropped. One of your previous
> patches(1016fc0c096c USB: gadget: Fix obscure lockdep violation for
> udc_mutex) already prevents this race by making soft_connect_store()
> acquire device_lock(&udc->gadget->dev); and hence avoids the race.

I wouldn't go so far as to say that all the problems have been fixed.  
There's nothing to prevent the user from writing to the soft_connect 
attribute immediately after gadget_unbind_driver() finishes.

Doing so would cause usb_gadget_udc_start_locked() and 
usb_gadget_connect_locked() to run.  The first would tell the UDC 
driver to turn the controller on, and the second would do essentially 
nothing (because the allow_connect flag is clear).

But this would still leave the controller on when it should be off.  
Maybe we can chalk this outcome up to user error.

Alan Stern
