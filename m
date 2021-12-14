Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C95ED474CBF
	for <lists+linux-usb@lfdr.de>; Tue, 14 Dec 2021 21:42:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237688AbhLNUmw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Dec 2021 15:42:52 -0500
Received: from mxout03.lancloud.ru ([45.84.86.113]:53646 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231263AbhLNUmw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Dec 2021 15:42:52 -0500
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 77D28208FDEB
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH 0/4] Propagate errors from platform_get_irq() in the USB drivers
Date:   Tue, 14 Dec 2021 23:42:43 +0300
Message-ID: <20211214204247.7172-1-s.shtylyov@omp.ru>
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

Here are 4 patches against the 'usb-next' branch of Greg KH's 'usb.git' repo.
The affected host/gadget drivers call platform_get_irq() but override its
result in case of error. Switch them to propagating the error codes upstream.
The patche #3 depends on the previously posted patch:

https://marc.info/?l=linux-kernel&m=163623041902285

Sergey Shtylyov (4):
  usb: gadget: udc: bcm63xx: propagate errors from platform_get_irq()
  usb: gadget: udc: pxa25x: propagate errors from platform_get_irq()
  usb: host: ehci-sh: propagate errors from platform_get_irq()
  usb: host: ohci-omap: propagate errors from platform_get_irq()

 drivers/usb/gadget/udc/bcm63xx_udc.c | 8 ++++++--
 drivers/usb/gadget/udc/pxa25x_udc.c  | 2 +-
 drivers/usb/host/ehci-sh.c           | 4 ++--
 drivers/usb/host/ohci-omap.c         | 2 +-
 4 files changed, 10 insertions(+), 6 deletions(-)

-- 
2.26.3

