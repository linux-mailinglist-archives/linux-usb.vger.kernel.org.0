Return-Path: <linux-usb+bounces-35648-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id tGUgOu08ymnG6wUAu9opvQ
	(envelope-from <linux-usb+bounces-35648-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 11:05:49 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E73D8357C28
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 11:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C5FD302C30B
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 08:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 634613AE709;
	Mon, 30 Mar 2026 08:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rylFXdaC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EC9279DCA
	for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 08:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774861044; cv=none; b=W74weppQ2fuP9leFypT3uEdR1TM4jL1XySK0u6aq/jWiDQGLvLd56EoINPSQpW4Pcmg2ZR5JckwJ5K0X8/Vqj1Cr3MCeFiS0J7qoUyE2xF4hm0GARyZ0Fdggw3dLvYbUJLrUZQUQ910iLa3Q2kr+Fx13cxlqb7UzXjYEzRRi0os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774861044; c=relaxed/simple;
	bh=nVCNlfxwORPkJUaFFU24oHV8T08brdagWZs5eTHl7xM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CRKvF4ttXtNn6cpQmRsDSj0pJbOkf3n4qTB1N4aEusC8yT8HvuB7k+n5qDYwxl6zwns07yGO8EyozEH98YhqmDZIai7sLTrFyEYxdDP2lxOJvthTDx+6sz6hPKki/+qKpqRNJm5c2ehrT4l6byRUI6p7ZjA4DPKL3pKDifi3LHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rylFXdaC; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8f97c626aaso790472966b.2
        for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 01:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774861041; x=1775465841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnYfoze5qk4bpGSvRxXA9gTy9o3GbR6M6fmHako7KY8=;
        b=rylFXdaCg2r2Ft/CuN+61P6xyTZ1RKG8eW5/WVp4chyR0ok9/KMpuOCPc28WNivfwO
         lWaQ8qWoeCe0JSDjt9N6WVwR/l+cwHu58Cm3A5GTPx+V8KXGxZVqTXl8vRcAXsiuqaly
         G/si/tokqrp7KGoI9nA6TVTQ4m/GX1eoy6wuSMd4nwjdCro7QLtsqOOSPSRLwCCaEV0f
         /jZ7lWzDuDPGWz4/kPk/oiFQWHH6jU7xCa71zXPCnElt1ZD8AGmaQrdueHNvcgHJrvi4
         XD4KDniH9R77gj+2Kkg5Sr7ZJyLqFEXt9fkZvg3Y1GJZuA9l1a1r0zaIo5JRyRSzid0g
         2U9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774861041; x=1775465841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cnYfoze5qk4bpGSvRxXA9gTy9o3GbR6M6fmHako7KY8=;
        b=Z2i1XvIfxeNjGAD/4/t3SmQru4I3pP8IK/fOE9pkHwq2f1Lo+r9furxmeYFDjk6dNJ
         4Mg2w0roUuYrKM6KaPKg1X7x5K2JBkgqsVXMZgbSFq+5z/m1yI8HkblhGIZIc8MN3d7W
         bO64aPkI3etJ38kPUBoJu/a9xEovXbZvaxpo6vSTWX3Hbl46uftS72VhA951EyIaX7Xb
         GizUL8Y8nk8JW5QTEHafMGE0zPhn/w6nAhXiOpAMv+xOtgRScmZI1GN+iD+kCj5Hj2HT
         vrAjo5Tsbtixjb0sboYunYcjujdPBDV6kRmrucQKqcfCCp2qzCrz0nMJxitIhIpl9M8S
         oloQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDAhQOi+LlNFtI7MHakOTY/EgH8eLozMW3mHxnQq2ey0WwFGJ91GH9dlokKfhxVjp79yxNtXlKfR4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5WcrdVuDP9ERSM0kSfdafwtuZ9Bwqm8Z6U83SrAxD1xMHAmEU
	+OWTsZ+Zm61+M4C627zMCIuWQY5J/q5IqdyaJUvgfq/oz1xlBAfbTrmgvcUuUA==
X-Gm-Gg: ATEYQzxrOwm388hbKJdurlkv/LlyswYnFmFNgUD5nmrgYw0TKdj18HGjxWw3dDSd1hX
	T79t/Zk2cMgGGQ8lIR3R+6DC9VoDplkdxko7BsjpInh8PoeQMU1URkY7Y+kXxq5edruDZJ57G0i
	nMhlqmQ5/K5RD7k5N8b9Ci7D/lZetHCcy8ZV1t1VOeejpGmED3/RoZo5FGpKHHHxO/f3p353U+K
	+sKPMoEHawypqaO4bxQwWyuedOiqoRfhB1Hvzrno0TluDpOUcMtYJbsKBovJrvyulGfsUtfA9OX
	bu3jtmp7GXT9fuKt+NhCmkvaOSH32S4Izg0zaEhm/q8fywES/5Did9lN5cxvUPtKk6IrLQ3vrnx
	6omGa81LfL/JeA57WAZsAK0bADpWU3WeBI+BrHxNPt33dGgV7g4E4XW5nNSW2slY5BxX03Y0gHN
	HZIELYAmsUTq4aPabl6KGM949Z/h4CBTYb
X-Received: by 2002:a17:907:2d0f:b0:b97:7d03:68c1 with SMTP id a640c23a62f3a-b9b5056dd58mr618860666b.30.1774861040653;
        Mon, 30 Mar 2026 01:57:20 -0700 (PDT)
Received: from foxbook (bfi53.neoplus.adsl.tpnet.pl. [83.28.46.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b225193sm260112866b.57.2026.03.30.01.57.19
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 30 Mar 2026 01:57:20 -0700 (PDT)
Date: Mon, 30 Mar 2026 10:57:17 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org,
 raoxu@uniontech.com
Subject: Re: [PATCH 7/9] usb: xhci: split core allocation and initialization
Message-ID: <20260330105717.6ea10ac0.michal.pecio@gmail.com>
In-Reply-To: <20260327123441.806564-8-niklas.neronin@linux.intel.com>
References: <20260327123441.806564-1-niklas.neronin@linux.intel.com>
	<20260327123441.806564-8-niklas.neronin@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35648-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: E73D8357C28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 27 Mar 2026 13:34:38 +0100, Niklas Neronin wrote:
> Separate allocation and initialization in the xHCI core:
> * xhci_mem_init() now only handles memory allocation.
> * xhci_init() now only handles initialization.
> 
> This split allows xhci_init() to be reused when resuming from S4
> suspend-to-disk.
> 
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> ---
>  drivers/usb/host/xhci-mem.c |  3 +++
>  drivers/usb/host/xhci.c     | 30 ++++++++++--------------------
>  2 files changed, 13 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index 2cd6111c9707..f1b4f06d4b8b 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -2421,6 +2421,8 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
>  	struct device	*dev = xhci_to_hcd(xhci)->self.sysdev;
>  	dma_addr_t	dma;
>  
> +	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Starting %s", __func__);
> +
>  	/*
>  	 * xHCI section 5.4.6 - Device Context array must be
>  	 * "physically contiguous and 64-byte (cache line) aligned".
> @@ -2510,6 +2512,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
>  	if (xhci_setup_port_arrays(xhci, flags))
>  		goto fail;
>  
> +	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Finished %s", __func__);

Patch looks OK, but I don't think there is a need to log this. The
function is completely boring, just some memory allocations while the
controller is halted and nothing happens.

Maybe it doesn't even make sense to log the beginning either. We know
which functions call this and when, we also know that they will return
ENOMEM if this fails.

>  	return 0;
>  
>  fail:
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 4e811a2668e6..658419eb6827 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -536,24 +536,13 @@ static void xhci_set_dev_notifications(struct xhci_hcd *xhci)
>  	writel(dev_notf, &xhci->op_regs->dev_notification);
>  }
>  
> -/*
> - * Initialize memory for HCD and xHC (one-time init).
> - *
> - * Program the PAGESIZE register, initialize the device context array, create
> - * device contexts (?), set up a command ring segment (or two?), create event
> - * ring (one for now).
> - */
> -static int xhci_init(struct usb_hcd *hcd)
> +/* Setup basic xHCI registers */
> +static void xhci_init(struct usb_hcd *hcd)
>  {
>  	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
> -	int retval;
>  
>  	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Starting %s", __func__);
>  
> -	retval = xhci_mem_init(xhci, GFP_KERNEL);
> -	if (retval)
> -		return retval;
> -
>  	/* Set the Number of Device Slots Enabled to the maximum supported value */
>  	xhci_enable_max_dev_slots(xhci);
>  
> @@ -589,7 +578,6 @@ static int xhci_init(struct usb_hcd *hcd)
>  	}
>  
>  	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Finished %s", __func__);
> -	return 0;
>  }
>  
>  /*-------------------------------------------------------------------------*/
> @@ -1190,11 +1178,12 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
>  		 * first with the primary HCD, and then with the secondary HCD.
>  		 * If we don't do the same, the host will never be started.
>  		 */
> -		xhci_dbg(xhci, "Initialize the xhci_hcd\n");
> -		retval = xhci_init(hcd);
> +		retval = xhci_mem_init(xhci, GFP_KERNEL);
>  		if (retval)
>  			return retval;
>  
> +		xhci_init(hcd);
> +
>  		xhci_dbg(xhci, "Start the primary HCD\n");
>  		retval = xhci_run(hcd);
>  		if (!retval && xhci->shared_hcd) {
> @@ -5526,12 +5515,13 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
>  
>  	memset(xhci->devs, 0, MAX_HC_SLOTS * sizeof(*xhci->devs));
>  
> -	xhci_dbg(xhci, "Calling HCD init\n");
> -	/* Initialize HCD and host controller data structures. */
> -	retval = xhci_init(hcd);
> +	/* Allocate xHCI data structures */
> +	retval = xhci_mem_init(xhci, GFP_KERNEL);
>  	if (retval)
>  		return retval;
> -	xhci_dbg(xhci, "Called HCD init\n");
> +
> +	/* Initialize HCD and host controller data structures */
> +	xhci_init(hcd);
>  
>  	if (xhci_hcd_is_usb3(hcd))
>  		xhci_hcd_init_usb3_data(xhci, hcd);
> -- 
> 2.50.1
> 

