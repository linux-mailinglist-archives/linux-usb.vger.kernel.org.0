Return-Path: <linux-usb+bounces-1180-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D797BB4EC
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 12:11:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 812AE1C20A7D
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 10:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C924A14F82;
	Fri,  6 Oct 2023 10:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nq+s4fQj"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DFE1426B
	for <linux-usb@vger.kernel.org>; Fri,  6 Oct 2023 10:11:04 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B3909F
	for <linux-usb@vger.kernel.org>; Fri,  6 Oct 2023 03:11:01 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-406402933edso17300785e9.2
        for <linux-usb@vger.kernel.org>; Fri, 06 Oct 2023 03:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696587060; x=1697191860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hwWW0sABsjh41YiHpOu0oUsWiTPmoqzV+38FlfE5YNs=;
        b=nq+s4fQj2mcftSGpPJ2EBRBAnnIRD6UutYjjTtbkPeXDutqKQ/rVkaVNP8cZ3/SYA/
         Oh5FQkXLs4Li74fyA403SR5pTAixifsN3eaSB1LWW1l+GMbwdYn7PkmKPr2nC9k8OydE
         8BosMxXQaccUMa2qmsUclp8d0eaH9U0Gp8IXd+iYOOjyPmVhcuGh/5r8TPeu7oHF0Iz/
         9s/F1o6jQieoq2HCr7jKwSLaZQ26jwBPUcV1UpDhxikAZCwm9PaVMSGSPZHHHvmxHutW
         dsZYlFYV9fRcXKg7AT1qrOELsh1V5stRLBtQqCy7+aSccevK062+9TtF8xPTgwDqulnM
         24ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696587060; x=1697191860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hwWW0sABsjh41YiHpOu0oUsWiTPmoqzV+38FlfE5YNs=;
        b=USkpuGLprlgALGKkCovLHoJuGEiwNNGzmYA/XyOJmZFLddfBiF4w0KyCP2vfBzXLUj
         HXhj//c9DuXZt8IIB/ci7WgvJRhCmWVEG8Ye9kv1tzj2jcsIHFzrvCMobrwGpDHRFWQ6
         +OqOvPaqRBGHW4jJwaCoYDAsRONmmpUfkc2w7cg+ZLaKWqaesbSm9my6O69AX8rHR3G0
         pBv7H8YMnl8vDLoYidRQWZ73orRylqiZtEvwzuPfVOqHD+kiIje5wuDBiKe1PR4iJVQ9
         1ADsgWIO1PyBxyIM0WQPCERgdOnmn+/wTQoOdHvGLuHp366h5zdzE1o6Z7nyu0nlbjEj
         tzWw==
X-Gm-Message-State: AOJu0Ywgzh+QLzD+qkeLLtb/OK5fFDTZstnHzjHjistYnGxSJy79/Wim
	7U8dDoN2yTmW4GJCeYq2n99NNw==
X-Google-Smtp-Source: AGHT+IGYhlwFF07RvZ38Py5lab35w5tbnwiTBeJleQWMQAS8m72BMQD3KLpLHth0tKiNxpaKbjwTLA==
X-Received: by 2002:a5d:574f:0:b0:321:63d0:1f0e with SMTP id q15-20020a5d574f000000b0032163d01f0emr6520490wrw.20.1696587059529;
        Fri, 06 Oct 2023 03:10:59 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:8f44:72b3:5bcb:6c6b])
        by smtp.googlemail.com with ESMTPSA id t6-20020adff046000000b003231a0ca5ebsm1287343wro.49.2023.10.06.03.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 03:10:59 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH] usb: misc: onboard_usb_hub: extend gl3510 reset duration
Date: Fri,  6 Oct 2023 12:10:28 +0200
Message-Id: <20231006101028.1973730-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Initial tests with the gl3510 has been done on libretech aml-a311d-cc.
A 50us reset was fine as long as the hub node was under the usb phy node it
DT. DT schema does not allow that. Moving the hub under the dwc3 controller
caused issues, such as:

onboard-usb-hub 1-1: Failed to suspend device, error -32
onboard-usb-hub 1-1: can't set config #1, error -71
onboard-usb-hub 1-1: Failed to suspend device, error -32
onboard-usb-hub 1-1: USB disconnect, device number 2

Extending the reset duration solves the problem.
Since there is no documentation available for this hub, it is difficult to
know the actual required reset duration. 200us seems to work fine so far.

Suggested-by: Neil Armstrong <neil.armstrong@linaro.org>
Fixes: 65009ccf7e8f ("usb: misc: onboard_usb_hub: add Genesys Logic gl3510 hub support")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/usb/misc/onboard_usb_hub.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
index a9e2f6023c1c..38de22452963 100644
--- a/drivers/usb/misc/onboard_usb_hub.h
+++ b/drivers/usb/misc/onboard_usb_hub.h
@@ -31,6 +31,11 @@ static const struct onboard_hub_pdata cypress_hx3_data = {
 	.num_supplies = 2,
 };
 
+static const struct onboard_hub_pdata genesys_gl3510_data = {
+	.reset_us = 200,
+	.num_supplies = 1,
+};
+
 static const struct onboard_hub_pdata genesys_gl850g_data = {
 	.reset_us = 3,
 	.num_supplies = 1,
@@ -56,7 +61,7 @@ static const struct of_device_id onboard_hub_match[] = {
 	{ .compatible = "usb5e3,608", .data = &genesys_gl850g_data, },
 	{ .compatible = "usb5e3,610", .data = &genesys_gl852g_data, },
 	{ .compatible = "usb5e3,620", .data = &genesys_gl852g_data, },
-	{ .compatible = "usb5e3,626", .data = &genesys_gl852g_data, },
+	{ .compatible = "usb5e3,626", .data = &genesys_gl3510_data, },
 	{ .compatible = "usbbda,411", .data = &realtek_rts5411_data, },
 	{ .compatible = "usbbda,5411", .data = &realtek_rts5411_data, },
 	{ .compatible = "usbbda,414", .data = &realtek_rts5411_data, },
-- 
2.40.1


