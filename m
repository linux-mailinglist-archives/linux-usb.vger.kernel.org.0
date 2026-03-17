Return-Path: <linux-usb+bounces-34955-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPFTFqGBuWmxHAIAu9opvQ
	(envelope-from <linux-usb+bounces-34955-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 17:30:25 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F01B12ADFC3
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 17:30:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DF343300E588
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 16:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D525E36C59C;
	Tue, 17 Mar 2026 16:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="ktc0yVAZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266EC36405A
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 16:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773765022; cv=none; b=W1Bv2sPs2oDu7ABaxWuL+yjROr8piuBi4jh0PRVYy/d2HBQRCrj3WxEeodB9iy/yupyBy+ozpeKYbrydjwwUnVMD1HLv3sQxmJ512hK9BKRkewEjKMWuLjT3ocpgmzEIDwIHv1qmB7dB2w5EC3YIkELLyt0RB6IvJhxAfOegjQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773765022; c=relaxed/simple;
	bh=Z2aWRPXkpx5ekMjctDdvr6UjzEasOAIPeaUcWrJN5NE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tVdzxX+Ai5lk7vo67c54EQtq1lYXnfmRj6Ag4PvyIZn2dujAplXfWJHSj1WI6crZb0zXUI+03XhutCTDERupFX+DN4QNP+AIDex6kpevhUo1hRFEcb5QNnZoAP8vEev+JnJkp0JK7i0rOdKk9Aqx/J4j8LPNXBAvqUhsTJFsemg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=ktc0yVAZ; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so36392f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 09:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773765019; x=1774369819; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WmHFmvkb2jv5zXCrgScZkvhMZRgK+EweiMKeOhatkmU=;
        b=ktc0yVAZB5YLYllfX8Ti5ytlItzFZH3MHNZp6lkagFJSJURFueeQYA960+klEt2GHH
         w201DToJBEINWirkK3kflSzHAZ6f2OdfUnbEibcoP+FoZJNP7ciwrLNeLRp3S98noRzz
         4rwNg8ar19moiQBTlvfsbp7Dv4DdtA+VWfs0SR/OISbMgVNrNtqio4O4Y2a9MzfgjRzQ
         Z/ymN16tccgfTWJYcomcExhtUYZAnxeITiW0pyInO5g1EXLIpJEQJ/PufM/G5rpCUR9q
         4oqyzkAiwXnWNSZqchymy2ayCoieTAPORXUnV70nYVKVKSB/Z8Z7lzk39Ybp2LwdhniU
         KPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773765019; x=1774369819;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WmHFmvkb2jv5zXCrgScZkvhMZRgK+EweiMKeOhatkmU=;
        b=n5YbsRbJndOLSPGBykBAYH595ZAVvnHkV3FERYwFqLT1NTS5+qMh1Tw0jIzcfVsFpJ
         b27BYBCyQ2dEPCGZ4vklzMNnwlw8b0Qvu/Ptv3c0Ixg0jwn2AiIdBlgV5E1p0IMQxm8Y
         2tRhrE0j4tUl7HfKMVwOXsHnSbPzJhIYkiEGEWlBIDsZGfaBiXcTvgUYtyffF06MPdJq
         8DyYZZBwJjDwnTAYySVaGNOdlYiCApxggKHPxBvDI+Qw8jHuanuZc5F9tfv2ZcDfD+O8
         tBappDPIO/HBnyxqBUWjzv4ovQ/8ZmjJc8f8lCHIiwjSnBn+uZ8QAzbBSOJXuwNoSKnI
         2P9A==
X-Forwarded-Encrypted: i=1; AJvYcCUXgViGcDk4X/Fy5rFVtDBulr9mHZRIU9obu9BvwUDMH5DNTKvK+7pqIPKW+QdlYLzNklRJGPDauhU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrM5nAr68D2uYRVtOBZP+KOveVnriyN0qr+yXlPm8o8nsU2J0z
	qEBJCFa+jPaPUczLPmbrbr1gV72ElRzBu3aMqp5w7eMZVSr/fbD3zRpj/OqQjuQ178NKropQGuB
	w4ODf73o=
X-Gm-Gg: ATEYQzwZa1Qh30omROictz9NhX0rFhx9HEfXbJlx9rk/GENIHK6Yny0k+tkbm3e2nsB
	BsDFx3ddk8JSaEsLzbKYXh9CTL3u1n90UP9RYwhcXXQKFQQY1bn3zT//WZRMOifrX0fr1eVfQyM
	qqEcxYplKnSb8xdaK/D7Yulwgm3SNbxt4eHDpgdKY7q7gQGz2OoX8kxQCcdc4MIVyxIzQ2ufArx
	64BozClr4KO9ExshlUxKRFnVI14Arbw5KjBvBP7/EQUYRo4Tn/l0ZYmdzQPXTi4+kQqSWdjD8ip
	Fs6JkyV1TRTOkR4y3q+EITQZy7EYRey+H93KQ4n0zG+Q5i1aBYwJM5MuE6GfoOkphI/ftRd2X0L
	UqUTBOSGOtXIS3EIcG24MMnZApfT5RUEr/gan5PEpDtOq67hrfdvUC8ON+00De8yf8Jm7JDO1Ub
	WW5AxZhv0Oz7Lk+VNNzDchFXcDvKde2exPO0xRhFI8pWw1KSmaK1FRvWUA42UlkkDHnjAoGN0ls
	gX3lA==
X-Received: by 2002:a05:6000:2c05:b0:435:96a1:ee4d with SMTP id ffacd0b85a97d-43b51956ccbmr485274f8f.14.1773765019140;
        Tue, 17 Mar 2026 09:30:19 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51852a64sm552772f8f.14.2026.03.17.09.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 09:30:18 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 17 Mar 2026 20:30:15 +0400
Subject: [PATCH v2] usb: typec: fusb302: Switch to threaded IRQ handler
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-fusb302-irq-v2-1-dbabd5c5c961@flipper.net>
X-B4-Tracking: v=1; b=H4sIAJaBuWkC/23Myw7CIBCF4VdpZu0YBixUV76H6cLLYCcxLUIlm
 oZ3F7t2+Z/kfAskjsIJDs0CkbMkmcYaetPAdTiPd0a51QattFWGCP0rXYzSKPGJhmxnds62nSO
 ojxDZy3vVTn3tQdI8xc+KZ/qt/51MSOjYkWqdslbvj/4hIXDcjjxDX0r5Atr+PNuoAAAA
X-Change-ID: 20260311-fusb302-irq-316834765871
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Hans de Goede <hansg@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1591; i=alchark@flipper.net;
 h=from:subject:message-id; bh=Z2aWRPXkpx5ekMjctDdvr6UjzEasOAIPeaUcWrJN5NE=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTubJxZzZxZ+fqA8fb1nmd8EkROvp32ZsXEW18/ObOYu
 X0S/hbxs2MiC4MYF4OlmCLL3G9LbKca8c3a5eHxFWYOKxPIEGmRBgYgYGHgy03MKzXSMdIz1TbU
 MzTUMdYxYuDiFICpFjNh+Gc+5cnEVScSDc5P/RHmEJDg9FyiVuZ0U83K4PrtDcus6mwZ/tm3aeb
 Z+fVEzTRl3rK+oexb8pxLiX96UsrkziUU/t4QxAAA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[flipper.net,quarantine];
	R_DKIM_ALLOW(-0.20)[flipper.net:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[flipper.net:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34955-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alchark@flipper.net,linux-usb@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F01B12ADFC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

FUSB302 fails to probe with -EINVAL if its interrupt line is connected via
an I2C GPIO expander, such as TI TCA6416.

Switch the interrupt handler to a threaded one, which also works behind
such GPIO expanders.

Cc: stable@vger.kernel.org
Fixes: 309b6341d557 ("usb: typec: fusb302: Revert incorrect threaded irq fix")
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Changes in v2:
- Re-added the IRQF_ONESHOT flag to the request_threaded_irq() call
  (thanks Hans de Goede and Sebastian Andrzej Siewior)
- Link to v1: https://lore.kernel.org/r/20260311-fusb302-irq-v1-1-7e7105706629@flipper.net
---
 drivers/usb/typec/tcpm/fusb302.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index ce7069fb4be6..889c4c29c1b8 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -1764,8 +1764,9 @@ static int fusb302_probe(struct i2c_client *client)
 		goto destroy_workqueue;
 	}
 
-	ret = request_irq(chip->gpio_int_n_irq, fusb302_irq_intn,
-			  IRQF_TRIGGER_LOW, "fsc_interrupt_int_n", chip);
+	ret = request_threaded_irq(chip->gpio_int_n_irq, NULL, fusb302_irq_intn,
+				   IRQF_ONESHOT | IRQF_TRIGGER_LOW,
+				   "fsc_interrupt_int_n", chip);
 	if (ret < 0) {
 		dev_err(dev, "cannot request IRQ for GPIO Int_N, ret=%d", ret);
 		goto tcpm_unregister_port;

---
base-commit: 95c541ddfb0815a0ea8477af778bb13bb075079a
change-id: 20260311-fusb302-irq-316834765871

Best regards,
-- 
Alexey Charkov <alchark@flipper.net>


