Return-Path: <linux-usb+bounces-9238-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF268A0751
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 06:50:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AC6E1C23317
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 04:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B4AB13C66C;
	Thu, 11 Apr 2024 04:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TtjeLiaQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC0913C68D
	for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 04:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712811005; cv=none; b=s+bzvTMhKBlzP97s91EamN4BiYr1OOTFNhS6YFu2nF7Gy8EcfZOLlEEesdQuSQEwFgRe0l0Zpi914NdWQFuAiNJcpkqaLdYUqmXOPLdKhc9J/XiFwsrITpEab1/1H1fevk4DjTlturBc8Ylxnkc+uO3oBGPSZ5yZdI5eZz37PKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712811005; c=relaxed/simple;
	bh=6Pp8ISuDZAtUkxCFA5Mzr7Pj0egqS4eDsl4x+9fdzEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mGAOPczV6tEaef1YV1yI3QaaO5eET82m4GVy98xden2ls/piM6OZ4p+jvYTDRPupe9q9F3N0mSTCE8y4LSXC/VJUHwWv8sLvXCaVSeOXlgoV3dfDDS84qoXO2md7oHpD4giRBxhrh9bT0AcntIABFB9e0SbUBArUBXX1YIji98A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TtjeLiaQ; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-56e6646d78bso4204652a12.1
        for <linux-usb@vger.kernel.org>; Wed, 10 Apr 2024 21:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712811002; x=1713415802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENukurxkpnH6btr43WV4x/+l5y/bB4zzdKjrs7ksqE0=;
        b=TtjeLiaQATmsaTfMHDw4ldavl861eNdXhfYXLpaYbaKF5thP0oioA83R+XTuXCctZv
         m4DXecX4S1Nvz1p6WL+8IR1lE88wdlh99ln+eOC4UQMA6YybSPIJsCzxw/P12zUIwHFN
         R6/ItPPzK++t78O8sHFinW4cuVy1bVehwuEaJqYUgf1+PvQPq+j7eRIs+r3ErPuYz8e2
         PIZM51FlfCCxqIMM1Pnjy4kbhoalDnVua4X3ge48srPI8uDsheJAw/hpp0c33fnG1UZ+
         jTlfYXwpYVk4yUaQiRDFAOX6BTaAToXCjZiRUGiN+mrJc6qPVbmR3IzT3G+3QzNvgSsu
         hhhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712811002; x=1713415802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENukurxkpnH6btr43WV4x/+l5y/bB4zzdKjrs7ksqE0=;
        b=mrKVqsC2zN/zEiGIC7EqMyW2yz7biFUOWUVej6anL9sdI8ZWa6JJm8f4Vg//dHgex8
         lE01B2J9MeWEBWB3PdoC4PnkAA7W/PFxUum6/lsuQZMdOeLQVkNZWB0xSm3dxW2x7/eX
         10JhnlOUcDzrbFi4cj6aW7hYZrBZKLlf5XZL+/+dg94akyPOEScfNOnZqpSquXig/yrT
         p+sjkfEuyjgL8fdcGDlAnC20UNPzt+74CZQovlJWQDgtstI4EyvrF6YZZQTs0zGQ9Oc2
         /kOGWtbX495wGUHS3a/uOYt4fsZAb1yj2In4XxC0w56ITT5QZyCCyPLdFeMf8xPoTV42
         BLFg==
X-Forwarded-Encrypted: i=1; AJvYcCXBtuIzZ24Cl8EzkvuaS2DaETaXpoTbDdonPfYYNxnpZJYvQA5Ar18ovrKi+HJIb8KGwE/BkYQPwQ0HTHeI68Xss2BEfvY4QLaH
X-Gm-Message-State: AOJu0Yx7SG4IAYY0/pfAZDopBNfGRhPpEoZw4Luf5iuBn4RNwPXC3MjE
	dVZwVqKzF7WGopwxD+CT8hHC5DeFeBZPyJjcJbHg/vk83YtgaviCgpxd3fgwBQA=
