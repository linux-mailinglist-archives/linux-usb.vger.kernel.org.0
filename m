Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44F8C728FE4
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jun 2023 08:22:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237888AbjFIGWL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Jun 2023 02:22:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238095AbjFIGWA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Jun 2023 02:22:00 -0400
X-Greylist: delayed 317 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 08 Jun 2023 23:21:57 PDT
Received: from forward205a.mail.yandex.net (forward205a.mail.yandex.net [178.154.239.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 175061BD6
        for <linux-usb@vger.kernel.org>; Thu,  8 Jun 2023 23:21:56 -0700 (PDT)
Received: from forward103a.mail.yandex.net (forward103a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d103])
        by forward205a.mail.yandex.net (Yandex) with ESMTP id 4736E47486
        for <linux-usb@vger.kernel.org>; Fri,  9 Jun 2023 09:16:40 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-49.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-49.vla.yp-c.yandex.net [IPv6:2a02:6b8:c18:3487:0:640:5432:0])
        by forward103a.mail.yandex.net (Yandex) with ESMTP id 12DFE46D05;
        Fri,  9 Jun 2023 09:16:36 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-49.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id LGP9SI8DemI0-OQWkPfNT;
        Fri, 09 Jun 2023 09:16:35 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1686291395;
        bh=ez5s7ubTKk/bYdiUoLaosipxOMRDEYmgKsXEUhhvpgs=;
        h=Message-Id:Date:Cc:Subject:To:From;
        b=uSfK0WI41bGTpVM7XLnz42E+cUx2v+vPdUUBVFAosFgjj4nx+U3SWGZJo/GFUgUxP
         rlrpOkpyeQgxr40pT6uNmlUwPek6q+6GFdeoCjOPBbQ39AxndWGOOznASF+MkpjEBK
         tzr0TNuCT/vcTmzOir/0l6MQXpo5+2/3+9393SDM=
Authentication-Results: mail-nwsmtp-smtp-production-main-49.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From:   Dmitry Antipov <dmantipov@yandex.ru>
To:     Michael Jamet <michael.jamet@intel.com>
Cc:     linux-usb@vger.kernel.org, lvc-project@linuxtesting.org,
        Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] thunderbolt: handle possible NULL pointer from get_device()
Date:   Fri,  9 Jun 2023 09:16:19 +0300
Message-Id: <20230609061619.57756-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_VALIDITY_RPBL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Handle possible NULL pointer returned by 'get_device()'
in 'tb_xdomain_alloc()' and 'remove_unplugged_switch()'.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/thunderbolt/icm.c     | 5 +++++
 drivers/thunderbolt/xdomain.c | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index 86521ebb2579..40ab6104a437 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -2035,6 +2035,11 @@ static void remove_unplugged_switch(struct tb_switch *sw)
 {
 	struct device *parent = get_device(sw->dev.parent);
 
+	if (!parent) {
+		tb_warn(sw->tb, "no parent of switch %pUb\n", sw->uuid);
+		return;
+	}
+
 	pm_runtime_get_sync(parent);
 
 	/*
diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index e2b54887d331..a0ee683d752e 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -1883,6 +1883,8 @@ struct tb_xdomain *tb_xdomain_alloc(struct tb *tb, struct device *parent,
 
 	device_initialize(&xd->dev);
 	xd->dev.parent = get_device(parent);
+	if (!xd->dev.parent)
+		goto err_free_remote_uuid;
 	xd->dev.bus = &tb_bus_type;
 	xd->dev.type = &tb_xdomain_type;
 	xd->dev.groups = xdomain_attr_groups;
@@ -1902,6 +1904,8 @@ struct tb_xdomain *tb_xdomain_alloc(struct tb *tb, struct device *parent,
 
 	return xd;
 
+err_free_remote_uuid:
+	kfree(xd->remote_uuid);
 err_free_local_uuid:
 	kfree(xd->local_uuid);
 err_free:
-- 
2.40.1

