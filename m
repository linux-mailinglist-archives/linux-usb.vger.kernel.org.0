Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B2732FF47A
	for <lists+linux-usb@lfdr.de>; Thu, 21 Jan 2021 20:30:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727168AbhAUTac (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Jan 2021 14:30:32 -0500
Received: from netrider.rowland.org ([192.131.102.5]:51335 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727073AbhAUTaL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Jan 2021 14:30:11 -0500
Received: (qmail 12794 invoked by uid 1000); 21 Jan 2021 14:29:29 -0500
Date:   Thu, 21 Jan 2021 14:29:29 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Pete Zaitcev <zaitcev@redhat.com>
Cc:     Jeremy Figgins <kernel@jeremyfiggins.com>,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: usblp: add USBLP_QUIRK_NO_SET_INTF flag
Message-ID: <20210121192929.GA12502@rowland.harvard.edu>
References: <YASt5wgOCkXhH2Dv@watson>
 <20210117234416.49d59761@suzdal.zaitcev.lan>
 <20210118163117.GA142198@rowland.harvard.edu>
 <20210121131954.7103881d@suzdal.zaitcev.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121131954.7103881d@suzdal.zaitcev.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 21, 2021 at 01:19:54PM -0600, Pete Zaitcev wrote:
> On Mon, 18 Jan 2021 11:31:17 -0500
> Alan Stern <stern@rowland.harvard.edu> wrote:

> > Would it be practical simply to skip the usb_set_interface() call 
> > whenever alts is 0?  After all, devices use altsetting 0 by default; it 
> > shouldn't be necessary to tell them to do so.
> 
> Is it possible to bind and unbind the driver without enumeration, and
> thus inherit a non-zero altsetting?

In theory, yes.  But the only way it could happen is if either the 
driver itself or a userspace program installed the nonzero 
altsetting.

> I'm also concerned about regressions. This is a legacy class driver,
> only used where CUPS is not applicable, mostly with truly ancient
> devices. So yes, setting a zero altsetting after enumeration should
> be unnecessary. But you never know with the old firmware.

True, although I seriously doubt anyone would have written firmware that 
required a Set-Interface request for initialization.  Particularly if 
the interface has only one altsetting.

How about skipping the call whenever the interface has only one 
altsetting?

Alan Stern
