Return-Path: <linux-usb+bounces-37596-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBxGIUryCmpv+AQAu9opvQ
	(envelope-from <linux-usb+bounces-37596-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 13:04:42 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 023B956B31B
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 13:04:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B7844304ADDF
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 11:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05A51DFDA1;
	Mon, 18 May 2026 11:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="lzy6LEXR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892D13D3331
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 11:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102122; cv=none; b=GtmC6QDc3MhitvaCxFH1tpQ+QmAv5BEiHguuHp15Q1ziREKCAXO/5Xie2aHy1N5ABidPx416/UC2e0KG/IF+fAAzWUzoKoy0MwaP+juTjirE9Hdmb9h03vmikFYkSU5iPID7tTajapdcfIIA55VBV8faY4UMVZZHZ9EXr9vCtYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102122; c=relaxed/simple;
	bh=+cRRSUN8Pyo7Zp+Oieu53UnuJtj+OkEfZ7v6axdguB0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nSs8MZsY/opUiqZvJ6kbQYMoitXYqWMSh7Ty948Tg/g/TqlVkhnPnQ1SQFDrIY6vm/CN7BTcmflmdk+KLnO91vOQIbXAqtuXc3t1CbCCL7lIp36MPFbipZXVgQjm/Y4rcXLC6o47zHz+AjFK1xb29O21OurmgCBATxT+H2g7zdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=lzy6LEXR; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bd85ebb368fso95732166b.1
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 04:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779102110; x=1779706910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eI78fNQzDWVxrB5IUbZho+FqcNBT2AVoVGt8ZJA1oBY=;
        b=lzy6LEXRMiN7Z6cc/3VJZYrmAkFSUxUE8UMWK4q4Z/tHx/cZDW5FVmShj/Or1SmjKe
         XMlFrTsB4nW3sJtk6u0XZDvI+Pu3UrmB24RJRT8pgc4YaSrxCfQnfFeUtoGU3XaOzu0T
         BM2MciRm3xHMhq+hr7SkvUjld96jmA9hROIm20YsX4JDSdrowYXFr/KCYau0820n/NIp
         3QaUEFS2N9Xbe3gMMlM1BoG9Jz9bc8ShRKS0QKRy31UAOwgcNMaEVbhT1JsJTwA1Gn0I
         VTAvf02gRmjNwvSxDeeoTfppcOsGWf2BqSGgQZYlaavvhJUrrCktIqorYVpFocOv1C4H
         xs2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779102110; x=1779706910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eI78fNQzDWVxrB5IUbZho+FqcNBT2AVoVGt8ZJA1oBY=;
        b=ABiemCALKGVpaHqL77BnQcrkqs2QNB5UXKPOc4b/W0eD4zTMxfolFswHXjF9fEhO5Y
         u/TA2T5fJvfs/RBWk/hxkzYShYYXtiB+aXxYv2YEeYlNrahjwa60zg2bePfJ0eamziPh
         hCe4DNOXMEDN1BoiBUG7aMzKrgpNUb1spnao72w4giHCwAPAlPQoZpRATHOi4eOYXkze
         41z+Q5G3FvxwpzGGcPmYC9KLZ2xbQk7a4jNSLzCLB/WJybvYnh1dXsqsMAK2Lcwbbnop
         1ArjrJAagZgwCRJQmDFXetKQ7M7WDLxcKbKebgONhm8BE4+6Iy396I3F/Q93FDnKOKUq
         DRfQ==
X-Forwarded-Encrypted: i=1; AFNElJ+6OZPqaufI3CdCPkJewTQw6JGk6YIWPihFBaHJPGKq9EwuCHLwMjL8gqWhKxag0ejWZ9q5mHmg7uU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVhZKo1lwybDJsWgNYsGzeZ76S97mlabkXcQ9TPQNthq6XKcUY
	DQfC/sG3QeTUPdtrxvl4uDF/G3S0bQnbkDJ285fykncYI9bdclpIW8um4geevTAI4Q4=
X-Gm-Gg: Acq92OEjr/K11vXC3lNql5xlN7D4P/qyc8nfUuufP5GyY0zAZz89Obw8UjWcPh/wKg7
	BIQHDu1CgefK6QIygLQlmXm4/ejwUH24u8fhUOSrO2QsGx4p31qs+7jiosxuTTVPG10iSAxDXr6
	5pVM10xuz3Imqxh/IB01uMZqP26Gxy/pfUelAQGsDh6hqrgyz1TJBc2LhB+Io8KEklHjXlFGjnJ
	qqGPwdbe3tklaTZZgCvKOHszebYQF5M7uNcrWvtxRD+/EM78OSuoU62MrNmjrkB+2C2DsUPxq2f
	unhgdyjcAbPkcbmCLO3DUO2+b5wsjxZZojKtHoUC/drt1mmIw2REKknhF2nJaKQEygSXZfIiHLg
	FZ8GElz6+kcMpKSRQUyNaPP3GF/RbO6r4gnZZvOjay3cprLbKybnjZEJlbgm2/JbgmFIlBjWyCA
	VElXAWn4qIng5Pz03ocF23ylc1BiL3xfee61BqKIGYxAVkeviPXm+YSHwYHptvKncFt4huehEFP
	c2REcwnC7x18/w=
X-Received: by 2002:a17:907:1c9c:b0:b9c:bc70:e928 with SMTP id a640c23a62f3a-bd51797a003mr681771166b.25.1779102109253;
        Mon, 18 May 2026 04:01:49 -0700 (PDT)
Received: from localhost (p200300f65f47db049367b55fc4056f2b.dip0.t-ipconnect.de. [2003:f6:5f47:db04:9367:b55f:c405:6f2b])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45da0a1aeafsm38159279f8f.23.2026.05.18.04.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 04:01:48 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Yongbo Zhang <giraffesnn123@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Alexey Charkov <alchark@flipper.net>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	=?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Yuanshen Cao <alex.caoys@gmail.com>,
	Sven Peter <sven@kernel.org>,
	Neal Gompa <neal@gompa.dev>,
	Hector Martin <marcan@marcan.st>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Peter Korsgaard <peter@korsgaard.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Johan Hovold <johan@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] usb: typec: Use named initializers for arrays of i2c_device_data
