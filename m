Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07F1D1D5942
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2020 20:43:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726584AbgEOSnC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 May 2020 14:43:02 -0400
Received: from netrider.rowland.org ([192.131.102.5]:48407 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726304AbgEOSnC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 May 2020 14:43:02 -0400
Received: (qmail 14280 invoked by uid 500); 15 May 2020 14:43:01 -0400
Date:   Fri, 15 May 2020 14:43:01 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Colin Ian King <colin.king@canonical.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Zhang Shengju <zhangshengju@cmss.chinamobile.com>,
        Tang Bin <tangbin@cmss.chinamobile.com>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] USB: EHCI: ehci-mv: fix less than zero comparison
 of an unsigned int
Message-ID: <20200515184301.GA13795@rowland.harvard.edu>
References: <20200515165453.104028-1-colin.king@canonical.com>
 <20200515172121.GA5498@rowland.harvard.edu>
 <342e8fc0-c961-d9f0-f2d1-bd455ce06d86@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <342e8fc0-c961-d9f0-f2d1-bd455ce06d86@canonical.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 15, 2020 at 06:26:04PM +0100, Colin Ian King wrote:
> On 15/05/2020 18:21, Alan Stern wrote:
> > On Fri, May 15, 2020 at 05:54:53PM +0100, Colin King wrote:
> >> From: Colin Ian King <colin.king@canonical.com>
> >>
> >> The comparison of hcd->irq to less than zero for an error check will
> >> never be true because hcd->irq is an unsigned int.  Fix this by
> >> assigning the int retval to the return of platform_get_irq and checking
> >> this for the -ve error condition and assigning hcd->irq to retval.
> >>
> >> Addresses-Coverity: ("Unsigned compared against 0")
> >> Fixes: c856b4b0fdb5 ("USB: EHCI: ehci-mv: fix error handling in mv_ehci_probe()")
> >> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> >> ---
> > 
> > Thanks to Coverity for spotting this.  Any reason why it didn't spot 
> > exactly the same mistake in the ohci-da8xx.c driver?
> 
> No idea, it is curious that it can spot one error but miss another.
> Sometimes I see these issues on the next scan, so it maybe the database
> diff'ing is awry.
> 
> > 
> > Also, why wasn't the patch CC'ed for the stable series?
> 
> My bad on that. Human error

Actually the question itself was my mistake.  I didn't notice that your 
patch was a fix to something that was just merged and hadn't been CC'ed 
to stable.

Alan Stern
