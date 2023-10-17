Return-Path: <linux-usb+bounces-1763-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4807CCB7B
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 21:00:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D179C1C20C8A
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 19:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B259CA55;
	Tue, 17 Oct 2023 19:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38102EBE
	for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 18:59:59 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id B9513F7
	for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 11:59:55 -0700 (PDT)
Received: (qmail 193575 invoked by uid 1000); 17 Oct 2023 14:59:54 -0400
Date: Tue, 17 Oct 2023 14:59:54 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Hardik Gajjar <hgajjar@de.adit-jv.com>, mathias.nyman@intel.com,
  yangyingliang@huawei.com, jinpu.wang@ionos.com, linux-usb@vger.kernel.org,
  linux-kernel@vger.kernel.org, erosca@de.adit-jv.com
Subject: Re: [PATCH v4] usb: core: hub: Add quirks for reducing device
 address timeout
Message-ID: <6c25beed-06fe-4be0-b51a-18e159d25072@rowland.harvard.edu>
References: <2023101155-unframed-satirical-f7ec@gregkh>
 <20231011164525.97616-1-hgajjar@de.adit-jv.com>
 <2023101620-shaky-sensitize-9708@gregkh>
 <20231017161021.GA62775@vmlxhi-118.adit-jv.com>
 <2023101750-bless-humorous-45c7@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023101750-bless-humorous-45c7@gregkh>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Oct 17, 2023 at 06:53:44PM +0200, Greg KH wrote:
> On Tue, Oct 17, 2023 at 06:10:21PM +0200, Hardik Gajjar wrote:
> > More logs and detailed in patch V1:
> > https://lore.kernel.org/linux-usb/20230818092353.124658-1-hgajjar@de.adit-jv.com/T/#m452ec9dad94e8181fdb050cd29483dd89437f7c1
> > > 
> > > > Achieving this is impossible in scenarios where the set_address is
> > > > not successful and waits for a timeout.
> > > 
> > > Agreed, broken hardware is a pain, but if your device is allowed to take
> > > longer, it can, and will, so you have to support that.
> > > 
> > The problem is not caused by the device taking an extended amount of time to
> > process the 'set_address' request. Instead, the issue lies in the absence of
> > any activity on the upstream bus until a timeout occurs.
> 
> So, a broken device.  Why are you then adding the hub to the quirk list
> and not the broken device?  We are used to adding broken devices to
> qurik lists all the time, this shouldn't be new.

Adding a quirk for the device isn't feasible, because the problem occurs 
before the device has been initialized and enumerated.  The kernel 
doesn't know anything about the device at this point; only that it has 
just connected.

> > This situation arises when the host has already transmitted the 'set_address' command to the hub,
> > assuming that the device operates at full speed. However, the device connected
> > to the hub undergoes a state change from full speed to high-speed during this process.
> 
> During which process?  While the set-address happens?  That feels like a
> hub bug then.
> 
> > > > The shortened address device timeout quirks provide the flexibility
> > > > to align with a 3-second time limit in the event of errors.
> > > > By swiftly triggering a failure response and swiftly initiating
> > > > retry procedures, these quirks ensure efficient and rapid recovery,
> > > > particularly in automotive contexts where rapid smartphone enumeration
> > > > and screen projection are vital.
> > > 
> > > Screen projection is a requirement that you should not be relying on USB
> > > for as USB has a different set of required timeouts, right?  This sounds
> > > like a bad hardware design, if not an impossible one.
> > > 
> > 
> > Screen projection for us means displaying the connected phone on the screen and
> > launching Carplay and Android Auto for the user. This works perfectly in nearly all
> > cases, except in scenarios like this one where a combination of a special hub and
> > a specific phone model is causing the issue
> 
> So which is broken, the hub or phone?

It sounds like both of them are broken to some extent, although we can't 
tell for sure without seeing what's actually happening on the USB bus 
(i.e., bus analyzer output):

	The phone seems to take too long to activate its high-speed
	terminations and deactivate the full-speed terminations.

	The hub doesn't seem to realize that the phone has disconnected 
	its full-speed connection and switched to high-speed.

But without real data, these are just best guesses.

> > The issue arises when the host has already issued the 'set_address' command to the hub,
> > assuming the device is operating at full speed. However, in such cases, when the device
> > connected to the hub changes its state from full speed to high-speed, the 'set_address'
> > request becomes blocked, waiting for the full 5-second timeout. This patch reduces the
> > timeout from 5 seconds to 500 milliseconds, allowing for quicker failure and re-enumeration
> > of the device as high-speed
> 
> Changing speed is under hub control, not device control, right?  Are you

Changing speed is under device control.  But of course, the hub has to 
detect the change and react to it properly.

Alan Stern

> sure the firmware is correct in that hub?  Has the hub passed all of the
> USB-IF testing requirements?
> 
> thanks,
> 
> greg k-h

