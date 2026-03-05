Return-Path: <linux-usb+bounces-34122-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHlwKfTYqWl5GAEAu9opvQ
	(envelope-from <linux-usb+bounces-34122-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 20:26:44 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5455621780B
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 20:26:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6DD7330059A2
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 19:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EACB378829;
	Thu,  5 Mar 2026 19:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IzWmUGM4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698E72E975E
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 19:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772738799; cv=none; b=aksFEhNBtTtaQHp/TkBNWRGpafZpdfvj7btwMd+PnWmK3QAdLnMOxJl1bf+jgcIFVsvuGmyPAyVE/cb/P2SpA/PhDSAQELf8v9IRcIT28ZBxU1H+ywz70w2vocRomcKkFv29w9FOIzixcWg2d6vsEBQdCVKaBx+jsv05y9orjSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772738799; c=relaxed/simple;
	bh=PzyjblgYycUjNzg8ivB+UJW6BN03Bu4LIGuKMJS9mC0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lgEjpKQWhtv9SM/qsJzeZ5bRPYawJih7N3HAcLOa5gR9IRGUAhQiBnHsqNqjLFKo+UbyDeiabt8wHFdk1STxoOORbWFgBAq4VGf4UkM1IwAXlJFfAcO4vAPGzIuqvlHfZvYDx2uXBe2JwYpJ0np9jiU6PFXbF0OxKngiz1EXb4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IzWmUGM4; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b9358dd7f79so344262666b.1
        for <linux-usb@vger.kernel.org>; Thu, 05 Mar 2026 11:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772738797; x=1773343597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E3usv8RpEZJ2/rRArBDxZ4kIUBE+5QDg7+T72w+q6lA=;
        b=IzWmUGM4RZEF/aQxqGxP2MPcqtMZjuF6TITe6ZzdGKaAWx9O3LfjchTffQLSmcmy44
         00HqlSDcCxosAYJnJfPmUobK4A+Tg2SVmpEe2nnVXjpSWjVpd2nojCJ91nIrOk1PmcfZ
         cyt8I8Brn03WoJA4f+Pc4a9ppu4UWUvfZ2jg+gsExgwgSuryaM5KBFFPjYRIO5HKiXsb
         XtsFmZ90d7X+zh/+fD5IYrlLHhCOLi9oJvCZSMRdj0IIEW/O+7D0wmncj3AOxwLToQb1
         39gjnqOObVnP0skG9+qK2WiU7nwg1nfMaCimKTIFwJEdk9s0gOB6LVW1Ck3FUpdr5dFm
         6e2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772738797; x=1773343597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E3usv8RpEZJ2/rRArBDxZ4kIUBE+5QDg7+T72w+q6lA=;
        b=OI6AJxDhBBZelg7XbaV9zoyaREBk/oLSCqv0qS0GWtm9sa1SbZMIQIzpS9i1ai5ULW
         fJl3GaXsD/7Fk9LyoIT0dw+YnV2AL63gBnDojH8EI6xXhNCh2i10Uw3hHkTNjM8PpzQL
         mVEc97xFoaM9Nk1e/rbwrmRjCh4vsqIuUMoIY75ZphamA7HDJxSVOlVTE2R0zhBSZqBD
         h8M6rUsMqdrDI8bt32gg0WdXhgEPpZt3wifBLl/mXWuoLeEj/ZGXaVBE9a4lzPQulyrv
         BvRHna9oW6k//919nPtopMNwl42XA0t9Kxvspc8RrFjhIHCJ6xFdS8uE2UuFWI4cr1Z1
         r60w==
X-Forwarded-Encrypted: i=1; AJvYcCXenkEhGLHT7eJD/wSGqKwmRZi6nKADzhlaZYAU/+bCD9UPCUs0fRf97AIuCOPwsNIkFHGQcBLDP1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRqd03fdWsepPeMSjyJEzJ/r5on7dJHnT3sSOGKuBSGgY3ltPs
	rx9Xlg3a3lTGKp1jFsCwUVZpkiiUIS08nUU7/gp/2uaa8HTTm0A+liNT
X-Gm-Gg: ATEYQzyPICnE81oN/ySZZeEOdGd/2vZSSSMpln8woHb9Z0jPaYY4ncb04LnxKqvfYCj
	jOfPoUhdgEzRuNdfdNkEvF+MMan8Yno+/VqPk8wFx+U2dkqjij18i2h1YK0jQm2hw+Tx8ewyc6o
	pUw/9HfLIYm02gc6Q6CtFCUpBl4dZ08ljD2Q3J+TsNwVEHvQCcsUToIAxJxOchCOf7aOKnhVd1o
	kgntov6buS/c/a/1uUz/N7je5AQuavlJR57u5JQucf8mRW7B5ld5v2ePOJdELjmIIn+ZzwmHo5Q
	HuA+stDNFtrzSVpmqGWswz9I/J8nY0pQmMd4T79vAPm5M76/izG5hYGJcB6b6Ni/jPHeKBX5VFm
	PGye+c2eim4NZa317zDjEvkA9U89l1SKzhhWrTrKN2i+FRG/b/61tzw7Wf+6eRwb4SRrLAA22Dw
	vI6IMBpVWI+oBk4uF/5mpFk7NPnK5vQg0j
X-Received: by 2002:a17:906:478f:b0:b93:5b12:7b92 with SMTP id a640c23a62f3a-b93f1432bd7mr456411366b.40.1772738796557;
        Thu, 05 Mar 2026 11:26:36 -0800 (PST)
Received: from foxbook (bfj19.neoplus.adsl.tpnet.pl. [83.28.47.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae65662sm952723766b.41.2026.03.05.11.26.35
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 05 Mar 2026 11:26:36 -0800 (PST)
Date: Thu, 5 Mar 2026 20:26:32 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org,
 raoxu@uniontech.com, Thinh.Nguyen@synopsys.com, Andy Shevchenko
 <andriy.shevchenko@intel.com>
Subject: Re: [RFC PATCH 03/12] usb: xhci: simplify USBSTS register reset
Message-ID: <20260305202632.5a2d0d0d.michal.pecio@gmail.com>
In-Reply-To: <20260305144824.3264408-4-niklas.neronin@linux.intel.com>
References: <20260305144824.3264408-1-niklas.neronin@linux.intel.com>
	<20260305144824.3264408-4-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 5455621780B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-34122-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:email]
X-Rspamd-Action: no action

On Thu,  5 Mar 2026 15:48:15 +0100, Niklas Neronin wrote:
> The current code clears the USB Status Register (USBSTS) and then sets
> the Enable Interrupt (EINT) bit to '1'. A mask (~0x1fff) is used to
> avoid modifying reserved bits 31:13, but it also inadvertently
> excludes reserved bits 7:5, 1. These fields are defined as RsvdZ, so
> writing '0' to them has no effect.

This paragraph is misleading because it suggests that treatment of bits
31:13 was correct and treatment of bits 7:5 was harmlessly wrong.

In reality, bits 7:5 were done correctly, while preserving bits 31:13
was a bug. They should be written as zero just like 7:5.

Table 5-3 is completely clear:
Software shall use =E2=80=980=E2=80=99 for writes to these bits.

> According to the xHCI specification, section 5.1.1:
> "System software shall mask all reserved fields (Rsvd, RsvdP or RsvdZ) to
>  '0' before evaluating a register or data structure value. This will enab=
le
>  current system software to run with future xHCI implementations that
>  define the reserved fields."

This quote seems irrelevant. We aren't evaluating anything here, just
changing one bit.

It obviously doesn't apply to the case of read-modify-write, because if
we mask RsvdP bits to zero and then write back, that's a bug too.

>=20
> Given this, it is safe to write zero to all bits of USBSTS except EINT.
> This allows the mask and the register read to be removed, simplifying the
> code, avoiding potential future issues and removing unexplained hex.
>=20
> USB Status Register; xHCI Specification, version 1.2 section 5.4.2
>=20
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> ---
>  drivers/usb/host/xhci.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index a288f59c604c..ad095768ed48 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -705,7 +705,6 @@ EXPORT_SYMBOL_GPL(xhci_run);
>   */
>  void xhci_stop(struct usb_hcd *hcd)
>  {
> -	u32 temp;
>  	struct xhci_hcd *xhci =3D hcd_to_xhci(hcd);
>  	struct xhci_interrupter *ir =3D xhci->interrupters[0];
> =20
> @@ -740,8 +739,7 @@ void xhci_stop(struct usb_hcd *hcd)
> =20
>  	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
>  			"// Disabling event ring interrupts");
> -	temp =3D readl(&xhci->op_regs->status);
> -	writel((temp & ~0x1fff) | STS_EINT, &xhci->op_regs->status);

Makes sense,

> +	writel(STS_EINT, &xhci->op_regs->status);

but what is actually the point of clearing this bit here at all?

This is USBSTS.EINT, not USBCMD.INTE. Per 5.4.2 (including notes),
this bit has no effect on anything, it's only for SW's convenience.
And we are shutting down the driver right now.

>  	xhci_disable_interrupter(xhci, ir);
> =20
>  	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "cleaning up memory");
> @@ -1174,8 +1172,7 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_l=
ost, bool is_auto_resume)
>  			return retval;
> =20
>  		xhci_dbg(xhci, "// Disabling event ring interrupts\n");
> -		temp =3D readl(&xhci->op_regs->status);
> -		writel((temp & ~0x1fff) | STS_EINT, &xhci->op_regs->status);
> +		writel(STS_EINT, &xhci->op_regs->status);
>  		xhci_disable_interrupter(xhci, xhci->interrupters[0]);

This runs right after xhci_reset(), so I suspect this whole block is
pointless. Apparently copy-pasted with other stuff from xhci_stop().

> =20
>  		xhci_dbg(xhci, "cleaning up memory\n");
> --=20
> 2.50.1
>=20

