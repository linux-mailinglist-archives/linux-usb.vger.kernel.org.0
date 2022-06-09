Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC0C544E06
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jun 2022 15:49:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239892AbiFINs6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jun 2022 09:48:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234919AbiFINs5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jun 2022 09:48:57 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 19C02F0
        for <linux-usb@vger.kernel.org>; Thu,  9 Jun 2022 06:48:55 -0700 (PDT)
Received: (qmail 476285 invoked by uid 1000); 9 Jun 2022 09:48:54 -0400
Date:   Thu, 9 Jun 2022 09:48:54 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org,
        evgreen@google.com, shobhit.srivastava@intel.com
Subject: Re: [RFC PATCH 0/1] hibernate and roothub port power
Message-ID: <YqH6Rsc59Bj8tspu@rowland.harvard.edu>
References: <20220607135836.627711-1-mathias.nyman@linux.intel.com>
 <400be833-468c-be0d-c80a-f3617800750d@suse.com>
 <36fdbf28-47fa-522e-8789-23bb1afa9176@linux.intel.com>
 <YqCnkNMqBRCy3fdd@rowland.harvard.edu>
 <7293f560-645d-387c-75c4-4be517cfd925@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7293f560-645d-387c-75c4-4be517cfd925@linux.intel.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 09, 2022 at 10:59:37AM +0300, Mathias Nyman wrote:
> On 8.6.2022 16.43, Alan Stern wrote:
> > On Wed, Jun 08, 2022 at 02:47:22PM +0300, Mathias Nyman wrote:
> > > On 8.6.2022 11.19, Oliver Neukum wrote:
> > > > 
> > > > 
> > > > On 07.06.22 15:58, Mathias Nyman wrote:
> > > > 
> > > > Hi,
> > > > 
> > > > > In shutdown (S5), with xHCI as host, this can be solved fairly easily
> > > > > by turning off roothub port power in the .shutdown path.
> > > > 
> > > > That would suck for the people who charge their phone from their
> > > > computer.
> > > 
> > > Good point.
> > > My guess is that xHC port power bits won't actually turn off VBus for those
> > > Sleep-and-charge, or Always-on ports.
> > > VBus is allowed to be on even if port is in power-off state, but usb link state
> > > should be forced to ss.Disabled from other states, like U3.
> > > 
> > > Need to try it out, it's possible this turns off VBus for some usb-A ports
> > > on some older systems that earlier (accidentally?) supplied VBus on
> > > "normal" ports after shutdown.
> > 
> > How about turning off port power _only_ in the shutdown or unbind path,
> > and setting the port link states to ss.Disabled in the poweroff or
> > poweroff_noirq stage of hibernation (if wakeup is disabled)?  Would that
> > solve the problem of the firmware needing to time out on reboot?
> > 
> 
> That would be optimal, but unfortunately xHCI doesn't support setting link
> state directly to ss.Disabled. Only way is to clear port power (PP) bit.

What would happen if you clear the PP bit, wait for the link state to 
become ss.Disabled, and then turn PP back on?

> To avoid turning off VBus in hibernate we could limit port power bit clearing
> to xHC hosts that don't have the Port Power Control (PPC) capability flag.
> 
> We know these xHC hosts don't control power switches, and clearing PP won't turn
> off VBus (xhci 5.4.8, PORTRSC)
> 
> This could be a solution for some hosts, but probably not cover all.
> Not sure if the hardware this was reported on has PPC flag set.

In theory the problem could affect systems having any kind of xHCI 
hardware, since it's really a defect in the system firmware.

Doesn't Windows have a hibernation mode?  Do you know what state it 
leaves the xHCI ports in during hibernation?

Alan Stern
