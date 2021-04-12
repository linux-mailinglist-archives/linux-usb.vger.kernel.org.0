Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14AC735C47F
	for <lists+linux-usb@lfdr.de>; Mon, 12 Apr 2021 12:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239751AbhDLK5N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Apr 2021 06:57:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:51386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239267AbhDLK5K (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Apr 2021 06:57:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 42F9361029;
        Mon, 12 Apr 2021 10:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1618225012;
        bh=AcHeuOp8CpWi6y8UuhWCRLyNaPymwNrie3AzyJkbiH4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Er/sjQt5CTKlWJUmhSuOfJozF8hnuFWM92ipVk6JFyIVrp7AvVi+TIO4T2LvSoAU1
         Wpgx8/oc4CQtwwgMiTqc03rBvoaiydA/QZmXekaISb29Ur2HEPb39USoMusnM6Mo26
         UVWIe8xLo7yNDOzOxnGftVqmEb0ppk6KEw4F1FSU=
Date:   Mon, 12 Apr 2021 12:56:50 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] usb: changes for v5.13-rc1
Message-ID: <YHQncvIxUx9icfw2@kroah.com>
References: <20210411223542.GA26127@b29397-desktop>
 <YHQXTbim32F0etan@kroah.com>
 <20210412104435.GA19075@nchen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412104435.GA19075@nchen>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 12, 2021 at 06:44:35PM +0800, Peter Chen wrote:
> On 21-04-12 11:47:57, Greg KH wrote:
> > On Mon, Apr 12, 2021 at 06:35:43AM +0800, Peter Chen wrote:
> > > The following changes since commit 5e17812c22bcd65fa9202595eef4bbf8fa814144:
> > > 
> > >   usb: dwc3: document usb_psy in struct dwc3 (2021-03-03 11:09:29 +0100)
> > > 
> > > are available in the Git repository at:
> > > 
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-v5.13-rc1
> > > 
> > > for you to fetch changes up to 6ef82c8acf5ca40d8912947696e9d52956a03cec:
> > > 
> > >   usb: cdnsp: Fixes issue with Configure Endpoint command (2021-04-10 09:10:44 +0800)
> > > 
> > > ----------------------------------------------------------------
> > > Several Cadence3 improvements are introduced in v5.13-rc1:
> > > - Add recovery during resume if the controller was lost power at system suspend
> > > - Reduce DMA memory footprint
> > > - Other small improvements
> > > 
> > > ----------------------------------------------------------------
> > > Colin Ian King (1):
> > >       usb: cdnsp: remove redundant initialization of variable ret
> > > 
> > > Dmitry Osipenko (1):
> > >       usb: chipidea: tegra: Silence deferred probe error
> > > 
> > > Frank Li (3):
> > >       usb: cdns3: add power lost support for system resume
> > >       usb: cdns3: imx: add power lost support for system resume
> > >       usb: cdns3: fix static checker warning.
> > > 
> > > Pawel Laszczak (1):
> > >       usb: cdnsp: Fixes issue with Configure Endpoint command
> > > 
> > > Peter Chen (1):
> > >       usb: cdns3: trace: delete the trace parameter for request->trb
> > > 
> > > Sanket Parmar (2):
> > >       usb: cdns3: Use dma_pool_* api to alloc trb pool
> > >       usb: cdns3: Optimize DMA request buffer allocation
> > > 
> > > Wang Qing (1):
> > >       usb: cdns3: delete repeated clear operations
> > > 
> > > Wei Yongjun (1):
> > >       usb: cdns3: imx: mark cdns_imx_system_resume as __maybe_unused
> > > 
> > >  drivers/usb/cdns3/cdns3-gadget.c     | 73 ++++++++++++++++++++++--------------
> > >  drivers/usb/cdns3/cdns3-gadget.h     |  3 ++
> > >  drivers/usb/cdns3/cdns3-imx.c        | 34 +++++++++++++++++
> > >  drivers/usb/cdns3/cdns3-plat.c       | 23 +++++++++++-
> > >  drivers/usb/cdns3/cdns3-trace.h      |  5 +--
> > >  drivers/usb/cdns3/cdnsp-gadget.c     | 17 ++++++---
> > >  drivers/usb/cdns3/cdnsp-gadget.h     |  1 +
> > >  drivers/usb/cdns3/cdnsp-mem.c        |  3 +-
> > >  drivers/usb/cdns3/core.c             | 29 +++++++++++++-
> > >  drivers/usb/cdns3/drd.c              | 15 ++++++++
> > >  drivers/usb/cdns3/drd.h              |  2 +-
> > >  drivers/usb/chipidea/ci_hdrc_tegra.c |  8 ++--
> > >  12 files changed, 165 insertions(+), 48 deletions(-)
> > 
> > 
> > This merge is odd, why am I getting merge conflicts in:
> > 	drivers/usb/dwc3/gadget.c
> > 	drivers/usb/typec/tipd/core.c
> > 
> > when I pull this?
> > 
> > According to the above there should not be any changes in those files.
> > 
> > When I resolve those conflicts, I get a _lot_ of additional patches in
> > this branch than you list here.
> > 
> > How did you create this pull request?  What branch of mine is it
> > against?
> > 
> 
> Sorry about that, my branch was checkout from your usb-next at early of this
> release cycle, it seems your branch may forced update. I will apply the patches
> on top of v5.12-rc1, and re-send the pull request.

Ah, yeah, that's the problem here.

And no, stay away from v5.12-rc1, that's why I had to rebase, you never
want to allow a user to bisect back to that point if at all possible.
Please just use 5.12-rc7 if you are going to rebase.

thanks,

greg k-h
