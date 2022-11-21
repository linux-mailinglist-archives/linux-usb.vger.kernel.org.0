Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAE6C631CC9
	for <lists+linux-usb@lfdr.de>; Mon, 21 Nov 2022 10:25:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbiKUJZm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Nov 2022 04:25:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbiKUJZj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Nov 2022 04:25:39 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC6EE27DC0
        for <linux-usb@vger.kernel.org>; Mon, 21 Nov 2022 01:25:37 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D60962D9;
        Mon, 21 Nov 2022 10:25:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669022735;
        bh=6oU5RtagVfTFOlP49PYlJjuxYybvCCLl/w4vMqPKrws=;
        h=From:To:Cc:Subject:Date:From;
        b=nG/UJnqBJTrHsFun+V4dw7VM7UoRfYxktyGzdqT6zEs4sNri27GjbUf7byxK7cqvE
         t/gGASU+fMFYTz+7yZcC2oeGRHmwY4TNDkTuq96KHgz9NHGaK22YLAyUpG8mfWy+R9
         ptvmD1kHxRIAwYZk3/5lqamdrRlD88bCoqUI58lg=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        torleiv@huddly.com, mgr@pengutronix.de,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v2 0/9] Add XU support to UVC Gadget
Date:   Mon, 21 Nov 2022 09:25:08 +0000
Message-Id: <20221121092517.225242-1-dan.scally@ideasonboard.com>
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

Hello all

This series adds support for the definition of extension units in configfs for
the UVC Gadget. The XUs are modelled as config_items within a new "extensions"
group under control, which seemed like an appropriate place to put them.

To allow the XU's to be inserted in the function graph, the bSourceID attribute
for the default output terminal is made writeable - users will need to configure
it with the bUnitID of the XU that they want to use as the OT's source. This does
mean that the XUs can _only_ be placed immediately preceding the OT, but I think
that that's fine for now.

Series level changes:

  - Added patches 5-9 which additionally add the ability to create string
  descriptors through configfs and link them to the extension units as well as
  to override the default descriptors for the IAD and VC/VS interfaces

The XUs configured through this series have been tested via uvc-gadget, uvcvideo
and uvcdynctrl.

Thanks
Dan


Daniel Scally (9):
  usb: gadget: uvc: Make bSourceID read/write
  usb: gadget: uvc: Generalise helper functions for reuse
  usb: gadget: uvc: Allow definition of XUs in configfs
  usb: gadget: uvc: Copy XU descriptors during .bind()
  usb: gadget: uvc: Support arbitrary string descriptors
  usb: gadget: uvc: Allow linking XUs to string descriptors
  usb: gadget: uvc: Attach custom string descriptors
  usb: gadget: uvc: Allow linking function to string descs
  usb: gadget: uvc: Use custom strings if available

 .../ABI/testing/configfs-usb-gadget-uvc       |   50 +-
 drivers/usb/gadget/function/f_uvc.c           |  134 +-
 drivers/usb/gadget/function/u_uvc.h           |   22 +
 drivers/usb/gadget/function/uvc.h             |    1 +
 drivers/usb/gadget/function/uvc_configfs.c    | 1087 ++++++++++++++++-
 drivers/usb/gadget/function/uvc_configfs.h    |   60 +
 6 files changed, 1283 insertions(+), 71 deletions(-)

-- 
2.34.1

