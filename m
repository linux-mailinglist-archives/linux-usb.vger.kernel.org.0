Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77F353A0F37
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jun 2021 11:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233930AbhFIJDX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Jun 2021 05:03:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:49644 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231919AbhFIJDV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Jun 2021 05:03:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C925A61182;
        Wed,  9 Jun 2021 09:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623229270;
        bh=QY9p7QigWQvKh0dZh2qPkN32nYvRy2rehUvJ5ev1hT4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JVIWJpu0fo5rKal/RoOce324EqW8gZNwfqhaF/V1jTUN/6MbjMIJI5DBV2s6U+PfS
         vk8n4SxbZzaPUH9uF22fEIuPb5OS0/zuc15Jg5oHaTNtZQdEM08enZREIS8zX7IF/k
         9U+alHBTR4avIiwgvTfLKZ8rO6riEW6SdFWriXHM=
Date:   Wed, 9 Jun 2021 11:01:07 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Peter Chen <peter.chen@kernel.org>, balbi@kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] usb: dwc3: core: fix kernel panic when do reboot
Message-ID: <YMCDU+qoShVvJCGK@kroah.com>
References: <20210608105656.10795-1-peter.chen@kernel.org>
 <20210608164933.GA2601@jackp-linux.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608164933.GA2601@jackp-linux.qualcomm.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 08, 2021 at 09:50:01AM -0700, Jack Pham wrote:
> Hi Peter,
> 
> On Tue, Jun 08, 2021 at 06:56:56PM +0800, Peter Chen wrote:
> > When do system reboot, it calls dwc3_shutdown and the whole debugfs
> > for dwc3 has removed first, when the gadget tries to do deinit, and
> > remove debugfs for its endpoints, it meets NULL pointer dereference
> > issue when call debugfs_lookup. Fix it by removing the whole dwc3
> > debugfs later than dwc3_drd_exit.
> 
> Ouch, thanks for catching this! I think in your previous reply[1] you
> did warn about the debugfs_remove_recursive() getting called twice, but
> it seems here the issue is due to the debugfs_lookup() getting called on
> a stale dwc->root pointer after it was already removed.

We can also fix this by getting rid of that "root" pointer as it's
useless (we can look it up if we need it.)  I'll send a patch later to
do that, as it's a good idea to do anyway, and is independant of this
fix.

thanks,

greg k-h
