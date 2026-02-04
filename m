Return-Path: <linux-usb+bounces-33104-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOYeCUNUg2mJlQMAu9opvQ
	(envelope-from <linux-usb+bounces-33104-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 15:14:27 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4662DE6E8E
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 15:14:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F625304C08E
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 14:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3419840F8EC;
	Wed,  4 Feb 2026 14:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kaspersky.com header.i=@kaspersky.com header.b="VTRcx3Im"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx9.kaspersky-labs.com (mx9.kaspersky-labs.com [195.122.169.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7FB40F8D7;
	Wed,  4 Feb 2026 14:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.122.169.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770214308; cv=none; b=WY/1s7YkYoGEHY8ikNEW+edSQ66zpdgs1HMXZtfA002zL88p3DQVGuPwuNZKRnZBk/VgD1Tk8uy5JL439fO8l59guYE/ZtoRnVWQUEMl8e5/yrvYOKxdzGMVLRks8Z0or0cpxXhd+Y9dp8ttt5/zzoWFpYuiIlYvwQW3ECnpXgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770214308; c=relaxed/simple;
	bh=YICMxq33G/Z9DySvYMcdIr6RdEdbxDv43cHfUpaF7Yk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bbkDAxnhWCiAXO+LoW8gmvnpIUf0Q1lsLEbhMGK4opWzkFL9VQvZuwumkZdQUrIuXstJG3+gPv/1VT8PaPBeN9SN6WQ83aZcqPVxo7WmVwUEEsiX9IADJi0gA2hG9IV092zGoch0PvEAE0Pm5SS+T4vqkxkDixMQzZUyLxOZ4R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaspersky.com; spf=pass smtp.mailfrom=kaspersky.com; dkim=pass (2048-bit key) header.d=kaspersky.com header.i=@kaspersky.com header.b=VTRcx3Im; arc=none smtp.client-ip=195.122.169.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaspersky.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaspersky.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaspersky.com;
	s=mail202505; t=1770214300;
	bh=Ogv39PAqCp2VTbjwwj+exs86ORApfUI57oDAwsKlmYw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=VTRcx3ImO1Lhfou2JJwJz/NO0D/7/9l4MdEbs6VnKMpHFdihOnOwSQZe7L0jPUWNG
	 uCye/IZOFJWyPCZUnssHrahPix65+4r0As7V2t06pz9ysXg9/FWtE1ezx+exCBWAkf
	 ZPLAdvzl2eJlRzdlXKn632o/RKlyB/xVXMjzz5U9GY283qyfSNY5KiPN0vwRyhRGNJ
	 lnpvBcdCy1l7fquInmJ1yfWUsgJWwAO3YNKUsKLVw1TrVlrUp5Ig+sWSsM58N4b2aj
	 QY/h60mZcLqv7tRkmdwYs8rnshdkaX2EoekFaO5bryY5XZKK1vyL5OP58lqP8+rX9W
	 BTCwcTZY0+G4g==
Received: from relay9.kaspersky-labs.com (localhost [127.0.0.1])
	by relay9.kaspersky-labs.com (Postfix) with ESMTP id 6EC4C8A0838;
	Wed,  4 Feb 2026 17:11:40 +0300 (MSK)
Received: from mail-hq2.kaspersky.com (unknown [91.103.66.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail-hq2.kaspersky.com", Issuer "Kaspersky MailRelays CA G3" (verified OK))
	by mailhub9.kaspersky-labs.com (Postfix) with ESMTPS id 3ADCB8A194A;
	Wed,  4 Feb 2026 17:11:40 +0300 (MSK)
Received: from Votokina.avp.ru (10.16.104.187) by HQMAILSRV2.avp.ru
 (10.64.57.52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 4 Feb
 2026 17:11:39 +0300
From: Votokina Victoria <Victoria.Votokina@kaspersky.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC: Votokina Victoria <Victoria.Votokina@kaspersky.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Roger Quadros <rogerq@kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<lvc-project@linuxtesting.org>
Subject: [PATCH] usb: dwc3: am62: handle usb2_refclk enable failures
Date: Wed, 4 Feb 2026 17:11:30 +0300
Message-ID: <20260204141131.2451382-1-Victoria.Votokina@kaspersky.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HQMAILSRV3.avp.ru (10.64.57.53) To HQMAILSRV2.avp.ru
 (10.64.57.52)
X-KSE-ServerInfo: HQMAILSRV2.avp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 02/04/2026 13:53:20
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 200150 [Feb 04 2026]
X-KSE-AntiSpam-Info: Version: 6.1.1.20
X-KSE-AntiSpam-Info: Envelope from: Victoria.Votokina@kaspersky.com
X-KSE-AntiSpam-Info: LuaCore: 87 0.3.87
 7430d8ffafccd8879e1d8370e5b501352446c2ba
X-KSE-AntiSpam-Info: {date_rfc_vio_soft_silent}
X-KSE-AntiSpam-Info: {Tracking_cluster_exceptions}
X-KSE-AntiSpam-Info: {Tracking_real_kaspersky_domains}
X-KSE-AntiSpam-Info: {Tracking_black_eng_exceptions}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: kaspersky.com:7.1.1,5.0.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: {Tracking_white_helo}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 02/04/2026 13:56:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 2/4/2026 11:49:00 AM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2026/02/04 11:41:00 #28178294
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 52
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kaspersky.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kaspersky.com:s=mail202505];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33104-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Victoria.Votokina@kaspersky.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kaspersky.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kaspersky.com:email,kaspersky.com:dkim,kaspersky.com:mid]
X-Rspamd-Queue-Id: 4662DE6E8E
X-Rspamd-Action: no action

The AM62 DWC3 glue enables usb2_refclk via clk_prepare_enable(), but
the return value was ignored in the init path. If the clock cannot be
enabled (including -EPROBE_DEFER), the driver continues and may access
the controller/PHY in an undefined state.

Also check dwc3_ti_init() return value on resume when power/context was
lost.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 31d500c2d0d4 ("usb: dwc3: dwc3-am62: Re-initialize controller if lost power in PM suspend")
Signed-off-by: Votokina Victoria <Victoria.Votokina@kaspersky.com>
---
 drivers/usb/dwc3/dwc3-am62.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-am62.c b/drivers/usb/dwc3/dwc3-am62.c
index e11d7643f966..d8b35098e921 100644
--- a/drivers/usb/dwc3/dwc3-am62.c
+++ b/drivers/usb/dwc3/dwc3-am62.c
@@ -205,7 +205,9 @@ static int dwc3_ti_init(struct dwc3_am62 *am62)
 
 	dwc3_ti_writel(am62, USBSS_PHY_CONFIG, reg);
 
-	clk_prepare_enable(am62->usb2_refclk);
+	ret = clk_prepare_enable(am62->usb2_refclk);
+	if (ret)
+		return dev_err_probe(am62->dev, ret, "failed to enable usb2_refclk\n");
 
 	/* Set mode valid bit to indicate role is valid */
 	reg = dwc3_ti_readl(am62, USBSS_MODE_CONTROL);
@@ -361,14 +363,17 @@ static int dwc3_ti_resume_common(struct device *dev)
 {
 	struct dwc3_am62 *am62 = dev_get_drvdata(dev);
 	u32 reg;
+	int ret;
 
 	reg = dwc3_ti_readl(am62, USBSS_DEBUG_CFG);
 	if (reg != USBSS_DEBUG_CFG_DISABLED) {
 		/* lost power/context */
-		dwc3_ti_init(am62);
+		return dwc3_ti_init(am62);
 	} else {
+		ret = clk_prepare_enable(am62->usb2_refclk);
+		if (ret)
+			return ret;
 		dwc3_ti_writel(am62, USBSS_DEBUG_CFG, USBSS_DEBUG_CFG_OFF);
-		clk_prepare_enable(am62->usb2_refclk);
 	}
 
 	if (device_may_wakeup(dev)) {
-- 
2.43.0


