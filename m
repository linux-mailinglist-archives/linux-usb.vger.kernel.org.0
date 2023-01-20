Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DADC7675622
	for <lists+linux-usb@lfdr.de>; Fri, 20 Jan 2023 14:53:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbjATNxl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Jan 2023 08:53:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjATNxk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Jan 2023 08:53:40 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C90C4BF8A9
        for <linux-usb@vger.kernel.org>; Fri, 20 Jan 2023 05:53:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4246A61F5E
        for <linux-usb@vger.kernel.org>; Fri, 20 Jan 2023 13:53:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BF27C433EF;
        Fri, 20 Jan 2023 13:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1674222817;
        bh=pgCw9qlbNyoh3KfBY+dkPadvtlgHDM8rStaMIBJg3Ro=;
        h=From:To:Cc:Subject:Date:From;
        b=k5op9vM6kqNcD9JmSzReuzTG7yWPmr55yx9R8ySivKOdLLz1/WL8y5WiS8GKZiKq5
         vpdKOTXuP0Y9uudSlcSNLK2ewiCe2LRLgHCFS2+4BpwqsZdvE9k0QAOyHw+PaWVmIv
         5E1ufeLewkUWl/ehbaLx+GYPIL8e2Iu8DKIuQces=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable <stable@kernel.org>, Christoph Jung <jung@codemercs.com>
Subject: [PATCH] USB: misc: iowarrior: fix up header size for USB_DEVICE_ID_CODEMERCS_IOW100
Date:   Fri, 20 Jan 2023 14:53:30 +0100
Message-Id: <20230120135330.3842518-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=832; i=gregkh@linuxfoundation.org; h=from:subject; bh=pgCw9qlbNyoh3KfBY+dkPadvtlgHDM8rStaMIBJg3Ro=; b=owGbwMvMwCRo6H6F97bub03G02pJDMmn5tzw1PluJBAywVryvNicwjCb4yt+uM1M8WBQCRDwe9Gr Oc2jI5aFQZCJQVZMkeXLNp6j+ysOKXoZ2p6GmcPKBDKEgYtTACbis51hfnXxhL2TNzeafa2b+ncPf/ CpRxwZMxnmBxpUOMzkyloeukRynWQKay3f3NbZAA==
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

The USB_DEVICE_ID_CODEMERCS_IOW100 header size was incorrect, it should
be 12, not 13.

Cc: stable <stable@kernel.org>
Fixes: 17a82716587e ("USB: iowarrior: fix up report size handling for some devices")
Reported-by: Christoph Jung <jung@codemercs.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/misc/iowarrior.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/misc/iowarrior.c b/drivers/usb/misc/iowarrior.c
index f9427a67789c..1e3df27bab58 100644
--- a/drivers/usb/misc/iowarrior.c
+++ b/drivers/usb/misc/iowarrior.c
@@ -814,7 +814,7 @@ static int iowarrior_probe(struct usb_interface *interface,
 			break;
 
 		case USB_DEVICE_ID_CODEMERCS_IOW100:
-			dev->report_size = 13;
+			dev->report_size = 12;
 			break;
 		}
 	}
-- 
2.39.1

