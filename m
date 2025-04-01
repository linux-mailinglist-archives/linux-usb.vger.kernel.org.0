Return-Path: <linux-usb+bounces-22447-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7217A780CB
	for <lists+linux-usb@lfdr.de>; Tue,  1 Apr 2025 18:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B9697A44C1
	for <lists+linux-usb@lfdr.de>; Tue,  1 Apr 2025 16:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B9D20E6E7;
	Tue,  1 Apr 2025 16:43:42 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EC320E6E3;
	Tue,  1 Apr 2025 16:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743525822; cv=none; b=R4BAgfHSpe9oeonJuoUfVV27z6E4XlQnubTxNrGi+p4UVY6FY8GA94R9YuR48N04fCLNw3adQl9Mze2iLvTPw40cvh/ZAPOMczuGQHs2smHKKJOtSORTQVo4Wr0d5KU1RYap8rGRc2RTDfbbBY8r9gDFImOEEbLTbL6s2Dp+1P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743525822; c=relaxed/simple;
	bh=ajVg15ugstYtB2Bcql9gnzvuJDz8HNi2MUmRAmo42po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IXd1Tj/2/msYNbdhxYTXNNADEnfdVZ58d/AyEilivS9kEEK9uPOaMTJbWj1EiEz2nCDvu5Z69qqTVdCxmCeBp6I6lbadvwZxSwgHd3yJGuzfhL5SQx4j/XT8iGkLrLCLmqZmsRtvXna+TBJUkuk3T2QEGEjRsi5FGlGP/Ge5nrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D942CC4CEE4;
	Tue,  1 Apr 2025 16:43:39 +0000 (UTC)
Date: Tue, 1 Apr 2025 17:43:37 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: John Ernberg <john.ernberg@actia.se>
Cc: Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	Jonas Blixt <jonas.blixt@actia.se>
Subject: Re: [PATCH v7 00/17] mm, dma, arm64: Reduce ARCH_KMALLOC_MINALIGN to
 8
Message-ID: <Z-wXuTaTpWOLzTS_@arm.com>
References: <20230612153201.554742-1-catalin.marinas@arm.com>
 <ab2776f0-b838-4cf6-a12a-c208eb6aad59@actia.se>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab2776f0-b838-4cf6-a12a-c208eb6aad59@actia.se>

On Fri, Mar 28, 2025 at 04:41:05PM +0000, John Ernberg wrote:
> On 6/12/23 5:31 PM, Catalin Marinas wrote:
> > That's v7 of the series reducing the kmalloc() minimum alignment on
> > arm64 to 8 (from 128). There's no new/different functionality, mostly
> > cosmetic changes and acks/tested-bys.
> > 
> > Andrew, if there are no further comments or objections to this version,
> > are you ok to take the series through the mm tree? The arm64 changes are
> > fairly small. Alternatively, I can push it into linux-next now to give
> > it some wider exposure and decide whether to upstream it when the
> > merging window opens. Thanks.
> > 
> > The updated patches are also available on this branch:
> > 
> > git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux devel/kmalloc-minalign
> > 
[...]
> Seen on Linux 6.12.20, it is not trivial for us to test later kernels so
> if the issue is potentially fixed we are more than happy to cherry-pick
> the potential fixes and give them a go.

I'm not aware of any recent fix for this, so I doubt testing a newer
kernel would make a difference.

> Having an SMSC9512 (smsc95xx) USB Ethernet/Hub chip attached to the armv8
> SoC iMX8QXP over the Cadence USB3 USB2 interface (cdns3-imx) will since
> the patch set at [0] cause random interrupt storms over the SMSC9512 INT
> EP.
> 
> The reason for the storm is that the async URBs queued at [1] right before
> the interrupt configuration [2] in the driver.
> With [0] applied, those async URBs are likely clobbering any URB located
> after them in memory somewhere in the xhci memory space.
> The memory corruption only happens if there is more than one URB in the
> queue at the same time, making these async URBs a good trigger of the
> problem.
> If we force those URBs to be sync or use the hack inlined below, the
> problem goes away.

I'm not really familiar with this area. My only drivers/usb/ change
related to ARCH_KMALLOC_MINALIGN was commit 075efe7c1656 ("drivers/usb:
use ARCH_DMA_MINALIGN instead of ARCH_KMALLOC_MINALIGN"). I wouldn't be
surprised if I missed other things that rely on the kmalloc() alignment
rather than explicit macros.

> The content of read_buf in the interrupt configuration read at [2] looks
> to be the lo-part of a pointer +-20 bytes distance from the pointers
> present in the async URBs queued from [1] when we dumped the URB structures
> instead of the expected register contents.

It might be worth enabling CONFIG_DMA_API_DEBUG to see if it complains.
I lost myself in the call paths on how read_buf gets populated. In
principle, the DMA API should handle bouncing (swiotlb) even if you pass
it a buffer smaller than the required alignment

Random shot, untested and not an actual fix but some ideas for
debugging:

------------------8<-------------------------------
diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 44179f4e807f..06d5f9bfef75 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -2024,7 +2024,7 @@ static int __usbnet_read_cmd(struct usbnet *dev, u8 cmd, u8 reqtype,
 		   cmd, reqtype, value, index, size);

 	if (size) {
-		buf = kmalloc(size, GFP_NOIO);
+		buf = kmalloc(ALIGN(size, dma_get_cache_alignment()), GFP_NOIO);
 		if (!buf)
 			goto out;
 	}
@@ -2171,12 +2171,13 @@ int usbnet_write_cmd_async(struct usbnet *dev, u8 cmd, u8 reqtype,
 		goto fail;

 	if (data) {
-		buf = kmemdup(data, size, GFP_ATOMIC);
+		buf = kmalloc(ALIGN(size, dma_get_cache_alignment()), GFP_ATOMIC);
 		if (!buf) {
 			netdev_err(dev->net, "Error allocating buffer"
 				   " in %s!\n", __func__);
 			goto fail_free_urb;
 		}
+		memcpy(buf, data, size);
 	}

 	req = kmalloc(sizeof(struct usb_ctrlrequest), GFP_ATOMIC);
diff --git a/drivers/usb/cdns3/cdnsp-mem.c b/drivers/usb/cdns3/cdnsp-mem.c
index 97866bfb2da9..226ac7af6511 100644
--- a/drivers/usb/cdns3/cdnsp-mem.c
+++ b/drivers/usb/cdns3/cdnsp-mem.c
@@ -45,6 +45,7 @@ static struct cdnsp_segment *cdnsp_segment_alloc(struct cdnsp_device *pdev,
 		return NULL;
 	}

+	max_packet = ALIGN(max_packet, dma_get_cache_alignment());
 	if (max_packet) {
 		seg->bounce_buf = kzalloc(max_packet, flags | GFP_DMA);
 		if (!seg->bounce_buf)
------------------8<-------------------------------

Even without the above, my reading of the code is that it is safe since
the buffers eventually end up in dma_map_single() which would do
bouncing via an aligned buffer.

Try to track down call paths from smsc95xx_read_reg() and
smsc95xx_write_reg_async() to usbnet_{read,wrote}_cmd* etc. and see how
the DMA transfers happen, whether it's missing some dma_map_* call. The
dma_map_* bouncing logic relies on the size, see
dma_kmalloc_needs_bounce().

Is there an iommu between the usb host controller and memory? The iommu
code should do similar bouncing but it's had minimal testing.

-- 
Catalin

