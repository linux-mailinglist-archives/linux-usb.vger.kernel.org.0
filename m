Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBB4212433
	for <lists+linux-usb@lfdr.de>; Thu,  2 May 2019 23:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726120AbfEBVgb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 May 2019 17:36:31 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:44815 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbfEBVgb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 May 2019 17:36:31 -0400
Received: by mail-ed1-f66.google.com with SMTP id b8so3537161edm.11
        for <linux-usb@vger.kernel.org>; Thu, 02 May 2019 14:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XMyMp2LSouBV7Ofq2zMtxUo3SjP91QAnOCTWvlY6Kro=;
        b=Z64IQ0khHZAEYiKkUQrA0wW7PWVzgQtT3E9ZqJufFIk5M0h2iTx4rIg1IucHPoBUJ9
         QsNr4s54JT/nV1QhQiG4EPEQlU4apgfMq1dHEbJa3wl6koCz/P4QQCqeDauXLkR7eQVp
         mst1G6FxddFEbgDuU9hPrT2Ym8fp9tekc3SX4HjdvDGc0xCd+xhyd95DzHdOosdYb6ie
         Vj+tkf8L7AqPhzHj1FuMrAbSm8obNIEfWN9wMe5YRmLYv+ZA2OevwwXHxQ2k6Qn3VRg7
         dcKb0V/zpt7/8dEnzGtumSrC6pKg2t9jL5juGmOGZphFPt6FAuV5kQC01R45H8AAmAUJ
         ofAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XMyMp2LSouBV7Ofq2zMtxUo3SjP91QAnOCTWvlY6Kro=;
        b=MouPsmXr6uwU7DbDsq+p6lAPKSO/+p//L79r5qZAPRyW45CUw0gXbGw44sd6IeQGwb
         fD13H6tAeOOf1v4BNK4+hSE7GYiZ9XtkIs0Dg91PbpMEBU8k77fX60BJt+x5OOvmr8MN
         9NyQcBsPbxWlkNqT+IfmMu32PRC+9ebY1kFCqn1e9Z0oMZyVzPKPaA/F3LYOQxtFP8/y
         TUSidXpBS46Bn6uj3dkVfdEzyrYs8QfOJd+UY5HhJlDjTen4ZD0IUyi41mDufy3PYeuD
         KHAaaBggovCOhRdbgt3OMKKExgQLrR4xOjh/ctC45Iw2Q19uGR9DLk6dLqd6ReGe4fXb
         waFA==
X-Gm-Message-State: APjAAAVMNzUBDAMZYSvfgGMEMAVSzTprThMtsw1jNTX1IhPdIrJcIBLy
        6Hn2Dh48jsfUu+e22cCZj14=
X-Google-Smtp-Source: APXvYqzFMj5M+jOvT0Ykeyma0msDUYKVDXItJlfPfCmrIJls0hSEUvPdrIqQh69s9JH7bxOCXKb9KA==
X-Received: by 2002:a50:f5d0:: with SMTP id x16mr4088394edm.287.1556832988648;
        Thu, 02 May 2019 14:36:28 -0700 (PDT)
Received: from [192.168.1.60] (0126800801.0.fullrate.ninja. [2.110.44.75])
        by smtp.gmail.com with ESMTPSA id j5sm63216edd.43.2019.05.02.14.36.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 02 May 2019 14:36:27 -0700 (PDT)
Message-ID: <1556832986.22007.15.camel@gmail.com>
Subject: Re: [PATCH 0/3] usb: gadget: Add support for disabling U1 and U2
 entries
From:   claus.stovgaard@gmail.com
To:     Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, v.anuragkumar@gmail.com,
        Rob Weber <rob@gnarbox.com>
Date:   Thu, 02 May 2019 23:36:26 +0200
In-Reply-To: <1556792423-4833-1-git-send-email-anurag.kumar.vulisha@xilinx.com>
References: <1556792423-4833-1-git-send-email-anurag.kumar.vulisha@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.24.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

