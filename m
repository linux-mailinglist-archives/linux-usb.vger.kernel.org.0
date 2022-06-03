Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5E2753C16C
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jun 2022 02:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232960AbiFCAZM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jun 2022 20:25:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbiFCAZL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jun 2022 20:25:11 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 9D9AC31394
        for <linux-usb@vger.kernel.org>; Thu,  2 Jun 2022 17:25:10 -0700 (PDT)
Received: (qmail 286967 invoked by uid 1000); 2 Jun 2022 20:25:09 -0400
Date:   Thu, 2 Jun 2022 20:25:09 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v2] usb: hub: port: add sysfs entry to switch port power
Message-ID: <YplU5dHLZdQDGMh1@rowland.harvard.edu>
References: <20220602012731.2942309-1-m.grzeschik@pengutronix.de>
 <YpjLusnGk8ZBlGGd@rowland.harvard.edu>
 <20220602145918.GB26638@pengutronix.de>
 <YpkMi9Se0Unxq1SS@rowland.harvard.edu>
 <20220602213454.GC26638@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220602213454.GC26638@pengutronix.de>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 02, 2022 at 11:34:54PM +0200, Michael Grzeschik wrote:
> On Thu, Jun 02, 2022 at 03:16:27PM -0400, Alan Stern wrote:
> > On Thu, Jun 02, 2022 at 04:59:18PM +0200, Michael Grzeschik wrote:
> > > Because of that; I am currently curious if we just should rename that
> > > property to something more generic like "enable" or "disable". So that
> > > as the real vbus power switching is missing, the hubs port switching
> > > does still function like intended.
> > 
> > That makes sense.  But the question arises, does this patch really do what
> > you want?
> > 
> > The patch description talks about the need to disable devices or
> > re-enumerate them.  You can disable a device right now by writing -1 to
> > the bConfigurationValue sysfs file, and you can force a device to be
> > re-enumerated by resetting it (using the USBDEVFS_RESET usbfs ioctl).
> > 
> > About the only thing you can't currently do is actually turn off power to
> > the port.  This patch will allow users to do that, but only if the hub
> > supports power switching.
> > 
> > (Okay, there's one other thing: The patch also allows users to disable a
> > port, so that devices plugged into that port get ignored.  Maybe that's
> > what you really had in mind...?)
> 
> Yes, that is what I had in mind. If you agree, I would still keep the
> name "port_power" since it is the main function, but skip the
> hub_is_port_power_switchable check.

I favor the more generic name.  "disable" will be more understandable for 
users than "port_power", if the file doesn't actually control the bus 
power.

Alan Stern
