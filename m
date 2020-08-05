Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 758DC23C748
	for <lists+linux-usb@lfdr.de>; Wed,  5 Aug 2020 09:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbgHEH6V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Aug 2020 03:58:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbgHEH6S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Aug 2020 03:58:18 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 311F2C06174A
        for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2020 00:58:18 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id v11so48206847ybm.22
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2020 00:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Mqw61vckuBpCOmwOfT/7FZ2DLW4Z2qOeAOvcWaIpPT8=;
        b=EhP2Uuxjh47ZvXXzvK5LbwCXog8MxnBRmcTORmqt7SPM+28tTI/+bfLKRBme/e5NnX
         gRo04Yt9ps6gCaKORTTZSwjR2ZshgIPx8FZqMGjK2Q/KrMXtg0isV8HFt0RF6Uid9k9J
         9voa89ugPDaLa2bayBZz5rPHQz960ROs7OTDLLM3dW0KIr5INuMMN+qk7bmk9hXl+CgB
         bsSsKYgt/VO179hxBnK3ZKMQeXLxi5KFimQUH76PbNrsK90uzFB9UN24+QP24BNrow7u
         pZmhFPR66QGgoEjvYJw0vD13dcGbU7J0fNHejHn2STjLLu1U6aNrszsNMkqMi0QpBbB5
         6LVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Mqw61vckuBpCOmwOfT/7FZ2DLW4Z2qOeAOvcWaIpPT8=;
        b=Cqjx1SVfS/sL2AwVwhNlHvpJbQbeyVxeIndhl2b/AsmQwppfsIcJj0Ahj4Q4ZyRG8A
         ME8IM3MhhCB4hcnGIb9a9yXoJy+LTuF27E9EGFPt+NXJY/4hDdqS2eljIeuPfrccDUpy
         53HFbA4HvzaODHgL2eYavHvKSwDrZKnBg5Fmqc3abuq7HsnmkZH1pU6AKFUqOKWvolL3
         66JUDeWt6iSPzH0ruL5eI36s4b7u8+H9wWBKK7C3Bsxg/39d2yWwlhXXtjbEjJmt8Ra4
         XC7JX+d1lS5TDKWZdeitZUOI4b4qt9oAHXE0rF0udCu4TtkQNTEe4fJG/nqmU0tuSZuM
         iq2Q==
X-Gm-Message-State: AOAM53310EyrB0D+ZPMLrxoaMqMNFOyK0s/T6CJvRuaMHD/5hYRNKSyt
        3uT6GKxV/XlKlelIE6lFxC6aKP2Pi9CVIUQU+xts7ryNOjAKCTP/3oNVuhpI5OuLl4C/PHNk8D3
        6z8C01VhAAVZ8K9cxmoK559qnEdiSE7yrnH5ZwZ1MiW7FoCn0JNO+uThEhdVCKGd8oUaJ
X-Google-Smtp-Source: ABdhPJxI1a9dvyFvR1ERJbZme+MxKPp8sid815zk5+WP6eeVcyZFpTSC+DUZ8Bb+YZ0LECKjmwP1HA3KrPcv
X-Received: by 2002:a25:502:: with SMTP id 2mr2924390ybf.6.1596614297306; Wed,
 05 Aug 2020 00:58:17 -0700 (PDT)
Date:   Wed,  5 Aug 2020 16:58:10 +0900
Message-Id: <20200805075810.604063-1-lorenzo@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.163.g6104cc2f0b6-goog
Subject: [PATCH] usb: gadget: f_ncm: allow using NCM in SuperSpeed Plus gadgets.
From:   Lorenzo Colitti <lorenzo@google.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        zenczykowski@gmail.com, Lorenzo Colitti <lorenzo@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently, using f_ncm in a SuperSpeed Plus gadget results in
an oops in config_ep_by_speed because ncm_set_alt passes in NULL
ssp_descriptors. Fix this by defining new descriptors for
SuperSpeed Plus. (We cannot re-use the existing definitions for
the SuperSpeed descriptors, even though they are mostly the same,
because they are not fixed initializers).

Also fix reported bandwidth to match bandwidth reported for
SuperSpeed. This calculation is already incorrect, because it
returns 851 Mbps and NCM can already reach speeds in excess of
1.7 Gbps on a 5 Gbps port. But it's better to return 851 Mbps
than 9 Mbps for SuperSpeed Plus.

