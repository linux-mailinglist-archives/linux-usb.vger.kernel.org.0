Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA88D1FC3E8
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jun 2020 03:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgFQByx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Jun 2020 21:54:53 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:6349 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726253AbgFQByx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Jun 2020 21:54:53 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id A63B87843636275AB1C4;
        Wed, 17 Jun 2020 09:54:51 +0800 (CST)
Received: from [127.0.0.1] (10.67.102.118) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Wed, 17 Jun 2020
 09:54:40 +0800
Subject: Re: [PATCH v3] USB: ehci: reopen solution for Synopsys HC bug
From:   liulongfang <liulongfang@huawei.com>
To:     <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, <kong.kongxinwei@hisilicon.com>,
        <huangdaode@huawei.com>, <yisen.zhuang@huawei.com>
References: <1591588019-44284-1-git-send-email-liulongfang@huawei.com>
Message-ID: <72f0e59b-3d59-2bdc-8804-e81b8d708c02@huawei.com>
Date:   Wed, 17 Jun 2020 09:54:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1591588019-44284-1-git-send-email-liulongfang@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.102.118]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020/6/8 11:46, Longfang Liu Wrote:
> A Synopsys USB2.0 core used in Huawei Kunpeng920 SoC has a bug which
> might cause the host controller not issuing ping.
>
> Bug description:
> After indicating an Interrupt on Async Advance, the software uses the
> doorbell mechanism to delete the Next Link queue head of the last
> executed queue head. At this time, the host controller still references
> the removed queue head(the queue head is NULL). NULL reference causes
> the host controller to lose the USB device.
>
> Solution:
> After deleting the Next Link queue head, when has_synopsys_hc_bug set
> to 1，the software can write one of the valid queue head addresses to
> the ASYNCLISTADDR register to allow the host controller to get
> the valid queue head. in order to solve that problem, this patch set
> the flag for Huawei Kunpeng920
>
> There are detailed instructions and solutions in this patch:
> commit 2f7ac6c19997 ("USB: ehci: add workaround for Synopsys HC bug")
>
> Signed-off-by: Longfang Liu <liulongfang@huawei.com>
> ---
>
> Changes in v3:
> - updated comment message
>
> Changes in v2:
> - Added comment message
>
>  drivers/usb/host/ehci-pci.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/usb/host/ehci-pci.c b/drivers/usb/host/ehci-pci.c
> index 1a48ab1..7ff2cbd 100644
> --- a/drivers/usb/host/ehci-pci.c
> +++ b/drivers/usb/host/ehci-pci.c
> @@ -216,6 +216,13 @@ static int ehci_pci_setup(struct usb_hcd *hcd)
>  		ehci_info(ehci, "applying MosChip frame-index workaround\n");
>  		ehci->frame_index_bug = 1;
>  		break;
> +	case PCI_VENDOR_ID_HUAWEI:
> +		/* Synopsys HC bug */
> +		if (pdev->device == 0xa239) {
> +			ehci_info(ehci, "applying Synopsys HC workaround\n");
> +			ehci->has_synopsys_hc_bug = 1;
> +		}
> +		break;
>  	}
>  
>  	/* optional debug port, normally in the first BAR */

Hi ALL,

 I'd appreciate any comments on this patch
from USB related people.

Thanks,

Longfang


