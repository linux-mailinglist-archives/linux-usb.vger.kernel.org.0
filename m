Return-Path: <linux-usb+bounces-19484-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7251EA14DF6
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 11:50:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4CAE3A80A6
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 10:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2411FECA3;
	Fri, 17 Jan 2025 10:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eMKZEA25"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7721FE456
	for <linux-usb@vger.kernel.org>; Fri, 17 Jan 2025 10:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737110995; cv=none; b=aXFBYinJvOZWDVwbZ6JXvY3luKVaetKKp2vjcTEgRsMY15jav7jHBHPX6XyEdjebiinqU8fD8XpuCpmDywsxW5i3RCKuX7pWIRj5NfxIsygU34iuH2alxAoHAlQOe9l4feb1CiH82xVXB56cmssLIR1Q0+ELvnNgCn7vbnGuwpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737110995; c=relaxed/simple;
	bh=HA9jbb7sf9FEcEGIypHqxSqTIh49BbritadiThhm0/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OaOYoQgEKE8sbXaJMbsqg0vJx4VaTNJOiSHsBRhI84UUZkzyB0Vt+rm1fb7JsWJAABpzrzVqijTHX4WI9z3xQM/AnlbYq+vnDIograz11KiYV0kfJa3K31X8DE/TSw7fq8e8zdWYkzDx83wILOYJ/3lGcbI3N24yAqJNNie3fQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eMKZEA25; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54026562221so2000006e87.1
        for <linux-usb@vger.kernel.org>; Fri, 17 Jan 2025 02:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737110992; x=1737715792; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5GKui2+m9IAjivOenJXop0/jshpzhAnhINNH8CjefO4=;
        b=eMKZEA25eA4t8NMLmmJdwmzrfNmFS8zz1LL3kE7Q2+Uwy1dtjIFK6aBIW5USJinYbQ
         wfk8IyTXWf2eycnDygf1A4TaIVGD8ipPWRE5cdcdLPkdarVG0YHhyActci1UgWGuifZW
         JB3H488VxdtaEhUQqumfdVewwwzaSfHCqEzC67hIcZ7vYmA+SFfoUA8B38aNWxEEaBBq
         UvAk5eSexGu76HkkxVrn3+piQx/GMpuCFXMy0J8E9cghL2513fQbwdQ26U0s+33JlpMH
         KdhQ4zH4FbCRuuQxt8h58kCTAI6FYFcgoOGyOg7HcFOw328IbnI+UaR7RXTyazyOdEqe
         uD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737110992; x=1737715792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5GKui2+m9IAjivOenJXop0/jshpzhAnhINNH8CjefO4=;
        b=tFtNQuSsoEZcpvMnxWLydz1Epx148KJaAdsEatddvRZ4mvVwMEHtnxO31/HbRIo1Le
         Dco2hKCQVyf8QNSJWBgmH0fevykliXNNDS/rOnR5BdtFfHxBxHnqpsvTYyXve2K6Ybk0
         BAAglNqeS4HjsO/lUTZt7h3F2YY4bqav2MaaMWcK9LKoy5m+IXv4fIzZzvl6S2x94iul
         BW/9q2AWF6emfolT7bPTgqyXEAlAogFXvyrs1GeKQrqsFdnS8AER+TLwe07AkLiOULaZ
         ccrAMfdnX1nVJPdMMeguyp9x1J7WVYR+BwcWZPz1/gz2bSTiMxDPXGZs1RT7PHmAlw1B
         oZnQ==
X-Gm-Message-State: AOJu0YzR5jXjumi/OigXecogn0S4LHKzPVx9YF1PJ8hPggo/65+2s32O
	FIWfp9upD8gGnBRACszJr8Mz9OuqPlV5geDNLJAtaRMB73BaXprP03i20W8POGg=
X-Gm-Gg: ASbGncvV38K9ZQg1k1ojtKMYgP8FbKpKAwU/Qz70vCIHqF9XLxGEgg5qiKjQnwgdptd
	UzVcQXhJ84nAygwE190R1TUIwQ4n+W0qOmR4LAz7s6FZW8duxwfa3ROf7KnxgeiA+G+u7mYpbhw
	T61xV+6S6MXOKvPiP/7JFDln3D0IqdmEzGUFgKRN9Xgg7PdLAiJZ6YM3Nu+3YM6G34QKOkn/4LB
	evzFwknxG5Q1JDlaDbqzddLoEduiQePn3KZ7cBzm4Kc1o7tRPKDtkaeioHXMMgJ
