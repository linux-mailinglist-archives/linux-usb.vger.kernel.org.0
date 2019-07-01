Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAE5B19FC4
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2019 17:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727554AbfEJPDl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 May 2019 11:03:41 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:50080 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727346AbfEJPDl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 10 May 2019 11:03:41 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5F7EA78;
        Fri, 10 May 2019 08:03:40 -0700 (PDT)
Received: from [10.1.196.75] (e110467-lin.cambridge.arm.com [10.1.196.75])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 389A53F73C;
        Fri, 10 May 2019 08:03:39 -0700 (PDT)
Subject: Re: [RFC PATCH 0/3] prerequisites for device reserved local mem
 rework
To:     laurentiu.tudor@nxp.com, hch@lst.de, stern@rowland.harvard.edu,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        marex@denx.de
Cc:     leoyang.li@nxp.com, linux-kernel@vger.kernel.org
References: <20190510145646.10078-1-laurentiu.tudor@nxp.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <e6410453-9ca3-4bdc-3c74-654333f2806f@arm.com>
Date:   Fri, 10 May 2019 16:03:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190510145646.10078-1-laurentiu.tudor@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Laurentiu,

On 10/05/2019 15:56,  wrote:
> From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
> 
> For HCs that have local memory, replace the current DMA API usage
> with a genalloc generic allocator to manage the mappings for these
> devices.
> This is in preparation for dropping the existing "coherent" dma
> mem declaration APIs. Current implementation was relying on a short
> circuit in the DMA API that in the end, was acting as an allocator
> for these type of devices.
> 
> Only compiled tested, so any volunteers willing to test are most welcome.

Based on my diggings into this in the past, I would expect that you need 
to do something about hcd_alloc_coherent() as well.

Robin.

> 
> Thank you!
> 
> For context, see thread here: https://lkml.org/lkml/2019/4/22/357
> 
> Laurentiu Tudor (3):
>    ohci-hcd: use genalloc for USB HCs with local memory
>    usb: host: ohci-sm501: init genalloc for local memory
>    usb: host: ohci-tmio: init genalloc for local memory
> 
>   drivers/usb/host/ohci-hcd.c   | 21 +++++++++---
>   drivers/usb/host/ohci-sm501.c | 63 +++++++++++++++++++----------------
>   drivers/usb/host/ohci-tmio.c  | 23 ++++++++-----
>   drivers/usb/host/ohci.h       |  3 ++
>   4 files changed, 69 insertions(+), 41 deletions(-)
> 
