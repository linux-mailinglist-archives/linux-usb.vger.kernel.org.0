Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 966C02A8C12
	for <lists+linux-usb@lfdr.de>; Fri,  6 Nov 2020 02:28:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732577AbgKFB2c (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Nov 2020 20:28:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731111AbgKFB2c (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Nov 2020 20:28:32 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CF5DC0613CF
        for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2020 17:28:32 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id r186so2689312pgr.0
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2020 17:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Isl/WzUuPljZe1UXO1RGJXR4af+lyqHxbfYjSyUmTkQ=;
        b=GxVvL+MS9hLkAgTYVlotm7VFLMcrEv7IN1lbn7z4vA8niPlW7ShKz01QQGDywB8JQA
         9101aQF4fD+5MQUWb3yRDq2L+BG0PeGz/YbjEwpXSjaxnnSSaqeB4TQQo4MLzLOVpoMK
         TD8MHX7GCV0SA0+0TiJCubI2WO+XBdAk0lirw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Isl/WzUuPljZe1UXO1RGJXR4af+lyqHxbfYjSyUmTkQ=;
        b=SVFE9ebC3U/EXkaejjg2QLLfeIiY1mEwzO+l7vbg0TjMPFCfl5PyxSBdJgHL1GYoEO
         KK0biaKN6o+zQYbp78k9d6myvBhP6tVWkCGJSvOQ+1UiDdkz3ytzLfRyTroLiLjp2tyG
         ISFTZI4mm1+ZMblZJ6RAJQBoEgdUAaxtNDVvB4aL0CsVeBpY3HFpfPGH9Lb6ah6M7FoA
         OEor0NgiU+NQPjEsFDxhUiTu4p96n0xoXu4lY2szj7WHA405upHqhyqPyi0yWACB/O0x
         ca5YmqgZxYEjvTQFbOct9fX2S3v312XQrr6lyYKOWNzSr6qVvDuDGDSEjxpHNp1touBJ
         dNQQ==
X-Gm-Message-State: AOAM530oM94Xgqx6d4yaVQcZiTgpPr+qa1kK1CdX//YtoUfSfCMkDk8v
        494l8F4gSv0jDGgH8OaN+H9s8w==
X-Google-Smtp-Source: ABdhPJxlLCFCJ/JcONTp3MdrmBI/FubXi07TSbaMEbkuhAwR7QX9NX8DKdtYbY5LrycHI/e2SvoSHA==
X-Received: by 2002:a17:90b:d18:: with SMTP id n24mr5512719pjz.206.1604626111708;
        Thu, 05 Nov 2020 17:28:31 -0800 (PST)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
        by smtp.gmail.com with ESMTPSA id e2sm3567887pgd.27.2020.11.05.17.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 17:28:30 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     heikki.krogerus@linux.intel.com, dzigterman@chromium.org,
        alevkoy@chromium.org, Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <groeck@chromium.org>,
        linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
Subject: [PATCH 1/6] platform/chrome: cros_ec_typec: Make disc_done flag partner-only
Date:   Thu,  5 Nov 2020 17:27:53 -0800
Message-Id: <20201106012758.525472-2-pmalani@chromium.org>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
In-Reply-To: <20201106012758.525472-1-pmalani@chromium.org>
References: <20201106012758.525472-1-pmalani@chromium.org>
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

