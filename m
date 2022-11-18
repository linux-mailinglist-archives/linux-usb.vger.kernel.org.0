Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1121A630349
	for <lists+linux-usb@lfdr.de>; Sat, 19 Nov 2022 00:27:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233792AbiKRX0t (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Nov 2022 18:26:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbiKRX0P (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Nov 2022 18:26:15 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75F3557B43;
        Fri, 18 Nov 2022 15:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=sREzeRhgg0pXAQTg+IrSytnIiXO09agL0qguRDMIdrA=; b=sisdyyfwM+JxZ8tr8WlPh+LfjK
        g8B6zo0p85VB29vDu+nbXx5EnQ3FL5TnlBeqrNpyv/ZpPTyeAI+uHwqLiPF3cnKzK85m5RveRXvW6
        h8Oy3X4/PNujP5667jZ17BV8RpeyrT4WRnoGlCQ27hjJhUXuAePoUdwf8zSUANJWOjnpg5rusA5Cg
        2bxY2HlP08nPg8SVYgnpnTA9JDCGDjecy5swTyJdR7VbCMrL3kP0ZMJd4io+yGlPFF7N5DEg1z7Zf
        KQ0M6MbS64wyogvDZhSGGGotjTgtL2rkKZGhehfAGELy5VcOC1AIvdRjX/sTMuDplBqfpYzDPyWwJ
        FdEC2srA==;
Received: from [2601:1c2:d80:3110::a2e7] (helo=casper.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1owAZ7-002lwh-Gr; Fri, 18 Nov 2022 23:14:41 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-doc@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH v2] Documentation: USB: correct possessive "its" usage
Date:   Fri, 18 Nov 2022 15:14:22 -0800
Message-Id: <20221118231422.14076-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Correct uses of "it's" to possessive "its" or "its" to "it's" as needed.
Correct associated grammar in one location.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
---
v2: use "his" instead of "its" in CREDITS (Alan)
    Also correct one use of "its" to "it's".

 Documentation/usb/CREDITS          |    6 +++---
 Documentation/usb/functionfs.rst   |    2 +-
 Documentation/usb/gadget_multi.rst |    2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff -- a/Documentation/usb/CREDITS b/Documentation/usb/CREDITS
--- a/Documentation/usb/CREDITS
+++ b/Documentation/usb/CREDITS
@@ -1,7 +1,7 @@
 Credits for the Simple Linux USB Driver:
 
 The following people have contributed to this code (in alphabetical
-order by last name).  I'm sure this list should be longer, its
+order by last name).  I'm sure this list should be longer, it's
 difficult to maintain, add yourself with a patch if desired.
 
   Georg Acher <acher@informatik.tu-muenchen.de>
@@ -126,7 +126,7 @@ THANKS file in Inaky's driver):
         - Jochen Karrer <karrer@wpfd25.physik.uni-wuerzburg.de>, for
           pointing out mortal bugs and giving advice.
 
-        - Edmund Humemberger <ed@atnet.at>, for it's great work on
+        - Edmund Humemberger <ed@atnet.at>, for his great work on
           public relationships and general management stuff for the
           Linux-USB effort.
 
@@ -136,7 +136,7 @@ THANKS file in Inaky's driver):
         - Ric Klaren <ia_ric@cs.utwente.nl> for doing nice
           introductory documents (competing with Alberto's :).
 
-        - Christian Groessler <cpg@aladdin.de>, for it's help on those
+        - Christian Groessler <cpg@aladdin.de>, for his help on those
           itchy bits ... :)
 
         - Paul MacKerras for polishing OHCI and pushing me harder for
diff -- a/Documentation/usb/functionfs.rst b/Documentation/usb/functionfs.rst
--- a/Documentation/usb/functionfs.rst
+++ b/Documentation/usb/functionfs.rst
@@ -49,7 +49,7 @@ level it would look like this::
   $ ( cd /dev/ffs-hid && hid-daemon ) &
 
 On kernel level the gadget checks ffs_data->dev_name to identify
-whether it's FunctionFS designed for MTP ("mtp") or HID ("hid").
+whether its FunctionFS is designed for MTP ("mtp") or HID ("hid").
 
 If no "functions" module parameters is supplied, the driver accepts
 just one function with any name.
diff -- a/Documentation/usb/gadget_multi.rst b/Documentation/usb/gadget_multi.rst
--- a/Documentation/usb/gadget_multi.rst
+++ b/Documentation/usb/gadget_multi.rst
@@ -9,7 +9,7 @@ The Multifunction Composite Gadget (or g
 that makes extensive use of the composite framework to provide
 a... multifunction gadget.
 
-In it's standard configuration it provides a single USB configuration
+In its standard configuration it provides a single USB configuration
 with RNDIS[1] (that is Ethernet), USB CDC[2] ACM (that is serial) and
 USB Mass Storage functions.
 
