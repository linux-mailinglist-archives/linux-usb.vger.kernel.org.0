Return-Path: <linux-usb+bounces-34271-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKJMJI2WrmnRGQIAu9opvQ
	(envelope-from <linux-usb+bounces-34271-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 10:44:45 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 224332366E3
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 10:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE8F93063D62
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 09:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C19837BE71;
	Mon,  9 Mar 2026 09:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mTW/nVt/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6B833D4FD;
	Mon,  9 Mar 2026 09:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773049204; cv=none; b=Cocyb0NNpNBiEdmKTWIawHwSg++g8GLdqYIM0aWMcoT0YhtxIbCeJKyAyBVNg8VkzcQtm1KXG4jAxMbBozoit0fJacrSg29sJyUuUdtQnY/VlTTN/EH9kduAjvJffBxo8laf+1nFcka+7o6T7gy4bdUGf7C2nd8QRYQYR8zAFdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773049204; c=relaxed/simple;
	bh=S6LrPYXpL0PyjOauk2FTdHCCzXIRyahfXYvRpIqFvsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TWldkdyqIi+vmAmaqwUMhGTO5trTIFUIAuSvou54K7RAX8PwM5xN+UiUMiiG1bZ2d19keMZc4I4xO914GbcqAE5BPWpMwiRgRAYP1u66VFFvBgl3hXGUzgZQwM3ukpdoHzetTQhHqFBNQG8+5el5u3+y8G20Sd8YtF3/HWtimQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mTW/nVt/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29F6CC2BCAF;
	Mon,  9 Mar 2026 09:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773049204;
	bh=S6LrPYXpL0PyjOauk2FTdHCCzXIRyahfXYvRpIqFvsM=;
	h=From:Date:Subject:To:Cc:From;
	b=mTW/nVt/3KTY1iUut/KOQKbV/GQTZL4YqPq1lizasWVnWUL2HKCIyyFe+WhFnk3dc
	 Dymz9hvq4tbuy8SdoLW7Mh+pZ5u/gpLGOlN80iUmRefm2J9dd5M5NF9Ign6NOzjZlA
	 pYS38OmmcwdtkjSwildNeci31s7f0Mud413Zat+VgwvU1ED+uSLp334gEe++1Hcc9T
	 dCHx8wh0xmxSCjk2sxwTESKWCOzvIjgKW/vaJz8wwIz71SRkxnFqPaRyJy5zPWp4Ks
	 +mMlagtgplklobv+Ee7ueARHffzxix5mNuiZs/Nq26q6K+4+ZZK8eBjSpS/nPqwZso
	 bnKkvaywsyIVg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 09 Mar 2026 10:39:49 +0100
Subject: [PATCH] thunderbolt: nhi: Don't act on random stack values
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-topic-tbt_fixup-v1-1-c600d59f75a2@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7TtCKzL4SEVZr7UVFLQLp70nHY
 ZjJEDEQRhirDAFviuRsAVFXsJ3aHshoLwwNb3recsWS87SxtKbF0HN51nGJSstBdKaHUvmARfz
 HaX7fD1pe6JNhAAAA
X-Change-ID: 20260309-topic-tbt_fixup-407e9a7814f6
To: Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Raanan Avargil <raanan.avargil@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773049201; l=1423;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=QZDc4mV/8+IOvM40GhQ2kAk8umCceCaAK2g7N+kK8JU=;
 b=8F7JGDrJoZPG5jdr0oFT4lGJuGEutvBXlPbiQJoqsgHJP8M/akPYYrO9TtaGzwyeshqMeR1QE
 T3dj3cOA08+AJz4XEVyVEIHEyjdxmOHYRWjw8tICLonmr788NOkmTMN
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Queue-Id: 224332366E3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34271-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,intel.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.964];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,oss.qualcomm.com:mid]
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

device_property_read_foo() returns 0 on success and only then modifies
'val'. Currently, val is left uninitialized if the aforementioned
function returns non-zero, making nhi_wake_supported() return true
almost always (random != 0) if the property is not present in device
firmware.

Invert the check to make it make sense.

Note device_property_read_bool() would not be fitting here, as both
0 and (presumably) 1 seem to be acceptable values if the property is
present at all.

Fixes: 3cdb9446a117 ("thunderbolt: Add support for Intel Ice Lake")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/thunderbolt/nhi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index ccce020a2432..2bb2e79ca3cb 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1020,7 +1020,7 @@ static bool nhi_wake_supported(struct pci_dev *pdev)
 	 * If power rails are sustainable for wakeup from S4 this
 	 * property is set by the BIOS.
 	 */
-	if (device_property_read_u8(&pdev->dev, "WAKE_SUPPORTED", &val))
+	if (!device_property_read_u8(&pdev->dev, "WAKE_SUPPORTED", &val))
 		return !!val;
 
 	return true;

---
base-commit: fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d
change-id: 20260309-topic-tbt_fixup-407e9a7814f6

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


