Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDC146AA279
	for <lists+linux-usb@lfdr.de>; Fri,  3 Mar 2023 22:48:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232677AbjCCVsJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Mar 2023 16:48:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232509AbjCCVrf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Mar 2023 16:47:35 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D72326546E;
        Fri,  3 Mar 2023 13:45:02 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DEB49B81A0C;
        Fri,  3 Mar 2023 21:43:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0617C4339B;
        Fri,  3 Mar 2023 21:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677879810;
        bh=F3Q4jKopnnXfzlnJ8qnU5EeFLtFycAZFH7iwqJimz+U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gqeoD2XXN4gaV7ra2FafWdf3gi0uRaEc9qy08MnpoKhc85R8/Wk8VaNmdFcSIZfus
         9Ihwnbztdv67v+Co54CoIkd5L9qOvON6xTuqwkbEa1wUWl+SfGvPpa8I1xhpl/y69Z
         /+cME/Js2G0Wqwmdhp7WUlpK12sVeRU0TH0th/nTvCzifeRW+lTEDTvnWYAc0g9oPp
         YuQm8Fd/GFS9LKIc/RDZZfoSHOhWUFahrNlE6BO/EZ8oqNs77HJWeO7kDkuyRv/xk4
         /3NVEBaZZms2VSPLI08z3wPjlMspV1lwuUXAZqFXvxIHrqg411hgn2l8zE6YTcnVNY
         5x9yQM2jP4tUg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jilin Yuan <yuanjilin@cdjrlc.com>,
        Sasha Levin <sashal@kernel.org>, hdegoede@redhat.com,
        mchehab@kernel.org, mika.westerberg@linux.intel.com,
        alexandre.belloni@bootlin.com, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 09/60] USB: fix memory leak with using debugfs_lookup()
Date:   Fri,  3 Mar 2023 16:42:23 -0500
Message-Id: <20230303214315.1447666-9-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303214315.1447666-1-sashal@kernel.org>
References: <20230303214315.1447666-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

[ Upstream commit 30374434edab20e25776f8ecb4bc9d1e54309487 ]

When calling debugfs_lookup() the result must have dput() called on it,
otherwise the memory will leak over time.  To make things simpler, just
call debugfs_lookup_and_remove() instead which handles all of the logic at
once.

Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Jilin Yuan <yuanjilin@cdjrlc.com>
Link: https://lore.kernel.org/r/20230106152828.3790902-1-gregkh@linuxfoundation.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/core/usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index 11b15d7b357ad..a415206cab043 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -998,7 +998,7 @@ static void usb_debugfs_init(void)
 
 static void usb_debugfs_cleanup(void)
 {
-	debugfs_remove(debugfs_lookup("devices", usb_debug_root));
+	debugfs_lookup_and_remove("devices", usb_debug_root);
 }
 
 /*
-- 
2.39.2

