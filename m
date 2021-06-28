Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB783B6644
	for <lists+linux-usb@lfdr.de>; Mon, 28 Jun 2021 17:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235803AbhF1P6F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Jun 2021 11:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235770AbhF1P57 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Jun 2021 11:57:59 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88EF5C06114B
        for <linux-usb@vger.kernel.org>; Mon, 28 Jun 2021 08:53:14 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lxtZQ-0002x4-KI; Mon, 28 Jun 2021 17:53:12 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lxtZQ-0004Q7-8X; Mon, 28 Jun 2021 17:53:12 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, caleb.connolly@ideasonboard.com,
        paul.elder@ideasonboard.com, balbi@kernel.org,
        kernel@pengutronix.de
Subject: [PATCH v3 0/5] usb: gadget: uvc: improve uvc gadget performance
Date:   Mon, 28 Jun 2021 17:53:06 +0200
Message-Id: <20210628155311.16762-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series improves the performance of the uvc video gadget by adding a
zero copy routine using the scatter list interface of the gadget. The
series also increases the amount of allocated requests depending of the
speed and it also reduces the interrupt load by only trigger on every
16th request in case of super-speed.

Michael Grzeschik (5):
  usb: dwc3: gadget: set gadgets parent to the right controller
  usb: gadget: uvc: make uvc_num_requests depend on gadget speed
  usb: gadget: uvc: set v4l2_dev->dev in f_uvc
  usb: gadget: uvc: add scatter gather support
  usb: gadget: uvc: decrease the interrupt load to a quarter

 drivers/usb/dwc3/gadget.c               |   2 +-
 drivers/usb/gadget/Kconfig              |   1 +
 drivers/usb/gadget/function/f_uvc.c     |   1 +
 drivers/usb/gadget/function/uvc.h       |  15 ++-
 drivers/usb/gadget/function/uvc_queue.c |  28 ++++-
 drivers/usb/gadget/function/uvc_queue.h |   7 +-
 drivers/usb/gadget/function/uvc_video.c | 155 +++++++++++++++++++-----
 drivers/usb/gadget/function/uvc_video.h |   2 +
 drivers/usb/gadget/legacy/Kconfig       |   1 +
 9 files changed, 176 insertions(+), 36 deletions(-)

-- 
2.30.2

