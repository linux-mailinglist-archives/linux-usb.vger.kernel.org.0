Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F41A273144A
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jun 2023 11:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238768AbjFOJnX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Jun 2023 05:43:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343599AbjFOJnT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Jun 2023 05:43:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4CA71BF9
        for <linux-usb@vger.kernel.org>; Thu, 15 Jun 2023 02:43:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8046A621C3
        for <linux-usb@vger.kernel.org>; Thu, 15 Jun 2023 09:43:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94241C433C8;
        Thu, 15 Jun 2023 09:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1686822197;
        bh=zU/1mS7GcPXAIffTrMqQYyVexLDqT+wokiE9fBsFeUY=;
        h=From:To:Cc:Subject:Date:From;
        b=siDJW/0ZbMe/J6PGXavByLhK1AWNi1UXEBIdJPjtoLr7Lo+LrQj4YwBVRVvpxBLZr
         /oSsLXz2itaFyZn7aauT3TgUB245jr7wf99U2f8kDkQkJ2apYBNBhc9xy1vBsnCoFK
         ALL+aMPzk/jlIP+ouYKsi8bSJq9obpLs9oExxVpY=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] MAINTAINERS: USB: add uapi header files to USB SUBSYSTEM entry
Date:   Thu, 15 Jun 2023 11:43:07 +0200
Message-ID: <20230615094306.2072827-2-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=714; i=gregkh@linuxfoundation.org; h=from:subject; bh=zU/1mS7GcPXAIffTrMqQYyVexLDqT+wokiE9fBsFeUY=; b=owGbwMvMwCRo6H6F97bub03G02pJDCldd7W6zaMP/dvukDFhzvXppqxHWC4HLmEVW9TF4fV5r tniT26xHbEsDIJMDLJiiixftvEc3V9xSNHL0PY0zBxWJpAhDFycAjCRX+UM86vUjWbyr19w1/17 7uyiBS1vt36YIsAwV/Sufsflx6oH5iRv4DtafXuve+37rwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For some reason the include/uapi/linux/usb/ directory is missing in the
USB SUBSYSTEM entry, so get_maintainer will not know to cc: the proper
mailing lists.  Fix this up by adding an entry for this directory.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a8c8bd0b845f..8d8cb2067451 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21941,6 +21941,7 @@ F:	drivers/usb/
 F:	include/dt-bindings/usb/
 F:	include/linux/usb.h
 F:	include/linux/usb/
+F:	include/uapi/linux/usb/
 
 USB TYPEC BUS FOR ALTERNATE MODES
 M:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
-- 
2.41.0

