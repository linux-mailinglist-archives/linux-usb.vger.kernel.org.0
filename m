Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 053C93A430C
	for <lists+linux-usb@lfdr.de>; Fri, 11 Jun 2021 15:30:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbhFKNca (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Jun 2021 09:32:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:36838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229484AbhFKNc3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 11 Jun 2021 09:32:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DDC57613EE;
        Fri, 11 Jun 2021 13:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623418218;
        bh=ONKFZKiuUHMMLW0KxHUSyFfj4X/4LS1TPoynmBOBeAY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HlQndGABo0VuQFOIqxmbiSRqwgbTj9HOrLTfHaqTFKUUNfP/TIGs5l+cEJ/8u068x
         qtYPlQWe+2WagCMPtFd3jZ+BpkIqKkN2m4DUb9lZkJSN6b6NOVLf1BuvheV16pbOzY
         V55xJsNOYJseKxpra4BgX5UnV/B9TwW0ZxSYq7Do=
Date:   Fri, 11 Jun 2021 15:30:15 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Peter Chen <peter.chen@kernel.org>,
        Jack Pham <jackp@codeaurora.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] usb: dwc3: core: fix kernel panic when do reboot
Message-ID: <YMNlZ1gg0kuSyaEG@kroah.com>
References: <20210608105656.10795-1-peter.chen@kernel.org>
 <20210608164933.GA2601@jackp-linux.qualcomm.com>
 <YMCDU+qoShVvJCGK@kroah.com>
 <YMCNHRLfLPqUhHtu@kroah.com>
 <20210610020047.GB6592@nchen>
 <YMGzCWCI1R9jvaor@kroah.com>
 <20210610135822.GA7839@Peter>
 <87lf7gzg9d.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87lf7gzg9d.fsf@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 11, 2021 at 04:23:58PM +0300, Felipe Balbi wrote:
> Peter Chen <peter.chen@kernel.org> writes:
> 
> > On 21-06-10 08:36:57, Greg Kroah-Hartman wrote:
> >> On Thu, Jun 10, 2021 at 10:00:47AM +0800, Peter Chen wrote:
> >> > On 21-06-09 11:42:53, Greg Kroah-Hartman wrote:
> >> > > On Wed, Jun 09, 2021 at 11:01:07AM +0200, Greg Kroah-Hartman wrote:
> >> > > > On Tue, Jun 08, 2021 at 09:50:01AM -0700, Jack Pham wrote:
> >> > > > > Hi Peter,
> >> > > > > 
> >> > > > > On Tue, Jun 08, 2021 at 06:56:56PM +0800, Peter Chen wrote:
> >> > > > > > When do system reboot, it calls dwc3_shutdown and the whole debugfs
> >> > > > > > for dwc3 has removed first, when the gadget tries to do deinit, and
> >> > > > > > remove debugfs for its endpoints, it meets NULL pointer dereference
> >> > > > > > issue when call debugfs_lookup. Fix it by removing the whole dwc3
> >> > > > > > debugfs later than dwc3_drd_exit.
> >> > > > > 
> >> > > > > Ouch, thanks for catching this! I think in your previous reply[1] you
> >> > > > > did warn about the debugfs_remove_recursive() getting called twice, but
> >> > > > > it seems here the issue is due to the debugfs_lookup() getting called on
> >> > > > > a stale dwc->root pointer after it was already removed.
> >> > > > 
> >> > > > We can also fix this by getting rid of that "root" pointer as it's
> >> > > > useless (we can look it up if we need it.)  I'll send a patch later to
> >> > > > do that, as it's a good idea to do anyway, and is independant of this
> >> > > > fix.
> >> > > 
> >> > > Now sent:
> >> > > 	https://lore.kernel.org/r/20210609093924.3293230-1-gregkh@linuxfoundation.org
> >> > 
> >> > Hi Felipe,
> >> > 
> >> > With Greg above patch, this issue is fixed indirectly. I don't think my patch is
> >> > needed, do you think so?
> >> 
> >> Which patch is "your patch" here?
> >> 
> >
> > The patch in this thread.
> 
> This one, Greg:
> https://lore.kernel.org/r/20210609093924.3293230-1-gregkh@linuxfoundation.org
> 
> Now that we have that, I don't think $subject is required.

I don't think it's needed to revert, it's all "safer" this way...

thanks,

greg k-h
