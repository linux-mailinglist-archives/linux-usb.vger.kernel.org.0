Return-Path: <linux-usb+bounces-35649-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qM/9NOZAymky7AUAu9opvQ
	(envelope-from <linux-usb+bounces-35649-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 11:22:46 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 060BA358165
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 11:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A169D301AAA5
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 09:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB06E3AF67E;
	Mon, 30 Mar 2026 09:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBsczop8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F123B19A0
	for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 09:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862068; cv=none; b=WMa0APpclP5n4DS1qXglk4rZ+OoePJugFD0g6KVukjSTaINjTyWObktEYYIL1dRDk83ur+F0715JUtYoC7eBpwkhiIxntVejRJOfI3SNX92d90AVQA/1573SoaxmdJSoQSBZ546ZqNt0BGBawdpbLRLmCxdBPDmpCucRbUjbVt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862068; c=relaxed/simple;
	bh=osVxIr1iaZ4rMpwt18WMnbdHaqZ6mMrM+HV425tLUHc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rtRtkuEig8mQxCOaR8gyJboCFd0YfDUcYjSVc31iJH3im70AesviDrikjlRVSdbP3GZMhqe2j5bQ1MmgzTOMzP3KNAsGc7Eoehcqxhz7J63w7A3+X/P8SpIXMbIqjCZwZ1jdtA+/JWH5f5d/9PXFHijcqjr4LS5Hsw8Ezw0xCrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBsczop8; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b97bca3797dso637771366b.0
        for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 02:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774862065; x=1775466865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/+cRGO5r9IN7xvYqjaqL/wwzVBjcDRoiVVEI1DpkzQ=;
        b=jBsczop8rpuk8I2WETGi93evrUDyeBRnbzZLRpk8Rjq2MRBdGzsCp0Eau441COl4nz
         qqoJWhM1uaVvirbE3NJb11oQrAjAJxkfN1XZ1mzmeFNXq4KsECNw9yEgSxVd5cTIr6VR
         FsHcKlWLRJb0hOaDgMl+yHu+t1TG/X//t2xLcsqZy1Lw1PRN1WI3QvkUp09Y4auaRqi4
         kZuTHZjf5iLPKzuEGvJFiXP2kIXI6q/yAZZoQD36GWvpryxoadG+0I7Elg9/5psaL2ia
         h34k4SLfou5SVgMvalyS3r+MRf+MJkd3whozemUG/be6NsapJa9UycK2NHleR3hyrJmM
         S9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774862065; x=1775466865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v/+cRGO5r9IN7xvYqjaqL/wwzVBjcDRoiVVEI1DpkzQ=;
        b=oCkPZcaRkh16KyuwMb4uqugzAXt6EgacpVKz/hNF5fvr0LH5Ls1Y6nf3d5qDw+HbzD
         TiuVxbuhzyqfxUe3IuqJulr8Nfp5G8O3hrFfrS7mQI59886Yw588Zjedm2LjAVnd8DKa
         +LeafioQMUt8UjCjH9BfLgk9W2T47I/ORFYLnjKeyHw3HVct0NVuttJWGZqfGV+B7yZ+
         AO/0NibzUSvXyELu11pevXyzs9SV5n+LTzosB/miQ+h3NlWy+17Kfx7GBVcmQ5l3Sk/2
         2wZ31fY6f1ndYQ9W/q81Pb2tSw3pAktaL2y+1o8Ews8d/I9BHYhWKaV0nlaQ3e2mA300
         /0Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWgXyKZG72ZtwXQiHx4jAK00PFROh/rSFu2wa8Sa1dOZQj+yQRHquKAk9qRQtEV/5nIM2qwhgfG2q4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKuUwFyXWH1efGB0Zn9Z/A72AM/O95Ir6RCpeeaza12gvNbhDI
	ABfoFRILKWB7CDkB+mQs+CD/bYiPzzNHh//8vhceY7dszZrajN+mDNjXCLoocw==
X-Gm-Gg: ATEYQzzylAgb+WlNofaquOv8irykLUDQ+tdxcZ+Bh6Rb87ZIGB7pARrpRw+JhYeD2BZ
	3VfbFoNtsqOSxGMmWkw80ZKG83pMhLC57G8KTS6+CoF9v1WWOel/XnPBrVP8JzXiD4tSacgkSNy
	VRRLs1iwyTy9U8BJIRLDAddH1IRVrgCqGVDEAy6mvJsCwnHBj205Ygydrzj1E9ZNWLFby7teOe/
	1udODAv8abRNIwuTIaG6TNf2Vcg8yzuh/E++1H/IpCzhGqCLjhIEtDYoRXpe2UOHl77rguBJMZG
	p3NFaN1wo9wktd5ymxqTU0h6gYcIFnIdSzVJRi0KZR6RtbZHIBOtuKySUItbDgTkdN1cSeZZHQP
	WVQGF17vHWA5Yxg5GNe7zaCfuMiFbd2EqQcoydkYLD87PaQLw6nPO/fTre8/spAMurDTIxHn3RH
	agdCaqwGrVl3IXT/c+rliieiNh7sXsOXh7
X-Received: by 2002:a17:907:c0e:b0:b98:36cd:7e11 with SMTP id a640c23a62f3a-b9b5098278bmr704786866b.45.1774862064898;
        Mon, 30 Mar 2026 02:14:24 -0700 (PDT)
Received: from foxbook (bfi53.neoplus.adsl.tpnet.pl. [83.28.46.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a5fb3sm267407066b.31.2026.03.30.02.14.24
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 30 Mar 2026 02:14:24 -0700 (PDT)
Date: Mon, 30 Mar 2026 11:14:21 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org,
 raoxu@uniontech.com
Subject: Re: [PATCH 8/9] usb: xhci: improve debug messages during suspend
Message-ID: <20260330111421.65c2eb06.michal.pecio@gmail.com>
In-Reply-To: <20260327123441.806564-9-niklas.neronin@linux.intel.com>
References: <20260327123441.806564-1-niklas.neronin@linux.intel.com>
	<20260327123441.806564-9-niklas.neronin@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35649-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 060BA358165
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 27 Mar 2026 13:34:39 +0100, Niklas Neronin wrote:
> Improve debug output for suspend failures, particularly when the
> controller handshake does not complete. This will become important as
> upcoming patches significantly rework the resume path, making more
> detailed suspend-side messages valuable for debugging.

As an aside, I think that if this series will cause any problems,
it will be some stale data structures surviving after resume, not
anything going wrong here.

> Add an explicit check of the Save/Restore Error (SRE) flag after a
> successful Save State (CSS) operation. The xHCI specification
> (note in section 4.23.2) states:
> 
>  "After a Save or Restore State operation completes, the
>   Save/Restore Error (SRE) flag in USBSTS should be checked to
>   ensure the operation completed successfully."
> 
> Currently, the SRE error is only observed and warning is printed.
> This patch does not introduce deeper error handling, as the correct
> response is unclear and changes to suspend behavior may risk
> regressions once the resume path is updated.

I think patch 10/9 should add setting xhci->broken_suspend if this is
detected. It's ridiculous to try State Restore after State Save error.
At best, it should fail. At worst, it might not fail...

> 
> Additionally, simplify and clean up the suspend USBSTS CSS/SSS
> handling code, improving readability and quirk handling for AMD
> SNPS xHC controllers that occasionally do not clear the SSS bit.
> 
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
> ---

>  drivers/usb/host/xhci.c | 65 +++++++++++++++++++++++------------------
>  1 file changed, 37 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 658419eb6827..232e6143ac4b 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -957,11 +957,11 @@ static bool xhci_pending_portevent(struct xhci_hcd *xhci)
>   */
>  int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
>  {
> -	int			rc = 0;
> +	int			err;
>  	unsigned int		delay = XHCI_MAX_HALT_USEC * 2;
>  	struct usb_hcd		*hcd = xhci_to_hcd(xhci);
>  	u32			command;
> -	u32			res;
> +	u32			usbsts;
>  
>  	if (!hcd->state)
>  		return 0;
> @@ -1007,11 +1007,10 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
>  	/* Some chips from Fresco Logic need an extraordinary delay */
>  	delay *= (xhci->quirks & XHCI_SLOW_SUSPEND) ? 10 : 1;
>  
> -	if (xhci_handshake(&xhci->op_regs->status,
> -		      STS_HALT, STS_HALT, delay)) {
> -		xhci_warn(xhci, "WARN: xHC CMD_RUN timeout\n");
> -		spin_unlock_irq(&xhci->lock);
> -		return -ETIMEDOUT;
> +	err = xhci_handshake(&xhci->op_regs->status, STS_HALT, STS_HALT, delay);
> +	if (err) {
> +		xhci_warn(xhci, "Clearing Run/Stop bit failed %d\n", err);
> +		goto handshake_error;
>  	}
>  	xhci_clear_command_ring(xhci);
>  
> @@ -1022,28 +1021,34 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
>  	command = readl(&xhci->op_regs->command);
>  	command |= CMD_CSS;
>  	writel(command, &xhci->op_regs->command);
> +
> +	err = xhci_handshake(&xhci->op_regs->status, STS_SAVE, 0, 20 * USEC_PER_MSEC);
> +	usbsts = readl(&xhci->op_regs->status);
>  	xhci->broken_suspend = 0;
> -	if (xhci_handshake(&xhci->op_regs->status,
> -				STS_SAVE, 0, 20 * 1000)) {
> -	/*
> -	 * AMD SNPS xHC 3.0 occasionally does not clear the
> -	 * SSS bit of USBSTS and when driver tries to poll
> -	 * to see if the xHC clears BIT(8) which never happens
> -	 * and driver assumes that controller is not responding
> -	 * and times out. To workaround this, its good to check
> -	 * if SRE and HCE bits are not set (as per xhci
> -	 * Section 5.4.2) and bypass the timeout.
> -	 */
> -		res = readl(&xhci->op_regs->status);
> -		if ((xhci->quirks & XHCI_SNPS_BROKEN_SUSPEND) &&
> -		    (((res & STS_SRE) == 0) &&
> -				((res & STS_HCE) == 0))) {
> -			xhci->broken_suspend = 1;
> -		} else {
> -			xhci_warn(xhci, "WARN: xHC save state timeout\n");
> -			spin_unlock_irq(&xhci->lock);
> -			return -ETIMEDOUT;
> +	if (err) {
> +		/*
> +		 * AMD SNPS xHC 3.0 occasionally does not clear the
> +		 * SSS bit of USBSTS and when driver tries to poll
> +		 * to see if the xHC clears BIT(8) which never happens
> +		 * and driver assumes that controller is not responding
> +		 * and times out. To workaround this, its good to check
> +		 * if SRE and HCE bits are not set (as per xhci
> +		 * Section 5.4.2) and bypass the timeout.
> +		 */
> +		if (!(xhci->quirks & XHCI_SNPS_BROKEN_SUSPEND)) {
> +			xhci_warn(xhci, "Controller Save State failed %d\n", err);
> +			goto handshake_error;
>  		}
> +
> +		if (usbsts & (STS_SRE | STS_HCE)) {
> +			xhci_warn(xhci, "Controller Save State failed, USBSTS 0x%08x\n", usbsts);
> +			goto handshake_error;
> +		}
> +
> +		xhci_dbg(xhci, "SNPS broken suspend, save state unreliable\n");
> +		xhci->broken_suspend = 1;
> +	} else if (usbsts & STS_SRE) {
> +		xhci_warn(xhci, "Suspend Save Error (SRE), USBSTS 0x%08x\n", usbsts);
>  	}

This is a bit complicated and those warns are almost identical.
Would it be a problem to simply:

if (SRE | HCE)
    xhci_warn("Save State error USBSTS %x")
    // patch 10/9: set broken_suspend here
    // patch 11/9: add HSE to this list

if (err)
    if (quirk)
        xhci->broken_suspend = 1;
    else
        xhci_warn("Save State timeout")
        goto handshake_error

This may sometimes print both warnings, but not a big deal.

>  	spin_unlock_irq(&xhci->lock);
>  
> @@ -1059,7 +1064,11 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
>  				__func__);
>  	}
>  
> -	return rc;
> +	return 0;
> +
> +handshake_error:
> +	spin_unlock_irq(&xhci->lock);
> +	return -ETIMEDOUT;
>  }
>  EXPORT_SYMBOL_GPL(xhci_suspend);
>  
> -- 
> 2.50.1
> 

