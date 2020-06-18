Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D891E1FEEDD
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jun 2020 11:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729271AbgFRJnY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Jun 2020 05:43:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:43714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729060AbgFRJnV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 18 Jun 2020 05:43:21 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1B79B21D6C;
        Thu, 18 Jun 2020 09:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592473399;
        bh=yKNoE9kIz+SpmVfbwoez1KYAhJZiTDr3kGLoGFMOyAY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CU/a0QcrGcik6KJE+PyYEk7ySyjV3ZfqT4YwCswKU86Eg1mPGtu2yFtV1lSzotLrW
         pCOMTzGJraB5FmFD8P0jvg0rvaV5zJjqq5XyQPX5jOtek7gYFQR7FcEbz4PTfOHhM7
         9gAulS8qujtJhXFuMOQW0yQZv9ZjAj548IGNWT4M=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-usb@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH 3/8] USB: OHCI: remove obsolete FIXME comment
Date:   Thu, 18 Jun 2020 11:42:55 +0200
Message-Id: <20200618094300.1887727-4-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200618094300.1887727-1-gregkh@linuxfoundation.org>
References: <20200618094300.1887727-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This comment has been present since the start of git.  Since no one is
going to do anything about it, and all seems to work well, just drop the
thing entirely.

Cc: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/host/ohci-pci.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/host/ohci-pci.c b/drivers/usb/host/ohci-pci.c
index 585222af24ff..41efe927d8f3 100644
--- a/drivers/usb/host/ohci-pci.c
+++ b/drivers/usb/host/ohci-pci.c
@@ -232,10 +232,6 @@ static const struct pci_device_id ohci_pci_quirks[] = {
 		.driver_data	= (unsigned long)ohci_quirk_qemu,
 	},
 
-	/* FIXME for some of the early AMD 760 southbridges, OHCI
-	 * won't work at all.  blacklist them.
-	 */
-
 	{},
 };
 
-- 
2.27.0

