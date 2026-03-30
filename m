Return-Path: <linux-usb+bounces-35644-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGzhLe41ymkx6gUAu9opvQ
	(envelope-from <linux-usb+bounces-35644-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 10:35:58 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4074A35741C
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 10:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 36D1C3058E2E
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 08:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E61E53ACA64;
	Mon, 30 Mar 2026 08:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GnHY8TCN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB2E382F10
	for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 08:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774859358; cv=none; b=TbZ68OzgRAfX1cYLg6nXH2oAUo/N6IZkbS2isySZ58vQr2rJwlLR33oW1OuTHGPd1esz2EpjgihMHqlb0XoQ+C9lZwDWlu8w+wtSwbDwXKfONTfdN+Ij1eiUy0wKHTpJEFE2eHAYyw4Rput4u+yFNoKBXl2qdLjEXHJ00OZ/sBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774859358; c=relaxed/simple;
	bh=HIa17zBiYywMG+bDUM996oUMOGVSLwZTvLhhXy43mpo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dp7BqOFKt1DBMcfdhVvsHjBT+SgGw8G5jd8J2WGibH9M10Qusni1p0JorviXkmvD44StUMopSgXjmNAYlfSed6aqaydP1tz6HeF3BU4lbrxtDV5ME0IDQ7kz7iAmKkQI3blM0aXXN4eOrKVDfB44JzebbblTeLrEaxgbZJPa9/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GnHY8TCN; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b9910707d82so474137466b.1
        for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 01:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859355; x=1775464155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/hrLxDCI/4W3qc0Taje8t8m+JqPF4sJLxJeUxGMSbM=;
        b=GnHY8TCNAQMOfupMUq99lPfYA7y43ioknLTKyyZ4UAhGGPLn//NKiNTsiGZY5qQKxR
         5c9B3IbKiKoXPtp+EwnWDZVieCNalDuZjnsboJOLcVhxEVRbjGwfHguhw7IzHFJl5Tub
         5GxnRamaGDviRLXN4UAxyUAPUOB/94Vz0/5GrVxp07XQla6JdUE8T6halyE4nuJxu+QE
         8OBhAv2Anv2lA4sOYmNILzjoyag0F5UIenOP5fhtHiLYPb4PiIndbMWdiyHWq1P0iT8z
         uklku1M811neoRjuT8XE/WPcbJ9OKpBDSs2cjU0OCqAVT4TKtCHQevZyqsVIXJThESiV
         5cSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859355; x=1775464155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1/hrLxDCI/4W3qc0Taje8t8m+JqPF4sJLxJeUxGMSbM=;
        b=XAjjspQtAl4f9jszwSF2Gxe3X0iq733CaJeW3+K4pCKinlAARNsfnkuyuClhdvKTWO
         Z3WydaGWTsc45Zgwme44wuNhrG4zBB6G+a41PPx9gnMc8Ef9Fcqu/haqpGXkRZzmP520
         y3Y0WCA0dtvPIg6kfiaHVvS6l0nbBxHphoij/Y9cYuGYl+kZNLIWJHZ0SsTcpeZTCZ24
         6k3+yoEuhXG/OtCwLUJbWS2dwnv+Aqwvci14Hi5EXABvomton/CGVucPgpOo28xXU1kj
         ThkXiKS+Ph3t74fqNVYqEHE4+S7snfcMiXzC6P6MS+cnOTMR7flcwrJ6BuqkqUAqvR6D
         8nJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyhn9sskYr6ebsK7ZWd0P6mR/7EUz4yq7MS0UguAFmRC9XNCpiH4dlpz30yKsr/jIlU3T6kP0VzT4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7qaPmDdpTLeXd9rUwDcw/oNQ+t70AHJi6U2Dt1whYRbIHm45D
	kniriE1zIdT2Yk3hzuqK5iCA2pv+wdNYFzLlhAp8S0KRfZDOsqI5pMS4
X-Gm-Gg: ATEYQzwamWgWzMFFOtYN8Sk5KsXkzXaLpQidobDGP1HmdDTyxGjhLeCZvlAJvByGfgz
	iil61iD12uaR7/lOSFvjdD0eRcnNHz2haA2IoCfjSivNPwjlb9K6fFWeI40vEjwNT2URXLypkBl
	nt0S4r4sgx7NA0jhcw4FzNS2c2UeNCRYyxMmXgzazjuVhxkbXqoctahBmuZW55ApwboujJKvHav
	3N0Gmuh7FFHhERJlo9aaO3+V2gbRZ1XS0Qbq4Jk6btHcyQCmNyiMHzXlBF16UtZxqtUyoPC8/LG
	6PzMzIRY9U0loO/O8ddW+O9djbFfV2gw3pL1t5a0LDa7U+fK5tVu4iFfSTG93ISGkJCrY3wPG8O
	ej2pIS5ha6NAxFzMFvT7M7XRJ4Ka6LwnK378gkCuOkEsAy2HoalUdnZ5LETbUv9i99y7nwUd+ld
	rmT2pOG/wqmfJYE87g3obptHHJkM8rHnbA
X-Received: by 2002:a17:907:e158:b0:b96:d6cd:29e6 with SMTP id a640c23a62f3a-b9b503125a2mr505016366b.2.1774859354946;
        Mon, 30 Mar 2026 01:29:14 -0700 (PDT)
Received: from foxbook (bfi53.neoplus.adsl.tpnet.pl. [83.28.46.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae52064sm250910666b.23.2026.03.30.01.29.14
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 30 Mar 2026 01:29:14 -0700 (PDT)
Date: Mon, 30 Mar 2026 10:29:10 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org,
 raoxu@uniontech.com
Subject: Re: [PATCH 3/9] usb: xhci: factor out roothub bandwidth cleanup
Message-ID: <20260330102910.0059972c.michal.pecio@gmail.com>
In-Reply-To: <20260327123441.806564-4-niklas.neronin@linux.intel.com>
References: <20260327123441.806564-1-niklas.neronin@linux.intel.com>
	<20260327123441.806564-4-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35644-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4074A35741C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 27 Mar 2026 13:34:34 +0100, Niklas Neronin wrote:
> Introduce xhci_rh_bw_cleanup() to release all bandwidth tracking
> structures associated with xHCI roothub ports.
> 
> The new helper clears:
>  * TT bandwidth entries
>  * Per-interval endpoint lists
> 
> This refactors and consolidates the existing per-port cleanup logic
> previously embedded in xhci_mem_cleanup(), reducing duplication and
> making the teardown sequence easier to follow.
> 
> The helper will also be reused for upcoming S4 resume handling.
> 
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> ---
>  drivers/usb/host/xhci-mem.c | 50 +++++++++++++++++++++----------------
>  1 file changed, 29 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index 75bc1eb98b76..d4a9dbed8f16 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -1895,10 +1895,36 @@ void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrup
>  }
>  EXPORT_SYMBOL_GPL(xhci_remove_secondary_interrupter);
>  
> +/* Cleanup roothub bandwidth data */
> +static void xhci_rh_bw_cleanup(struct xhci_hcd *xhci)
> +{
> +	struct xhci_root_port_bw_info *rh_bw;
> +	struct xhci_tt_bw_info *tt_info, *tt_next;
> +	struct list_head *eps, *ep, *ep_next;
> +
> +	for (int i = 0; i < xhci->max_ports; i++) {
> +		rh_bw = &xhci->rh_bw[i];
> +
> +		/* Clear and free all TT bandwidth entries */
> +		list_for_each_entry_safe(tt_info, tt_next, &rh_bw->tts, tt_list) {
> +			list_del(&tt_info->tt_list);
> +			kfree(tt_info);
> +		}

This loop is theoretically pointless, because each tt_info corresponds
to a hub virtual device, and all this stuff should have been destroyed
by xhci_free_virt_devices_depth_first() earlier.

If anything, it seems to paper over potential memory leaks in there.

> +
> +		/* Clear per-interval endpoint lists */
> +		for (int j = 0; j < XHCI_MAX_INTERVAL; j++) {
> +			eps = &rh_bw->bw_table.interval_bw[j].endpoints;
> +
> +			list_for_each_safe(ep, ep_next, eps)
> +				list_del_init(ep);
> +		}

This loop used to run before xhci_free_virt_devices_depth_first(), but
now it will run after. It seems that the endpoints here are virt_ep
which also should be gone already, so this loop likely does nothing
(empty list) or writes to virtual devices after free (somebody forgot
to unlink some endpoints from the list).

Do we trust xhci_free_virt_devices_depth_first() to work correctly?
If yes then it seems this whole function is unnecessary.

If not, perhaps delete this monstrosity and write a simpler cleanup:

1. for each slot_id
  - disable debugfs
  - free virt_device and child allocations but don't worry about tt_info
2. for each root hub port
  - free all tt_info allocations but don't worry about eps or vdevs

And since this will be used by reset on resume:

3. zero out DCBAA and xhci->devs
4. reinitialize xhci->rb_hw

> +	}
> +}
> +
>  void xhci_mem_cleanup(struct xhci_hcd *xhci)
>  {
>  	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
> -	int i, j;
> +	int i;
>  
>  	cancel_delayed_work_sync(&xhci->cmd_timer);
>  
> @@ -1917,15 +1943,6 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
>  	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Freed command ring");
>  	xhci_cleanup_command_queue(xhci);
>  
> -	for (i = 0; i < xhci->max_ports && xhci->rh_bw; i++) {
> -		struct xhci_interval_bw_table *bwt = &xhci->rh_bw[i].bw_table;
> -		for (j = 0; j < XHCI_MAX_INTERVAL; j++) {
> -			struct list_head *ep = &bwt->interval_bw[j].endpoints;
> -			while (!list_empty(ep))
> -				list_del_init(ep->next);
> -		}
> -	}
> -
>  	for (i = xhci->max_slots; i > 0; i--)
>  		xhci_free_virt_devices_depth_first(xhci, i);
>  
> @@ -1959,18 +1976,9 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
>  
>  	scratchpad_free(xhci);
>  
> -	if (!xhci->rh_bw)
> -		goto no_bw;
> +	if (xhci->rh_bw)
> +		xhci_rh_bw_cleanup(xhci);
>  
> -	for (i = 0; i < xhci->max_ports; i++) {
> -		struct xhci_tt_bw_info *tt, *n;
> -		list_for_each_entry_safe(tt, n, &xhci->rh_bw[i].tts, tt_list) {
> -			list_del(&tt->tt_list);
> -			kfree(tt);
> -		}
> -	}
> -
> -no_bw:
>  	xhci->cmd_ring_reserved_trbs = 0;
>  	xhci->usb2_rhub.num_ports = 0;
>  	xhci->usb3_rhub.num_ports = 0;
> -- 
> 2.50.1
> 

