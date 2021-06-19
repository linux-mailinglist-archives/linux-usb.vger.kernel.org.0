Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26DC83AD8CF
	for <lists+linux-usb@lfdr.de>; Sat, 19 Jun 2021 11:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230512AbhFSJJP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 19 Jun 2021 05:09:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:59176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229768AbhFSJJP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 19 Jun 2021 05:09:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 64B906112D;
        Sat, 19 Jun 2021 09:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624093624;
        bh=VPGp57aKOjcqSWNP/N6DaR9Ou3REFKkK/ls1qMu0CGo=;
        h=Date:From:To:Cc:Subject:From;
        b=SWyUAKNmiHQ0imgaaRPmVtrSelipHYKgO09LBrUeCIhQPdzaFDbjNxL8zRfmW3Y/e
         /o2zdTeOo3c3q2erPGan1zUuCYXMyOlNbibfPuK5LT4Vnm+K0BGSVrvUzd11h6Y3kT
         2QdwEE7w+J9eFYyP71upvLszAeUQRQq9pcd4a4DM4bid397ZOE4byTye5MPLPD2zBB
         RRlMaUch315No2syxmBhOXQnHD0Xn+L/nLMBOZuKPUWON55m0X4QQ86EGW2jQ4EVG5
         sSCoLMCdaQrYNbisP6c9wG+MR0DVG53MQEj2wMC5yokclXmrzBilIeDMgWQLAe85Vy
         OBmMz9gXCt9DQ==
Date:   Sat, 19 Jun 2021 17:06:55 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] usb: changes for v5.14-rc1
Message-ID: <20210619090655.GA9299@Peter>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-v5.14-rc1

for you to fetch changes up to 33e99b65a13495247b4e35ec97ab82696c0fc6e0:

  usb: cdns3: cdns3-gadget: Use list_move_tail instead of list_del/list_add_tail (2021-06-10 22:16:50 +0800)

----------------------------------------------------------------
Some tiny improvements for cdns USB3 drivers, no important things.

----------------------------------------------------------------
Aswath Govindraju (1):
      doc: dt-binding: cdns,usb3: Add interrupt-names property under required

Baokun Li (1):
      usb: cdns3: cdns3-gadget: Use list_move_tail instead of list_del/list_add_tail

Pawel Laszczak (1):
      usb: cdnsp: Useless condition has been removed

Souptick Joarder (1):
      usb: cdns3: Corrected comment to align with kernel-doc comment

 Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 1 +
 drivers/usb/cdns3/cdns3-gadget.c                     | 6 ++----
 drivers/usb/cdns3/cdnsp-mem.c                        | 5 ++---
 3 files changed, 5 insertions(+), 7 deletions(-)

-- 

Thanks,
Peter Chen

