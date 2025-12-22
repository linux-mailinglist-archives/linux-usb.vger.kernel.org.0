Return-Path: <linux-usb+bounces-31674-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61226CD6850
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 16:27:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F03A730DDA33
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 15:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32ACC32B9B7;
	Mon, 22 Dec 2025 15:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ogZ0SAcu"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29D81552FD;
	Mon, 22 Dec 2025 15:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766416957; cv=none; b=UCEWt4VwZIfRXNgqI2cpphNMm3UnyP/z7YNJ6xSgXEKMiy6Vm4h65JZGVkJGmCozvrGy9TGl+eL76/HDsQLLALC/CwG45ZbPDoDq2GToQWkGQrEfVN2IeIi4p8oUZx0v+svLU30TwKIU2aI6BOvafe2COvKAuZRK95+4LNJuRas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766416957; c=relaxed/simple;
	bh=sx4ZyLVlfbetPUZ01uO6CAVbKuh1fwPJpAg4fclxPCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=grhAcxFW+nujYalWJ8qrYrn0CJ1Qpja7yqjPW/r0e3v6CwSNbL+ViWXDPGWMUliJYaUHQ/fTDEepGezQSoq+6xFPXWS2xauwcLGdjJ7g5uTd+wPsNf670kY87Qp1kv7zyq79F8A4QMbb0hLLzvExM1kAkwLpsy+WuuXIdhf4pNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ogZ0SAcu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ECF7C2BC86;
	Mon, 22 Dec 2025 15:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766416957;
	bh=sx4ZyLVlfbetPUZ01uO6CAVbKuh1fwPJpAg4fclxPCQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ogZ0SAcuqcnbT5JCF0ubSaFp/mSRq0Aa7sYXvTsBwmSzfHwI3jIYVFb2jenK6Deot
	 SaGLC2HSPm26pYM0pBKfo/Geg0tgyQrnpPR9ZtlhYnWDXMTNvCA3mLyelc9g4xhpAm
	 CFr2OZaRMZKgBYVgvhB6WCAMU2NKjBXOEatGJyTgEyOqyGirDbLvgRMIOphX+OLt3k
	 qaYV8TEmqnR3drNVTCZohKhJq5dK0x1Xps0ZGwmKMN7EbaRIOMT5UVAEmOCAN6DtKs
	 mVccFQfdMgP8F3FDBMJK8xUdcLsuLvwTcZYy2y+rrCFpQyhyQHpjp+g3b3QYAww0qE
	 ejxT39y920fww==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vXhkB-000000000kj-14hl;
	Mon, 22 Dec 2025 16:22:43 +0100
From: Johan Hovold <johan@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pooja Katiyar <pooja.katiyar@intel.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 3/4] Revert "usb: typec: ucsi: Add support for message out data structure"
Date: Mon, 22 Dec 2025 16:22:03 +0100
Message-ID: <20251222152204.2846-4-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251222152204.2846-1-johan@kernel.org>
References: <20251222152204.2846-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit db0028637cc832add6d87564fcc2ebb12781b046.

The new buffer management code that this feature relies on is broken so
revert for now.

As for the in buffer, nothing prevents the out message size and buffer
from being modified while the message is being processed due to lack of
serialisation.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/typec/ucsi/ucsi.c      | 14 --------------
 drivers/usb/typec/ucsi/ucsi.h      |  2 --
 drivers/usb/typec/ucsi/ucsi_acpi.c | 16 ----------------
 3 files changed, 32 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 9b3df776137a..819540713150 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -67,20 +67,6 @@ int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci)
 
 	reinit_completion(&ucsi->complete);
 
-	if (ucsi->message_out_size > 0) {
-		if (!ucsi->ops->write_message_out) {
-			ucsi->message_out_size = 0;
-			ret = -EOPNOTSUPP;
-			goto out_clear_bit;
-		}
-
-		ret = ucsi->ops->write_message_out(ucsi, ucsi->message_out,
-						   ucsi->message_out_size);
-		ucsi->message_out_size = 0;
-		if (ret)
-			goto out_clear_bit;
-	}
-
 	ret = ucsi->ops->async_control(ucsi, command);
 	if (ret)
 		goto out_clear_bit;
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index d01b796a8d23..479bf1f69c72 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -69,7 +69,6 @@ struct dentry;
  * @read_cci: Read CCI register
  * @poll_cci: Read CCI register while polling with notifications disabled
  * @read_message_in: Read message data from UCSI
- * @write_message_out: Write message data to UCSI
  * @sync_control: Blocking control operation
  * @async_control: Non-blocking control operation
  * @update_altmodes: Squashes duplicate DP altmodes
@@ -85,7 +84,6 @@ struct ucsi_operations {
 	int (*read_cci)(struct ucsi *ucsi, u32 *cci);
 	int (*poll_cci)(struct ucsi *ucsi, u32 *cci);
 	int (*read_message_in)(struct ucsi *ucsi, void *val, size_t val_len);
-	int (*write_message_out)(struct ucsi *ucsi, void *data, size_t data_len);
 	int (*sync_control)(struct ucsi *ucsi, u64 command, u32 *cci);
 	int (*async_control)(struct ucsi *ucsi, u64 command);
 	bool (*update_altmodes)(struct ucsi *ucsi, u8 recipient,
diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index f9beeb835238..f1d1f6917b09 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -86,21 +86,6 @@ static int ucsi_acpi_read_message_in(struct ucsi *ucsi, void *val, size_t val_le
 	return 0;
 }
 
-static int ucsi_acpi_write_message_out(struct ucsi *ucsi, void *data, size_t data_len)
-{
-	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
-
-	if (!data || !data_len)
-		return -EINVAL;
-
-	if (ucsi->version <= UCSI_VERSION_1_2)
-		memcpy(ua->base + UCSI_MESSAGE_OUT, data, data_len);
-	else
-		memcpy(ua->base + UCSIv2_MESSAGE_OUT, data, data_len);
-
-	return 0;
-}
-
 static int ucsi_acpi_async_control(struct ucsi *ucsi, u64 command)
 {
 	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
@@ -116,7 +101,6 @@ static const struct ucsi_operations ucsi_acpi_ops = {
 	.read_cci = ucsi_acpi_read_cci,
 	.poll_cci = ucsi_acpi_poll_cci,
 	.read_message_in = ucsi_acpi_read_message_in,
-	.write_message_out = ucsi_acpi_write_message_out,
 	.sync_control = ucsi_sync_control_common,
 	.async_control = ucsi_acpi_async_control
 };
-- 
2.51.2


