Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B062F574170
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jul 2022 04:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbiGNC2i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jul 2022 22:28:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbiGNC2h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jul 2022 22:28:37 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id E474DBE4
        for <linux-usb@vger.kernel.org>; Wed, 13 Jul 2022 19:28:34 -0700 (PDT)
Received: (qmail 179544 invoked by uid 1000); 13 Jul 2022 22:28:32 -0400
Date:   Wed, 13 Jul 2022 22:28:32 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Alexey Klimov <klimov.linux@gmail.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [questions] about usb_set_intfdata(intf, NULL) and if race is
 possible between ->disconnect() and ->suspend()
Message-ID: <Ys9/ULdm8cVqL1uX@rowland.harvard.edu>
References: <65e251bdf20b7cc2f48a1be4bfd69456709d01c2.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65e251bdf20b7cc2f48a1be4bfd69456709d01c2.camel@gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 14, 2022 at 02:40:03AM +0100, Alexey Klimov wrote:
> For instance, let's say we have simple usb driver with:
> 
> static struct usb_driver usb_some_driver = {
> 	.name		= DRIVER_NAME,
> 	.probe		= yet_another_probe,
> 	.disconnect	= yet_another_disconnect,
> 	.suspend	= yet_another_suspend,
> 	.resume		= yet_another_resume,
> 	.reset_resume	= yet_another_resume,
> 	.id_table	= yet_another_device_table,
> };
> 
> 1. Can ->suspend and ->disconnect methods race?

In short, no.  usb_unbind_interface() does usb_autoresume_device(), so 
it is guaranteed that the device will not go into autosuspend while the 
driver's disconnect method is running.

> Documentation/driver-api/usb/power-management.rst says:
> This implies that external suspend/resume events are mutually exclusive
> with calls to ``probe``, ``disconnect``, ``pre_reset``, and
> ``post_reset``;
> 
> 
> Comment for usb_suspend_both() says that:
>  * ...	Usbcore will insure that
>  * method calls do not arrive during bind, unbind, or reset operations.
> and that:
>  * However drivers must be prepared to handle suspend calls arriving at
>  * unpredictable times.
> 
> Also I was asked couple of years back what I am going to do if
> disconnect() and suspend() will race, so seems never hurts to double-
> check.
> 
> 2. Do I need to usb_set_intfdata(intf, NULL) in disconnect method and
> in probe() function if registration with another subsystem fails?

No.  usb_unbind_interface() does this call for you, and 
usb_probe_interface() does it if the probe method fails.

Alan Stern

> Like:
> static int usb_streamlabs_wdt_probe(struct usb_interface *intf,
>                                         const struct usb_device_id *id)
> {
> 	...
> 	usb_set_intfdata(intf, &data);
> 	...
> 	retval = devm_subsystem_register_device(&intf->dev, ...);
> 	if (retval) {
> 		dev_err(&intf->dev, "error message\n");
> 		usb_set_intfdata(intf, NULL)
> 		return retval;
> 	}
> }
> 
> I saw some patches that clear stale dev->driver_data pointer in
> disconnect but doesn't seem that all usb drivers do that hence the
> question.
> 
> Thanks,
> Alexey
> 
> 
