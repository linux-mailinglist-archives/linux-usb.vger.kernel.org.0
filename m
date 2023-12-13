Return-Path: <linux-usb+bounces-4125-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 121B88119CC
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 17:43:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9EA18B21134
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 16:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D287D39FC8;
	Wed, 13 Dec 2023 16:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTqHvry3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B38F2FC42
	for <linux-usb@vger.kernel.org>; Wed, 13 Dec 2023 16:43:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54559C433C8;
	Wed, 13 Dec 2023 16:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702485783;
	bh=O6zPhvOuiRaMjZO2N7+0OTpsYUd4lm9ZY2n6Y+b+qeE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bTqHvry36GwQ2JC5GUEHK2OZj84VP8H5phOup1YRj0QFGrDNCoBXjQXSWGFMqTY0B
	 SQymbQsSGp50F/KU/lWWhLi0U2e0DNozV3AWJ+9d3fuAF91aquJHahP80iqWziuFju
	 hkjOv4iVYP70IxzU9YbZcmwbm8mTOTwYXC4MgQvLeq157b9PoYT2CGZyhNfAZnNZTO
	 V+RrnfSIDC2f9xXxwuE/mK1YOLsVPywIRokO1ioLrD+PmjQIsj8BJ+Dba2RrxVcJlG
	 CuGYuXQ832/9hEQcuiLgu/CmE8Wg9MoBvTeSZeBBADWWXAq10oQlK8ljIoBN9O7oC2
	 Q/UDcpIbS5EvQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	James Gruber <jimmyjgruber@gmail.com>,
	Yadwinder Singh <yadi.brar01@gmail.com>,
	Jaswinder Singh <jaswinder.singh@linaro.org>,
	Ruslan Bilovol <ruslan.bilovol@gmail.com>
Subject: [PATCH 03/12] usb: gadget: f_uac2: Replace snprintf() with the safer scnprintf() variant
Date: Wed, 13 Dec 2023 16:42:32 +0000
Message-ID: <20231213164246.1021885-4-lee@kernel.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231213164246.1021885-1-lee@kernel.org>
References: <20231213164246.1021885-1-lee@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a general misunderstanding amongst engineers that {v}snprintf()
returns the length of the data *actually* encoded into the destination
array.  However, as per the C99 standard {v}snprintf() really returns
the length of the data that *would have been* written if there were
enough space for it.  This misunderstanding has led to buffer-overruns
in the past.  It's generally considered safer to use the {v}scnprintf()
variants in their place (or even sprintf() in simple cases).  So let's
do that.

Link: https://lwn.net/Articles/69419/
Link: https://github.com/KSPP/linux/issues/105
Cc: James Gruber <jimmyjgruber@gmail.com>
Cc: Yadwinder Singh <yadi.brar01@gmail.com>
Cc: Jaswinder Singh <jaswinder.singh@linaro.org>
Cc: Ruslan Bilovol <ruslan.bilovol@gmail.com>
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/usb/gadget/function/f_uac2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index f9a0f07a7476b..383f6854cfec5 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -2045,7 +2045,7 @@ static ssize_t f_uac2_opts_##name##_show(struct config_item *item,	\
 	int result;							\
 									\
 	mutex_lock(&opts->lock);					\
-	result = snprintf(page, sizeof(opts->name), "%s", opts->name);	\
+	result = scnprintf(page, sizeof(opts->name), "%s", opts->name);	\
 	mutex_unlock(&opts->lock);					\
 									\
 	return result;							\
@@ -2063,7 +2063,7 @@ static ssize_t f_uac2_opts_##name##_store(struct config_item *item,	\
 		goto end;						\
 	}								\
 									\
-	ret = snprintf(opts->name, min(sizeof(opts->name), len),	\
+	ret = scnprintf(opts->name, min(sizeof(opts->name), len),	\
 			"%s", page);					\
 									\
 end:									\
@@ -2187,7 +2187,7 @@ static struct usb_function_instance *afunc_alloc_inst(void)
 	opts->req_number = UAC2_DEF_REQ_NUM;
 	opts->fb_max = FBACK_FAST_MAX;
 
-	snprintf(opts->function_name, sizeof(opts->function_name), "Source/Sink");
+	scnprintf(opts->function_name, sizeof(opts->function_name), "Source/Sink");
 
 	opts->p_terminal_type = UAC2_DEF_P_TERM_TYPE;
 	opts->c_terminal_type = UAC2_DEF_C_TERM_TYPE;
-- 
2.43.0.472.g3155946c3a-goog


