Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11D1F35B73D
	for <lists+linux-usb@lfdr.de>; Mon, 12 Apr 2021 00:35:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235744AbhDKWgJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 11 Apr 2021 18:36:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:37434 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235229AbhDKWgI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 11 Apr 2021 18:36:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A3DE3611C9;
        Sun, 11 Apr 2021 22:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618180551;
        bh=x8mqF0WInvK9OfwQO1hcFmDU9JRYJGc/cWWpiaVohCA=;
        h=Date:From:To:Cc:Subject:From;
        b=nbpiOb+KW6T8Yu6cc003grDvaAVARJCsHQlIZ1Z2jglvU+g5bGCj+ZjtFNDxSrJPz
         Kb4EPbq6cR6qviN4N5nXIol9fgqh5YPgo9PIG5d+eIf9bzpwKN4I02ZikS7VwBDgZb
         jK3R3DqzuzCskYiJNfPqeFyASQkXephq/EKDApXKvzxiSOVmIDj3BYp/4CElVn3uQ6
         5vTXt5se2uf6uwMvKcDRnsFa6uDnRvdzNwLbZqDO7QT8Apr0qdIN4ddkVpwofCUgWe
         fJSogBfscHALhWgBN4OtbkPeyP7jNEHNOK6ilDsIL/uBLUYAA3sYzDJcXeyeg3J1rx
         cE5oLQt/UYBAg==
Date:   Mon, 12 Apr 2021 06:35:43 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] usb: changes for v5.13-rc1
Message-ID: <20210411223542.GA26127@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit 5e17812c22bcd65fa9202595eef4bbf8fa814144:

  usb: dwc3: document usb_psy in struct dwc3 (2021-03-03 11:09:29 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-v5.13-rc1

for you to fetch changes up to 6ef82c8acf5ca40d8912947696e9d52956a03cec:

  usb: cdnsp: Fixes issue with Configure Endpoint command (2021-04-10 09:10:44 +0800)

----------------------------------------------------------------
Several Cadence3 improvements are introduced in v5.13-rc1:
- Add recovery during resume if the controller was lost power at system suspend
- Reduce DMA memory footprint
- Other small improvements

----------------------------------------------------------------
Colin Ian King (1):
      usb: cdnsp: remove redundant initialization of variable ret

Dmitry Osipenko (1):
      usb: chipidea: tegra: Silence deferred probe error

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

 drivers/usb/cdns3/cdns3-gadget.c     | 73 ++++++++++++++++++++++--------------
 drivers/usb/cdns3/cdns3-gadget.h     |  3 ++
 drivers/usb/cdns3/cdns3-imx.c        | 34 +++++++++++++++++
 drivers/usb/cdns3/cdns3-plat.c       | 23 +++++++++++-
 drivers/usb/cdns3/cdns3-trace.h      |  5 +--
 drivers/usb/cdns3/cdnsp-gadget.c     | 17 ++++++---
 drivers/usb/cdns3/cdnsp-gadget.h     |  1 +
 drivers/usb/cdns3/cdnsp-mem.c        |  3 +-
 drivers/usb/cdns3/core.c             | 29 +++++++++++++-
 drivers/usb/cdns3/drd.c              | 15 ++++++++
 drivers/usb/cdns3/drd.h              |  2 +-
 drivers/usb/chipidea/ci_hdrc_tegra.c |  8 ++--
 12 files changed, 165 insertions(+), 48 deletions(-)

-- 

Thanks,
Peter Chen

