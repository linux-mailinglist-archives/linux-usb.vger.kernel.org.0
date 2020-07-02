Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1349A212BAD
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 19:55:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728022AbgGBRzH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 13:55:07 -0400
Received: from foss.arm.com ([217.140.110.172]:48648 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727985AbgGBRzH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 2 Jul 2020 13:55:07 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4C1A1FB;
        Thu,  2 Jul 2020 10:55:06 -0700 (PDT)
Received: from [192.168.122.166] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 653B23F71E;
        Thu,  2 Jul 2020 10:55:06 -0700 (PDT)
To:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>, linux-mm@kvack.org,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        rientjes@google.com, Christoph Hellwig <hch@lst.de>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From:   Jeremy Linton <jeremy.linton@arm.com>
Subject: [BUG] XHCI getting ZONE_DMA32 memory > than its bus_dma_limit
Message-ID: <34619bdf-6527-ae82-7e4d-e2ea7c67ed56@arm.com>
Date:   Thu, 2 Jul 2020 12:49:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Using 5.8rc3:

The rpi4 has a 3G dev->bus_dma_limit on its XHCI controller. With a usb3 
hub, plus a few devices plugged in, randomly devices will fail 
operations. This appears to because xhci_alloc_container_ctx() is 
getting buffers > 3G via dma_pool_zalloc().

Tracking that down, it seems to be caused by dma_alloc_from_pool() using 
dev_to_pool()->dma_direct_optimal_gfp_mask() to "optimistically" select 
the atomic_pool_dma32 but then failing to verify that the allocations in 
the pool are less than the dev bus_dma_limit.

Thanks,

