Return-Path: <linux-usb+bounces-30266-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23885C46994
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 13:31:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1CE41885042
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 12:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03A430E858;
	Mon, 10 Nov 2025 12:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AgYNdrJU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451202FFDCB
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 12:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762777856; cv=none; b=EIs4Qc/9dGtbYW18swiCMA9xx8zHZqsKK/mMutwdpV+7BNuNr2oJ/w3OhfQDlJ67jMBWOn7dFNB0+lDpeJQTQ4DxvGyqcfUeV6dKjm6W55/Qxe50Ej6o16C2ddHiBX30Q5XuQbbFDE1IxBbKqUfuk0QYdIrFncq065nTNcda+ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762777856; c=relaxed/simple;
	bh=e/MaodFAd+1T+iMOb7oNY4+ioVwx+S22FptffRfgYco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gDTspMXwYRBPN6VwSxaPcI6WaNbZ7LhctuePOQ1kVBR+ctkT1WMLHjsJAOo5AwaHAve6eJ4RVANCti0ZvWm0fA6NVLz5Wn+uu38hXkZoHQGjsBbvweGHv/eMH0fl1ZLCP0BIydlWC9xOyfSbDHhyiJ3DLtR6ORnphSXzFdr5t3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AgYNdrJU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762777854; x=1794313854;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e/MaodFAd+1T+iMOb7oNY4+ioVwx+S22FptffRfgYco=;
  b=AgYNdrJUxqbKbEmP/khLQalJn7U8QwMPEUsG49b3DqgKDq/rGyx/FxbV
   1YvniWaMe/y4ulYSANUP2c4Q6/5CBt4nkN1c9XQbnBzFjo1aM9OH62dTp
   wCUGKhnmcN8m6NPV9zW0DP/Jp7TuzVjngF4lL5iVcveJ6EEVMpFFvDYgx
   eQ1RYT5Ma9jE1mOVj9tKj8pZmN6NvTGOEg2NpI+4yYnyMkeUKCitVD1Fi
   7nxIydjbnzYWT7hw+Ohc4GSN0Cmj0WI/mhIr2oqxXby2Ju5jYmwa3POey
   llp9/nFiR50R13vUmnfpBqeqXkXPt4YtCLHtLUacxQRR3ggP2NKkmipm8
   w==;
X-CSE-ConnectionGUID: 9osUOyyWSHyrDS5r0GqC0A==
X-CSE-MsgGUID: TssItqY+TVKh+/rcoRuEHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75931556"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="75931556"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 04:30:53 -0800
X-CSE-ConnectionGUID: FDvVglrGT22CQCBAXKtoRQ==
X-CSE-MsgGUID: yYa0YqZtS5qoS0NVnBe3jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="188826822"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 10 Nov 2025 04:30:51 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 875FD99; Mon, 10 Nov 2025 13:30:50 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Rene Sapiens <rene.sapiens@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 04/16] thunderbolt: Fix typos in eeprom.c
Date: Mon, 10 Nov 2025 13:30:38 +0100
Message-ID: <20251110123050.3959188-5-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251110123050.3959188-1-mika.westerberg@linux.intel.com>
References: <20251110123050.3959188-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rene Sapiens <rene.sapiens@intel.com>

Fix typos in eeprom.c. No functional changes.

Signed-off-by: Rene Sapiens <rene.sapiens@intel.com>
Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/eeprom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/eeprom.c b/drivers/thunderbolt/eeprom.c
index 1af65fece495..5477b9437048 100644
--- a/drivers/thunderbolt/eeprom.c
+++ b/drivers/thunderbolt/eeprom.c
@@ -21,7 +21,7 @@ static int tb_eeprom_ctl_write(struct tb_switch *sw, struct tb_eeprom_ctl *ctl)
 }
 
 /*
- * tb_eeprom_ctl_write() - read control word
+ * tb_eeprom_ctl_read() - read control word
  */
 static int tb_eeprom_ctl_read(struct tb_switch *sw, struct tb_eeprom_ctl *ctl)
 {
-- 
2.50.1


