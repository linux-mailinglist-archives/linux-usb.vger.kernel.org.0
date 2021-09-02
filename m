Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C06B53FE73E
	for <lists+linux-usb@lfdr.de>; Thu,  2 Sep 2021 03:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbhIBBo6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Sep 2021 21:44:58 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:27057 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229454AbhIBBo5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Sep 2021 21:44:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630547040; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=epQFP5ue2DO3I3rcdFR7lfbTTabqEzgPR3rWnJx3kXg=; b=vRRhcavPktm85c/5yjtQTq5V5n27AdS+osHCtjufqaV0iiNkz92S6ZvEqvk7VNxgP0GyMdLQ
 I8p2mh1/az8gjh4mv8ICAlcxa/DNDxNgT80TG5d++e0rw+mVklrnm45h0qtng0pM276leHo0
 GaS5HoJzRSfQF0awtt6lmOvnkEU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 61302c4f89cdb62061a84d24 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 02 Sep 2021 01:43:43
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E3044C4361B; Thu,  2 Sep 2021 01:43:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 45209C4338F;
        Thu,  2 Sep 2021 01:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 45209C4338F
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
Subject: [PATCH] usb: gadget: f_uac2: Add missing companion descriptor for feedback EP
Date:   Wed,  1 Sep 2021 18:43:17 -0700
Message-Id: <20210902014317.16775-1-jackp@codeaurora.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The f_uac2 function fails to enumerate when connected in SuperSpeed
due to the feedback endpoint missing the companion descriptor.
We can reuse the ss_epin_desc_comp descriptor and append it behind the
ss_epin_fback_desc both in the static definition of the ss_audio_desc
structure as well as its dynamic construction in setup_headers().

Fixes: 24f779dac8f3 ("usb: gadget: f_uac2/u_audio: add feedback endpoint support")
Signed-off-by: Jack Pham <jackp@codeaurora.org>
---
 drivers/usb/gadget/function/f_uac2.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 3c34995276e7..5c4917f157e2 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -597,6 +597,7 @@ static struct usb_descriptor_header *ss_audio_desc[] = {
 	(struct usb_descriptor_header *)&ss_epout_desc_comp,
 	(struct usb_descriptor_header *)&as_iso_out_desc,
 	(struct usb_descriptor_header *)&ss_epin_fback_desc,
+	(struct usb_descriptor_header *)&ss_epin_desc_comp,
 
 	(struct usb_descriptor_header *)&std_as_in_if0_desc,
 	(struct usb_descriptor_header *)&std_as_in_if1_desc,
@@ -773,8 +774,11 @@ static void setup_headers(struct f_uac2_opts *opts,
 
 		headers[i++] = USBDHDR(&as_iso_out_desc);
 
-		if (EPOUT_FBACK_IN_EN(opts))
+		if (EPOUT_FBACK_IN_EN(opts)) {
 			headers[i++] = USBDHDR(epin_fback_desc);
+			if (epin_desc_comp)
+				headers[i++] = USBDHDR(epin_desc_comp);
+		}
 	}
 
 	if (EPIN_EN(opts)) {
-- 
2.24.0

