Return-Path: <linux-usb+bounces-3493-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A05B7FED64
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 11:55:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAA68280C2C
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 10:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA713C095;
	Thu, 30 Nov 2023 10:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lp7SZy0N"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1FF249EC
	for <linux-usb@vger.kernel.org>; Thu, 30 Nov 2023 10:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 218E9C433CB;
	Thu, 30 Nov 2023 10:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701341720;
	bh=EqaFNvqa3Yaf2e/v2zXcPa+NF9mRVVDkSa+wDJv0Wc8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lp7SZy0NUGDmnnSAUp1ak9WDeEeL2H3QZaY62S6szF6Uimt0rETKvW06GDU2UMBqQ
	 PFL/Wh7mo6eDkzK+rlw0+VmJVokekplOWxPD1oSyUuIW989CUreK3vlsl+BBCT6UbD
	 uakMX3Sbkyo4F04JXRzAmTVsKSgKDPaRBj0oYqCEFDPXNpNzXUQIwlMcnAtrihM/rM
	 cPdP1c/uDBJHA2H0raR/lSYh01PlIFlAw71455l9Ux6r+GSDsl3wAVCHZ5foajhuvG
	 5aztBRabH35wVkn7sIFZ337MmNW9zM9JmeqqXWEsH2RapDKT9V8RETIbMUvHYZUt2D
	 kkwP4OiYy0/KA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Dmitry Bogdanov <d.bogdanov@yadro.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH 5/5] usb: gadget: f_tcm: Remove snprintf() from sysfs call-backs and replace with sysfs_emit()
Date: Thu, 30 Nov 2023 10:54:39 +0000
Message-ID: <20231130105459.3208986-6-lee@kernel.org>
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
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Dmitry Bogdanov <d.bogdanov@yadro.com>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/usb/gadget/function/f_tcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index ff33f31bcdf64..37befd6db001a 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -1504,8 +1504,8 @@ static ssize_t tcm_usbg_tpg_nexus_show(struct config_item *item, char *page)
 		ret = -ENODEV;
 		goto out;
 	}
-	ret = snprintf(page, PAGE_SIZE, "%s\n",
-			tv_nexus->tvn_se_sess->se_node_acl->initiatorname);
+	ret = sysfs_emit(page, "%s\n",
+			 tv_nexus->tvn_se_sess->se_node_acl->initiatorname);
 out:
 	mutex_unlock(&tpg->tpg_mutex);
 	return ret;
-- 
2.43.0.rc1.413.gea7ed67945-goog