On tor, 2019-05-02 at 15:50 +0530, Anurag Kumar Vulisha wrote:
> Gadget applications may have a requirement to disable the U1 and U2
> entry based on the usecase. For example, when performing performance
> benchmarking on mass storage gadget the U1 and U2 entries can be
> disabled.
> Another example is when periodic transfers like ISOC transfers are
> used
> with bInterval of 1 which doesn't require the link to enter into U1
> or U2
> state (since ping is issued from host for every uframe interval). In
> this
> case the U1 and U2 entry can be disabled. This can be done by setting
> U1DevExitLat and U2DevExitLat values to 0 in the BOS descriptor. Host
> on
> seeing 0 value for U1DevExitLat and U2DevExitLat, it doesn't send
> SET_SEL
> commands to the gadget. Thus entry of U1 and U2 states can be
> avioded.
> This patch updates the same.
> 

Will just vote for this feature, as I will also be able to use it for
solving Rob Webers and my issue [1]

Just today I was making another solution for this feature, using the
configfs instead of the devicetree. Though thinks your solution is
better, as it uses the U1DevExitLat and U2DevExitLat instead. I just
added my solution to the bottem of the mail for reference.

[1] https://www.spinics.net/lists/linux-usb/msg179393.html

---

From 798ea2f5f365ecdf2dbcf436a2a0302e208c6c73 Mon Sep 17 00:00:00 2001
From: "Claus H. Stovgaard" <cst@phaseone.com>
Date: Thu, 2 May 2019 17:54:45 +0200
Subject: [PATCH] usb: gadget: configfs: Add lpm_Ux_disable

When combining dwc3 with an redriver for a USB Type-C device solution,
it
sometimes have problems with leaving U1/U2 for certain hosts, resulting
in
link training errors and reconnects. This patch create an interface via
configfs for disabling U1/U2, enabling a workaround for devices based
on
dwc3.

Signed-off-by: Claus H. Stovgaard <cst@phaseone.com>
---
 drivers/usb/dwc3/ep0.c        |  9 ++++++-
 drivers/usb/gadget/configfs.c | 56
+++++++++++++++++++++++++++++++++++++++++++
 include/linux/usb/gadget.h    |  6 ++++-
 3 files changed, 69 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
