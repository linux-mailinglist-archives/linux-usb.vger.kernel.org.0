Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A258762EC6B
	for <lists+linux-usb@lfdr.de>; Fri, 18 Nov 2022 04:43:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235010AbiKRDnp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Nov 2022 22:43:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234902AbiKRDnn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Nov 2022 22:43:43 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F54F10B7A;
        Thu, 17 Nov 2022 19:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=IUmiaYAz6hoKjarswFKTVYENfY0zRBptg2j3PpqeP0I=; b=P7Z0iSlbGCC/4f366/QyhyNDk6
        rgvZ37UWkMEqkU/dckXU9W5Lx/10zkMjZuKO7nobF11uMdXlvBjcYmAErGcaI4o8f10MX3PqTd6Mt
        +r4TgejG0blzQs6JR6ngIpnGg/yF9KO7i3Taz/2XWhvje1j+MaZhSYxI/pXKwQPjCjnChb27TX9xw
        Hz33NmgUGxBAvgJ67lo13LyqIX33kudpmN8KjdOvPOoE+GkR1z/lHY3ciw5z7Oo3jGdSJYS+5tjmv
        a3wkTYT+MHyRWWSxu9QsyhjeAgGbEh/hEW/FMiuML303jH9wCtuYawtCYTjOA4pFMYifPqytzt0Ai
        zj/pRxiA==;
Received: from [2601:1c2:d80:3110::a2e7] (helo=casper.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1ovsI1-001kkm-Hg; Fri, 18 Nov 2022 03:43:42 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-doc@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH] Documentation: USB: correct possessive "its" usage
Date:   Thu, 17 Nov 2022 19:43:31 -0800
Message-Id: <20221118034331.18188-1-rdunlap@infradead.org>
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

Correct uses of "it's" to possessive "its" as needed.
Correct associated grammar in one location.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
---
 Documentation/usb/CREDITS          |    4 ++--
 Documentation/usb/functionfs.rst   |    2 +-
 Documentation/usb/gadget_multi.rst |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff -- a/Documentation/usb/CREDITS b/Documentation/usb/CREDITS
--- a/Documentation/usb/CREDITS
+++ b/Documentation/usb/CREDITS
@@ -126,7 +126,7 @@ THANKS file in Inaky's driver):
         - Jochen Karrer <karrer@wpfd25.physik.uni-wuerzburg.de>, for
           pointing out mortal bugs and giving advice.
 
-        - Edmund Humemberger <ed@atnet.at>, for it's great work on
+        - Edmund Humemberger <ed@atnet.at>, for its great work on
           public relationships and general management stuff for the
           Linux-USB effort.
 
@@ -136,7 +136,7 @@ THANKS file in Inaky's driver):
         - Ric Klaren <ia_ric@cs.utwente.nl> for doing nice
           introductory documents (competing with Alberto's :).
 
-        - Christian Groessler <cpg@aladdin.de>, for it's help on those
+        - Christian Groessler <cpg@aladdin.de>, for its help on those
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
 
