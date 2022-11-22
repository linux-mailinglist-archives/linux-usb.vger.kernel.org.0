Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC17B6349C6
	for <lists+linux-usb@lfdr.de>; Tue, 22 Nov 2022 23:06:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235167AbiKVWGW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Nov 2022 17:06:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235150AbiKVWGS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Nov 2022 17:06:18 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CC1479E02
        for <linux-usb@vger.kernel.org>; Tue, 22 Nov 2022 14:06:17 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id 130so15207544pgc.5
        for <linux-usb@vger.kernel.org>; Tue, 22 Nov 2022 14:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2cfSN1kgZzRzJ6XKptvh9cmk5InXjmHdGYFjwKt+CY=;
        b=Gf538M7G4fwP+edrCEnC1Y2/ZGyZwVr9nyc+6qCo64Sw5Ip01KNmQoCWjbabYRgX0Q
         e1bqKvuoxHFYptZnI1X7utko1R5diccxqKmhigd6cixmgSnesF/kGYZ4QnN8BftRlN0Q
         e++I4Ob8oO8dtXbSw0sP5PdtW7aJEzEVZYAII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G2cfSN1kgZzRzJ6XKptvh9cmk5InXjmHdGYFjwKt+CY=;
        b=y5PevKk9cKpK5ENDboZ3TlynGVMpW5iyZfX9Q3kiZasJmirEgZn5togmu49LyaHlit
         LEdKnsyg/LDFPeX4JJHNb6Zq+hjPGKIdlGaSE/LZ5F8k98Mf+qcKBeWstm+3u9jUWNe1
         wOlBk2JVWVDwGSkrPMZVyGAtQyzSUW8NZRMuJpvFcYTXU7mvhYd18klFqXypehLYwwu0
         PQvsfIL2eXq+8RXppVl5K8gAY+TvySe0kJNV18Feu5+yl5BCmIh95zIZ56/i38fhDg7B
         6q/81Zlf5JbvAc0a/V9C+aQ+z8HCTf7l3L4Nq004TPBM1y+Y+vbkQ5aZYnvKZpIxy+gp
         6whw==
X-Gm-Message-State: ANoB5plXvTNQiuiZJfIG87KdbKvgbv3Rmadqvl7aBihVs35v4SM/mQ0j
        wgx0peiHjdcVwAAYNYGYVg+yTA==
X-Google-Smtp-Source: AA0mqf6EwM9Hd8/cnPMD9sYsgVHpc52kVnzKPkEeBVdjtRQRTPfKkOsTCHxgYhVmek++4mJ2UPxcyg==
X-Received: by 2002:a63:5724:0:b0:46f:9c0c:8674 with SMTP id l36-20020a635724000000b0046f9c0c8674mr7692092pgb.26.1669154777162;
        Tue, 22 Nov 2022 14:06:17 -0800 (PST)
Received: from pmalani.c.googlers.com.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id i24-20020a63e458000000b0042988a04bfdsm9640497pgk.9.2022.11.22.14.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 14:06:16 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        chrome-platform@lists.linux.dev
Cc:     Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <groeck@chromium.org>
Subject: [PATCH v2 2/2] platform/chrome: cros_ec_typec: Set parent of partner PD object
Date:   Tue, 22 Nov 2022 22:05:37 +0000
Message-Id: <20221122220538.2991775-3-pmalani@chromium.org>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
In-Reply-To: <20221122220538.2991775-1-pmalani@chromium.org>
References: <20221122220538.2991775-1-pmalani@chromium.org>
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

In order to tell what Type-C device a PD object belongs to, its parent
needs to be set. Use the Type-C partner USB PD registration wrapper
to set the parent appropriately for PD objects which are created for
connected Type-C partners.

Cc: Benson Leung <bleung@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes since v1:
- Use wrapper function introduced in Patch1 (v2).
- Update commit message to reflect that we are using the wrapper.

 drivers/platform/chrome/cros_ec_typec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 2a7ff14dc37e..d5bc4021aca2 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -968,7 +968,7 @@ static void cros_typec_register_partner_pdos(struct cros_typec_data *typec,
 	if (!resp->source_cap_count && !resp->sink_cap_count)
 		return;
 
-	port->partner_pd = usb_power_delivery_register(NULL, &desc);
+	port->partner_pd = typec_partner_usb_power_delivery_register(port->partner, &desc);
 	if (IS_ERR(port->partner_pd)) {
 		dev_warn(typec->dev, "Failed to register partner PD device, port: %d\n", port_num);
 		return;
-- 
2.38.1.584.g0f3c55d4c2-goog

