Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4388738D51E
	for <lists+linux-usb@lfdr.de>; Sat, 22 May 2021 12:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbhEVK24 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 22 May 2021 06:28:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:54174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230408AbhEVK2v (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 22 May 2021 06:28:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 66E4C611CB;
        Sat, 22 May 2021 10:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621679247;
        bh=o0r9cd+pP1iilW8CkKDtSWQYu8i1qLv1JSDE47E+l7E=;
        h=Date:From:To:Cc:Subject:From;
        b=NLSV9UVBffqSvBoJfVN0TFVrQ1TVFYQAzkloqjW/CtnhOo1Du/OWOe9CyURZ1PM/v
         13gybkHfxJRhNiDdtUGxdz/o1r7OWQs/iRJ1PxUfskqjLpXPzKo1HNlHymrS+H0VJe
         3N02zxuflNzRSTSnmifPbfeIZoepHQz4x7xUF+7+3XmBUqPfO3TqVOcSANKnmFgsZV
         eQszLvB4v0vbVzhv5c6iBJnjP3y4QVkZ8WOs9+zdW0Pkk4ks6bqk1cn5titim7aLcl
         hDWObZmH9oPGtVyF5B2mGBmrQ/B/mtjVFQ4KGJzMv3wNF8k97fGKnccIeRFvTLwc6f
         M3iKLme/Gr58Q==
Date:   Sat, 22 May 2021 18:27:23 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] usb: bug fixes for v5.13
Message-ID: <20210522102723.GA14135@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-v5.13-rc3

for you to fetch changes up to 9e3927f6373da54cb17e17f4bd700907e1123d2f:

  usb: chipidea: udc: assign interrupt number to USB gadget structure (2021-05-17 10:04:05 +0800)

----------------------------------------------------------------
Some small bug fixes for both chipidea and cdns USB

----------------------------------------------------------------
Dinghao Liu (1):
      usb: cdns3: Fix runtime PM imbalance on error

Li Jun (1):
      usb: chipidea: udc: assign interrupt number to USB gadget structure

Pawel Laszczak (1):
      usb: cdnsp: Fix lack of removing request from pending list.

 drivers/usb/cdns3/cdns3-gadget.c |  4 +++-
 drivers/usb/cdns3/cdnsp-gadget.c | 14 +++++++-------
 drivers/usb/chipidea/udc.c       |  1 +
 3 files changed, 11 insertions(+), 8 deletions(-)

-- 

Thanks,
Peter Chen

