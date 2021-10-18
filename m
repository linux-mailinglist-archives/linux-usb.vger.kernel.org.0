Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7BE243269A
	for <lists+linux-usb@lfdr.de>; Mon, 18 Oct 2021 20:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232955AbhJRSlr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Oct 2021 14:41:47 -0400
Received: from mxout04.lancloud.ru ([45.84.86.114]:55458 "EHLO
        mxout04.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbhJRSlq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Oct 2021 14:41:46 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 9B75D20A88BA
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Mathias Nyman" <mathias.nyman@intel.com>
Subject: [PATCH 00/22] Explicitly deny IRQ0 in the USB host drivers
Date:   Mon, 18 Oct 2021 21:39:08 +0300
Message-ID: <20211018183930.8448-1-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Here are 22 patches against the 'usb-next' branch of Greg KH's 'usb.git' repo.
The affected drivers use platform_get_irq() which can return IRQ0 (considered
invalid, according to Linus) that means broken HCD when passed to usb_add_hcd()
called at the end of the probe methods. I think that the solution to this issue
is either explicitly deny or accept IRQ0 in usb_add_hcd()... /but/ here's this
patch set to get the things going...

Sergey Shtylyov (22):
  usb: host: ehci-exynos: deny IRQ0
  usb: host: ehci-mv: deny IRQ0
  usb: host: ehci-npcm7xx: deny IRQ0
  usb: host: ehci-omap: deny IRQ0
  usb: host: ehci-platform: deny IRQ0
  usb: host: ehci-spear: deny IRQ0
  usb: host: ehci-st: deny IRQ0
  usb: host: ohci-at91: deny IRQ0
  usb: host: ohci-da8xx: deny IRQ0
  usb: host: ohci-exynos: deny IRQ0
  usb: host: ohci-at91: deny IRQ0
  usb: host: ohci-omap: deny IRQ0
  usb: host: ohci-platform: deny IRQ0
  usb: host: ohci-pxa27x: deny IRQ0
  usb: host: ohci-sm501: deny IRQ0
  usb: host: ohci-spear: deny IRQ0
  usb: host: ohci-st: deny IRQ0
  usb: host: ohci-tmio: deny IRQ0
  usb: host: xhci-histb: deny IRQ0
  usb: host: xhci-mtk: deny IRQ0
  usb: host: xhci-plat: deny IRQ0
  usb: host: xhci-tegra: deny IRQ0

 drivers/usb/host/ehci-exynos.c   | 4 ++++
 drivers/usb/host/ehci-mv.c       | 4 ++++
 drivers/usb/host/ehci-npcm7xx.c  | 4 ++++
 drivers/usb/host/ehci-omap.c     | 2 ++
 drivers/usb/host/ehci-platform.c | 2 ++
 drivers/usb/host/ehci-spear.c    | 4 ++++
 drivers/usb/host/ehci-st.c       | 2 ++
 drivers/usb/host/ohci-at91.c     | 2 ++
 drivers/usb/host/ohci-da8xx.c    | 4 ++++
 drivers/usb/host/ohci-exynos.c   | 4 ++++
 drivers/usb/host/ohci-nxp.c      | 4 ++++
 drivers/usb/host/ohci-omap.c     | 4 ++++
 drivers/usb/host/ohci-platform.c | 2 ++
 drivers/usb/host/ohci-pxa27x.c   | 2 ++
 drivers/usb/host/ohci-sm501.c    | 4 ++++
 drivers/usb/host/ohci-spear.c    | 4 ++++
 drivers/usb/host/ohci-st.c       | 2 ++
 drivers/usb/host/ohci-tmio.c     | 2 ++
 drivers/usb/host/xhci-histb.c    | 2 ++
 drivers/usb/host/xhci-mtk.c      | 4 +++-
 drivers/usb/host/xhci-plat.c     | 2 ++
 drivers/usb/host/xhci-tegra.c    | 2 ++
 22 files changed, 65 insertions(+), 1 deletion(-)

-- 
2.26.3
