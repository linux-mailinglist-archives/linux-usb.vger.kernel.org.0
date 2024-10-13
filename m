Return-Path: <linux-usb+bounces-16142-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F204299B791
	for <lists+linux-usb@lfdr.de>; Sun, 13 Oct 2024 00:59:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3794D1C20D18
	for <lists+linux-usb@lfdr.de>; Sat, 12 Oct 2024 22:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95DC5154C0B;
	Sat, 12 Oct 2024 22:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ve17C5Oi"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050B32564
	for <linux-usb@vger.kernel.org>; Sat, 12 Oct 2024 22:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728773942; cv=none; b=BBGEMI5UuREKKU4TvYBVouwrZoYvVhZXx638jsVNZx1L06mmw1wDRCTzX1CVp0TyAhnvuefb29TzLFEjJNOYzMaX7RRXAxgg02mRIN0wSSpqhmrorR2R9juquBkpsz97JBB8iznFnVcqmd1e9U9GyjUSZcKsrDrQHTjOrPvUMGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728773942; c=relaxed/simple;
	bh=qYjgLiJtwNaOE0Nl5uF2eyuZI6vieu7PiwldPnB4wck=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hmvF8AGp446ca01ew31zp1Rc5aJLjWcOWPCpVPwhQaWaoYIaqOUyxONCPnQsCWdvzskHzYDbUU1rhTGVQM5hHesbvoBEyYq/bcNnIdbhUPIlESF04WLh4qKJbKyvg5zOVlnUNjlJvNsEQrb/eI5CQp288ujV0W0G6imAooASK+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ve17C5Oi; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1728773937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Xz4X6bkfTsHjDJovmZkAL4jbZL8CTDXnm+5NSji2oWM=;
	b=Ve17C5OiAca1UIx5VEnVA1jEo9AWNxc0a6G+PgUIPO8dbA2nAK2EjaUpT1tVW0myYGG+Hw
	jiRnPYxuoo14FOpMg7hn82nT4mGSUxa5zrJ8enV8AcDWtLdVDZkf73upmbptitKf/Ogd7X
	w/b+3S3LJaDFR3jyzMYXClKnXrR7v1U=
From: andrey.konovalov@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrey Konovalov <andreyknvl@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Felipe Balbi <balbi@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: usb: raw-gadget: add bug tracker link
Date: Sun, 13 Oct 2024 00:58:53 +0200
Message-Id: <20241012225853.118217-1-andrey.konovalov@linux.dev>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Andrey Konovalov <andreyknvl@gmail.com>

Add a link to the GitHub repository where Raw Gadget issues are managed.

Signed-off-by: Andrey Konovalov <andreyknvl@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7ad507f49324a..4a9535c9ba92e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24066,6 +24066,7 @@ USB RAW GADGET DRIVER
 R:	Andrey Konovalov <andreyknvl@gmail.com>
 L:	linux-usb@vger.kernel.org
 S:	Maintained
+B:	https://github.com/xairy/raw-gadget/issues
 F:	Documentation/usb/raw-gadget.rst
 F:	drivers/usb/gadget/legacy/raw_gadget.c
 F:	include/uapi/linux/usb/raw_gadget.h
-- 
2.25.1


