Return-Path: <linux-usb+bounces-22398-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BE6A77341
	for <lists+linux-usb@lfdr.de>; Tue,  1 Apr 2025 06:08:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF3AC3ACF6A
	for <lists+linux-usb@lfdr.de>; Tue,  1 Apr 2025 04:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CE7D192B90;
	Tue,  1 Apr 2025 04:07:57 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBFB87FBA2
	for <linux-usb@vger.kernel.org>; Tue,  1 Apr 2025 04:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.228.1.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743480477; cv=none; b=KqkPFtKz+fRB0y7bSoKlvZtlipMitXkADV1FiuQk8z+BH+ZcUkibdsnOe1ahRTRMX7wd7/5So6a+gf/S9TAqBzz2V3ZTvWudXOMo5IlQ3WlodJhYLSgvuqwWOPWtHaRbfXiapWCE31uj+d734b+e66cKr+ByVdofTm9aC/mUw7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743480477; c=relaxed/simple;
	bh=6ei/J9HuzXOkVvbNTD3Zbs4Jz2FvchdANo41vCzU/CA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SNA9ReJuwYHZoteqIO7JIfG46bxRVMbVgbDhP0Kn17Nf3Y2+bZ/w0ycisOZMNimGU7EFulKhMV5mZkpb8YvBI3yUgAr9NUJponWiFhAybu7ocUzsEOPuuytNDxmrzrOAAEogplRCtpcqGq6YlbciOeIRylzK02cCAEnyl16zc4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass smtp.mailfrom=kernel.crashing.org; arc=none smtp.client-ip=63.228.1.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.crashing.org
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 5313lvUW010557;
	Mon, 31 Mar 2025 22:47:58 -0500
Message-ID: <bcce62d1bb233edaf39637a60089fcc146c8173f.camel@kernel.crashing.org>
Subject: Re: [PATCH] Subject: [PATCH] usb: gadget: aspeed: Add NULL check in
 the ast_vhub_init_dev
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Henry Martin <bsdhenrymartin@gmail.com>, linux-usb@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org
Cc: gregkh@linuxfoundation.org, linux-arm-kernel@lists.infradead.org
Date: Tue, 01 Apr 2025 14:47:57 +1100
In-Reply-To: <20250329002911.132826-1-bsdhenrymartin@gmail.com>
References: <20250329002911.132826-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2025-03-29 at 08:29 +0800, Henry Martin wrote:
> When devm_kasprintf() fails, it returns a NULL pointer. However, this
> return value is not properly checked in the function
> ast_vhub_init_dev.
>=20
> A NULL check should be added after the devm_kasprintf call to prevent
> potential NULL pointer dereference error.
>=20
> Fixes: 7ecca2a4080cb ("usb/gadget: Add driver for Aspeed SoC virtual
> hub")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>

Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

> ---
> =C2=A0drivers/usb/gadget/udc/aspeed-vhub/dev.c | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/dev.c
> b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
> index 573109ca5b79..1709a58299a5 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/dev.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
> @@ -545,9 +545,11 @@ int ast_vhub_init_dev(struct ast_vhub *vhub,
> unsigned int idx)
> =C2=A0	struct device *parent =3D &vhub->pdev->dev;
> =C2=A0	int rc;
> =C2=A0
> +	d->name =3D devm_kasprintf(parent, GFP_KERNEL, "port%d", idx +
> 1);
> +	if (!d->name)
> +		return -ENOMEM;
> =C2=A0	d->vhub =3D vhub;
> =C2=A0	d->index =3D idx;
> -	d->name =3D devm_kasprintf(parent, GFP_KERNEL, "port%d",
> idx+1);
> =C2=A0	d->regs =3D vhub->regs + 0x100 + 0x10 * idx;
> =C2=A0
> =C2=A0	ast_vhub_init_ep0(vhub, &d->ep0, d);