index 8efde17..5b2d26b 100644
--- a/drivers/usb/dwc3/ep0.c
+++ b/drivers/usb/dwc3/ep0.c
@@ -379,6 +379,8 @@ static int dwc3_ep0_handle_u1(struct dwc3 *dwc,
enum usb_device_state state,
 	if ((dwc->speed != DWC3_DSTS_SUPERSPEED) &&
 			(dwc->speed != DWC3_DSTS_SUPERSPEED_PLUS))
 		return -EINVAL;
+	if (dwc->gadget_driver->lpm_U1_disable)
+		return -EINVAL;
 
 	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
 	if (set)
@@ -401,6 +403,8 @@ static int dwc3_ep0_handle_u2(struct dwc3 *dwc,
enum usb_device_state state,
 	if ((dwc->speed != DWC3_DSTS_SUPERSPEED) &&
 			(dwc->speed != DWC3_DSTS_SUPERSPEED_PLUS))
 		return -EINVAL;
+	if (dwc->gadget_driver->lpm_U2_disable)
+		return -EINVAL;
 
 	reg = dwc3_readl(dwc->regs, DWC3_DCTL);
 	if (set)
@@ -626,7 +630,10 @@ static int dwc3_ep0_set_config(struct dwc3 *dwc,
struct usb_ctrlrequest *ctrl)
 			 * nothing is pending from application.
 			 */
 			reg = dwc3_readl(dwc->regs, DWC3_DCTL);
-			reg |= (DWC3_DCTL_ACCEPTU1ENA |
DWC3_DCTL_ACCEPTU2ENA);
+			if (!dwc->gadget_driver->lpm_U1_disable)
+				reg |= DWC3_DCTL_ACCEPTU1ENA;
+			if (!dwc->gadget_driver->lpm_U2_disable)
+				reg |= DWC3_DCTL_ACCEPTU2ENA;
 			dwc3_writel(dwc->regs, DWC3_DCTL, reg);
 		}
 		break;
diff --git a/drivers/usb/gadget/configfs.c
b/drivers/usb/gadget/configfs.c
index 0251299..2ee9d10 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -229,6 +229,56 @@ static ssize_t gadget_dev_desc_bcdUSB_store(struct
config_item *item,
 	return len;
 }
 
+static ssize_t gadget_dev_desc_lpm_U1_disable_show(struct config_item
*item,
+		char *page)
+{
+	struct gadget_info *gi = to_gadget_info(item);
+
+	return sprintf(page, "%d\n",
+		       gi->composite.gadget_driver.lpm_U1_disable);
+}
+
+static ssize_t gadget_dev_desc_lpm_U1_disable_store(struct config_item
*item,
+		const char *page, size_t len)
+{
+	struct gadget_info *gi = to_gadget_info(item);
+	bool disable;
+	int ret;
+
+	ret = strtobool(page, &disable);
+	if (!ret) {
+		gi->composite.gadget_driver.lpm_U1_disable = disable;
+		ret = len;
+	}
+
+	return ret;
+}
+
+static ssize_t gadget_dev_desc_lpm_U2_disable_show(struct config_item
*item,
+		char *page)
+{
+	struct gadget_info *gi = to_gadget_info(item);
+
+	return sprintf(page, "%d\n",
+		       gi->composite.gadget_driver.lpm_U2_disable);
+}
+
+static ssize_t gadget_dev_desc_lpm_U2_disable_store(struct config_item
*item,
+		const char *page, size_t len)
+{
+	struct gadget_info *gi = to_gadget_info(item);
+	bool disable;
+	int ret;
+
+	ret = strtobool(page, &disable);
+	if (!ret) {
+		gi->composite.gadget_driver.lpm_U2_disable = disable;
+		ret = len;
+	}
+
+	return ret;
+}
+
 static ssize_t gadget_dev_desc_UDC_show(struct config_item *item, char
*page)
 {
 	char *udc_name = to_gadget_info(item)-
>composite.gadget_driver.udc_name;
@@ -299,6 +349,8 @@ CONFIGFS_ATTR(gadget_dev_desc_, idVendor);
 CONFIGFS_ATTR(gadget_dev_desc_, idProduct);
 CONFIGFS_ATTR(gadget_dev_desc_, bcdDevice);
 CONFIGFS_ATTR(gadget_dev_desc_, bcdUSB);
+CONFIGFS_ATTR(gadget_dev_desc_, lpm_U1_disable);
+CONFIGFS_ATTR(gadget_dev_desc_, lpm_U2_disable);
 CONFIGFS_ATTR(gadget_dev_desc_, UDC);
 
 static struct configfs_attribute *gadget_root_attrs[] = {
@@ -310,6 +362,8 @@ static struct configfs_attribute
*gadget_root_attrs[] = {
 	&gadget_dev_desc_attr_idProduct,
 	&gadget_dev_desc_attr_bcdDevice,
 	&gadget_dev_desc_attr_bcdUSB,
+	&gadget_dev_desc_attr_lpm_U1_disable,
+	&gadget_dev_desc_attr_lpm_U2_disable,
 	&gadget_dev_desc_attr_UDC,
 	NULL,
 };
@@ -1408,6 +1462,8 @@ static const struct usb_gadget_driver
configfs_driver_template = {
 		.name		= "configfs-gadget",
 	},
 	.match_existing_only = 1,
+	.lpm_U1_disable = 0,
+	.lpm_U2_disable = 0,
 };
 
 static struct config_group *gadgets_make(
diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index 7595056..25fe72b 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -619,7 +619,9 @@ static inline int usb_gadget_activate(struct
usb_gadget *gadget)
  *	this driver will be bound to any available UDC.
  * @pending: UDC core private data used for deferred probe of this
driver.
  * @match_existing_only: If udc is not found, return an error and
don't add this
- *      gadget driver to list of pending driver
+ *      gadget driver to list of pending driver.
+ * @lpm_U1_disable: Instruct the UDC to disable U1 if possible.
+ * @lpm_U2_disable: Instruct the UDC to disable U2 if possible.
  *
  * Devices are disabled till a gadget driver successfully bind()s,
which
  * means the driver will handle setup() requests needed to enumerate
(and
@@ -684,6 +686,8 @@ struct usb_gadget_driver {
 	char			*udc_name;
 	struct list_head	pending;
 	unsigned                match_existing_only:1;
+	unsigned		lpm_U1_disable:1;
+	unsigned		lpm_U2_disable:1;
 };
 
 
-- 
2.7.4

