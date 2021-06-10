Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 651023A2D94
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jun 2021 15:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbhFJOAX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Jun 2021 10:00:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:59416 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230394AbhFJOAX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Jun 2021 10:00:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8FD53613E9;
        Thu, 10 Jun 2021 13:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623333506;
        bh=o++3xiZX3nMKu7aNY5ckTg0Ma0hfr6symUJjbkUzZ+U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PnXVFEttj/jz1gHw7etoLfFBOTe/Lc7wtUnngDaV+3ELMy2jHpJ4v7/GXTjtN+T0D
         OKQgNjnCBmXaQiFK47fXeXzNwnYqhOo2Y9rp45oSi7Ev4QMRmGGnYZWNgGsJNaw4Qj
         BPw/QyJSjOn3LkocSqfIILTVemS0FgTlV7wFvssguapHp21D7HeCHRP3ClkOK7tqL2
         mE/tlTpKQNQ+17rh61QQf8qTb8qkqofA6NPSeu8ZeSLLWmgzr6NYDmA58NnspYsAZV
         JPP0xDeVWXiRw4vxfgMTzC7fUj5bJru04wXB8GS1PLHMnFYa2dq1sScIZqYjYfSw0r
         nkKXg+XPNwHcw==
Date:   Thu, 10 Jun 2021 21:58:22 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     balbi@kernel.org, Jack Pham <jackp@codeaurora.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] usb: dwc3: core: fix kernel panic when do reboot
Message-ID: <20210610135822.GA7839@Peter>
References: <20210608105656.10795-1-peter.chen@kernel.org>
 <20210608164933.GA2601@jackp-linux.qualcomm.com>
 <YMCDU+qoShVvJCGK@kroah.com>
 <YMCNHRLfLPqUhHtu@kroah.com>
 <20210610020047.GB6592@nchen>
 <YMGzCWCI1R9jvaor@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMGzCWCI1R9jvaor@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21-06-10 08:36:57, Greg Kroah-Hartman wrote:
> On Thu, Jun 10, 2021 at 10:00:47AM +0800, Peter Chen wrote:
> > On 21-06-09 11:42:53, Greg Kroah-Hartman wrote:
> > > On Wed, Jun 09, 2021 at 11:01:07AM +0200, Greg Kroah-Hartman wrote:
> > > > On Tue, Jun 08, 2021 at 09:50:01AM -0700, Jack Pham wrote:
> > > > > Hi Peter,
> > > > > 
> > > > > On Tue, Jun 08, 2021 at 06:56:56PM +0800, Peter Chen wrote:
> > > > > > When do system reboot, it calls dwc3_shutdown and the whole debugfs
> > > > > > for dwc3 has removed first, when the gadget tries to do deinit, and
> > > > > > remove debugfs for its endpoints, it meets NULL pointer dereference
> > > > > > issue when call debugfs_lookup. Fix it by removing the whole dwc3
> > > > > > debugfs later than dwc3_drd_exit.
> > > > > 
> > > > > Ouch, thanks for catching this! I think in your previous reply[1] you
> > > > > did warn about the debugfs_remove_recursive() getting called twice, but
> > > > > it seems here the issue is due to the debugfs_lookup() getting called on
> > > > > a stale dwc->root pointer after it was already removed.
> > > > 
> > > > We can also fix this by getting rid of that "root" pointer as it's
> > > > useless (we can look it up if we need it.)  I'll send a patch later to
> > > > do that, as it's a good idea to do anyway, and is independant of this
> > > > fix.
> > > 
> > > Now sent:
> > > 	https://lore.kernel.org/r/20210609093924.3293230-1-gregkh@linuxfoundation.org
> > 
> > Hi Felipe,
> > 
> > With Greg above patch, this issue is fixed indirectly. I don't think my patch is
> > needed, do you think so?
> 
> Which patch is "your patch" here?
> 

The patch in this thread.

-- 

Thanks,
Peter Chen

