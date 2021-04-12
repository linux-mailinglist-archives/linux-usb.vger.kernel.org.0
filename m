Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC2EB35C7C1
	for <lists+linux-usb@lfdr.de>; Mon, 12 Apr 2021 15:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241769AbhDLNfr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Apr 2021 09:35:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:42636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240002AbhDLNfr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Apr 2021 09:35:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 828A36128B;
        Mon, 12 Apr 2021 13:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618234529;
        bh=YIEx3JhhzLZZ6tTvWYdf6OStbkUH2uiK/OxAzsDU/3Q=;
        h=Date:From:To:Cc:Subject:From;
        b=iSkm3NJjtV6aLeEEd7SND9fHMOk5AOBEouYyIivCrOZdeTyHZPu32GpH9aTFYJWos
         Ps6NzjnbNCJtsXN1jjdncHFf4pSxoSh0aiIdi+Yhy5m9BeMEq7PzV4/d6R2Uyo4Pal
         eezdxGA5+Ay3Rcl63g3ChAMyvNms5eNKtFGaM2kwqMx1SUu3swgyFTaqF2LEAthIVx
         XZ3PSUaD9M6n0F8vfBUqviEuHxumiul1ghHZvt1pN2mG4y73kwMkRe5oswz03pa3mS
         /dpGE5pjyA8Ol1WC10YrEWpgaFndXLnbRF26UsNrtyp8YjfJOCu6YnBWeF05YvsDr6
         W3PDCe6n5xs7w==
Date:   Mon, 12 Apr 2021 21:35:22 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: usb: changes for v5.13-rc1
Message-ID: <20210412133522.GB15190@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit 14d34d2dbbe2d9144a65bae1549202d1717062e2:

  Merge 5.12-rc7 into usb-next (2021-04-12 08:15:27 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-v5.13-rc1

for you to fetch changes up to 10076de33b5ed5b1e049593a611d2fd9eba60565:

  usb: cdnsp: Fixes issue with Configure Endpoint command (2021-04-12 20:19:23 +0800)

----------------------------------------------------------------
Several Cadence3 improvements are introduced in v5.13-rc1:
- Add recovery during resume if the controller was lost power at system suspend
- Reduce DMA memory footprint
- Other small improvements

----------------------------------------------------------------
Colin Ian King (1):
      usb: cdnsp: remove redundant initialization of variable ret

Frank Li (3):
      usb: cdns3: add power lost support for system resume
      usb: cdns3: imx: add power lost support for system resume
      usb: cdns3: fix static checker warning.

Pawel Laszczak (1):
      usb: cdnsp: Fixes issue with Configure Endpoint command

Peter Chen (1):
      usb: cdns3: trace: delete the trace parameter for request->trb

Sanket Parmar (2):
      usb: cdns3: Use dma_pool_* api to alloc trb pool
      usb: cdns3: Optimize DMA request buffer allocation

Wang Qing (1):
      usb: cdns3: delete repeated clear operations

Wei Yongjun (1):
      usb: cdns3: imx: mark cdns_imx_system_resume as __maybe_unused

 drivers/usb/cdns3/cdns3-gadget.c | 73 ++++++++++++++++++++++++----------------
 drivers/usb/cdns3/cdns3-gadget.h |  3 ++
 drivers/usb/cdns3/cdns3-imx.c    | 34 +++++++++++++++++++
 drivers/usb/cdns3/cdns3-plat.c   | 23 ++++++++++++-
 drivers/usb/cdns3/cdns3-trace.h  |  5 +--
 drivers/usb/cdns3/cdnsp-gadget.c | 17 +++++++---
 drivers/usb/cdns3/cdnsp-gadget.h |  1 +
 drivers/usb/cdns3/cdnsp-mem.c    |  3 +-
 drivers/usb/cdns3/core.c         | 29 +++++++++++++++-
 drivers/usb/cdns3/drd.c          | 15 +++++++++
 drivers/usb/cdns3/drd.h          |  2 +-
 11 files changed, 162 insertions(+), 43 deletions(-)

-- 

Thanks,
Peter Chen

