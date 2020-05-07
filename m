Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94ACA1C8AA7
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2020 14:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbgEGMXY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 May 2020 08:23:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727095AbgEGMXX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 May 2020 08:23:23 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E9EAC05BD0B
        for <linux-usb@vger.kernel.org>; Thu,  7 May 2020 05:23:22 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id u127so6583362wmg.1
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2020 05:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=js2krj0RD3hheEAL8cEfa5AyUl6zi0N+wYVVoWFXilU=;
        b=coX3lDQhoiVcmqCufwxRJFR3NjAPEGH0QUsc9BHbtnYuDYAuLvTLxr0YOckuFoNb7v
         35jokTarqofjAL3txGkkqvMZF3vNo4G0u7efJqy9Y1pnS66YOVSLWrt6IuSYNYzRPyrp
         AlIT+KfReY3LKpelz3IBfQjruAr5XEaRDetgT1Nrn/xtHLNlkqv6RE0QEAIlFU4wWyv+
         VEoUUlCkUZ2JKYaSIedjEjVQO2ejeJ4w6XYe6uW1EUMzKjJaO1JtXNWnn4m6koCVsIEY
         6G20LE29aCBSg2u8Jp6+umXE2ph1Ui21SToAqkAkEb8oBp0aY5QcRTkCCninELhLUXPf
         Qt5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=js2krj0RD3hheEAL8cEfa5AyUl6zi0N+wYVVoWFXilU=;
        b=eveC66uHGC8pibMbd8KqPH6MdhOGTDYV/dkLvPHFShPwJ6uZv//Qw6iUdwsgCvUVEe
         q8mUj/M25T/2Xjh4Xz4JXplhN8Mmwy6ctHVl5f7oH4JQvCISBxBOiPwvNBIg48u+Q3Fu
         HRptlc5jHc3CK7GwvPubK7R9ErUrqsuR1aUsSiENdxx9mZr/NHeAGC8ex9MUcBtdeIpT
         2Zouv2f8VJg9xt4tFv/JcUPMhMnigg6cJ6/LCOyESBGjpbb7DqhXLFHDBurUO9ornYaI
         JtfHCT3ArCipi8NUSE7otHGpgRsn1ldrUG4Fsh9O56tzo6HHW2TXgRVz7eT5bcEi6fnu
         kJFw==
X-Gm-Message-State: AGi0PuZGtDpf8ArFKssBtabdxQjAsbjCrY6qKbQmASnunYZj+NBbDDAR
        6xNAZXgnA42Ko2PjVvYqxuZWXQ==
X-Google-Smtp-Source: APiQypKUssr+tZ7ONvwALRESmstwlo4sXONYM0CoLMz4PdmEGwytmWK3dIclCWwC8C5V8ol/fEYJtA==
X-Received: by 2002:a05:600c:4013:: with SMTP id i19mr3094203wmm.71.1588854201286;
        Thu, 07 May 2020 05:23:21 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id p7sm8202936wrf.31.2020.05.07.05.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 05:23:20 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     heikki.krogerus@linux.intel.com, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        nikolaus.voss@loewensteinmedical.de,
        andriy.shevchenko@linux.intel.com, garsilva@embeddedor.com,
        keescook@chromium.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 2/2] usb: typec: tps6598x: Add OF probe binding
Date:   Thu,  7 May 2020 13:23:52 +0100
Message-Id: <20200507122352.1773661-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507122352.1773661-1-bryan.odonoghue@linaro.org>
References: <20200507122352.1773661-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Adds a MODULE_DEVICE_TABLE() to allow probing of this driver from a DTS
setting.

Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Gustavo A. R. Silva <garsilva@embeddedor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/typec/tps6598x.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/typec/tps6598x.c b/drivers/usb/typec/tps6598x.c
index 0698addd1185..61c6761072c9 100644
--- a/drivers/usb/typec/tps6598x.c
+++ b/drivers/usb/typec/tps6598x.c
@@ -563,6 +563,14 @@ static int tps6598x_remove(struct i2c_client *client)
 	return 0;
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id tps6598x_of_match[] = {
+	{ .compatible = "ti,tps6598x", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, tps6598x_of_match);
+#endif
+
 static const struct i2c_device_id tps6598x_id[] = {
 	{ "tps6598x" },
 	{ }
@@ -572,6 +580,7 @@ MODULE_DEVICE_TABLE(i2c, tps6598x_id);
 static struct i2c_driver tps6598x_i2c_driver = {
 	.driver = {
 		.name = "tps6598x",
+		.of_match_table = of_match_ptr(tps6598x_of_match),
 	},
 	.probe_new = tps6598x_probe,
 	.remove = tps6598x_remove,
-- 
2.25.1

