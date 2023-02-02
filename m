Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56C0C687C7B
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 12:42:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232096AbjBBLmQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 06:42:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232103AbjBBLmO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 06:42:14 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11FB86D06B
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 03:42:10 -0800 (PST)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B044C1373;
        Thu,  2 Feb 2023 12:42:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675338122;
        bh=k2rwy2rNfxrpiUlZfjkxt4KwWo0wq3l1D7S06Gx0cWc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lii2HqWXTezVQINFANgVpTBeKz6O56WudocSfgXOXaK2jXjG50XsJi46dID+Hunrf
         rt55Z1lJbetsZHjZg2WoaIsQuUO6rZtifswgN1WbnJ9FWn+OtlbuNrqaYkkpTpJ4PK
         P7L/6HWvlPYVrgPaUhDo2t0rk/+BcRNknlAJ3pZI=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     linux-usb@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [RESEND v3 5/6] usb: gadget: uvc: Make color matching attributes read/write
Date:   Thu,  2 Feb 2023 11:41:41 +0000
Message-Id: <20230202114142.300858-6-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202114142.300858-1-dan.scally@ideasonboard.com>
References: <20230202114142.300858-1-dan.scally@ideasonboard.com>
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

In preparation for allowing more than the default color matching
descriptor, make the color matching attributes writeable.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v3 (laurent):

	- Put the refcnt check beind the mutex_lock(su_mutex) call

Changes in v2:

	- Check refcnt before allowing the change in .store()
	- Renamed uvcg_cmd to uvcg_color_matching

 .../ABI/testing/configfs-usb-gadget-uvc       |  2 +-
 drivers/usb/gadget/function/uvc_configfs.c    | 39 ++++++++++++++++++-
 2 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uvc b/Documentation/ABI/testing/configfs-usb-gadget-uvc
index eb13cc5d363a..ef3b8b852cd2 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-uvc
+++ b/Documentation/ABI/testing/configfs-usb-gadget-uvc
@@ -167,7 +167,7 @@ Date:		Dec 2014
 KernelVersion:	4.0
 Description:	Default color matching descriptors
 
-		All attributes read only:
+		All attributes read/write:
 
 		========================  ======================================
 		bMatrixCoefficients	  matrix used to compute luma and
diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 56e23b80d63f..a210b1990080 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -1904,7 +1904,44 @@ static ssize_t uvcg_color_matching_##cname##_show(			\
 	return result;							\
 }									\
 									\
-UVC_ATTR_RO(uvcg_color_matching_, cname, aname)
+static ssize_t uvcg_color_matching_##cname##_store(			\
+	struct config_item *item, const char *page, size_t len)		\
+{									\
+	struct config_group *group = to_config_group(item);		\
+	struct mutex *su_mutex = &group->cg_subsys->su_mutex;		\
+	struct uvcg_color_matching *color_match =			\
+		to_uvcg_color_matching(group);				\
+	struct f_uvc_opts *opts;					\
+	struct config_item *opts_item;					\
+	int ret;							\
+	u##bits num;							\
+									\
+	ret = kstrtou##bits(page, 0, &num);				\
+	if (ret)							\
+		return ret;						\
+									\
+	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
+									\
+	if (color_match->refcnt) {					\
+		ret = -EBUSY;						\
+		goto unlock_su;						\
+	}								\
+									\
+	opts_item = group->cg_item.ci_parent->ci_parent->ci_parent;	\
+	opts = to_f_uvc_opts(opts_item);				\
+									\
+	mutex_lock(&opts->lock);					\
+									\
+	color_match->desc.aname = num;					\
+	ret = len;							\
+									\
+	mutex_unlock(&opts->lock);					\
+unlock_su:								\
+	mutex_unlock(su_mutex);						\
+									\
+	return ret;							\
+}									\
+UVC_ATTR(uvcg_color_matching_, cname, aname)
 
 UVCG_COLOR_MATCHING_ATTR(b_color_primaries, bColorPrimaries, 8);
 UVCG_COLOR_MATCHING_ATTR(b_transfer_characteristics, bTransferCharacteristics, 8);
-- 
2.34.1

