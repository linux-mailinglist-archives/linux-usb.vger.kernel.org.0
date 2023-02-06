Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E87CB68BD25
	for <lists+linux-usb@lfdr.de>; Mon,  6 Feb 2023 13:44:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbjBFMoc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Feb 2023 07:44:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbjBFMob (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Feb 2023 07:44:31 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 922A011E81
        for <linux-usb@vger.kernel.org>; Mon,  6 Feb 2023 04:44:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4A81FB80D78
        for <linux-usb@vger.kernel.org>; Mon,  6 Feb 2023 12:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F505C433D2;
        Mon,  6 Feb 2023 12:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1675687467;
        bh=hhXfFggWsWgpIav5JfHwkgd9m/CIvFUjiWshtJfDj4Y=;
        h=From:To:Cc:Subject:Date:From;
        b=iTgW2T6xv/uZNxqlXSJf/S/952rsKpbE4w8Ct1jk4VPfr/BD1G2XP7mvFCVmCGqy3
         qB4Rm+6sBcW7lzrZvNz+C4mIiRCz4cEYZ5bYB/Oc8zESfR/D6jP6UG4WRSvKpy3e2I
         xZFUUJlQwD7jfnusXHRd5M2l8EMbPfNNEQj/sjro=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] i915: fix up merge with usb-next branch
Date:   Mon,  6 Feb 2023 13:44:22 +0100
Message-Id: <20230206124422.2266892-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1250; i=gregkh@linuxfoundation.org; h=from:subject; bh=hhXfFggWsWgpIav5JfHwkgd9m/CIvFUjiWshtJfDj4Y=; b=owGbwMvMwCRo6H6F97bub03G02pJDMkPvqka/tnEJRHs1cahw/BoRf4/v30Kr3df9VibwBm8TGz2 2VdLO2JZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAiQXcY5oc+YIt99NZHZcbhJKOzQW s9k793KTHMD49Y7rq2J+1pVsDluO2zuW6+461TAwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In the manual fixup of the list_count_nodes() logic in
drivers/gpu/drm/i915/gt/intel_execlists_submission.c in the usb-next
branch, I missed that the print modifier was incorrect, resulting in
loads of build warnings on 32bit systems.

Fix this up by using "%su" instead of "%lu".

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 924fb3ec50f5 ("Merge 6.2-rc7 into usb-next")
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 178ff20648c5..ee71cde2ffc6 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -4158,7 +4158,7 @@ void intel_execlists_dump_active_requests(struct intel_engine_cs *engine,
 
 	intel_engine_dump_active_requests(&engine->sched_engine->requests, hung_rq, m);
 
-	drm_printf(m, "\tOn hold?: %lu\n",
+	drm_printf(m, "\tOn hold?: %zu\n",
 		   list_count_nodes(&engine->sched_engine->hold));
 
 	spin_unlock_irqrestore(&engine->sched_engine->lock, flags);
-- 
2.39.1

