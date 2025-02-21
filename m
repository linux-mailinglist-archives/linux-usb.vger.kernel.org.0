Return-Path: <linux-usb+bounces-20910-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A5BA3EC44
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2025 06:43:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 751743AE217
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2025 05:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 341971FBE9B;
	Fri, 21 Feb 2025 05:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMlxYCfu"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD01B1FBCA9
	for <linux-usb@vger.kernel.org>; Fri, 21 Feb 2025 05:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740116511; cv=none; b=qedGwSHG1tobSEz1ORpp0Q52DEnt7o6aSVJXfuVwmrYN0YuXsWj/yYaHy0UjV+3QVkqGdgPbRUWTWOJ/FtISzMaBMG6CN4oqW7ZNU+WBPIim68YIksQR1TUL2XsCDCAOpTxhBChtJPaELnoIFB+eTNLzXJuIfuSmsH43hqNbjUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740116511; c=relaxed/simple;
	bh=2HVlOU4ErC2cL+ymoS6aaUZpLcNaTbzgkzKA3fytRaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b7QGrMnAbg312vSDwrzup20IG58JhTk4ovL0lNQHPg3Bx3skL+sqgIdIqlVhhx/2wGWnNLEiDNbtdXOuO9hcsn/NPBatKs2s0nZPmk6VIeHmr7tGg8T1lCXeFGbECUVlHtUSsYwtAjNBisJsAd+MXTQ6SJUB6DCtNDwifwP7VdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMlxYCfu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E623C4CEE6;
	Fri, 21 Feb 2025 05:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740116511;
	bh=2HVlOU4ErC2cL+ymoS6aaUZpLcNaTbzgkzKA3fytRaU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YMlxYCfuB+qlDsPl8geEckzenyFQZB+S/469JwRk/CetpDliS65Gk1LdmHe8TiOiR
	 xkErIxko6HE/I0GxEL8831gMihEdBAsWG+0WJ96WOlQOsIO0rMeuz1VaIz9Qb/E5Zt
	 EE9iVNtEFy/ByMT+Fw5l7QurMqz3Fw8oJkC31i5FGukBzOZZ2LQfovt3KaULRXDsZz
	 GDkBpB16ZsnBG6DJL0NW3gJ70J+mY6ZyovPjTnGAY3LpJxygQLOmV8uJb6Bfa+rfau
	 0LOTUcoH+XMZTGCXmUefpFpwH8A6YU655m6E2XVNsgJE3eRUdvSIK6FIagFdP5AMR/
	 wV00aTLCePgJg==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	ajayg@nvidia.com
Cc: linux-usb@vger.kernel.org
Subject: [PATCH 1/2] ucsi_ccg: Don't show failed to get FW build information error
Date: Thu, 20 Feb 2025 23:40:03 -0600
Message-ID: <20250221054137.1631765-2-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250221054137.1631765-1-superm1@kernel.org>
References: <20250221054137.1631765-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

The error `failed to get FW build information` is added for what looks
to be for misdetection of the device property firmware-name.

If the property is missing (such as on non-nvidia HW) this error shows up.
Move the error into the scope of the property parser for "firmware-name"
to avoid showing errors on systems without the firmware-name property.

Fixes: 5c9ae5a87573d ("usb: typec: ucsi: ccg: add firmware flashing support")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 740171f24ef9f..663aca9421410 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1432,11 +1432,10 @@ static int ucsi_ccg_probe(struct i2c_client *client)
 			uc->fw_build = CCG_FW_BUILD_NVIDIA_TEGRA;
 		else if (!strcmp(fw_name, "nvidia,gpu"))
 			uc->fw_build = CCG_FW_BUILD_NVIDIA;
+		if (!uc->fw_build)
+			dev_err(uc->dev, "failed to get FW build information\n");
 	}
 
-	if (!uc->fw_build)
-		dev_err(uc->dev, "failed to get FW build information\n");
-
 	/* reset ccg device and initialize ucsi */
 	status = ucsi_ccg_init(uc);
 	if (status < 0) {
-- 
2.43.0


