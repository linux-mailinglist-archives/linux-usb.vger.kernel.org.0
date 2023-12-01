Return-Path: <linux-usb+bounces-3579-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE71C8012CD
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 19:31:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A159281FC9
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 18:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A801351006;
	Fri,  1 Dec 2023 18:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NAm7TJYY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48B35133
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 10:31:35 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6cdce15f0a3so2726116b3a.1
        for <linux-usb@vger.kernel.org>; Fri, 01 Dec 2023 10:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701455494; x=1702060294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4QGkTsdRERlNpczcwqSp2Og8v+XNs9gRL2qzJvnknds=;
        b=NAm7TJYYWKXNyXJQqhfgCjmvkRz0pVGCxouKfwO38mMJeiJ23rVzMICF/GVfMZ8ppf
         XDm6mJRBLudjMjQjlp47m2wVOs4IifZCBN/9iMaEIbDOoAiAPXb3AFkjVjvVTzWBlTiZ
         GkP5lpvIVvdufNP1MS3ttUlFaQMJJJEgB4Q1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701455494; x=1702060294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4QGkTsdRERlNpczcwqSp2Og8v+XNs9gRL2qzJvnknds=;
        b=C8AqXXZHHj9Zpp2aoEPrc6eielI5qNqONpNmwLQVTYrycQ16gqDMsvu7qsyZvtb4We
         Pgw6vWCLdZ0648lczbf+Mtq+obWWZ8HUSFD8weYbSfq2MALMJtgSokj6EYwvAIAxr6y/
         POHX9+KICqbvEcmXkmGIvvNsI7xzHfB985MR1Ab1BzG92OkceYKorG+K8NvBhM6naP07
         UEGSkj+tZ5irW5Ad+YkWdH+QXUVrcYJL2GijOANtJy//1psEsz/a0Wu6+wyV1e/64tb2
         dGOvfbPJZqUpnXRhvTh7EY/Gi7OK4sfDJVxL54m/L7ZNVc0wyzF82OR/PIl+kWyQNLAL
         LGFA==
X-Gm-Message-State: AOJu0YwxtkISfOJkM4xiYWWLZOE5Q4bO2jkYUxbQw2490+vc9IcBNZzm
	QbzwIADFEoO26PCU9tklAZ7qSVEmD+UH4wTzmwCQzeE6
X-Google-Smtp-Source: AGHT+IEVreiCKxTXFQEfBUwM2+9H3I4ehz8qYButpoJ4w50/BJH9JRBwy33v+a0gi/YRn62yOPKwgg==
X-Received: by 2002:a05:6a00:430e:b0:6cd:fe6e:ac9b with SMTP id cb14-20020a056a00430e00b006cdfe6eac9bmr3530436pfb.0.1701455494239;
        Fri, 01 Dec 2023 10:31:34 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:11eb:92ac:94e:c791])
        by smtp.gmail.com with ESMTPSA id g11-20020a056a00078b00b006cdda10bdafsm3306926pfu.183.2023.12.01.10.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 10:31:33 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Grant Grundler <grundler@chromium.org>,
	Hayes Wang <hayeswang@realtek.com>,
	Simon Horman <horms@kernel.org>,
	=?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
	netdev@vger.kernel.org,
	Brian Geffon <bgeffon@google.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 3/3] r8152: Choose our USB config with choose_configuration() rather than probe()
Date: Fri,  1 Dec 2023 10:29:52 -0800
Message-ID: <20231201102946.v2.3.Ie00e07f07f87149c9ce0b27ae4e26991d307e14b@changeid>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231201183113.343256-1-dianders@chromium.org>
References: <20231201183113.343256-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If you deauthorize the r8152 device (by writing 0 to the "authorized"
field in sysfs) and then reauthorize it (by writing a 1) then it no
longer works. This is because when you do the above we lose the
special configuration that we set in rtl8152_cfgselector_probe().
Deauthorizing causes the config to be set to -1 and then reauthorizing
runs the default logic for choosing the best config.

I made an attempt to fix it so that the config is kept across
deauthorizing / reauthorizing [1] but it was a bit ugly.

Let's instead use the new USB core feature to override
choose_configuration().

This patch relies upon the patches ("usb: core: Don't force USB
generic_subclass drivers to define probe()") and ("usb: core: Allow
subclassed USB drivers to override usb_choose_configuration()")

[1] https://lore.kernel.org/r/20231130154337.1.Ie00e07f07f87149c9ce0b27ae4e26991d307e14b@changeid

Fixes: ec51fbd1b8a2 ("r8152: add USB device driver for config selection")
Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- ("Choose our USB config with choose_configuration()...) new for v2.

 drivers/net/usb/r8152.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 2c5c1e91ded6..0da723d11326 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -10053,7 +10053,7 @@ static struct usb_driver rtl8152_driver = {
 	.disable_hub_initiated_lpm = 1,
 };
 
-static int rtl8152_cfgselector_probe(struct usb_device *udev)
+static int rtl8152_cfgselector_choose_configuration(struct usb_device *udev)
 {
 	struct usb_host_config *c;
 	int i, num_configs;
@@ -10080,19 +10080,13 @@ static int rtl8152_cfgselector_probe(struct usb_device *udev)
 	if (i == num_configs)
 		return -ENODEV;
 
-	if (usb_set_configuration(udev, c->desc.bConfigurationValue)) {
-		dev_err(&udev->dev, "Failed to set configuration %d\n",
-			c->desc.bConfigurationValue);
-		return -ENODEV;
-	}
-
-	return 0;
+	return c->desc.bConfigurationValue;
 }
 
 static struct usb_device_driver rtl8152_cfgselector_driver = {
-	.name =		MODULENAME "-cfgselector",
-	.probe =	rtl8152_cfgselector_probe,
-	.id_table =	rtl8152_table,
+	.name =	MODULENAME "-cfgselector",
+	.choose_configuration = rtl8152_cfgselector_choose_configuration,
+	.id_table = rtl8152_table,
 	.generic_subclass = 1,
 	.supports_autosuspend = 1,
 };
-- 
2.43.0.rc2.451.g8631bc7472-goog


