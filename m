Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5464D6165E4
	for <lists+linux-usb@lfdr.de>; Wed,  2 Nov 2022 16:18:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbiKBPSa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Nov 2022 11:18:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230087AbiKBPST (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Nov 2022 11:18:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5117E205F7
        for <linux-usb@vger.kernel.org>; Wed,  2 Nov 2022 08:18:18 -0700 (PDT)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6643110D2;
        Wed,  2 Nov 2022 16:18:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667402295;
        bh=pggLok7OFUsHpnR9YLdXENoWn2py9RBFg9PosHrSoE0=;
        h=From:To:Cc:Subject:Date:From;
        b=PCB7TbaNm14dx9lUiKg813sapnqZqwu2L9cWBkq8wJsJULHhmVMzasSV4sP5LO4LD
         auyLhXt7FkzEIf2SMdge32yGGlAAP8rUdgOsu2GNuDByD1NXGSl6ccqhPYk9sFBltg
         NtYN5tIWs2N4ufxu2kbF6ydNHZOsXN0H6lunCmCA=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        torleiv@huddly.com, mgr@pengutronix.de,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 0/4] Add XU support to UVC Gadget
Date:   Wed,  2 Nov 2022 15:17:51 +0000
Message-Id: <20221102151755.1022841-1-dan.scally@ideasonboard.com>
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

Thanks
Dan


Daniel Scally (4):
  usb: gadget: uvc: Make bSourceID read/write
  usb: gadget: uvc: Generalise helper functions for reuse
  usb: gadget: uvc: Allow definition of XUs in configfs
  usb: gadget: uvc: Copy XU descriptors during .bind()

 drivers/usb/gadget/function/f_uvc.c        |  44 ++
 drivers/usb/gadget/function/u_uvc.h        |   7 +
 drivers/usb/gadget/function/uvc.h          |   1 +
 drivers/usb/gadget/function/uvc_configfs.c | 580 +++++++++++++++++++--
 drivers/usb/gadget/function/uvc_configfs.h |  29 ++
 5 files changed, 607 insertions(+), 54 deletions(-)

-- 
2.34.1

