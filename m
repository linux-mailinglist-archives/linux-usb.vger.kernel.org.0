Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 542F4EE399
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2019 16:21:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728957AbfKDPVq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Nov 2019 10:21:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:38558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728321AbfKDPVq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 4 Nov 2019 10:21:46 -0500
Received: from localhost (unknown [62.119.166.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9B94C20663;
        Mon,  4 Nov 2019 15:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572880905;
        bh=sg5dT/hM9HxTQaKTT2GqaxrLB/jPU0eG8cq/6ASgY20=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CRi+kBi0s8dssB27kX/mgcmUq36pRtWgiNY1ITuGYWvzLBu7QccctZi/upjVAios8
         I7Rh78GBKAmBb2yNPHQYbiAwWZmhqwjIhmZy9ZB936v1XVun0VIs7gYBIQpr+1t8eR
         mJuvnTl6b9tcif4JaIOH5aUzx8rdt46bMYeccPKI=
Date:   Mon, 4 Nov 2019 16:21:41 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Peter Robinson <pbrobinson@gmail.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] usb: host: xhci-tegra: set MODULE_FIRMWARE for tegra186
Message-ID: <20191104152141.GA2252233@kroah.com>
References: <20191102172606.26934-1-pbrobinson@gmail.com>
 <20191104145656.GA2210975@kroah.com>
 <CALeDE9PJVLnRvCDTNQcC9jNKGZL0Vo9d0xRrMzcSP8TEaNcS8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALeDE9PJVLnRvCDTNQcC9jNKGZL0Vo9d0xRrMzcSP8TEaNcS8w@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 04, 2019 at 03:07:48PM +0000, Peter Robinson wrote:
> On Mon, Nov 4, 2019 at 2:57 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Sat, Nov 02, 2019 at 05:26:06PM +0000, Peter Robinson wrote:
> > > Set the MODULE_FIRMWARE for tegra186, it's registered for 124/210 and
> > > ensures the firmware is available at the appropriate time such as in
> > > the initrd, else if the firmware is unavailable the driver fails with
> > > the following errors:
> > >
> > > tegra-xusb 3530000.usb: Direct firmware load for nvidia/tegra186/xusb.bin failed with error -2
> > > tegra-xusb 3530000.usb: failed to request firmware: -2
> > > tegra-xusb 3530000.usb: failed to load firmware: -2
> > > tegra-xusb: probe of 3530000.usb failed with error -2
> > >
> > > Fixes: 5f9be5f3f899 ("usb: host: xhci-tegra: Add Tegra186 XUSB support")
> > > Fixes: 488a04d4bb2f ("arm64: tegra: Enable XUSB host controller on Jetson TX2")
> >
> > There is no such git id in Linus's tree :(
> 
> Tha'ts in the tegra tree for 5.5.
> 
> > This also doesn't apply cleanly to the usb tree, so I don't know where
> > you want it to go, sorry.
> 
> Where is that? I can rebase against it, I'm guessing the tegra194 bits landed.

usb.git on git.kernel.org.

And yes, it did.  But when I applied the above patch, my checks for
valid fixes: ids failed so I can't take this as-is.

thanks,

greg k-h
