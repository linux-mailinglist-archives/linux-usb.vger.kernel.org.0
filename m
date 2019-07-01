Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83E1C19FA6
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2019 16:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727431AbfEJO4w (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 May 2019 10:56:52 -0400
Received: from inva021.nxp.com ([92.121.34.21]:49870 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727258AbfEJO4w (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 10 May 2019 10:56:52 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6D4ED200202;
        Fri, 10 May 2019 16:56:50 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 609292001B1;
        Fri, 10 May 2019 16:56:50 +0200 (CEST)
Received: from fsr-ub1864-101.ea.freescale.net (fsr-ub1864-101.ea.freescale.net [10.171.82.13])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id DD78C205ED;
        Fri, 10 May 2019 16:56:49 +0200 (CEST)
From:   laurentiu.tudor@nxp.com
To:     hch@lst.de, stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, marex@denx.de
Cc:     leoyang.li@nxp.com, linux-kernel@vger.kernel.org,
        robin.murphy@arm.com, Laurentiu Tudor <laurentiu.tudor@nxp.com>
Subject: [RFC PATCH 0/3] prerequisites for device reserved local mem rework
Date:   Fri, 10 May 2019 17:56:43 +0300
Message-Id: <20190510145646.10078-1-laurentiu.tudor@nxp.com>
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

Laurentiu Tudor (3):
  ohci-hcd: use genalloc for USB HCs with local memory
  usb: host: ohci-sm501: init genalloc for local memory
  usb: host: ohci-tmio: init genalloc for local memory

 drivers/usb/host/ohci-hcd.c   | 21 +++++++++---
 drivers/usb/host/ohci-sm501.c | 63 +++++++++++++++++++----------------
 drivers/usb/host/ohci-tmio.c  | 23 ++++++++-----
 drivers/usb/host/ohci.h       |  3 ++
 4 files changed, 69 insertions(+), 41 deletions(-)

-- 
2.17.1

