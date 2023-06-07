Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36ECE7270BD
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jun 2023 23:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231302AbjFGVwu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Jun 2023 17:52:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbjFGVwt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Jun 2023 17:52:49 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5F54184
        for <linux-usb@vger.kernel.org>; Wed,  7 Jun 2023 14:52:48 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 5EAC81FD84;
        Wed,  7 Jun 2023 21:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1686174766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=HXqhNJzPEEPzoDoz+RFsblnX6QQdfXD4oZVVcqa45Po=;
        b=D66R9aSuEsGgDw0/flKy/GZKG0fieLaRx373gLyy6ewwthgWVPN4ht3t6fdjt1YPZOIywd
        BvMZLJvNq9J9+27hSj48t55HkOYTMIHfTJ/ZVUh9pAanfD+X+hC2TJJFP+ydD0msg12Wqf
        KObK5Y8VfbzbWmxH/2Pjqnv6CW+WXrI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1686174766;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=HXqhNJzPEEPzoDoz+RFsblnX6QQdfXD4oZVVcqa45Po=;
        b=1Mcy7IVekja1gk8BNOh+8tvLqeYfpeWPnVH3nLJWbHjDhnfkYaVWUrnVAd6PbHA0KKGfZm
        A0dcd4wb1cEPGzCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 32C2A13776;
        Wed,  7 Jun 2023 21:52:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 8T7aCi78gGTlXAAAMHmgww
        (envelope-from <ddiss@suse.de>); Wed, 07 Jun 2023 21:52:46 +0000
From:   David Disseldorp <ddiss@suse.de>
To:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Disseldorp <ddiss@suse.de>
Subject: [PATCH v2] usb: gadget: f_mass_storage: remove unnecessary open check
Date:   Wed,  7 Jun 2023 23:54:02 +0200
Message-Id: <20230607215401.22563-1-ddiss@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The fsg_lun_is_open() test can be eliminated and the code merged with
the preceding conditional, because the LUN won't be open if
cfg->filename wasn't set. Similarly, the error_lun label will never be
reached with an open lun (non-null filp) so remove the unnecessary
fsg_lun_close() call.

Signed-off-by: David Disseldorp <ddiss@suse.de>
---
Changes since v1:
- reword commit message, following Alan Stern's suggestions

 drivers/usb/gadget/function/f_mass_storage.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
index 3a30feb47073f..da07e45ae6df5 100644
--- a/drivers/usb/gadget/function/f_mass_storage.c
+++ b/drivers/usb/gadget/function/f_mass_storage.c
@@ -2857,7 +2857,7 @@ int fsg_common_create_lun(struct fsg_common *common, struct fsg_lun_config *cfg,
 			  const char **name_pfx)
 {
 	struct fsg_lun *lun;
-	char *pathbuf, *p;
+	char *pathbuf = NULL, *p = "(no medium)";
 	int rc = -ENOMEM;
 
 	if (id >= ARRAY_SIZE(common->luns))
@@ -2907,12 +2907,9 @@ int fsg_common_create_lun(struct fsg_common *common, struct fsg_lun_config *cfg,
 		rc = fsg_lun_open(lun, cfg->filename);
 		if (rc)
 			goto error_lun;
-	}
 
-	pathbuf = kmalloc(PATH_MAX, GFP_KERNEL);
-	p = "(no medium)";
-	if (fsg_lun_is_open(lun)) {
 		p = "(error)";
+		pathbuf = kmalloc(PATH_MAX, GFP_KERNEL);
 		if (pathbuf) {
 			p = file_path(lun->filp, pathbuf, PATH_MAX);
 			if (IS_ERR(p))
@@ -2931,7 +2928,6 @@ int fsg_common_create_lun(struct fsg_common *common, struct fsg_lun_config *cfg,
 error_lun:
 	if (device_is_registered(&lun->dev))
 		device_unregister(&lun->dev);
-	fsg_lun_close(lun);
 	common->luns[id] = NULL;
 error_sysfs:
 	kfree(lun);
-- 
2.35.3

