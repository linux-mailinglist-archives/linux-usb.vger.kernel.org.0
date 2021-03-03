Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71A9032B6A1
	for <lists+linux-usb@lfdr.de>; Wed,  3 Mar 2021 11:32:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237647AbhCCKbe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Mar 2021 05:31:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1842079AbhCCGt3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Mar 2021 01:49:29 -0500
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC0C5C061756
        for <linux-usb@vger.kernel.org>; Tue,  2 Mar 2021 22:48:48 -0800 (PST)
Received: by mail-pf1-x44a.google.com with SMTP id a18so1006978pfi.17
        for <linux-usb@vger.kernel.org>; Tue, 02 Mar 2021 22:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=sJTPRU61wkj/8X18GE/NltaTHGeTbWKgfmwT64xhMDQ=;
        b=K9JfA9BK6FN2k9nXLrdM+xjKw8Sud8sJ/ELtXv1L6e0JEJbjuKTF0ZVgqhyVSlxbYe
         eoJ+/a3MRLCTZlVgcmaCm6W2BwNePxRqZnCczMzqfdGxYJ4yPt1h8zCikgnu0retndpL
         VPaCrxawW4gXOB2VR9kqP1jxcp3yRC73mJIDCniUgHFBDvYhmXTqye3FwGcG/kSdJkaC
         xWSXDHGucG3zlsXKuB96qplAjzt2nOg6ib2lhAPRSFX4IVRcZ7kBqPTMFKXE9+SlpGcY
         z6gS6X1ZOkNlivb4LMk+KaB7CH/LLExiZBIDU0vjxzDGsBfzHwmUKWmOzZBFkxMAvw4m
         Wl0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=sJTPRU61wkj/8X18GE/NltaTHGeTbWKgfmwT64xhMDQ=;
        b=m3F5YahAehLrOAa6+k6KgDq+J8JKntpc0+9hK2zkL8IZw/IXGLv9lPFI0t3mW+I5Z2
         Sa2wNnZ1jTytHLFwB2/iv+t3LtglTErbytIY7Bm+7DpxPLtI+Q0Y7JSmliEQZUXJW4nV
         nOeDNvSUEr5fLlK8/dcEtWWkp3QVSTQmG6JlonqC0sspJ1944kdkfUccDa2iIdSSSBep
         fXqnqChNUR+lwgZf0eA9O1sIYc41lFuCZrdtyQYrMSeLdF2PJ0AfEXNIDfaRFJoXlo4u
         zyaMLwM4dVA2EqiCe9zj+Bh1qW22z2iliWCX6Dqe84kaVtIBcb9UsGy/74fdmkaBnkDA
         QRpA==
X-Gm-Message-State: AOAM532XW9k9p3yt4xXTXhSaOv+HLGTBeF3CAmgT4oChEzY3E/RDcdmr
        1OIoHtAM/GShDtipXugEVeCBSGx9rYY=
X-Google-Smtp-Source: ABdhPJzPojQhHpe4rIz4wxHM+lTnZFzyssypBGlR4STg1VbckYy/M0hFkIt72SYsxLCslygwj5TISWTzlS0=
Sender: "raychi via sendgmr" <raychi@raychi.tao.corp.google.com>
X-Received: from raychi.tao.corp.google.com ([2401:fa00:fc:202:d0b:ce1b:8f7e:f53a])
 (user=raychi job=sendgmr) by 2002:a17:90a:8d83:: with SMTP id
 d3mr775606pjo.0.1614754127807; Tue, 02 Mar 2021 22:48:47 -0800 (PST)
Date:   Wed,  3 Mar 2021 14:48:42 +0800
Message-Id: <20210303064842.2723785-1-raychi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
Subject: [PATCH] usb: dwc3: document usb_psy in struct dwc3
From:   Ray Chi <raychi@google.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        kyletso@google.com, Ray Chi <raychi@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The new struct member was added to struct dwc3, but
a documentation was missing:

drivers/usb/dwc3/core.h:1273: warning: Function parameter or member 'usb_psy' not described in 'dwc3'

Signed-off-by: Ray Chi <raychi@google.com>
---
 drivers/usb/dwc3/core.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 6708fdf358b3..ce6bd84e2b39 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -988,6 +988,7 @@ struct dwc3_scratchpad_array {
  * @role_sw: usb_role_switch handle
  * @role_switch_default_mode: default operation mode of controller while
  *			usb role is USB_ROLE_NONE.
+ * @usb_psy: pointer to power supply interface.
  * @usb2_phy: pointer to USB2 PHY
  * @usb3_phy: pointer to USB3 PHY
  * @usb2_generic_phy: pointer to USB2 PHY
-- 
2.30.1.766.gb4fecdf3b7-goog

