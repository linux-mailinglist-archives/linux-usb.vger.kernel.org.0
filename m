Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5524553FA
	for <lists+linux-usb@lfdr.de>; Thu, 18 Nov 2021 05:53:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243068AbhKRE4s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Nov 2021 23:56:48 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:25996 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243066AbhKRE4q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Nov 2021 23:56:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637211227; x=1668747227;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=giE4jAyHjj3uYZ2r2f8+g8NiIJVHRmm5GoKXuj9DKUs=;
  b=HzgZebE0rcHT86ofr8/SEc2pTjf+jyoASD9IMzpnimjmdC3wUfHy12Le
   nqXOMtHVF88TebtWSqwFJDFYVyXaZalUQW0jR1GTu1D8Pqka6kl1CR/xK
   5fMdmAGBsqNlnR8EdaKygxf0jFc3xgZZ+91wFxvO044dorMblPWMGJzyH
   Q=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 17 Nov 2021 20:53:47 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2021 20:53:47 -0800
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 17 Nov 2021 20:53:47 -0800
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 17 Nov 2021 20:53:45 -0800
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Linyu Yuan" <quic_linyyuan@quicinc.com>
Subject: [PATCH 2/4] usb: gadget: configfs: remove os_desc_attr_release()
Date:   Thu, 18 Nov 2021 12:53:31 +0800
Message-ID: <1637211213-16400-3-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637211213-16400-1-git-send-email-quic_linyyuan@quicinc.com>
References: <1637211213-16400-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

it is not allow to create sub group under os_desc,

/sys/kernel/config/usb_gadget/dummy/os_desc # mkdir dummy
mkdir: can't create directory 'dummy': Operation not permitted

no one will kmalloc() os_desc entry and kfree(os_desc) will never be called.
static void os_desc_attr_release(struct config_item *item)
{
       struct os_desc *os_desc = to_os_desc(item);
       kfree(os_desc);
}

remove struct os_desc definition, to_os_desc() and os_desc_attr_release().

Reviewed-by: Jack Pham <quic_jackp@quicinc.com>
Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/gadget/configfs.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index ac35fea..ae0890a 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -89,10 +89,6 @@ struct gadget_strings {
 	struct list_head list;
 };
 
-struct os_desc {
-	struct config_group group;
-};
-
 struct gadget_config_name {
 	struct usb_gadget_strings stringtab_dev;
 	struct usb_string strings;
@@ -783,11 +779,6 @@ static void gadget_strings_attr_release(struct config_item *item)
 USB_CONFIG_STRING_RW_OPS(gadget_strings);
 USB_CONFIG_STRINGS_LANG(gadget_strings, gadget_info);
 
-static inline struct os_desc *to_os_desc(struct config_item *item)
-{
-	return container_of(to_config_group(item), struct os_desc, group);
-}
-
 static inline struct gadget_info *os_desc_item_to_gadget_info(
 		struct config_item *item)
 {
@@ -887,12 +878,6 @@ static struct configfs_attribute *os_desc_attrs[] = {
 	NULL,
 };
 
-static void os_desc_attr_release(struct config_item *item)
-{
-	struct os_desc *os_desc = to_os_desc(item);
-	kfree(os_desc);
-}
-
 static int os_desc_link(struct config_item *os_desc_ci,
 			struct config_item *usb_cfg_ci)
 {
@@ -942,7 +927,6 @@ static void os_desc_unlink(struct config_item *os_desc_ci,
 }
 
 static struct configfs_item_operations os_desc_ops = {
-	.release                = os_desc_attr_release,
 	.allow_link		= os_desc_link,
 	.drop_link		= os_desc_unlink,
 };
-- 
2.7.4

