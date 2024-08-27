Return-Path: <linux-usb+bounces-14185-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77374961539
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 19:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F75F1F245EF
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 17:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B7AD1D0DC6;
	Tue, 27 Aug 2024 17:14:02 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023EF1CFECE
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 17:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724778842; cv=none; b=nAeHCEEFS4guOLg376NWP8B8njN1XKdUQMOvA9Yvk6ZF7r1W9RZXTDOmv42+M+c+x+wfRatW/cpHhNRlhJ8su6jfNDmNRqxgaOaTDNnqJIatl7kAM5b7TfWjHTKaflmkjrFHGFiLAxqmlG7ls8uAQGj+nk/rZlhIyHE5/nw/vmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724778842; c=relaxed/simple;
	bh=VTHNMJuIWalwgU2VfUrTvqwD0q/dzKXGq/joqrcZ2ZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ba0FZjXsScR4qr8xIACRFzhMWyLxTR9iCnur2D4zSfcCg+aIYpl91rpa2BEqQqrmpOxY2BHM+9210GUJ2jKWg2KtI25wR1krDsz2lx+oQgF7f6FQzj6KyPQk/kNLcWuChqxDMRojHd5iRFV58jENYSFm/kFVbS1U9HV9Mg641v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mgr@pengutronix.de>)
	id 1sizlJ-0006U8-Bs; Tue, 27 Aug 2024 19:13:45 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mgr@pengutronix.de>)
	id 1sizlE-003TxI-T5; Tue, 27 Aug 2024 19:13:40 +0200
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mgr@pengutronix.de>)
	id 1sizlE-0091ks-2W;
	Tue, 27 Aug 2024 19:13:40 +0200
Date: Tue, 27 Aug 2024 19:13:40 +0200
From: Michael Grzeschik <mgr@pengutronix.de>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: andrzej.p@collabora.com, asmadeus@codewreck.org, corbet@lwn.net,
	ericvh@kernel.org, gregkh@linuxfoundation.org,
	kernel@pengutronix.de, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux_oss@crudebyte.com, lucho@ionkov.net, v9fs@lists.linux.dev
Subject: Re: [PATCH v10 1/3] usb: gadget: function: move u_f.h to
 include/linux/usb/func_utils.h
Message-ID: <Zs4JRPR9CKWX_hWb@pengutronix.de>
References: <20240116-ml-topic-u9p-v10-0-a85fdeac2c52@pengutronix.de>
 <20240116-ml-topic-u9p-v10-1-a85fdeac2c52@pengutronix.de>
 <1a5d3a68-56e5-4084-b86c-e60542cbbb98@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0j5NiQ+wIVM5a7qk"
Content-Disposition: inline
In-Reply-To: <1a5d3a68-56e5-4084-b86c-e60542cbbb98@wanadoo.fr>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org


--0j5NiQ+wIVM5a7qk
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2024 at 06:46:39PM +0200, Christophe JAILLET wrote:
>Le 26/08/2024 =E0 23:47, Michael Grzeschik a =E9crit=A0:
>>We move the func_utils.h header to include/linux/usb to be
>>able to compile function drivers outside of the
>>drivers/usb/gadget/function directory.
>>
>>Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@publ=
ic.gmane.org>
>>
>>---
>>v9 -> v10:
>>   - respect alphabetical order
>>   - correctly changed filename in func_utils.h itself
>>
>
>...
>
>>index e313c3b8dcb19..e7b69e3145c07 100644
>>--- a/drivers/usb/gadget/u_f.h
>>+++ b/include/linux/usb/func_utils.h
>>@@ -1,6 +1,6 @@
>>  // SPDX-License-Identifier: GPL-2.0
>>  /*
>>- * u_f.h
>>+ * func_utils.h
>>   *
>>   * Utility definitions for USB functions
>>   *
>>
>
>Maybe the include guard could be updated as-well?
>
>By include guard I mean:
>
>	#ifndef __U_F_H__
>	#define __U_F_H__
>	...
>	#endif /* __U_F_H__ */
>
>s/__U_F_H__/_FUNC_UTILS_H_/ or something like that.
>
>CJ
>

Doh! I missed that but will spin another round!

Thanks,
Michael



--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--0j5NiQ+wIVM5a7qk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmbOCUEACgkQC+njFXoe
LGQiCxAAlPehYXviL/Tao53N3ObBQa9mJ0Oiw7j+6/nmmk1A1NbOz/92pmKZLxxp
a+l8k4VKNf7mUW3FaszDXabIpq9844Qoh7SqrtBvVA+a6mcggDBuJbGQfVKnAB7n
asBnF0InhhXRkhCmpELmrTOIaPt8Q4TTTZXWRRTEvPxQ2rh/5VbpErQ4OwT6Wy/o
P2HH/9s467xfmcEEuy8uKLuAOXuTiTKCCPtwqxoO4x6zw2N4j2hgH79VzzZb95kv
+c+AaZrHQb+jQ9maDliIqyEHbhCBfgS0IKVLFH6scwooL1TLNIcMKRg7fZorOvBp
s+imoVuNZV9fSXT5JdENSM5gDkqyTj9vJTleW7/JAEZ7G/mbRuIqe23Sj9LoA910
iWXtmnvR2atikD3gUlJE9DwrFG9SK0aQp9ac7pcn72MWaKk0asAsNoXD59aYQRrw
rZSrG1TWNt8RHnD6wpP0NfqxQDtimXqUSateAxQa9cMqN981C887dNDjrC5468WB
rtqKo1r3YPT+qyhOxNahLp775nRCujzvmS+DIZa5knjkwP25KBMNanGMnRjjPnz5
/wsBhYP7u+BRKtaAJDxXhmOOq3klBi25T2N5ET3GGDGFkhUkGxTzUAIIrrxlENmF
pvFLTqOyhKFa5hjrq4RbOk+Hp5YgFiyC2Z/GsROkf7wjSDOah68=
=vBTo
-----END PGP SIGNATURE-----

--0j5NiQ+wIVM5a7qk--

