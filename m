Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA571985D
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2019 08:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbfEJG3B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 May 2019 02:29:01 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:40764 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726823AbfEJG3B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 May 2019 02:29:01 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190510062858euoutp0159c8a766c5111a5c3b6548dc71e7c013~dPnm1j5No1254712547euoutp01d
        for <linux-usb@vger.kernel.org>; Fri, 10 May 2019 06:28:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190510062858euoutp0159c8a766c5111a5c3b6548dc71e7c013~dPnm1j5No1254712547euoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1557469738;
        bh=eXIVTfYY8af4A7ZX1vxFdNxEfGwt2MK0lJN7fr7WK24=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=dwZ6vfb901rhhgA4YKBLGTfY0R6EmjQttxEfm3Xw7p0mkEd101FlDaORRhsm1bMkZ
         NdeNtNy8QvUrpWzJ/dgt+rLhOa/4E1TAYAvy6vCjTH07vt0tbRKty9sMw76iQESS/m
         xQcOsXIuIMpFvHGnJsAGt+Sc6SgKRIMljZKrE16I=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190510062857eucas1p1d5f5f469172bb498e54f0efe8459469b~dPnl-_kFN3045330453eucas1p1w;
        Fri, 10 May 2019 06:28:57 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 40.36.04325.92A15DC5; Fri, 10
        May 2019 07:28:57 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190510062856eucas1p1ff947fd59e085888b36a39366c3021c5~dPnlV2xvs3049530495eucas1p1o;
        Fri, 10 May 2019 06:28:56 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190510062856eusmtrp1b0ea6ade52010a430db9c8c5b95cdbad~dPnlH2L4C0264202642eusmtrp1F;
        Fri, 10 May 2019 06:28:56 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-14-5cd51a29d5b5
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 5A.95.04140.82A15DC5; Fri, 10
        May 2019 07:28:56 +0100 (BST)
