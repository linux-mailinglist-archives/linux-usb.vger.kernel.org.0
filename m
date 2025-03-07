Return-Path: <linux-usb+bounces-21492-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3802DA5628B
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 09:27:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A7423B2E36
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 08:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD1CD1B87D5;
	Fri,  7 Mar 2025 08:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YsidFoWb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3731B4132
	for <linux-usb@vger.kernel.org>; Fri,  7 Mar 2025 08:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741336031; cv=none; b=FkPO4LUzo2VfAgGVdJscSgFbLwIzVmzGlihOv2LOnyEPwpNfqQk27ZLxhMRUb6QiaiNGqxy/nIG6MRkXVR7bTov45DuN4xuZWckKNkc6SMMBUnJNTDNymm+QIUIVgBWjFMmFe3mWf0agKyWOI2Q2Iz53AtmTHxkhz53Xyb/7NTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741336031; c=relaxed/simple;
	bh=q8F2ualV/Gs0pBgGaNdeDmX5t+TybQsqXloU0whBe04=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type; b=ghhiB+6XXFZy9bovZTdU2iSET25I84LD8WV4v4GbmclalnOhbPuP3zEWQrphQb8REx55Mc9Iv+vsGgOHnznteRv01BtjnOjgRXZeZQ1MmKlzW9GeQfnY3fONqG2XvhP7ZCWAH5wkdfRnIpN1Ut4KhLv9r6MSY2XuwWYYPnrcUC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YsidFoWb; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aaec111762bso293208266b.2
        for <linux-usb@vger.kernel.org>; Fri, 07 Mar 2025 00:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741336027; x=1741940827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4rUvV5lG1/BEopDqWnNjNsKSp87AcF+SnPTen6X6ik8=;
        b=YsidFoWb5do/SznTPogA6h4GBqBiFTzQkqeDmWw+AZss0k44XJt7bTDtDpeAfOzqQo
         rknVMe/xtEZevyUdw2/iLzn5cA+9XAqj1XdHwxL9L5ghdkFscFljN8Lb4vA3ZGnjemg3
         i+qddMo+QjYUms/Om3r7HSvg6J+cTHiqVeNLNWOxASimw5T+ZBZHErv9d82Wo65G/btU
         VP7rj2ZIrp+VQOwrcs9Ti1EF6gc9DiE5Lxin1M97MLz4Pzyp0gJ8EwZnqPzo+217m2xY
         8/vtdDFYLW9bRYcCILxert/gwgeStr7AS3JfDb2JML1aNmxuGKu8I8EZu/SVhbLaEfVP
         xjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741336027; x=1741940827;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rUvV5lG1/BEopDqWnNjNsKSp87AcF+SnPTen6X6ik8=;
        b=rLkPaBOjUDmP6o4djeInLP5rajZOyqv/lovPvp8T5KRRgKZEpAx5vl+SyBsHpHdKkR
         LpmuJdp7SS5CETcQiu0LHV3aUcEvO+SRNjGM38rFFZTfu/Dqx4udpYEB5kJ7EIrDp4M/
         PUrdslIN+w/ndgp6zoPWEgOYbI0JtV1nj0uM7y0BgwQ9WpnVOlp1yo1hzKCIWIshoP63
         JnD3xEzVbAxHnOpAMsIzYH/ulzlnDvDuFCVrwyfQSSuIYz9mdU9v7TVLdaUhY3v5TXm/
         8gPDd82dMjmpozr60Vmi7sUih0t4ToR9TxWiyltiiQELAk6Nnc+VHph7vWYR78cEmiUO
         AOsg==
X-Forwarded-Encrypted: i=1; AJvYcCXNxwNUjAwtURth4lCjw8yIKuuVK1shReNsXcdZ4KMAXa4vThafNNm/ciEr9e/BlYiHcXrOvVA6/+o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5808bOvYyk376xcvjvDywOU4+oz8/867k+MiX9xpPk22b8UYH
	LA+j7/uUmKNd0MZDHxcD6ts2OX9GZaHP0+dta8QOeW1tR/sswS8UaZ14eQ==
X-Gm-Gg: ASbGnct+qcQra+seppgHIBEyp+4SuONl3vOO7kNRFp5pNF/zKXvhDX4i+aCLaW6msxm
	KqNjqe4Z07AoCK4CSOfwWr7njOLJsoSkrT0voJzoT142DaG5Whd4dT/3UpikxK9WNiaYE47wEYv
	oJv7xmCPMZBQvHYI8zZ3GwS/OdeScR2+oEUZRB+963YKXQ0uPSgf6uHP4eqYohgW1/Q7iIBDv/S
	Q524YiuHSt6C0YBg4OJdr3xN7hYfATva3iTnGBrEmrYPvEr5XcQBG+imzR+F6p+cxOACDIA2dsO
	9DR8zip2FDk19THriaMovLK5oLIgMyiZookxZKddPCE+pPMj1Mxmce8PL87zLA==
