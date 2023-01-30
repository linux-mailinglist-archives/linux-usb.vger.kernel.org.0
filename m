Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8659E6809A3
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 10:36:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236500AbjA3Jgb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 04:36:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236524AbjA3JgH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 04:36:07 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 959E62F7BB
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 01:35:25 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F9ABD6;
        Mon, 30 Jan 2023 10:35:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675071301;
        bh=ZGgAo2Mt6BG66yEfdUO3uzSYHL4tpZZwgFnxTDYYzJQ=;
        h=From:To:Cc:Subject:Date:From;
        b=Qb5oTJ5vFAopSSdmhc8NEu6/L59dzeHAV4FxCQxu5AsbEKPbFbwwN8eMEU8euI+tj
         rv0afLM3C6fwMrKJQ3rcD45WU/GXs1/qzHFN3w+9/QuJCmH7CMRqp4OnwRfJa6l+GZ
         no1w7rIT9RgDkU7qJEMcZO8spR126r8esdE1zAJc=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com
Cc:     mgr@pengutronix.de, balbi@kernel.org,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        stern@rowland.harvard.edu,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v3 00/11] Add XU support to UVC Gadget
Date:   Mon, 30 Jan 2023 09:34:32 +0000
Message-Id: <20230130093443.25644-1-dan.scally@ideasonboard.com>
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
 drivers/usb/gadget/configfs.c                 | 293 ++++++-
 drivers/usb/gadget/function/f_uvc.c           |  69 +-
 drivers/usb/gadget/function/u_uvc.h           |  15 +
 drivers/usb/gadget/function/uvc.h             |   1 +
 drivers/usb/gadget/function/uvc_configfs.c    | 771 ++++++++++++++++--
 drivers/usb/gadget/function/uvc_configfs.h    |  30 +
 include/linux/usb/composite.h                 |   1 +
 include/linux/usb/gadget.h                    |  11 +
 9 files changed, 1129 insertions(+), 92 deletions(-)

-- 
2.34.1

