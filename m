Return-Path: <linux-usb+bounces-22654-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C7CA7E861
	for <lists+linux-usb@lfdr.de>; Mon,  7 Apr 2025 19:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 328B93A3AA3
	for <lists+linux-usb@lfdr.de>; Mon,  7 Apr 2025 17:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6293A217657;
	Mon,  7 Apr 2025 17:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="PZ/TYz1o"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06C121146B
	for <linux-usb@vger.kernel.org>; Mon,  7 Apr 2025 17:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744047013; cv=none; b=Ba5vN0PihPGRm9VaDad6yWZrSF9pCS0/V30rheYVYoiBOoeWthhbHIIrRanJ+FINWswtHIOvAADsiB5jGKeAwOYNXIWWD1m6q61XdT88yAInkJM3UBH+3dE57jf0aYVDLrVTkDNibfyIbz8hvq7BDqoVzokbZMOsXkdJnC/0Wrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744047013; c=relaxed/simple;
	bh=hAYYiBXXY70Jm2em3H1a/VfV6D4aFUDEgbCDcaD8eNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Txqlr/mfQH5lFSOg5aPgRKBg67LVk9LXrBok1HU1OWaQmts9wTYLVtzHMTjZM916ff2WAjBBaxHuYuOBFwOOl+khRVH+YgP5dBuQiqIvc9WPbqRgVxU5oeOIH+LW6mrffWMvYW4Yxm5awOia8qMr9yq53koeIRFiAt+bCo7pwkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=PZ/TYz1o; arc=none smtp.client-ip=212.77.101.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 18832 invoked from network); 7 Apr 2025 19:30:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1744047002; bh=SJZFLal8jqgIPZVp/6QbOdmJqNow83TJq1CG0CzJ+4Y=;
          h=From:To:Cc:Subject;
          b=PZ/TYz1on+IwGYToEv/ZBSjHgABYjeX9HR1p7cPHrA1zIoTBRF6JdR+Aj91UG/PRS
           Cr1pn9swgWTl8MOGlKEagkTE/+BJYfdFn1F2CFXHO9ZE7M4t/AfTY0WvkmuoOGvM/y
           XfFR6Bsg3/qX2MasqSmEPvBOjTFM9aSIm1ZfFw+R6ZjGpGmNfC+e/EgPWjcQn7hRn0
           8ZTjbyVsADhmW1DCgvAX9SIj3Uhv0mspUyIYeHXEsIc39iN8sAKcmT0+mcb3fq+1o2
           J9TrRfk9HXgNS1f2QV3yhHs6loBGzty2jMiwH4lEdcgSLL9IPmkm7/DB2VycaEuKpr
           YKht8pBq6OZ2w==
Received: from 89-64-9-62.dynamic.chello.pl (HELO localhost) (stf_xl@wp.pl@[89.64.9.62])
          (envelope-sender <stf_xl@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <gremlin@altlinux.org>; 7 Apr 2025 19:30:02 +0200
Date: Mon, 7 Apr 2025 19:30:01 +0200
From: Stanislaw Gruszka <stf_xl@wp.pl>
To: "Alexey V. Vissarionov" <gremlin@altlinux.org>
Cc: Matthieu CASTET <castet.matthieu@free.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@osdl.org>, linux-usb@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH] ueagle-atm: enforce boundary check for sync_wait[]
Message-ID: <20250407173001.GA36983@wp.pl>
References: <20250407130000.GD20970@altlinux.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250407130000.GD20970@altlinux.org>
X-WP-MailID: ac83f1f4f5ed40491b16e5134d345434
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000001 [oXJR]                               

On Mon, Apr 07, 2025 at 04:00:00PM +0300, Alexey V. Vissarionov wrote:
> After several increments of modem_index (e.g. after plugging and
> removing the device several times) modem_index may reach NB_MODEM
> value causing the out-of-boundary sync_wait[] array access.
> 
> Found by ALT Linux Team (altlinux.org) and Linux Verification Center
> (linuxtesting.org).
> 
> Fixes: b72458a80c75 ("[PATCH] USB: Eagle and ADI 930 usb adsl modem driver")
> Signed-off-by: Alexey V. Vissarionov <gremlin@altlinux.org>

Acked-by: Stanislaw Gruszka <stf_xl@wp.pl>

> ---
>  drivers/usb/atm/ueagle-atm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/atm/ueagle-atm.c b/drivers/usb/atm/ueagle-atm.c
> index cd0f7b4bd82ab132..436412b62c910e2f 100644
> --- a/drivers/usb/atm/ueagle-atm.c
> +++ b/drivers/usb/atm/ueagle-atm.c
> @@ -2500,7 +2500,9 @@ static int uea_bind(struct usbatm_data *usbatm, struct usb_interface *intf,
>  	if (ifnum != UEA_INTR_IFACE_NO)
>  		return -ENODEV;
>  
> -	usbatm->flags = (sync_wait[modem_index] ? 0 : UDSL_SKIP_HEAVY_INIT);
> +	usbatm->flags =
> +		modem_index < NB_MODEM && sync_wait[modem_index] ?
> +		0 : UDSL_SKIP_HEAVY_INIT;
>  
>  	/* interface 1 is for outbound traffic */
>  	ret = claim_interface(usb, usbatm, UEA_US_IFACE_NO);
> 
> -- 
> Alexey V. Vissarionov
> gremlin ПРИ altlinux ТЧК org; +vii-cmiii-ccxxix-lxxix-xlii
> GPG: 0D92F19E1C0DC36E27F61A29CD17E2B43D879005 @ hkp://keys.gnupg.net

