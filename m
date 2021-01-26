Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E39B304C9F
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jan 2021 23:51:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730487AbhAZWu5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Jan 2021 17:50:57 -0500
Received: from mga02.intel.com ([134.134.136.20]:27673 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727373AbhAZR3B (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 26 Jan 2021 12:29:01 -0500
IronPort-SDR: PsgF4g0dh3ASA5hTH6Lb4aJuTIhqTnGGMxgM5igZsX0NAIsHldEnBYRBuyGW66bD51wp4uok8o
 tksP9dkGtwLw==
X-IronPort-AV: E=McAfee;i="6000,8403,9876"; a="167038608"
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; 
   d="scan'208";a="167038608"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2021 09:27:12 -0800
IronPort-SDR: d14Ju9eFHJNezkZ5EbK3yvzZ6ZtGnfwuOt1JDXHT27ScU5QB3PGec4E0B5ZLFasXoSIpoXcOGX
 3FTm1OC4O9iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; 
   d="scan'208";a="350723610"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga007.fm.intel.com with ESMTP; 26 Jan 2021 09:27:11 -0800
Subject: Re: USB2 / USB3 compatibility problems: xhci_hcd 0000:00:06.0: WARN
 Wrong bounce buffer write length: 0 != 512
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     Andreas Hartmann <andihartmann@01019freenet.de>,
        linux-usb@vger.kernel.org
References: <3b4e35d2-9508-e0aa-eaf8-32e524ad81c4@01019freenet.de>
 <756e7b88-1142-4758-b8f7-a8eaf510b422@01019freenet.de>
 <edc3c7b1-98fa-9062-5c17-426e8ad17370@01019freenet.de>
 <7e953b15-925a-1512-4d15-c07fc03f9059@01019freenet.de>
 <f83677b5-e3d1-afdb-c8d4-f9969fa3fe84@linux.intel.com>
 <a65a9299-1e5b-f15d-2ae7-f0a21938f4fd@01019freenet.de>
 <d9fd7812-43cc-2813-5222-5e39b63fccbc@01019freenet.de>
 <8de6ecb9-4a39-5742-a358-d6965feffc79@linux.intel.com>
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <021e1727-0e2e-0207-ace2-4382489eea1f@linux.intel.com>
Date:   Tue, 26 Jan 2021 19:29:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8de6ecb9-4a39-5742-a358-d6965feffc79@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


>> I'm not sure if it's important for you to know: The driver doesn't use struct scatterlist or num_mapped_sgs at all (if it's meant to be used by the sender at all).
>>
>> But it sets URB_NO_TRANSFER_DMA_MAP (for data transfer among others).
>>
>> Mlme packets are sent w/o bulk and w/o setting URB_NO_TRANSFER_DMA_MAP. All other packets are sent with URB_NO_TRANSFER_DMA_MAP turned on.
>>
> 
> Ok, thanks, I see what's going on here.
> 
> Short recap of xhci alignment requirements.
> 1. Data pointed to by a transfer request block (TRB) may not span 64k boundary
> 2. If a transfer contains several TRBs, and spans over two TRB ringbuffer
>    segments, then the sum of the TRB data in the first segment must be a 
>    multiple of max packets in size.
>  
> Code assumes that if transfer is split into several blocks,(TRBs) and a block
> in the middle of a transfer is smaller than max packet size, then it must be sg list.
> 
> But this is not necessarily the case if data was already DMA mapped beforehand.
> Data might start just before a 64k boundary, causing first TRB to be less than
> packet size.
> 
> I'll start implementing a fix for this.

Got a first iteration ready,
any change you could try it out?

Thanks
-Mathias

8<---

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 5677b81c0915..8df30618aaf1 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -699,11 +699,16 @@ static void xhci_unmap_td_bounce_buffer(struct xhci_hcd *xhci,
 	dma_unmap_single(dev, seg->bounce_dma, ring->bounce_buf_len,
 			 DMA_FROM_DEVICE);
 	/* for in tranfers we need to copy the data from bounce to sg */
-	len = sg_pcopy_from_buffer(urb->sg, urb->num_sgs, seg->bounce_buf,
-			     seg->bounce_len, seg->bounce_offs);
-	if (len != seg->bounce_len)
-		xhci_warn(xhci, "WARN Wrong bounce buffer read length: %zu != %d\n",
-				len, seg->bounce_len);
+	if (urb->num_sgs) {
+		len = sg_pcopy_from_buffer(urb->sg, urb->num_sgs, seg->bounce_buf,
+					   seg->bounce_len, seg->bounce_offs);
+		if (len != seg->bounce_len)
+			xhci_warn(xhci, "WARN Wrong bounce buffer read length: %zu != %d\n",
+				  len, seg->bounce_len);
+	} else {
+		memcpy(urb->transfer_buffer + seg->bounce_offs, seg->bounce_buf,
+		       seg->bounce_len);
+	}
 	seg->bounce_len = 0;
 	seg->bounce_offs = 0;
 }
@@ -3275,12 +3280,16 @@ static int xhci_align_td(struct xhci_hcd *xhci, struct urb *urb, u32 enqd_len,
 
 	/* create a max max_pkt sized bounce buffer pointed to by last trb */
 	if (usb_urb_dir_out(urb)) {
-		len = sg_pcopy_to_buffer(urb->sg, urb->num_sgs,
-				   seg->bounce_buf, new_buff_len, enqd_len);
-		if (len != new_buff_len)
-			xhci_warn(xhci,
-				"WARN Wrong bounce buffer write length: %zu != %d\n",
-				len, new_buff_len);
+		if (urb->num_sgs) {
+			len = sg_pcopy_to_buffer(urb->sg, urb->num_sgs,
+						 seg->bounce_buf, new_buff_len, enqd_len);
+			if (len != new_buff_len)
+				xhci_warn(xhci, "WARN Wrong bounce buffer write length: %zu != %d\n",
+					  len, new_buff_len);
+		} else {
+			memcpy(seg->bounce_buf, urb->transfer_buffer + enqd_len, new_buff_len);
+		}
+
 		seg->bounce_dma = dma_map_single(dev, seg->bounce_buf,
 						 max_pkt, DMA_TO_DEVICE);
 	} else {
