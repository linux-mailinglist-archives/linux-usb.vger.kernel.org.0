Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D08A46DBFA
	for <lists+linux-usb@lfdr.de>; Wed,  8 Dec 2021 20:21:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232386AbhLHTZO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Dec 2021 14:25:14 -0500
Received: from mxout03.lancloud.ru ([45.84.86.113]:44946 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239908AbhLHTY4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Dec 2021 14:24:56 -0500
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru D5B1B2060057
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>, Bin Liu <b-liu@ti.com>
Subject: [PATCH v2 00/10] Fix deferred probing in the USB host/gadget drivers
Date:   Wed, 8 Dec 2021 22:21:08 +0300
Message-ID: <20211208192118.7483-1-s.shtylyov@omp.ru>
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

Here are 10 patches against the 'usb-linus' branch of Greg KH's 'usb.git'
repo. The affected host/gadget drivers call platform_get_irq() but override
its result in case of error which prevents the deferred probing from working.
These patches now logically depend on the previously posted patch:

https://marc.info/?l=linux-kernel&m=163623041902285

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
 drivers/usb/host/ehci-atmel.c        | 4 ++--
 drivers/usb/host/ehci-orion.c        | 4 ++--
 drivers/usb/host/ehci-sh.c           | 4 ++--
 drivers/usb/host/ohci-da8xx.c        | 2 +-
 drivers/usb/host/ohci-nxp.c          | 2 +-
 drivers/usb/host/ohci-omap.c         | 2 +-
 drivers/usb/musb/musb_core.c         | 4 ++--
 10 files changed, 22 insertions(+), 18 deletions(-)

-- 
2.26.3

