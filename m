Return-Path: <linux-usb+bounces-661-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DED777B0B65
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 19:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id E34511C20A98
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 17:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A867F4BDD5;
	Wed, 27 Sep 2023 17:57:37 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AC93AC01;
	Wed, 27 Sep 2023 17:57:35 +0000 (UTC)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72E3FF5;
	Wed, 27 Sep 2023 10:57:33 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-99c1c66876aso1501324066b.2;
        Wed, 27 Sep 2023 10:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695837452; x=1696442252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+aeRRLyveSp222PznPdG+n1sUIcY6jPHssGE/fPbHxM=;
        b=j7XdiMFnQbHdP9NVQr8xjpKcXk2Rj7rx3mPmLkg7Gsz3HPSrQv6nLqF0wBnQCXACO8
         WZvFKb6ru3TJgzHrExPfbuJ1zB/lgxVP0ZcRJ8KsafqjS+RD3u3U24xjTqUnaKaBEtwS
         ToETtqt270rPSTnXT0qeQlPubiVvLh7+dd7mWQhZZnVvUTV7EjYrCxOIHhJM1o5ziZXZ
         2BsOBDXlZQzBnAg984wjzxzxVYEN5lW7nUD1h+BP53iXjROJuFvSKTKUaUWghB1oRMzf
         gcPG6MFu8fOV4/vbBLsjfQk36beJN3uMu/+dbQxKK01rUlHwDpmJ1OOgbLgLYhZLJTTy
         pzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695837452; x=1696442252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+aeRRLyveSp222PznPdG+n1sUIcY6jPHssGE/fPbHxM=;
        b=ctL/bmeDu+BjsvXY3fNDlXwWN0kFvLchSbgovF4+LaUJlXd5WUKtfCKF8u2C8vKx6S
         CdrRuVGNSmAr/TdBbxUtBRUkujyozf01haOco42vRw/VhVlWbVS+ww8H0h8Xt7nmeXCV
         /w/89SIzCjlE1P+LdSlM8N01j7EZmtA3c8vYSXiU97rD5IyHiN1hDu/C9KrsdjHH//vi
         PN24/+c6zK9z2P4Z+/I0auY+HGA+KnU9xACjhJUkiOX5PcGPeZnZQU7L/B3EORWVpA1o
         Re8My7HriZpbGJ7sEZKVkr3ECZYOliq7Py83nRBd46gZrRWTZ6vgfMotdRqOfd+ZIGwC
         4XrQ==
X-Gm-Message-State: AOJu0YzZ1TAPoUfKj6mXO5E8/YQC5mFCKe3Fq+9aP61hG2HmdRxKEXMj
	rgmiLihR00UJj1fH0/ceCEs=
X-Google-Smtp-Source: AGHT+IF+24OKQIgPKNpib7bosRU2IZ6nJkW5hDNqxCJWDmr7i/D40xEx1TKVAuaafzBts7yVW8a1/Q==
X-Received: by 2002:a17:907:9487:b0:9a5:c49e:7145 with SMTP id dm7-20020a170907948700b009a5c49e7145mr3180086ejc.69.1695837451882;
        Wed, 27 Sep 2023 10:57:31 -0700 (PDT)
Received: from primary.. ([212.34.12.50])
        by smtp.gmail.com with ESMTPSA id d4-20020a170906370400b0099bd8c1f67esm9654593ejc.109.2023.09.27.10.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 10:57:31 -0700 (PDT)
From: Abdel Alkuor <alkuor@gmail.com>
To: heikki.krogerus@linux.intel.com,
	krzysztof.kozlowski+dt@linaro.org,
	bryan.odonoghue@linaro.org
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ryan.eleceng@gmail.com,
	robh+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	Abdel Alkuor <abdelalkuor@geotab.com>
Subject: [PATCH v7 02/14] USB: typec: tsp6598x: Add cmd timeout and response delay
Date: Wed, 27 Sep 2023 13:53:36 -0400
Message-Id: <20230927175348.18041-3-alkuor@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230927175348.18041-1-alkuor@gmail.com>
References: <20230927175348.18041-1-alkuor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

From: Abdel Alkuor <abdelalkuor@geotab.com>

Some commands in tps25750 take longer than 1 second
to complete, and some responses need some delay before
the result becomes available.

Signed-off-by: Abdel Alkuor <abdelalkuor@geotab.com>
---
Changes in v7:
  - Add driver name to commit subject 
Changes in v6:
  - Use tps6598x_exec_cmd as a wrapper
Changes in v5:
  - Incorporating tps25750 into tps6598x driver

 drivers/usb/typec/tipd/core.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 37b56ce75f39..32420c61660d 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -282,9 +282,10 @@ static void tps6598x_disconnect(struct tps6598x *tps, u32 status)
 	power_supply_changed(tps->psy);
 }
 
-static int tps6598x_exec_cmd(struct tps6598x *tps, const char *cmd,
+static int tps6598x_exec_cmd_tmo(struct tps6598x *tps, const char *cmd,
 			     size_t in_len, u8 *in_data,
-			     size_t out_len, u8 *out_data)
+			     size_t out_len, u8 *out_data,
+			     u32 cmd_timeout_ms, u32 res_delay_ms)
 {
 	unsigned long timeout;
 	u32 val;
@@ -307,8 +308,7 @@ static int tps6598x_exec_cmd(struct tps6598x *tps, const char *cmd,
 	if (ret < 0)
 		return ret;
 
-	/* XXX: Using 1s for now, but it may not be enough for every command. */
-	timeout = jiffies + msecs_to_jiffies(1000);
+	timeout = jiffies + msecs_to_jiffies(cmd_timeout_ms);
 
 	do {
 		ret = tps6598x_read32(tps, TPS_REG_CMD1, &val);
@@ -321,6 +321,9 @@ static int tps6598x_exec_cmd(struct tps6598x *tps, const char *cmd,
 			return -ETIMEDOUT;
 	} while (val);
 
+	/* some commands require delay for the result to be available */
+	mdelay(res_delay_ms);
+
 	if (out_len) {
 		ret = tps6598x_block_read(tps, TPS_REG_DATA1,
 					  out_data, out_len);
@@ -345,6 +348,14 @@ static int tps6598x_exec_cmd(struct tps6598x *tps, const char *cmd,
 	return 0;
 }
 
+static int tps6598x_exec_cmd(struct tps6598x *tps, const char *cmd,
+			     size_t in_len, u8 *in_data,
+			     size_t out_len, u8 *out_data)
+{
+	return tps6598x_exec_cmd_tmo(tps, cmd, in_len, in_data,
+				     out_len, out_data, 1000, 0);
+}
+
 static int tps6598x_dr_set(struct typec_port *port, enum typec_data_role role)
 {
 	const char *cmd = (role == TYPEC_DEVICE) ? "SWUF" : "SWDF";
-- 
2.34.1


