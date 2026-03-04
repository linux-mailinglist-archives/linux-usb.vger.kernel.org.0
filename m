Return-Path: <linux-usb+bounces-33978-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMGuOU83qGm+pQAAu9opvQ
	(envelope-from <linux-usb+bounces-33978-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 14:44:47 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E12200A4F
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 14:44:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5424130412B4
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 13:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46DCE3909A0;
	Wed,  4 Mar 2026 13:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lR8QffCJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30DE279336
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 13:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772631841; cv=pass; b=tcelXTxaALArlrqY7n3M90/+MMRjkq46zIJRmu9nSe31dZ5/v5a0VVP2NEIb7UG7v4LV/axlrt8HcSXvSf3tmPIxEo7pNrw4HQ65WEAVueTGiIZcW0u5cyCdDO0U5/i6oLcCtc1BWBQfM9zejexjBJrFZJNba+fTmGaxtePO7AQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772631841; c=relaxed/simple;
	bh=KVfvC51BNNZiHHy/lZFcZ/hsYdx9VjFxTiInIpqjayE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jGRg2Rg9Xprz5zm7SmauhsRuPCPTZ9jl2ldP5WddoaA9wKynTeV8FZm23AXX4kWUbrYGHQo7pxdZfz8ErQOPiitLH5IH9W1cofaXTEpbLYbuUuQx5acOpMw2itTa0a7x54SOVMuRpGgUjH/MpiiW00bCwiZsy7mT6Auyc9tjRoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lR8QffCJ; arc=pass smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-408778a8ec4so1198488fac.0
        for <linux-usb@vger.kernel.org>; Wed, 04 Mar 2026 05:43:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772631839; cv=none;
        d=google.com; s=arc-20240605;
        b=RmbOvwMuqNycNQk6ncMLHB6dOzlzEEfmw8rwfVszzAGDYBlQFhZ/L0h4LLBBucLsvk
         z0tzPGV2cYHYTaDamC+FlbnXLq+se3HxobOsLGHgPps3CY8InrJjukkV8ZaO1OK2Vddt
         rb1NyC/cDsGgUQ+p/PV0DRikScDjJKbYhEdQi1I2sc9q2wRD1SkITUjaILfNh/S8H+l6
         P32AOfmPXbg1Oaovu1Sf4I0tZn10c4YCh/hkUMaMyA7q58z28SXBkVrQnDMjW/U6lmTe
         /mD8anbnkz3zMXiqszWUZjihGAs7wODfMCpxBrjI4DYDx6ivs2j9iThmew2qUy2B5uDx
         VVHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7Hbz9A7QEb1rOgFp4ts57gJqwIDHVAC6QEqbYcTGI8Y=;
        fh=v6XeYWRNvNp6i9InMfR6jSUp42+JY9hxu3dGH0StABA=;
        b=AiShmvVcB3dRs6S0GRhuwgpYovQwBXEuotIAJDrJvZbJLusTeXP4RgK807El7SnRpJ
         ezPkEm+jfaDp/oavFPq0JseniH4wXlQ9NXYZZnLL+hzputfMy4YgAewxZ03Yw6j1Kp51
         BQvolCP2TAWiwx873O9mPVfkQh1XziLbYSmac/pVnG2CRroBd4deFTWbPWyRceasMy97
         yOXwmnsSyn+ffvvN5b2ne4SK9BIlZZFfOUAI8tC9bpGMDn3JgIjwGa4sCviBGnfaFg2e
         4Vrl22YMY/jlVtDZiAjdTGHtZpGlBJRFC745HeHl98P4SSJLWKze/YafYNXn1LFKf/SK
         mWUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772631839; x=1773236639; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Hbz9A7QEb1rOgFp4ts57gJqwIDHVAC6QEqbYcTGI8Y=;
        b=lR8QffCJdBPJRt8FDxAAyOrWUyUD4q3oPmsb+/roX4FrJFY6tZoD2P8fHX3+rzMTGu
         7TKkdlA15ZKTSDhQCXVHy9qIcpFawfe/8TMLzhsXFah4jtAZvs6+0Z6pd1vqbRADqQif
         55deWNYgE3rS/l70psdPAsQoz31rCkT86ubMCYzrg6EFl7sendnU0PbsF20M2t1TeuzU
         pT7caqAktThXehnF3fj5g8CH1svH7raioegAlMO+uEsJtUzFBLj7kW+ER67Fq1AyLThc
         5EGv7qC7cDH5Uz5sy3bTAC9Sy6hDeW27+1PQj/4gTGii0llBBWgO8oH+wz85VTD4VBuJ
         5jcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772631839; x=1773236639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7Hbz9A7QEb1rOgFp4ts57gJqwIDHVAC6QEqbYcTGI8Y=;
        b=ihMKGx4i3SV2paeIZnR6I7Q5l2kM6fh2Q2vfqvRLvwgrhFI7JpNkjKv9npajm3eBDt
         aIookkzKQ/FMGVPSeynqKhzw18I2i9dGq8kPc+cuR64M8ya1v3QR6R0HX21XtZuCCaiD
         Ve7oCILiU1JI6xMR90qX0AAf7KjHupakDFHhiRGyeUyAEQGwvFLwhYrHnlho7E8bdB4q
         M7Zd6l6W+8rHaAWpnsFS+V9pgH1JtsuyyuJCco4vJjObMciO4jvPzA+1edKAMAM6rtca
         QUZEqunYMG10o/9UXt/gCoo0i0rQvPbog15XYXJ9bG/Jgwk6z0idcH1nG3Z5qnpH+up4
         wvng==
X-Forwarded-Encrypted: i=1; AJvYcCXmo7G6ElSkFdcMpD5pdWDLDtJer84ZcBj9oLPZF8/2bvnUZQbZzZrpraIk6j+ouh8/S7G5suogBZk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEBHJHFS29uOYXEAO3mceDNv/ixbQTBRJni8ZRZM6qeKNyTZTX
	xbWSYUHmkB55v3ZK90AkMn0RhQJFjl0CkjJujnJQ3akNaA/XlsuWZimzLdgqxsyy5FN0MiFetFj
	MdzLVo5nTtkzl4k8zPukOZ7xd8vFskZDwH/fc
X-Gm-Gg: ATEYQzxDgcWl/eWpeAjl8NdJVuOi+wSsH241+pFyuZEugCEyuvFHRfk0HYHJKT8Rwyi
	501Wlp2Y0ubgd29FAntHbApVMB54LzlakytCtiLJNDswBEZLYYt5ldZF7GyA2AUPrF4+m//oFve
	jTIbDd6ItDeAMWA/UZpHxVh2L7FZAOHqeInbjBGEW1Wo72wLnLvW7ZynA9SRF2m2j5lBlt0PieV
	Rha0Bl4QePjfVNA1Smyosy0MUIgIT0GUUXMiTG3tNIS+LGmtx8E/pLK7Yl4foeDn1hp88dgTecz
	+EozZmvUGCyxslKzdxshiqLt+nK3ZnT0xrw1O/fnmVXsxukbtY2R0hSm+jIXNBukJ/lE7e/tLA=
	=
X-Received: by 2002:a05:6870:7008:b0:409:5ade:7063 with SMTP id
 586e51a60fabf-416aba5d00amr1286086fac.32.1772631838555; Wed, 04 Mar 2026
 05:43:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304130116.1721682-1-oneukum@suse.com>
In-Reply-To: <20260304130116.1721682-1-oneukum@suse.com>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Wed, 4 Mar 2026 21:43:47 +0800
X-Gm-Features: AaiRm51XMU0i6qgHYwpOdAwWzcpkvRzj1zL7kwjJbHmZ0bR23ajQHoldmR6AJd0
Message-ID: <CALbr=LZLTrAHLVeE2twUoHb=S=RCEnhZMjp77E-ZUU2_Krtb6g@mail.gmail.com>
Subject: Re: [PATCH] usb: class: cdc-wdm: fix reordering issue in read code path
To: Oliver Neukum <oneukum@suse.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	Jia-Ju Bai <baijiaju1990@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: F1E12200A4F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33978-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hanguidong02@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 9:01=E2=80=AFPM Oliver Neukum <oneukum@suse.com> wro=
te:
>
> Quoting the bug report:
>
> Due to compiler optimization or CPU out-of-order execution, the
> desc->length update can be reordered before the memmove. If this
> happens, wdm_read() can see the new length and call copy_to_user() on
> uninitialized memory. This also violates LKMM data race rules [1].
>
> Fix it by using WRITE_ONCE and memory barriers.
>
> Fixes: afba937e540c9 ("USB: CDC WDM driver")

Closes: https://lore.kernel.org/linux-usb/CALbr=3DLbrUZn_cfp7CfR-7Z5wDTHF96=
qeuM=3D3fO2m-q4cDrnC4A@mail.gmail.com/
Reported-by: Gui-Dong Han <hanguidong02@gmail.com>

Looks good for the immediate fix.

As a long-term solution, refactoring this to use kfifo would be much
better. The race condition I reported is just one example of how this
ad-hoc lockless implementation can fail. Hand-rolling lockless
algorithms is highly error-prone and likely hides other subtle bugs.

Reviewed-by: Gui-Dong Han <hanguidong02@gmail.com>

> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/usb/class/cdc-wdm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
> index f2d94cfc70af..7556c0dac908 100644
> --- a/drivers/usb/class/cdc-wdm.c
> +++ b/drivers/usb/class/cdc-wdm.c
> @@ -225,7 +225,8 @@ static void wdm_in_callback(struct urb *urb)
>                 /* we may already be in overflow */
>                 if (!test_bit(WDM_OVERFLOW, &desc->flags)) {
>                         memmove(desc->ubuf + desc->length, desc->inbuf, l=
ength);
> -                       desc->length +=3D length;
> +                       smp_wmb(); /* against wdm_read() */
> +                       WRITE_ONCE(desc->length, desc->length + length);
>                 }
>         }
>  skip_error:
> @@ -533,6 +534,7 @@ static ssize_t wdm_read
>                 return -ERESTARTSYS;
>
>         cntr =3D READ_ONCE(desc->length);
> +       smp_rmb(); /* against wdm_in_callback() */
>         if (cntr =3D=3D 0) {
>                 desc->read =3D 0;
>  retry:
> --
> 2.53.0
>

