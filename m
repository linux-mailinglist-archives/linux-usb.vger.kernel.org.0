Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 147FBE74D
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 18:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728449AbfD2QIw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 12:08:52 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:54696 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728253AbfD2QIv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Apr 2019 12:08:51 -0400
Received: (qmail 6002 invoked by uid 2102); 29 Apr 2019 12:08:50 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 29 Apr 2019 12:08:50 -0400
Date:   Mon, 29 Apr 2019 12:08:50 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Oliver Neukum <oneukum@suse.com>
cc:     David Laight <David.Laight@ACULAB.COM>,
        "gregKH@linuxfoundation.org" <gregKH@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] UAS: fix alignment of scatter/gather segments
In-Reply-To: <1556553445.20085.21.camel@suse.com>
Message-ID: <Pine.LNX.4.44L0.1904291207300.1632-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 29 Apr 2019, Oliver Neukum wrote:

> On Mo, 2019-04-29 at 15:06 +0000, David Laight wrote:
> > From: Oliver Neukum
> > > On Mo, 2019-04-29 at 14:19 +0000, David Laight wrote:
> 
> > > AFAICT controllers do not export that property.
> > 
> > Perhaps they need to ....
> 
> Feel free to make a patch.
> 
> > > > Even if you decide the code is 'good enough' (I don't know what the
> > > > cost is of enforcing a 2k alignment instead of 512 bytes)
> > > > the comment is just plain wrong.
> > > 
> > > Usually block IO will be pages. They are 4K aligned.
> > > In terms of performance this code is unlikely to matter.
> > 
> > Presumably there are some cases where the buffer isn't 4k aligned.
> > I'm guessing things like 'dd' of raw disks?
> 
> Possibly.
> 
> > If the buffer has the wrong alignment then I presume a bounce buffer
> > has to be allocated?
> > The USB controller drivers are likely to need to be able to do that
> > anyway because buffers from the network stack can have almost
> > arbitrary alignment (I remember that code being horrid, I don't
> > remember a data copy in the TX path).
> 
> You can ask the network layer to undo scatter/gather.
> I don't see an issue.
> 
> > > But it is needed for correctness.
> > 
> > If you are doing it for 'correctness' then you need the correct size.
> 
> Why? Any larger size will do.
> 
> > If you are doing it because you've seen too small an alignment you
> > should be mentioning the failing system.
> 
> Why?
> 
> > > What would you want for the comment?
> > 
> > You need to be more specific about the alignment requirements than
> > the old comment, not far less specific.
> 
> But the statement the old comment made are no longer correct.

Perhaps David would be satisfied if the comment were changed to say 
that _some_ USB controller drivers have this unusual alignment 
requirement.

Alan Stern

