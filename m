Return-Path: <linux-usb+bounces-38070-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uM5MIkPnFWrdeAcAu9opvQ
	(envelope-from <linux-usb+bounces-38070-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 20:32:35 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6375DB5EE
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 20:32:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D21263080E64
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 18:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 909154219FE;
	Tue, 26 May 2026 18:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=its.rel.pl header.i=@its.rel.pl header.b="BbLBTB3u"
X-Original-To: linux-usb@vger.kernel.org
Received: from de1.sohost.pl (de1.sohost.pl [157.90.211.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C7040DFAF;
	Tue, 26 May 2026 18:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.211.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779820001; cv=none; b=gEKp7lg4ArRgc3Lmq0dZZQxv6hw00aSe4i0+2ZE481QC3HDV77txebvqFxj0ZlhABM7Zd6vnnPp0PEWzWoPA0e031oCYQwqKJcIrtrtT9u4S7tg3KtFZ3TW8XN2yHZmdoUGGde/r0CXEdIeaO9JJbP1fEY0/lhvO1hX7VVnqj9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779820001; c=relaxed/simple;
	bh=y6ZKWR248BUZrPvxCPzoBZxd14HbUT2s3WBfCXFBp+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FrMxPUcS8tnSn1upfcY03mquqAvXraTX5UeCNX2lKBhg5dAfkBqa8w7L4jf4B5w9mBufvSTA+eY2loNemEqdnNIpjEE25TCyZXNixZy4orL4HPkgCsSoKSqxx1lmcdNX06+kMfhGKSo//EkscIdZYSGvfqxwsMH5YNIF0BjEKC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=its.rel.pl; spf=pass smtp.mailfrom=its.rel.pl; dkim=pass (2048-bit key) header.d=its.rel.pl header.i=@its.rel.pl header.b=BbLBTB3u; arc=none smtp.client-ip=157.90.211.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=its.rel.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=its.rel.pl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=its.rel.pl;
	 s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:
	From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=eFVjYmU7OcYPTAcJqlNFDXV6vMOEqFcNJ0Tk42VRm8A=; b=B
	bLBTB3uEPgqbg/KcHO0gYnr9lMyGoHokst30t3DPfFsy9n7oERBNFMNEDNwh0pmduyIYuarHsUp4g
	iFzUi5gdGsVsF4l4l61TYNChzRcZlGMM6dq1cUufxa7wnCizLzE+GfutdDTBpDfTaugbk52eUP37/
	r+MS+wZwzBtcBkZ+I9ekhoSRzNI0ah/ksy8G4qSpjQp0SsI7w/E71UaqZ5YmvhBy66G/utOeOXfog
	JqWHClTZRwtwSisSl3eT8iU/+u9i26Gc0Vg3iCarsoTM1/LPFkcS7gWGsyUTIbxxzQ1Fbk8aPfwnt
	3rr0ALfa/TxsDaM8hapqTUyyE4k+zYKYw==;
Received: from d171-145.icpnet.pl ([109.173.171.145] helo=ewglsoawd.hstl.put.poznan.pl)
	by de1.sohost.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <igor@its.rel.pl>)
	id 1wRvrT-007874-QB; Tue, 26 May 2026 19:46:39 +0200
From: Igor Cudnik <igor@its.rel.pl>
To: gregkh@linuxfoundation.org
Cc: heikki.krogerus@linux.intel.com,
	mika.westerberg@linux.intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Cudnik <igor@its.rel.pl>
Subject: [PATCH 1/1] usb: acpi: fix undefined behavior in USB_ACPI_LOCATION_VALID
Date: Tue, 26 May 2026 19:43:37 +0200
Message-ID: <20260526174513.15692-1-igor@its.rel.pl>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: igor@its.rel.pl
X-Spamd-Result: default: False [1.14 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[its.rel.pl:s=x];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[its.rel.pl : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[sea.lore.kernel.org:server fail,its.rel.pl:server fail];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38070-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[igor@its.rel.pl,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[its.rel.pl:-];
	NEURAL_HAM(-0.00)[-0.887];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: BB6375DB5EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

USB_ACPI_LOCATION_VALID uses a signed left shift into the sign
bit. Shifting a signed value into the sign bit is undefined behavior.
Use BIT(31) instead.

Found by cppcheck:
      drivers/usb/core/usb-acpi.c:221:24: error:
      Shifting signed 32-bit value by 31 bits is undefined behaviour
      [shiftTooManyBitsSigned]

Fixes: f3ac348e6e045 ("usb: usb-acpi: Set port connect type of not connectable ports correctly")
Signed-off-by: Igor Cudnik <igor@its.rel.pl>
---
 drivers/usb/core/usb-acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
index 489dbdc96f94..583aca6d7669 100644
--- a/drivers/usb/core/usb-acpi.c
+++ b/drivers/usb/core/usb-acpi.c
@@ -197,7 +197,7 @@ static int usb_acpi_add_usb4_devlink(struct usb_device *udev)
  * Private to usb-acpi, all the core needs to know is that
  * port_dev->location is non-zero when it has been set by the firmware.
  */
-#define USB_ACPI_LOCATION_VALID (1 << 31)
+#define USB_ACPI_LOCATION_VALID BIT(31)
 
 static void
 usb_acpi_get_connect_type(struct usb_port *port_dev, acpi_handle *handle)
-- 
2.53.0


