Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE14C75084B
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jul 2023 14:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233624AbjGLM3A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jul 2023 08:29:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233602AbjGLM2x (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jul 2023 08:28:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4848410F7
        for <linux-usb@vger.kernel.org>; Wed, 12 Jul 2023 05:28:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D1C69617A8
        for <linux-usb@vger.kernel.org>; Wed, 12 Jul 2023 12:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B0D6C433D9;
        Wed, 12 Jul 2023 12:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689164930;
        bh=iIHbrwtqHvWqoKRj3jTkxwje3tYZEVMW0If744G8QVM=;
        h=From:To:Cc:Subject:Date:From;
        b=hZhhUZFRbC8W6L4kYwNF2hXg2A9mKYZ5s4JcYXOJOR9yMaifXBPW4khXEAuhE1k8K
         YNFbxWTXMlTDtagtS3lxbGtz3tK6x4By/bwRNu3tYPGVI1MhSy54+CT9QyIF6peQvC
         qEyfyeo8KX7/ozLYNjc5ZxIT9Cx+gCcZckx4kQYukRToWKzGWUS7lCf8N7zyqsxwsc
         kq+5RnzQRhIZQI2HZt7MkWp55D3wlS1IWFVV//dTU0pH+wO++ECNIS7Ych3lxl1qK8
         rIYLwdYuxwey+kyv0E8G1N6Be7SZIi0iItqEKFjZm80XYdu2uSM6sJiBzb0RTSqxWg
         ZRaoqvrMMloXA==
From:   Roger Quadros <rogerq@kernel.org>
To:     peter.chen@kernel.org
Cc:     pawell@cadence.com, srk@ti.com, vigneshr@ti.com,
        linux-usb@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: [PATCH] MAINTAINERS: drop invalid usb/cdns3 Reviewer e-mail
Date:   Wed, 12 Jul 2023 15:28:28 +0300
Message-Id: <20230712122828.17793-1-rogerq@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Alternate working e-mail of this Reviewer not available
so drop it do prevent unnecessary bounce backs.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7e0b87d5aa2e..126e01ec3559 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4530,7 +4530,6 @@ CADENCE USB3 DRD IP DRIVER
 M:	Peter Chen <peter.chen@kernel.org>
 M:	Pawel Laszczak <pawell@cadence.com>
 R:	Roger Quadros <rogerq@kernel.org>
-R:	Aswath Govindraju <a-govindraju@ti.com>
 L:	linux-usb@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git
-- 
2.34.1

