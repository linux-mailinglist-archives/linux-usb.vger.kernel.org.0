Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C82210749B
	for <lists+linux-usb@lfdr.de>; Fri, 22 Nov 2019 16:11:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbfKVPLF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 22 Nov 2019 10:11:05 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:33075 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbfKVPLF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Nov 2019 10:11:05 -0500
Received: from mail-pg1-f197.google.com ([209.85.215.197])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1iYAaN-0007As-11
        for linux-usb@vger.kernel.org; Fri, 22 Nov 2019 15:11:03 +0000
Received: by mail-pg1-f197.google.com with SMTP id u8so4043791pgl.4
        for <linux-usb@vger.kernel.org>; Fri, 22 Nov 2019 07:11:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=qkB6AbE907XpVgdpESoP4CNG4PJ+o+uogInoHk0U4Hs=;
        b=DdL2D3VUztYohw3QkIGPjia1T3xe1+yphdY1pR5ehd3y52PinVGutjXXAgTn+RgzHW
         VM+0KTgTLX5qqoBr9BSC2m5XIzIVUl9a3W4g5SQOzHZaoaxh5mjD42XMRuhkqz0bCpcy
         ZdrhfJbYGPpYzyC6ERtjM3LHTVEc/IjgTzYNCGooacCqIarrQ6C+vsnJvszlgJ4a4Mgg
         Dt2AXALvQeRCc6wGAGGwiJQaIdDu2ff6IcjBG5AVp5iA+/h5vL+RMfc/+nqCHjKXffFW
         7f4dQEFJ8lhfqmUo9YjdI6rG+8RYcYwvg5KT6Qg5H5PkC/ye9aY3Bk5iBy3QtpXpjUr8
         Rl7w==
X-Gm-Message-State: APjAAAVVh4PoUeFIBcmDpNSzICxEZHVX018K1WK+ZJBT9TopEZ/E5YDa
        aO4zsToBq+0A/pgrYhpu7vT8mCsO12smA3xyhwU7v+eJAzaGOQBfGxHL5jN5axYFEpL6iADJp9R
        ScZiTdP7eWUBjOzq5jTG8hYylX4ZrW4i0/S+tvw==
X-Received: by 2002:aa7:9f89:: with SMTP id z9mr18510220pfr.123.1574435461685;
        Fri, 22 Nov 2019 07:11:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqxMX5SshWBdgscTDd4hE1lsIQJmQ3SGSboZ20e6AVMAsclKG1g7dazYpE2FBs50MliytPM4AA==
X-Received: by 2002:aa7:9f89:: with SMTP id z9mr18510183pfr.123.1574435461280;
        Fri, 22 Nov 2019 07:11:01 -0800 (PST)
Received: from 2001-b011-380f-3c42-fdb3-9820-72e8-2639.dynamic-ip6.hinet.net (2001-b011-380f-3c42-fdb3-9820-72e8-2639.dynamic-ip6.hinet.net. [2001:b011:380f:3c42:fdb3:9820:72e8:2639])
        by smtp.gmail.com with ESMTPSA id t15sm7437334pgb.0.2019.11.22.07.10.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Nov 2019 07:11:00 -0800 (PST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: ERROR Transfer event TRB DMA ptr not part of current TD ep_index
 2 comp_code 13
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <23a9798e-704f-3444-42e2-e583a6991950@linux.intel.com>
Date:   Fri, 22 Nov 2019 23:10:55 +0800
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        USB list <linux-usb@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <F6AF08A8-8532-4A58-AE33-C1B02CBDC993@canonical.com>
References: <F9C894A9-D1D8-455E-B5F6-C5EA08A80C79@canonical.com>
 <4552b779-4b5a-7e81-39ec-0a4229b5d84d@linux.intel.com>
 <871B8184-D636-4F02-B9E9-B13A8BE078E8@canonical.com>
 <23a9798e-704f-3444-42e2-e583a6991950@linux.intel.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
X-Mailer: Apple Mail (2.3601.0.10)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> On Nov 22, 2019, at 20:17, Mathias Nyman <mathias.nyman@linux.intel.com> wrote:

[snipped]

> 
> The event ring is already overwritten with new events when dumped.
> 
> Could you apply the code below, it will dump both the endpoint transfer ring
> and the event ring at the right moment:

The log is quite large so I pasted it here:
https://pastebin.ubuntu.com/p/wWpS8ctNrb/

Kai-Heng

> 
> Attached as a patch as well.
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 620846f30b4f..a1a9a408c479 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -201,6 +201,31 @@ void inc_deq(struct xhci_hcd *xhci, struct xhci_ring *ring)
>  * @more_trbs_coming:  Will you enqueue more TRBs before calling
>  *                     prepare_transfer()?
>  */
> +
> +static int xhci_dump_ring(struct xhci_hcd *xhci, struct xhci_ring *ring)
> +{
> +       struct xhci_segment     *seg;
> +       dma_addr_t              dma;
> +       union xhci_trb          *trb;
> +       int                     i, j;
> +
> +       seg = ring->first_seg;
> +
> +       for (i = 0; i < ring->num_segs; i++) {
> +               for (j = 0; j < TRBS_PER_SEGMENT; j++) {
> +                       trb = &seg->trbs[j];
> +                       dma = seg->dma + j * sizeof(*trb);
> +                       xhci_err(xhci, "%pad: %s\n", &dma,
> +                                xhci_decode_trb(le32_to_cpu(trb->generic.field[0]),
> +                                                le32_to_cpu(trb->generic.field[1]),
> +                                                le32_to_cpu(trb->generic.field[2]),
> +                                                le32_to_cpu(trb->generic.field[3])));
> +               }
> +               seg = seg->next;
> +       }
> +       return 0;
> +}
> +
> static void inc_enq(struct xhci_hcd *xhci, struct xhci_ring *ring,
>                        bool more_trbs_coming)
> {
> @@ -2318,6 +2343,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
>        u32 trb_comp_code;
>        int td_num = 0;
>        bool handling_skipped_tds = false;
> +       static unsigned int err_cnt;
>         slot_id = TRB_TO_SLOT_ID(le32_to_cpu(event->flags));
>        ep_index = TRB_TO_EP_ID(le32_to_cpu(event->flags)) - 1;
> @@ -2579,6 +2605,12 @@ static int handle_tx_event(struct xhci_hcd *xhci,
>                                trb_in_td(xhci, ep_ring->deq_seg,
>                                          ep_ring->dequeue, td->last_trb,
>                                          ep_trb_dma, true);
> +                               if (err_cnt++ == 5) {
> +                                       xhci_err(xhci, "EVENT RING:\n");
> +                                       xhci_dump_ring(xhci, xhci->event_ring);
> +                                       xhci_err(xhci, "ENDPOINT RING:\n");
> +                                       xhci_dump_ring(xhci, ep_ring);
> +                               }
>                                return -ESHUTDOWN;
>                        }
> <0001-xhci-dump-event-ring-and-endpoint-ring-if-TRB-not-fo.patch>

