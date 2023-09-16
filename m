Return-Path: <linux-usb+bounces-238-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D787A2EE9
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 11:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D60C2821AA
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 09:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65328125DC;
	Sat, 16 Sep 2023 09:05:34 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAC66134
	for <linux-usb@vger.kernel.org>; Sat, 16 Sep 2023 09:05:32 +0000 (UTC)
X-Greylist: delayed 143 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 16 Sep 2023 02:05:27 PDT
Received: from r3-24.sinamail.sina.com.cn (r3-24.sinamail.sina.com.cn [202.108.3.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AECC1170E
	for <linux-usb@vger.kernel.org>; Sat, 16 Sep 2023 02:05:27 -0700 (PDT)
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([112.97.59.200])
	by sina.com (172.16.97.23) with ESMTP
	id 65056F4200018B57; Sat, 16 Sep 2023 17:03:00 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 88986931458004
X-SMAIL-UIID: 52ABD7A421C44218A7C2853B1F2CFB49-20230916-170300-1
From: Hillf Danton <hdanton@sina.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Christoph Hellwig <hch@lst.de>,
	LKML <linux-kernel@vger.kernel.org>,
	USB <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v6 03/33] xhci: sideband: add initial api to register a sideband entity
Date: Sat, 16 Sep 2023 17:02:49 +0800
Message-Id: <20230916090249.94-1-hdanton@sina.com>
In-Reply-To: <20230916001026.315-4-quic_wcheng@quicinc.com>
References: <20230916001026.315-1-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, 15 Sep 2023 17:09:56 -0700 Wesley Cheng <quic_wcheng@quicinc.com>
> +static int
> +xhci_ring_to_sgtable(struct xhci_sideband *sb, struct xhci_ring *ring, struct device *dev)
> +{
> +	struct sg_table	*sgt;
> +	struct xhci_segment *seg;
> +	struct page **pages;
> +	unsigned int n_pages;
> +	size_t sz;
> +	int i;
> +
> +	sz = ring->num_segs * TRB_SEGMENT_SIZE;
> +	n_pages = PAGE_ALIGN(sz) >> PAGE_SHIFT;
> +	pages = kvmalloc_array(n_pages, sizeof(struct page *), GFP_KERNEL);
> +	if (!pages)
> +		return 0;
> +
> +	sgt = kzalloc(sizeof(struct sg_table), GFP_KERNEL);
> +	if (!sgt) {
> +		kvfree(pages);
> +		return 0;
> +	}
> +
> +	seg = ring->first_seg;
> +
> +	/*
> +	 * Rings can potentially have multiple segments, create an array that
> +	 * carries page references to allocated segments.  Utilize the
> +	 * sg_alloc_table_from_pages() to create the sg table, and to ensure
> +	 * that page links are created.
> +	 */
> +	for (i = 0; i < ring->num_segs; i++) {
> +		pages[i] = vmalloc_to_page(seg->trbs);
> +		seg = seg->next;
> +	}

Given dma_pool_zalloc() in xhci_segment_alloc() and dma_alloc_coherent() in
pool_alloc_page(), it is incorrect to get page from the cpu address returned
by the dma alloc routine.

