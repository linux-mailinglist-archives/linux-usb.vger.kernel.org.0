Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E13844AA8F
	for <lists+linux-usb@lfdr.de>; Tue,  9 Nov 2021 10:26:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244867AbhKIJ3g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Nov 2021 04:29:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244806AbhKIJ3f (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Nov 2021 04:29:35 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5937EC061766
        for <linux-usb@vger.kernel.org>; Tue,  9 Nov 2021 01:26:50 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id w132-20020a25c78a000000b005c27f083240so29424853ybe.16
        for <linux-usb@vger.kernel.org>; Tue, 09 Nov 2021 01:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=h2dWSAmN/gNC5WgOYV7w3dVTds7wX0RdY+zBAEv201M=;
        b=FGUr/TFOJ9nUFpuKFus7c6We5oAF8IOVqyLN/mjPI0OWWxzM7esBdbVBslPHg0Gj5d
         vUabqJ+q9mipLakBFy+BbnFxVROGpqrOYhfe7x7B+1Bx4nSP8Fohz42akt7DxrCSAccC
         UnNki3vOABLo9jpAR5gQtSewocfGgjGjFaoexjTwFGn97dztvX1+FHwXsuk9P0U6l/p2
         7Mu3y5MzAt7m9nuGXLfxiJdnBlz65dc4F/ApM3dsEcyo/uSnhhJ7Q4q1bMffOxhYW6SF
         IE9hFXwDthrRbS7mJSaO3DhTMKZrdfs6vhoFiS2lN2UHXUjhkmWqkX1vIEkFWvoSEWpn
         gGKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=h2dWSAmN/gNC5WgOYV7w3dVTds7wX0RdY+zBAEv201M=;
        b=EBGHN6XQMIADDQj/DJVVkBkDemMkU+OhCI2VP5zxYifmuJD9HvfJAjTbbRzsEBqo8/
         6Ycx/CKqm58Dgdr5ddMOsr0SfLvSnU6btQsmLQMxQhCUku+PKWpIOvCk35OBw97J2r7s
         faw6Iu1zcthW9STplQOLKv7fQLW4ceUPBraJstWkyJKGYaWNQwzDGIS9rqMnXA3vlW/v
         Du6KoRGUapXn7qRrWofTeuzc8JFe1lzcc7swSY/9GZCnBKRN6Sf//7Q5FqDIk5oUM/P9
         k86YG7cQiLs+lw0uLaQnhdP/oU0oZ8+RME+hpqvK3Zh6Ul8t/EjpHlafg7uLVmdC8rK5
         z8UA==
X-Gm-Message-State: AOAM533LKm8aIQOxOpt3uHOjOpok4mE9g7A3FRGCwDtVqt0XI0NK7QKo
        f8vIE3gQuMJ/sMcWLvHNALf/xLm9uzGv+cXN85k=
X-Google-Smtp-Source: ABdhPJzrt4S5TrKdihV6q9OAFJpFxLaqgdVA+0Jmyvz55yulwMHNpYtUudtmPebcGx9LPFU4V03bdgn6OPRckjMSJ+g=
X-Received: from albertccwang.ntc.corp.google.com ([2401:fa00:fc:202:a18f:cf64:97e0:fceb])
 (user=albertccwang job=sendgmr) by 2002:a25:747:: with SMTP id
 68mr6518774ybh.151.1636450009655; Tue, 09 Nov 2021 01:26:49 -0800 (PST)
Date:   Tue,  9 Nov 2021 17:26:42 +0800
Message-Id: <20211109092642.3507692-1-albertccwang@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
Subject: [PATCH v3] usb: dwc3: gadget: Fix null pointer exception
From:   Albert Wang <albertccwang@google.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org, wcheng@codeaurora.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Albert Wang <albertccwang@google.com>,
        Jack Pham <quic_jackp@quicinc.com>
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

Fixes: f09ddcfcb8c5 ("usb: dwc3: gadget: Prevent EP queuing while stopping transfers")
Reviewed-by: Jack Pham <quic_jackp@quicinc.com>
Signed-off-by: Albert Wang <albertccwang@google.com>
---
Changelog since v3:
- Put 'Signed-off-by' in the bottom line

Changelog since v2:
- Add 'Fixes' message
- Add 'Reviewed-by' message

Changelog since v1:
- Add null pointer check in dwc3_gadget_endpoint_trbs_complete()
- Add null pointer check in dwc3_gadget_endpoint_transfer_in_progress()

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
2.34.0.rc0.344.g81b53c2807-goog

