Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A19D3674B8
	for <lists+linux-usb@lfdr.de>; Wed, 21 Apr 2021 23:15:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243960AbhDUVPw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Apr 2021 17:15:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240805AbhDUVPu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Apr 2021 17:15:50 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3FB7C06138C
        for <linux-usb@vger.kernel.org>; Wed, 21 Apr 2021 14:15:16 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lZKBn-0007Yk-AS; Wed, 21 Apr 2021 23:15:15 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lZKBm-0007e1-P7; Wed, 21 Apr 2021 23:15:14 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: [PATCH 0/3] usb: gadget: uvc: improve uvc gadget performance
Date:   Wed, 21 Apr 2021 23:15:10 +0200
Message-Id: <20210421211513.29002-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.29.2
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

Michael Grzeschik (3):
  usb: gadget: uvc: make uvc_num_requests depend on gadget speed
  usb: gadget: uvc: add scatter gather support
  usb: gadget: uvc: decrease the interrupt load to a quarter

 drivers/usb/gadget/Kconfig              |   1 +
 drivers/usb/gadget/function/f_uvc.c     |   1 +
 drivers/usb/gadget/function/uvc.h       |  15 ++-
 drivers/usb/gadget/function/uvc_queue.c |  30 ++++-
 drivers/usb/gadget/function/uvc_queue.h |   5 +-
 drivers/usb/gadget/function/uvc_video.c | 145 +++++++++++++++++++-----
 6 files changed, 164 insertions(+), 33 deletions(-)

-- 
2.29.2

