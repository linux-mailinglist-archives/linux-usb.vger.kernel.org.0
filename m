Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F412E21128E
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 20:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732972AbgGASZB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 14:25:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732946AbgGASY7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jul 2020 14:24:59 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ACBDC08C5DC
        for <linux-usb@vger.kernel.org>; Wed,  1 Jul 2020 11:24:59 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1jqhPj-0004Pb-R0; Wed, 01 Jul 2020 20:24:55 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1jqhPi-0007R2-UV; Wed, 01 Jul 2020 20:24:54 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        kernel@pengutronix.de, balbi@kernel.org
Subject: [PATCH v5 0/3] usb: dwc3: gadget: improve isoc handling
Date:   Wed,  1 Jul 2020 20:24:50 +0200
Message-Id: <20200701182453.25299-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

These three patches improve the isoc handling and make the dwc3 gadget
driver somewhat usable with the UVC gadget for isochronous endpoints.

The first patch makes starting isochronous transfers more reliable. I
think it's more less, what Thinh suggested some time ago[1]. It's still
not perfect because the first request must still be queued within 2
seconds but it's a lot better than the current situation.

The second patch makes it possible to have gaps in the data stream. The
UVC gadget relies on such behaviour. Without this, using the UVC gadget
with a live stream stops after the first frame that needs more time to
be scheduled.

[1] https://marc.info/?l=linux-usb&m=156088170723824&w=4

Michael Grzeschik (2):
  usb: dwc3: gadget: add frame number mask
  usb: dwc3: gadget: when the started list is empty stop the active xfer

Michael Olbrich (1):
  usb: dwc3: gadget: make starting isoc transfers more robust

 drivers/usb/dwc3/gadget.c | 30 +++++++++++++++++++++++++++---
 drivers/usb/dwc3/gadget.h |  2 ++
 2 files changed, 29 insertions(+), 3 deletions(-)

-- 
2.27.0