Date: Mon, 18 May 2026 13:01:42 +0200
Message-ID: <20260518110142.637215-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=11391; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=+cRRSUN8Pyo7Zp+Oieu53UnuJtj+OkEfZ7v6axdguB0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqCvGWFqpvaa9cA+VEofFHMCORDH81VvU8T8int qictklVYj6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCagrxlgAKCRCPgPtYfRL+ Ts9oB/9HxGMzLSC8j9bCXzYFkucZK6ckWCQz+grxaxfcyKoeYHhZqYzNFJGkeC13hdcT8SEX/82 LKjn5znzmmyXPCiTw1WlZxWgg7Ug9N/WMMq+p5reRnyDHJ+d1qEBK1A/jDBJfzBzyIaREE5tBwc gN+ocSOS/yap9y2Zs8OI612YR8ugHh3h0q/ZkmIt/cV9iYXOn6HuV7dYoyFdPIblvHKgfjZQNR3 nhkwoLFOFRebeLCp8jNPZbERnU2S4hUEGhaSM1gTt0KXrXkC3GX/cvWr6GIfmnFLkLmkt5AzOuj g6FPI5sKcdaAQc0F9mtXjfPIiOe5LBTpXOQza7dkLWnumeYh
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 023B956B31B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37596-lists,linux-usb=lfdr.de];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-usb@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,foss.st.com,collabora.com,flipper.net,linutronix.de,linaro.org,gompa.dev,marcan.st,korsgaard.com,linux-foundation.org,infradead.org,intel.com,oss.qualcomm.com,linux.dev,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,baylibre.com:mid,baylibre-com.20251104.gappssmtp.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,cheri-alliance.org:url]
X-Rspamd-Action: no action

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
i2c_device_id that replaces .driver_data by an anonymous union.

