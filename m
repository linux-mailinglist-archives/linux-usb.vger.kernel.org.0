Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89A7953BE88
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jun 2022 21:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238504AbiFBTQe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jun 2022 15:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238489AbiFBTQa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jun 2022 15:16:30 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id C2AA32C679
        for <linux-usb@vger.kernel.org>; Thu,  2 Jun 2022 12:16:27 -0700 (PDT)
Received: (qmail 279939 invoked by uid 1000); 2 Jun 2022 15:16:27 -0400
Date:   Thu, 2 Jun 2022 15:16:27 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v2] usb: hub: port: add sysfs entry to switch port power
Message-ID: <YpkMi9Se0Unxq1SS@rowland.harvard.edu>
References: <20220602012731.2942309-1-m.grzeschik@pengutronix.de>
 <YpjLusnGk8ZBlGGd@rowland.harvard.edu>
 <20220602145918.GB26638@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220602145918.GB26638@pengutronix.de>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 02, 2022 at 04:59:18PM +0200, Michael Grzeschik wrote:
> On Thu, Jun 02, 2022 at 10:39:54AM -0400, Alan Stern wrote:
> > You might want to disable the new sysfs file (don't create it or have it
> > return -EOPNOTSUPP) if the hub doesn't support per-port power switching.
> 
> Is it possible to read out if this feature is not working by the hub?

Actually, I don't think so.  You can get some information about ganged 
power switching, and there's the hub_is_port_power_switchable() test, but 
that's all.  The situation is discussed in section 11.11 (Hub Port Power 
Control) of the USB-2.0 spec.

> The most hubs, that I was working with, did not really toggle the vbus,
> because the physical logic to switch a regulator was completely missing
> in the hardware. But with removing the other PORT_FEATURES the hub
> behaved like the port is just not powered any more.

Yes, that's how most hubs work.  There are a few, however, which really do 
switch port Vbus power on and off.

> Because of that; I am currently curious if we just should rename that
> property to something more generic like "enable" or "disable". So that
> as the real vbus power switching is missing, the hubs port switching
> does still function like intended.

That makes sense.  But the question arises, does this patch really do what 
you want?

The patch description talks about the need to disable devices or 
re-enumerate them.  You can disable a device right now by writing -1 to 
the bConfigurationValue sysfs file, and you can force a device to be 
re-enumerated by resetting it (using the USBDEVFS_RESET usbfs ioctl).

About the only thing you can't currently do is actually turn off power to 
the port.  This patch will allow users to do that, but only if the hub 
supports power switching.

(Okay, there's one other thing: The patch also allows users to disable a 
port, so that devices plugged into that port get ignored.  Maybe that's 
what you really had in mind...?)

> > Finally, you should add a test to port_event() in hub.c, probably where
> > the pm_runtime_active() check is.  If the port is powered off, return
> > before doing any of the warm_reset or connect_change processing.
> 
> I don't understand jet why this is needed. In all my tests, the hubs
> port was just not functioning any more. Regardless if the hub
> was capable of real vbus switching or not. Just as described above.
> Is it possible that this is already handled correctly because of the
> other cleared port_features I mentioned?

The USB spec does say that hubs should ignore connections to ports whose
port_power feature flag is off.  The test I suggested was meant as a "just 
in case" sort of thing, for hubs that don't comply with the spec's 
requirement.  In the end it may not be necessary, and it can be done in a 
separate patch.

> In v3 I will also add port_power_show to make it possible for the
> userspace to read out the current port status but returning the
> value of test_bit(port1, hub->power_bits);.

Good idea; I should have thought of it.

Alan Stern
