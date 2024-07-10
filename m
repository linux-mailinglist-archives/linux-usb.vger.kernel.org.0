Return-Path: <linux-usb+bounces-12098-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8140892CF6C
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 12:39:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 945AAB263C7
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 10:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B3518FA32;
	Wed, 10 Jul 2024 10:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bOvTAdzB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC6713AD07
	for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2024 10:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720607788; cv=none; b=qBnIRHmz01IaySq7krN0Ec8zB6j1im32BpLtcQIRuSLmLufVxbBCLyxqnSQ+VD+gFqYk8ZYuV0T7Vg/NnmWJkbEcpJ40VqKP9KjZPxbWx4p93ikJ1hXfts/TQ0sRxj6vdgaUxC0lm9J19+cT2ROQvIL716hsY+PE6WMsJh9dQVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720607788; c=relaxed/simple;
	bh=EQUsM0PpNi/C3viEDbep0V+nVVtCBCQ3tQfYWoLwmAw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J+N+RzdtHQwV9/TFwxkZR9wkGg1url+wzvL3L7x8vfjEj4uLK6UkV3vXa6MCJeFv+1A6Loqg8trJ9gzYIyNXvQ3VTHZlfVUzHPIoVFHGT7/sy7tKqhm+cYw1eahYQbD9YAaJUnZfjXXi/Zmx79sA18tQlB1o/SxHu1e09yyGEyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bOvTAdzB; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a77cbb5e987so589503866b.3
        for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2024 03:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720607783; x=1721212583; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=to5V6qVCdGxGxsByGLn0z5Szb/YbIZ3br1hRHITNGUY=;
        b=bOvTAdzBwA0ZXWq/p8NMQYniD72DkQFa87zL6/sA+FdvY4KnHdtcnCTpzwr4DOwRvi
         oxv8w+CD8MIlaHMWGaOrqjsphlYcew+biFpMB4K1TCeHAHQbSlJDRNtOrd460m8fhRIw
         +Znf8K8dRWkwAv7uP4OUztoBGNKNsqLe14NXThmNK+0YjWvs7uKlAHPMyZDRGt8TZJpe
         xsSCJg576T3tenRknjt2yC/b7M3gxBNhuTcUYwnp7K5jkudlVK3dpa/PSX5YC4226s6C
         n+t5xnXF07gx6+G+jWc8SH3HqNrgVhR5qN0q9ANr4vcpLXk1DOwW2zBeeweWsTUGLZlt
         0xIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720607783; x=1721212583;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=to5V6qVCdGxGxsByGLn0z5Szb/YbIZ3br1hRHITNGUY=;
        b=nqOhxKodd6nJxt/KlIrSpfXwD3l+I/LCtbzcmsbeBU5BhUbRN3OoS2X7/ZoxNhouC0
         iR2UWbxGwey0YfO5Fg3V1xLdgGhghAP+p90/vTF75sQZkGJKFRGCV6ENRAPUGyK2UGkO
         OH1gOaPQJ/ZTrNhmBVMoaPJFDvauccjQbNDYBAW21lNGeasZNfTN1QKv/JfG38Mdqi39
         Vl+W9yIxv6/kNKpK4e1T3/CeTW05ygvkuxoxGfo7fMARQplzQfeQogIHn2dlAMwEjT1x
         lQa8PN1h+3K3L/VKJMBl+LNPP66j8n6ab9TypdLx1e2m8BWd3LdK5LGexySL6R43TCTE
         ncBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdPXG0yDI3hR+OcJtnCXuBD94YjzschHSurG5vLqYuh8UXrdWOgO4KZuc9bites8ntFH0n9KazaZpoYCzyYFJGbVVEnbaP3Njo
X-Gm-Message-State: AOJu0YxZoHbYL2xadwbET0INeioryAfmo5RNuPTyhHTAXk82ZDGxhsmG
	aUnANJ+CTeUk+pprEl9U/xX+VkX20mwSlgBUSjlD5/KNvXYgqZZLDbpCOt8bwhk=
