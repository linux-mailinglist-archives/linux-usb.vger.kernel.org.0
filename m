Return-Path: <linux-usb+bounces-32307-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F646D1BE10
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 02:02:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7031A3022197
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 01:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 916531B6527;
	Wed, 14 Jan 2026 01:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RoL96ATh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2298250097D
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 01:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768352526; cv=none; b=EgYwIGfKWW8LRLJUON7dl4F3RsgyWbkBZceMkCz1kSUIRxv6xCyd34kgwjS+Fn00yglPNtukk0DWb3NvScuyjANch9YW8U4UWC1F7CgELot0WNPa1nlFgFL4tvVA9Idghg1EwCKGeJdLC5vOz192zuI59fmYgcg/sEA/KRjx+o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768352526; c=relaxed/simple;
	bh=YjncadZVzrqakw9j1SMG3xDaXRFUsIdtHHNQTNl1qS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nxeb2TVyCZYztsXPYWEQW9MF11CJq3ccyne5uAry3OGZZJJbi1tglLbQ4a1+63FViwMQeFVX6791owVy6351Du3kXrlQRkEdGnKLx0L909PXcDNznuRKW9f/C7dOMK1X3Fwwv/K31BsSkFWplDgW//Ku5cohTkE/zb+12QXjmbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RoL96ATh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8EBC116C6;
	Wed, 14 Jan 2026 01:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768352525;
	bh=YjncadZVzrqakw9j1SMG3xDaXRFUsIdtHHNQTNl1qS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RoL96ATh61zcNlvXfIy7fwgrqQWTT5+ztdNroac/yCSXtWXagIgjg3buBt4zYMD9/
	 Kb2VPexfoPhBeMwqs/+Nx1EYwudJfbY/ZcDhuPmyEOUl/PBmloYcaua0J+hEgBzUTP
	 KR/WeEXf/cmy2BDamNePhVi4FxVbH701vaHwn6Hk5aYwQQETUKmFmxzVcZRGakAuIt
	 HIWHxMqXBqHw78QYmvh8B2E8SY0dp/kp3peeRagaOvDZoddfwNAX4ZLwcH4NsxRGvx
	 ACcJpdMKh0wVjlxvVe+J3/+c5xysg4klorIiiL6AvgHunyjDe6BPMEFL3enKuqcQe6
	 8Or+yLraJcAcw==
Date: Wed, 14 Jan 2026 09:02:02 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Mario Peter <mario.peter@leica-geosystems.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: chipidea: udc: fix DMA and SG cleanup in
 _ep_nuke()
Message-ID: <20260114010202.GB2295746@nchen-desktop>
References: <20260108165902.795354-1-mario.peter@leica-geosystems.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108165902.795354-1-mario.peter@leica-geosystems.com>

On 26-01-08 16:59:02, Mario Peter wrote:
> The ChipIdea UDC driver can encounter "not page aligned sg buffer"
> errors when a USB device is reconnected after being disconnected
> during an active transfer. This occurs because _ep_nuke() returns
> requests to the gadget layer without properly unmapping DMA buffers
> or cleaning up scatter-gather bounce buffers.
> 
> Root cause:
> When a disconnect happens during a multi-segment DMA transfer, the
> request's num_mapped_sgs field and sgt.sgl pointer remain set with
> stale values. The request is returned to the gadget driver with status
> -ESHUTDOWN but still has active DMA state. If the gadget driver reuses
> this request on reconnect without reinitializing it, the stale DMA
> state causes _hardware_enqueue() to skip DMA mapping (seeing non-zero
> num_mapped_sgs) and attempt to use freed/invalid DMA addresses,
> leading to alignment errors and potential memory corruption.
> 
> The normal completion path via _hardware_dequeue() properly calls
> usb_gadget_unmap_request_by_dev() and sglist_do_debounce() before
> returning the request. The _ep_nuke() path must do the same cleanup
> to ensure requests are returned in a clean, reusable state.
> 
> Fix:
> Add DMA unmapping and bounce buffer cleanup to _ep_nuke() to mirror
> the cleanup sequence in _hardware_dequeue():
> - Call usb_gadget_unmap_request_by_dev() if num_mapped_sgs is set
> - Call sglist_do_debounce() with copy=false if bounce buffer exists
> 
> This ensures that when requests are returned due to endpoint shutdown,
> they don't retain stale DMA mappings. The 'false' parameter to
> sglist_do_debounce() prevents copying data back (appropriate for
> shutdown path where transfer was aborted).
> 
> Signed-off-by: Mario Peter <mario.peter@leica-geosystems.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
> 
> v1: submitted (https://lore.kernel.org/linux-usb/ofw7h7s7jbhzjzbj6fpkzp5m2av25ovlyfp7fdlcvt2dd6x6a5@kx3rnlojdzdy/)
> v2:
> * dropped redundant req.num_mapped_sgs check
> * removed obsolete brackets
> 
>  drivers/usb/chipidea/udc.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 64a421ae0f05..c8d931d9d433 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -931,6 +931,13 @@ __acquires(hwep->lock)
>  		list_del_init(&hwreq->queue);
>  		hwreq->req.status = -ESHUTDOWN;
> 
> +		/* Unmap DMA and clean up bounce buffers before giving back */
> +		usb_gadget_unmap_request_by_dev(hwep->ci->dev->parent,
> +					&hwreq->req, hwep->dir);
> +
> +		if (hwreq->sgt.sgl)
> +			sglist_do_debounce(hwreq, false);
> +
>  		if (hwreq->req.complete != NULL) {
>  			spin_unlock(hwep->lock);
>  			usb_gadget_giveback_request(&hwep->ep, &hwreq->req);
> --
> 2.43.0
> 

-- 

Best regards,
Peter

