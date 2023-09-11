Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C18FB79B1F6
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 01:57:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350759AbjIKVlG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 17:41:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238828AbjIKOFs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 10:05:48 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9E74E4B
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 07:05:43 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1qfhXq-0006nU-A1; Mon, 11 Sep 2023 16:05:42 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1qfhXp-005ZV4-LN; Mon, 11 Sep 2023 16:05:41 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.96)
        (envelope-from <mgr@pengutronix.de>)
        id 1qfhXp-002tVY-0n;
        Mon, 11 Sep 2023 16:05:41 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     laurent.pinchart@ideasonboard.com
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        dan.scally@ideasonboard.com, gregkh@linuxfoundation.org,
        nicolas@ndufresne.ca, kernel@pengutronix.de
Subject: [PATCH v2 0/3] usb: gadget: uvc: restart fixes
Date:   Mon, 11 Sep 2023 16:05:27 +0200
Message-Id: <20230911140530.2995138-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series is improving the stability of the usb uvc gadget driver. On
the unconditional event of a crash or intentional stop while using the
uvc v4l2 userspace device and streaming to the host, the setup was
sometimes running into use after free cases. We fix that.

Michael Grzeschik (3):
  usb: gadget: uvc: stop pump thread on video disable
  usb: gadget: uvc: cleanup request when not in correct state
  usb: gadget: uvc: rework pump worker to avoid while loop

 drivers/usb/gadget/function/uvc_video.c | 32 ++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 6 deletions(-)

-- 
2.39.2

