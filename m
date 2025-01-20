Return-Path: <linux-usb+bounces-19536-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3300FA16EB0
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2025 15:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E15D1888668
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2025 14:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B97311E379C;
	Mon, 20 Jan 2025 14:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="p36Qlqlw";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="RlDIbnTk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FBA1E377F;
	Mon, 20 Jan 2025 14:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737384187; cv=none; b=pec8vbP+NwT1MaQYa9A3H6JRcoJoJAulDnY7Du9qXqRjj9Jd8csq9ue9N+AMrTYQrg3f8ku8gxkJpO5jkCjmLWcRMqGZMEmmck0uHhBD8n00IA6DJ7DlkTyOu4yPxXDkDsffqx6zVKBNdx0Vs2UXsPkJzbmL511ivbs2Ng6KMdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737384187; c=relaxed/simple;
	bh=BL/3nHHkaltzuM8onsU0UP0YMECEyrNU44ATpUvLxN0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WWp/DYXfLt4LCfiMtCqD8zBayqe9Q5LWifr1lMZSWRGRmn94Sp7j+1ZBM2XCyGES8h2K4Z/zXrv8tgjWKLPbYJ7P8owSY6CIvp+lXyJEfldDI9DD9QYRVnkSafdLpa/y9rHGtPGPsfTxTCjyzed/nK8w3yUXCH38oKfMJc25AFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=p36Qlqlw; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=RlDIbnTk reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1737384183; x=1768920183;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4RcBRyPmLx2S3cj6rJULA+PzUdZ+QeLNlxsIg6JLYi4=;
  b=p36QlqlwOtilJzIsNdTXK3UkZc/G6/fdrseyk/Z5Ht3V2mjrvVsZU6VB
   JKU6nbiS3/EQM78I4h0iaYIQsCwkRgi+Ic0usBjciBLF574ZuCTEsze8R
   9ccyE9cZzYKp12bDIwCh6CsooUNdyulQQxYL4LF6GIfI9M4kRjAALeldK
   0FtzJaSHIdESVStHlHTiW2Q4WMzrk1PfzTwySxFFf6qzMtS2zvQZmXOsz
   YbjnEe+d0M1idCptqL4zEdrIA2hOE+mwI6bF9FwlF8HlOqIbe4OOKguBS
   S3IrocAHslhVzpT9geisc42T0DvsSnlkLlsch0xn5utgeHumQYIBkCcwg
   A==;
X-CSE-ConnectionGUID: cDrS+BQ1R6aA0SDzzNZE1w==
X-CSE-MsgGUID: U4XtvQSBRZih2K2oWzlpbA==
X-IronPort-AV: E=Sophos;i="6.13,219,1732575600"; 
   d="scan'208";a="41180112"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 20 Jan 2025 15:42:59 +0100
X-CheckPoint: {678E60F3-32-31397509-E321C4C4}
X-MAIL-CPID: 4EA9BE56B9C8C50BBF73605D2B595787_0
X-Control-Analysis: str=0001.0A682F15.678E60F3.0098,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0004F160A68;
	Mon, 20 Jan 2025 15:42:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1737384175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4RcBRyPmLx2S3cj6rJULA+PzUdZ+QeLNlxsIg6JLYi4=;
	b=RlDIbnTk1lKgaDJQwAWsCz+5N88GTTj2ocDzj9KjKdU9gzhyC+9KUcAop1Ivd3K2X8KrVZ
	Uu5I89tUXrMkaK9KL+Fn5HMV8aKjB92BPzoU8ebEfN5LCkRy8uauGAatY5MJ+WHbsai5kS
	AmtR6A6qI5C/kb42WLrVutMGgEzcqn1zmskkYVP7UqvRDn6rmn8iYJd2dQ+IC14LTnXD8J
	Ot4Hehh00kLGxCSjjvkOvk75ruTg0Jx2CYlWCq2+R+8gDNu+jOu8P4+ak0EOxrfv6BLp5Y
	mTuxRkzF0KCh0mdrRIoQPBStdsnPXLByNMZZgFIc+S5qSYv1v/FKnt594ZVwLw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>
Subject: [PATCH 1/1] usb: phy: generic: Use proper helper for property detection
Date: Mon, 20 Jan 2025 15:42:51 +0100
Message-Id: <20250120144251.580981-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Since commit c141ecc3cecd7 ("of: Warn when of_property_read_bool() is
used on non-boolean properties") a warning is raised if this function
is used for property detection. of_property_present() is the correct
helper for this.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
I opted for no Fixes tag as the warning is rather new.

 drivers/usb/phy/phy-generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/phy/phy-generic.c b/drivers/usb/phy/phy-generic.c
index 6c3ececf91375..8423be59ec0ff 100644
--- a/drivers/usb/phy/phy-generic.c
+++ b/drivers/usb/phy/phy-generic.c
@@ -212,7 +212,7 @@ int usb_phy_gen_create_phy(struct device *dev, struct usb_phy_generic *nop)
 		if (of_property_read_u32(node, "clock-frequency", &clk_rate))
 			clk_rate = 0;
 
-		needs_clk = of_property_read_bool(node, "clocks");
+		needs_clk = of_property_present(node, "clocks");
 	}
 	nop->gpiod_reset = devm_gpiod_get_optional(dev, "reset",
 						   GPIOD_ASIS);
-- 
2.34.1


