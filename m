Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D2EF723186
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jun 2023 22:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233110AbjFEUkU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Jun 2023 16:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232700AbjFEUkT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Jun 2023 16:40:19 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9CB9EE
        for <linux-usb@vger.kernel.org>; Mon,  5 Jun 2023 13:40:17 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-54290603887so2178922a12.1
        for <linux-usb@vger.kernel.org>; Mon, 05 Jun 2023 13:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685997617; x=1688589617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s61dUGW3dRqRsf0EIIajPOoZu748hERq4U0K4FORw/U=;
        b=G4Ago2bnhIX81aaUyZz4fBCbPl9Q1pccJhwJICFCury9DiakrUUN44NERJZsZewjMa
         OAFqxyu6FwSkX3p1lRWU8V9XcHtr8+OHFmJlTxQP6YHIUJXCtHT3uWaZIYUM6ovh/TN2
         ZOxKqIn9/XIGsOM4bklvCKjzHDedPmFr/BmLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685997617; x=1688589617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s61dUGW3dRqRsf0EIIajPOoZu748hERq4U0K4FORw/U=;
        b=Ba1AkW6TG7+/Amynr1cAxBCiWM9fe1/xZs7W6H+4S8ddHCNLBgs1hOZu2PvgaD8KCz
         Y10V6yIpJOEjks8iEMpqf8EWPg0Jj8Kh9PXp82Afq7ke52pVcg5GFFqwoEN9Tu/qahnU
         Hh4tu/fGLlJ3F//Yd6FBGQ+K9dRTN3b01oaFZGgXqBIBjAwo50iN2WR3aamm0uvk318s
         uPyXF3ve+WPbCR2MtVpmSBd1LJNm2HjX7M0uJ31VAl/grmyo16ZHOm1rVj6Q5mCukJLR
         muzdxURvnVmEBi5f9fMgjdWQvs+ziv88VOeslf1Fobfp9kRaajTzZW1RMZTAiSwgUH+5
         jzfw==
X-Gm-Message-State: AC+VfDyV04kP6f0mWiJTOXVCguyGputtM/50qmNR4/QFfwiToB/xThQX
        QuzgGq0lvcr6igTQ9meStIDKJA==
X-Google-Smtp-Source: ACHHUZ5FfG8eKcJfoeYh3r6VvQ+sgGN2Lb2+zgbXYJK68C+sAQwd4e8sFyQMq5MQJFB+DojAqJPTaA==
X-Received: by 2002:a17:90a:db12:b0:258:89d3:d950 with SMTP id g18-20020a17090adb1200b0025889d3d950mr3774065pjv.46.1685997617434;
        Mon, 05 Jun 2023 13:40:17 -0700 (PDT)
Received: from localhost (139.11.82.34.bc.googleusercontent.com. [34.82.11.139])
        by smtp.gmail.com with UTF8SMTPSA id q14-20020a65494e000000b00530914c3bc1sm5521574pgs.21.2023.06.05.13.40.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 13:40:16 -0700 (PDT)
From:   Pavan Holla <pholla@chromium.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     bleung@chromium.org, pmalani@chromium.org,
        Pavan Holla <pholla@chromium.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: Fix fast_role_swap_current show function
Date:   Mon,  5 Jun 2023 20:40:09 +0000
Message-ID: <20230605204010.2239676-1-pholla@chromium.org>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The current implementation mistakenly performs a & operation on
the output of sysfs_emit. This patch performs the & operation before
calling sysfs_emit.

Series-to: LKML <linux-kernel@vger.kernel.org>
Signed-off-by: Pavan Holla <pholla@chromium.org>
---
 drivers/usb/typec/pd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/pd.c b/drivers/usb/typec/pd.c
index 0bcde1ff4d39..8cc66e4467c4 100644
--- a/drivers/usb/typec/pd.c
+++ b/drivers/usb/typec/pd.c
@@ -95,7 +95,7 @@ peak_current_show(struct device *dev, struct device_attribute *attr, char *buf)
 static ssize_t
 fast_role_swap_current_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%u\n", to_pdo(dev)->pdo >> PDO_FIXED_FRS_CURR_SHIFT) & 3;
+	return sysfs_emit(buf, "%u\n", (to_pdo(dev)->pdo >> PDO_FIXED_FRS_CURR_SHIFT) & 3);
 }
 static DEVICE_ATTR_RO(fast_role_swap_current);
 
-- 
2.41.0.rc0.172.g3f132b7071-goog

