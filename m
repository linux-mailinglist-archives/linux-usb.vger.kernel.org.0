Return-Path: <linux-usb+bounces-12104-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE4092CF7A
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 12:41:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1297F1F231EE
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 10:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2476194128;
	Wed, 10 Jul 2024 10:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MeLVdz1U"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4ED1922DE
	for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2024 10:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720607792; cv=none; b=O9UNeRWCSTfwQSxsmMB+hBlp1R1BKWaWTD1kaND5Iumjy1KxvqC3yJA3WRKIYO6+AWJOdajwInfhGSxvO2UifXUOHeHzIRj/wrCBlVWGHvF6V4SvlWtSbyNBRlQOxX5ufC2XebvfV9mO8CHOU7QjRd6YZ6C9MOx9LPUr+Lfx6Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720607792; c=relaxed/simple;
	bh=Gh7tR4aP9b3dMS0ig0OinTPBM3NkuA777qx/jRALIJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WG3pISJL42CTblYvHe4mBfyZbTx0QsWMEspd6ZjlVOa/UC/AVtDlzyXi75OOm0dnQKrqWxE8WQgVyaP1/D5lFlkuNsMQX849GSgD6tmWwQdNWlyRjfJt4uBLnCNhLJd9DKXbFnp4luHHGjGj3q5/WhKwvZp+4qNCs1FNRzIMJNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MeLVdz1U; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a77e85cb9b4so430888766b.0
        for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2024 03:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720607788; x=1721212588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WjiPMEKAWGEGZZNGnZ5jjN6tgFH5yhFtTqyqgRl8h3E=;
        b=MeLVdz1UA7b8E76eKlPSLQFo9v78NM8jo11fLJlWW5xsmHpvEtIqewy8EjQ0YPcRIZ
         588IxYu/Vhy4fDnW0GGbO4hlU5sKsae5amiz3AVgw5XSAQoZ1y2429Y2h0ra071bD3Zw
         Pvm6btEKO8S6NnMoRu9KClBYri44stFdEr+EAfJx5yOzNX1w24qhpGszaPm1f9hcWkK2
         Ja42NT96mN5v96SIwCdPgwEElXFqQ6YM3WIPuK/4XK75A/NGPhZXegYlwjJDq85d7RO/
         ik7d3m2goVUuWeplFuKizPTnTZA/wvX/txdl24TslinNR/CQfWAuNHoFf/h9TF5N3cOW
         bDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720607788; x=1721212588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WjiPMEKAWGEGZZNGnZ5jjN6tgFH5yhFtTqyqgRl8h3E=;
        b=THziSd9MyMnakDZF9R3Ff7wOycLlC0Zv0EmvBwfSwoo9+8bkx+qaZseVNDHHCvzuOn
         uEVVC/O/Wd6E+S0WZjov86iT254yR8AqNwiheif6wRj7Gur16XfVmmyZxkiEkHfrOuex
         WRBIIp+5NSBcUqYzJYYe2cjo0l28AKjrdsm/avGbYmq4EExkhX7a3ic+9IKjRcDPMM44
         ZXu1Q/SwGXLj2jQhKccCN+Lrra5Ow9ICvqLii5gmLud64dsDHuZAKyQ3iB5HEHc9Ody5
         YbuMGw58H9E73lAUcP/GLm9UAXZF68ZnkUSfuFcagYWq+wwt+AneSG5FZUf8BK6kgzTz
         xFIw==
X-Forwarded-Encrypted: i=1; AJvYcCUZkveixpBI+Z8khqtDBhMTpydMtt9QK4wBnNJPUDzdjzu+KgygxR5Tt35Se45GTWSDMMpCgEDq9/pJoiH8tVA4k26E/zWLvm3T
X-Gm-Message-State: AOJu0Yzb+fooYukZwOb6Do4W3LzmOPOINjk2GodRUCYOoBMbi/hWH/Do
	8jDrkrCK2kFrGxLpIin0qoYv81sph3ATf/W22PgkgRZ0oRiIoiIEd6uMUM/Sx8k=
X-Google-Smtp-Source: AGHT+IE5hxKfVWgP9N3rYz80ioQEE8TEjgdhOaRO1OuJCq2mi7IUtcanoHfuvuVGxv5EDLkBBXZiWw==
X-Received: by 2002:a17:906:1782:b0:a77:f2c5:84c4 with SMTP id a640c23a62f3a-a780b68a1d4mr333328766b.12.1720607788116;
        Wed, 10 Jul 2024 03:36:28 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6dc77dsm146576966b.52.2024.07.10.03.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 03:36:26 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 10 Jul 2024 11:36:16 +0100
Subject: [PATCH 09/15] usb: typec: tcpm/tcpci_maxim: simplify clearing of
 TCPC_ALERT_RX_BUF_OVF
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240710-tcpc-cleanup-v1-9-0ec1f41f4263@linaro.org>
References: <20240710-tcpc-cleanup-v1-0-0ec1f41f4263@linaro.org>
In-Reply-To: <20240710-tcpc-cleanup-v1-0-0ec1f41f4263@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, 
 Badhri Jagan Sridharan <badhri@google.com>, kernel-team@android.com, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

There is no need for using the ternary if/else here, simply mask
TCPC_ALERT_RX_BUF_OVF as necessary, which arguably makes the code
easier to read.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
index ad9bb61fd9e0..5b5441db7047 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
@@ -193,9 +193,8 @@ static void process_rx(struct max_tcpci_chip *chip, u16 status)
 	 * Read complete, clear RX status alert bit.
 	 * Clear overflow as well if set.
 	 */
-	ret = max_tcpci_write16(chip, TCPC_ALERT, status & TCPC_ALERT_RX_BUF_OVF ?
-				TCPC_ALERT_RX_STATUS | TCPC_ALERT_RX_BUF_OVF :
-				TCPC_ALERT_RX_STATUS);
+	ret = max_tcpci_write16(chip, TCPC_ALERT,
+				TCPC_ALERT_RX_STATUS | (status & TCPC_ALERT_RX_BUF_OVF));
 	if (ret < 0)
 		return;
 
@@ -297,9 +296,8 @@ static irqreturn_t _max_tcpci_irq(struct max_tcpci_chip *chip, u16 status)
 	 * be cleared until we have successfully retrieved message.
 	 */
 	if (status & ~TCPC_ALERT_RX_STATUS) {
-		mask = status & TCPC_ALERT_RX_BUF_OVF ?
-			status & ~(TCPC_ALERT_RX_STATUS | TCPC_ALERT_RX_BUF_OVF) :
-			status & ~TCPC_ALERT_RX_STATUS;
+		mask = status & ~(TCPC_ALERT_RX_STATUS
+				  | (status & TCPC_ALERT_RX_BUF_OVF));
 		ret = max_tcpci_write16(chip, TCPC_ALERT, mask);
 		if (ret < 0) {
 			dev_err(chip->dev, "ALERT clear failed\n");

-- 
2.45.2.803.g4e1b14247a-goog


