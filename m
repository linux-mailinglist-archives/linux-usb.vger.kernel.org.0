Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9548248C3F
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 18:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728455AbgHRQ7d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 12:59:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728499AbgHRQ7N (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Aug 2020 12:59:13 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F894C061389
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2020 09:59:13 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id e12so22833175ybc.18
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2020 09:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=EiNkwXFQd8W0SM8sGlIRg+d9K0YGA9xsh5Oi70MoV+M=;
        b=iO909+AaxNZpovJge1m6hGCQdysVAjP3/zsY0ehxNX2NPbEitJvwzfgl6D6Upxz6ST
         v+NQwVUDYz9V3xJ9SZH7sczSGsEoJjSgXHH2W54I5aVpC/Jmtaa6TsTFehhtCzX4jjbv
         poCPm2p7jHGAd1DYFzhpf/huZ3lfq6XtOsuVHyzdCamRuFBkMGaFfDR5LZxtRo0T0TmA
         6QONCqjMtLXKkMuCcNhOVtFhgcPNKTWahCu1a6ff5q9pK6SHQL0Fnyktqc7X39JS2sLz
         Yh5A4lrW3DMQyWkKpq/kz+9c7ZhjHV7TCJQEwU7it9o4wJdVJqHwzL2DraQeQAihtCJG
         BokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=EiNkwXFQd8W0SM8sGlIRg+d9K0YGA9xsh5Oi70MoV+M=;
        b=tGY0cY5L8N/mwL1NP3/Rp8GWjrrHwhc7Zwm8jJD6H8vStW0opGw9vkAXl2z+2II7Nk
         g5n5xhCi0b1nHoUK5YPLIu/UVOci0e3nRA+PirArnFGu/G33wPyKdyT16awjNilAI7yn
         A2yp1jr5aMBQCR1T7fxCVtb2AznTNV+sWe/LolEe2SG9hrg2hPe9amzRL64MUr4XAMsP
         eQyZbMVICFrnNBUybwaJTu189tAfYOKHQ0IzlBeY9hoeiwV9iUkaKgptl7l2BIUepJhz
         kkOzzPeCVlCeLurWcWCKQYX6B2F0IPpqvw9h+mKfXkpMPC0VrOgm1nJL8FEUwVhVmSSR
         yuWQ==
X-Gm-Message-State: AOAM531N56Er2L3fm09aDlUaaT3TucdpVGYXUCFj3QX84IxSf8pX48eE
        yWtFTppWfRGrXzH9imeZxDi+lgTSCTPRHKRBOEpkAXsQqEv6Es4GyX91d0/708t0cIGEm23yv+u
        HrEtocxZmLVIzSU1TGahveVnqtePJhz5kqupXzcsDY3ksJ44Z1g46lah5ZDLQzIVqxLIS
X-Google-Smtp-Source: ABdhPJxa74SXayCeF9XV1NNm3IZfx8p0zeDnfk5gS/7wmNGliCcFFjGiZ/bnMA71tHadP74Cjv+/bZksiOCE
X-Received: by 2002:a25:f20d:: with SMTP id i13mr28048244ybe.152.1597769952499;
 Tue, 18 Aug 2020 09:59:12 -0700 (PDT)
Date:   Wed, 19 Aug 2020 01:58:48 +0900
In-Reply-To: <20200818165848.4117493-1-lorenzo@google.com>
Message-Id: <20200818165848.4117493-3-lorenzo@google.com>
Mime-Version: 1.0
References: <20200818165848.4117493-1-lorenzo@google.com>
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
Subject: [PATCH v2 3/3] usb: gadget: f_ncm: allow using NCM in SuperSpeed Plus gadgets.
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

Tested: enabled f_ncm on a dwc3 gadget and 10Gbps link, ran iperf
Signed-off-by: Lorenzo Colitti <lorenzo@google.com>
---
 drivers/usb/gadget/function/f_ncm.c | 76 ++++++++++++++++++++++++++++-
 1 file changed, 75 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 57ccf30c6c..01242454d5 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -400,6 +400,75 @@ static struct usb_descriptor_header *ncm_ss_function[] = {
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
+	.bMaxBurst =		15,
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
+	.bMaxBurst =		15,
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
@@ -1502,8 +1571,13 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
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
2.28.0.220.ged08abb693-goog

