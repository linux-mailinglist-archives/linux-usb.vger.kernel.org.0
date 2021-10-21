Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 173E5436B23
	for <lists+linux-usb@lfdr.de>; Thu, 21 Oct 2021 21:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231558AbhJUTQ6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Oct 2021 15:16:58 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:48156 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbhJUTQ5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Oct 2021 15:16:57 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 70F7120A4A1A
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>, Bin Liu <b-liu@ti.com>
Subject: [PATCH 00/10] Fix deferred probing in the USB host/gadget drivers
Date:   Thu, 21 Oct 2021 22:14:27 +0300
Message-ID: <20211021191437.8737-1-s.shtylyov@omp.ru>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Here are 10 patches against the 'usb-next' branch of Wolfram's 'usb.git' repo
plus my 22 patches posted on Monday.  The affected host/gadget drivers call
platform_get_irq() but override its result in case of error -- which prevents
the deferred probing from working...

Sergey Shtylyov (10):
  usb: gadget: udc: bcm63xx: fix deferred probing
  usb: gadget: udc: gr: fix deferred probing
  usb: gadget: udc: pxa25x: fix deferred probing
  usb: host: ehci-atmel: fix deferred probing
  usb: host: ehci-orion: fix deferred probing
  usb: host: ehci-sh: fix deferred probing
  usb: host: ohci-da8xx: fix deferred probing
  usb: host: ohci-nxp: fix deferred probing
  usb: host: ohci-omap: fix deferred probing
  usb: musb: core: fix deferred probing

 drivers/usb/gadget/udc/bcm63xx_udc.c | 8 ++++++--
 drivers/usb/gadget/udc/gr_udc.c      | 8 ++++----
 drivers/usb/gadget/udc/pxa25x_udc.c  | 2 +-
 drivers/usb/host/ehci-atmel.c        | 8 ++++++--
 drivers/usb/host/ehci-orion.c        | 8 ++++++--
 drivers/usb/host/ehci-sh.c           | 8 ++++++--
 drivers/usb/host/ohci-da8xx.c        | 2 +-
 drivers/usb/host/ohci-nxp.c          | 2 +-
 drivers/usb/host/ohci-omap.c         | 2 +-
 drivers/usb/musb/musb_core.c         | 4 ++--
 10 files changed, 34 insertions(+), 18 deletions(-)

-- 
2.26.3

