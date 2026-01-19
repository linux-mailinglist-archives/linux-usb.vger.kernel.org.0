Return-Path: <linux-usb+bounces-32500-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC19D3A67A
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 12:13:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0270B310C25E
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 11:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5653B3590DA;
	Mon, 19 Jan 2026 11:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="p3yEnQmj"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C5B34887E;
	Mon, 19 Jan 2026 11:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768820929; cv=none; b=JITSfvpG+t14L29gjTZHiy84KzcC7ZwMrMUbuiPvg2lP61eAdIHlIuVzeYKZahlUtnNuJvbm3L1RyA7cLPQ7WnyncovKIdFCLXEfZ8mWogBafNEo3ENNMy3sRorrXeD1qisA8q8DriF+HjUhbxVU2Ml5CPc7t/77P4ntikElPTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768820929; c=relaxed/simple;
	bh=a0/dBucYCMtw/vJNauyS1URQXYb+zlBypyLeR6yoTVI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=J6xn65uAPkJ13hr2YneLpLzPwgvUyhQyYkLgvAy9vU4/rOAyFJWJDkpVgGgISI61ZK39BC7R2HyJI3f0tFwCzr6rKURVfktP6snubxM+bazm1CAkXpKEK5xW56oaOBT68rI60pNuItO6sNd9KaIsdPZDiPvsyohCH+cVLa3tt6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=p3yEnQmj; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D21CE1A2949;
	Mon, 19 Jan 2026 11:08:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8E04A60731;
	Mon, 19 Jan 2026 11:08:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 97D1E10B69897;
	Mon, 19 Jan 2026 12:08:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768820924; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SaIzhehnPkbVpEfQQQ/RN2VRw7j9yZq/GRMnWoV7h4Y=;
	b=p3yEnQmjitO1+Cg+VsH0cQa38mXKu/02UZcrSkn5xu0gobhMeJqn4NTEPxqLmdXECWF/Lf
	2dLIodnmFQentyhpNn9Jn3lJYs+EIIOs4UTAuPmwx52fz7jMMUqtOtQfOjmPJMEl0mQvY8
	KgTlWzkKh6WTIgBQR1TPT1bpn9xxe5Q9MVJ8/OOGY6Dnnd7jRizoIkGmieS70Lon8Jp+J5
	MjPx3hWXDvUlkjTGBPDjbTX+qoNTAxYhONFDQzQp8TYisPL3SM7jsNpi+6vrTVS2zq/3PV
	rBsBSgMdOISL8CsU2E/0Y76fmYo+xt7sc8MkeyyMacaXtM6A5Y56Yenb25pv0g==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 12:08:40 +0100
Message-Id: <DFSIOP130201.PFP7SFMSZYFA@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH] usb: cdns3: host: Add null check for host_device before
 accessing its members
Cc: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <rogerq@kernel.org>, <u-kumar1@ti.com>,
 <p-mantena@ti.com>, <theo.lebrun@bootlin.com>
To: "Abhash Kumar Jha" <a-kumar2@ti.com>, <gregkh@linuxfoundation.org>,
 <pawell@cadence.com>, <peter.chen@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260119082242.1922599-1-a-kumar2@ti.com>
In-Reply-To: <20260119082242.1922599-1-a-kumar2@ti.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Abhash,

On Mon Jan 19, 2026 at 9:22 AM CET, Abhash Kumar Jha wrote:
> In cases when the xhci device is not populated, we see a nullptr
> exception when resuming.
>
> Add a nullptr check for the host_dev before accessing its private data.
>
> Fixes: 3a85c1011540 ("usb: host: cdns3: forward lost power information to=
 xhci")
> Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
> ---
>  drivers/usb/cdns3/host.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
> index f0df114c2b53b..8cc7fc1de6193 100644
> --- a/drivers/usb/cdns3/host.c
> +++ b/drivers/usb/cdns3/host.c
> @@ -141,9 +141,12 @@ static void cdns_host_exit(struct cdns *cdns)
>  static int cdns_host_resume(struct cdns *cdns, bool power_lost)
>  {
>  	struct usb_hcd *hcd =3D platform_get_drvdata(cdns->host_dev);
> -	struct xhci_plat_priv *priv =3D hcd_to_xhci_priv(hcd);
> +	struct xhci_plat_priv *priv;
> =20
> -	priv->power_lost =3D power_lost;
> +	if (hcd) {
> +		priv =3D hcd_to_xhci_priv(hcd);
> +		priv->power_lost =3D power_lost;
> +	}

I am not seeing a codepath making it possible for drvdata to be NULL.
Can you point it out? What HW, what config, etc.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


