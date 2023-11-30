Return-Path: <linux-usb+bounces-3492-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFF47FED63
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 11:55:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11A75B2116E
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 10:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A989A3B285;
	Thu, 30 Nov 2023 10:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/7ElH+x"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C82249EC
	for <linux-usb@vger.kernel.org>; Thu, 30 Nov 2023 10:55:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A841AC433CA;
	Thu, 30 Nov 2023 10:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701341718;
	bh=/XOh9djbd1kRjRIJaFEo79gsQogKZILFqya3ZNX3dzE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M/7ElH+xTwmRE/jQTEQPLVFtUUURsQO7RbtCR9vxOg5H7Gx4ArBGSB9MkUmH5CF5E
	 szynq61yJlRo4ltLpVSCDAMrZQiXgH3j9/qyA5woBqJqjsVy/uNlp5VKKajiNyCKMZ
	 PmuSoGJGgyI611UCzIabzZySOnX+87zpCgULh+zKjXnF2nIZ/BvI58pKkaOUWM8ick
	 mvUGbVqUhRs7VMauF6ygzEG+4Evd0+RI9YYZKy8aEaVn6ng2JizzUyalZjjxkT5LYG
	 ylBtp51MF9qOLB6skfhw2WPf5GU7v6YFGgPJTTiemGSiESLpG1GExPLuPpuFzsZXvR
	 FQ7MWMmPFKteQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH 4/5] usb: gadget: Remove snprintf() from sysfs call-backs and replace with sysfs_emit()
Date: Thu, 30 Nov 2023 10:54:38 +0000
Message-ID: <20231130105459.3208986-5-lee@kernel.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231130105459.3208986-1-lee@kernel.org>
References: <20231130105459.3208986-1-lee@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since snprintf() has the documented, but still rather strange trait of
returning the length of the data that *would have been* written to the
array if space were available, rather than the arguably more useful
length of data *actually* written, it is usually considered wise to use
something else instead in order to avoid confusion.

In the case of sysfs call-backs, new wrappers exist that do just that.

This patch replaces just one use of snprintf() found in the sysfs
.show() call-back with the new sysfs_emit() helper.

Link: https://lwn.net/Articles/69419/
Link: https://github.com/KSPP/linux/issues/105
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/usb/gadget/configfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index 4c639e9ddedc0..b7d2a1313a684 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -812,7 +812,7 @@ static ssize_t gadget_string_s_show(struct config_item *item, char *page)
 	struct gadget_string *string = to_gadget_string(item);
 	int ret;
 
-	ret = snprintf(page, sizeof(string->string), "%s\n", string->string);
+	ret = sysfs_emit(page, "%s\n", string->string);
 	return ret;
 }
 
-- 
2.43.0.rc1.413.gea7ed67945-goog