While touching all these arrays, unify usage of whitespace in the list
terminator.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits. The former was confirmed with x86 and arm64
builds.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

the mentioned change to i2c_device_id is the following:

	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
	index 23ff24080dfd..aebd3a5e90af 100644
	--- a/include/linux/mod_devicetable.h
	+++ b/include/linux/mod_devicetable.h
	@@ -477,7 +477,11 @@ struct rpmsg_device_id {

	 struct i2c_device_id {
		char name[I2C_NAME_SIZE];
	-	kernel_ulong_t driver_data;	/* Data private to the driver */
	+	union {
	+		/* Data private to the driver */
	+		kernel_ulong_t driver_data;
	+		const void *driver_data_ptr;
	+	};
	 };

	 /* pci_epf */

and this requires that .driver_data is assigned via a named initializer
for static data. This requirement isn't a bad one because named
initializers are also much better readable than list initializers.

The union added to struct i2c_device_id enables further cleanups like:

	diff --git a/drivers/regulator/ad5398.c b/drivers/regulator/ad5398.c
	index 0123ca8157a8..dfb0b07500a7 100644
	--- a/drivers/regulator/ad5398.c
	+++ b/drivers/regulator/ad5398.c
	@@ -207,8 +207,8 @@ struct ad5398_current_data_format {
	 static const struct ad5398_current_data_format df_10_4_120 = {10, 4, 0, 120000};

	 static const struct i2c_device_id ad5398_id[] = {
	-	{ .name = "ad5398", .driver_data = (kernel_ulong_t)&df_10_4_120 },
	-	{ .name = "ad5821", .driver_data = (kernel_ulong_t)&df_10_4_120 },
	+	{ .name = "ad5398", .driver_data_ptr = &df_10_4_120 },
	+	{ .name = "ad5821", .driver_data_ptr = &df_10_4_120 },
	 	{ }
	 };
	 MODULE_DEVICE_TABLE(i2c, ad5398_id);
	@@ -219,8 +219,7 @@ static int ad5398_probe(struct i2c_client *client)
	 	struct regulator_init_data *init_data = dev_get_platdata(&client->dev);
	 	struct regulator_config config = { };
	 	struct ad5398_chip_info *chip;
	-	const struct ad5398_current_data_format *df =
	-	                (struct ad5398_current_data_format *)id->driver_data;
	+	const struct ad5398_current_data_format *df = id->driver_data;

	 	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
	 	if (!chip)

that are an improvement for readability (again!) and it keeps some
properties of the pointers (here: being const) without having to pay
attention for that. (I didn't find a usb driver that benefits, so this
is "only" a regulator driver example.)

My additional motivation for this effort is CHERI[1]. This is a hardware
extension that uses 128 bit pointers but unsigned long is still 64 bit.
So with CHERI you cannot store pointers in unsigned long variables.

Best regards
Uwe

[1] https://cheri-alliance.org/discover-cheri/
    https://lwn.net/Articles/1037974/

 drivers/usb/typec/anx7411.c               | 4 ++--
 drivers/usb/typec/mux/fsa4480.c           | 2 +-
 drivers/usb/typec/mux/it5205.c            | 2 +-
 drivers/usb/typec/mux/nb7vpq904m.c        | 2 +-
 drivers/usb/typec/mux/pi3usb30532.c       | 2 +-
 drivers/usb/typec/mux/ptn36502.c          | 2 +-
 drivers/usb/typec/mux/wcd939x-usbss.c     | 2 +-
 drivers/usb/typec/tcpm/fusb302.c          | 4 ++--
 drivers/usb/typec/tcpm/tcpci.c            | 2 +-
 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 2 +-
 drivers/usb/typec/tcpm/tcpci_rt1711h.c    | 8 ++++----
 drivers/usb/typec/tipd/core.c             | 2 +-
 drivers/usb/typec/ucsi/ucsi_ccg.c         | 4 ++--
 drivers/usb/typec/ucsi/ucsi_stm32g0.c     | 4 ++--
 14 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
index 2e8ae1d2faf9..604868ebf422 100644
--- a/drivers/usb/typec/anx7411.c
+++ b/drivers/usb/typec/anx7411.c
@@ -1577,8 +1577,8 @@ static void anx7411_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id anx7411_id[] = {
-	{ "anx7411" },
-	{}
+	{ .name = "anx7411" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, anx7411_id);
diff --git a/drivers/usb/typec/mux/fsa4480.c b/drivers/usb/typec/mux/fsa4480.c
index c54e42c7e6a1..bea0c1deec94 100644
--- a/drivers/usb/typec/mux/fsa4480.c
+++ b/drivers/usb/typec/mux/fsa4480.c
@@ -336,7 +336,7 @@ static void fsa4480_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id fsa4480_table[] = {
-	{ "fsa4480" },
+	{ .name = "fsa4480" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, fsa4480_table);
diff --git a/drivers/usb/typec/mux/it5205.c b/drivers/usb/typec/mux/it5205.c
index 4357cc67a867..5e1a120b2e3b 100644
--- a/drivers/usb/typec/mux/it5205.c
+++ b/drivers/usb/typec/mux/it5205.c
@@ -266,7 +266,7 @@ static void it5205_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id it5205_table[] = {
-	{ "it5205" },
+	{ .name = "it5205" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, it5205_table);
diff --git a/drivers/usb/typec/mux/nb7vpq904m.c b/drivers/usb/typec/mux/nb7vpq904m.c
index b57b6c9c40fe..d1fa26ff442c 100644
--- a/drivers/usb/typec/mux/nb7vpq904m.c
+++ b/drivers/usb/typec/mux/nb7vpq904m.c
@@ -499,7 +499,7 @@ static void nb7vpq904m_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id nb7vpq904m_table[] = {
-	{ "nb7vpq904m" },
+	{ .name = "nb7vpq904m" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, nb7vpq904m_table);
diff --git a/drivers/usb/typec/mux/pi3usb30532.c b/drivers/usb/typec/mux/pi3usb30532.c
index 8eeec135dcdb..985683fe49e9 100644
--- a/drivers/usb/typec/mux/pi3usb30532.c
+++ b/drivers/usb/typec/mux/pi3usb30532.c
@@ -169,7 +169,7 @@ static void pi3usb30532_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id pi3usb30532_table[] = {
-	{ "pi3usb30532" },
+	{ .name = "pi3usb30532" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pi3usb30532_table);
diff --git a/drivers/usb/typec/mux/ptn36502.c b/drivers/usb/typec/mux/ptn36502.c
index 129d9d24b932..afd16775dbaf 100644
--- a/drivers/usb/typec/mux/ptn36502.c
+++ b/drivers/usb/typec/mux/ptn36502.c
@@ -404,7 +404,7 @@ static void ptn36502_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ptn36502_table[] = {
-	{ "ptn36502" },
+	{ .name = "ptn36502" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ptn36502_table);
diff --git a/drivers/usb/typec/mux/wcd939x-usbss.c b/drivers/usb/typec/mux/wcd939x-usbss.c
index d46c353dfaf2..73db3aa3cec4 100644
--- a/drivers/usb/typec/mux/wcd939x-usbss.c
+++ b/drivers/usb/typec/mux/wcd939x-usbss.c
@@ -753,7 +753,7 @@ static void wcd939x_usbss_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id wcd939x_usbss_table[] = {
-	{ "wcd9390-usbss" },
+	{ .name = "wcd9390-usbss" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wcd939x_usbss_table);
diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 889c4c29c1b8..6560da0c523b 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -1841,8 +1841,8 @@ static const struct of_device_id fusb302_dt_match[] __maybe_unused = {
 MODULE_DEVICE_TABLE(of, fusb302_dt_match);
 
 static const struct i2c_device_id fusb302_i2c_device_id[] = {
-	{ "typec_fusb302" },
-	{}
+	{ .name = "typec_fusb302" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, fusb302_i2c_device_id);
 
diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 0148b8f50412..8841a94df153 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -1020,7 +1020,7 @@ static int tcpci_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(tcpci_pm_ops, tcpci_suspend, tcpci_resume);
 
 static const struct i2c_device_id tcpci_id[] = {
-	{ "tcpci" },
+	{ .name = "tcpci" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tcpci_id);
diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
index c0ee7e6959ed..6ceb25e5bdd0 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
@@ -570,7 +570,7 @@ static int max_tcpci_suspend(struct device *dev)
 static SIMPLE_DEV_PM_OPS(max_tcpci_pm_ops, max_tcpci_suspend, max_tcpci_resume);
 
 static const struct i2c_device_id max_tcpci_id[] = {
-	{ "maxtcpc" },
+	{ .name = "maxtcpc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max_tcpci_id);
diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
index 4b3e4e22a82e..a8726da6fc71 100644
--- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
+++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
@@ -373,10 +373,10 @@ static const struct rt1711h_chip_info rt1715 = {
 };
 
 static const struct i2c_device_id rt1711h_id[] = {
-	{ "et7304", (kernel_ulong_t)&rt1715 },
-	{ "rt1711h", (kernel_ulong_t)&rt1711h },
-	{ "rt1715", (kernel_ulong_t)&rt1715 },
-	{}
+	{ .name = "et7304", .driver_data = (kernel_ulong_t)&rt1715 },
+	{ .name = "rt1711h", .driver_data = (kernel_ulong_t)&rt1711h },
+	{ .name = "rt1715", .driver_data = (kernel_ulong_t)&rt1715 },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rt1711h_id);
 
diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 43faec794b95..f560606c588c 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -2027,7 +2027,7 @@ static const struct of_device_id tps6598x_of_match[] = {
 MODULE_DEVICE_TABLE(of, tps6598x_of_match);
 
 static const struct i2c_device_id tps6598x_id[] = {
-	{ "tps6598x", (kernel_ulong_t)&tps6598x_data },
+	{ .name = "tps6598x", .driver_data = (kernel_ulong_t)&tps6598x_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tps6598x_id);
diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 199799b319c2..ddde0a7702f0 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1525,8 +1525,8 @@ static const struct of_device_id ucsi_ccg_of_match_table[] = {
 MODULE_DEVICE_TABLE(of, ucsi_ccg_of_match_table);
 
 static const struct i2c_device_id ucsi_ccg_device_id[] = {
-	{ "ccgx-ucsi" },
-	{}
+	{ .name = "ccgx-ucsi" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ucsi_ccg_device_id);
 
diff --git a/drivers/usb/typec/ucsi/ucsi_stm32g0.c b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
index 838ac0185082..848ed459a6de 100644
--- a/drivers/usb/typec/ucsi/ucsi_stm32g0.c
+++ b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
@@ -737,8 +737,8 @@ static const struct of_device_id __maybe_unused ucsi_stm32g0_typec_of_match[] =
 MODULE_DEVICE_TABLE(of, ucsi_stm32g0_typec_of_match);
 
 static const struct i2c_device_id ucsi_stm32g0_typec_i2c_devid[] = {
-	{ "stm32g0-typec" },
-	{}
+	{ .name = "stm32g0-typec" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ucsi_stm32g0_typec_i2c_devid);
 

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.47.3


