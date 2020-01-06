Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD5041315E4
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jan 2020 17:17:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbgAFQRN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jan 2020 11:17:13 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:53392 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726448AbgAFQRN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jan 2020 11:17:13 -0500
Received: (qmail 3625 invoked by uid 2102); 6 Jan 2020 11:17:12 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 6 Jan 2020 11:17:12 -0500
Date:   Mon, 6 Jan 2020 11:17:12 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Johan Hovold <johan@kernel.org>
cc:     Greg KH <greg@kroah.com>,
        Roger Whittaker <Roger.Whittaker@suse.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Takashi Iwai <tiwai@suse.de>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: Fix: Don't skip endpoint descriptors with maxpacket=0
In-Reply-To: <20200106160315.GA30908@localhost>
Message-ID: <Pine.LNX.4.44L0.2001061116320.1514-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 6 Jan 2020, Johan Hovold wrote:

> On Mon, Jan 06, 2020 at 10:43:42AM -0500, Alan Stern wrote:
> > It turns out that even though endpoints with a maxpacket length of 0
> > aren't useful for data transfer, the descriptors do serve other
> > purposes.  In particular, skipping them will also skip over other
> > class-specific descriptors for classes such as UVC.  This unexpected
> > side effect has caused some UVC cameras to stop working.
> > 
> > In addition, the USB spec requires that when isochronous endpoint
> > descriptors are present in an interface's altsetting 0 (which is true
> > on some devices), the maxpacket size _must_ be set to 0.  Warning
> > about such things seems like a bad idea.
> > 
> > This patch updates an earlier commit which would log a warning and
> > skip these endpoint descriptors.  Now we only log a warning, and we
> > don't even do that for isochronous endpoints in altsetting 0.
> > 
> > We don't need to worry about preventing endpoints with maxpacket = 0
> > from ever being used for data transfers; usb_submit_urb() already
> > checks for this.
> > 
> > Reported-and-tested-by: Roger Whittaker <Roger.Whittaker@suse.com>
> > Fixes: d482c7bb0541 ("USB: Skip endpoints with 0 maxpacket length")
> > Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> > CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Link: https://marc.info/?l=linux-usb&m=157790377329882&w=2
> 
> Acked-by: Johan Hovold <johan@kernel.org>
> 
> We also need
> 
> Cc: stable <stable@vger.kernel.org>
> 
> as d482c7bb0541 ("USB: Skip endpoints with 0 maxpacket length") ended up
> being (auto- ?) selected for stable.

Absolutely -- I had intended to add that CC: but it slipped my mind 
when the email was being prepared.

Alan Stern

