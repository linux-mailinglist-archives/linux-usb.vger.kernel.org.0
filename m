Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1A3535C44A
	for <lists+linux-usb@lfdr.de>; Mon, 12 Apr 2021 12:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239601AbhDLKo6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Apr 2021 06:44:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:49320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237538AbhDLKo5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Apr 2021 06:44:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E480E61352;
        Mon, 12 Apr 2021 10:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618224279;
        bh=+YrGKXDPxOP5l2OFGkMMpN35U6A20ljdJWuZhJyoq/4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ol2w3eLAiPi36m7/Y6EDUIxJ91cMB/XkAHVHnldhNf6l0dOuc7NiRgaIJUIRp2akJ
         rA384hv0b8pgI0mJqY4c+RAQL1JHrmui4ILSMNYrSj9N3GywJ/PmCcHvResKCCfA1e
         A9AocRFSfj8j0s9PyWdNCxIqm6wtSe1XyG3Ulbc3tK6e/JwVudHxwGCYYIgylqWrF/
         I++XZyHmOXdBgHxZbO6tOSWzKPSKqHpJtpiUeg+CBE3LGdWG7qr9LotdCHK1r6i4Nf
         7husikk2MJ8aNscNcrGjvIH+QZRc3C4yVTU8peKX7jzGAlfobBVD3S6o+OuhqrTJ3F
         cxNQ/tKP/Zh1A==
Date:   Mon, 12 Apr 2021 18:44:35 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] usb: changes for v5.13-rc1
Message-ID: <20210412104435.GA19075@nchen>
References: <20210411223542.GA26127@b29397-desktop>
 <YHQXTbim32F0etan@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHQXTbim32F0etan@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21-04-12 11:47:57, Greg KH wrote:
> On Mon, Apr 12, 2021 at 06:35:43AM +0800, Peter Chen wrote:
> > The following changes since commit 5e17812c22bcd65fa9202595eef4bbf8fa814144:
> > 
> >   usb: dwc3: document usb_psy in struct dwc3 (2021-03-03 11:09:29 +0100)
> > 
> > are available in the Git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-v5.13-rc1
> > 
> > for you to fetch changes up to 6ef82c8acf5ca40d8912947696e9d52956a03cec:
> > 
> >   usb: cdnsp: Fixes issue with Configure Endpoint command (2021-04-10 09:10:44 +0800)
> > 
> > ----------------------------------------------------------------
> > Several Cadence3 improvements are introduced in v5.13-rc1:
> > - Add recovery during resume if the controller was lost power at system suspend
> > - Reduce DMA memory footprint
> > - Other small improvements
> > 
> > ----------------------------------------------------------------
> > Colin Ian King (1):
> >       usb: cdnsp: remove redundant initialization of variable ret
> > 
> > Dmitry Osipenko (1):
> >       usb: chipidea: tegra: Silence deferred probe error
> > 
> > Frank Li (3):
> >       usb: cdns3: add power lost support for system resume
> >       usb: cdns3: imx: add power lost support for system resume
> >       usb: cdns3: fix static checker warning.
> > 
> > Pawel Laszczak (1):
> >       usb: cdnsp: Fixes issue with Configure Endpoint command
> > 
> > Peter Chen (1):
> >       usb: cdns3: trace: delete the trace parameter for request->trb
> > 
> > Sanket Parmar (2):
> >       usb: cdns3: Use dma_pool_* api to alloc trb pool
> >       usb: cdns3: Optimize DMA request buffer allocation
> > 
> > Wang Qing (1):
> >       usb: cdns3: delete repeated clear operations
> > 
> > Wei Yongjun (1):
> >       usb: cdns3: imx: mark cdns_imx_system_resume as __maybe_unused
> > 
> >  drivers/usb/cdns3/cdns3-gadget.c     | 73 ++++++++++++++++++++++--------------
> >  drivers/usb/cdns3/cdns3-gadget.h     |  3 ++
> >  drivers/usb/cdns3/cdns3-imx.c        | 34 +++++++++++++++++
> >  drivers/usb/cdns3/cdns3-plat.c       | 23 +++++++++++-
> >  drivers/usb/cdns3/cdns3-trace.h      |  5 +--
> >  drivers/usb/cdns3/cdnsp-gadget.c     | 17 ++++++---
> >  drivers/usb/cdns3/cdnsp-gadget.h     |  1 +
> >  drivers/usb/cdns3/cdnsp-mem.c        |  3 +-
> >  drivers/usb/cdns3/core.c             | 29 +++++++++++++-
> >  drivers/usb/cdns3/drd.c              | 15 ++++++++
> >  drivers/usb/cdns3/drd.h              |  2 +-
> >  drivers/usb/chipidea/ci_hdrc_tegra.c |  8 ++--
> >  12 files changed, 165 insertions(+), 48 deletions(-)
> 
> 
> This merge is odd, why am I getting merge conflicts in:
> 	drivers/usb/dwc3/gadget.c
> 	drivers/usb/typec/tipd/core.c
> 
> when I pull this?
> 
> According to the above there should not be any changes in those files.
> 
> When I resolve those conflicts, I get a _lot_ of additional patches in
> this branch than you list here.
> 
> How did you create this pull request?  What branch of mine is it
> against?
> 

Sorry about that, my branch was checkout from your usb-next at early of this
release cycle, it seems your branch may forced update. I will apply the patches
on top of v5.12-rc1, and re-send the pull request.

-- 

Thanks,
Peter Chen

