Return-Path: <linux-usb+bounces-30276-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93057C469D3
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 13:32:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C54513BC876
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 12:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3EA13101C5;
	Mon, 10 Nov 2025 12:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dKrTrjkX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1DE30E831
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 12:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762777858; cv=none; b=qaM+OCNL0YBv569GgpB+HOHfR1A7PB7nmkK4J2Veh8KijqwEpFdZ/7tm6kzO9AO/EVYwA7BvYbKpZWcZ1VSW7wLrqoDnlWjPET7WJ/jWriGEp6NhDB/Po20pueKbJGlk6z4AVq7zC2wH0CZDe3MxeyCUNr4AHZzbrpLuroQA7BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762777858; c=relaxed/simple;
	bh=0wVK9aLYnfsy6jc8MIY0ZqTUn1Lc41/5fygsYWMsVSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=laLlDtfJuLGxmh8lrAdVH7W0Wh6ihMEh+QxM78esxy9FlCTnZlgjg4cMwwihEoGtkEs94A0RXjgHMFVJoBZm1EV1jnjwdBkbzrL5IQjm1Vo60+ssKWhi2krWRWsdvgF7cpryP+f4xxA0l9CWA9E0dOBdkZOyiQJtatoS7VHHxsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dKrTrjkX; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762777856; x=1794313856;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0wVK9aLYnfsy6jc8MIY0ZqTUn1Lc41/5fygsYWMsVSk=;
  b=dKrTrjkXPN+M72KzmH9rRnBHO116MQ/8JJGBkijuQ7Y7b2rstqCo/PSX
   iX3HvO+RTUdVrn13AA+M4i3gJ2CdtVOGLNYLvQ9kht353q+d0GToDzM65
   uSoer4U9IWSyePFhk8ENZ/2znWiaxLOyXt7WPgazYVcKaIEalsg8oTC0+
   edpw3jlqonVxTGxm/cGP8cFNr3Mquyk8m2PFghgKsPquCRcVR+oZNVHPq
   Upeh64LWzsSVf5UwoYyatlvMrJeLDQedtHW/GG+h844oetqIXFoMCqo8g
   3VCU5Vx7Ucor5wmtaUowe9JQHAYsoqP2YDLWJ4tOLuTlNIP9dFUAXeCBg
   g==;
X-CSE-ConnectionGUID: uGTF4njkRFqlwtEbdWEKMQ==
X-CSE-MsgGUID: JaR1zZ68SoyleSFJXY1kOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="82452486"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="82452486"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 04:30:55 -0800
X-CSE-ConnectionGUID: XXQGe8rhRnCaKoc/9BykfQ==
X-CSE-MsgGUID: S3CHKNO2R92jj9GD3WSuWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="225921454"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 10 Nov 2025 04:30:54 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id A4367A2; Mon, 10 Nov 2025 13:30:50 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Rene Sapiens <rene.sapiens@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 13/16] thunderbolt: Fix typos in tmu.c
Date: Mon, 10 Nov 2025 13:30:47 +0100
Message-ID: <20251110123050.3959188-14-mika.westerberg@linux.intel.com>
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

From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>

Fix typos in tmu.c. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/tmu.c b/drivers/thunderbolt/tmu.c
index b22831b41ec0..cf779874c675 100644
--- a/drivers/thunderbolt/tmu.c
+++ b/drivers/thunderbolt/tmu.c
@@ -400,10 +400,10 @@ static int tmu_mode_init(struct tb_switch *sw)
 
 /**
  * tb_switch_tmu_init() - Initialize switch TMU structures
- * @sw: Switch to initialized
+ * @sw: Switch to be initialized
  *
  * This function must be called before other TMU related functions to
- * makes the internal structures are filled in correctly. Does not
+ * make sure the internal structures are filled in correctly. Does not
  * change any hardware configuration.
  *
  * Return: %0 on success, negative errno otherwise.
-- 
2.50.1


