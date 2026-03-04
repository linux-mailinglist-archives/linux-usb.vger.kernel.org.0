Return-Path: <linux-usb+bounces-33982-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QP8cA+VLqGmvsgAAu9opvQ
	(envelope-from <linux-usb+bounces-33982-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 16:12:37 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 043E5202568
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 16:12:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 700F030786D8
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 14:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8554F3B8920;
	Wed,  4 Mar 2026 14:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSddbu5B"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58883B3C12
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 14:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772636083; cv=pass; b=hZ8QTCNHV1KiDuUlzEt++6DRWuWuhckgJ81hhK315cGm8ERRj0oggshK57wnuxwRSSaq1JpPZQnC/N+1IsTbum0wUMfr/AgKwYF7LXfuEgAD2BR8scC6HaoTAfvS6QwUTBiTGe3iYHp3xTuYmbmXMPXOzMvjOfvzdiT1zaYWqSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772636083; c=relaxed/simple;
	bh=2rGnTSRAJJOKt1gmGHH5gM3K1shQqGnT94G8HXPLcBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EZXn1UR/nrAXLIPuBsm6fYL347e2tFp+w4QqA06uvYuyB0dlzM/DBr9EEGbFO+BaTOEuTMSngHT3Z131ldRStglnTbUvi27b/2IiBQIDf+GmN/VEjl9vTyvPitF+NZMCCzxBwvv4qG2QNdHxWfW0/rgPGA0gg2yoDjns37ICPac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSddbu5B; arc=pass smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-67a22322cebso833159eaf.0
        for <linux-usb@vger.kernel.org>; Wed, 04 Mar 2026 06:54:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772636081; cv=none;
        d=google.com; s=arc-20240605;
        b=Cw+kJu4+ZTbsg45+cveXDkuXxQ7oUSsf0oHv5jLOwuXzOocaPRB74KVFnzoYlhBW+b
         ro44T6d2IDnRYKjE2OZOy1/EoP1UG6tcAUY0y/EpYXTmEfuZnuXA2a67nl74d7uzwRcj
         niUFY2nybh+iZAwQ0EvM2X11T3VY2nzd2gW2u6BNt74YmMRdDyn8uPbWvNjoDsG3RGcD
         iRVgZAUzJ7Zb3FcaOKLDnJPRrCsK/7RwNENF5FVn32aF6cpXOjG3M4mzF7hc4PMOovpz
         culwLxKAQ6yQN+RbW5/Oemy1d4a4XmFS51pEUbdtFy1Xq+b0NPJ880eo+3Gil21WDE66
         wDQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oWGrwXYXOAjB1PUD7N90yXMmFGW91nf6mDKkAxrVzbY=;
        fh=Bge3XM/j/gyLD8jv9mGRiJzhP3jYBAW/AwsbuFufHGY=;
        b=Z2yd1GRlTjwxsKOVLhvDgnTh6KxT1S0I3eO/5QxEe9oIvAkLrBY9LnjzJmi8j4UheG
         QRmSX8wvaL6gbO8elK2TDtVkNCI3RtMULqDtikJOKcPmxEguODQ+FBriGgKG2L7ecKAg
         o8aX7uPM4VBppIWNLYfiZ+PEa7c1KDsI9UbPvsyaEwDJxtJYc71NphlbPNDiJVzGJI5w
         hS2a69BQu5LQ2f6Iy+cH8cvU09iZi32I6LQ/ph+LHIBZB7uygJvo55hghINzX+lEfEK3
         BnRKjP+tY6M39eDbC5DPEU6a+48E2dUaBf/cnamaJCtAq5H+oqFVku6wE4FAMdxVoHvS
         fYhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772636081; x=1773240881; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWGrwXYXOAjB1PUD7N90yXMmFGW91nf6mDKkAxrVzbY=;
        b=eSddbu5Bu3Dt1W3eELywhodVNYWkGfpvEu2hRbL8Ylb1G77N9lDYHuaHgQp0Ffo+a9
         kXLxDaBqPnx2BplClv1LbRI1nH+p0Atjxh1G6MLWpRtzgO36UzaiTz52zyOwjcAx1Q5X
         L+2eqgqgi/jweUO1EkVLAMUMPHwmuB6PCxPogmFk4CGaPTeAHDpWMJFL7sz56FeY+xHn
         0/tuog9cwDr6Fx9xW/t5HzrfmgX2bHa6db71ellS7fkEFEvH5vw+j4hDCzMdckMEup1b
         bYObLNb7Yi8jnddFPad48gnTqiS0e3/8RXLPNcRLzEAE79CuLoQ8wy57lUCl+3pcLLSR
         MOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772636081; x=1773240881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oWGrwXYXOAjB1PUD7N90yXMmFGW91nf6mDKkAxrVzbY=;
        b=EzgMoV89F1Hcl3iAV4EZM3wYfessy8yoc8ranAcbS3ca7jG94+21HKkK6jEFXJobir
         buazp+p2p+VvA8486cICvC/q9AlAPgVkSUKft8a+3QAANlmZqBVJ3bk7v1608//Ks0Nj
         aat0Cvp8QXr0/0iQopsod7BekR8TieAOqpCCvpCzmPGj196PTXc6I7jUMokGqi6zSxb8
         Ru7rE+R9akgOs39hqXwWIukCRJz8bHhBi0Y7SMNbj3CJf4PCqPZ/n7To9f0gyUuUgwfB
         H9Z2GX3xjDssTVlinQ+rSP1mg5E6FlhIM/xNTUJzwp54FKhFkJXV7idFgv/swq56bgOz
         RCbw==
X-Forwarded-Encrypted: i=1; AJvYcCWQp2CR/tvpHfhhoUjssgDy/8nhzbhfDm7GxUon5WmZjf4ypF/HCm5HOv8MSo3l19TBFPVGsvCIHKk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxry5Mpbrxp/KG7wlEdrUaYzP56S91/3uTeEYJZquXUZtZL/nLT
	iff8uZm1NcB5unnwX7htckcylLENlUObMDfoj67AXZiFUv+nIKwjKYnqyMWVxqYjBQG8hOSiHbZ
	HPDoGMzF74SeAo1GD5uKOzu4L9BnrpWl6pomj
X-Gm-Gg: ATEYQzzNHgmVjDnkhiay98RTJqyR9Fv31i0oVPk2A9Oqc22mNV05F6igSYU1P+mKUpd
	hd3KrrdFVK0UAmHw/MDHF4JTMs3dwxWHJBQrie7///MrH7gF1sz0uYCDHPoAPqy7JxbkNwJgkxr
	XSFYnnMjt+RGVKubmSiqhCIXYz05Uk8Idhk6qyEnMixqqJ6/8mon7SnnpRla5mANUcH2GmOcFlU
	UUxFdFK2t9lgdoLQPdNcnrKGMAI+qQAJyEsA8pzTPluaiQz2ffkOGKQGUinJxkMVD6i/h3YNTKX
	TxaMdgPFG7Zrcpar5ILWQ2Y6i5BDwR7j9hZepPD3duw8Y9SVZJV2/xLrPWVkae/Iqwac5q0P2w=
	=
X-Received: by 2002:a4a:ec4c:0:b0:679:e765:dafc with SMTP id
 006d021491bc7-67b177035f1mr1330720eaf.19.1772636080637; Wed, 04 Mar 2026
 06:54:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304130116.1721682-1-oneukum@suse.com>
In-Reply-To: <20260304130116.1721682-1-oneukum@suse.com>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Wed, 4 Mar 2026 22:54:29 +0800
X-Gm-Features: AaiRm53gogrBc5bArVCODx6pbdNIH9lj_te5dFsdL30I6ngEwaq6CPc1P5fu_f8
Message-ID: <CALbr=LYe7O7f=YZZB+cGqY0hDPLhO74-2h-=EbZTpSU=cpqh2Q@mail.gmail.com>
Subject: Re: [PATCH] usb: class: cdc-wdm: fix reordering issue in read code path
To: Oliver Neukum <oneukum@suse.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 043E5202568
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33982-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hanguidong02@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid]
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

smp_store_release(&desc->length, desc->length + length);

>                 }
>         }
>  skip_error:
> @@ -533,6 +534,7 @@ static ssize_t wdm_read
>                 return -ERESTARTSYS;
>
>         cntr =3D READ_ONCE(desc->length);
> +       smp_rmb(); /* against wdm_in_callback() */

cntr =3D smp_load_acquire(&desc->length);

I just realized one minor detail.

Instead of using smp_wmb() + WRITE_ONCE() and smp_rmb() + READ_ONCE(),
we could use smp_store_release() and smp_load_acquire().

It perfectly matches the acquire/release semantics here and might
bring slight performance benefits in some scenarios.

Feel free to send a v2 if you like the idea. But no pressure at all=E2=80=
=94I
am totally fine with the current v1 as well, so it is entirely up to
you.

>         if (cntr =3D=3D 0) {
>                 desc->read =3D 0;
>  retry:
> --
> 2.53.0
>

