Return-Path: <linux-usb+bounces-12100-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A14C292CF6F
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 12:40:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A100B2644C
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 10:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28AA1193061;
	Wed, 10 Jul 2024 10:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="USJhRoTg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8707718FDB6
	for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2024 10:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720607789; cv=none; b=Rp5EOlEGRZSdRvmIvSP4NV12dpRFhnvCXgeUuqKydCR+en+TJRP9/1tR7FP05yGISPLx2cEAfJzkpy6dRaqM9LqBgej4ikJ9BMEDug4StfIDN8L7urgazp1JT8nV5nb1Okgcgd5LKsDDqtt871FnCEJvgoRjrMhknJjH/AQWKTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720607789; c=relaxed/simple;
	bh=0vbDgVH+LSdHvPglDs4hdbAbxgr/GDEnxmyEdgVM9sM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YXJxbKhLTruHqbDN44RCw8SDjMzUkvhwe3bNW1OcCs2acSJEf22K0Et1rV4lhPl+HPjNkEZ/OZN5LkFfjmqUeEkG25JfbITJB8DHyoHO5CnxXPULJYFdd8G7bw+z9tfrRf+uXDpD92xWbGmteX89a2blw/4RuLWBqB9pCR5lpo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=USJhRoTg; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a77c9d3e593so565573466b.0
        for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2024 03:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720607786; x=1721212586; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KpWex0J8opffQtz+HUwL/QKrEncZVAbQ4+K0E+2/CaU=;
        b=USJhRoTgxFgki0VT4S+OdQ4RMBP1d819V979VEXK2VUWPLhaL5W65ba0qrWd4L8WbW
         yWmHD8Ka0DFQW50HXxfQZ4iLInUDUbnA+t3ZZVNFY1gDX762XIGynem3rjM+mP47Qull
         pca15ku0inlkxh7VN1uyYGYQvs+SFuOXmHI69Mcesm0gMIcjXO9ZotjiF48BTt/0ALNL
         0ATNAnYaX0EI45J6LYcCyT2rDdBfsYTkErvJ0Nu7lM1bP7BaChx+9CWvItOr4V48NE+e
         rnqEQBfTOk0PMw9e7TTeQoIuWfuZVEU0yMiliyZHKz0u6Q40l2J6dqSXC0nLxcK5bwgF
         bsog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720607786; x=1721212586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KpWex0J8opffQtz+HUwL/QKrEncZVAbQ4+K0E+2/CaU=;
        b=kogAD9NUtlkxbdfj2G4NufDTt7VDbkFZxSoq6+k1jfm+ZnaX+Vq1gd4oP7xo9DsIyT
         VD4KlX8FQV8ZBHxlRqTQN+PrXms4rWdvA2Jro3I+vyp9aIKxNFfDiigYkdxHgtUugvX2
         KkMX8cjMZNp+idOIYyT/90nsPvnX1m9OU1Hh1D/bFRoMartXCU7s8YOhF7W0o7KI2xvG
         NCjokiPYQb454bNxoSe7aQMH+eW29XRluJmpKb1yU7bdtBYKsXBzZVUUhU5SWuadZile
         XxC5gdM/l0Ad/cL2eMybdsYR48Q1Awe1HeyjMCu99DiwsWi15xpS/lxz2NmgKLRAtTco
         BzHQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4VDutnJV+8UPNYeX/PmuleBFMn7c1cg3Iyu2S/8rvEtT51lJU2d5KCZFQqZS8lQnx8pqqjr24bU0AZNGLHSX0wUnPGka56q1U
X-Gm-Message-State: AOJu0YyH2SX1hQ3wREAIfKYHuS0Nol22vEcRdRvkmec4nWBOpxi5U8OQ
	7PWorrckRCUWaeHu1CbvCzeZCkG9Bclt1lYI5KOic1RB2cVhnBJMfZhxKzmpGMs=
X-Google-Smtp-Source: AGHT+IGbCQykmyEoSZSMY+LIphQ2ikV/yNZ7fum8Hdl9038LaHNouuQhLYHMn+WIDwmXvJrV1rS1Ag==
X-Received: by 2002:a17:906:32cc:b0:a77:da14:8401 with SMTP id a640c23a62f3a-a780b688941mr381186166b.10.1720607785890;
        Wed, 10 Jul 2024 03:36:25 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6dc77dsm146576966b.52.2024.07.10.03.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 03:36:25 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 10 Jul 2024 11:36:13 +0100
Subject: [PATCH 06/15] usb: typec: tcpci: use GENMASK() for
 TCPC_MSG_HDR_INFO_REV
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240710-tcpc-cleanup-v1-6-0ec1f41f4263@linaro.org>
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

Convert field TCPC_MSG_HDR_INFO_REV from register TCPC_MSG_HDR_INFO to
using GENMASK() and FIELD_PREP() so as to keep using a similar approach
for all fields.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/usb/typec/tcpm/tcpci.c | 2 +-
 include/linux/usb/tcpci.h      | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 5ad05a5bbbd1..ad5c9d5bf6a9 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -456,7 +456,7 @@ static int tcpci_set_roles(struct tcpc_dev *tcpc, bool attached,
 	unsigned int reg;
 	int ret;
 
-	reg = PD_REV20 << TCPC_MSG_HDR_INFO_REV_SHIFT;
+	reg = FIELD_PREP(TCPC_MSG_HDR_INFO_REV, PD_REV20);
 	if (role == TYPEC_SOURCE)
 		reg |= TCPC_MSG_HDR_INFO_PWR_ROLE;
 	if (data == TYPEC_HOST)
diff --git a/include/linux/usb/tcpci.h b/include/linux/usb/tcpci.h
index 80652d4f722e..3cd61e9f73b3 100644
--- a/include/linux/usb/tcpci.h
+++ b/include/linux/usb/tcpci.h
@@ -129,9 +129,8 @@
 
 #define TCPC_MSG_HDR_INFO		0x2e
 #define TCPC_MSG_HDR_INFO_DATA_ROLE	BIT(3)
+#define TCPC_MSG_HDR_INFO_REV		GENMASK(2, 1)
 #define TCPC_MSG_HDR_INFO_PWR_ROLE	BIT(0)
-#define TCPC_MSG_HDR_INFO_REV_SHIFT	1
-#define TCPC_MSG_HDR_INFO_REV_MASK	0x3
 
 #define TCPC_RX_DETECT			0x2f
 #define TCPC_RX_DETECT_HARD_RESET	BIT(5)

-- 
2.45.2.803.g4e1b14247a-goog