X-Google-Smtp-Source: AGHT+IGbaIZW50zLMAyxfLsAKsc6ORm/NxD5uU4AkcC9GVHezofsIPzVhNzRU9hVPR3VF+nIjs6QhQ==
X-Received: by 2002:a17:906:e20e:b0:a6f:c268:ff2e with SMTP id a640c23a62f3a-a780b68a303mr294850466b.5.1720607783105;
        Wed, 10 Jul 2024 03:36:23 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6dc77dsm146576966b.52.2024.07.10.03.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 03:36:22 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 00/15] usb: typec: tcpci: few TCPCi & TCPCi-Maxim cleanups
 (mostly genmask())
Date: Wed, 10 Jul 2024 11:36:07 +0100
Message-Id: <20240710-tcpc-cleanup-v1-0-0ec1f41f4263@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABdkjmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDc0MD3ZLkgmTd5JzUxLzSAl0zw1QjS0Mjk0QL8xQloJaCotS0zAqwcdG
 xtbUA2JeY3l4AAAA=
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, 
 Badhri Jagan Sridharan <badhri@google.com>, kernel-team@android.com, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

While looking through the TCPCi drivers, it occurred to me that all of the
open-coded register bit manipulations can be simplified and made more
legible by using the standard GENMASK(), FIELD_GET(), and FIELD_PREP()
macros, which also is less prone to errors: e.g.

	if (((reg & (TCPC_ROLE_CTRL_CC2_MASK << TCPC_ROLE_CTRL_CC2_SHIFT)) >>
	     TCPC_ROLE_CTRL_CC2_SHIFT) !=
	    ((reg & (TCPC_ROLE_CTRL_CC1_MASK << TCPC_ROLE_CTRL_CC1_SHIFT)) >>
	     TCPC_ROLE_CTRL_CC1_SHIFT))

(arguably) is much harder to read and reason about than:

	if (FIELD_GET(TCPC_ROLE_CTRL_CC2, reg) != FIELD_GET(TCPC_ROLE_CTRL_CC1, reg))

and so on.

These patches do that. In addition, there are a few comment fixes and I
added in a conversion to using dev_err_probe() and
devm_add_action_or_reset() in the Maxim TCPCi driver.

I kept the patches separated by register or register field as appropriate to
simplify reviewing, allowing to focus on one field/register at a time.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (15):
      usb: typec: tcpci: fix a comment typo
      usb: typec: tcpm/tcpci_maxim: clarify a comment
      usb: typec: tcpci: use GENMASK() for TCPC_CC_STATUS_CC[12]
      usb: typec: tcpci: use GENMASK() for TCPC_ROLE_CTRL_CC[12]
      usb: typec: tcpci: use GENMASK() for TCPC_ROLE_CTRL_RP_VAL
      usb: typec: tcpci: use GENMASK() for TCPC_MSG_HDR_INFO_REV
      usb: typec: tcpci: use GENMASK() for TCPC_TRANSMIT register fields
      usb: typec: tcpm/tcpci_maxim: sort TCPC_ALERT_MASK values by bit
      usb: typec: tcpm/tcpci_maxim: simplify clearing of TCPC_ALERT_RX_BUF_OVF
      usb: typec: tcpm/tcpci_maxim: drop STATUS_CHECK()
      usb: typec: tcpm/tcpci_maxim: use GENMASK() for TCPC_VENDOR_CC_CTRL2 register
      usb: typec: tcpm/tcpci_maxim: use GENMASK() for TCPC_VENDOR_CC_CTRL3 register
      usb: typec: tcpm/tcpci_maxim: use GENMASK() for TCPC_VENDOR_ADC_CTRL1 register
      usb: typec: tcpm/tcpci_maxim: convert to dev_err_probe()
      usb: typec: tcpm/tcpci_maxim: use device managed TCPCI port deregistration

 drivers/usb/typec/anx7411.c                |   5 +-
 drivers/usb/typec/tcpm/maxim_contaminant.c |  46 +++++++------
 drivers/usb/typec/tcpm/tcpci.c             | 104 ++++++++++++++---------------
 drivers/usb/typec/tcpm/tcpci_maxim.h       |  18 ++---
 drivers/usb/typec/tcpm/tcpci_maxim_core.c  |  71 ++++++++++----------
 drivers/usb/typec/tcpm/tcpci_rt1711h.c     |  27 ++++----
 include/linux/usb/tcpci.h                  |  31 +++------
 7 files changed, 144 insertions(+), 158 deletions(-)
---
base-commit: 82d01fe6ee52086035b201cfa1410a3b04384257
change-id: 20240710-tcpc-cleanup-61e29124a87d

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


