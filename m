Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7045A687F50
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 14:55:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbjBBNz0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 08:55:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbjBBNzZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 08:55:25 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CF3F4CE7F
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 05:55:22 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E8F0505;
        Thu,  2 Feb 2023 14:55:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675346120;
        bh=vbtSEUZaAtD3QZKoNJ+KtnYceM2u8NstrydXLiRTZ2U=;
        h=From:To:Cc:Subject:Date:From;
        b=KStnmWmbDfpnQ/dNDwTD67Z7q1WbPGQH43iY4pCAHYnLk3JZf3xyfkk9jJ1JeRRNl
         Wxr7YE5xqZxawnuYSAalwC8dyfPCLlUoIduPpfw9wjN+FVClEBdPX/vXPaIbNB24cb
         2oKIvYA+jt+XHLKgE49JyXZ6lfhG0oB36aPLzbSM=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com
Cc:     mgr@pengutronix.de, balbi@kernel.org,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        stern@rowland.harvard.edu,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v4 00/11] Add XU support to UVC Gadget
Date:   Thu,  2 Feb 2023 13:54:57 +0000
Message-Id: <20230202135508.447109-1-dan.scally@ideasonboard.com>
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

The XUs configured through this series have been tested via uvc-gadget, uvcvideo
and uvcdynctrl.

This version is almost identical to v3 but rebased onto usb-testing, with minor
changes to 6/11 and 7/11.

v2 of the series here: https://lore.kernel.org/linux-usb/0ae65812-c937-d071-455b-7c1d6418b080@ideasonboard.com/

Thanks
Dan

Daniel Scally (11):
  usb: gadget: uvc: Make bSourceID read/write
  usb: gadget: uvc: Generalise helper functions for reuse
  usb: gadget: uvc: Allow definition of XUs in configfs
  usb: gadget: uvc: Copy XU descriptors during .bind()
  usb: gadget: configfs: Rename struct gadget_strings
  usb: gadget: configfs: Support arbitrary string descriptors
  usb: gadget: configfs: Attach arbitrary strings to cdev
  usb: gadget: uvc: Allow linking XUs to string descriptors
  usb: gadget: uvc: Pick up custom string descriptor IDs
  usb: gadget: uvc: Allow linking function to string descs
  usb: gadget: uvc: Use custom strings if available

 .../ABI/testing/configfs-usb-gadget-uvc       |  30 +-
 Documentation/usb/gadget_configfs.rst         |  10 +
 drivers/usb/gadget/configfs.c                 | 291 ++++++-
 drivers/usb/gadget/function/f_uvc.c           |  69 +-
 drivers/usb/gadget/function/u_uvc.h           |  15 +
 drivers/usb/gadget/function/uvc.h             |   1 +
 drivers/usb/gadget/function/uvc_configfs.c    | 771 ++++++++++++++++--
 drivers/usb/gadget/function/uvc_configfs.h    |  30 +
 include/linux/usb/composite.h                 |   1 +
 include/linux/usb/gadget.h                    |  11 +
 10 files changed, 1138 insertions(+), 91 deletions(-)

-- 
2.34.1

