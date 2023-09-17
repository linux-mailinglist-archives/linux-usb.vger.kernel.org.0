Return-Path: <linux-usb+bounces-284-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF307A363E
	for <lists+linux-usb@lfdr.de>; Sun, 17 Sep 2023 17:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65F71282AE3
	for <lists+linux-usb@lfdr.de>; Sun, 17 Sep 2023 15:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E669748B;
	Sun, 17 Sep 2023 15:27:53 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29A2F4F3;
	Sun, 17 Sep 2023 15:27:50 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D30F185;
	Sun, 17 Sep 2023 08:27:49 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-404732a0700so36519635e9.0;
        Sun, 17 Sep 2023 08:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694964468; x=1695569268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPo77c2oAmmTJzlQbZh4cIjjJUw0euUNGNp5zx2Guyo=;
        b=DwNFyewbEAUsVNZ3Shpcojh5UNbqHx98HcLkDyTPVJh33GOSDgon0EsGbbIy8RWi4h
         Ptk+14Nij89mp7Ck9Kl/PVWzZOW8q/7Bp+Asn5TFPu4pNjV5OFLUbROcneyT/hWtxhAq
         Oml00Oxsqsy3frwaYRLZ/PDDBxw+FXhT5ZbSdBkGgzdbNDbR9oTegwD57892ee0V0zDm
         hPsm4/MQ9YrkwHAuZ9SOt6WoGjXk+Arj52XMxkC/zwLBtwTh5A6zQxgx5N4etjmPlZ48
         eCKnsyMnw1qgIhJ8DHPZ7zXK9ATD0Dt6Ew1f/6CgXn9rUGgQYMfp7SSipl+7gfLFaOJV
         U+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694964468; x=1695569268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VPo77c2oAmmTJzlQbZh4cIjjJUw0euUNGNp5zx2Guyo=;
        b=IEOUR9hHqxLBMja7fyMICTmVEy52tjPI3ulj8pVsCx3OY3qp+P80maZWe/p5kcUr4r
         zM9abkXCb+/m416PoYE4iZMPXd2psLuddpLoq0026Got7C7ODb+KOy7Zuum6HiO0Nzsg
         QiWSc4FhvyrAuO7rRKJy9VOY9up+7LIilRzbg7cQpFAKurWpDwUC5KGzaYfIj75p+x4v
         Kc0HZCu8KKWtawbmM0QFHRbxNleS+RoTFDc8GBnNyTnq6V2oiSeCswFIGkksMOaxZ6f6
         8lvLz7RjtdVluReNGqDzYseGWf6QmMzodla/oJ6KyOYzUphDaJHBWwHVVrZXiq86IjOz
         KKwA==
X-Gm-Message-State: AOJu0YynggPQa4mEpxtGYy7e2wOkupIvxvumqug6FEtFJIY64bqWN7x+
	8Y7pJzt6N5RQYgsYiAUn9D9QWo9ka+YlarPfY78=
X-Google-Smtp-Source: AGHT+IHXWCZ8jI7PFgKTCoQkRWS5l8yPSyq/E7aHyQ5ss2XXI5whWJl6SFa+YhYJ8AW892qiJxErNw==
X-Received: by 2002:a7b:c4cb:0:b0:401:6800:703c with SMTP id g11-20020a7bc4cb000000b004016800703cmr6546902wmk.21.1694964467533;
        Sun, 17 Sep 2023 08:27:47 -0700 (PDT)
Received: from localhost.localdomain ([5.45.134.53])
        by smtp.gmail.com with ESMTPSA id j23-20020a05600c489700b003fe15ac0934sm7388865wmp.1.2023.09.17.08.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 08:27:47 -0700 (PDT)
From: Abdel Alkuor <alkuor@gmail.com>
To: heikki.krogerus@linux.intel.com,
	krzysztof.kozlowski+dt@linaro.org,
	bryan.odonoghue@linaro.org
Cc: gregkh@linuxfoundation.org,
	robh+dt@kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	abdelalkuor@geotab.com
Subject: [PATCH v5 12/15] USB: typec: Add trace for tps25750 irq
Date: Sun, 17 Sep 2023 11:26:36 -0400
Message-Id: <20230917152639.21443-13-alkuor@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230917152639.21443-1-alkuor@gmail.com>
References: <20230917152639.21443-1-alkuor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

From: Abdel Alkuor <abdelalkuor@geotab.com>

tps25750 event1 register doesn't have all bits in tps6598x
event registers, only show the events that are masked

Signed-off-by: Abdel Alkuor <abdelalkuor@geotab.com>
---
 drivers/usb/typec/tipd/core.c  |  6 +++++-
 drivers/usb/typec/tipd/trace.h | 22 ++++++++++++++++++++++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 3d9877551160..8d6cb67898a5 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -574,7 +574,11 @@ static irqreturn_t tps6598x_interrupt(int irq, void *data)
 		dev_err(tps->dev, "%s: failed to read events\n", __func__);
 		goto err_unlock;
 	}
-	trace_tps6598x_irq(event[0], event[1]);
+
+	if (tps->is_tps25750)
+		trace_tps25750_irq(event[0]);
+	else
+		trace_tps6598x_irq(event[0], event[1]);
 
 	if (!(event[0] | event[1]))
 		goto err_unlock;
diff --git a/drivers/usb/typec/tipd/trace.h b/drivers/usb/typec/tipd/trace.h
index 12cad1bde7cc..28725234a2d8 100644
--- a/drivers/usb/typec/tipd/trace.h
+++ b/drivers/usb/typec/tipd/trace.h
@@ -74,6 +74,13 @@
 		{ APPLE_CD_REG_INT_DATA_STATUS_UPDATE,		"DATA_STATUS_UPDATE" }, \
 		{ APPLE_CD_REG_INT_STATUS_UPDATE,		"STATUS_UPDATE" })
 
+#define show_tps25750_irq_flags(flags) \
+	__print_flags_u64(flags, "|", \
+		{ TPS_REG_INT_PLUG_EVENT,			"PLUG_EVENT" }, \
+		{ TPS_REG_INT_POWER_STATUS_UPDATE,		"POWER_STATUS_UPDATE" }, \
+		{ TPS_REG_INT_STATUS_UPDATE,			"STATUS_UPDATE" }, \
+		{ TPS_REG_INT_PD_STATUS_UPDATE,			"PD_STATUS_UPDATE" })
+
 #define TPS6598X_STATUS_FLAGS_MASK (GENMASK(31, 0) ^ (TPS_STATUS_CONN_STATE_MASK | \
 						      TPS_STATUS_PP_5V0_SWITCH_MASK | \
 						      TPS_STATUS_PP_HV_SWITCH_MASK | \
@@ -230,6 +237,21 @@ TRACE_EVENT(cd321x_irq,
 		      show_cd321x_irq_flags(__entry->event))
 );
 
+TRACE_EVENT(tps25750_irq,
+	    TP_PROTO(u64 event),
+	    TP_ARGS(event),
+
+	    TP_STRUCT__entry(
+			     __field(u64, event)
+			     ),
+
+	    TP_fast_assign(
+			   __entry->event = event;
+			   ),
+
+	    TP_printk("event=%s", show_tps25750_irq_flags(__entry->event))
+);
+
 TRACE_EVENT(tps6598x_status,
 	    TP_PROTO(u32 status),
 	    TP_ARGS(status),
-- 
2.34.1