X-Google-Smtp-Source: AGHT+IHIsU/u3tBigo6IljY3ksqOtejhOflhJneknqBt3azQrF7a0rP854priPpfPUa+G4NTHofa2w==
X-Received: by 2002:a05:6512:3409:b0:542:250d:eefb with SMTP id 2adb3069b0e04-5439c281f66mr667438e87.41.1737110991596;
        Fri, 17 Jan 2025 02:49:51 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a3446c8sm3803321fa.27.2025.01.17.02.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 02:49:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 17 Jan 2025 12:49:43 +0200
Subject: [PATCH 3/3] usb: typec: ucsi: acpi: move LG Gram quirk to
 ucsi_gram_sync_control()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-ucsi-merge-commands-v1-3-e20c19934d59@linaro.org>
References: <20250117-ucsi-merge-commands-v1-0-e20c19934d59@linaro.org>
In-Reply-To: <20250117-ucsi-merge-commands-v1-0-e20c19934d59@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2515;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=HA9jbb7sf9FEcEGIypHqxSqTIh49BbritadiThhm0/8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnijXG3uwtzwYp9Y+1h0WsxIqT/JBER6AauTSMD
 QvMcplbOs6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4o1xgAKCRCLPIo+Aiko
 1fWNB/9y4/CwN+TiuuFIuuGLLi6OOecOc8IM4nhdln3ahSo/r0f/iRuiv2BgDa3N0uqjsE+XKJb
 BNvkoJlft3sGt9QZQN2cJxkcahLO9v+SGcuhTHOLTzDhluZbXer0RMJtHjW7T0h/mwR2+qGpk3O
 9iB5Dyeo+0CzJHRhwvYaM3clcKaYKWys8Dg8noovie/U4f1zQs4OMU6/gH1oQZkRrl/fNWcMYQq
 itzb4UVAdEbfU7pj/lobqj3YpOKX4s4WmfrbJo42VspQ3vKOXu3hb1dXodv5tclk5lV9x2oi6Vf
 wgHXOAm8arAa5ovC+PV42GwLiaizfaDshig54otthqWkEFJ/
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

It is easier to keep all command-specific quirks in a single place. Move
them to ucsi_gram_sync_control() as the code now allows us to return
modified messages data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi_acpi.c | 30 +++++++++---------------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 8b02082201ec5b85031472563b8b8d1eea6134de..ada5d0d21ee6fb1f406b6a8b8466bc71ffdb5b46 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -99,17 +99,23 @@ static const struct ucsi_operations ucsi_acpi_ops = {
 	.async_control = ucsi_acpi_async_control
 };
 
-static int ucsi_gram_read_message_in(struct ucsi *ucsi, void *val, size_t val_len)
+static int ucsi_gram_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
+				  void *val, size_t len)
 {
 	u16 bogus_change = UCSI_CONSTAT_POWER_LEVEL_CHANGE |
 			   UCSI_CONSTAT_PDOS_CHANGE;
 	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
 	int ret;
 
-	ret = ucsi_acpi_read_message_in(ucsi, val, val_len);
+	ret = ucsi_sync_control_common(ucsi, command, cci, val, len);
 	if (ret < 0)
 		return ret;
 
+	if (UCSI_COMMAND(ua->cmd) == UCSI_GET_PDOS &&
+	    ua->cmd & UCSI_GET_PDOS_PARTNER_PDO(1) &&
+	    ua->cmd & UCSI_GET_PDOS_SRC_PDOS)
+		ua->check_bogus_event = true;
+
 	if (UCSI_COMMAND(ua->cmd) == UCSI_GET_CONNECTOR_STATUS &&
 	    ua->check_bogus_event) {
 		/* Clear the bogus change */
@@ -122,28 +128,10 @@ static int ucsi_gram_read_message_in(struct ucsi *ucsi, void *val, size_t val_le
 	return ret;
 }
 
-static int ucsi_gram_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
-				  void *data, size_t size)
-{
-	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
-	int ret;
-
-	ret = ucsi_sync_control_common(ucsi, command, cci, data, size);
-	if (ret < 0)
-		return ret;
-
-	if (UCSI_COMMAND(ua->cmd) == UCSI_GET_PDOS &&
-	    ua->cmd & UCSI_GET_PDOS_PARTNER_PDO(1) &&
-	    ua->cmd & UCSI_GET_PDOS_SRC_PDOS)
-		ua->check_bogus_event = true;
-
-	return ret;
-}
-
 static const struct ucsi_operations ucsi_gram_ops = {
 	.read_version = ucsi_acpi_read_version,
 	.read_cci = ucsi_acpi_read_cci,
-	.read_message_in = ucsi_gram_read_message_in,
+	.read_message_in = ucsi_acpi_read_message_in,
 	.sync_control = ucsi_gram_sync_control,
 	.async_control = ucsi_acpi_async_control
 };

-- 
2.39.5


