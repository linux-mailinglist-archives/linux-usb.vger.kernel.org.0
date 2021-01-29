Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1D4D308592
	for <lists+linux-usb@lfdr.de>; Fri, 29 Jan 2021 07:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232076AbhA2GP5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Jan 2021 01:15:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232051AbhA2GPl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 Jan 2021 01:15:41 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DE87C061794
        for <linux-usb@vger.kernel.org>; Thu, 28 Jan 2021 22:14:25 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id cq1so5228867pjb.4
        for <linux-usb@vger.kernel.org>; Thu, 28 Jan 2021 22:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mi7AOcfFUGitVONrprMsQHj4LxmZ5B1spR/6XE6WI24=;
        b=XWHrA5wQcaxgT/7wCdE1JwDfaXQZ+6ETii1M/NKnsgNmm3Rw0RzKplmiJYI6VPRJqE
         0xz1x9AjPLjEBJEKui8w9LNIIVBNokzbBHkM3jJvfhS+ZigqdvXJG2ZKKOWa7PAHVNGV
         CWqOsMMjCSNOeaHl/EtNw2zhND/tOS0cP5cps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mi7AOcfFUGitVONrprMsQHj4LxmZ5B1spR/6XE6WI24=;
        b=ugK3L9NUYo+KtQlo6/bohiJuOZYMqtNZyxNMyc0tcUmYaIcx8l3eP3vxIj17fCJNhK
         vPRY3t3MIf/EKar2uWW5kYzIRGC0mThn3pwTK8JSEjvSImq+z7iiZrrW14HtzFvWalJd
         cV2JRP7iJH3BCLzY62JluWGaVjcdOE8cc9xITRW4KTJDhIwa/X8mL4Vl+2t97s65jvcL
         OYY1BMwZqK3LR93/caVq+vdvU2J3AyB28L0AcCP8GpY3MjWP+001EwHhgSzJ0vXPKppX
         FtUvmaAk+A2PbFjzUAwDMImRpq4rntarKLoX2ErvSf7Y6PH7m7tA5H8y3/DtD6+DUsx4
         3hPQ==
X-Gm-Message-State: AOAM5316D5R/x79W8aOBb60bzp5ING6ijCvGUZMfDp68rAqzjbpDZ+n4
        taMlXQH/RHoUWOx4hD5wOvCQIg==
X-Google-Smtp-Source: ABdhPJwyEQVWnLU1mfrtjCHnnHYhyoYWWlRB3ViU90872VJ/R7QtJKmcFPBN54F36ErRPpUa6buMSg==
X-Received: by 2002:a17:90b:246:: with SMTP id fz6mr3087603pjb.131.1611900864828;
        Thu, 28 Jan 2021 22:14:24 -0800 (PST)
Received: from bleung.mtv.corp.google.com ([2620:15c:202:201:f693:9fff:fef4:fc72])
        by smtp.gmail.com with ESMTPSA id 17sm7551013pfv.13.2021.01.28.22.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 22:14:24 -0800 (PST)
From:   Benson Leung <bleung@chromium.org>
To:     heikki.krogerus@linux.intel.com, enric.balletbo@collabora.com,
        pmalani@chromium.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     groeck@chromium.org, bleung@google.com, bleung@chromium.org
Subject: [PATCH 6/6] platform/chrome: cros_ec_typec: Set opmode to PD on SOP connected
Date:   Thu, 28 Jan 2021 22:14:06 -0800
Message-Id: <20210129061406.2680146-7-bleung@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210129061406.2680146-1-bleung@chromium.org>
References: <20210129061406.2680146-1-bleung@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When SOP Discovery is done, set the opmode to PD if status indicates
SOP is connected.

SOP connected indicates a PD contract is in place, and is a solid
indication we have transitioned to PD power negotiation, either as
source or sink.

Signed-off-by: Benson Leung <bleung@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 6bc6fafd54a4..a7778258d0a0 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -900,6 +900,9 @@ static void cros_typec_handle_status(struct cros_typec_data *typec, int port_num
 			dev_err(typec->dev, "Couldn't parse SOP Disc data, port: %d\n", port_num);
 		else
 			typec->ports[port_num]->sop_disc_done = true;
+
+		if (resp.sop_connected)
+			typec_set_pwr_opmode(typec->ports[port_num]->port, TYPEC_PWR_MODE_PD);
 	}
 
 	if (resp.events & PD_STATUS_EVENT_SOP_PRIME_DISC_DONE &&
-- 
2.30.0.365.g02bc693789-goog

