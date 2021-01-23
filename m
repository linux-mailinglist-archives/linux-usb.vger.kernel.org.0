Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0084A30188E
	for <lists+linux-usb@lfdr.de>; Sat, 23 Jan 2021 22:33:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbhAWVdt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 Jan 2021 16:33:49 -0500
Received: from netrider.rowland.org ([192.131.102.5]:45479 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725922AbhAWVdt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 23 Jan 2021 16:33:49 -0500
Received: (qmail 87824 invoked by uid 1000); 23 Jan 2021 16:33:07 -0500
Date:   Sat, 23 Jan 2021 16:33:07 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Jeremy Figgins <kernel@jeremyfiggins.com>
Cc:     Pete Zaitcev <zaitcev@redhat.com>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: usblp: add USBLP_QUIRK_NO_SET_INTF flag
Message-ID: <20210123213307.GA86881@rowland.harvard.edu>
References: <YASt5wgOCkXhH2Dv@watson>
 <20210117234416.49d59761@suzdal.zaitcev.lan>
 <20210118163117.GA142198@rowland.harvard.edu>
 <20210121131954.7103881d@suzdal.zaitcev.lan>
 <20210121192929.GA12502@rowland.harvard.edu>
 <20210121170249.4081af4c@suzdal.zaitcev.lan>
 <2d9bf7fd-918c-c5cb-d2d3-7cd9a86b451e@jeremyfiggins.com>
 <20210122162212.GB43566@rowland.harvard.edu>
 <15c2f9ba-a3c1-ebc4-25f4-f8c3df269807@jeremyfiggins.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15c2f9ba-a3c1-ebc4-25f4-f8c3df269807@jeremyfiggins.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jan 23, 2021 at 12:46:06PM -0600, Jeremy Figgins wrote:
> On 1/22/21 10:22 AM, Alan Stern wrote:
> > On Thu, Jan 21, 2021 at 07:06:27PM -0600, Jeremy Figgins wrote:
> > > On 1/21/21 5:02 PM, Pete Zaitcev wrote:
> > > > On Thu, 21 Jan 2021 14:29:29 -0500
> > > > Alan Stern <stern@rowland.harvard.edu> wrote:
> > > > 
> > > > > > I'm also concerned about regressions. This is a legacy class driver,
> > > > > > only used where CUPS is not applicable, mostly with truly ancient
> > > > > > devices. So yes, setting a zero altsetting after enumeration should
> > > > > > be unnecessary. But you never know with the old firmware.
> > > > 
> > > > > How about skipping the call whenever the interface has only one
> > > > > altsetting?
> > > > 
> > > > Do you mean when it's only one and not equal to zero?
> > > > 
> > > > BTW, one other thing bothers me. Jeremy confirmed that my patch
> > > > worked, which skips the call when USB_QUIRK_NO_SET_INTF is set.
> > > > But if we look into drivers/usb/core/message.c, the control
> > > > exchange to set the altsetting is skipped in that case anyway.
> > > > So, usblp was calling usb_set_protocol, the suspect control was
> > > > skipped, but something else caused a problem. Could it be the
> > > > attempt to clear halt that triggered the problem?
> > > > 
> > > > -- Pete
> > > > 
> > > 
> > > 
> > > In my debugging, I found that it was the calls to usb_control_msg_send() in
> > > both usb_set_interface() and usb_clear_halt() caused the printer to lockup.
> > > I suppose another way to resolve this would to have a flag to prevent
> > > usb_clear_halt()'s call to usb_control_msg_send(), but I'm not an expert in
> > > USB, so I'm not sure of the ramifications of that.
> > 
> > The simplest solution in all cases is just to avoid calling either
> > usb_set_interface or usb_clear_halt.  Especially since in cases where
> > the interface has only one altsetting, neither call should be necessary.
> > 
> > Alan Stern
> > 
> 
> I can confirm that only calling usb_clear_halt() if USB_QUIRK_NO_SET_INTF is
> not set (and setting it for my device) does allow my device to work. What is
> the next step? Should I submit a v2 patch?

Why don't you write, test, and submit a patch that will make usblp avoid 
calling usb_set_interface and usb_clear_halt when there's only one 
altsetting?

Alan Stern
