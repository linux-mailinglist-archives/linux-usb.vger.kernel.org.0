Return-Path: <linux-usb+bounces-12331-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6BB93928E
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jul 2024 18:31:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 391DF2825FF
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jul 2024 16:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA15316E886;
	Mon, 22 Jul 2024 16:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NgLHbLld"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5090726ACD
	for <linux-usb@vger.kernel.org>; Mon, 22 Jul 2024 16:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721665875; cv=none; b=ei7Wgmv4uASdnxdquNHktY1aVUlafmOOFMA1rxKETYF5Qn0WjMt5r5OQieNTXlxpamY40HNTCreCmFum21p+yqK3sotrAbcH7qHOI9tIq2bGCsws4d7+pLhXzfb172hep/d15Dd39YQ6xVX6Iji3GnZ7h+5OVX/+kYLVGrFHYHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721665875; c=relaxed/simple;
	bh=bNE3bDKxb7FLWhqaPbW7aSgauEkphHIZ08lYe/lEQ2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PX4z6pZI+485h9BqnJtdnW0pQe3eFQXf5eF2TZMmXpQisiCRYJJLEzn3z3Kmdi1MqeB0M/cfJeZY+W+t3hWcndarNSefIKXGxpvSiZeO4u0pxJ427owV/RSNTyffvZ7HSzHEQm+3seld7RFmFhSncBKUSoVPHnFPV1lovQ6tdqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NgLHbLld; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D52C116B1;
	Mon, 22 Jul 2024 16:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721665874;
	bh=bNE3bDKxb7FLWhqaPbW7aSgauEkphHIZ08lYe/lEQ2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NgLHbLldH+dDkmIOotyfj1+jXz2iFiQW0mirQzwdwYGwfP5eBn2BhV0vztKPY0CN4
	 HQLaE1m7Hk2EfHWYiPgRWe7lpxsS5YiNggzjsLlZ5u4p7kdUqrQwBWvSXIclfje84B
	 Lpcme16/6EW9vDX0QU4agCmDmpFtBn8HggoTMzFM=
Date: Mon, 22 Jul 2024 18:31:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Lu Baolu <baolu.lu@linux.intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v1] xhci: dbc: fix handling ClearFeature Halt requests
Message-ID: <2024072255-grass-monastery-c7db@gregkh>
References: <20240722150738.61486-1-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240722150738.61486-1-ukaszb@chromium.org>

On Mon, Jul 22, 2024 at 03:07:38PM +0000, Łukasz Bartosik wrote:
> DbC driver does not handle ClearFeature Halt requests correctly
> which in turn may lead to dropping packets on the receive path.
> 
> Below is a trace capture where due to incorrect handling of
> ClearFeature Halt packet gets dropped on the receive path.
> 
> /sys/kernel/debug/tracing # cat trace
> 1) kworker/10:3-514   [010] d..1.  2925.601843: xhci_dbc_handle_event:
> 	EVENT: TRB 000000019588c0e0 status 'Stall Error' len 0 slot 1 ep 2
> 	type 'Transfer Event' flags e:C
> 
> 2) kworker/10:3-514   [010] d..1.  2925.613285: xhci_dbc_handle_event:
> 	EVENT: TRB 000000019588bc80 status 'Stall Error' len 1024 slot 1
> 	ep 3 type 'Transfer Event' flags e:C
> 
> 3) kworker/10:3-514   [010] d..1.  2925.619024: xhci_dbc_handle_transfer:
> 	BULK: Buffer 0000000244b49800 length 1024 TD size 0 intr 0 type
> 	'Normal' flags b:i:I:c:s:i:e:C
> 
> 4) kworker/10:3-514   [010] d..1.  2925.619025: xhci_dbc_giveback_request:
> 	bulk-in: req 00000000a70b5ad2 length 0/1024 ==> -6
> 
> 5) kworker/10:3-514   [010] dNs2.  2925.623820: xhci_dbc_gadget_ep_queue:
> 	BULK: Buffer 0000000244b49800 length 1024 TD size 0 intr 0 type
> 	'Normal' flags b:i:I:c:s:i:e:c
> 
> 6) kworker/10:3-514   [010] dNs1.  2925.623823: xhci_dbc_queue_request:
> 	bulk-in: req 00000000a70b5ad2 length 0/1024 ==> -115
> 
> 7) kworker/10:3-514   [010] d..1.  2925.629865: xhci_dbc_handle_event:
> 	EVENT: TRB 000000019588bc80 status 'Short Packet' len 1000 slot 1
> 	ep 3 type 'Transfer Event' flags e:C
> 
> 8) kworker/10:3-514   [010] d..1.  2925.635540: xhci_dbc_handle_event:
> 	EVENT: TRB 000000019588bc90 status 'Short Packet' len 763 slot 1
> 	ep 3 type 'Transfer Event' flags e:C
> 
> 9) kworker/10:3-514   [010] d..1.  2925.635540: xhci_dbc_handle_transfer:
> 	BULK: Buffer 0000000244b49c00 length 1024 TD size 0 intr 0 type
> 	'Normal' flags b:i:I:c:s:i:e:C
> 
> 10) kworker/10:3-514  [010] d..1.  2925.635541: xhci_dbc_giveback_request:
> 	bulk-in: req 00000000b4ec77d7 length 261/1024 ==> 0
> 
> 11) kworker/10:3-514  [010] dNs2.  2925.635561: xhci_dbc_gadget_ep_queue:
> 	BULK: Buffer 0000000244b49c00 length 1024 TD size 0 intr 0 type
> 	'Normal' flags b:i:I:c:s:i:e:c
> 
> 12) kworker/10:3-514  [010] dNs1.  2925.635562: xhci_dbc_queue_request:
> 	bulk-in: req 00000000b4ec77d7 length 0/1024 ==> -115
> 
> Lines 1 and 2 are Endpoints OUT and IN responses to receiving ClearFeature
> Halt requests.
> 
> Line 7 notifies of reception of 24 bytes packet.
> 
> Line 8 notifies of reception of 261 bytes packet
> 
> In Lines [9, 12] 261 bytes packet is being processed.
> 
> However 24 bytes packet gets dropped. The kernel log includes entry which
> is an indication of a packet drop:
> [  127.651845] xhci_hcd 0000:00:0d.0: no matched request
> 
> This fix adds correct handling of ClearFeature Halt requests
> by restarting an endpoint which received the request.
> 
> Fixes: dfba2174dc42 ("usb: xhci: Add DbC support in xHCI driver")
> Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
> ---
>  drivers/usb/host/xhci-dbgcap.c | 29 +++++++++++++++++++----------
>  drivers/usb/host/xhci-dbgtty.c |  5 +++++
>  2 files changed, 24 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
> index 872d9cddbcef..b7af3a5ac98a 100644
> --- a/drivers/usb/host/xhci-dbgcap.c
> +++ b/drivers/usb/host/xhci-dbgcap.c
> @@ -173,7 +173,7 @@ static void xhci_dbc_giveback(struct dbc_request *req, int status)
>  	spin_lock(&dbc->lock);
>  }
>  
> -static void xhci_dbc_flush_single_request(struct dbc_request *req)
> +static void xhci_dbc_flush_single_request(struct dbc_request *req, int status)


So now we need to look up what "status" is here for every place this is
called?  That's going to be a pain, as you didn't even document it :(

thanks,

greg k-h

