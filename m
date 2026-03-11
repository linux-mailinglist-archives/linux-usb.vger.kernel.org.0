Return-Path: <linux-usb+bounces-34581-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKTNM9iCsWmjCwAAu9opvQ
	(envelope-from <linux-usb+bounces-34581-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 15:57:28 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E6D265DD1
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 15:57:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 61DC930086B4
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 14:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E3634FF58;
	Wed, 11 Mar 2026 14:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="QF4xUfHa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAB1320A0E
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 14:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773241037; cv=none; b=h8qbaUrY/GVAIoWa9W8qCrw0nFOP3Mn56WEymv7mutIi5NWwb3kOEkmTgmUzWp98369t5NmaqqyilaL8/S8SpEHHtFF27G+E8AES1mS8SaSvgYjv7MEs0dI8vLCRN/tJKYXXo0syl45rP71OldRPKiBxf84kDhRdC/YdhlvtdAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773241037; c=relaxed/simple;
	bh=whRlnXOTJX33UysFGZTkniey9cqO9uDlVFVa4j6/+PU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Kil/poCnhFcpja1gKDIrMXmJIZyWesU8KnOKeGQeW9YgPZhwKqRL2OXf4+wpW5yE98aX9/XX8T4ytadfAQuSuGbvj62VkQX+JMe7oBTyxB/sGunOkWosvJLnGSinDlGRVBm10516lwXGfCgNE3ZTXu+9Dce1Xs5ueCaFlmA4FTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=QF4xUfHa; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439c56e822eso8749992f8f.2
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 07:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773241035; x=1773845835; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ki9mPb6MpmZA9uDUTROX4stJ4S460LJ9o1EuP/Qc+p4=;
        b=QF4xUfHaa10obzGhDAGX6UKwkB08xUWsHhmmuN0+omsFL105GnyiyjZbYoxT2T7tPQ
         3evp2UK8EA2Bct9k3WPeNgg6wokdbDr45LvJXe+x+yC4rkv7HxalV5+96wuaCVQrtx7n
         0/iBMHWe/K2VmlsYTRzTwx4RgxuzoqjKx2udD5XzaefmiSYxiTd2fLSbCtRRmdrIy7SF
         Kvy6sY9vpcsho3kMrW4Z2ucISTwp3z445ItSYL7IPc5fHtTwtXGt6EsxifULhANJpHNT
         MX8jPTo6PeF05+9PMYSKY5v817EO48F5NT0s/cEptpPFVd/Rkfji+NVuDWrjaMgrpE+R
         dZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773241035; x=1773845835;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ki9mPb6MpmZA9uDUTROX4stJ4S460LJ9o1EuP/Qc+p4=;
        b=N+JNAbsoelE3OgQMD7rfBe9oZXSRay91iqrW1qF+zNo7h6TQFd6odrn8FnkyxnZRO3
         ArjNBrTWfZwYFfgg/eLK5cyLAms1sSDBA81ftGlYsQ6b5UVwGxmLmX1LupYqWZuZQ27K
         CN+cMV2lFt61w8OF2b9Sdar0gQ5l8m806E+y22/0+KWQWlsyd5j4VXBunPHKA/i3N364
         XsaEHPvuiASXM8ggkkxH+pEDkK9qxufCNe94Ar2KtrcePCCl+PJQu9/y7xU9IBpjNoKu
         yaxs/RFKyTde2HIlrb2Rb1gadHZ5XuDELy9RqIrYgl5insWDY7rxXz0+B6y0WitHKVRO
         CiPQ==
X-Gm-Message-State: AOJu0YxSD+6YiBAZ1uhgK55WqhikBSOPsvHHWsDtgjvB5a5OlBnuU8aI
	tQ4b+nScIPpImopgzbHy8eJwUlxDJVF1wzhNfGFtiL1xs3bgGqHvCckx1JqWOxJRUYdEFf9kj5d
	DT7QQ
X-Gm-Gg: ATEYQzxkdWUyN4H/GqaUyjYtZlzym9v5qpHHHoeFsSRnW4xIvvV6utihm3kLo0o8q+l
	6BwiQG5ZK0ysc5YRl3f8J+v6hPHRgQXGPQys6fVros6vAXfDOZQfl6BYbEI/421unWm/dVp7ddF
	YexFrpvd/MxWbzgp7Y42PA9u9xaZdmYxOLRk+SVdL4yXLFA5i2vC2UOH+ITQ73nIvPcZ6QyWE7g
	djr1YQvX4JHE8kH+Qle+LyZ1Y4OX5SaV4vHOZtp2zoBlR1JChjNdaVJuIIqQonbtdkWDthdbUoR
	qQ0U6nuRWS8JnRKlnX3cM7V/drVO3v2pidZkCeccctfbc3AochOjwx08l954FjNOKbziqxU1YMI
	++HjtaHay4cGQ5tshK7DL5/5UeKRul/dLbMi7TispVxtla9H45KmREc3OX2uqpDG5Rxz5aEnUAE
	ZxWHCbNJMmjTMdVkiyxn1IldzB+7CmnbwDS9wa3rDEEamAseL/4zmkyS0UvLlem3YKKaxj87iG7
	QFb9AF7EENNs622
X-Received: by 2002:a05:6000:2482:b0:439:b932:b428 with SMTP id ffacd0b85a97d-439f81b6659mr5556374f8f.8.1773241034786;
        Wed, 11 Mar 2026 07:57:14 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f81acc22sm7000956f8f.16.2026.03.11.07.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 07:57:14 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 11 Mar 2026 18:57:12 +0400
Subject: [PATCH] usb: typec: fusb302: Switch to threaded IRQ handler
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-fusb302-irq-v1-1-7e7105706629@flipper.net>
X-B4-Tracking: v=1; b=H4sIAMeCsWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0ND3bTS4iRjAyPdzKJCXWNDMwtjE3MzUwtzQyWgjoKi1LTMCrBp0bG
 1tQDxCsT/XQAAAA==
X-Change-ID: 20260311-fusb302-irq-316834765871
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1328; i=alchark@flipper.net;
 h=from:subject:message-id; bh=whRlnXOTJX33UysFGZTkniey9cqO9uDlVFVa4j6/+PU=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRubDrZcLNDr/yn0seGFQkvXy9+f7nA4zybffHiTauWL
 vjUuu1icMdEFgYxLgZLMUWWud+W2E414pu1y8PjK8wcViaQIdIiDQxAwMLAl5uYV2qkY6Rnqm2o
 Z2ioY6xjxMDFKQBTzfmP4a9AUrZshOjvyqunIie+Nfvy/L1uiNZdWXvTmiszjuzNn+vD8E+fQfL
 EdFOJGu8bBhUbAj4bKwjx9Dou6Ggs41xz9cv23QwA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[flipper.net,quarantine];
	R_DKIM_ALLOW(-0.20)[flipper.net:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[flipper.net:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34581-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alchark@flipper.net,linux-usb@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C6E6D265DD1
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
 drivers/usb/typec/tcpm/fusb302.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index 19ff8217818e..4f1f24737051 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -1755,8 +1755,8 @@ static int fusb302_probe(struct i2c_client *client)
 		goto destroy_workqueue;
 	}
 
-	ret = request_irq(chip->gpio_int_n_irq, fusb302_irq_intn,
-			  IRQF_TRIGGER_LOW, "fsc_interrupt_int_n", chip);
+	ret = request_threaded_irq(chip->gpio_int_n_irq, NULL, fusb302_irq_intn,
+				   IRQF_TRIGGER_LOW, "fsc_interrupt_int_n", chip);
 	if (ret < 0) {
 		dev_err(dev, "cannot request IRQ for GPIO Int_N, ret=%d", ret);
 		goto tcpm_unregister_port;

---
base-commit: 7109a2155340cc7b21f27e832ece6df03592f2e8
change-id: 20260311-fusb302-irq-316834765871

Best regards,
-- 
Alexey Charkov <alchark@flipper.net>


