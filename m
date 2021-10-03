Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 810374203E9
	for <lists+linux-usb@lfdr.de>; Sun,  3 Oct 2021 22:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231573AbhJCUbe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 3 Oct 2021 16:31:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231506AbhJCUbc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 3 Oct 2021 16:31:32 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49D5BC061782
        for <linux-usb@vger.kernel.org>; Sun,  3 Oct 2021 13:29:44 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mX87C-0003Ri-9B; Sun, 03 Oct 2021 22:29:42 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mX87B-0000AJ-PA; Sun, 03 Oct 2021 22:29:41 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        caleb.connolly@ideasonboard.com
Subject: [PATCH v2 0/7] usb: gadget: uvc: smaller fixes for stability
Date:   Sun,  3 Oct 2021 22:29:32 +0200
Message-Id: <20211003202939.306-1-m.grzeschik@pengutronix.de>
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

This series improves the uvc video gadget overal stability and code
quality. Including a fix for the configfs udc callbacks.

Michael Grzeschik (6):
  usb: gadget: uvc: consistently use define for headerlen
  usb: gadget: uvc: test if ep->desc is valid on ep_queue
  usb: gadget: uvc: only schedule stream in streaming state
  usb: gadget: uvc: only pump video data if necessary
  usb: gadget: uvc: ensure the vdev is unset
  usb: gadget: udc: ensure the gadget is still available

Michael Tretter (1):
  usb: gadget: uvc: rename function to be more consistent

 drivers/usb/gadget/composite.c          |  4 ++--
 drivers/usb/gadget/function/f_uvc.c     |  7 ++++---
 drivers/usb/gadget/function/uvc_v4l2.c  |  3 ++-
 drivers/usb/gadget/function/uvc_video.c | 23 ++++++++++++++++-------
 drivers/usb/gadget/udc/core.c           |  3 +++
 5 files changed, 27 insertions(+), 13 deletions(-)

-- 
2.30.2

