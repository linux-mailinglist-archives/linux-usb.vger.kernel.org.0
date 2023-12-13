Return-Path: <linux-usb+bounces-4124-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEA08119C9
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 17:43:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A17801C211C1
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 16:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF8339FCF;
	Wed, 13 Dec 2023 16:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oAG9v5+t"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED3535F1A
	for <linux-usb@vger.kernel.org>; Wed, 13 Dec 2023 16:43:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 544A4C433CA;
	Wed, 13 Dec 2023 16:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702485780;
	bh=KSAg8fBYTK/g8UcM2sFdqwu8/yDHIW+WrzcjHTdiJFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oAG9v5+tPvaDHtFMQw+V4isvoCeKyHr0+26UlNATao/l4R2pCjfcNwXwwxBi+9rMI
	 rT9pWiqzv1QXzOuGBrRe77E3PB2kdxSIdycKipspgwuoaSIkZakjZ1oLcowdUab0Ex
	 eYiLRyq1hwbTDL/oC55Mb9NYFcUkfwtmDq0uYb1akYQmugbBJwGfd9ExClKgns9JsB
	 su/WftgG+nDCIMTf+vs9MYqVA1VIjFG/bwbMbldosdZvqIt7/ZGJhKlthn9dbGBnn5
	 WeOwx9Tc8B+3fu5LhgvX5xxs5azFwI29T3ovol7yOpAQobyetzTEbB9ZvOfVIanxi/
	 o3akhp8l1F81Q==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Ruslan Bilovol <ruslan.bilovol@gmail.com>,
	Julian Scheel <julian@jusst.de>,
	Bryan Wu <cooloney@kernel.org>
Subject: [PATCH 02/12] usb: gadget: f_uac1: Replace snprintf() with the safer scnprintf() variant
Date: Wed, 13 Dec 2023 16:42:31 +0000
Message-ID: <20231213164246.1021885-3-lee@kernel.org>
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
Cc: Ruslan Bilovol <ruslan.bilovol@gmail.com>
Cc: Julian Scheel <julian@jusst.de>
Cc: Bryan Wu <cooloney@kernel.org>
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/usb/gadget/function/f_uac1.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/function/f_uac1.c
index 6f0e1d803dc24..998e2331effb0 100644
--- a/drivers/usb/gadget/function/f_uac1.c
+++ b/drivers/usb/gadget/function/f_uac1.c
@@ -1561,7 +1561,7 @@ static ssize_t f_uac1_opts_##name##_show(struct config_item *item,	\
 	int result;							\
 									\
 	mutex_lock(&opts->lock);					\
-	result = snprintf(page, sizeof(opts->name), "%s", opts->name);	\
+	result = scnprintf(page, sizeof(opts->name), "%s", opts->name);	\
 	mutex_unlock(&opts->lock);					\
 									\
 	return result;							\
@@ -1579,7 +1579,7 @@ static ssize_t f_uac1_opts_##name##_store(struct config_item *item,	\
 		goto end;						\
 	}								\
 									\
-	ret = snprintf(opts->name, min(sizeof(opts->name), len),	\
+	ret = scnprintf(opts->name, min(sizeof(opts->name), len),	\
 			"%s", page);					\
 									\
 end:									\
@@ -1685,7 +1685,7 @@ static struct usb_function_instance *f_audio_alloc_inst(void)
 
 	opts->req_number = UAC1_DEF_REQ_NUM;
 
-	snprintf(opts->function_name, sizeof(opts->function_name), "AC Interface");
+	scnprintf(opts->function_name, sizeof(opts->function_name), "AC Interface");
 
 	return &opts->func_inst;
 }
-- 
2.43.0.472.g3155946c3a-goog


