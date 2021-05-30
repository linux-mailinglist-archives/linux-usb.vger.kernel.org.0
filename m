Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1A939532D
	for <lists+linux-usb@lfdr.de>; Mon, 31 May 2021 00:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbhE3WYb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 30 May 2021 18:24:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbhE3WY3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 30 May 2021 18:24:29 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5329FC06174A
        for <linux-usb@vger.kernel.org>; Sun, 30 May 2021 15:22:50 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lnTpW-0000Es-36; Mon, 31 May 2021 00:22:46 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lnTpV-0002ce-7t; Mon, 31 May 2021 00:22:45 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        caleb.connolly@ideasonboard.com, paul.elder@ideasonboard.com,
        balbi@kernel.org, kernel@pengutronix.de
Subject: [PATCH 0/3] usb: gadget: uvc: use configfs entries for negotiation and v4l2 VIDIOCS
Date:   Mon, 31 May 2021 00:22:36 +0200
Message-Id: <20210530222239.8793-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series improves the uvc video gadget by parsing the configfs
entries. With the configfs data, the driver now is able to negotiate the
format with the usb host in the kernel and also exports the supported
frames/formats/intervals via the v4l2 VIDIOC interface.

Michael Grzeschik (3):
  usb: gadget: uvc: move structs to common header
  usb: gadget: uvc: add VIDIOC function
  usb: gadget: uvc: add format/frame handling code

 drivers/usb/gadget/function/f_uvc.c        | 324 +++++++++++++++++++-
 drivers/usb/gadget/function/uvc.h          |  32 +-
 drivers/usb/gadget/function/uvc_configfs.c | 116 +------
 drivers/usb/gadget/function/uvc_configfs.h | 121 ++++++++
 drivers/usb/gadget/function/uvc_queue.c    |   4 +-
 drivers/usb/gadget/function/uvc_v4l2.c     | 335 ++++++++++++++++++---
 drivers/usb/gadget/function/uvc_v4l2.h     |   1 +
 drivers/usb/gadget/function/uvc_video.c    |  23 +-
 8 files changed, 781 insertions(+), 175 deletions(-)

-- 
2.29.2

