Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94A5E370C58
	for <lists+linux-usb@lfdr.de>; Sun,  2 May 2021 16:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233204AbhEBOF7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 2 May 2021 10:05:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:51246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232269AbhEBOFj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 2 May 2021 10:05:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BDEE9613C5;
        Sun,  2 May 2021 14:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619964287;
        bh=gHK9z7jQUHKGMyq9Dk1nA6jlE7fCAzl1NO77XE5WdZ0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=L2pFAJb1Bylhc7vjE1m9nVoriz+AmbsBktO1hf0Y/GirTW3jDXyqbVmNnXSnmC8ki
         4MQ/BH0jjlRXq3R5mmwwuR6w5QiZ6kCd3sLZAc907B6XlLS5tn0qtNNDEZJgaXlUia
         OQRWF2o4T9uHxGyHo0NsDXcK1xr6CJADOWVXuaXOowgyKbGzlBOgeHX/SSYZls7qmL
         1Xtal1Wb2KdrWFpzZRM6mdVXATCKHoP79FnAKlYQw18Ea3p488ziPd6O1QWg5A1Jap
         ebq+RVQ8GCb1CBDI87mc7qoJ7yGzMBOYisvTYAehYF6oHqgtY5iDM6AvceScUw6xPN
         Sl5xzGnq81RfQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 10/34] usb: gadget: f_uac2: validate input parameters
Date:   Sun,  2 May 2021 10:04:10 -0400
Message-Id: <20210502140434.2719553-10-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210502140434.2719553-1-sashal@kernel.org>
References: <20210502140434.2719553-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Ruslan Bilovol <ruslan.bilovol@gmail.com>

[ Upstream commit 3713d5ceb04d5ab6a5e2b86dfca49170053f3a5e ]

Currently user can configure UAC2 function with
parameters that violate UAC2 spec or are not supported
by UAC2 gadget implementation.

This can lead to incorrect behavior if such gadget
is connected to the host - like enumeration failure
or other issues depending on host's UAC2 driver
implementation, bringing user to a long hours
of debugging the issue.

Instead of silently accept these parameters, throw
an error if they are not valid.

Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
Link: https://lore.kernel.org/r/1614599375-8803-4-git-send-email-ruslan.bilovol@gmail.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/gadget/function/f_uac2.c | 39 ++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 6f03e944e0e3..dd960cea642f 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -14,6 +14,9 @@
 #include "u_audio.h"
 #include "u_uac2.h"
 
+/* UAC2 spec: 4.1 Audio Channel Cluster Descriptor */
+#define UAC2_CHANNEL_MASK 0x07FFFFFF
+
 /*
  * The driver implements a simple UAC_2 topology.
  * USB-OUT -> IT_1 -> OT_3 -> ALSA_Capture
@@ -604,6 +607,36 @@ static void setup_descriptor(struct f_uac2_opts *opts)
 	hs_audio_desc[i] = NULL;
 }
 
+static int afunc_validate_opts(struct g_audio *agdev, struct device *dev)
+{
+	struct f_uac2_opts *opts = g_audio_to_uac2_opts(agdev);
+
+	if (!opts->p_chmask && !opts->c_chmask) {
+		dev_err(dev, "Error: no playback and capture channels\n");
+		return -EINVAL;
+	} else if (opts->p_chmask & ~UAC2_CHANNEL_MASK) {
+		dev_err(dev, "Error: unsupported playback channels mask\n");
+		return -EINVAL;
+	} else if (opts->c_chmask & ~UAC2_CHANNEL_MASK) {
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
 static int
 afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 {
@@ -612,11 +645,13 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 	struct usb_composite_dev *cdev = cfg->cdev;
 	struct usb_gadget *gadget = cdev->gadget;
 	struct device *dev = &gadget->dev;
-	struct f_uac2_opts *uac2_opts;
+	struct f_uac2_opts *uac2_opts = g_audio_to_uac2_opts(agdev);
 	struct usb_string *us;
 	int ret;
 
-	uac2_opts = container_of(fn->fi, struct f_uac2_opts, func_inst);
+	ret = afunc_validate_opts(agdev, dev);
+	if (ret)
+		return ret;
 
 	us = usb_gstrings_attach(cdev, fn_strings, ARRAY_SIZE(strings_fn));
 	if (IS_ERR(us))
-- 
2.30.2

