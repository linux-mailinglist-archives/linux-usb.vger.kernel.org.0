Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78C5C4FA7E0
	for <lists+linux-usb@lfdr.de>; Sat,  9 Apr 2022 15:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241825AbiDINCs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 Apr 2022 09:02:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241856AbiDINCm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 9 Apr 2022 09:02:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 09F402A1E97
        for <linux-usb@vger.kernel.org>; Sat,  9 Apr 2022 06:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649509230;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Pi4pYQTNYCuF2Y8MBQqcWvYBPADTg7R4hnusPThr2oY=;
        b=NIsVP+Hu6QpHTJGZalnNYhbTH2RxMmtDIPaXIKPw60n9Xgal/H6cQDVDxZviAhL20c34mu
        zWNZY6B8qwUhhJSejlKU+bO1a07Uo9I0ePo0HasJKOsYvPvPfwgli4aIhfi5ro31PwY2bj
        pCfBpIzuzo7dGTqbNXjoIaXBnC/mQc8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-emd3PeHPM72pnJ6gbZDyLQ-1; Sat, 09 Apr 2022 09:00:28 -0400
X-MC-Unique: emd3PeHPM72pnJ6gbZDyLQ-1
Received: by mail-qt1-f199.google.com with SMTP id d18-20020ac81192000000b002ebdd6ef307so4346954qtj.20
        for <linux-usb@vger.kernel.org>; Sat, 09 Apr 2022 06:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pi4pYQTNYCuF2Y8MBQqcWvYBPADTg7R4hnusPThr2oY=;
        b=MSRQj4R8r4pl6B04CGpexgU9AWEB627aSnwOsit2JDy91Y5bKPVyZyDeYluvauvAzQ
         9guusUqZ1ouZyL2XuqWIjkfnzY9P74pLFQCIQN7e6L2R+QllII+ORVmDqy6ywITwS4R4
         NBfWtUZSlFG4dtNs822iZTvyOrX6QJZOq8Z/8l0lPKNlBznh4EaWPpZBQdLnYtsNNyYb
         MARZVuJoJWYVyY0yjBXqTLtAlREZbhaUmcfo81zWP/BJggcTgEmxLUiN/JT3UOlHygrr
         91n31u7SjhbIVjYH4sbXbef5DcBSqdmhtn0y9xc0zh4CBJ2UQw3iG3uZbgzQJC+YgCEF
         Vssw==
X-Gm-Message-State: AOAM5331rMLfyDVjgPdvU2YWhY8XpuYay62L23GvToJ2FmRUeUnwRAKO
        GpqfLQxgnQmPCkG8Z/BTG8Ixhp8AojJCz3N4Klw2v4S3nJfJQTHAamiTHfDvwdxEDcnXzKLDy0M
        vzp59lDLJcM+Ik8sK3Upj
X-Received: by 2002:a05:620a:f03:b0:67e:1e38:3a90 with SMTP id v3-20020a05620a0f0300b0067e1e383a90mr15707031qkl.442.1649509227401;
        Sat, 09 Apr 2022 06:00:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiWGKGegbZUryXgoDbOVNltQJuqFvoqURUtghXwG+4Ot6d+KTA+M614leRjmBRJgRVliPdwg==
X-Received: by 2002:a05:620a:f03:b0:67e:1e38:3a90 with SMTP id v3-20020a05620a0f0300b0067e1e383a90mr15706985qkl.442.1649509226925;
        Sat, 09 Apr 2022 06:00:26 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id c10-20020ac87dca000000b002e1db1b7b10sm20782197qte.25.2022.04.09.06.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Apr 2022 06:00:25 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        nathan@kernel.org, ndesaulniers@google.com, sven@svenpeter.dev,
        alyssa@rosenzweig.io, marcan@marcan.st, martink@posteo.de,
        saranya.gopal@intel.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, Tom Rix <trix@redhat.com>
Subject: [PATCH] usb: typec: tipd: improve handling of failures in interrupt handlers
Date:   Sat,  9 Apr 2022 09:00:13 -0400
Message-Id: <20220409130013.1474412-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

clang static analysis reports this representative issue
core.c:516:6: warning: Branch condition evaluates
  to a garbage value
  if (event)
      ^~~~~

In cd321x_interrupt(), a successful call to
tps6598x_read64() is the only way event is set,
and if a failure happens the irq should not be
reported as handled.

Instead of initializing event, rework the
usage of ret by initializing it to IRQ_NONE
and then setting it when event is known to
be not zero.  This removes the if-statement
before the return.

tps6598x_interrupt() is similar.

Fixes: 0a4c005bd171 ("usb: typec: driver for TI TPS6598x USB Power Delivery controllers")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/usb/typec/tipd/core.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 16b4560216ba..88a20cc15da4 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -478,12 +478,11 @@ static irqreturn_t cd321x_interrupt(int irq, void *data)
 	struct tps6598x *tps = data;
 	u64 event;
 	u32 status;
-	int ret;
+	int ret = IRQ_NONE;
 
 	mutex_lock(&tps->lock);
 
-	ret = tps6598x_read64(tps, TPS_REG_INT_EVENT1, &event);
-	if (ret) {
+	if (tps6598x_read64(tps, TPS_REG_INT_EVENT1, &event)) {
 		dev_err(tps->dev, "%s: failed to read events\n", __func__);
 		goto err_unlock;
 	}
@@ -492,6 +491,8 @@ static irqreturn_t cd321x_interrupt(int irq, void *data)
 	if (!event)
 		goto err_unlock;
 
+	ret = IRQ_HANDLED;
+
 	if (!tps6598x_read_status(tps, &status))
 		goto err_clear_ints;
 
@@ -513,9 +514,7 @@ static irqreturn_t cd321x_interrupt(int irq, void *data)
 err_unlock:
 	mutex_unlock(&tps->lock);
 
-	if (event)
-		return IRQ_HANDLED;
-	return IRQ_NONE;
+	return ret;
 }
 
 static irqreturn_t tps6598x_interrupt(int irq, void *data)
@@ -524,13 +523,12 @@ static irqreturn_t tps6598x_interrupt(int irq, void *data)
 	u64 event1;
 	u64 event2;
 	u32 status;
-	int ret;
+	int ret = IRQ_NONE;
 
 	mutex_lock(&tps->lock);
 
-	ret = tps6598x_read64(tps, TPS_REG_INT_EVENT1, &event1);
-	ret |= tps6598x_read64(tps, TPS_REG_INT_EVENT2, &event2);
-	if (ret) {
+	if (tps6598x_read64(tps, TPS_REG_INT_EVENT1, &event1) ||
+	    tps6598x_read64(tps, TPS_REG_INT_EVENT2, &event2)) {
 		dev_err(tps->dev, "%s: failed to read events\n", __func__);
 		goto err_unlock;
 	}
@@ -539,6 +537,8 @@ static irqreturn_t tps6598x_interrupt(int irq, void *data)
 	if (!(event1 | event2))
 		goto err_unlock;
 
+	ret = IRQ_HANDLED;
+
 	if (!tps6598x_read_status(tps, &status))
 		goto err_clear_ints;
 
@@ -561,9 +561,7 @@ static irqreturn_t tps6598x_interrupt(int irq, void *data)
 err_unlock:
 	mutex_unlock(&tps->lock);
 
-	if (event1 | event2)
-		return IRQ_HANDLED;
-	return IRQ_NONE;
+	return ret;
 }
 
 static int tps6598x_check_mode(struct tps6598x *tps)
-- 
2.27.0

