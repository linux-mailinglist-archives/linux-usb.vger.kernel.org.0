Return-Path: <linux-usb+bounces-35074-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SB0fEpX2umlvdgIAu9opvQ
	(envelope-from <linux-usb+bounces-35074-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 20:01:41 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C912C1BBD
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 20:01:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D456F30B4E49
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 18:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32BC63EAC7D;
	Wed, 18 Mar 2026 18:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="a8tF8qJ0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f226.google.com (mail-qt1-f226.google.com [209.85.160.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7902C8462
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 18:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773860238; cv=none; b=JKsFaZ8auyOHtch88A2sWpCp3j/vKwMEUAzC8X8Dy84IrsuTRx2grPiaicbxWQnfXclocC+kFsDVmLlqJAGKj2N+0/e2G9p8SJ61vN1dtAFjODuG1vjOLCzOG/vIuUfUk4iqUGQrGEkHzHNy9+2ZBoWdh43GknfIheInXin9Nyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773860238; c=relaxed/simple;
	bh=3gUh26W00SykE7bH+fRcJFUFxFQ5Gw2NgHrDmNwaDKg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fAE8MuRPXvV5G5DZEIDliSs6QXEbX4HwbFDpwFhYmB9gYBHgC0HfMWwXwpg4GkDhsOW1RCk8kLxde4FUVq8bSqJ5jsFe28kRD37mtliErKSZG8oJm5Ayb6gZZUcWfGbWZh3sDNnaL6HM+h1zc3aLpPRxaIDK9e3hCMJr/6z4ft8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=a8tF8qJ0; arc=none smtp.client-ip=209.85.160.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-qt1-f226.google.com with SMTP id d75a77b69052e-50b268fba9aso67161cf.3
        for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 11:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773860236; x=1774465036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Flu5UveNjIetWU8TueZBFMn5Xph19iZ6ffxaF9uvm+M=;
        b=kfUO5IxpUzP1pXQdqejwb1bVEudaG4uF+CQi+ftsu0fmZqxxGVUyaWnekoJceKNR20
         trKbIzBbOstcyoWBauvQi8Ug8ZI56D9lHYYK0BaztGO+lwsnT3oBCMzeefgJsHdJ2Ivx
         dQ7CQ7MaDnd5FUR1wZXepHzBYS32eNsq9XT6uEAL2UC7LS3lMZBchAYMIE1n85NmQXvl
         M3Qa3/vh3RVUFpir+aLk+8Z0WKi9o0pIiSiJSnRSIYT+xR7exYD/J5cazzUJpAP8l5Ag
         LQIyS6AV3Pw8rTpbt7OXh7VZN7sFbSslJgypZ+LO0mM0mMW+J1F6Lbqv8hLFISheeKwA
         oEhQ==
X-Gm-Message-State: AOJu0Yz/8mbJEvnL7iXY7EmmKikQT5DBZ+RphdZPIkDCHrf+Qx4d8tKG
	bS3KNPaijpZnOo5pmW/8BoYUf/zTY5DXRoHVKg+z2YDKguQmU1320ysU5exUqPQ1V2ntNZe1PH7
	cyLb8hdIFXzzuh3bqOGAppGsEdDqI2VH2JkR8efF04JAWFsxEFLqOhPvI961Rtwd1I4VQZDAIFD
	+eQNU5VJ7Z7aVQXA97q4nTfQJMAaRPYcCSqc2o/F8sTXI6qoC1pAp0lhz5MjIaQ3YcEsdJkxrng
	sKM1z+vgH5Mmw==
X-Gm-Gg: ATEYQzwqyHm9nJNNCw0lNrhdOvd6DU9UN9AL0cxHzwlFkXYZafPxtiR3KJwLGFUwNo8
	XfiVPTn2zvOnGWgO3kRKPm4X7rDNY6o+O8xnxX+AfPpxp4b3X4wAomENfkwcFMoTsMuOekR88yl
	dT4hURzbdQFJQoCRnHRtYKD1U2MAAHEsXdOZnWBqhxPt7nGrTZKQtf9ianf8aC6vsLhbSBA+1n5
	iMPs4W+eBfhR+le/M/Fylj9+9lBA5v1A2FF2zZ0gVWifyIjF9BGuA/T5ul5Kcmgq0fna2TTax/8
	QpLMwEpX7wYCOWaJurGYk3XCRHdimYfx2Zhplbq5zprpW02B/xlRutMFcs+e48x7IPBArNb3kM4
	ljXnF8l7Jm9wq0B17nmXY3nuP5yYciXcnAKIQBK3EV7MfK3m5qWKthT13uI8sK5WOJvoiUzGKkQ
	YdBet13w9FuSQqNcm+V4bfrKysinkf1YkPsCUx+MB/RdLkK3+NQ+hATJU=
X-Received: by 2002:a05:622a:120e:b0:4ed:b0f9:767f with SMTP id d75a77b69052e-50b148ff8a3mr57081451cf.70.1773860236351;
        Wed, 18 Mar 2026 11:57:16 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-89c6b9999adsm3543326d6.16.2026.03.18.11.57.16
        for <linux-usb@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Mar 2026 11:57:16 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5094741c1c1so10821261cf.1
        for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 11:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1773860235; x=1774465035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Flu5UveNjIetWU8TueZBFMn5Xph19iZ6ffxaF9uvm+M=;
        b=a8tF8qJ0tMWryAuH+pV1NCRzQ063JnNM13h3GYCtw4VHecpYqwcrDymbJxzYSliwfZ
         skF4le5Tl4rF+JbZVI9WJUAg91gKg1rbuLGg2H3nQN6zbJQCUK6WHhhm0lf3si5xTbE3
         yt3bHqHw/0SA1njAp1p2osr7zOahTVrh3GIog=
X-Received: by 2002:ac8:7f81:0:b0:509:aa4:4a02 with SMTP id d75a77b69052e-50b147d5dadmr57622861cf.29.1773860235458;
        Wed, 18 Mar 2026 11:57:15 -0700 (PDT)
X-Received: by 2002:ac8:7f81:0:b0:509:aa4:4a02 with SMTP id d75a77b69052e-50b147d5dadmr57622381cf.29.1773860234876;
        Wed, 18 Mar 2026 11:57:14 -0700 (PDT)
Received: from stbsdo-bld-1.sdg.broadcom.net ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b1dfcfd2bsm14511001cf.29.2026.03.18.11.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 11:57:14 -0700 (PDT)
From: justin.chen@broadcom.com
To: linux-usb@vger.kernel.org
Cc: f.fainelli@gmail.com,
	andy.shevchenko@gmail.com,
	gregkh@linuxfoundation.org,
	stern@rowland.harvard.edu,
	bcm-kernel-feedback-list@broadcom.com,
	alcooperx@gmail.com,
	Justin Chen <justin.chen@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: [PATCH v2] usb: ehci-brcm: fix sleep during atomic
Date: Wed, 18 Mar 2026 11:57:07 -0700
Message-Id: <20260318185707.2588431-1-justin.chen@broadcom.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[broadcom.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,rowland.harvard.edu,broadcom.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35074-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[broadcom.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.954];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[justin.chen@broadcom.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A0C912C1BBD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Justin Chen <justin.chen@broadcom.com>

echi_brcm_wait_for_sof() gets called after disabling interrupts
in ehci_brcm_hub_control(). Use the atomic version of poll_timeout
to fix the warning.

Fixes: 9df231511bd6 ("usb: ehci: Add new EHCI driver for Broadcom STB SoC's")
Signed-off-by: Justin Chen <justin.chen@broadcom.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
v2
- Fix fixes tag formatting.

 drivers/usb/host/ehci-brcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/ehci-brcm.c b/drivers/usb/host/ehci-brcm.c
index 888e8f6670d2..5e3156f94cc6 100644
--- a/drivers/usb/host/ehci-brcm.c
+++ b/drivers/usb/host/ehci-brcm.c
@@ -31,8 +31,8 @@ static inline void ehci_brcm_wait_for_sof(struct ehci_hcd *ehci, u32 delay)
 	int res;
 
 	/* Wait for next microframe (every 125 usecs) */
-	res = readl_relaxed_poll_timeout(&ehci->regs->frame_index, val,
-					 val != frame_idx, 1, 130);
+	res = readl_relaxed_poll_timeout_atomic(&ehci->regs->frame_index,
+						val, val != frame_idx, 1, 130);
 	if (res)
 		ehci_err(ehci, "Error waiting for SOF\n");
 	udelay(delay);
-- 
2.34.1


