Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE295404708
	for <lists+linux-usb@lfdr.de>; Thu,  9 Sep 2021 10:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbhIII3P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Sep 2021 04:29:15 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:39522 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231634AbhIII3M (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Sep 2021 04:29:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631176083; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=x6XcbZefvqoWPNVMCwRAIjlGEglkJhb/IwYAsfmaYdc=; b=KyoujdOG9fbE6UYdaPXxy+gi8pqM96va8A+w5Vq2/cnhddvHrLJKoBI7eyhAvZDbQhsFUleI
 WmHDA3cv9brD3DvKUql1iGq0+n5iHRR7PmQnuCzT6P6+FtV2rGUbmB/e+QIP25rfWBaw/8us
 NcZa/lDqeJAjXwnsCMH2nku3Ios=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6139c587ab61cfa9f4d5dd76 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Sep 2021 08:27:51
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 557F4C4361A; Thu,  9 Sep 2021 08:27:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E4492C4338F;
        Thu,  9 Sep 2021 08:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E4492C4338F
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
Subject: [PATCH v2 1/2] usb: gadget: f_uac2: Add missing companion descriptor for feedback EP
Date:   Thu,  9 Sep 2021 01:26:50 -0700
Message-Id: <20210909082651.11912-2-jackp@codeaurora.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20210909082651.11912-1-jackp@codeaurora.org>
References: <20210909082651.11912-1-jackp@codeaurora.org>
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

