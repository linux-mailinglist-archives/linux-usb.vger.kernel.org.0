Return-Path: <linux-usb+bounces-31789-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CCFCE560E
	for <lists+linux-usb@lfdr.de>; Sun, 28 Dec 2025 20:07:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BAA33029BA0
	for <lists+linux-usb@lfdr.de>; Sun, 28 Dec 2025 19:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0894F241C8C;
	Sun, 28 Dec 2025 19:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Khh7vMpM"
X-Original-To: linux-usb@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F1978F26;
	Sun, 28 Dec 2025 19:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766948768; cv=none; b=TwahMJm1F+GIbmYdu3i43sxag6fgkpcNlB6b/hJ8FdMuTFopMwpURp+SNzAT+gwAF9Lha1b6ZvvyEd0pwPt3CGLY2jXXacxC/daN69DKxZX/TvIf+PSuxAMQDoT2y0EOvWu0VcRn116vklLquKyKK8yHnVH4MDoBsX/OSSMBGSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766948768; c=relaxed/simple;
	bh=QHv9dDSxEkxQ7UvwylCNMTLACfsOSnbId4paXX2x9jA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R2sZhUDBQI/0YvbzmbAj0rXMj2zEP+yokhNuaaoHpo/+5qrCrZSiiyq3e5EB2MgU1Bv43BJiV86f1PyGAyIFj1fh9qM6q2Y3R5rWyf6fNwIR4OcETnUw+aVPhigxgVfX0h6Pcf54Fz9ad8Q9HVe6e53hcgH5g8Hkw5ay1iB35dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Khh7vMpM; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Ac1BBFiapYKZgVuLiHTl6B+JMwpLsPHOkKoOyvgbSSo=; b=Khh7vMpMI6Lw3lzNi/ngGwK5Xt
	k+LV4LQTMUSkCDsJv3NjV1IbzzvQ/ngHiB56MszTMV+TPG2/FnYBeDNrraS/vLT5WcztcqMAUZ+Ky
	hDEEtRIYyPpm/NxYxjoRPgOzZsztj6EXFBrtoNyFaxj/QlXCA9hCZENukOLD+2o7zu/wvEUzPRHi5
	VvSJBANm6Pt9Sx+rVi+AVV+CAw0aN7fr/PGhYtlHnO46ZDMEuDhgPQyibIoNWSb1L9po/paNApHJm
	p96JXkTe9uW+jfhe/SDCENZunx5f8ber0UvFGltFrrX5iLktVZHb6CgMsGsquqKnqFsv/elzYx5HR
	32ZreYtA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZw5d-00000002y3k-2XUT;
	Sun, 28 Dec 2025 19:06:05 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Pavan Holla <pholla@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	chrome-platform@lists.linux.dev,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: drop an unused Kconfig symbol
Date: Sun, 28 Dec 2025 11:06:03 -0800
Message-ID: <20251228190604.2484082-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

EXTCON_TCSS_CROS_EC isn't used anywhere else in the kernel tree,
so drop it from this Kconfig file.

(unless it should be EXTCON_USBC_CROS_EC ?)

Fixes: f1a2241778d9 ("usb: typec: ucsi: Implement ChromeOS UCSI driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Pavan Holla <pholla@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Łukasz Bartosik <ukaszb@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jameson Thies <jthies@google.com>
Cc: Andrei Kuchynski <akuchynski@chromium.org>
Cc: chrome-platform@lists.linux.dev
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org

 drivers/usb/typec/ucsi/Kconfig |    1 -
 1 file changed, 1 deletion(-)

--- linux-next-20251219.orig/drivers/usb/typec/ucsi/Kconfig
+++ linux-next-20251219/drivers/usb/typec/ucsi/Kconfig
@@ -73,7 +73,6 @@ config CROS_EC_UCSI
 	tristate "UCSI Driver for ChromeOS EC"
 	depends on MFD_CROS_EC_DEV
 	depends on CROS_USBPD_NOTIFY
-	depends on !EXTCON_TCSS_CROS_EC
 	default MFD_CROS_EC_DEV
 	help
 	  This driver enables UCSI support for a ChromeOS EC. The EC is

