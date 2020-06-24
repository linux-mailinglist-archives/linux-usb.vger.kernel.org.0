Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B317D20760E
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jun 2020 16:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404044AbgFXOtP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Jun 2020 10:49:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389818AbgFXOtO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Jun 2020 10:49:14 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D78DC061573
        for <linux-usb@vger.kernel.org>; Wed, 24 Jun 2020 07:49:14 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1jo6i9-0001Wh-07; Wed, 24 Jun 2020 16:49:13 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1jo6i7-0005hQ-3x; Wed, 24 Jun 2020 16:49:11 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, kernel@pengutronix.de
Subject: [PATCH v2 0/2] usb: dwc3: gadget: improve isoc handling
Date:   Wed, 24 Jun 2020 16:49:05 +0200
Message-Id: <20200624144907.9604-1-m.grzeschik@pengutronix.de>
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

These two patches improve the isoc handling and make the dwc3 gadget
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


Michael Grzeschik (1):
  usb: dwc3: gadget: when the started list is empty stop the active xfer

Michael Olbrich (1):
  usb: dwc3: gadget: make starting isoc transfers more robust

 drivers/usb/dwc3/gadget.c | 42 +++++++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 13 deletions(-)

-- 
2.27.0