X-Google-Smtp-Source: AGHT+IHesucWaQVhU+ySwSaf9UH4m6ngiyzben7VuTh4ldeFSL9wrCB7OsRC2EdaRpeJrGQN92yaNQ==
X-Received: by 2002:a17:907:9302:b0:a52:1466:4d1b with SMTP id bu2-20020a170907930200b00a5214664d1bmr2587568ejc.17.1712811002170;
        Wed, 10 Apr 2024 21:50:02 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id dm11-20020a170907948b00b00a51eed4f0d7sm364899ejc.130.2024.04.10.21.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 21:50:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Apr 2024 07:49:55 +0300
Subject: [PATCH v2 3/5] usb: typec: ucsi: glink: use typec_set_orientation
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240411-ucsi-orient-aware-v2-3-d4b1cb22a33f@linaro.org>
References: <20240411-ucsi-orient-aware-v2-0-d4b1cb22a33f@linaro.org>
In-Reply-To: <20240411-ucsi-orient-aware-v2-0-d4b1cb22a33f@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1822;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=6Pp8ISuDZAtUkxCFA5Mzr7Pj0egqS4eDsl4x+9fdzEg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmF2v1Ts5oco0Vxtg+IMFkLrQdp5RJEX0U75Sjv
 QG9Ip4gsiSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhdr9QAKCRCLPIo+Aiko
 1d2AB/wKkOfWM1fPn1jyD71SiAMg6J1MtmKyjRvYnw9RRB1S83ELd5MRGIDu8b4I6RvSozMhXoB
 vIovM4TO/DsApVnKUfyJJwIerHrNW5QuLQyLlqrPpZZr24anhuvIZBNATW3/6nUqPAEVtw/7X5m
 MAsfM/KGHaZeSgT4Eyv/P1vntZKjbbUCOgLZdYi13rMTDrS3EXaNgDnq1dia1D8322yQY00Gp0R
 7z7J7MqHFrm5CIyd3/yxoQe/63vssYVCQWgQJxUdO+4SDqonx3PQKINDGyumrbW6SfqnSgrNGWf
 1CNgakyWYKaOS2eDyIALb52/5kBSjfNbJD1mNYA1+FOUiVy4
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Use typec_set_orientation() instead of calling typec_switch_set()
manually. This way the rest of the typec framework and the userspace are
notified about the orientation change.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index d21f8cd2fe35..d279e2cf9bba 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -58,7 +58,6 @@ struct pmic_glink_ucsi {
 	struct device *dev;
 
 	struct gpio_desc *port_orientation[PMIC_GLINK_MAX_PORTS];
-	struct typec_switch *port_switch[PMIC_GLINK_MAX_PORTS];
 
 	struct pmic_glink_client *client;
 
@@ -198,9 +197,10 @@ static void pmic_glink_ucsi_connector_status(struct ucsi_connector *con)
 
 	orientation = gpiod_get_value(ucsi->port_orientation[con->num - 1]);
 	if (orientation >= 0) {
-		typec_switch_set(ucsi->port_switch[con->num - 1],
-				 orientation ? TYPEC_ORIENTATION_REVERSE
-				 : TYPEC_ORIENTATION_NORMAL);
+		typec_set_orientation(con->port,
+				      orientation ?
+				      TYPEC_ORIENTATION_REVERSE :
+				      TYPEC_ORIENTATION_NORMAL);
 	}
 }
 
@@ -378,11 +378,6 @@ static int pmic_glink_ucsi_probe(struct auxiliary_device *adev,
 			return dev_err_probe(dev, PTR_ERR(desc),
 					     "unable to acquire orientation gpio\n");
 		ucsi->port_orientation[port] = desc;
-
-		ucsi->port_switch[port] = fwnode_typec_switch_get(fwnode);
-		if (IS_ERR(ucsi->port_switch[port]))
-			return dev_err_probe(dev, PTR_ERR(ucsi->port_switch[port]),
-					"failed to acquire orientation-switch\n");
 	}
 
 	ucsi->client = devm_pmic_glink_register_client(dev,

-- 
2.39.2


