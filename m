Return-Path: <linux-usb+bounces-34915-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MN8ABMEXuWmOpgEAu9opvQ
	(envelope-from <linux-usb+bounces-34915-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 09:58:41 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BCA2A625D
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 09:58:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 301A030B100A
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 08:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCCC42D7DE7;
	Tue, 17 Mar 2026 08:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A7GxGgDS"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619F339EF00;
	Tue, 17 Mar 2026 08:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773737741; cv=none; b=Aikp7L6BpTciT3v3Qvf15MXh3LrQdktf2+6SJzImmfA9yw2PjwTcRuR8IU9Ks3EJgTw0QGdvmyOmx8VJSjqCCQ+exKsxz6L9dxQ6subKcdDVhAdZNcvmrnZCIODhtfPcvpqQBhp/HimOPOdLVW2LBBkM5mIOQ5HctfFEIasMv78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773737741; c=relaxed/simple;
	bh=3OQGiuGuEdcvsKAff7TI6Cpn37uV8at9uKA8efwpzBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gx6CCtoX83PmT6DUL56jxw3cpre34xjZVGJAbHofG8d12SonRwHmiO8K65JfrbYyHql3lx6+T96tezxTrVLsfVYypJle0+ttlSpOSiT4VrW71wAPM6Z3WnwIQfOoMhVuffHZEqQuqyuoeIoQUOEhR7C46izyNtuZZ5R0mvD3O4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A7GxGgDS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F29EC19425;
	Tue, 17 Mar 2026 08:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773737741;
	bh=3OQGiuGuEdcvsKAff7TI6Cpn37uV8at9uKA8efwpzBo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=A7GxGgDSScTIa9ymQmlzlpZ5h1MVrq3gNXOFEGVB/4XpRF4CBD1yhLR6ZfumgPg9X
	 kZRuKF1vceGMiWF2ON3O10yri7I1LiIpe8iqrXQ5KXBS64dDZ0WLvQCVUuKJqFMbhC
	 j/nc9KrZQg3O7g6z/idblY+Z5ZF0CyfxPGf5v2Tl20HrNBsQPU7B50pDTBKpEkjXq+
	 bgJmx7IbSqKN+0JklFmR1NbXLLNqXoDy5e2bqpoftWBffhQnQqC+zg1w5AIimNgfSi
	 Sb2eX8MaUqA5OW9PYj7uOHwzc2bZZJwIYVZo/SdSchID9nnKlPv5aPt7yZXLThLOfV
	 pYaAfFhzQMKow==
From: Yixun Lan <dlan@kernel.org>
Date: Tue, 17 Mar 2026 08:55:04 +0000
Subject: [PATCH 3/3] usb: misc: onboard_usb_dev: Add Terminus FE1.1s USB2.0
 Hub (1a40:0101)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-03-usb-hub-fe1-v1-3-71ec3989f5be@kernel.org>
References: <20260317-03-usb-hub-fe1-v1-0-71ec3989f5be@kernel.org>
In-Reply-To: <20260317-03-usb-hub-fe1-v1-0-71ec3989f5be@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Matthias Kaehlcke <mka@chromium.org>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Inochi Amaoto <inochiama@gmail.com>, spacemit@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2804; i=dlan@kernel.org;
 h=from:subject:message-id; bh=3OQGiuGuEdcvsKAff7TI6Cpn37uV8at9uKA8efwpzBo=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpuRb+SyLLmrFmr0/YYXqqF0ueVCXTybGQtgV0n
 Dd1ZthbXFGJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCabkW/hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3xng//VncMpHobe+zKzIFq0WrKXlq8Vf7d+tXwsQBux4nmHqi3eQxN2jATm
 9eOHtB4UG019kImZ5Tazsh6XJ5l7lrw9uJKCRyAv4+qn8aa8r2pM5brKHU9Me9Z2nNq4nN/r+E9
 M9SvbUeg8QRZivx9vxIMWMEaBuBEm7AFDdgJrFGkD1XvOf30SEqO0wrwKwzxR3/oZhrIuXBOriN
 35xMQCyHWkaSHpKnf+tauTATXJYvWLXk0aJSkKlom22YmDXwBdvugOBu7zIOLHOzNFIrlZaW0tG
 AA1h0bm1ckvrR6zJ6UIw6HesCwl3Fxl39I+xwj+RdSQVjPCCV1ant2yW58QOwPWJGMi16iHOCy5
 5tva1Qrb2qWYO6QbLm9oXs14XuxTvMwevQcBPMAGohoT7JOYSZcDaV2DWdXA1BYTXs/+AGpfq+s
 vw3Xi8JVeksX9NDb1OCsGBmAOgGmKjj1vvNt5LK+HFatxC/pJW5wnRrF3DuarDkGlY9cOhkW6Yb
 NdxYR5za5LKYghjY3LqSNioFT6VVp40qok3qG820GzA2JORFde3q45fZS8uqEApWNPHKaNKfli2
 oEfsjbpEBIeaT9GOaFT2loRaWYkmrwAmAfuiapGx16E6us6Arfb8vO7vK/sWDfGwFh45n0OZ8jA
 kZLrV+7NhWYs0x/JWqObHL1v97zPaM=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34915-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.spacemit.com,gmail.com,lists.linux.dev,vger.kernel.org,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlan@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	HAS_WP_URI(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[terminus-usa.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 87BCA2A625D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Terminus FE1.1s is USB2.0 protocol compliant 4-port USB HUB, It support
MTT (Multiple Transaction Translator) mode, the upstream port supports
high-speed 480MHz and full-speed 12MHz modes, also it has integrated 5V
to 3.3V/1.8V regulator and Power-On-Reset circuit.

Link: https://terminus-usa.com/wp-content/uploads/2024/06/FE1.1s-Product-Brief-Rev.-2.0-2023.pdf [1]
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/usb/misc/onboard_usb_dev.c | 2 ++
 drivers/usb/misc/onboard_usb_dev.h | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index ba37eb99efba..5732843c6687 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -570,6 +570,7 @@ static struct platform_driver onboard_dev_driver = {
 #define VENDOR_ID_MICROCHIP	0x0424
 #define VENDOR_ID_PARADE	0x1da0
 #define VENDOR_ID_REALTEK	0x0bda
+#define VENDOR_ID_TERMINUS	0x1a40
 #define VENDOR_ID_TI		0x0451
 #define VENDOR_ID_VIA		0x2109
 #define VENDOR_ID_XMOS		0x20B1
@@ -673,6 +674,7 @@ static const struct usb_device_id onboard_dev_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0414) }, /* RTS5414 USB 3.2 HUB */
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5414) }, /* RTS5414 USB 2.1 HUB */
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0179) }, /* RTL8188ETV 2.4GHz WiFi */
+	{ USB_DEVICE(VENDOR_ID_TERMINUS, 0x0101) }, /* Terminus FE1.1s 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_TI, 0x8025) }, /* TI USB8020B 3.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_TI, 0x8027) }, /* TI USB8020B 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_TI, 0x8140) }, /* TI USB8041 3.0 HUB */
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index 1a1e86e60e04..4efc5f44c4ee 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -108,6 +108,13 @@ static const struct onboard_dev_pdata genesys_gl852g_data = {
 	.is_hub = true,
 };
 
+static const struct onboard_dev_pdata terminus_fe11s_data = {
+	.reset_us = 10,
+	.num_supplies = 1,
+	.supply_names = { "vdd" },
+	.is_hub = true,
+};
+
 static const struct onboard_dev_pdata vialab_vl817_data = {
 	.reset_us = 10,
 	.num_supplies = 1,
@@ -153,6 +160,7 @@ static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usbbda,5411", .data = &realtek_rts5411_data, },
 	{ .compatible = "usbbda,414", .data = &realtek_rts5411_data, },
 	{ .compatible = "usbbda,5414", .data = &realtek_rts5411_data, },
+	{ .compatible = "usb1a40,0101", .data = &terminus_fe11s_data, },
 	{ .compatible = "usb1a86,8091", .data = &wch_ch334_data, },
 	{ .compatible = "usb1da0,5511", .data = &parade_ps5511_data, },
 	{ .compatible = "usb1da0,55a1", .data = &parade_ps5511_data, },

-- 
2.53.0


