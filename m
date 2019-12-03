Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 048AB11031A
	for <lists+linux-usb@lfdr.de>; Tue,  3 Dec 2019 18:01:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbfLCRBl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Dec 2019 12:01:41 -0500
Received: from ste-pvt-msa1.bahnhof.se ([213.80.101.70]:58276 "EHLO
        ste-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726449AbfLCRBl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Dec 2019 12:01:41 -0500
X-Greylist: delayed 450 seconds by postgrey-1.27 at vger.kernel.org; Tue, 03 Dec 2019 12:01:40 EST
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id D71B94878F;
        Tue,  3 Dec 2019 17:54:08 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id kS8jp6yxobMs; Tue,  3 Dec 2019 17:54:08 +0100 (CET)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id D9F6441023;
        Tue,  3 Dec 2019 17:54:07 +0100 (CET)
Date:   Tue, 3 Dec 2019 17:54:07 +0100
From:   Fredrik Noring <noring@nocrew.org>
To:     Christoph Hellwig <hch@lst.de>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] USB: Fix incorrect DMA allocations for local memory pool
 drivers
Message-ID: <20191203165407.GA4230@sx9>
References: <20191130165055.GA46622@sx9>
 <20191203073920.GB23881@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191203073920.GB23881@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Christoph,

> > One can also consider unsetting HCD_DMA for local memory pool drivers.
> 
> That seems like a good idea to me, as the "local DMA pool" really isn't
> DMA in the traditional sense.  The host has to copy data into it by MMIO,
> and it then is accessed by the device.

Perhaps we can combine several enhancements, given that the local memory
pool drivers frequently break with peculiar errors? For example:

1. Arrange localmem_pool and hcd_uses_dma() statements consistently.
   Inconsistent ordering was a source of this bug.

2. Make localmem_pool and hcd_uses_dma() mutually exclusive. Allocating
   DMA memory was a source of this bug.

3. Introduce hcd_uses_localmem_pool(), as show below, to have it on the
   same abstraction level as hcd_uses_dma(). The current localmem_pool
   pointer tests throughout the code are not quite as readable.

A minor note: The commit sequence

7b81cb6bddd2 ("usb: add a HCD_DMA flag instead of guestimating DMA capabilities")
5d6ff300f011 ("usb/max3421: remove the dummy {un,}map_urb_for_dma methods")
bd5defaee872 ("dma-mapping: remove is_device_dma_capable")
cdfee5623290 ("driver core: initialize a default DMA mask for platform device")

broke bisection because the first commit 7b81cb6bddd2 crashes with "DMA map
on device without dma_mask", that is fixed in the fourth commit cdfee5623290.
Too late to do anything about that now, though.

Fredrik

diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -423,6 +423,11 @@ static inline bool hcd_periodic_completion_in_progress(struct usb_hcd *hcd,
 	return hcd->high_prio_bh.completing_ep == ep;
 }
 
+static inline bool hcd_uses_localmem_pool(struct usb_hcd *hcd)
+{
+	return hcd->localmem_pool != NULL;
+}
+
 static inline bool hcd_uses_dma(struct usb_hcd *hcd)
 {
 	return IS_ENABLED(CONFIG_HAS_DMA) && (hcd->driver->flags & HCD_DMA);
