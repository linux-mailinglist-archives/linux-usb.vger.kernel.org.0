Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D90D16686CD
	for <lists+linux-usb@lfdr.de>; Thu, 12 Jan 2023 23:23:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236847AbjALWXC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Jan 2023 17:23:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233217AbjALWWk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Jan 2023 17:22:40 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAEC01C12A
        for <linux-usb@vger.kernel.org>; Thu, 12 Jan 2023 14:16:28 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id a184so14838344pfa.9
        for <linux-usb@vger.kernel.org>; Thu, 12 Jan 2023 14:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZaweIEmq0HPzqbMZsHX/5KqxEfI0AK60Sg/9xC2e0nw=;
        b=AEnDVzdmu2UBDjpJSwKIR+H3w4ZA+cGy28te8O8B6LwcJ3OHPDMy7KuF7X/BTuAYow
         LSZJOk/Vpya21bQ8eEVdUWudOzXg2h0zt/0KH2rINXDqPGueIKrY/YM2nGCbe1UJyGzW
         woxeEE3JKSEUivGkiHmPgfmY8PUqlwSRtpcBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZaweIEmq0HPzqbMZsHX/5KqxEfI0AK60Sg/9xC2e0nw=;
        b=gKSEDFcbDV2xFEhriIHfXjFnziEwnkDRA4ij/WH/EMiu+KhpOp7rl5h5ZmyFegQi/V
         8er8diPt7Q01weaF3zdyOoZNYJR1GbtnAxoQvk8B11rqvpO7IB+aK7+xfzRuwtEoFDmz
         pMnvzbPRuMHKV24p9IdYq/u4OlVUlSNo6lCKl0hjeA4J6xEDBNfq5FzUjUnDJHOrj3Dg
         9lAslR3i0UZ/5xR0fKzBbn5DvZKkLkaZa2Ljv8Q9gFKxkUkLtAsV2kDbrIFNvN/2PY3S
         BvLFVUeSQM6MqNK8988FYImztqxjWOMkpG/zUaz2QMhMSkIDZ25LGT81Y4POjqOwLkcZ
         A4aQ==
X-Gm-Message-State: AFqh2krnGyJLnfNtqhdJnZbYLwMjj8nwloqjVd8oy836lo4EyuTVGOnq
        XWQaDdsXuiuiLETQpvZZkENrxA==
X-Google-Smtp-Source: AMrXdXulBBi75TVTDqJKRdehZ+kuf8IyHmC3L9jSLnsD7CySIXZ4pY8l8TV7oI8z1UiL34Yj1ySrkw==
X-Received: by 2002:a62:1887:0:b0:582:5886:e1b7 with SMTP id 129-20020a621887000000b005825886e1b7mr38083089pfy.14.1673561788350;
        Thu, 12 Jan 2023 14:16:28 -0800 (PST)
Received: from pmalani.c.googlers.com.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id d191-20020a621dc8000000b0058193135f6bsm12330658pfd.84.2023.01.12.14.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 14:16:28 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     bleung@chromium.org, heikki.krogerus@linux.intel.com,
        Prashant Malani <pmalani@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 2/3] usb: typec: Add wrapper for bus switch set code
Date:   Thu, 12 Jan 2023 22:16:07 +0000
Message-Id: <20230112221609.540754-3-pmalani@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20230112221609.540754-1-pmalani@chromium.org>
References: <20230112221609.540754-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a wrapper that calls the set() function for various switches
associated with a port altmode.

Right now, it just wraps the existing typec_mux_set() command,
but it can be expanded to include other switches in future patches.

No functional changes introduced by this patch.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/usb/typec/bus.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
index 31c2a3130cad..9f1bbd26ca47 100644
--- a/drivers/usb/typec/bus.c
+++ b/drivers/usb/typec/bus.c
@@ -27,6 +27,13 @@ typec_altmode_set_mux(struct altmode *alt, unsigned long conf, void *data)
 	return typec_mux_set(alt->mux, &state);
 }
 
+/* Wrapper to set various Type-C port switches together. */
+static inline int
+typec_altmode_set_switches(struct altmode *alt, unsigned long conf, void *data)
+{
+	return typec_altmode_set_mux(alt, conf, data);
+}
+
 static int typec_altmode_set_state(struct typec_altmode *adev,
 				   unsigned long conf, void *data)
 {
@@ -35,7 +42,7 @@ static int typec_altmode_set_state(struct typec_altmode *adev,
 
 	port_altmode = is_port ? to_altmode(adev) : to_altmode(adev)->partner;
 
-	return typec_altmode_set_mux(port_altmode, conf, data);
+	return typec_altmode_set_switches(port_altmode, conf, data);
 }
 
 /* -------------------------------------------------------------------------- */
@@ -73,7 +80,7 @@ int typec_altmode_notify(struct typec_altmode *adev,
 	is_port = is_typec_port(adev->dev.parent);
 	partner = altmode->partner;
 
-	ret = typec_altmode_set_mux(is_port ? altmode : partner, conf, data);
+	ret = typec_altmode_set_switches(is_port ? altmode : partner, conf, data);
 	if (ret)
 		return ret;
 
-- 
2.39.0.314.g84b9a713c41-goog