Tested: enabled f_ncm on a dwc3 gadget and 10Gbps link, ran iperf
Signed-off-by: Lorenzo Colitti <lorenzo@google.com>
---
 drivers/usb/gadget/function/f_ncm.c | 79 ++++++++++++++++++++++++++++-
 1 file changed, 77 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 1d900081b1..91f87165e7 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -85,7 +85,8 @@ static inline struct f_ncm *func_to_ncm(struct usb_function *f)
 /* peak (theoretical) bulk transfer rate in bits-per-second */
 static inline unsigned ncm_bitrate(struct usb_gadget *g)
 {
-	if (gadget_is_superspeed(g) && g->speed == USB_SPEED_SUPER)
+	if ((gadget_is_superspeed(g) && g->speed == USB_SPEED_SUPER) ||
+	    (gadget_is_superspeed_plus(g) && g->speed == USB_SPEED_SUPER_PLUS))
 		return 13 * 1024 * 8 * 1000 * 8;
 	else if (gadget_is_dualspeed(g) && g->speed == USB_SPEED_HIGH)
 		return 13 * 512 * 8 * 1000 * 8;
@@ -400,6 +401,75 @@ static struct usb_descriptor_header *ncm_ss_function[] = {
 	NULL,
 };
 
+/* super speed plus support: */
+
+static struct usb_endpoint_descriptor ssp_ncm_notify_desc = {
+	.bLength =		USB_DT_ENDPOINT_SIZE,
+	.bDescriptorType =	USB_DT_ENDPOINT,
+
+	.bEndpointAddress =	USB_DIR_IN,
+	.bmAttributes =		USB_ENDPOINT_XFER_INT,
+	.wMaxPacketSize =	cpu_to_le16(NCM_STATUS_BYTECOUNT),
+	.bInterval =		USB_MS_TO_HS_INTERVAL(NCM_STATUS_INTERVAL_MS)
+};
+
+static struct usb_ss_ep_comp_descriptor ssp_ncm_notify_comp_desc = {
+	.bLength =		sizeof(ssp_ncm_notify_comp_desc),
+	.bDescriptorType =	USB_DT_SS_ENDPOINT_COMP,
+
+	/* the following 3 values can be tweaked if necessary */
+	/* .bMaxBurst =		0, */
+	/* .bmAttributes =	0, */
+	.wBytesPerInterval =	cpu_to_le16(NCM_STATUS_BYTECOUNT),
+};
+
+static struct usb_endpoint_descriptor ssp_ncm_in_desc = {
+	.bLength =		USB_DT_ENDPOINT_SIZE,
+	.bDescriptorType =	USB_DT_ENDPOINT,
+
+	.bEndpointAddress =	USB_DIR_IN,
+	.bmAttributes =		USB_ENDPOINT_XFER_BULK,
+	.wMaxPacketSize =	cpu_to_le16(1024),
+};
+
+static struct usb_endpoint_descriptor ssp_ncm_out_desc = {
+	.bLength =		USB_DT_ENDPOINT_SIZE,
+	.bDescriptorType =	USB_DT_ENDPOINT,
+
+	.bEndpointAddress =	USB_DIR_OUT,
+	.bmAttributes =		USB_ENDPOINT_XFER_BULK,
+	.wMaxPacketSize =	cpu_to_le16(1024),
+};
+
+static struct usb_ss_ep_comp_descriptor ssp_ncm_bulk_comp_desc = {
+	.bLength =		sizeof(ssp_ncm_bulk_comp_desc),
+	.bDescriptorType =	USB_DT_SS_ENDPOINT_COMP,
+
+	/* the following 2 values can be tweaked if necessary */
+	/* .bMaxBurst =		0, */
+	/* .bmAttributes =	0, */
+};
+
+static struct usb_descriptor_header *ncm_ssp_function[] = {
+	(struct usb_descriptor_header *) &ncm_iad_desc,
+	/* CDC NCM control descriptors */
+	(struct usb_descriptor_header *) &ncm_control_intf,
+	(struct usb_descriptor_header *) &ncm_header_desc,
+	(struct usb_descriptor_header *) &ncm_union_desc,
+	(struct usb_descriptor_header *) &ecm_desc,
+	(struct usb_descriptor_header *) &ncm_desc,
+	(struct usb_descriptor_header *) &ssp_ncm_notify_desc,
+	(struct usb_descriptor_header *) &ssp_ncm_notify_comp_desc,
+	/* data interface, altsettings 0 and 1 */
+	(struct usb_descriptor_header *) &ncm_data_nop_intf,
+	(struct usb_descriptor_header *) &ncm_data_intf,
+	(struct usb_descriptor_header *) &ssp_ncm_in_desc,
+	(struct usb_descriptor_header *) &ssp_ncm_bulk_comp_desc,
+	(struct usb_descriptor_header *) &ssp_ncm_out_desc,
+	(struct usb_descriptor_header *) &ssp_ncm_bulk_comp_desc,
+	NULL,
+};
+
 /* string descriptors: */
 
 #define STRING_CTRL_IDX	0
@@ -1502,8 +1572,13 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
 	ss_ncm_notify_desc.bEndpointAddress =
 		fs_ncm_notify_desc.bEndpointAddress;
 
+	ssp_ncm_in_desc.bEndpointAddress = fs_ncm_in_desc.bEndpointAddress;
+	ssp_ncm_out_desc.bEndpointAddress = fs_ncm_out_desc.bEndpointAddress;
+	ssp_ncm_notify_desc.bEndpointAddress =
+		fs_ncm_notify_desc.bEndpointAddress;
+
 	status = usb_assign_descriptors(f, ncm_fs_function, ncm_hs_function,
-			ncm_ss_function, NULL);
+			ncm_ss_function, ncm_ssp_function);
 	if (status)
 		goto fail;
 
-- 
2.28.0.163.g6104cc2f0b6-goog

