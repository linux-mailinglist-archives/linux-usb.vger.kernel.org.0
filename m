Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00A982A9C8E
	for <lists+linux-usb@lfdr.de>; Fri,  6 Nov 2020 19:41:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727771AbgKFSl3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Nov 2020 13:41:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727800AbgKFSl2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Nov 2020 13:41:28 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1D23C0613CF
        for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2020 10:41:28 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id c20so2147402pfr.8
        for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2020 10:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=va4fdIrdP2IdsG/GMrr9ULupTAJYmD75mo7OfHaDQgk=;
        b=aGylUOm+hDDwVgunzYVsiy0jrr2dsOjYijGrNN+OfsqVEVG3hj3ksqVufLCmjdquzo
         GblZkxZ1khPUiBiSNEyMcTi2yB0jFKFa9xJwXAuBsIqnBPhtB8/y8iEhsV9LT5IbbP6K
         oXOmkhh5C5yRyS9EpMu6hfI69Ll/AfhADXn+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=va4fdIrdP2IdsG/GMrr9ULupTAJYmD75mo7OfHaDQgk=;
        b=ZN66YsmR7jzkmCgbr1uuS9q4knmAKkdJgxsu8zcR9dHscUcZQ0C47OnIByVq8mXx04
         GE6N53TKpqp89YrGcbrz9oHhBYXiOsoa2SOpVOuu7OAzKE2TJZISbSVhmcDgDt/B15qB
         0638Tqb1B1GfVoa29cksfCj9mCJltoXHdA2Uj3A6i5jyhxRKFgYrNHNMR9IJCkk0OK3g
         xsW0M5dmcIpp7lc2A/QITIWdOc9lJrwJ9Haai2kuIOvKgllFarJnylSe1cPFCV3bK0zu
         6uHyfkxt4XoULYEg4dAii7gOM9cJw9j9pJVZ8nGTGrEQsXwiDg6ZvTWLiFZwDxjuXxg4
         i4jw==
X-Gm-Message-State: AOAM531Ve/b1IlTa/XwiBqqp/uaLnFeiDetPf2Dh6G9Tvmj+erY0OKOw
        v8bajt+/1qrnG2FjECxkgvEy3g==
X-Google-Smtp-Source: ABdhPJyJtu/SBfDLacYRDH/63/REAhLo8Kftv5yFqIQ6ReAz1Vn7xkdyNIyR76XeRNjL6lIs4eGa9A==
X-Received: by 2002:aa7:934a:0:b029:18a:aaea:ff4 with SMTP id 10-20020aa7934a0000b029018aaaea0ff4mr3319762pfn.56.1604688088280;
        Fri, 06 Nov 2020 10:41:28 -0800 (PST)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
        by smtp.gmail.com with ESMTPSA id b6sm3246143pjq.42.2020.11.06.10.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 10:41:27 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org
Cc:     Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>
Subject: [PATCH v2 1/6] platform/chrome: cros_ec_typec: Make disc_done flag partner-only
Date:   Fri,  6 Nov 2020 10:40:59 -0800
Message-Id: <20201106184104.939284-2-pmalani@chromium.org>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
In-Reply-To: <20201106184104.939284-1-pmalani@chromium.org>
References: <20201106184104.939284-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Change the disc_done flag, which indicates whether PD discovery is
complete, to sop_disc_done instead, since we will process SOP and SOP'
discovery data separately.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes in v2:
- No changes.

 drivers/platform/chrome/cros_ec_typec.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index ce031a10eb1b..801c3d2c1fbd 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -57,8 +57,8 @@ struct cros_typec_port {
 	/* Port alt modes. */
 	struct typec_altmode p_altmode[CROS_EC_ALTMODE_MAX];
 
-	/* Flag indicating that PD discovery data parsing is completed. */
-	bool disc_done;
+	/* Flag indicating that PD partner discovery data parsing is completed. */
+	bool sop_disc_done;
 	struct ec_response_typec_discovery *sop_disc;
 	struct list_head partner_mode_list;
 };
@@ -210,7 +210,7 @@ static void cros_typec_remove_partner(struct cros_typec_data *typec,
 	typec_unregister_partner(port->partner);
 	port->partner = NULL;
 	memset(&port->p_identity, 0, sizeof(port->p_identity));
-	port->disc_done = false;
+	port->sop_disc_done = false;
 }
 
 static void cros_unregister_ports(struct cros_typec_data *typec)
@@ -727,18 +727,13 @@ static void cros_typec_handle_status(struct cros_typec_data *typec, int port_num
 		return;
 	}
 
-	if (typec->ports[port_num]->disc_done)
-		return;
-
 	/* Handle any events appropriately. */
-	if (resp.events & PD_STATUS_EVENT_SOP_DISC_DONE) {
+	if (resp.events & PD_STATUS_EVENT_SOP_DISC_DONE && !typec->ports[port_num]->sop_disc_done) {
 		ret = cros_typec_handle_sop_disc(typec, port_num);
-		if (ret < 0) {
+		if (ret < 0)
 			dev_err(typec->dev, "Couldn't parse SOP Disc data, port: %d\n", port_num);
-			return;
-		}
-
-		typec->ports[port_num]->disc_done = true;
+		else
+			typec->ports[port_num]->sop_disc_done = true;
 	}
 }
 
-- 
2.29.1.341.ge80a0c044ae-goog

