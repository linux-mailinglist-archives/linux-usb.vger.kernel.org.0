Return-Path: <linux-usb+bounces-31677-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C089CD6855
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 16:27:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3DAB30E09C1
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 15:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3851532BF26;
	Mon, 22 Dec 2025 15:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BE+1zEbA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64E33019DC;
	Mon, 22 Dec 2025 15:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766416957; cv=none; b=GOjueyK7v5CxHIdifaTKPTRFkkEfQzk/c7mAtlMfAw2hMTbvMgXyV7lD3x+PiSGN8E4P6Vg1O3O4rEhC5yPIsDA2v7IeL1vCC89qMSEtvuNU9KhkRB6lKPyFrwoHtMvYwhOGPVKrEa2l475XhqhFDJO2c5lLSLQm2O6JYkwtfZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766416957; c=relaxed/simple;
	bh=BYOZxKtwzn8tq/7+pNnZOekygMH6EFqHknG7LysDr3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M6oSstM2y9X/GU+RFBFUqCxjHJOrCjbkC2eKsW917jlCrNbyEcaKKkwPrTWoY8ptXmdMEBekn8pOne2FjM3m0zQcWlVXdpKXzWkH4uyqRRVmcLWi36XdNSt3aLeykeKXauGhQEHqUSTBOiUTD2SD33DghtUwcsIah1ySPebHj1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BE+1zEbA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57EABC19422;
	Mon, 22 Dec 2025 15:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766416957;
	bh=BYOZxKtwzn8tq/7+pNnZOekygMH6EFqHknG7LysDr3Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BE+1zEbAVC7itwHPP1ZZyZm7ftPr1+5pumKFj8bbYWsyv6Nnpfc08va9ucWQU0Dwq
	 yLPpuh1gQzGNnQ6gKlBCzw/KtqA28aXDIjJL0xC3O5b+BfH1uWph2GnPW/hD3S7Zr/
	 l9g0c+dPmQlJ6JvegCSfbRO1/9qVWh6FySnLkpmqj2E723WyJnLZ+pdaNFbcVkhBHH
	 WXwW/Fq2RcgyUW1SK1iQ3powIrnj/CbiPASGUiTfYnpFzaCEI/68Q5wJuC3aMFd35e
	 W0ew00Wz/mav0ZWS38QmqgnRYsczvyGWisNYxI/p3Y7zej5sk9UQiM0Pb1Xun706Lx
	 ampyXVsmJv7uw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vXhkB-000000000ke-0LcR;
	Mon, 22 Dec 2025 16:22:43 +0100
From: Johan Hovold <johan@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pooja Katiyar <pooja.katiyar@intel.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/4] Revert "usb: typec: ucsi: Add support for SET_PDOS command"
Date: Mon, 22 Dec 2025 16:22:01 +0100
Message-ID: <20251222152204.2846-2-johan@kernel.org>
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

This reverts commit 1b474ee01fbb73b1365adbf9b3067f7375e471ee.

The new buffer management code that this feature relies on is broken so
revert for now.

The interface for writing data and support for UCSI_SET_PDOS looks like
it could use some more thought as well.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/typec/ucsi/debugfs.c | 1 -
 drivers/usb/typec/ucsi/ucsi.h    | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
index 174f4d53b777..90d11b79d2c0 100644
--- a/drivers/usb/typec/ucsi/debugfs.c
+++ b/drivers/usb/typec/ucsi/debugfs.c
@@ -37,7 +37,6 @@ static int ucsi_cmd(void *data, u64 val)
 	case UCSI_SET_USB:
 	case UCSI_SET_POWER_LEVEL:
 	case UCSI_READ_POWER_LEVEL:
-	case UCSI_SET_PDOS:
 		ucsi->message_in_size = 0;
 		ret = ucsi_send_command(ucsi, val);
 		break;
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index f946b728c373..d01b796a8d23 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -137,7 +137,6 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 #define UCSI_GET_PD_MESSAGE			0x15
 #define UCSI_GET_CAM_CS			0x18
 #define UCSI_SET_SINK_PATH			0x1c
-#define UCSI_SET_PDOS				0x1d
 #define UCSI_READ_POWER_LEVEL			0x1e
 #define UCSI_SET_USB				0x21
 #define UCSI_GET_LPM_PPM_INFO			0x22
-- 
2.51.2