X-Google-Smtp-Source: AGHT+IFXkYJBeBhxiJEbs03R4+scqYLDTeuaT2Cy/MZczp4kn71CBrB4UdCz77zcPJps4zCjFgh1NQ==
X-Received: by 2002:a17:907:7255:b0:abf:52e1:2615 with SMTP id a640c23a62f3a-ac25274a004mr255971466b.7.1741336027177;
        Fri, 07 Mar 2025 00:27:07 -0800 (PST)
Received: from foxbook (adts246.neoplus.adsl.tpnet.pl. [79.185.230.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239484d73sm235265366b.61.2025.03.07.00.27.06
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 07 Mar 2025 00:27:06 -0800 (PST)
Date: Fri, 7 Mar 2025 09:27:02 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: mathias.nyman@linux.intel.com
Cc: gregkh@linuxfoundation.org, ki.chiang65@gmail.com,
 linux-usb@vger.kernel.org, michal.pecio@gmail.com
Subject: Re: [PATCH 15/15] xhci: Handle spurious events on Etron host isoc
 enpoints
Message-ID: <20250307092702.5f958e92@foxbook>
In-Reply-To: <20250306144954.3507700-16-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> Unplugging a USB3.0 webcam from Etron hosts while streaming results
> in errors like this:
> 
> [ 2.646387] xhci_hcd 0000:03:00.0: ERROR Transfer event TRB DMA ptr
> not part of current TD ep_index 18 comp_code 13 [ 2.646446] xhci_hcd
> 0000:03:00.0: Looking for event-dma 000000002fdf8630 trb-start
> 000000002fdf8640 trb-end 000000002fdf8650 [ 2.646560] xhci_hcd
> 0000:03:00.0: ERROR Transfer event TRB DMA ptr not part of current TD
> ep_index 18 comp_code 13 [ 2.646568] xhci_hcd 0000:03:00.0: Looking
> for event-dma 000000002fdf8660 trb-start 000000002fdf8670 trb-end
> 000000002fdf8670
> 
> Etron xHC generates two transfer events for the TRB if an error is
> detected while processing the last TRB of an isoc TD.
> 
> The first event can be any sort of error (like USB Transaction or
> Babble Detected, etc), and the final event is Success.
> 
> The xHCI driver will handle the TD after the first event and remove
> it from its internal list, and then print an "Transfer event TRB DMA
> ptr not part of current TD" error message after the final event.
> 
> Commit 5372c65e1311 ("xhci: process isoc TD properly when there was a
> transaction error mid TD.") is designed to address isoc transaction
> errors, but unfortunately it doesn't account for this scenario.
> 
> This issue is similar to the XHCI_SPURIOUS_SUCCESS case where a
> success event follows a 'short transfer' event, but the TD the event
> points to is already given back.
> 
> Expand the spurious success 'short transfer' event handling to cover
> the spurious success after error on Etron hosts.
> 
> Kuangyi Chiang reported this issue and submitted a different solution
> based on using error_mid_td. This commit message is mostly taken
> from that patch.
> 
> Reported-by: Kuangyi Chiang <ki.chiang65@gmail.com>
> Closes:
> https://lore.kernel.org/linux-usb/20241028025337.6372-6-ki.chiang65@gmail.com/
> Tested-by: Kuangyi Chiang <ki.chiang65@gmail.com> Tested-by: Michal
> Pecio <michal.pecio@gmail.com> Signed-off-by: Mathias Nyman
> <mathias.nyman@linux.intel.com>

Such simple HW quirk would be an abvious candidate for stable if
a Short Packet refactor weren't bundled with it.

And it is subtly broken. I could swear that I have mailed you about
it, maybe you missed it or I didn't explain myself clearly enough.

> ---
>  drivers/usb/host/xhci-ring.c | 38 ++++++++++++++++++++++++------------
>  drivers/usb/host/xhci.h      |  2 +-
>  2 files changed, 27 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 2df94ed3152c..0f8acbb9cd21 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -2611,6 +2611,22 @@ static int handle_transferless_tx_event(struct xhci_hcd *xhci, struct xhci_virt_
>  	return 0;
>  }
>  
> +static bool xhci_spurious_success_tx_event(struct xhci_hcd *xhci,
> +					   struct xhci_ring *ring)
> +{
> +	switch (ring->old_trb_comp_code) {
> +	case COMP_SHORT_PACKET:
> +		return xhci->quirks & XHCI_SPURIOUS_SUCCESS;

XHCI_SPURIOUS_SUCCESS applies to practically all HCs, so this code
will typically boil down to:

return (ring->old_trb_comp_code == COMP_SHORT_PACKET);

> +	case COMP_USB_TRANSACTION_ERROR:
> +	case COMP_BABBLE_DETECTED_ERROR:
> +	case COMP_ISOCH_BUFFER_OVERRUN:
> +		return xhci->quirks & XHCI_ETRON_HOST &&
> +			ring->type == TYPE_ISOC;
> +	default:
> +		return false;
> +	}
> +}
> +
>  /*
>   * If this function returns an error condition, it means it got a Transfer
>   * event with a corrupted Slot ID, Endpoint ID, or TRB DMA address.
> @@ -2665,8 +2681,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
>  	case COMP_SUCCESS:
>  		if (EVENT_TRB_LEN(le32_to_cpu(event->transfer_len)) != 0) {
>  			trb_comp_code = COMP_SHORT_PACKET;
> -			xhci_dbg(xhci, "Successful completion on short TX for slot %u ep %u with last td short %d\n",
> -				 slot_id, ep_index, ep_ring->last_td_was_short);
> +			xhci_dbg(xhci, "Successful completion on short TX for slot %u ep %u with last td comp code %d\n",
> +				 slot_id, ep_index, ep_ring->old_trb_comp_code);
>  		}
>  		break;
>  	case COMP_SHORT_PACKET:
> @@ -2817,7 +2833,7 @@ static int handle_tx_event(struct xhci_hcd *xhci,
>  		if (trb_comp_code != COMP_STOPPED &&
>  		    trb_comp_code != COMP_STOPPED_LENGTH_INVALID &&
>  		    !ring_xrun_event &&
> -		    !ep_ring->last_td_was_short) {
> +		    !xhci_spurious_success_tx_event(xhci, ep_ring)) {
>  			xhci_warn(xhci, "Event TRB for slot %u ep %u with no TDs queued\n",
>  				  slot_id, ep_index);
>  		}
> @@ -2882,11 +2898,12 @@ static int handle_tx_event(struct xhci_hcd *xhci,
>  
>  			/*
>  			 * Some hosts give a spurious success event after a short
> -			 * transfer. Ignore it.
> +			 * transfer or error on last TRB. Ignore it.
>  			 */
> -			if ((xhci->quirks & XHCI_SPURIOUS_SUCCESS) &&
> -			    ep_ring->last_td_was_short) {
> -				ep_ring->last_td_was_short = false;

'last_td_was_short' means "expect one more event", and it is being
cleared here after receiving said event, or at least suspecting so.

> +			if (xhci_spurious_success_tx_event(xhci, ep_ring)) {
> +				xhci_dbg(xhci, "Spurious event dma %pad, comp_code %u after %u\n",
> +					 &ep_trb_dma, trb_comp_code, ep_ring->old_trb_comp_code);
> +				ep_ring->old_trb_comp_code = trb_comp_code;

Proper equivalent here would be to reset old_trb_comp_code to some
"impossible" value (0, -1) so that xhci_spurious_success_tx_event()
ceases returning true. Otherwise, this branch will trigger again on
the next event if it's for a wrong transfer (dangerous HW or SW bug).

Specifically and explicitly, two problems are created:

1. The "one more event" we expect will always be COMP_SHORT_PACKET,
   so this code will keep silently ignoring invalid events until some
   event is handled without error or is other than Short Packet.

2. There are endpoints (e.g. async/adaptive audio, usb-serial IN, IIRC
   some UAS too) where all or most transfers complete with Short Packet
   as a matter of routine. This code will silently ignore errors until
   an event is handled without error, so it will ignore all errors.

   IOW, "TRB DMA ptr not part of current TD" can never show up as far
   as I can tell.

>  				return 0;
>  			}
>  
> @@ -2909,15 +2926,12 @@ static int handle_tx_event(struct xhci_hcd *xhci,
>  	 */
>  	} while (ep->skip);
>  
> +	ep_ring->old_trb_comp_code = trb_comp_code;
> +
>  	/* Get out if a TD was queued at enqueue after the xrun occurred */
>  	if (ring_xrun_event)
>  		return 0;
>  
> -	if (trb_comp_code == COMP_SHORT_PACKET)
> -		ep_ring->last_td_was_short = true;
> -	else
> -		ep_ring->last_td_was_short = false;
> -
>  	ep_trb = &ep_seg->trbs[(ep_trb_dma - ep_seg->dma) / sizeof(*ep_trb)];
>  	trace_xhci_handle_transfer(ep_ring, (struct xhci_generic_trb *) ep_trb, ep_trb_dma);
>  
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index d9d7cd1906f3..6c00062a9acc 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1375,7 +1375,7 @@ struct xhci_ring {
>  	unsigned int		num_trbs_free; /* used only by xhci DbC */
>  	unsigned int		bounce_buf_len;
>  	enum xhci_ring_type	type;
> -	bool			last_td_was_short;
> +	u32			old_trb_comp_code;
>  	struct radix_tree_root	*trb_address_map;
>  };
>  
> -- 

