Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 934E35B425D
	for <lists+linux-usb@lfdr.de>; Sat, 10 Sep 2022 00:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbiIIWNr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Sep 2022 18:13:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230174AbiIIWNo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Sep 2022 18:13:44 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9868590C58
        for <linux-usb@vger.kernel.org>; Fri,  9 Sep 2022 15:13:41 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1oWmFn-000175-8v; Sat, 10 Sep 2022 00:13:39 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oWmFk-004tqr-94; Sat, 10 Sep 2022 00:13:38 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1oWmFl-0005tO-2m; Sat, 10 Sep 2022 00:13:37 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     linux-media@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, paul.elder@ideasonboard.com,
        kernel@pengutronix.de, nicolas@ndufresne.ca,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v2 0/4] usb: gadget: uvc: parse configfs entries and implement v4l2 enum api calls
Date:   Sat, 10 Sep 2022 00:13:31 +0200
Message-Id: <20220909221335.15033-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series improves the uvc video gadget by parsing the configfs
entries. With the configfs data, the userspace now is able to use simple
v4l2 api calls like enum and try_format to check for valid configurations
initially set by configfs.

Michael Grzeschik (4):
  media: v4l: move helper functions for fractions from uvc to
    v4l2-common
  media: uvcvideo: move uvc_format_desc to common header
  usb: gadget: uvc: add v4l2 enumeration api calls
  usb: gadget: uvc: add v4l2 try_format api call

 drivers/media/usb/uvc/uvc_ctrl.c       |   1 +
 drivers/media/usb/uvc/uvc_driver.c     | 290 +-------------------
 drivers/media/usb/uvc/uvc_v4l2.c       |  14 +-
 drivers/media/usb/uvc/uvcvideo.h       | 147 ----------
 drivers/media/v4l2-core/v4l2-common.c  |  86 ++++++
 drivers/usb/gadget/function/f_uvc.c    |  30 +++
 drivers/usb/gadget/function/uvc.h      |   2 +
 drivers/usb/gadget/function/uvc_v4l2.c | 286 ++++++++++++++++++++
 include/media/v4l2-common.h            |   4 +
 include/media/v4l2-uvc.h               | 359 +++++++++++++++++++++++++
 10 files changed, 776 insertions(+), 443 deletions(-)
 create mode 100644 include/media/v4l2-uvc.h

-- 
2.30.2

