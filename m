Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E37215A39FE
	for <lists+linux-usb@lfdr.de>; Sat, 27 Aug 2022 22:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231214AbiH0Uc3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 27 Aug 2022 16:32:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiH0Uc2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 27 Aug 2022 16:32:28 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A12E950065;
        Sat, 27 Aug 2022 13:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=4PIiyUARzi7D5ywLlrQlxTzgIede+oJCwI/sk8GMfDo=; b=rxD7XFB/u98IJUxfyRURY7VYQD
        yCuVh8/qgpIbLd5cHkq06HHdgawPq1YxoPDGWr/ay9sgONGyVIjUwlDabe114wGj1WRMLiz5ACDVT
        xil/EFnjXCHgQUyHiKtZFNiPbz/SFEihAFQ7rLq2D0iUuY/QDdWzRVoJkuLOqHKZsQQvoc4mCzmB4
        AVZDHV1HugYqbOVQT0fJ8DWmVlaBo/4GtFuU59vJIWT2Z7pzPuPdlrCr7FH9OWx1Xj8IZJeux9Yie
        ++wcUraR4WvhzRTx4f/fDr2z3e4g1Ywvmo+PA1MWSVnkK+7ggfCwc2TZh7cPrwZCPNmDRRNZEPVqb
        5loR4BEg==;
Received: from [2601:1c0:6280:3f0::a6b3] (helo=casper.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1oS2Tf-001gwU-Mv; Sat, 27 Aug 2022 20:32:25 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-doc@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Peter Chen <peter.chen@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH] usb: chipidea: clarify Documentation/ABI text
Date:   Sat, 27 Aug 2022 13:32:17 -0700
Message-Id: <20220827203217.7837-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix grammar and improve readability of chipidea-usb2 text.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Peter Chen <peter.chen@kernel.org>
Cc: linux-usb@vger.kernel.org
---
 Documentation/ABI/testing/sysfs-platform-chipidea-usb2 |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- a/Documentation/ABI/testing/sysfs-platform-chipidea-usb2
+++ b/Documentation/ABI/testing/sysfs-platform-chipidea-usb2
@@ -2,8 +2,8 @@ What:		/sys/bus/platform/devices/ci_hdrc
 Date:		Mar 2017
 Contact:	Peter Chen <peter.chen@nxp.com>
 Description:
-		It returns string "gadget" or "host" when read it, it indicates
-		current controller role.
+		When read, it returns string "gadget" or "host", indicating
+		the current controller role.
 
-		It will do role switch when write "gadget" or "host" to it.
+		It will do role switch when "gadget" or "host" is written to it.
 		Only controller at dual-role configuration supports writing.
