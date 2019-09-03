Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E9D7A6439
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2019 10:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728429AbfICIqb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Sep 2019 04:46:31 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:34426 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728388AbfICIqa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Sep 2019 04:46:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=4qtLPZ/aSLTeJY+KOJz9u948G4Y31mDFg0mnKh+tgA0=; b=XSS6rWr6nm3hI3nUzWLgrkPiDJ
        s3mVVveUNz8Pr37zpkzI30fd/vyx2O+2tOedMsPBTWp8SKhnuGtej6w8Oe5MtDeBRYE/VLoSHmj7k
        BxkskchsWMYAjkslu3fqY/G8XJubuyI36uH6lAsGbl1QGWWGSDC8sisoATN7gGPpCHcPKiyeX0/YO
        pmsUV0aHjKADatKf+bVTjjaeNbigsREPGdPduKB2YFMnkHQUbwusn1dtWqTNej+XD0Fjs7mZMuq3l
        9WgW2+3LDd4AFPTLuzAIG5Ozd3Pt7rddD7bLHy+Xhe57wvpHaJK0DyXMwqGz+vqj2yQAwLRFx67EF
        2OZP4A+w==;
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i54SJ-0003s6-Rj; Tue, 03 Sep 2019 08:46:28 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] usb: remove a stale comment in hcd_alloc_coherent
Date:   Tue,  3 Sep 2019 10:46:13 +0200
Message-Id: <20190903084615.19161-5-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190903084615.19161-1-hch@lst.de>
References: <20190903084615.19161-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Now that we have the local memory pool implemented there is no
need to use dma_declare_coherent_memory.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/usb/core/hcd.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index add2af4af766..4ccfc8e59604 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -1249,9 +1249,6 @@ EXPORT_SYMBOL_GPL(usb_hcd_unlink_urb_from_ep);
  * To support host controllers with limited dma capabilities we provide dma
  * bounce buffers. This feature can be enabled by initializing
  * hcd->localmem_pool using usb_hcd_setup_local_mem().
- * For this to work properly the host controller code must first use the
- * function dma_declare_coherent_memory() to point out which memory area
- * that should be used for dma allocations.
  *
  * The initialized hcd->localmem_pool then tells the usb code to allocate all
  * data for dma using the genalloc API.
-- 
2.20.1

