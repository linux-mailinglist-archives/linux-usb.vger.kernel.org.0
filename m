Return-Path: <linux-usb+bounces-33958-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COrSOjP/p2nUnAAAu9opvQ
	(envelope-from <linux-usb+bounces-33958-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 10:45:23 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4DB1FDD1A
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 10:45:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 396A33106C4C
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 09:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1538F39A07D;
	Wed,  4 Mar 2026 09:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fa9H9MKV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296DE39A05A
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 09:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772617370; cv=none; b=iJxW67UHV8RbCSVYnfBAWl+Pl97R3RYP6jsIwAFQvyjSOB880k2scjPhJPkdziztRap2i9saHPqnB8SIwiG8eTHgQ7NwqDW/Z8HXlmyfqKx1sBslZMh6c1LPDzeDQKjMakT7d5dljgrmW0P3fdxwBkv3jl/jyoe5LuogV+soJ4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772617370; c=relaxed/simple;
	bh=eO0yI6aojN9eXRGjr9n4XK9BW+Eh5aLi71uSowiURyg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TyyXIf7dBiuM/d481Wk6qKdDBOkmXmyJrkrwTALFDNZDfpiFETNoqIEvwy3vhU/ai28JdA6RWYPb/GbedaFXl52ZQnXtVGVhJtbd9jxZ3HWT58f05Xz5jzY/X5y6WqxL16S5oerLR7maNI8X0HKMdR84EjKdujs1+w3G5z0pG1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fa9H9MKV; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-660d2e4846cso377564a12.2
        for <linux-usb@vger.kernel.org>; Wed, 04 Mar 2026 01:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772617367; x=1773222167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HN6rdcIbLsRxQD4oh3MaVWieTlIlwPUMb/Noz+XjGoI=;
        b=Fa9H9MKVin7K2OABS1ImU5tH6FO2akSft2tcZjyJtdEAVphS43dXfBNkxNmR1tWJXj
         O2IWtB+ufY1mJ5ojEZz9tHeg+vWgMl8vdvtv2WSAVxg2B9JK29yOk9MM+qaGOyilr/lF
         e8H1XvjrU0Iel5YWBBe3kHizFxOugQBlMFgk71rf3XhlBkn/DqfI7ewJ9mxM49VpQheu
         lNm+s6trvwl+eYrMgrgC5OZprnqnpt2PEqS5EuxD8lsU9J9bobGuYboqKd/Nm/fwbHbF
         4gG/QCSUQxlSjoPXG6OT6sot0584if0UstRrrdduolx1IzvcBky/jWiHAIjg4geLwice
         w23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772617367; x=1773222167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HN6rdcIbLsRxQD4oh3MaVWieTlIlwPUMb/Noz+XjGoI=;
        b=cYEfOMvXg1WCVgyx6nJYm+v6tTiPDEDMB01EvlsnhCIxNaNXg343PF6N1ptBZn4Uhd
         1D7gELiC6IBsSL92H/EY9QsMu5GJYODFMckmdTjCrQIWf+XXt+BtLqoQcMx1DsoDXDpS
         ue6CQOUkNqpOWuTJxhuWcJV75PEX9wkITn+E1qgw4QQaG9uDYWtGieBp+pyTm3+mhHJE
         EMyOgrjFj7Y2JsdVTuy8KKiW/2cWOCrui+fYvvtdjo3E/afw8RQ3hckMZ2nuHz0huXSy
         pc4B/rU/+WnfbiuOVyehwhQwyu3nX2+4WG6gJZXoV8L9si8xtpPSiEU5AhtKp5DkbvJX
         /MOg==
X-Forwarded-Encrypted: i=1; AJvYcCU/pBDTvZGZL7zkl/7HMUROoPxLp0TVGACA6ffFJnvka7/4u/LObsRYSdFMrC7sNvacuFV/Qe6UUMw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQMW+JEJgTCPuajjRH78DumplAQYpC4qJ+Yfz2ipT7MOsJFTLm
	WKn/t2kpZrjK3KlnZXnWAuiVLAq25J8Rd47KGpaoqEiOXC/850G93T/8kO+huw==
X-Gm-Gg: ATEYQzyrODd6ebx76h/NktWyJF4u5+RztTex+I5UT1h8GHKzjxIGEmMEOLiUFXkVGar
	PEBOQR3XuzH/q+/VGtg94WllMUFVlPOKBDXnmdmrLjkEJEYKokP8/NeM5bhNMekll9AqbkXMbiR
	gh1cLyHeI1c03UIQakRmyideGAqNpmpsKYFqvajaoDFjnSHUw2mQEnKH6hoSjtfd9ELvTJglTTW
	eXF2/914HwH4DmODroU6Qod8NujaZzzpwS7Gg8UE81TVACN0ZXTlPjLv1ywrOGSjEybGYSsFcGt
	//0GBJ6CkDoYj06N0negvXGSQOO0Yuhn1NoaLJp5vW+Cqla57iYYL4eQpIUwfpuiH0dJ90ZDrlb
	VUhiRMb+zHoFxW+NkdKRqy7p6g2XdGQG6yTxRh94jsOE/BTh+paTfujUb6vEkFUdoASCy/ml+Dn
	3RWXCh8uy8HABm/Ls8lOM091jjZOx4nsp2
X-Received: by 2002:a17:907:9284:b0:b93:a02d:2ef3 with SMTP id a640c23a62f3a-b93f14504femr79843766b.41.1772617367128;
        Wed, 04 Mar 2026 01:42:47 -0800 (PST)
Received: from foxbook (bfj19.neoplus.adsl.tpnet.pl. [83.28.47.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aee3ab4sm709792066b.61.2026.03.04.01.42.46
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 04 Mar 2026 01:42:46 -0800 (PST)
Date: Wed, 4 Mar 2026 10:42:44 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>, "Rai
 Amardeep" <amardeep.rai@intel.com>
Subject: Re: [PATCH 23/23] usb: xhci: Add debugfs support for xHCI Port Link
 Info (PORTLI) register.
Message-ID: <20260304103856.48b785fd.michal.pecio@gmail.com>
In-Reply-To: <20251119142417.2820519-24-mathias.nyman@linux.intel.com>
References: <20251119142417.2820519-1-mathias.nyman@linux.intel.com>
	<20251119142417.2820519-24-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 5A4DB1FDD1A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33958-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, 19 Nov 2025 16:24:17 +0200, Mathias Nyman wrote:
> From: "Rai, Amardeep" <amardeep.rai@intel.com>
> 
> Each xHCI roothub port has a Port Link Info (PORTLI) register that is
> used by USB3 and eUSB2V2 ports.
> 
> USB3 ports show link error count, rx lane count, and tx lane count.
> 
> eUSB2V2 ports show Rx Data Rate (RDR) and Tx Data Rate (TDR).
> 
> Rx/Tx Data Rate is a multiple of USB2 2.0 HS 480 Mb/s data rates,
> and is only valid if a eUSB2V2 device is connected (CCS=1).
> 
> 0 = "USB 2.0 HS" normal HS 480 Mb/s, no eUSB2V2 in use
> 1 = "HS1" Assymetric eUSB2V2 where this direction runs normal 480Mb/s
> 2 = "HS2" 960Mb/s
> ...
> 10 = "HS10" 4.8 Gb/s, max eUSB2V2 rate
> 
> PORTLI is Reserved and preserve "RsvdP" for normal USB2 ports
> 
> Sample output of USB3 port PORTLI:
> cat /sys/kernel/debug/usb/xhci/0000:00:14.0/ports/port14/portli
> 0x00000000 LEC=0 RLC=0 TLC=0
> 
> Signed-off-by: Rai, Amardeep <amardeep.rai@intel.com>
> Co-developed-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>

Hi,

This patch causes an oops when there are more port registers counted in
xhci->max_ports than ports reported by Supported Protocol capabilities.
On my HW it's due to max_ports being more than maximum port number, but
it seems that gaps between ports of different speeds are also possible.

> +static int xhci_portli_show(struct seq_file *s, void *unused)
> +{
> +	struct xhci_port	*port = s->private;
> +	struct xhci_hcd		*xhci = hcd_to_xhci(port->rhub->hcd);

In such cases port->rhub will be NULL so we can't reach xhci. One
obvious solution (which works for me) is an explicit NULL check here
and another seq_printf just for this case, followed by early return.

Or maybe not bother printing anything and just return?
Or make this check before creating the files in the first place?

> +	u32			portli;
> +
> +	portli = readl(&port->port_reg->portli);
> +
> +	/* PORTLI fields are valid if port is a USB3 or eUSB2V2 port */
> +	if (port->rhub == &xhci->usb3_rhub)
> +		seq_printf(s, "0x%08x LEC=%u RLC=%u TLC=%u\n", portli,
> +			   PORT_LEC(portli), PORT_RX_LANES(portli), PORT_TX_LANES(portli));
> +	else if (xhci->hcc_params2 & HCC2_E2V2C)
> +		seq_printf(s, "0x%08x RDR=%u TDR=%u\n", portli,
> +			   PORTLI_RDR(portli), PORTLI_TDR(portli));

Or I suppose we could alternatively use PORTSC to determine speed
and remove the dependency on hcc_params2 by always decoding eUSB2v2
fields whether the HW supports it or not. It's debugfs, who cares.

> +	else
> +		seq_printf(s, "0x%08x RsvdP\n", portli);
> +
> +	return 0;
> +}

Regards,
Michal

