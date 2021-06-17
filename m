Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DBDF3AADAE
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jun 2021 09:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbhFQHf7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Jun 2021 03:35:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:35142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229671AbhFQHf7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 17 Jun 2021 03:35:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 755C8613BF;
        Thu, 17 Jun 2021 07:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623915231;
        bh=e0dTk0UmjtFeAbeEuEzO0gx3iCG50pAukyBm3WrLBC8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cDJtoGEQ0dxA5/41yk/ObY7cbE9L0QVbOTZ59ZQpN/KbHZAHk/DDxWT/DnYrjlHVv
         ZR0UAkWLxrkBLltPFjT02SIXckHkJLI3Gskn6qE0m9s0hpR4GFuGxzgzLXxYBPLhcr
         VXW/X1Gtnoco2z//YpWULGSJsGRGz63xruCzatKM=
Date:   Thu, 17 Jun 2021 09:33:49 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Jack Pham <jackp@codeaurora.org>,
        Peter Chen <peter.chen@kernel.org>
Subject: Re: [PATCH] usb: dwc3: Fix debugfs creation flow
Message-ID: <YMr63WwtOJkc5YhH@kroah.com>
References: <7f5167c67cd95102b2acab967d19af7962415a66.1623906350.git.Minas.Harutyunyan@synopsys.com>
 <YMrnaS0EcVQpNpXH@kroah.com>
 <e68070dd-84b0-efdc-78dd-9035b7e911c8@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e68070dd-84b0-efdc-78dd-9035b7e911c8@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 17, 2021 at 07:11:33AM +0000, Minas Harutyunyan wrote:
> Hi Greg,
> 
> On 6/17/2021 10:10 AM, Greg Kroah-Hartman wrote:
> > On Wed, Jun 16, 2021 at 10:56:02PM -0700, Minas Harutyunyan wrote:
> >> Creation EP's debugfs called earlier than debugfs folder for dwc3
> >> device created. As result EP's debugfs are created in '/sys/kernel/debug'
> >> instead of '/sys/kernel/debug/usb/dwc3.1.auto'.
> >>
> >> Moved dwc3_debugfs_init() function call before calling
> >> dwc3_core_init_mode() to allow create dwc3 debugfs parent before
> >> creating EP's debugfs's.
> >>
> >> Fixes: 8562d5bfc0fc ("USB: dwc3: remove debugfs root dentry storage")
> >> Signed-off-by: Minas Harutyunyan <hminas@synopsys.com>
> >> ---
> >>   drivers/usb/dwc3/core.c | 3 ++-
> >>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> >> index e0a8e796c158..ba74ad7f6995 100644
> >> --- a/drivers/usb/dwc3/core.c
> >> +++ b/drivers/usb/dwc3/core.c
> >> @@ -1620,17 +1620,18 @@ static int dwc3_probe(struct platform_device *pdev)
> >>   	}
> >>   
> >>   	dwc3_check_params(dwc);
> >> +	dwc3_debugfs_init(dwc);
> >>   
> >>   	ret = dwc3_core_init_mode(dwc);
> >>   	if (ret)
> >>   		goto err5;
> >>   
> >> -	dwc3_debugfs_init(dwc);
> >>   	pm_runtime_put(dev);
> >>   
> >>   	return 0;
> >>   
> >>   err5:
> >> +	dwc3_debugfs_exit(dwc);
> >>   	dwc3_event_buffers_cleanup(dwc);
> >>   
> >>   	usb_phy_shutdown(dwc->usb2_phy);
> >>
> >> base-commit: 1da8116eb0c5dfc05cfb89896239badb18c4daf3
> > 
> > I thought we fixed this already in usb-next and usb-linus, right?  Where
> > are you seeing this problem happening?
> 
> I faced this issue on 5.13.0-rc6. Patch "USB: dwc3: remove debugfs root 
> dentry storage" introduced this issue, because of debugfs_lookup() 
> function. I don't see any fix in usb-next.

4bf584a03eec ("usb: dwc3: core: fix kernel panic when do reboot") in
linux-next "should" solve this issue.  Or it was supposed to.  I
thought.  I'm getting confused about this problem these days...

The commit you reference above in the fixes line is NOT in 5.13-rc6, so
how can this commit fix a problem in 5.13-rc6?

still confused,

greg k-h
