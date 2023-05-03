Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68B646F5D18
	for <lists+linux-usb@lfdr.de>; Wed,  3 May 2023 19:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbjECRgk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 May 2023 13:36:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjECRgj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 May 2023 13:36:39 -0400
Received: from master.debian.org (master.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4001])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E3E48F
        for <linux-usb@vger.kernel.org>; Wed,  3 May 2023 10:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
        s=smtpauto.master; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
        In-Reply-To:References; bh=xsDMM4tcE1wc4u9tuMW8mq3i23s5QkHxDEbb3cnRks8=; b=Zc
        Bp1y7/ShI5AaA1x10qafnhoxKnKhZSbWQOdGwWBga86qyUkzxPURY3DTjxan015Hwrs7hi2OLWu6W
        z6DadQWod9RQzfNtD9zvVJDbdNZ+ugX007ioZaibIqsbk5SWIvtcJPPAe9AoEeGY8BWMDIGT9ubqc
        M/km8Zg8Pyk11hNj4kRbxLsPc8XtRwpQMgCElhaiLg3qIR+utfDH1SVVoeAajdeWMf+ygVg8QrTwY
        RsabXX/1jkYbEKFdesP6nCGlazRhLmwzUnl2+WCOuJCj9VjGKfp4skLwpauW2VUmCWEF/3ONqLsyg
        Ei5Qz1+9RAl0h4Pt/qFRjWPP5Fyl2fLg==;
Received: from ukleinek by master.debian.org with local (Exim 4.94.2)
        (envelope-from <ukleinek@master.debian.org>)
        id 1puGP2-005DtS-WD; Wed, 03 May 2023 17:36:33 +0000
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@debian.org>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>
Cc:     Hongren Zheng <i@zenithal.me>, linux-usb@vger.kernel.org
Subject: [PATCH v2] usbip: Use _FORTIFY_SOURCE=2 instead of (implicitly) =1
Date:   Wed,  3 May 2023 19:36:22 +0200
Message-Id: <20230503173622.1072787-1-ukleinek@debian.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1207; i=ukleinek@debian.org; h=from:subject; bh=dS8kTJCme51O9HLeXdRdtwhOY14ZWLrNvFpooOdvSTA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkUpuV1Ud+1hV/w0VhbVbjS+E5dnYlgH1A4L0o0 iACZgWij4OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFKblQAKCRCPgPtYfRL+ TkLbB/9TTkxIYAQztyJNwdFjL86pkJq4wUOR9Umu6OcgwP0XxS0wjyJzh2QkA3ObgnhA2zvLTNM ZDMFmM8rV/D4Hiq4hMq9c33/SBg1TFv3B7r2kdS0BF2fLiH4Csb6SUd6xh5Dqt5rfKY/kUE34GD i2Jp5pNLFNIVr4OPgCa6TKe2memhVPyr7pJoOlJKyjC3LirwpOrw5sJnZlkNqCQxpxeNRGCOYWl FauE+UOxzmHJA28dmww6bSRsm/GxcB+ztxacFyOJeNtGSTb0TY8ck4WlWdBGiK6wtpI6qg2db/m N+V1LJqeISi7aoVS//6aG4C6MoOXGOvoviANwu3xO19WKS9q
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

While at it fix a typo in the output of ./configure --help.

Signed-off-by: Uwe Kleine-König <ukleinek@debian.org>
---
Changes since (implicit) v1:

- s/_FORTIFY_SROUCE/_FORTIFY_SOURCE/ in the help text, noted (off-list)
  by Cyril Brulebois.

 tools/usb/usbip/configure.ac | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/usb/usbip/configure.ac b/tools/usb/usbip/configure.ac
index 607d05c5ccfd..8debf934f8b7 100644
--- a/tools/usb/usbip/configure.ac
+++ b/tools/usb/usbip/configure.ac
@@ -94,11 +94,11 @@ AC_SUBST([USBIDS_DIR])
 AC_MSG_CHECKING([whether to use fortify])
 AC_ARG_WITH([fortify],
 	    [AS_HELP_STRING([--with-fortify],
-			    [use _FORTIFY_SROUCE option when compiling)])],
+			    [use _FORTIFY_SOURCE=2 option when compiling)])],
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

