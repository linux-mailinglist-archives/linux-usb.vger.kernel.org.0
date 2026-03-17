Return-Path: <linux-usb+bounces-34904-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKVkL4zVuGm+jwEAu9opvQ
	(envelope-from <linux-usb+bounces-34904-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 05:16:12 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 605BD2A37D1
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 05:16:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2547302DF5C
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 04:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43D3D2DC767;
	Tue, 17 Mar 2026 04:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qSHJnnWA"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B3930ACF0
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 04:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773720965; cv=none; b=mjgJn7ny28352RH6iq26fSBHqzTPoRnrg+c7S5qweBuW5b0oLFMoKazA9ZAw96/+rHGX2jMPdI+L2bHQRmlRR1qsvQ+B3QUOo5b1SvYJoEKmk5k4N59mODgvaNDoZG1KWVZySTHZbfUxIxAc3jKWAup0soBOjVpCrOvy6paJC70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773720965; c=relaxed/simple;
	bh=o+rgNewqoJ4290bVj4LAo/MvWyje+OUbt8vKys4+zzc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=uHkYd7fMUap2hRTfeexM4KZQGsmOAS7n0TVliYg8gEQNXI0rdFt2w+Fu7KPZ87zWwnJSTlv1HARV96IHEYQWl0mZ7AfaTietbQZV+9H/2ppuRSV8jyYpzlwkoyoRLF/aAuIyphN4DzQGEdMQzM9Vggh0qme9U6e3nMMZPNujqZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qSHJnnWA; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773720950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dsfrICEAiF/QAe2USeGCcUz3O4end0xEuayixaEUc2o=;
	b=qSHJnnWA1z4yQ791SI42jydSs85/p/pHYyjQ+bwrVSkzyWzeEBe79Y7MkjkHaK1Z3zo+o1
	vApaRtahOPedpcuys2wFm3B4HQGQ7GcTa/4RwqC0fBtjJ3piDg1174tYGPelBUaSz2ZAV7
	Lbbsoh7JnXBp2k4xhYZGWHBfOgyrCOE=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 12:15:02 +0800
Message-Id: <DH4RL1NROT5O.2BN4PC3IH3DV2@linux.dev>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Ze Huang"
 <huang.ze@linux.dev>, "Yixun Lan" <dlan@kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <spacemit@lists.linux.dev>
Subject: Re: [PATCH 1/1] usb: dwc3: dwc3-generic-plat: Add optional VBUS
 regulator support
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <huang.ze@linux.dev>
To: "Chukun Pan" <amadeus@jmu.edu.cn>, "Thinh Nguyen"
 <Thinh.Nguyen@synopsys.com>
References: <20260316080000.3130372-1-amadeus@jmu.edu.cn>
In-Reply-To: <20260316080000.3130372-1-amadeus@jmu.edu.cn>
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34904-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[huang.ze@linux.dev,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 605BD2A37D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon Mar 16, 2026 at 4:00 PM CST, Chukun Pan wrote:
> Some boards provide USB VBUS through a controllable regulator. Add
> support for the optional vbus-supply property so the regulator can
> be properly managed instead of left always-on. Note that this does
> not apply to USB Hub downstream ports with different VBUS supplies.
>
> The enabled and disabled actions of the regulator are handled
> automatically by devm_regulator_get_enable_optional().
>
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
> The vbus-supply property has been declared in spacemit,k1-dwc3.yaml
> https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bi=
ndings/usb/spacemit%2Ck1-dwc3.yaml#L71
> ---
>  drivers/usb/dwc3/dwc3-generic-plat.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3=
-generic-plat.c
> index e846844e0023..83b4e4d69ba9 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> @@ -12,6 +12,7 @@
>  #include <linux/reset.h>
>  #include <linux/regmap.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/regulator/consumer.h>
>  #include "glue.h"
> =20
>  #define EIC7700_HSP_BUS_FILTER_EN	BIT(0)
> @@ -113,6 +114,10 @@ static int dwc3_generic_probe(struct platform_device=
 *pdev)
>  	if (ret < 0)
>  		return dev_err_probe(dev, ret, "failed to get clocks\n");
> =20
> +	ret =3D devm_regulator_get_enable_optional(dev, "vbus");
> +	if (ret && ret !=3D -ENODEV)
> +		return dev_err_probe(dev, ret, "failed to enable VBUS\n");
> +
>  	dwc3g->num_clocks =3D ret;
>  	dwc3g->dwc.dev =3D dev;
>  	probe_data.dwc =3D &dwc3g->dwc;

This could be useful for boards with direct-attached VBUS.

Just to clarify, the vbus-supply binding is for potential direct-attached
designs. For current boards (like K1 BPI-F3 and Jupiter) with the VL817 hub=
,
we'll use onboard_usb_dev instead.

