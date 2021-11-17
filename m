Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCDFC454659
	for <lists+linux-usb@lfdr.de>; Wed, 17 Nov 2021 13:26:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236714AbhKQM1q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Nov 2021 07:27:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233318AbhKQM1p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Nov 2021 07:27:45 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6E45C061200
        for <linux-usb@vger.kernel.org>; Wed, 17 Nov 2021 04:24:46 -0800 (PST)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1mnJzZ-0005Wp-0m; Wed, 17 Nov 2021 13:24:45 +0100
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1mnJzX-00A6s0-TU; Wed, 17 Nov 2021 13:24:43 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com, kernel@pengutronix.de
Subject: [PATCH v3 0/7] usb: gadget: uvc: use configfs entries for negotiation and v4l2 VIDIOCS
Date:   Wed, 17 Nov 2021 13:24:28 +0100
Message-Id: <20211117122435.2409362-1-m.grzeschik@pengutronix.de>
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

This series improves the uvc video gadget by parsing the configfs
entries. With the configfs data, the driver now is able to negotiate the
format with the usb host in the kernel and also exports the supported
frames/formats/intervals via the v4l2 VIDIOC interface.

The uvc userspace stack is also under development. One example is an generic
v4l2uvcsink gstreamer elemnt, which is currently under duiscussion. [1]

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/1304

With the libusbgx library [1] used by the gadget-tool [2] it is now also
possible to fully describe the configfs layout of the uvc gadget with scheme
files.

[2] https://github.com/linux-usb-gadgets/libusbgx/pull/61/commits/53231c76f9d512f59fdc23b65cd5c46b7fb09eb4

[3] https://github.com/linux-usb-gadgets/gt/tree/master/examples/systemd

The bigger picture of these patches is to provide a more versatile interface to
the uvc gadget. The goal is to simply start a uvc-gadget with the following
commands:

$ gt load uvc.scheme
$ gst-launch v4l2src ! v4l2uvcsink

--

v1: https://lore.kernel.org/linux-usb/20210530222239.8793-1-m.grzeschik@pengutronix.de/
v2: https://lore.kernel.org/linux-usb/20211117004432.3763306-1-m.grzeschik@pengutronix.de/

Regards,
Michael

Michael Grzeschik (7):
  media: v4l: move helper functions for fractions from uvc to
    v4l2-common
  media: uvcvideo: move uvc_format_desc to common header
  usb: gadget: uvc: prevent index variables to start from 0
  usb: gadget: uvc: move structs to common header
  usb: gadget: uvc: track frames in format entries
  usb: gadget: uvc: add VIDIOC function
  usb: gadget: uvc: add format/frame handling code

 drivers/media/usb/uvc/uvc_ctrl.c           |   1 +
 drivers/media/usb/uvc/uvc_driver.c         | 281 +--------------
 drivers/media/usb/uvc/uvc_v4l2.c           |  14 +-
 drivers/media/usb/uvc/uvcvideo.h           | 144 --------
 drivers/media/v4l2-core/v4l2-common.c      |  82 +++++
 drivers/usb/gadget/function/f_uvc.c        | 257 +++++++++++++-
 drivers/usb/gadget/function/uvc.h          |  35 +-
 drivers/usb/gadget/function/uvc_configfs.c | 148 ++------
 drivers/usb/gadget/function/uvc_configfs.h | 120 ++++++-
 drivers/usb/gadget/function/uvc_queue.c    |   3 +-
 drivers/usb/gadget/function/uvc_v4l2.c     | 391 ++++++++++++++++++---
 drivers/usb/gadget/function/uvc_video.c    |  71 +++-
 include/media/v4l2-common.h                |   4 +
 include/media/v4l2-uvc.h                   | 351 ++++++++++++++++++
 14 files changed, 1303 insertions(+), 599 deletions(-)
 create mode 100644 include/media/v4l2-uvc.h

-- 
2.30.2

