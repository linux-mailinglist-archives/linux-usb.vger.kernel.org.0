Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70FDE370C3A
	for <lists+linux-usb@lfdr.de>; Sun,  2 May 2021 16:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232695AbhEBOFi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 2 May 2021 10:05:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:50820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232837AbhEBOFW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 2 May 2021 10:05:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E5713613EC;
        Sun,  2 May 2021 14:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619964270;
        bh=4lQy9e8dkXC93bot0YqUtqhnEIMxfdIuRsAE80tMiwo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Oauxue0c6NwS0UXWHIbq9+HpLBQo6eNrFXDyL/606hzXAq7EGuYGL9smx0YDXWkEV
         yjzOdwAOPjiAb434RE9bjiQLAQKdWwJjBIDZeRLIS6j85CLFD5yoFjw/6LgEmkGHgq
         1E30/t5AJWi4GpMcWnLqxjgerNSpNMkBm62JVN7pfoXKEIVpE3Mo7SnoHiajt3busp
         gORhbQRop8xJNC2R/zEW3iOPFwFYWdiFqbyh38aaDHH4oXbLj5AaE6UZeeHV1dgG5u
         cvs45e9fgFKfkL7BW1mkUMNAbJKz+hDisLBvu//80UCyWF3cGlbU7rRJmF6rbTxbhZ
         aaoC+T4ds0hPQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 15/66] usb: gadget: f_uac1: validate input parameters
Date:   Sun,  2 May 2021 10:03:20 -0400
Message-Id: <20210502140411.2719301-15-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210502140411.2719301-1-sashal@kernel.org>
References: <20210502140411.2719301-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Ruslan Bilovol <ruslan.bilovol@gmail.com>

[ Upstream commit a59c68a6a3d1b18e2494f526eb19893a34fa6ec6 ]

Currently user can configure UAC1 function with
parameters that violate UAC1 spec or are not supported
by UAC1 gadget implementation.

This can lead to incorrect behavior if such gadget
is connected to the host - like enumeration failure
or other issues depending on host's UAC1 driver
implementation, bringing user to a long hours
of debugging the issue.

Instead of silently accept these parameters, throw
an error if they are not valid.

Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
Link: https://lore.kernel.org/r/1614599375-8803-5-git-send-email-ruslan.bilovol@gmail.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/gadget/function/f_uac1.c | 43 ++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/function/f_uac1.c
index 560382e0a8f3..e65f474ad7b3 100644
--- a/drivers/usb/gadget/function/f_uac1.c
+++ b/drivers/usb/gadget/function/f_uac1.c
@@ -19,6 +19,9 @@
 #include "u_audio.h"
 #include "u_uac1.h"
 
+/* UAC1 spec: 3.7.2.3 Audio Channel Cluster Format */
+#define UAC1_CHANNEL_MASK 0x0FFF
+
 struct f_uac1 {
 	struct g_audio g_audio;
 	u8 ac_intf, as_in_intf, as_out_intf;
@@ -30,6 +33,11 @@ static inline struct f_uac1 *func_to_uac1(struct usb_function *f)
 	return container_of(f, struct f_uac1, g_audio.func);
 }
 
+static inline struct f_uac1_opts *g_audio_to_uac1_opts(struct g_audio *audio)
+{
+	return container_of(audio->func.fi, struct f_uac1_opts, func_inst);
+}
+
 /*
  * DESCRIPTORS ... most are static, but strings and full
  * configuration descriptors are built on demand.
@@ -505,11 +513,42 @@ static void f_audio_disable(struct usb_function *f)
 
 /*-------------------------------------------------------------------------*/
 
+static int f_audio_validate_opts(struct g_audio *audio, struct device *dev)
+{
+	struct f_uac1_opts *opts = g_audio_to_uac1_opts(audio);
+
+	if (!opts->p_chmask && !opts->c_chmask) {
+		dev_err(dev, "Error: no playback and capture channels\n");
+		return -EINVAL;
+	} else if (opts->p_chmask & ~UAC1_CHANNEL_MASK) {
+		dev_err(dev, "Error: unsupported playback channels mask\n");
+		return -EINVAL;
+	} else if (opts->c_chmask & ~UAC1_CHANNEL_MASK) {
+		dev_err(dev, "Error: unsupported capture channels mask\n");
+		return -EINVAL;
+	} else if ((opts->p_ssize < 1) || (opts->p_ssize > 4)) {
+		dev_err(dev, "Error: incorrect playback sample size\n");
+		return -EINVAL;
+	} else if ((opts->c_ssize < 1) || (opts->c_ssize > 4)) {
+		dev_err(dev, "Error: incorrect capture sample size\n");
+		return -EINVAL;
+	} else if (!opts->p_srate) {
+		dev_err(dev, "Error: incorrect playback sampling rate\n");
+		return -EINVAL;
+	} else if (!opts->c_srate) {
+		dev_err(dev, "Error: incorrect capture sampling rate\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 /* audio function driver setup/binding */
 static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 {
 	struct usb_composite_dev	*cdev = c->cdev;
 	struct usb_gadget		*gadget = cdev->gadget;
+	struct device			*dev = &gadget->dev;
 	struct f_uac1			*uac1 = func_to_uac1(f);
 	struct g_audio			*audio = func_to_g_audio(f);
 	struct f_uac1_opts		*audio_opts;
@@ -519,6 +558,10 @@ static int f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 	int				rate;
 	int				status;
 
+	status = f_audio_validate_opts(audio, dev);
+	if (status)
+		return status;
+
 	audio_opts = container_of(f->fi, struct f_uac1_opts, func_inst);
 
 	us = usb_gstrings_attach(cdev, uac1_strings, ARRAY_SIZE(strings_uac1));
-- 
2.30.2

