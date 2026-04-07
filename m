Return-Path: <linux-usb+bounces-36040-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DIMOve81GmWwwcAu9opvQ
	(envelope-from <linux-usb+bounces-36040-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 10:14:47 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 489113AB2A2
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 10:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65C483014961
	for <lists+linux-usb@lfdr.de>; Tue,  7 Apr 2026 08:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1BC13A4525;
	Tue,  7 Apr 2026 08:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXxLJIQp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D5738AC9D
	for <linux-usb@vger.kernel.org>; Tue,  7 Apr 2026 08:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775549671; cv=pass; b=Bgmfup+4iPtCpVQO++/LJJrqsFqwOffFvzCwhG/U7UMcYe4HxEmKW0RLFVVAr1OjiokHzms9NR0bEajS56e2VQlyQd33AT8V3jRpzJNXtxiLceMWYvroIX6doz64LinV/YghpqoqVJ5znCKYGp1TXN4/LVsVVATTeGNn9H9CBaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775549671; c=relaxed/simple;
	bh=WVCEmjgS09zO3e5fAjq6y3FwhFjaPYnYJy0t0KPQaQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZUhMOg859KI9YUmhngiCc88zXR46hpVwf/09Q5EjW9wJIQFPz5MwQShr9UnUI/mDRbaweiTUwjYyrhZaCdvdr7o2qZU5nBuBdZer0scKuVVJdR2mJQ9PY1136zZuMH3eztbAyNvDFUrajhi8CuUKZjdGO/BEjk9AOreLUON6ACE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JXxLJIQp; arc=pass smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8d428da4300so371042085a.3
        for <linux-usb@vger.kernel.org>; Tue, 07 Apr 2026 01:14:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775549668; cv=none;
        d=google.com; s=arc-20240605;
        b=Go0jDoefhceGWmektkLr5fhb0pg5QKxftrL5tnPlq2IJpM7TzLkKp8TU0jaVFyb+XL
         Yq7j0B5OfF+voKTvSaqkO1K5dkank6JSPw7E/u/34/x8rMmqAw7uVnc4afJ/FV7s5Ye4
         kKb/0m/G+2Y1kK+KEncD6dBGbYUSV/5TtExWRpIoOmT81avbI9gHNrITQikgy9Vu7u0j
         314C5073mlpD/I7Jc8IuKiwKY3EyLUdQwPhflzPmOhYivqgESCK4NXSutoaOWs/trDUU
         Lnr+rwA3QSQ2RwD0HUTfvEl48dza03F8WcbVx0m/Tx1xinx8heAeMglXMZf0QG7i3baN
         LrTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NFzrP5S7sHZljreBvbCEsGL4Od0awwRFz+YQ0R4KNj0=;
        fh=6RfTh/nJx93oSGbiIWyOMbYxS8C0pgPYjxEKaPw8q3M=;
        b=Ym8NhJbx232d9caA1Aq/YMYgYyTPNMYlbkJR5Uxvgt/F2tFWhqbw5B5rc//i+dVCUR
         ii6RNZFxgtwXcGvECpQlexbg9864hNtmt48+d+98Km4VL6smsG39mozqVb/38UhzCbvT
         IGOV7z/9O8fz7VYXKHOd9NfTz/nq9k0DD2QY0Ana2du2+7WLb0t3v1u6jYxE4B0PTHyt
         M5SH3PFVAihfYOe9QpVq/uyGXNXp/m7XakSurdNxoBH/N5l52yeN0BSYijeOGWRNCULH
         T8nPQBoFK95WuILCOf2uhPDywGysA7tSOUOpDQg0yk110ew8ZavFa0XZRbPuX1SRrRni
         Mpmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775549668; x=1776154468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFzrP5S7sHZljreBvbCEsGL4Od0awwRFz+YQ0R4KNj0=;
        b=JXxLJIQp2JLZGBC3W8e0FLtiQvlhPEze5exk1XB+SAMDy5vd615DMm/NEHbey3s+w2
         qpzh/UPus27wDnRsoWkzgENm0A0Ln0W+yBvVndAqibURsiaYz4gCHKTTMTdY+/YEAzcL
         vKwe0Sx09LJ90LEQJcAOIEtkwJEFW89F4lNGVkpibIcI/Q7rxuJ1dVHnNfmUxSvNgNvT
         cSe9CCXzfTrhNocwep0CtXzhAr0q8jRYH7RkFeld/berGkSY+fXx0QOxsr/WVNUTyRCC
         Ut5Yvz9MLzeNccjGRGlfXecKXXtL7WycbPUJhUM/4W6OxOhqoSU5mHlh37Qct4zKOiTh
         sK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775549668; x=1776154468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NFzrP5S7sHZljreBvbCEsGL4Od0awwRFz+YQ0R4KNj0=;
        b=O3dTIfEE/3yIKXQXVAZHV127hzxocBGmRY56S3giU6L67Ctrun5va+rHsOG+f6UALU
         ta3X3n03jHFld9NFRdt2DHyLfMYsN8eZ2pwGijUhFMh08H2TVpWpEjYs43xX/j4FGufb
         yef4XIQKpyOwfQrMj48ptefiUAD0I1J8hEroMXQRTnTipsB6XGxxUpS92PCRHA118ABD
         JyntJoAuKK6iXvutjnxfyCb0N4QoCPaSIBHd5JP2vFWWUtr1kjkhJlvxu6yhI32XLJqO
         vXtOhih4jAXX0bgI3TlKH8PkpaE37CqeVDY9ucKso/p9pRg3rnlh5kc7/aMrQQYqADv7
         szUw==
X-Forwarded-Encrypted: i=1; AJvYcCWxdinwVFbRmfmslkzi2dE0Ocvn4HV3Bz3P63srjjnmYIi5KJS97Nf2rPXcfTEbwIXNuF0jZZxxP/k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXoCO1mWbwGmcRXtfShYlA5hMmLpyDrk1iV2OXDwDGoRtrEM8F
	3D+kH15e3YUtTMJM6EK6dhjc/GO6CQn7fU4KKoudwzjpFg32GJBwwg69UpFKMxUwQWoul/8H6JY
	BP5WJRzxcySNhfdaSlXucf3TWmkqsBgw=
X-Gm-Gg: AeBDietBZtIZl7eyQnBTF3JNsf1rYB1I68hA+TLlJfAVo17+aDrJY3pgtMtAtihlQeF
	k+o+tZo7OOGh5lc6Vmb2WlFVWuzLOUNR8FJEG43QNy/Qhwv3/dtCsxR9W/i0Tqoy/bBjdOfIl6K
	6/KxlQ6Qy9eXLU1K/pQNz6VhypDkWGWbOQ4fgejfFa2K+ZK52LgWkVEYl1ooPpCXnkjRMNo6FUH
	y5aZV7sA+ghYicfxDDn1XWvh/bkhU6keNzFCEs3f0+p+8YFWYnGCu5+/r8cwJsr/3jZcHP570XB
	BTG4VjzAyBkZJkY9/1oKmrwNk0lbMEEAqtBodRM56+nvA6wkjGCg+VQiYSwJGfccO6qZ
X-Received: by 2002:a05:6214:3307:b0:8a4:58ff:f0ff with SMTP id
 6a1803df08f44-8a7024bb658mr213997486d6.17.1775549668360; Tue, 07 Apr 2026
 01:14:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402180008.64233-1-ethantidmore06@gmail.com>
In-Reply-To: <20260402180008.64233-1-ethantidmore06@gmail.com>
From: Michael Zimmermann <sigmaepsilon92@gmail.com>
Date: Tue, 7 Apr 2026 10:14:13 +0200
X-Gm-Features: AQROBzCq4mMlxYE8T2kEwBaPJeFI-s6QQRFc75liLxkB4_7Ab0ktxqwjyNsuG34
Message-ID: <CAN9vWDL1-e9jhcJakZMqAJSix-_dmYSST=NcXE3qM3LsTvs6pw@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: f_hid: Add missing error code
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: gregkh@linuxfoundation.org, peter@korsgaard.com, mhklinux@outlook.com, 
	linuxhid@cosmicgizmosystems.com, danisjiang@gmail.com, kees@kernel.org, 
	hoff.benjamin.k@gmail.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36040-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,korsgaard.com,outlook.com,cosmicgizmosystems.com,gmail.com,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sigmaepsilon92@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 489113AB2A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 2, 2026 at 8:00=E2=80=AFPM Ethan Tidmore <ethantidmore06@gmail.=
com> wrote:
>
> Currently in cdev_alloc() error path no error code is assigned.
>
> Assign error code '-ENOMEM'.
>
> Detected by Smatch:
> drivers/usb/gadget/function/f_hid.c:1291 hidg_bind()
> warn: missing error code 'status'
>
> Fixes: 81ebd43cc0d6d ("usb: gadget: f_hid: don't call cdev_init while cde=
v in use")
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
> ---
>  drivers/usb/gadget/function/f_hid.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/fun=
ction/f_hid.c
> index e0c3f39ee95e..c5a12a6760ea 100644
> --- a/drivers/usb/gadget/function/f_hid.c
> +++ b/drivers/usb/gadget/function/f_hid.c
> @@ -1278,8 +1278,10 @@ static int hidg_bind(struct usb_configuration *c, =
struct usb_function *f)
>
>         /* create char device */
>         hidg->cdev =3D cdev_alloc();
> -       if (!hidg->cdev)
> +       if (!hidg->cdev) {
> +               status =3D -ENOMEM;
>                 goto fail_free_all;
> +       }
>         hidg->cdev->ops =3D &f_hidg_fops;
>
>         status =3D cdev_device_add(hidg->cdev, &hidg->dev);
> --
> 2.53.0
>

Reviewed-by: Michael Zimmermann <sigmaepsilon92@gmail.com>

