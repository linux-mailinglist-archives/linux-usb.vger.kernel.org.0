Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C50063A1063
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jun 2021 12:48:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238159AbhFIJov (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Jun 2021 05:44:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:36666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238162AbhFIJou (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Jun 2021 05:44:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0143E6136D;
        Wed,  9 Jun 2021 09:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623231775;
        bh=MJZ1xoC4SXgXBo4T0p99ORsxRs0/VJPIQky2Q1NkXRw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lAMnwkE82U1Ge6HXVNIWaT9Ism9kuGK/rhlV3hXhQoUhjwYgKnfVO6hOn5rW15d18
         Ycfm5PWJ0U3Ys8zsrPQNtJDmtj15kvVGkA6lJ56JKw3C5LQJt5vKLcfIlKaPKNLZCw
         f1YUPVNs3vQ6oB+ZixScG4O69Ednv6JDL29cLhEI=
Date:   Wed, 9 Jun 2021 11:42:53 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Peter Chen <peter.chen@kernel.org>, balbi@kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] usb: dwc3: core: fix kernel panic when do reboot
Message-ID: <YMCNHRLfLPqUhHtu@kroah.com>
References: <20210608105656.10795-1-peter.chen@kernel.org>
 <20210608164933.GA2601@jackp-linux.qualcomm.com>
 <YMCDU+qoShVvJCGK@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMCDU+qoShVvJCGK@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 09, 2021 at 11:01:07AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Jun 08, 2021 at 09:50:01AM -0700, Jack Pham wrote:
> > Hi Peter,
> > 
> > On Tue, Jun 08, 2021 at 06:56:56PM +0800, Peter Chen wrote:
> > > When do system reboot, it calls dwc3_shutdown and the whole debugfs
> > > for dwc3 has removed first, when the gadget tries to do deinit, and
> > > remove debugfs for its endpoints, it meets NULL pointer dereference
> > > issue when call debugfs_lookup. Fix it by removing the whole dwc3
> > > debugfs later than dwc3_drd_exit.
> > 
> > Ouch, thanks for catching this! I think in your previous reply[1] you
> > did warn about the debugfs_remove_recursive() getting called twice, but
> > it seems here the issue is due to the debugfs_lookup() getting called on
> > a stale dwc->root pointer after it was already removed.
> 
> We can also fix this by getting rid of that "root" pointer as it's
> useless (we can look it up if we need it.)  I'll send a patch later to
> do that, as it's a good idea to do anyway, and is independant of this
> fix.

Now sent:
	https://lore.kernel.org/r/20210609093924.3293230-1-gregkh@linuxfoundation.org
