Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23F6F219501
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jul 2020 02:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbgGIAY7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jul 2020 20:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726124AbgGIAY6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jul 2020 20:24:58 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EE7FC08C5C1
        for <linux-usb@vger.kernel.org>; Wed,  8 Jul 2020 17:24:58 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id f2so80063plr.8
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2020 17:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1CxPOUUi/VbatXi14/IdiolcKlTmPYq8+lcAvYMRRs8=;
        b=f0Gn/DiROddgQ0JOGDsL/zcY8e5gJXQ8wjtLQMEVX/E3zlaxESrwNVOFUxxVMdDRcs
         zvw7m60HZ337fPgv5XDmOSJlclWpicJTIrMZHrJ44f+Kx5iL2vKKsFytVukYBeYotzPI
         +KdIu08a5h497ORTYdb7Z6vDFsCtei0lodH0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1CxPOUUi/VbatXi14/IdiolcKlTmPYq8+lcAvYMRRs8=;
        b=roRM7lDcZsFGJnqO26vpd21yNjq+GhM66r0mcYKbzuadIau/blAhKcmo+SN0711isP
         VBQDReas5b0NYgyFW7DjgKb2rYThWy0wTbfuFZtN7pzHgnqU2pDLW6YuGwwzYKZ5B6Qn
         9U0ZSjqHKC5Fa8Z8N3MkWnklpnR/vmi0DRuQgM6sdL5ni40OjzOa7L/NS215f8d9j62q
         AS+3VJ0pcbgBWFKZM40lbC3Da+BQPyqX7qAoLxv3W8G5Cb3J63XR+0EZckNae9JqpQbm
         tXsgvDWdLhSkLFeDBi5SW7gC+V8yTgOTGE1b3s29h6AjPHkjRMwXbph+/RktKxWfUsBg
         dIVA==
X-Gm-Message-State: AOAM5305hCY1yAh7HNSC+6+r1oa2/2dRQBbHEDCKwp+GXnzHl8XK1R/d
        LFwU06FUmxUgKkQ8EJMLtVRIWQ==
X-Google-Smtp-Source: ABdhPJwH24Hq43xyUPIKQoirRhi89n1ZnZIWcNdyQ4OjdOq/VNjzcHD/Lpc8U13AKmMahPw/SjftuQ==
X-Received: by 2002:a17:902:b40f:: with SMTP id x15mr15105881plr.329.1594254297879;
        Wed, 08 Jul 2020 17:24:57 -0700 (PDT)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
        by smtp.gmail.com with ESMTPSA id b18sm589184pju.10.2020.07.08.17.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 17:24:57 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org,
        Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        linux-usb@vger.kernel.org (open list:USB TYPEC INTEL PMC MUX DRIVER)
Subject: [PATCH] usb: typec: intel_pmc_mux: Avoid connect request on disconnect
Date:   Wed,  8 Jul 2020 17:24:41 -0700
Message-Id: <20200709002441.1309189-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When pmc_usb_mux_set() is invoked when a device is disconnected, a valid
scenario is for state->alt == NULL and state->mode == TYPEC_STATE_USB.

In such cases, if a pmc_usb_disconnect() has already been issued (from
either pmc_usb_set_orientation() when orientation ==
TYPEC_ORIENTATION_NONE, or pmc_usb_set_role() when role ==
USB_ROLE_NONE), a pmc_usb_connect() will be issued despite no peripheral
being present.

This confuses the PMC and leads to all subsequent PMC IPC requests
returning errors due to timeout.

To prevent this, return early if the port orientation or role is already
set to none.

Cc: Benson Leung <bleung@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Rajmohan Mani <rajmohan.mani@intel.com>
Fixes: f3c1c41ebc67 ("usb: typec: intel_pmc_mux: Add support for USB4")
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/usb/typec/mux/intel_pmc_mux.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
index 2aba07c7b221..e4021e13af40 100644
--- a/drivers/usb/typec/mux/intel_pmc_mux.c
+++ b/drivers/usb/typec/mux/intel_pmc_mux.c
@@ -310,6 +310,9 @@ pmc_usb_mux_set(struct typec_mux *mux, struct typec_mux_state *state)
 {
 	struct pmc_usb_port *port = typec_mux_get_drvdata(mux);
 
+	if (port->orientation == TYPEC_ORIENTATION_NONE || port->role == USB_ROLE_NONE)
+		return 0;
+
 	if (state->mode == TYPEC_STATE_SAFE)
 		return pmc_usb_mux_safe_state(port);
 	if (state->mode == TYPEC_STATE_USB)
-- 
2.27.0.383.g050319c2ae-goog

