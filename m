Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97A80300992
	for <lists+linux-usb@lfdr.de>; Fri, 22 Jan 2021 18:23:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729446AbhAVQzw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Jan 2021 11:55:52 -0500
Received: from netrider.rowland.org ([192.131.102.5]:41021 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729587AbhAVQVC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Jan 2021 11:21:02 -0500
Received: (qmail 45515 invoked by uid 1000); 22 Jan 2021 11:20:19 -0500
Date:   Fri, 22 Jan 2021 11:20:19 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Pete Zaitcev <zaitcev@redhat.com>
Cc:     Jeremy Figgins <kernel@jeremyfiggins.com>,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: usblp: add USBLP_QUIRK_NO_SET_INTF flag
Message-ID: <20210122162019.GA43566@rowland.harvard.edu>
References: <YASt5wgOCkXhH2Dv@watson>
 <20210117234416.49d59761@suzdal.zaitcev.lan>
 <20210118163117.GA142198@rowland.harvard.edu>
 <20210121131954.7103881d@suzdal.zaitcev.lan>
 <20210121192929.GA12502@rowland.harvard.edu>
 <20210121170249.4081af4c@suzdal.zaitcev.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121170249.4081af4c@suzdal.zaitcev.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 21, 2021 at 05:02:49PM -0600, Pete Zaitcev wrote:
> On Thu, 21 Jan 2021 14:29:29 -0500
> Alan Stern <stern@rowland.harvard.edu> wrote:
> 
> > > I'm also concerned about regressions. This is a legacy class driver,
> > > only used where CUPS is not applicable, mostly with truly ancient
> > > devices. So yes, setting a zero altsetting after enumeration should
> > > be unnecessary. But you never know with the old firmware.  
> 
> > How about skipping the call whenever the interface has only one 
> > altsetting?
> 
> Do you mean when it's only one and not equal to zero?

If there's only one, it _has_ to be equal to 0.  According to section 
9.2.3 of the USB-2 spec:

	Alternate settings range from zero to one less than the number 
	of alternate settings for a specific interface.

> BTW, one other thing bothers me. Jeremy confirmed that my patch
> worked, which skips the call when USB_QUIRK_NO_SET_INTF is set.
> But if we look into drivers/usb/core/message.c, the control
> exchange to set the altsetting is skipped in that case anyway.
> So, usblp was calling usb_set_protocol, the suspect control was
> skipped, but something else caused a problem. Could it be the
> attempt to clear halt that triggered the problem?

It could very well be.  The printer might not reset the endpoint toggle 
when it gets the Clear-Halt request.

It's also possible that when the quirk flag wasn't set (so the 
Set-Interface request was issued), the printer failed reset the endpoint 
toggle.

Alan Stern
