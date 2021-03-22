Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71C19344C01
	for <lists+linux-usb@lfdr.de>; Mon, 22 Mar 2021 17:44:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbhCVQoX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Mar 2021 12:44:23 -0400
Received: from netrider.rowland.org ([192.131.102.5]:52585 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S229897AbhCVQoK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Mar 2021 12:44:10 -0400
Received: (qmail 671734 invoked by uid 1000); 22 Mar 2021 12:44:09 -0400
Date:   Mon, 22 Mar 2021 12:44:09 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jay Fang <f.fangjian@huawei.com>, linux-usb@vger.kernel.org,
        tangzihao1@hisilicon.com, huangdaode@huawei.com
Subject: Re: [PATCH] usb: ohci: remove unreachable
 platform_driver_unregister() call
Message-ID: <20210322164409.GC667925@rowland.harvard.edu>
References: <1616203911-4207-1-git-send-email-f.fangjian@huawei.com>
 <20210320022443.GA591964@rowland.harvard.edu>
 <20210322045850.GA1667@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210322045850.GA1667@kadam>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 22, 2021 at 07:58:50AM +0300, Dan Carpenter wrote:
> On Fri, Mar 19, 2021 at 10:24:43PM -0400, Alan Stern wrote:
> > On Sat, Mar 20, 2021 at 09:31:51AM +0800, Jay Fang wrote:
> > > From: Zihao Tang <tangzihao1@hisilicon.com>
> > > 
> > > Fix the following smatch warnings:
> > > 
> > > drivers/usb/host/ohci-hcd.c:1318 ohci_hcd_mod_init() warn:
> > > ignoring unreachable code.
> > > 
> > > platform_driver_register(&TMIO_OHCI_DRIVER) is the last
> > > platform_driver_register() call in ohci_hcd_mod_init(), so if it
> > > failed, there's no need to unregister it, but just goto error_tmio.
> > > 
> > > So remove the unreachable platform_driver_unregister(&TMIO_OHCI_DRIVER).
> > > No functionality change.
> > 
> > Doesn't the compiler realize that the call is unreachable, and 
> > therefore avoid generating any object for it?
> >
> 
> This is a static checker warning.  For example, Heart Bleed bug was an
> ignored unreachable code static checker warning.
> 
> > It's true that the function call is, strictly speaking, unnecessary.  
> > However, it provides a pleasing symmetry and it acts as a guide in the 
> > unlikely event that anyone wants to add another platform-specific 
> > driver in the future.
> 
> Hopefully future programmers can figure out basic stuff like that.
> 
> This code doesn't trigger a Smatch warning on my .config because the
> Smatch check doesn't warn if the previous line was an #endif.  On the
> other hand, the ifdefs are also why I forwarded the email when I saw the
> warning from kbuild.  Normally kbuild is better at picking the person
> to blame but because this is a .config thing that confused it.  Anyway,
> I glanced at the warning and thought it looked suspicious enough to
> warrant a further look.
> 
> When I first wrote the Smatch unreachable code warning there were a
> handful of places which used that style of code:
> 
> 	return 0;
> 
> 	unreachable_release();
> err_release:
> 	release_something();
> 
> I just left those as-is because it was obvious to me that it was done
> intentionally.  However, it seems that other people have removed all of
> those behind my back so I can't find an example of this now except for
> in ohci_hcd_mod_init().
> 
> Anyway, I would have put a special case to silence these false positives
> but it wasn't common practice in 2014 and no one does it these days.

Well, I guess it would be okay to convert the code to a comment.  Just 
so long as it isn't removed entirely.

Alan Stern
