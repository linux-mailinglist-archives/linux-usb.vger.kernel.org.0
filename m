Return-Path: <linux-usb+bounces-4126-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4C58119CE
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 17:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B59D21C21165
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 16:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C06539FFE;
	Wed, 13 Dec 2023 16:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gykg4kIB"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F69C2FC42
	for <linux-usb@vger.kernel.org>; Wed, 13 Dec 2023 16:43:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DDE1C433C7;
	Wed, 13 Dec 2023 16:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702485785;
	bh=iLYjIbUlVCLTe0kMorEK0VE5bRrv64V6utYWmUc7b34=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gykg4kIB0fJzVUy7m3W/GPqLEYkG+uUFedlst3B6F+OV8ZdO3lVqs7eJpYz7fLtaz
	 G/PZ7imQUxBO1VJ0b1NQApfsPHV0rWqwI/JsbEcVI+6JjbBhi4M2/9yIeTPOcvvzpG
	 Thx+2ud4DU3x7X6U2hxwf0ISktRgf7pkKHQMQnt7HCWlyAAmneXrFyQA8Fb0VnEx+p
	 hnS0cJRhQ+abCt4i2dAhQMhuMTGdlm94dA5ZScOQNDX7J/Dm3belaMi5lvhkEeHzfa
	 kWQf7LbFACW14jelerfw9Hl3O6YA4UbwmfnOi/9HQFIp+bSB3IzyoNQ9TS4MERp7X+
	 tI1w4j7iumgrw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Subject: [PATCH 04/12] usb: gadget: uvc: Replace snprintf() with the safer scnprintf() variant
Date: Wed, 13 Dec 2023 16:42:33 +0000
Message-ID: <20231213164246.1021885-5-lee@kernel.org>
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>
Cc: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/usb/gadget/function/uvc_configfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 9bf0e985acfab..7e704b2bcfd1c 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -3414,7 +3414,7 @@ static ssize_t f_uvc_opts_string_##cname##_show(struct config_item *item,\
 	int result;							\
 									\
 	mutex_lock(&opts->lock);					\
-	result = snprintf(page, sizeof(opts->aname), "%s", opts->aname);\
+	result = scnprintf(page, sizeof(opts->aname), "%s", opts->aname);\
 	mutex_unlock(&opts->lock);					\
 									\
 	return result;							\
-- 
2.43.0.472.g3155946c3a-goog


