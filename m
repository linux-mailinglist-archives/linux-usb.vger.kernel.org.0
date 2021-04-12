Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC1935C2F0
	for <lists+linux-usb@lfdr.de>; Mon, 12 Apr 2021 12:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241985AbhDLJxQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Apr 2021 05:53:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:35164 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241228AbhDLJsR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Apr 2021 05:48:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D9B1D61247;
        Mon, 12 Apr 2021 09:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1618220879;
        bh=Sv7T5I8/UX+7jDAth4jLxipY43qcI2skgjAzxs03C2c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vHvRcDr31WTUDSfbaKf3PTKCxyU4ZBeOtakpH06y9ae0vrvGWDEp3kpI/1BIf472k
         TmJmwTJ8Vj9+hkvoZ6oOWEmd3E/vhnJZXMGiKdr0DNv5amZ0atfXhZzT2omfeH4our
         BdrMi+gYje3Ad0VAhSqB3PAKtqCws5IfnrjX7JLY=
Date:   Mon, 12 Apr 2021 11:47:57 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] usb: changes for v5.13-rc1
Message-ID: <YHQXTbim32F0etan@kroah.com>
References: <20210411223542.GA26127@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210411223542.GA26127@b29397-desktop>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 12, 2021 at 06:35:43AM +0800, Peter Chen wrote:
> The following changes since commit 5e17812c22bcd65fa9202595eef4bbf8fa814144:
> 
>   usb: dwc3: document usb_psy in struct dwc3 (2021-03-03 11:09:29 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-v5.13-rc1
> 
> for you to fetch changes up to 6ef82c8acf5ca40d8912947696e9d52956a03cec:
> 
>   usb: cdnsp: Fixes issue with Configure Endpoint command (2021-04-10 09:10:44 +0800)
> 
> ----------------------------------------------------------------
> Several Cadence3 improvements are introduced in v5.13-rc1:
> - Add recovery during resume if the controller was lost power at system suspend
> - Reduce DMA memory footprint
> - Other small improvements
> 
> ----------------------------------------------------------------
> Colin Ian King (1):
>       usb: cdnsp: remove redundant initialization of variable ret
> 
> Dmitry Osipenko (1):
>       usb: chipidea: tegra: Silence deferred probe error
> 
> Frank Li (3):
>       usb: cdns3: add power lost support for system resume
>       usb: cdns3: imx: add power lost support for system resume
>       usb: cdns3: fix static checker warning.
> 
> Pawel Laszczak (1):
>       usb: cdnsp: Fixes issue with Configure Endpoint command
> 
> Peter Chen (1):
>       usb: cdns3: trace: delete the trace parameter for request->trb
> 
> Sanket Parmar (2):
>       usb: cdns3: Use dma_pool_* api to alloc trb pool
>       usb: cdns3: Optimize DMA request buffer allocation
> 
> Wang Qing (1):
>       usb: cdns3: delete repeated clear operations
> 
> Wei Yongjun (1):
>       usb: cdns3: imx: mark cdns_imx_system_resume as __maybe_unused
> 
>  drivers/usb/cdns3/cdns3-gadget.c     | 73 ++++++++++++++++++++++--------------
>  drivers/usb/cdns3/cdns3-gadget.h     |  3 ++
>  drivers/usb/cdns3/cdns3-imx.c        | 34 +++++++++++++++++
>  drivers/usb/cdns3/cdns3-plat.c       | 23 +++++++++++-
>  drivers/usb/cdns3/cdns3-trace.h      |  5 +--
>  drivers/usb/cdns3/cdnsp-gadget.c     | 17 ++++++---
>  drivers/usb/cdns3/cdnsp-gadget.h     |  1 +
>  drivers/usb/cdns3/cdnsp-mem.c        |  3 +-
>  drivers/usb/cdns3/core.c             | 29 +++++++++++++-
>  drivers/usb/cdns3/drd.c              | 15 ++++++++
>  drivers/usb/cdns3/drd.h              |  2 +-
>  drivers/usb/chipidea/ci_hdrc_tegra.c |  8 ++--
>  12 files changed, 165 insertions(+), 48 deletions(-)


This merge is odd, why am I getting merge conflicts in:
	drivers/usb/dwc3/gadget.c
	drivers/usb/typec/tipd/core.c

when I pull this?

According to the above there should not be any changes in those files.

When I resolve those conflicts, I get a _lot_ of additional patches in
this branch than you list here.

How did you create this pull request?  What branch of mine is it
against?

confused,

greg k-h
