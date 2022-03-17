Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44D254DCAC5
	for <lists+linux-usb@lfdr.de>; Thu, 17 Mar 2022 17:08:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235297AbiCQQJJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Mar 2022 12:09:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231356AbiCQQJJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Mar 2022 12:09:09 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 40D00CE9
        for <linux-usb@vger.kernel.org>; Thu, 17 Mar 2022 09:07:52 -0700 (PDT)
Received: (qmail 8219 invoked by uid 1000); 17 Mar 2022 12:07:51 -0400
Date:   Thu, 17 Mar 2022 12:07:51 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: refcount underflow on stm32mp1
Message-ID: <YjNc1yCrbMenBkOP@rowland.harvard.edu>
References: <20220316164724.uic3azim4mhp6jvl@pengutronix.de>
 <YjIZuY2qXGD/Toqf@kroah.com>
 <20220316214437.iawmafmard7sed5w@pengutronix.de>
 <20220317104949.ln75wh2a22vekwj2@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220317104949.ln75wh2a22vekwj2@pengutronix.de>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 17, 2022 at 11:49:49AM +0100, Uwe Kleine-König wrote:
> On Wed, Mar 16, 2022 at 10:44:37PM +0100, Uwe Kleine-König wrote:
> > The problem is that after usb_add_gadget_udc() failed in
> > dwc2_driver_probe(), dwc2_hsotg_remove() -> usb_del_gadget_udc() ->
> > usb_put_gadget() -> put_device() results in that underflow.
> > 
> > With that information I'd expect that someone understanding how
> > reference counting works with usb gadgets should be able to come up with
> > a fix.
> 
> The problem is that usb_add_gadget_udc() failing already calls
> usb_put_gadget() and so dwc2_hsotg_remove() must not call it again when
> called from dwc2_driver_probe.
> 
> I don't understand that udc stuff enough to be confident that a patch I
> create for that will do the right thing.

You should CC: the maintainer of the dwc2 driver.  That's the best 
person to know how to fix dwc2_hsotg_remove().

Alan Stern
