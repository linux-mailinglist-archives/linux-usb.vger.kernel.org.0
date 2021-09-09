Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 612E7405C58
	for <lists+linux-usb@lfdr.de>; Thu,  9 Sep 2021 19:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241914AbhIIRuQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Sep 2021 13:50:16 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:26034 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241940AbhIIRuM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Sep 2021 13:50:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631209740; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=jgKwnDnul4W6Cz5A05l4R979WHX5zslHi9mrww3o09w=; b=cjUS3ofPQz9T2NgTqHpy1b5LDj8Pf3UbqGqnsESdNI8wD7Vid1pQDIJ56Li28wLyXyAKX/5Y
 xZx9y2ChVrPD+vtv0o7D9yObsPZNP7g/E74hIYDznwAJwiV6ls3m8qe2TkRK2robUhV/eb2Y
 KzJkg+PvyWxJkBI4YU9TeNo/dHg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 613a48e7ab61cfa9f4b2891c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Sep 2021 17:48:23
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E2D55C4360C; Thu,  9 Sep 2021 17:48:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 89BABC4338F;
        Thu,  9 Sep 2021 17:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 89BABC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Jack Pham <jackp@codeaurora.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     linux-usb@vger.kernel.org, Ferry Toth <fntoth@gmail.com>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Jack Pham <jackp@codeaurora.org>
Subject: [PATCH v3 1/2] usb: gadget: f_uac2: Add missing companion descriptor for feedback EP
Date:   Thu,  9 Sep 2021 10:48:10 -0700
Message-Id: <20210909174811.12534-2-jackp@codeaurora.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20210909174811.12534-1-jackp@codeaurora.org>
References: <20210909174811.12534-1-jackp@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The f_uac2 function fails to enumerate when connected in SuperSpeed
due to the feedback endpoint missing the companion descriptor.
Add a new ss_epin_fback_desc_comp descriptor and append it behind the
ss_epin_fback_desc both in the static definition of the ss_audio_desc
structure as well as its dynamic construction in setup_headers().

Fixes: 24f779dac8f3 ("usb: gadget: f_uac2/u_audio: add feedback endpoint support")
Signed-off-by: Jack Pham <jackp@codeaurora.org>
---
v3: No change
v2: Created a separate descriptor just for the feedback endpoint. This is
    in preparation for patch 2 which populates the wBytesPerInterval
    which may be different per endpoint.

 drivers/usb/gadget/function/f_uac2.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 3c34995276e7..d89c1ebb07f4 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -406,6 +406,14 @@ static struct usb_endpoint_descriptor ss_epin_fback_desc = {
 	.bInterval = 4,
 };
 
+static struct usb_ss_ep_comp_descriptor ss_epin_fback_desc_comp = {
+	.bLength		= sizeof(ss_epin_fback_desc_comp),
+	.bDescriptorType	= USB_DT_SS_ENDPOINT_COMP,
+	.bMaxBurst		= 0,
+	.bmAttributes		= 0,
+	.wBytesPerInterval	= cpu_to_le16(4),
+};
+
 
 /* Audio Streaming IN Interface - Alt0 */
 static struct usb_interface_descriptor std_as_in_if0_desc = {
@@ -597,6 +605,7 @@ static struct usb_descriptor_header *ss_audio_desc[] = {
 	(struct usb_descriptor_header *)&ss_epout_desc_comp,
 	(struct usb_descriptor_header *)&as_iso_out_desc,
 	(struct usb_descriptor_header *)&ss_epin_fback_desc,
+	(struct usb_descriptor_header *)&ss_epin_fback_desc_comp,
 
 	(struct usb_descriptor_header *)&std_as_in_if0_desc,
 	(struct usb_descriptor_header *)&std_as_in_if1_desc,
@@ -705,6 +714,7 @@ static void setup_headers(struct f_uac2_opts *opts,
 {
 	struct usb_ss_ep_comp_descriptor *epout_desc_comp = NULL;
 	struct usb_ss_ep_comp_descriptor *epin_desc_comp = NULL;
+	struct usb_ss_ep_comp_descriptor *epin_fback_desc_comp = NULL;
 	struct usb_endpoint_descriptor *epout_desc;
 	struct usb_endpoint_descriptor *epin_desc;
 	struct usb_endpoint_descriptor *epin_fback_desc;
@@ -730,6 +740,7 @@ static void setup_headers(struct f_uac2_opts *opts,
 		epout_desc_comp = &ss_epout_desc_comp;
 		epin_desc_comp = &ss_epin_desc_comp;
 		epin_fback_desc = &ss_epin_fback_desc;
+		epin_fback_desc_comp = &ss_epin_fback_desc_comp;
 		ep_int_desc = &ss_ep_int_desc;
 	}
 
@@ -773,8 +784,11 @@ static void setup_headers(struct f_uac2_opts *opts,
 
 		headers[i++] = USBDHDR(&as_iso_out_desc);
 
-		if (EPOUT_FBACK_IN_EN(opts))
+		if (EPOUT_FBACK_IN_EN(opts)) {
 			headers[i++] = USBDHDR(epin_fback_desc);
+			if (epin_fback_desc_comp)
+				headers[i++] = USBDHDR(epin_fback_desc_comp);
+		}
 	}
 
 	if (EPIN_EN(opts)) {
-- 
2.24.0

