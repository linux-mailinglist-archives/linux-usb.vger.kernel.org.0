Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A0292BB0B3
	for <lists+linux-usb@lfdr.de>; Fri, 20 Nov 2020 17:38:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729969AbgKTQh2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Nov 2020 11:37:28 -0500
Received: from netrider.rowland.org ([192.131.102.5]:56709 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728652AbgKTQh2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Nov 2020 11:37:28 -0500
Received: (qmail 620972 invoked by uid 1000); 20 Nov 2020 11:37:27 -0500
Date:   Fri, 20 Nov 2020 11:37:27 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Min Guo <min.guo@mediatek.com>, Bin Liu <b-liu@ti.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        chunfeng.yun@mediatek.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] usb: musb: remove unused variable 'devctl'
Message-ID: <20201120163727.GC619708@rowland.harvard.edu>
References: <20201117082125.7619-1-min.guo@mediatek.com>
 <X7UKJtWtE0UZgqAQ@kroah.com>
 <1605854930.3995.8.camel@mhfsdcap03>
 <X7doKlP1k824LGGN@kroah.com>
 <1605858126.3995.14.camel@mhfsdcap03>
 <X7eAEaTN/fM3fkkp@kroah.com>
 <20201120161519.GA619708@rowland.harvard.edu>
 <X7fvrK4F2378+9Rl@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X7fvrK4F2378+9Rl@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 20, 2020 at 05:32:44PM +0100, Greg Kroah-Hartman wrote:
> On Fri, Nov 20, 2020 at 11:15:19AM -0500, Alan Stern wrote:
> > > Perhaps you might want to add a comment here so that people will not
> > > keep making this same mistake when they run auto-checkers on the
> > > codebase?
> > 
> > A better change would be
> > 
> > -			devctl = musb_readb(mbase, MUSB_DEVCTL);
> > +			(void) musb_readb(mbase, MUSB_DEVCTL);
> > 
> > and eliminate the unused variable.  Then there wouldn't be any compiler 
> > warning.
> 
> No need for the (void), the compiler shouldn't warn about that, right?

True, but it clearly indicates to a human reader that the value was 
intended to be read and thrown away.  Alternatively, the (void) cast 
could be left out and a comment added.

Alan Stern
