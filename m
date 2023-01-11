Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8D466517D
	for <lists+linux-usb@lfdr.de>; Wed, 11 Jan 2023 03:06:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234634AbjAKCGG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Jan 2023 21:06:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234935AbjAKCGE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Jan 2023 21:06:04 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF4DB256
        for <linux-usb@vger.kernel.org>; Tue, 10 Jan 2023 18:06:02 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id d9so15200985pll.9
        for <linux-usb@vger.kernel.org>; Tue, 10 Jan 2023 18:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOOH1h4KChlf2EGy6Niqg+gxYFOWhvY7/46pTYzOve8=;
        b=lzq1c4GT3OSKqRRDQNDqpsLFknvNebMBft69ALfIwBu8YiwtWVX6NYPre1ahsuWnIu
         gvRq7RNluMHnz6cheKyvzuZQItjdS3hGJXYGycUpQ2gxzvFppDugHewMKIIZVlPR9H67
         5FXAlAsPd9Zu3U7x3U5ILvewmBFIXkdGV6xz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOOH1h4KChlf2EGy6Niqg+gxYFOWhvY7/46pTYzOve8=;
        b=V0xS01XAj8a82LwVwRn/yGfugvcV1nIpTPPf1QKM5vok3tqwgBWTOPptfsCnFkXuyW
         xSXlXyGmONMpm3CdJJ3nDXgwndqN1TsZLcA84j5Th2RMMrjtxIx4g/EJWVh1CFjwK+c4
         6Yk5d7ji/+1+YEDmtSlBZxsCDzcoomxfZXJ0uLIdNJrzZXnqbNGUoL91jfNOtTMpoIuR
         JSRLX+7asePZ/ge8XmDdLQL+YqnF9AchswFx9+kIZNcYnyw/wdw4YuliCkzqqC+ZV/Pv
         MqpfXP5MgLFb3KBBq0KiGFVl8OS1WoULmeeTy5sCUhwl/mKhVcoNbfU9WH8Qu3bWAk8g
         Rvrw==
X-Gm-Message-State: AFqh2ko9EprQDoqZOe6C2KlYDWlH4J9ss22XfqZa2jdYQcVxhLZRhCaB
        k7Xkhm/B60Na5lWzFiuXeoUMCA==
X-Google-Smtp-Source: AMrXdXsm14meHXsg+0HKJ6VPqdWpetpoVPSQGqXYbRHaS7Fafz1lvKtFbgdIeGQdS7BKaCo8z4vnag==
X-Received: by 2002:a05:6a20:c26:b0:9d:efbf:816d with SMTP id bw38-20020a056a200c2600b0009defbf816dmr544549pzb.54.1673402762422;
        Tue, 10 Jan 2023 18:06:02 -0800 (PST)
Received: from pmalani.c.googlers.com.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id z6-20020a656646000000b00477a442d450sm7336738pgv.16.2023.01.10.18.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 18:06:01 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     bleung@chromium.org, Prashant Malani <pmalani@chromium.org>,
        stable@vger.kernel.org,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guillaume Ranquet <granquet@baylibre.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        Pablo Sun <pablo.sun@mediatek.com>
Subject: [PATCH 2/3] usb: typec: altmodes/displayport: Fix pin assignment calculation
Date:   Wed, 11 Jan 2023 02:05:42 +0000
Message-Id: <20230111020546.3384569-2-pmalani@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20230111020546.3384569-1-pmalani@chromium.org>
References: <20230111020546.3384569-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Commit c1e5c2f0cb8a ("usb: typec: altmodes/displayport: correct pin
assignment for UFP receptacles") fixed the pin assignment calculation
to take into account whether the peripheral was a plug or a receptacle.

But the "pin_assignments" sysfs logic was not updated. Address this by
using the macros introduced in the aforementioned commit in the sysfs
logic too.

Fixes: c1e5c2f0cb8a ("usb: typec: altmodes/displayport: correct pin assignment for UFP receptacles")
Cc: stable@vger.kernel.org
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/usb/typec/altmodes/displayport.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index f9d4a7648bc9..c0d65c93cefe 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -427,9 +427,9 @@ static const char * const pin_assignments[] = {
 static u8 get_current_pin_assignments(struct dp_altmode *dp)
 {
 	if (DP_CONF_CURRENTLY(dp->data.conf) == DP_CONF_DFP_D)
-		return DP_CAP_UFP_D_PIN_ASSIGN(dp->alt->vdo);
+		return DP_CAP_PIN_ASSIGN_DFP_D(dp->alt->vdo);
 	else
-		return DP_CAP_DFP_D_PIN_ASSIGN(dp->alt->vdo);
+		return DP_CAP_PIN_ASSIGN_UFP_D(dp->alt->vdo);
 }
 
 static ssize_t
-- 
2.39.0.314.g84b9a713c41-goog

