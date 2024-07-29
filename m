Return-Path: <linux-usb+bounces-12573-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B24193F756
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2024 16:11:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EBF9DB2278D
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2024 14:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21EC714F121;
	Mon, 29 Jul 2024 14:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cpNuWhk3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE6914A4F5
	for <linux-usb@vger.kernel.org>; Mon, 29 Jul 2024 14:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722262256; cv=none; b=i6Ys96m4HjAj5PNUS8zOYqkt0LxOo3MWq5dRTO5J3RxgKKhV9420r8VXHSUwcWd99uUu3ie7DpGd9kWOzQKu/rS0XlwgGkD7PSqO/BS9QiWm0BqrpV6EPm4QHUUPq+cKASX4P0zM7VBSVl+2UzDQrkqIVkhLXPDOJWoRwzJnSxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722262256; c=relaxed/simple;
	bh=s6NK9GyzqVFDVA1eGUUBC/SUiQsw5kUxApVRKrQ8kUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dtiwK9Z7vKqGFrkScmrw5dppWZDbeMBfZtQpZtu8/FgEc8D+yZIiDrRx4YMtuymsQ33gWgUwhnMel3WihMJNMTqH0bxpTUz2yI1ZvGQLLGR3jb1Y1naeTASrEOrPWxg88oN1u7jupcdPU2R1F6yDumeywzltxkfFiA+/qq9Kl+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cpNuWhk3; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722262255; x=1753798255;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=s6NK9GyzqVFDVA1eGUUBC/SUiQsw5kUxApVRKrQ8kUg=;
  b=cpNuWhk3bgvwpwjokEmLkVZZysYHd/LVG9sJHEBQ6XkQPTg+aws/nu4a
   oGtCK8/3fyrGeeg3BB51McwSwizYpv7NlvBXmo56SRFEx9e5T0IoKneYd
   yly16OxT/20UBLNQijYp0y9nB6gt+4Dko1iWmNy01VZnmBAsE1RZunVJM
   AoHFqUQBydzz0TS6nT/lqtjGmy0/OXV3Z9bzF0X759CdPc3ClaMXcn+y7
   7i3zgbabZr3BEzFpBup7fF9+EL/qX+ZWCboSdMIYBSvE/Uuu5dg4ksBxd
   IK9tOXuGL81ECsgjLoNI57oJIPzH3YryppgYWSH+VG+QNoyUIqWfgEFJ4
   w==;
X-CSE-ConnectionGUID: auJba2yrTfiLbzVylC/Gyw==
X-CSE-MsgGUID: na5oDzg3T5SUgOdo/d4ZAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="22926828"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; 
   d="scan'208";a="22926828"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 07:10:54 -0700
X-CSE-ConnectionGUID: DaVbUKi2QV2xmMhbxwbiuQ==
X-CSE-MsgGUID: 9Z6WaT5GQkWx0MR99MGw3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; 
   d="scan'208";a="58787082"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa005.jf.intel.com with ESMTP; 29 Jul 2024 07:10:52 -0700
Message-ID: <121d85fe-976a-43c4-95d2-1a066234a758@linux.intel.com>
Date: Mon, 29 Jul 2024 17:12:54 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xhci: dbc: fix handling ClearFeature Halt requests
To: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Cc: linux-usb@vger.kernel.org
References: <20240725074857.623299-1-ukaszb@chromium.org>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20240725074857.623299-1-ukaszb@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

On 25.7.2024 10.48, Łukasz Bartosik wrote:
> DbC driver does not handle ClearFeature Halt requests correctly
> which in turn may lead to dropping packets on the receive path.

Nice catch.
Looks like a halted endpoint is treated almost as a disconnect.

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

Stall errors (Line 1 and 2) events are probably issued already when endpoint halts,
before the host responds with a ClearFeature(Halt) request.

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
> Changes v2->v1:
> - Documented both xhci_dbc_flush_single_request and
> xhci_dbc_flush_endpoint_requests functions.
> ---
>   drivers/usb/host/xhci-dbgcap.c | 48 +++++++++++++++++++++++++++-------
>   drivers/usb/host/xhci-dbgtty.c |  5 ++++
>   2 files changed, 43 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
> index 872d9cddbcef..36ec3242e096 100644
> --- a/drivers/usb/host/xhci-dbgcap.c
> +++ b/drivers/usb/host/xhci-dbgcap.c
> @@ -173,7 +173,17 @@ static void xhci_dbc_giveback(struct dbc_request *req, int status)
>   	spin_lock(&dbc->lock);
>   }
>   
> -static void xhci_dbc_flush_single_request(struct dbc_request *req)
> +/**
> + * xhci_dbc_flush_single_request - flushes single request
> + * @req: request to flush
> + * @status: 0 or -ERESTART - after the request is flushed it will be queued
> + *          back to the endpoint
> + *
> + *          -ESHUTDOWN - after the request is flushed it won't be queued back
> + *          to the endpoint and if it was last endpoint's request the endpoint
> + *          will stay shut
> + */

Hmm, I need to dig into this.

I don't think we should push this problem up to the request completion handler.
Maybe we are flushing requests that should not be flushed?

Do you have an easy way to reproduce the stall error case?

Thanks
-Mathias

