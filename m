Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 007182511CA
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 07:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728958AbgHYFzc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Aug 2020 01:55:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgHYFzb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Aug 2020 01:55:31 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2554BC061574
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 22:55:31 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id u128so8491228ybg.17
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 22:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=GLqgHIx28cw7lshxvBTzb4LB5PmwBFMWJoYCImcYWRM=;
        b=FJAMJOfuEjq2t3r+vtRrSBP2uPxrM9iEGSb+y4l3VrnlROxigA0mNPtZCchZDAoNHH
         jdHIe8+WNpj4xAo3TIXcDGgSP1gAwfpw4mH0Bbhpd+CECqB6OY+quw+4glDGrq7qIr6k
         O4LrJnDhg9c3IaiZnIsaVY4BwdBsFAmPgymrb+nky6JrAdBHhbC6dj3uFHuTjke/bE76
         swsdkasWhZ+KjaNuq56VUekJO6qguA1FcurMs/0sXTwO6c4AV5/vfeZzFrepfyiCClUc
         jpBm3mE6on8EzjVjdIFOEbozQwOreWDuPS+/wZB+k8JFmsWPzFfOQMDK0gjGS51b3ziS
         vT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=GLqgHIx28cw7lshxvBTzb4LB5PmwBFMWJoYCImcYWRM=;
        b=UqZzhjwTwprxD10oZsMqCsTmmtiM81DBiy8gB7hnGk9i8+dTwv841K3dM4Mz8EpZbq
         DT6Qw8sAGaVydUCRlqixHCKwtnEMyGuosizfvCMFPxRaJM7lkyHQsOUg23jaXIb+lIea
         HcUhnvpor5nFvpGhaH2Xgao6v9V2nD6Qrkqi77YccBC9pzCiREA+HBDehCG2ujdFR/G/
         QQw11gEP79h5fevP5KQvDUTpBl2GRgnZiK0KSegsqLurKYuR+k65bn6HuNlKW2iZ3/Gd
         1u9cziKH3aFCUZxQJBPZ0paAyKFkCYA6SI/hNwDIKtubuMwYL5xyEjplj7UcItbunzXj
         wZdA==
X-Gm-Message-State: AOAM533yiA3E+7JOiNlKcyZ0LAHLAUFmL5uG3DXClzfdUPlfrAAZgrKV
        EJJAvTiNwu1yxaDeZGWc+mdCL/Odt6o60U9mLCvopE8XYg2xLcRhWVfWjrigDQmG6Y+8+CtoMFE
        muTZsd6cTjR7XaTaIQdK00y64aU3z9tVr9o6JC3bNk9J3dTbFFTOyFeoxzl3J4bOrQLHA
X-Google-Smtp-Source: ABdhPJz6xaz19X8bactEf0+/QPH+PK/CEQeGHVXsZOVCAse0HoQRODgGmYbYVo5faFA4B85fRb/gmzLCGmH/
X-Received: from lorenzo.tok.corp.google.com ([2401:fa00:8f:2:eeb1:d7ff:fe57:b7d5])
 (user=lorenzo job=sendgmr) by 2002:a25:8812:: with SMTP id
 c18mr12950357ybl.330.1598334930286; Mon, 24 Aug 2020 22:55:30 -0700 (PDT)
Date:   Tue, 25 Aug 2020 14:55:03 +0900
In-Reply-To: <20200825055505.765782-1-lorenzo@google.com>
Message-Id: <20200825055505.765782-2-lorenzo@google.com>
Mime-Version: 1.0
References: <20200825055505.765782-1-lorenzo@google.com>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH v3 1/3] usb: gadget: f_ncm: fix ncm_bitrate for SuperSpeed and above.
From:   Lorenzo Colitti <lorenzo@google.com>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        zenczykowski@gmail.com, Lorenzo Colitti <lorenzo@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently, SuperSpeed NCM gadgets report a speed of 851 Mbps
in USB_CDC_NOTIFY_SPEED_CHANGE. But the calculation appears to
assume 16 packets per microframe, and USB 3 and above no longer
use microframes.

Maximum speed is actually much higher. On a direct connection,
theoretical throughput is at most 3.86 Gbps for gen1x1 and
9.36 Gbps for gen2x1, and I have seen gadget->host iperf
throughput of >2 Gbps for gen1x1 and >4 Gbps for gen2x1.

Unfortunately the ConnectionSpeedChange defined in the CDC spec
only uses 32-bit values, so we can't report accurate numbers for
10Gbps and above. So, report 3.75Gbps for SuperSpeed (which is
roughly maximum theoretical performance) and 4.25Gbps for
SuperSpeed Plus (which is close to the maximum that we can report
in a 32-bit unsigned integer).

This results in:

[50879.191272] cdc_ncm 2-2:1.0 enx228b127e050c: renamed from usb0
[50879.234778] cdc_ncm 2-2:1.0 enx228b127e050c: 3750 mbit/s downlink 3750 mbit/s uplink

on SuperSpeed and:

[50798.434527] cdc_ncm 8-2:1.0 enx228b127e050c: renamed from usb0
[50798.524278] cdc_ncm 8-2:1.0 enx228b127e050c: 4250 mbit/s downlink 4250 mbit/s uplink

on SuperSpeed Plus.

Fixes: 1650113888fe ("usb: gadget: f_ncm: add SuperSpeed descriptors for CDC NCM")
Signed-off-by: Lorenzo Colitti <lorenzo@google.com>
---
 drivers/usb/gadget/function/f_ncm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 1d900081b1..5b9266a87f 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -85,8 +85,10 @@ static inline struct f_ncm *func_to_ncm(struct usb_function *f)
 /* peak (theoretical) bulk transfer rate in bits-per-second */
 static inline unsigned ncm_bitrate(struct usb_gadget *g)
 {
-	if (gadget_is_superspeed(g) && g->speed == USB_SPEED_SUPER)
-		return 13 * 1024 * 8 * 1000 * 8;
+	if (gadget_is_superspeed(g) && g->speed >= USB_SPEED_SUPER_PLUS)
+		return 4250000000U;
+	else if (gadget_is_superspeed(g) && g->speed == USB_SPEED_SUPER)
+		return 3750000000U;
 	else if (gadget_is_dualspeed(g) && g->speed == USB_SPEED_HIGH)
 		return 13 * 512 * 8 * 1000 * 8;
 	else
-- 
2.28.0.297.g1956fa8f8d-goog

