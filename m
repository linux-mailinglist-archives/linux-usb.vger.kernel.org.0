Return-Path: <linux-usb+bounces-35101-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDLsGk+ru2ngmQIAu9opvQ
	(envelope-from <linux-usb+bounces-35101-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 08:52:47 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 020462C7859
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 08:52:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96CBE3164ED9
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 07:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E67D3274FD0;
	Thu, 19 Mar 2026 07:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="POizJ7+M"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC14296BA4;
	Thu, 19 Mar 2026 07:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773906694; cv=none; b=bxigeB8iJP1MXOiv+Ks+Q6qW5uHp0kqoHGpv8hTFlIRJS86fCCRptj3UyzU0woGUf3XVqnb4iw1Ui2lpM9EF1D659L7/sycar4sDwRSRTqVuPb0lJ6mbkYHw711qOCmjg9UStjg0ADsAHwvoX9pHUHtRS8ryeobz8F1Nkf/8JHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773906694; c=relaxed/simple;
	bh=IkvVtG/HwHUaGSddu+08TQT396kKULKkFGF77Q0VPTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DS8U0ehEe32hnZ1ZMTHwYOwM490b7bUA+Ms/341h7z9XtdB/IVAvU1/9srnmyZx4gIIRzgElMIJF4R8WUeKNJrE3Jlj4f4MNvBRCTKdnjZPwnglGn/80aeqosUBtiZeZs3kG5jeDs/UczwsnCJ5bAAPs+cYZHjDb2iF25oMv7vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=POizJ7+M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B9CC2BCB0;
	Thu, 19 Mar 2026 07:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773906692;
	bh=IkvVtG/HwHUaGSddu+08TQT396kKULKkFGF77Q0VPTs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=POizJ7+Mv2OfginoQbbYVFt59eEYtW94BTEP2AJBScspPOUxGFTXJc/7C/lylBF41
	 xIvLDbrHjleQJ3Ao015i6EofQFIofWugrseeuQ9lXjAUvLMjyTBVTyvEVVgqtSBUL8
	 gWN6MjaiFWfiMykDsiewBhWPi5Uyi1X3Qn7dn9s10BTlev37wWhhVykobuyp99WMq0
	 qz09H2VCDBPGrjOqhaH5pYWffq8K8b25IAgEfYiYoufTAS39/iLfbMeAs04eKV64f6
	 klbkReFOLb/83R2MGWn/XNxSS2Aoo/SUtEFKuRNekJ7nYXSfDq1dre8SpgE9vZZYSN
	 tFwibuuRXke4g==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 19 Mar 2026 07:51:04 +0000
Subject: [PATCH v2 2/2] usb: misc: onboard_usb_dev: Add Terminus FE1.1s
 USB2.0 Hub (1a40:0101)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-03-usb-hub-fe1-v2-2-e4e26809dd7d@kernel.org>
References: <20260319-03-usb-hub-fe1-v2-0-e4e26809dd7d@kernel.org>
In-Reply-To: <20260319-03-usb-hub-fe1-v2-0-e4e26809dd7d@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Matthias Kaehlcke <mka@chromium.org>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Inochi Amaoto <inochiama@gmail.com>, spacemit@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2418; i=dlan@kernel.org;
 h=from:subject:message-id; bh=IkvVtG/HwHUaGSddu+08TQT396kKULKkFGF77Q0VPTs=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpu6r0cV5SrrXvhwaq9QwljBnbuoxcv4AK/zuk5
 b24vjXj4G2JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCabuq9BsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2CDw/+NANUB85esiF2p68Cy8EHCAJ6mg6kQl9cLGK1IvV5G/zpO0ZulX+xy
 cl1Xm60bfLK7cv7ciAoo7iqUspvjCSw2L+8PJA0ZVJkKcjAP58SFGzAw20ejkpOOQGBpwHn19lw
 qpa4+ibA8WdxgmwMxgsyMOvpvUO4xJH1FPdYqLwsuCDpiZCg359mct4jLtgYht32jdIzInBMhc3
 XwvtMhJdGhpdz4999ItYXQXPVFcE8dmAYznY2z/4jnkyokL1OCWkWYvTMIV5Gb+toEfEu9yOhF6
 5ZZ1lpu1G5IGYn4fa1CgaP9zYL0yaz2fPvOC3p+Y7sPS48JpccvsQC4Eru8hq3e4UWSFWpmKqgX
 r1LklOK8uf4TVo+cijcwblwZ5v0S4zMQmN3S9hmOv5v6/YQ3nBi8XxzkWmRXiDhhF/VSuCTh+Yi
 or+GXUdXHlM4JOH7GfDLBxnVv0/CJIvisctsV9bwRvuyM8hPL47M80CiIZS2kPWC0rnzu4G2YXZ
 /CGVxG2h4taugBkU/HeUjihNUEmZJm37gncHNhEVSJiK8S6F4ZA18hCZ1AmUqDWL2v1RZ9PdO8D
 qXMFzgAK7DN4gsLzXBAZ61e4yd9p3K7MkI2ZET8/WycV5nfPM78jJxm0hkmHDYnSRCQPh5rPPqM
 4/EtXRHzwdDVUgZdi1DDnMCGNmTEUs=
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
	TAGGED_FROM(0.00)[bounces-35101-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.spacemit.com,gmail.com,lists.linux.dev,vger.kernel.org,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlan@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	HAS_WP_URI(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,terminus-usa.com:url]
X-Rspamd-Queue-Id: 020462C7859
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
 drivers/usb/misc/onboard_usb_dev.h | 1 +
 2 files changed, 3 insertions(+)

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
index 1a1e86e60e04..9284bc072f7c 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -153,6 +153,7 @@ static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usbbda,5411", .data = &realtek_rts5411_data, },
 	{ .compatible = "usbbda,414", .data = &realtek_rts5411_data, },
 	{ .compatible = "usbbda,5414", .data = &realtek_rts5411_data, },
+	{ .compatible = "usb1a40,0101", .data = &vialab_vl817_data, },
 	{ .compatible = "usb1a86,8091", .data = &wch_ch334_data, },
 	{ .compatible = "usb1da0,5511", .data = &parade_ps5511_data, },
 	{ .compatible = "usb1da0,55a1", .data = &parade_ps5511_data, },

-- 
2.53.0


