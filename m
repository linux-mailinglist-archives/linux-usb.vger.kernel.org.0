Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DB2E642A78
	for <lists+linux-usb@lfdr.de>; Mon,  5 Dec 2022 15:38:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231387AbiLEOiM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Dec 2022 09:38:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229891AbiLEOiK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Dec 2022 09:38:10 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FF9EC74C
        for <linux-usb@vger.kernel.org>; Mon,  5 Dec 2022 06:38:09 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 05C9E3D7;
        Mon,  5 Dec 2022 15:38:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670251087;
        bh=BRLlkGy9zP0nfNmJRcnqqXYxeZOkv2SXvLwHDL+R3Y4=;
        h=From:To:Cc:Subject:Date:From;
        b=u5llI3Zlz5P9+aclRNqBAjwazbiKKfRSLlMd8W83rwwklzP+HoTNcJKfdiQKXx4B9
         ID+Mo4y629WbIJIxkKBMEkZKzGnWaqC4uBW1AbQbV7UWxYsYgL0Xu6WKcXMOgC8WZU
         eFOUQYQX0vtO8EvQE4yjBbLKGp5sp/uD3SPkwXaU=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        mgr@pengutronix.de, kieran.bingham@ideasonboard.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 0/3] Add ability to disable UVC Gadget's interrupt endpoint
Date:   Mon,  5 Dec 2022 14:37:55 +0000
Message-Id: <20221205143758.1096914-1-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The UVC Gadget includes a hardcoded interrupt endpoint against the VideoControl
interface, though it is misnamed as a control endpoint (the default endpoint 0
is actually used for that role). The UVC specification says that this is an
optional feature of a UVC compliant camera provided certain scenarios don't hold
true, specifically...

1. The device supports hardware triggers for still image capture
2. The device implements any AutoUpdate controls
3. The device implements any Asynchronous controls

Those are all scenarios that will be determined by userspace, meaning that in some
implementations the interrupt endpoint is unnecessary. This series adds the means
to disable it, though retains the current behaviour as the default.

Daniel Scally (3):
  usb: gadget: uvc: Rename uvc_control_ep
  usb: gadget: uvc: Add new disable_interrupt_ep attribute
  usb: gadget: uvc: Allow disabling of interrupt endpoint

 drivers/usb/gadget/function/f_uvc.c        | 46 +++++++++++--------
 drivers/usb/gadget/function/u_uvc.h        |  2 +
 drivers/usb/gadget/function/uvc.h          |  3 +-
 drivers/usb/gadget/function/uvc_configfs.c | 53 ++++++++++++++++++++++
 4 files changed, 85 insertions(+), 19 deletions(-)

-- 
2.34.1

