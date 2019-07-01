Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0B2020626
	for <lists+linux-usb@lfdr.de>; Thu, 16 May 2019 13:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728610AbfEPLr2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 May 2019 07:47:28 -0400
Received: from inva020.nxp.com ([92.121.34.13]:43692 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728389AbfEPLr0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 16 May 2019 07:47:26 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6E1321A0087;
        Thu, 16 May 2019 13:47:25 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6155C1A001D;
        Thu, 16 May 2019 13:47:25 +0200 (CEST)
Received: from fsr-ub1864-101.ea.freescale.net (fsr-ub1864-101.ea.freescale.net [10.171.82.13])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id D4376205CD;
        Thu, 16 May 2019 13:47:24 +0200 (CEST)
From:   laurentiu.tudor@nxp.com
To:     hch@lst.de, stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, marex@denx.de
Cc:     leoyang.li@nxp.com, linux-kernel@vger.kernel.org,
        robin.murphy@arm.com, noring@nocrew.org, JuergenUrban@gmx.de,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>
Subject: [PATCH v4 0/3] prerequisites for device reserved local mem rework
Date:   Thu, 16 May 2019 14:47:18 +0300
Message-Id: <20190516114721.27694-1-laurentiu.tudor@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Laurentiu Tudor <laurentiu.tudor@nxp.com>

For HCs that have local memory, replace the current DMA API usage
with a genalloc generic allocator to manage the mappings for these
devices.
This is in preparation for dropping the existing "coherent" dma
mem declaration APIs. Current implementation was relying on a short
circuit in the DMA API that in the end, was acting as an allocator
for these type of devices.

Only compiled tested, so any volunteers willing to test are most welcome.

Thank you!

For context, see thread here: https://lkml.org/lkml/2019/4/22/357

Changes in v4:
 - created mapping for local mem
 - fix genalloc misuse

Changes in v3:
 - rearranged calls into genalloc simplifying the code a bit (Christoph)
 - dropped RFC prefix

Changes in v2:
 - use genalloc also in core usb (based on comment from Robin)
 - moved genpool decl to usb_hcd to be accesible from core usb

Laurentiu Tudor (3):
  USB: use genalloc for USB HCs with local memory
  usb: host: ohci-sm501: init genalloc for local memory
  usb: host: ohci-tmio: init genalloc for local memory

 drivers/usb/core/buffer.c     | 15 +++++---
 drivers/usb/host/ohci-hcd.c   | 23 +++++++++---
 drivers/usb/host/ohci-sm501.c | 66 +++++++++++++++++++++--------------
 drivers/usb/host/ohci-tmio.c  | 32 ++++++++++++-----
 include/linux/usb/hcd.h       |  3 ++
 5 files changed, 95 insertions(+), 44 deletions(-)

-- 
2.17.1

