Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0F46F5CF7
	for <lists+linux-usb@lfdr.de>; Wed,  3 May 2023 19:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbjECRWH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 May 2023 13:22:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbjECRWF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 May 2023 13:22:05 -0400
X-Greylist: delayed 385 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 03 May 2023 10:22:03 PDT
Received: from master.debian.org (master.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4001])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2CD9CF
        for <linux-usb@vger.kernel.org>; Wed,  3 May 2023 10:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
        s=smtpauto.master; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
        In-Reply-To:References; bh=DdNve2GwmYcDyICDrI6fHqcpOTdBC6ozvrriesR8zCs=; b=wJ
        Yh0uBGl5YYcJq2v5G7Nmw8rwfWcpj4it3Vk4h5+sxc2ThQTKQyCJthl3laKDKz2ercUQSSOGVzBqS
        pZ4cghb8vvfRXsxoCcjL4pjf6Nv4oeO/R78UNHyPvL7o5X/Sqj6xLgQiIHClhEL2kZcZqLUUqKP4d
        ol1Og6wj8F1AbMlukh1qig2Al9XO6N0QOAWYaBAKjHg9H7B8CPqpSxi8WANYSf6uZb1IGOS5XBToH
        Xu9ANinNHpifdqyEmnasScJ8LCe6x7NW3s0M6E3JPTQICjigzOjnqai1lBIzKvbEovVAg8VMQ26AG
        r8jQ99kHHjtrnriWdT6SRmaa3kDw8xXw==;
Received: from ukleinek by master.debian.org with local (Exim 4.94.2)
        (envelope-from <ukleinek@master.debian.org>)
        id 1puG4h-005CwA-D6; Wed, 03 May 2023 17:15:31 +0000
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@debian.org>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>
Cc:     Hongren Zheng <i@zenithal.me>, linux-usb@vger.kernel.org
Subject: [PATCH] usbip: Use _FORTIFY_SOURCE=2 instead of (implicitly) =1
Date:   Wed,  3 May 2023 19:15:23 +0200
Message-Id: <20230503171523.1070704-1-ukleinek@debian.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1014; i=ukleinek@debian.org; h=from:subject; bh=naAgnG4zlVieKufvJ/8iNhB3Hg69zyrRhopXPCwhvVA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkUpaqqr8TomWuNePabHVX8Dm1Bw309OCkh0dFo qLS6AMGuQqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFKWqgAKCRCPgPtYfRL+ TvQ3B/0Swm2m3Ly/4VYvLBZOvDV6HJlUaO+6w1hmHcAebB3oluEDYvgffCjTWZD7pxocgHmFvUE 1a6iAww4qYchwZELqMslmR1cyr7QPYqC/ozKJGrCdF9PvvDuDjEbnscguTdxE1GHGmCv15mF+iA 5+9fdK+MZAFQcaTZKUbPBrwlLJ9bm9R1un18m+LeoaEEi9w05qYFvCZl8PeEyQbL4ZUd+y7VRqQ fWl+250iDm6IOVtbipSbHW6ov6rmbdi4KZg3cRvX/fvte/ly7zoxX++MYE7YmEm0e3cPKHQzPTX SXANNdBLSf/UjrZvT3A1VDjF17Kp/7eubbs2JKz/kITF23Lm
X-Developer-Key: i=ukleinek@debian.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

_FORTIFY_SOURCE=2 uses more and stricter checks. This is what e.g.
Debian recommends to build packages with.

Signed-off-by: Uwe Kleine-König <ukleinek@debian.org>
---
 tools/usb/usbip/configure.ac | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/usb/usbip/configure.ac b/tools/usb/usbip/configure.ac
index 607d05c5ccfd..9a849846a34a 100644
--- a/tools/usb/usbip/configure.ac
+++ b/tools/usb/usbip/configure.ac
@@ -94,11 +94,11 @@ AC_SUBST([USBIDS_DIR])
 AC_MSG_CHECKING([whether to use fortify])
 AC_ARG_WITH([fortify],
 	    [AS_HELP_STRING([--with-fortify],
-			    [use _FORTIFY_SROUCE option when compiling)])],
+			    [use _FORTIFY_SROUCE=2 option when compiling)])],
 			    dnl [ACTION-IF-GIVEN]
 			    [if test "$withval" = "yes"; then
 				AC_MSG_RESULT([yes])
-				CFLAGS="$CFLAGS -D_FORTIFY_SOURCE -O"
+				CFLAGS="$CFLAGS -D_FORTIFY_SOURCE=2 -O"
 			     else
 			     	AC_MSG_RESULT([no])
 				CFLAGS="$CFLAGS -U_FORTIFY_SOURCE"
-- 
2.39.2

