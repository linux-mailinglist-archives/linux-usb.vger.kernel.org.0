Return-Path: <linux-usb+bounces-17003-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 788429BAE8E
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 09:51:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA8EF1C20885
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 08:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7BCF1AAE2E;
	Mon,  4 Nov 2024 08:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JBUjx4h+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B1D1494B1
	for <linux-usb@vger.kernel.org>; Mon,  4 Nov 2024 08:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730710262; cv=none; b=WNs9A2Kb8Zs5ubEQqi7zPnkIdZRH7Tya6tNZ/eFC9s/jFdcn26pikGN9dal6AkwpY7bcjLZHqzq/1HaY0VgdzHOz6xVT/gdCFUP1SXLOOMNJAXGXTtUUmqft+DC3CfQxGZzz2D01vE0BVO+x5JToHDG2OPz9OCGWtkitkrv1ZDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730710262; c=relaxed/simple;
	bh=lwezjRJ5YhfZ0Utbiz8Yah0w9pO3zj389ko+3Egtvo0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=B6suN9gvBF8iOqgUF0m5VFR46AOdai4EStuDpgcoIwsE0gmFspRxoZIWSD2borOAwtjhwMm1zVX7znSbTDk3EZsYseyvQMDomtHknQH++rmAk/ZUhlGklkI5BH0DCefv9l8mz1sMySD9k7UMRu2/8pEYS9PzT46PbDVbN4Yy9CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JBUjx4h+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730710261; x=1762246261;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lwezjRJ5YhfZ0Utbiz8Yah0w9pO3zj389ko+3Egtvo0=;
  b=JBUjx4h+O1W6up3SfPHiWdilNktT1AnH0rvF2nxbzwNhjSfDrSMgDgy0
   ib6Efov6hgjIiU4cTZY8kvMMA6LLL8VeC5f9/4bAMLbTkI0/FCXLd9DFb
   g9/T4fEk3LHjIsR871Ow4s5W2luBjHj3z635SgLxNwhhskLGD2AvVDKdO
   0OBmET3oLktxqYpakZDJ91xWgdPvpexOAV80dFuCZXmjYrMsWqwZxMDWM
   wh7HNA1KXIXHY/V/pYDbV5yMpR32PqBcEePyNY0AKjoL5N0F6M8mlBxuU
   BDX4MVhDaHQcMMIaJFlssBirOXPv2B8jZQ1ESP8s65ALFI6oWFH/em74s
   Q==;
X-CSE-ConnectionGUID: JT72vB3LS8OcgSCW09OKAA==
X-CSE-MsgGUID: ezd4XC9kTsOL272eib/GNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30343056"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30343056"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 00:51:00 -0800
X-CSE-ConnectionGUID: AVPHH+ZNS2qiOgDtdqPYKA==
X-CSE-MsgGUID: vBatJu8cQaOiSMags04dHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="88097792"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.97.183])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 00:50:59 -0800
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Wentong Wu <wentong.wu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH 1/3] usb: misc: ljca: move usb_autopm_put_interface() after wait for response
Date: Mon,  4 Nov 2024 09:50:54 +0100
Message-Id: <20241104085056.652294-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not mark interface as ready to suspend when we are still waiting
for response messages from the device.

Fixes: acd6199f195d ("usb: Add support for Intel LJCA device")
Cc: stable@vger.kernel.org
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/usb/misc/usb-ljca.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
index 01ceafc4ab78..dcb3c5d248ac 100644
--- a/drivers/usb/misc/usb-ljca.c
+++ b/drivers/usb/misc/usb-ljca.c
@@ -332,9 +332,6 @@ static int ljca_send(struct ljca_adapter *adap, u8 type, u8 cmd,
 
 	ret = usb_bulk_msg(adap->usb_dev, adap->tx_pipe, header,
 			   msg_len, &transferred, LJCA_WRITE_TIMEOUT_MS);
-
-	usb_autopm_put_interface(adap->intf);
-
 	if (ret < 0)
 		goto out;
 	if (transferred != msg_len) {
@@ -353,6 +350,8 @@ static int ljca_send(struct ljca_adapter *adap, u8 type, u8 cmd,
 	ret = adap->actual_length;
 
 out:
+	usb_autopm_put_interface(adap->intf);
+
 	spin_lock_irqsave(&adap->lock, flags);
 	adap->ex_buf = NULL;
 	adap->ex_buf_len = 0;
-- 
2.34.1