Received: from [106.120.50.25] (unknown [106.120.50.25]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190510062856eusmtip233e05796e5cbf6f880d73d52050229b8~dPnktODJt2607426074eusmtip2R;
        Fri, 10 May 2019 06:28:56 +0000 (GMT)
Subject: Re: [PATCH 1/4] usb: xhci: add Immediate Data Transfer support
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <d5076a1a-b20e-8779-c38e-6bee0007b743@samsung.com>
Date:   Fri, 10 May 2019 08:28:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b4e49d68-a94e-f6fb-6439-78ef0ff898ef@linux.intel.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEKsWRmVeSWpSXmKPExsWy7djP87qaUldjDN62SFk0L17PZnH+/AZ2
        ixnn9zFZLFrWymzx+kMTi8W2WcvZHNg8Nq3qZPOYdzLQY//cNewem09Xe3zeJBfAGsVlk5Ka
        k1mWWqRvl8CVMXfhLtaCZYEVP06cZ2tgnOjaxcjJISFgItH+qYmli5GLQ0hgBaPE36btrCAJ
        IYEvjBIznyVA2J8ZJaYtKu1i5ABreLyaFaJ+OaPEg2NbGSGct4wSb5YcYwdpEBZwl1gz7S0z
        SEJEoIFRYu+2BmaQBLNAvcTHy3fBNrAJGEp0ve1iA7F5BewkGibtYASxWQRUJZ4te8UIsk1U
        IEZi0WeoEkGJkzOfsIDYnALOEsd2f2GEGCkv0bx1NtR4cYlbT+YzgeyVEFjGLvF7/052iDdd
        JK7cPsQGYQtLvDq+BSouI3F6cg8LREMzo8TDc2vZIZweRonLTTMYIaqsJQ4fv8gKchGzgKbE
        +l36EGFHifWT7jNDgoVP4sZbQYgj+CQmbZsOFeaV6GgTgqhWk5h1fB3c2oMXLjFPYFSaheS1
        WUjemYXknVkIexcwsqxiFE8tLc5NTy02zkst1ytOzC0uzUvXS87P3cQITDmn/x3/uoNx35+k
        Q4wCHIxKPLwW/FdihFgTy4orcw8xSnAwK4nwFukAhXhTEiurUovy44tKc1KLDzFKc7AoifNW
        MzyIFhJITyxJzU5NLUgtgskycXBKNTDODqu4KF5R+rWmrD314YrMrUb7+X9znHkSezT5akGH
        o2nYWS+Rp5Nk1+z43pvTIltW53lgxQo3Z8XVoUaiwi8Zz5/6nvD857tSuy/JdveKW7OXKufM
        K3jsyxHB9S5+fUn6juSDJi/sHh0tPMtpxhgkffuCwJMX605dSMqc/iWgUPyB8UWPtP1KLMUZ
        iYZazEXFiQCkzuJ9NQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRmVeSWpSXmKPExsVy+t/xe7oaUldjDHqvaVo0L17PZnH+/AZ2
        ixnn9zFZLFrWymzx+kMTi8W2WcvZHNg8Nq3qZPOYdzLQY//cNewem09Xe3zeJBfAGqVnU5Rf
        WpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CXMXfhLtaCZYEV
        P06cZ2tgnOjaxcjBISFgIvF4NWsXIyeHkMBSRonGtYogtoSAjMTJaQ2sELawxJ9rXWwQNa8Z
        JdqaLUFsYQF3iTXT3jJ3MXJxiAg0MErM+vAFrIhZoF6iZfJaNpCEkMBxZokXS96AJdgEDCW6
        3kJM4hWwk2iYtIMRxGYRUJV4tuwVmC0qECNxYuoWdogaQYmTM5+wgNicAs4Sx3Z/YYRYYCYx
        b/NDZghbXqJ562woW1zi1pP5TBMYhWYhaZ+FpGUWkpZZSFoWMLKsYhRJLS3OTc8tNtIrTswt
        Ls1L10vOz93ECIyybcd+bgG69V3wIUYBDkYlHl4L/isxQqyJZcWVuYcYJTiYlUR4i3SAQrwp
        iZVVqUX58UWlOanFhxhNgZ6byCwlmpwPTAB5JfGGpobmFpaG5sbmxmYWSuK8HQIHY4QE0hNL
        UrNTUwtSi2D6mDg4pRoYy6UjNununxLyQ9fMfMp8+8vpBctPz/PumvW/VCvH8pyC9NJEU5eZ
        trIHJlW79C/YELnqhG2sM5PfzULDdQtmbbfplgr8xD/9tvAFgT6GJ8oXX4fePb36Ushnn211
        d15cNN64x6FaQJLxYv4NNYdE41vacopCrRkKC/I6wu+w6EQFzdcN51mkxFKckWioxVxUnAgA
        nnZA6MgCAAA=
X-CMS-MailID: 20190510062856eucas1p1ff947fd59e085888b36a39366c3021c5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190509103220eucas1p1330f2827916b55e05b1b791504963630
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190509103220eucas1p1330f2827916b55e05b1b791504963630
References: <1556285012-28186-1-git-send-email-mathias.nyman@linux.intel.com>
        <1556285012-28186-2-git-send-email-mathias.nyman@linux.intel.com>
        <CGME20190509103220eucas1p1330f2827916b55e05b1b791504963630@eucas1p1.samsung.com>
        <bc747768-7457-0df6-f57e-4aeac9c8bf0c@samsung.com>
        <3fe85fcc-a202-f746-6cd6-d3f5523348f8@linux.intel.com>
        <a369ba3931e3df113101ce9e52634e5c2ef0b957.camel@suse.de>
        <b4e49d68-a94e-f6fb-6439-78ef0ff898ef@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mathias,

On 2019-05-09 17:10, Mathias Nyman wrote:
> On 9.5.2019 14.51, Nicolas Saenz Julienne wrote:
>> On Thu, 2019-05-09 at 14:40 +0300, Mathias Nyman wrote:
>>> On 9.5.2019 13.32, Marek Szyprowski wrote:
>>>> Dear All,
>>>>
>>>> On 2019-04-26 15:23, Mathias Nyman wrote:
>>>>> From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
>>>>>
>>>>> Immediate data transfers (IDT) allow the HCD to copy small chunks of
>>>>> data (up to 8bytes) directly into its output transfer TRBs. This 
>>>>> avoids
>>>>> the somewhat expensive DMA mappings that are performed by default on
>>>>> most URBs submissions.
>>>>>
>>>>> In the case an URB was suitable for IDT. The data is directly copied
>>>>> into the "Data Buffer Pointer" region of the TRB and the IDT flag is
>>>>> set. Instead of triggering memory accesses the HC will use the data
>>>>> directly.
>>>>>
>>>>> The implementation could cover all kind of output endpoints. Yet
>>>>> Isochronous endpoints are bypassed as I was unable to find one that
>>>>> matched IDT's constraints. As we try to bypass the default DMA 
>>>>> mappings
>>>>> on URB buffers we'd need to find a Isochronous device with an
>>>>> urb->transfer_buffer_length <= 8 bytes.
>>>>>
>>>>> The implementation takes into account that the 8 byte buffers 
>>>>> provided
>>>>> by the URB will never cross a 64KB boundary.
>>>>>
>>>>> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
>>>>> Reviewed-by: Felipe Balbi <felipe.balbi@linux.intel.com>
>>>>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>>>>
>>>> I've noticed that this patch causes regression on various Samsung 
>>>> Exynos
>>>> 5420/5422/5800 boards, which have USB3.0 host ports provided by
>>>> DWC3/XHCI hardware module. The regression can be observed with ASIX 
>>>> USB
>>>> 2.0 ethernet dongle, which stops working after applying this patch 
>>>> (eth0
>>>> interface is registered, but no packets are transmitted/received). 
>>>> I can
>>>> provide more debugging information or do some tests, just let me know
>>>> what do you need. Reverting this commit makes ASIX USB ethernet dongle
>>>> operational again.
>>>>
>>>
>>> Thanks for reporting.
>>>
>>> Would it be possible to check if your ASIX ethernet dongle works on 
>>> some
>>> desktop/laptop setup with this same IDT patch?
>>>
>>> Also Exynos xhci traces could help, they would show the content of 
>>> the TRBs
>>> using IDT.
>>> Maybe byte order gets messed up?
>>>
>>> Take traces with:
>>>
>>> mount -t debugfs none /sys/kernel/debug
>>> echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
>>> echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
>>>
>>> <connect ASIX eth dongle, try to use it>
>>>
>>> send /sys/kernel/debug/tracing/trace content to me
>>>
>>> If we can't get this fixed I'll revert the IDT patch
>>
>> Hi Matthias, thanks for your help.
>>
>> I'll also be looking into it, so please send me the logs too.
>>
>
> Got the logs off list, thanks
>
> The "Buffer" data in Control transfer Data stage look suspicious.
>
> grep "flags I:" trace_fail  | grep Data
> kworker/0:2-124   [000] d..1    63.092399: xhci_queue_trb: CTRL: 
> Buffer 0000000018b65000 length 6 TD size 0 intr 0 type 'Data Stage' 
> flags I:i:c:s:i:e:C
> ifconfig-1429  [005] d..1    93.181231: xhci_queue_trb: CTRL: Buffer 
> 0000000018b65000 length 6 TD size 0 intr 0 type 'Data Stage' flags 
> I:i:c:s:i:e:C
> ifconfig-1429  [007] dn.2    93.182050: xhci_queue_trb: CTRL: Buffer 
> 0000000000000000 length 8 TD size 0 intr 0 type 'Data Stage' flags 
> I:i:c:s:i:e:C
> ifconfig-1429  [007] d..2    93.182499: xhci_queue_trb: CTRL: Buffer 
> 0000000080000000 length 8 TD size 0 intr 0 type 'Data Stage' flags 
> I:i:c:s:i:e:C
> ifconfig-1429  [007] d..2    93.182736: xhci_queue_trb: CTRL: Buffer 
> 0000000080000000 length 8 TD size 0 intr 0 type 'Data Stage' flags 
> I:i:c:s:i:e:C
> kworker/0:3-1409  [000] d..3    93.382630: xhci_queue_trb: CTRL: 
> Buffer 0000000080000000 length 8 TD size 0 intr 0 type 'Data Stage' 
> flags I:i:c:s:i:e:C
>
> First guess would be that in case URB has URB_NO_TRANSFER_DMA_MAP set 
> then data
> will be mapped and urb->transfer_dma is already set.
> The IDT patch uses urb->trabfer_dma as a temporary buffer, and copies the
> urb->transfer_buffer there.
> if transfer buffer is already dma mapped the urb->transfer_buffer can 
> be garbage,
> (shouldn't, but it can be)
>
> Below code avoids IDT if URB_NO_TRANSFER_DMA_MAP is set, and doesn't 
> touch
> urb->transfer_dma (patch attached)
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index fed3385..f080054 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -3423,11 +3423,14 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, 
> gfp_t mem_flags,
>
>         if (urb->transfer_buffer_length > 0) {
>                 u32 length_field, remainder;
> +               u64 addr;
>
>                 if (xhci_urb_suitable_for_idt(urb)) {
> -                       memcpy(&urb->transfer_dma, urb->transfer_buffer,
> +                       memcpy(&addr, urb->transfer_buffer,
>                                urb->transfer_buffer_length);
>                         field |= TRB_IDT;
> +               } else {
> +                       addr = (u64) urb->transfer_dma;
>                 }
>
>                 remainder = xhci_td_remainder(xhci, 0,
> @@ -3440,8 +3443,8 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, 
> gfp_t mem_flags,
>                 if (setup->bRequestType & USB_DIR_IN)
>                         field |= TRB_DIR_IN;
>                 queue_trb(xhci, ep_ring, true,
> - lower_32_bits(urb->transfer_dma),
> - upper_32_bits(urb->transfer_dma),
> +                               lower_32_bits(addr),
> +                               upper_32_bits(addr),
>                                 length_field,
>                                 field | ep_ring->cycle_state);
>         }
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index a450a99..7f8b950 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -2160,7 +2160,8 @@ static inline bool 
> xhci_urb_suitable_for_idt(struct urb *urb)
>  {
>         if (!usb_endpoint_xfer_isoc(&urb->ep->desc) && 
> usb_urb_dir_out(urb) &&
>             usb_endpoint_maxp(&urb->ep->desc) >= TRB_IDT_MAX_SIZE &&
> -           urb->transfer_buffer_length <= TRB_IDT_MAX_SIZE)
> +           urb->transfer_buffer_length <= TRB_IDT_MAX_SIZE &&
> +           !(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP))
>                 return true;
>
>         return false;
>
 > If that doesn't help, then it's possible DATA trbs in control 
transfer can't
> use IDT at all. IDT is supported for Normal TRBs, which have a 
> different trb
> type than DATA trbs in control transfers.
>
> Also xhci specs 4.11.7 limit IDT usage:
>
> "If the IDT flag is set in one TRB of a TD, then it shall be the only 
> Transfer
>  TRB of the TD"
>
> A whole control transfer is one TD, and it already contains a SETUP 
> transfer TRB
> which is using the IDT flag.
>
> Following disables IDT for control transfers (testpatch attached as well)
>
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index fed3385..4c1c9ad 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -3424,12 +3424,6 @@ int xhci_queue_ctrl_tx(struct xhci_hcd *xhci, 
> gfp_t mem_flags,
>         if (urb->transfer_buffer_length > 0) {
>                 u32 length_field, remainder;
>
> -               if (xhci_urb_suitable_for_idt(urb)) {
> -                       memcpy(&urb->transfer_dma, urb->transfer_buffer,
> -                              urb->transfer_buffer_length);
> -                       field |= TRB_IDT;
> -               }
> -
>                 remainder = xhci_td_remainder(xhci, 0,
>                                 urb->transfer_buffer_length,
>                                 urb->transfer_buffer_length,
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index a450a99..2e16ff7 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -2158,9 +2158,11 @@ static inline struct xhci_ring 
> *xhci_urb_to_transfer_ring(struct xhci_hcd *xhci,
>   */
>  static inline bool xhci_urb_suitable_for_idt(struct urb *urb)
>  {
> -       if (!usb_endpoint_xfer_isoc(&urb->ep->desc) && 
> usb_urb_dir_out(urb) &&
> +       if (!usb_endpoint_xfer_control(&urb->ep->desc) &&
> +           !usb_endpoint_xfer_isoc(&urb->ep->desc) && 
> usb_urb_dir_out(urb) &&
>             usb_endpoint_maxp(&urb->ep->desc) >= TRB_IDT_MAX_SIZE &&
> -           urb->transfer_buffer_length <= TRB_IDT_MAX_SIZE)
> +           urb->transfer_buffer_length <= TRB_IDT_MAX_SIZE &&
> +           !(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP))
>                 return true;
>
>         return false;
>
> -Mathias


Thanks for the patches to test! Both patches applied separately (without 
the other one) fixes the issue with ASIX USB dongle, but from the 
discussion I assume that the first one 
(0001-xhci-don-t-use-IDT-transfer-buffer-is-already-dma-ma.patch) really 
fixes the issue, while the second one is just a workaround.

You can add:

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

