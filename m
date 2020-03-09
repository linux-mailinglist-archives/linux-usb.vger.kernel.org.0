Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F60B17E1BA
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2020 14:55:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgCINzX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Mar 2020 09:55:23 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:38306 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbgCINzX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Mar 2020 09:55:23 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 029DtIPs108459;
        Mon, 9 Mar 2020 08:55:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1583762118;
        bh=nDBAlUhcSYBKIaek9S1ySWQkNuPZQhpRQxOxLs4U7cE=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=V8BRRqr6EvVSnOntUmqDr4NLvCn+zNh9LErK5iKjxYPVCxLV9OVsGN5N+t+Lwe+6O
         g8UuXQHrPFlkG/t6/KucVXFIwNBqWRo1VTpcUfGdp7MtU5p+PqD86rPeQ37QekXQPG
         B63coBjq83kycoNHCK75JePHvc+mdSbkm7ykdWRE=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 029DtIrN033581;
        Mon, 9 Mar 2020 08:55:18 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 9 Mar
 2020 08:55:18 -0500
Received: from localhost.localdomain (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 9 Mar 2020 08:55:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 029DtHbS087470;
        Mon, 9 Mar 2020 08:55:17 -0500
Date:   Mon, 9 Mar 2020 09:01:06 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Mans Rullgard <mans@mansr.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: musb: fix crash with highmen PIO and usbmon
Message-ID: <20200309140106.GA31115@iaqt7>
Mail-Followup-To: Bin Liu <b-liu@ti.com>, Mans Rullgard <mans@mansr.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200307130720.16652-1-mans@mansr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200307130720.16652-1-mans@mansr.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mans,

On Sat, Mar 07, 2020 at 01:07:20PM +0000, Mans Rullgard wrote:
> When handling a PIO bulk transfer with highmem buffer, a temporary
> mapping is assigned to urb->transfer_buffer.  After the transfer is
> complete, an invalid address is left behind in this pointer.  This is
> not ordinarily a problem since nothing touches that buffer before the
> urb is released.  However, when usbmon is active, usbmon_urb_complete()
> calls (indirectly) mon_bin_get_data() which does access the transfer
> buffer if it is set.  To prevent an invalid memory access here, reset
> urb->tranfer_buffer to NULL when finished.
> 
> Fixes: 8e8a55165469 ("usb: musb: host: Handle highmem in PIO mode")
> Signed-off-by: Mans Rullgard <mans@mansr.com>

Thanks for fixing the bug.

> ---
>  drivers/usb/musb/musb_host.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
> index 1c813c37462a..b67b40de1947 100644
> --- a/drivers/usb/musb/musb_host.c
> +++ b/drivers/usb/musb/musb_host.c
> @@ -1459,8 +1459,10 @@ void musb_host_tx(struct musb *musb, u8 epnum)
>  	qh->segsize = length;
>  
>  	if (qh->use_sg) {
> -		if (offset + length >= urb->transfer_buffer_length)
> +		if (offset + length >= urb->transfer_buffer_length) {
>  			qh->use_sg = false;
> +			urb->transfer_buffer = NULL;
> +		}

In this tx case, can you directly pass qh->sg_miter.addr to
musb_write_fifo() so that urb->transfer_buffer is not touched at all?

-Bin.
