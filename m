Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EFCD1075F6
	for <lists+linux-usb@lfdr.de>; Fri, 22 Nov 2019 17:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbfKVQtH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Nov 2019 11:49:07 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:46952 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbfKVQtG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Nov 2019 11:49:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=zkBbTkR9+RQ8WB3BuKpXSyZe0/mEGlkgI57xBgxZNRc=; b=GooJ2PIP4cqsx+FKkXw6i69B5
        Vw8EYYJ4vfuKJ02Gyqu73yLTjjiPChG2VPMVF8yGwFmD9X1xhm14rrokW/YvlP7h+bD58X75BvY6L
        35KxOgxeWByiOrzLhoK5f+P1CCXRV4Wqk1qSl3zNnlN+p1qzufBkW8V5+lEsgjNOmut0leVbYBhO0
        /fz9CleTSlMMIAK9wkbezrCJfpfGT/Ty2kZ9UyI1fMLpiCQvdQdxNnTIaORxzbxgccGsMGZ3tze/M
        nSL1vGvfV3EZ1HKuvnIg+3+BLvH+Rq2X7I7Hh1yJBDZXvxvcPf/EuPW4+vHxqL2lT+esWWkUpv6zl
        AbagTiCIg==;
Received: from [2601:1c0:6280:3f0::5a22]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iYC7F-0006o1-Sy; Fri, 22 Nov 2019 16:49:05 +0000
To:     USB list <linux-usb@vger.kernel.org>,
        Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] usb: drop comment about 2 uhci drivers
Message-ID: <5f93d906-4f5c-2a78-c1c7-36cf07e94bcc@infradead.org>
Date:   Fri, 22 Nov 2019 08:49:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Drop the ancient comment about 2 usb/uhci drivers since there are
no longer 2 of them.

Cc: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 drivers/usb/serial/Kconfig |    3 ---
 1 file changed, 3 deletions(-)

--- linux-next-20191122.orig/drivers/usb/serial/Kconfig
+++ linux-next-20191122/drivers/usb/serial/Kconfig
@@ -129,9 +129,6 @@ config USB_SERIAL_DIGI_ACCELEPORT
 	  parallel port on the USB 2 appears as a third serial port on Linux.
 	  The Digi Acceleport USB 8 is not yet supported by this driver.
 
-	  This driver works under SMP with the usb-uhci driver.  It does not
-	  work under SMP with the uhci driver.
-
 	  To compile this driver as a module, choose M here: the
 	  module will be called digi_acceleport.
 

