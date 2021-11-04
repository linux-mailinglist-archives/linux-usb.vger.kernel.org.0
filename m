Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D159444ED7
	for <lists+linux-usb@lfdr.de>; Thu,  4 Nov 2021 07:26:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbhKDG3F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Nov 2021 02:29:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbhKDG3B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Nov 2021 02:29:01 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66D34C061714
        for <linux-usb@vger.kernel.org>; Wed,  3 Nov 2021 23:26:24 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id t24-20020a252d18000000b005c225ae9e16so7460385ybt.15
        for <linux-usb@vger.kernel.org>; Wed, 03 Nov 2021 23:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=4+lptrSez3O7I9lFhrCLmPI8ZR+QIBXMWJtPqo31Kho=;
        b=SN7IJCouH2K1RaDvT7DpS9fRd1EKpz2D+KwHt5kKFYQn8GJJleawLFP+9rQ7724awt
         MsANgzCrp8apBGjUpdSLvFUtzmPevdsMwOZK4d48DfaRvnuf9LPUrv1xF8+uyCrhiTLr
         U7fwK828KxzzlQeUbvAupQ0LqzGhmUQSAltbZrlEl0+uZ/Xz9/uYF4uQ3sB99UPXUTH0
         0FqBsFcgII2ZEdZfDbY5VDongWQnRMYf6uhyflx1BT0h/UWoH9aRHTZ1RkbDm9i7vA/U
         Fko9dxVExFxxc9rNalm8FlJnzXBnfe3jbzxaXX43FRxDtxcU2IItkAvLNAjoLPALroDt
         scWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=4+lptrSez3O7I9lFhrCLmPI8ZR+QIBXMWJtPqo31Kho=;
        b=rXcz9xxHTwj3pB49m0wRdvQ0k2W1kEApWejdKro17L7rf5fOc8BmDm1Ri3HpZSXdo9
         +iyGOfprLUICDzTiXiX/f4cbdjUBJxSFRTRlzuVd+XO4N9yLhAM1tux47hHB+CLFI2Ju
         eBYF/ORmA97V5BU0yn5+oq2pJUrYqPgfc7pkK7jXc8InaFH85o+9A0pXw5anEMU6xbZb
         wNM2qY4ZuA4ChelciaBiTPUbbBi4ycMjgs2UPw9VzOyq1mdtigDEYGZ5CedzQNxVwSah
         r7nlrTjqanNvrTFJyYZKVdxFHKCadMZdIG51Lzguuxpo2q01vlpqsIx266h12flceaSW
         UcVg==
X-Gm-Message-State: AOAM533ASN58cZDES+PAKXBedSqL5UuvpTDoPonbaYaEu3SDc6MZ3DgH
        dMabBErGhT2oaW54iq34EcuaQzcy+nEGMjIhv9g=
X-Google-Smtp-Source: ABdhPJwTHX0W7XivKhw5GZhwmnwULoRpTPIU8SfZWXMRJHpAurMGO9os+98teOKiUMv8vlHtXMXy6dNUx75dqiOcjPM=
X-Received: from albertccwang.ntc.corp.google.com ([2401:fa00:fc:202:b82c:caf0:c403:32cf])
 (user=albertccwang job=sendgmr) by 2002:a25:6c06:: with SMTP id
 h6mr52939921ybc.222.1636007183647; Wed, 03 Nov 2021 23:26:23 -0700 (PDT)
Date:   Thu,  4 Nov 2021 14:26:16 +0800
Message-Id: <20211104062616.948353-1-albertccwang@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
Subject: [PATCH] usb: dwc3: gadget: Fix null pointer exception
From:   Albert Wang <albertccwang@google.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Albert Wang <albertccwang@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In the endpoint interrupt functions
dwc3_gadget_endpoint_transfer_in_progress() and
dwc3_gadget_endpoint_trbs_complete() will dereference the endpoint
descriptor. But it could be cleared in __dwc3_gadget_ep_disable()
when accessory disconnected. So we need to check whether it is null
or not before dereferencing it.

Signed-off-by: Albert Wang <albertccwang@google.com>
---
 drivers/usb/dwc3/gadget.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 23de2a5a40d6..83c7344888fd 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -3252,6 +3252,9 @@ static bool dwc3_gadget_endpoint_trbs_complete(struct dwc3_ep *dep,
 	struct dwc3		*dwc = dep->dwc;
 	bool			no_started_trb = true;
 
+	if (!dep->endpoint.desc)
+		return no_started_trb;
+
 	dwc3_gadget_ep_cleanup_completed_requests(dep, event, status);
 
 	if (dep->flags & DWC3_EP_END_TRANSFER_PENDING)
@@ -3299,6 +3302,9 @@ static void dwc3_gadget_endpoint_transfer_in_progress(struct dwc3_ep *dep,
 {
 	int status = 0;
 
+	if (!dep->endpoint.desc)
+		return;
+
 	if (usb_endpoint_xfer_isoc(dep->endpoint.desc))
 		dwc3_gadget_endpoint_frame_from_event(dep, event);
 
-- 
2.33.1.1089.g2158813163f-goog

