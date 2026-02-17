Return-Path: <linux-usb+bounces-33401-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLu1IP8+lGmYBAIAu9opvQ
	(envelope-from <linux-usb+bounces-33401-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 11:12:15 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 262F514AB60
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 11:12:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9DD0301AD29
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 10:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6B0322B72;
	Tue, 17 Feb 2026 10:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="GMz3DiEv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886A6322533
	for <linux-usb@vger.kernel.org>; Tue, 17 Feb 2026 10:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771323130; cv=none; b=Steao1Wjgwv/OgHpyieAcQA9+qq8FHy3BBwajltj7/oBxa34z19SuhBjQ8ZF4RDciGHVGIeKhERCzfZoXvwINonpXd7djiWFjNQIilAheNZPhJS8OpFr/IWQ3nNjMUqBwwl+3udxrBfsUM2FoUMEoAQM2Wfs51BJ/1bqWOGBeC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771323130; c=relaxed/simple;
	bh=xCtzWVHar1s0DNX5CJbIJFAZQjuSVMEE71rQZuaz+5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gOv1cR0CXlcXDG3J8IfPWJ5tQUzPCTnTmbHi3CCOAIQorbCRVHdABOGXypBZbCsnCk5DHLQ4hnbioOtRo2MMgymcEEqEq3ukYO2KKp2fPHNYeWgV0r38Q8G2P5b19ER4Aoa46hKWBxNogOue7YfmH+WaxhP39v5GdfR5amR3bC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=GMz3DiEv; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48068127f00so42804405e9.3
        for <linux-usb@vger.kernel.org>; Tue, 17 Feb 2026 02:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1771323128; x=1771927928; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A/PFP0qjFs4EzfF3bF4mXnNk391M6t/LjELpWXvda7A=;
        b=GMz3DiEv54FYp6B8W5nDUFfkIL6lBlULHRAaIGmtyUGz2uO8VM5hGpqQ/RKUd0xDSF
         wCbITjHlpja/zg1/BE95DshxHTQyd3542+Z9hJp4Sgr67QB/FPUfv0GkSlQIvofHi3vj
         arnFyHBPjjqBIoH4mo6n/lKWfl4Gr7Vz0aYnvwgTNz+jdIDd5jPzYGibJdQZcKQczf0M
         iGtjkJ8hjaHVeMzHec8cyTOjGhZS3c7Ws89RmBrxeLKCCwWJInKHMXwVNFztd51f2IYB
         kjmrtZrWie4ghyuzrUQ42ITMvOpsL8R8yWCsoLloXCmiJTnEt0aiDQJsAAGCGwzYEIcn
         7vIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771323128; x=1771927928;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/PFP0qjFs4EzfF3bF4mXnNk391M6t/LjELpWXvda7A=;
        b=wGk750KlsuBECEUv2SW9vSrpv+1LphiUdo3OOrnGBqXVwqdH0QFWU4WVz6QoOMBobh
         GpZLeolhug+B6U2ID/gLhghWQP7u4OmCWXtwqELUmUFFd3b6l4ZCCJhF0cJp2PbpsIDF
         FojXTQi04IaHk4DWPFWVfyZ0tKcSvZsEovf227EdDbv31PgATPDSLdsmyTZ12QoMFSVF
         3/lZ4yMxz5iFarIDSrfTBDoSt2H/EVDHDHknVmAEyg8Y8rzI65J469Vwsk8yWAm0UURR
         iUpWfujZp9gAJEIzSFLSrd5LqLtCSPF4kHsvydMiKeI9rmezKEfzp4xEPysugl3lpO17
         LKGQ==
X-Gm-Message-State: AOJu0Yzoweh1jDJFztwVnblTpyaQ4oHH52hb4wVPtK1T/y6GMRPexgKg
	7C3dgbWL34VFU9MSOkPx5T/1MYBTBhM+nXJoyq8XHfZPx4hOerxFm3NWh2y3QhGysOI=
X-Gm-Gg: AZuq6aKJzqhqr5JuNMT8D6DyeGKhwa8H4Ef4f7sz8xHg4kv5aA5VCxiKzqZ5m6b2SZo
	x59aakaltdKGIUBkqouHt+9Kdtg0y7sp6RA0JpMBBnRRuQSTnrp3TtXiS0PUvp+c+AFJaxqDyPE
	Mk2zU5Tn0YV6goKMPPeyKEA5L1r5256NEYgFT+Zs3VqwvsFunsTwzezNUi7GHPDUSnp5O5M00+k
	gudngQtVymOFhSChif05JWbkR/hE5uQylzU0y9G4X69OCTEl/K++GFATQO5MHZ236syvNyGmq3E
	6IFVzf14ory7xs3VC1lOrY/3BkCSosb632vnQocxn3vfqAduCxtvOmNLHQ6+nKHXwkS8w+e6hoj
	aSkv3VMajuNophB8I+Ca66K7lzv2wMCkrNI2Xk+lw17b0cgTH9X0A4xUfy3LvzIKx9QKAGp90Wk
	xXLie/sDCq1J3p0KJyMWxYAORD5r5D+LgjoCdo6jrcC7yJB7EstwfcOsvyC9AnyNB6+ND3uFsur
	KI=
X-Received: by 2002:a05:600c:4e4d:b0:483:498f:7963 with SMTP id 5b1f17b1804b1-48373a661ebmr217871735e9.26.1771323127871;
        Tue, 17 Feb 2026 02:12:07 -0800 (PST)
Received: from alchark-surface.localdomain (bba-94-59-44-101.alshamil.net.ae. [94.59.44.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abcda5sm37452135f8f.19.2026.02.17.02.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 02:12:07 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 17 Feb 2026 14:12:00 +0400
Subject: [PATCH] usb: misc: onboard_usb_dev: Add support for requesting
 VBUS for Type-A ports
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-typea-vbus-v1-1-657b4e55a4c2@flipper.net>
X-B4-Tracking: v=1; b=H4sIAO8+lGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDI0Nz3ZLKgtRE3bKk0mJdcxNTQ1NjcwugeIoSUENBUWpaZgXYsOjY2lo
 AKKTo8FwAAAA=
X-Change-ID: 20260217-typea-vbus-74515378021d
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1846; i=alchark@flipper.net;
 h=from:subject:message-id; bh=xCtzWVHar1s0DNX5CJbIJFAZQjuSVMEE71rQZuaz+5I=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWROsftp/E4+RflB7dSNn8tTdx7MN7f7+/6U2naX05JPm
 Z9f8t/v0zGRhUGMi8FSTJFl7rcltlON+Gbt8vD4CjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrqGOsYMXBxCsBUL9vP8FfgdQKjiIDjpa2POIzeydlMMHAz5jonv05lzdXXbs+nT1/FyPB+zm3
 nojOnmfX1exo5ziW52lzyPzfjcZi+GJOWbZnoNE4A
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[flipper.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[flipper.net:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[flipper.net:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33401-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alchark@flipper.net,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,flipper.net:mid,flipper.net:dkim,flipper.net:email]
X-Rspamd-Queue-Id: 262F514AB60
X-Rspamd-Action: no action

Add a regulator-only entry matching OF-described USB Type-A connectors.

This allows platforms to explicitly model VBUS supply regulators for these
ports instead of calling them PHY supplies or making the respective
regulators always-on in their device trees.

Type-A ports won't typically need a dedicated driver, as there is nothing
to configure apart from the power supply, so there is no controller driver
to traverse the OF graph and request the VBUS regulator, unlike for Type-C
ports. Thus make it an onboard USB device, which it kind of really is.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/misc/onboard_usb_dev.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index 1a1e86e60e04..35d15b034664 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -108,6 +108,11 @@ static const struct onboard_dev_pdata genesys_gl852g_data = {
 	.is_hub = true,
 };
 
+static const struct onboard_dev_pdata usb_a_conn_data = {
+	.num_supplies = 1,
+	.supply_names = { "vbus" },
+};
+
 static const struct onboard_dev_pdata vialab_vl817_data = {
 	.reset_us = 10,
 	.num_supplies = 1,
@@ -130,6 +135,7 @@ static const struct onboard_dev_pdata xmos_xvf3500_data = {
 };
 
 static const struct of_device_id onboard_dev_match[] = {
+	{ .compatible = "usb-a-connector", .data = &usb_a_conn_data, },
 	{ .compatible = "usb424,2412", .data = &microchip_usb424_data, },
 	{ .compatible = "usb424,2514", .data = &microchip_usb2514_data, },
 	{ .compatible = "usb424,2517", .data = &microchip_usb424_data, },

---
base-commit: 350adaf7fde9fdbd9aeed6d442a9ae90c6a3ab97
change-id: 20260217-typea-vbus-74515378021d

Best regards,
-- 
Alexey Charkov <alchark@flipper.net>


