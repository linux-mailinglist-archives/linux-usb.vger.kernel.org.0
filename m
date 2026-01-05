Return-Path: <linux-usb+bounces-31918-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B01DCF3DD6
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 14:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ACE343005F05
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 13:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C6D341058;
	Mon,  5 Jan 2026 13:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="bhIi7bCv"
X-Original-To: linux-usb@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03206340DB2;
	Mon,  5 Jan 2026 13:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767620430; cv=pass; b=FzsKPb4WkrHITxeV+v54ZIzB5VqtyYfY0T7HGnE7U8QGI6yjXucyiQf8GkEy+BI+jWQ5EQ9o9dQIlvozw7JaWLaJ9hmdGzmX7I/9s4B0rIrx55l80flz7lr0lYXvV0v8Hir2FN6yVCFHatfOFLd+zHYuWu4hRIC8CVTB2IO8z/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767620430; c=relaxed/simple;
	bh=bVBizW76SECHShuv+DZh5Mbhrg8dkvmw9aI4M5tHzYs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=diiBIoIXA0lJJ3pACIPyRD4H+Ut6bFUvD1w6mF/rDTuVSgARXEM3CBZLlz+SoYm3gNccD1bD4LoTvZy70GylUUhJvzrUfF/3GzZEMvwKjJcjGDB7l8SpFKBuMwyft+yKPMOKlDzf7SAtHv1mIT4tpmnUOa69Tatwmvfi4BeUrl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=bhIi7bCv; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1767620420; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=X0vHW3vGku20OakSmzaXWNsB4NoCa/lF11yE7FHKaRnYRe9RAqbUypyDE0g1TQWOKbwyS1c9I+qwmmqbOcHEtvDp6oPrP7Jar/t4Fic3CzPdIizg3UUB08X+vGnwRQH2rcC5v2IJnyVhJVtArdvCP2B1JTkG30YpVGTvtHZgNxQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767620420; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bVBizW76SECHShuv+DZh5Mbhrg8dkvmw9aI4M5tHzYs=; 
	b=UOxzpLBp3GLnHAENZmCHvU89agIxAxksPmq+v0H8IFevumDOdt3CNSjjRWHCpuoHvs7ggKOUcGbEqcPrO1eWYcLHkED7x8RPOsee9+yTJOkx2pPvbXcPZal3Xx/B2r+XRjgbmNR3L4uyUsOkLc4knocfPIr+mlvB9IXQOatLTlg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767620420;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=bVBizW76SECHShuv+DZh5Mbhrg8dkvmw9aI4M5tHzYs=;
	b=bhIi7bCvoChEdbJpCXWdAyEXbDK2GR6S51wclz7XKUZY+l4ZeI/impofs99k3UwT
	4C6EhxtSVu8cg+nf292MrDY64FHJD7j5h7dty3lQTlZ4f11c7uGM/2cRX3E8BSac2Oz
	u88ldmMZL+qlM0WLYrlMvMDZjYMdDBLR7UVyfluQ=
Received: by mx.zohomail.com with SMTPS id 1767620418499859.6597161259574;
	Mon, 5 Jan 2026 05:40:18 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2 24/27] rust: usb: add __rust_helper to helpers
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260105-define-rust-helper-v2-24-51da5f454a67@google.com>
Date: Mon, 5 Jan 2026 10:40:04 -0300
Cc: rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C2DE044A-4CC6-4C4E-BC26-ADF46055940F@collabora.com>
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
 <20260105-define-rust-helper-v2-24-51da5f454a67@google.com>
To: Alice Ryhl <aliceryhl@google.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 5 Jan 2026, at 09:42, Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> This is needed to inline these helpers into Rust code.
>=20
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> Cc: Daniel Almeida <daniel.almeida@collabora.com>
> ---
> rust/helpers/usb.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/rust/helpers/usb.c b/rust/helpers/usb.c
> index =
fb2aad0cbf4d26ac7fb1a3f176ee7a1d30800f92..eff1cf7be3c2d10b7e9248252d354eb8=
a4fd4c94 100644
> --- a/rust/helpers/usb.c
> +++ b/rust/helpers/usb.c
> @@ -2,7 +2,8 @@
>=20
> #include <linux/usb.h>
>=20
> -struct usb_device *rust_helper_interface_to_usbdev(struct =
usb_interface *intf)
> +__rust_helper struct usb_device *
> +rust_helper_interface_to_usbdev(struct usb_interface *intf)
> {
> return interface_to_usbdev(intf);
> }
>=20
> --=20
> 2.52.0.351.gbe84eed79e-goog
>=20
>=20


Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=

