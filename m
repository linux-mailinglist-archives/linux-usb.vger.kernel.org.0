Return-Path: <linux-usb+bounces-2134-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D69127D5723
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 17:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 75D30B20ED6
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 15:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD4138DE9;
	Tue, 24 Oct 2023 15:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8A61D6A9
	for <linux-usb@vger.kernel.org>; Tue, 24 Oct 2023 15:58:39 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 05AAE10C9
	for <linux-usb@vger.kernel.org>; Tue, 24 Oct 2023 08:58:37 -0700 (PDT)
Received: (qmail 461759 invoked by uid 1000); 24 Oct 2023 11:58:37 -0400
Date: Tue, 24 Oct 2023 11:58:37 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: "Li, Meng" <Meng.Li@windriver.com>,
  "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
  "usb-storage@lists.one-eyed-alien.net" <usb-storage@lists.one-eyed-alien.net>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: storage: add shutdown function for usb storage
 driver
Message-ID: <5107f6ca-e972-4af1-a21d-6c95778969f3@rowland.harvard.edu>
References: <20231023054111.2744872-1-Meng.Li@windriver.com>
 <33bd0779-bfe7-4c87-8fe6-ea8455df3b6b@rowland.harvard.edu>
 <PH0PR11MB51918DD50651DB6BE937BEA3F1DFA@PH0PR11MB5191.namprd11.prod.outlook.com>
 <3fe5b43c-a5aa-4c6a-8614-03a4d9dd53e2@rowland.harvard.edu>
 <2023102428-zit-quickness-9b73@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023102428-zit-quickness-9b73@gregkh>

On Tue, Oct 24, 2023 at 05:45:40PM +0200, gregkh@linuxfoundation.org wrote:
> On Tue, Oct 24, 2023 at 11:35:19AM -0400, Alan Stern wrote:
> > Okay, that's a different matter.  In fact, I don't know what is supposed 
> > to happen during a clean reboot.
> 
> Define "clean" :)

In this case, I mean what happens when you give the "reboot" command.

> reboot is a system thing that happens before the reboot syscall happens.
> So which are we talking nabout here?
> 
> > Greg, do you know?  Should we take the time to disconnect all the USB 
> > devices during a system shutdown?
> 
> In the past we have not.  And if we switch to do so, we might get some
> complaints as we would now delaying the shutdown process to be longer
> than before.

Yes, that's what I'm afraid of.

> > What happens with non-USB disk drives?  Or other removable devices?
> 
> It would have to come from "above" in the device tree, so does the PCI
> or platform bus say that they should be shut down and their child
> devices?

Well, the PCI layer invokes the HCD's ->shutdown callback.  But the 
usb-storage driver and usbcore don't know this has happened, so they 
start logging errors because they are suddenly unable to communicate 
with a USB drive.  Meng Li is unhappy about these error messages.

Adding a shutdown callback of sorts to usb-storage allows the driver to 
know that it shouldn't communicate with the drive any more, which 
prevents the error message from appearing.  That's what this patch does.  

But that's all it does.  Basically it creates a layering violation just 
to prevent some error messages from showing up in the system log during 
a shutdown or reboot.  The question is whether we want to do this at 
all, and if we do, shouldn't it be handled at the usbcore level rather 
than just within usb-storage?

Alan Stern

