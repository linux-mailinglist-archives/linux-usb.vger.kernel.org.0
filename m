Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB423695B8
	for <lists+linux-usb@lfdr.de>; Fri, 23 Apr 2021 17:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbhDWPLa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Apr 2021 11:11:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230470AbhDWPLa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Apr 2021 11:11:30 -0400
X-Greylist: delayed 1843 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 23 Apr 2021 08:10:53 PDT
Received: from mail.solidxs.nl (mail.solidxs.nl [IPv6:2a01:4f8:150:72a3::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C0DBC061574
        for <linux-usb@vger.kernel.org>; Fri, 23 Apr 2021 08:10:53 -0700 (PDT)
Received: by mail.solidxs.nl (Postfix, from userid 1000)
        id 16D3C4C80C46; Fri, 23 Apr 2021 17:10:52 +0200 (CEST)
Date:   Fri, 23 Apr 2021 17:10:52 +0200
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Marcel Hamer <marcel@solidxs.se>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] Add missing link states in dwc3 gadget wakeup
Message-ID: <20210423151052.GA1423292@solidxs.nl>
References: <20210423132314.361822-1-marcel@solidxs.se>
 <20210423144008.GA1420322@solidxs.nl>
 <YILiA0MYj1+VPPJN@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YILiA0MYj1+VPPJN@kroah.com>
From:   Marcel Hamer <marcel@solidxs.nl>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 23, 2021 at 05:04:35PM +0200, Greg KH wrote:
> On Fri, Apr 23, 2021 at 04:40:08PM +0200, Marcel Hamer wrote:
> > Hello,
> > 
> > I would like to add that I do not have the dwc3 documentation myself,
> > given it is not publically available. I deduced the patch from active 
> > debugging on my system.
> > 
> > Please let me know if DWC3_LINK_STATE_U1 and DWC3_LINK_STATE_U2 should
> > either be removed from the 'needs_wakeup =' line instead. Or if
> > something else is off with the proposed patch.
> 
> When submitting patches, please use scripts/get_maintainers.pl to know
> who to cc: so that they know to pay attention to your commit.  Care to
> do that again here and resend it?
> 
> Also, you might want to change your subject line to match up with others
> for this driver:
> 	[PATCH] USB: dwc3: add missing link...
> 
> thanks,
> 
> greg k-h

Absolutely, will resend it. Thanks for the information.

Marcel
