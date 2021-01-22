Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CAD23008F2
	for <lists+linux-usb@lfdr.de>; Fri, 22 Jan 2021 17:47:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729370AbhAVQXI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Jan 2021 11:23:08 -0500
Received: from netrider.rowland.org ([192.131.102.5]:50241 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729367AbhAVQW4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Jan 2021 11:22:56 -0500
Received: (qmail 45621 invoked by uid 1000); 22 Jan 2021 11:22:12 -0500
Date:   Fri, 22 Jan 2021 11:22:12 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Jeremy Figgins <kernel@jeremyfiggins.com>
Cc:     Pete Zaitcev <zaitcev@redhat.com>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: usblp: add USBLP_QUIRK_NO_SET_INTF flag
Message-ID: <20210122162212.GB43566@rowland.harvard.edu>
References: <YASt5wgOCkXhH2Dv@watson>
 <20210117234416.49d59761@suzdal.zaitcev.lan>
 <20210118163117.GA142198@rowland.harvard.edu>
 <20210121131954.7103881d@suzdal.zaitcev.lan>
 <20210121192929.GA12502@rowland.harvard.edu>
 <20210121170249.4081af4c@suzdal.zaitcev.lan>
 <2d9bf7fd-918c-c5cb-d2d3-7cd9a86b451e@jeremyfiggins.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d9bf7fd-918c-c5cb-d2d3-7cd9a86b451e@jeremyfiggins.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 21, 2021 at 07:06:27PM -0600, Jeremy Figgins wrote:
> On 1/21/21 5:02 PM, Pete Zaitcev wrote:
> > On Thu, 21 Jan 2021 14:29:29 -0500
> > Alan Stern <stern@rowland.harvard.edu> wrote:
> > 
> > > > I'm also concerned about regressions. This is a legacy class driver,
> > > > only used where CUPS is not applicable, mostly with truly ancient
> > > > devices. So yes, setting a zero altsetting after enumeration should
> > > > be unnecessary. But you never know with the old firmware.
> > 
> > > How about skipping the call whenever the interface has only one
> > > altsetting?
> > 
> > Do you mean when it's only one and not equal to zero?
> > 
> > BTW, one other thing bothers me. Jeremy confirmed that my patch
> > worked, which skips the call when USB_QUIRK_NO_SET_INTF is set.
> > But if we look into drivers/usb/core/message.c, the control
> > exchange to set the altsetting is skipped in that case anyway.
> > So, usblp was calling usb_set_protocol, the suspect control was
> > skipped, but something else caused a problem. Could it be the
> > attempt to clear halt that triggered the problem?
> > 
> > -- Pete
> > 
> 
> 
> In my debugging, I found that it was the calls to usb_control_msg_send() in
> both usb_set_interface() and usb_clear_halt() caused the printer to lockup.
> I suppose another way to resolve this would to have a flag to prevent
> usb_clear_halt()'s call to usb_control_msg_send(), but I'm not an expert in
> USB, so I'm not sure of the ramifications of that.

The simplest solution in all cases is just to avoid calling either 
usb_set_interface or usb_clear_halt.  Especially since in cases where 
the interface has only one altsetting, neither call should be necessary.

Alan Stern
