Return-Path: <linux-usb+bounces-3790-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07088807754
	for <lists+linux-usb@lfdr.de>; Wed,  6 Dec 2023 19:13:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B31A1C20AE9
	for <lists+linux-usb@lfdr.de>; Wed,  6 Dec 2023 18:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF796E59D;
	Wed,  6 Dec 2023 18:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hf0lLEXc"
X-Original-To: linux-usb@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB364122;
	Wed,  6 Dec 2023 10:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=I7ZFNkd8uHu9jhtoI/cVBVcr54rjvXscjk5fCGNHaqA=; b=hf0lLEXcVio6BQEPxuc2mIYkj6
	YhUjh+92ppTS/VIHbb83RYdnbipVQb6Ctt5l174DoqN2KBHJHvclLkxWcqjb+BMDM/maQGS1oVDst
	XeQaethSYjoVukrtTdDjIxtCRE3PUZep/aVerG4tsS0PmI+3FfP5ZvXgW+G7MyWLyp7+WuoO/bulE
	jnzZIOUSkiyUMRHbGz2yE9TqUjmuFUZ+SFnFCREyJGNkh122Rzjg8mE98PXQzJ2EIeYBtv0xYIV6V
	+G+RZf7SDzxPYr988LJtiAWMvcUWpCC/lwHZQ/wQyLCTRY8YSRJekjAtPGMki09wzr2mF1NpBeqwo
	2mi2FdHQ==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rAwOc-00B0ny-1I;
	Wed, 06 Dec 2023 18:13:18 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Minda Chen <minda.chen@starfivetech.com>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: cdns3: starfive: don't misuse /** comment
Date: Wed,  6 Dec 2023 10:13:17 -0800
Message-ID: <20231206181317.27515-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a common C comment "/*" instead of "/**" to prevent a warning
from scripts/kernel-doc.

cdns3-starfive.c:23: warning: expecting prototype for cdns3(). Prototype was for USB_STRAP_HOST() instead

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Minda Chen <minda.chen@starfivetech.com>
Cc: Peter Chen <peter.chen@kernel.org>
Cc: Pawel Laszczak <pawell@cadence.com>
Cc: Roger Quadros <rogerq@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
---
 drivers/usb/cdns3/cdns3-starfive.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -- a/drivers/usb/cdns3/cdns3-starfive.c b/drivers/usb/cdns3/cdns3-starfive.c
--- a/drivers/usb/cdns3/cdns3-starfive.c
+++ b/drivers/usb/cdns3/cdns3-starfive.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * cdns3-starfive.c - StarFive specific Glue layer for Cadence USB Controller
  *
  * Copyright (C) 2023 StarFive Technology Co., Ltd.

