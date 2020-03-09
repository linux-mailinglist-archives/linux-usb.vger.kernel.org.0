Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1482A17E100
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2020 14:24:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgCINYz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Mar 2020 09:24:55 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:48472 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726384AbgCINYy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Mar 2020 09:24:54 -0400
X-IronPort-AV: E=Sophos;i="5.70,533,1574118000"; 
   d="scan'208";a="439491679"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Mar 2020 14:24:52 +0100
Date:   Mon, 9 Mar 2020 14:24:52 +0100 (CET)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To:     Payal Kshirsagar <payalskshirsagar1234@gmail.com>
cc:     manishc@marvell.com, GR-Linux-NIC-Dev@marvell.com,
        gregkh@linuxfoundation.org, outreachy-kernel@googlegroups.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/3] [Outreachy kernel] staging: qlge: qlge.h: add spaces
 around operators
In-Reply-To: <3a471ee901679659280d420549610b12e9efcdf6.1583759118.git.payalskshirsagar1234@gmail.com>
Message-ID: <alpine.DEB.2.21.2003091424150.4721@hadrien>
References: <cover.1583759118.git.payalskshirsagar1234@gmail.com> <3a471ee901679659280d420549610b12e9efcdf6.1583759118.git.payalskshirsagar1234@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On Mon, 9 Mar 2020, Payal Kshirsagar wrote:

> Add spaces around operators cleanup reported by checkpatch.

This is too much for one sentence.

Add spaces around operators.  Cleanup suggested by checkpatch.

julia

>
> Signed-off-by: Payal Kshirsagar <payalskshirsagar1234@gmail.com>
> ---
>  drivers/staging/qlge/qlge.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/qlge/qlge.h b/drivers/staging/qlge/qlge.h
> index 66641edff6b5..4ef8dae3d7a0 100644
> --- a/drivers/staging/qlge/qlge.h
> +++ b/drivers/staging/qlge/qlge.h
> @@ -59,7 +59,7 @@
>  #define MAX_CQ 128
>  #define DFLT_COALESCE_WAIT 100	/* 100 usec wait for coalescing */
>  #define MAX_INTER_FRAME_WAIT 10	/* 10 usec max interframe-wait for coalescing */
> -#define DFLT_INTER_FRAME_WAIT (MAX_INTER_FRAME_WAIT/2)
> +#define DFLT_INTER_FRAME_WAIT (MAX_INTER_FRAME_WAIT / 2)
>  #define UDELAY_COUNT 3
>  #define UDELAY_DELAY 100
>
> @@ -1367,7 +1367,7 @@ struct tx_ring_desc {
>  	struct tx_ring_desc *next;
>  };
>
> -#define QL_TXQ_IDX(qdev, skb) (smp_processor_id()%(qdev->tx_ring_count))
> +#define QL_TXQ_IDX(qdev, skb) (smp_processor_id() % (qdev->tx_ring_count))
>
>  struct tx_ring {
>  	/*
> @@ -1792,7 +1792,7 @@ struct ql_reg_dump {
>
>  	/* segment 34 */
>  	struct mpi_coredump_segment_header ets_seg_hdr;
> -	u32 ets[8+2];
> +	u32 ets[8 + 2];
>  };
>
>  struct ql_mpi_coredump {
> --
> 2.17.1
>
> --
> You received this message because you are subscribed to the Google Groups "outreachy-kernel" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to outreachy-kernel+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/outreachy-kernel/3a471ee901679659280d420549610b12e9efcdf6.1583759118.git.payalskshirsagar1234%40gmail.com.
>
