Return-Path: <linux-usb+bounces-35501-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DL1KN0MxWkI6AQAu9opvQ
	(envelope-from <linux-usb+bounces-35501-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 11:39:25 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D4033396D
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 11:39:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A4B630B7A38
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 10:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D5953C060C;
	Thu, 26 Mar 2026 10:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="amnb3/o8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3178130BBB9
	for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 10:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520304; cv=pass; b=RRb1i9nB4eBK4zKJAMMGg5MMwMGVx2c3T7QsFwwEU74lcm5NSvpZT1/y/mVX5+hgR0zIiTJE69k10lAJXlYKaIi6A8cnS78FN9hS0mJTogB4N67NGIUIz0064o69diwYaZfnCGigqAGUyvsWFp0srwGOwhNrgP3KRfNZ563QzI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520304; c=relaxed/simple;
	bh=XpyjngGpJ5+PI+eBsOrfSkU9mat7qKQK55Pu3TyD9Kk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TJcjSpdQ3F0g0XMV1xO3kQAyAdWxI0OTMDjIpj4X/OvS8x7+qUHE44CoPNOvClJLlQGmnYaND5BtAHpZuOVrAdnlqlHGQX4LulKv00FzNcvKbNSZNHlIDmNXN99ypRgAXu0g7yxwSMvH5Lxjd2h0WYladtLPbj/GhIplpo8V0Lc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=amnb3/o8; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486fd27754bso7333325e9.3
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2026 03:18:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774520301; cv=none;
        d=google.com; s=arc-20240605;
        b=KIPASEvNliPNM7VVww4kxSbk76N8JnLJOs4smQIRpFCurq0kS3fm6+umpB0LfYyFIK
         e0R4mkHNtaaoC2KJj7VVKaN/61e/DD5qAOKAqN3z6tvYzS757DbQr0nCxnGejo7LLrj5
         HoltLu/XClYwavLhrLuOP4KyRfr9O98o7XSHwK2ib1DtnYvzUjHY03oVfIxEU2wluRiC
         t2mm6EkMxxQ+mUWTMFZaAQEBju+GZIVKfekZQJKTkyD+Xa9U3QMuF09qtxNmFiXMR0JF
         pm/olwVfh51s6xaI8/6gHUDLdpP9K/WmADaGPUwbJpMJ6ITFFY7y+0ff6B/H6z276zdG
         o3JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0hZ31Y9xWZCM75rHGNXm/vOf5jSrN9UgPQP9ijVlB8Y=;
        fh=uY5z0ixmumuiUl6T23ctHiTNhaPjLpLTwQrRYjCi/zg=;
        b=kKYODu4sMFEBjzVI2eESHXHosd3kh1bNfZ9C8//lSjfsUaqBZjumMYVbOgjoC70gnx
         EXh/gP4zOXJDwoaPXWv2CEtZwHDrZhXpkXzqjFH3OrH+/MeWT+U03Bax/nu5yr+9V7hT
         HCPzh3XwBZjcnIkbe830K8stQfYGHyOEONSo8pyXrl6sRqGucGef1C4NVrK5N5c1iQp7
         4H+TbhXFw5gQlMVD9psovDNwchvwyV+mx23E+2bQ2W5Ctw5933CPsW918VoDIJGoCERK
         k71Iq3jSYxPSPEaF2/iOeLyffiMCmNi0SddNj6xZ1hSroDtS/SaL9/4xH0Y9Pt6mnGpP
         jMoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774520301; x=1775125101; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0hZ31Y9xWZCM75rHGNXm/vOf5jSrN9UgPQP9ijVlB8Y=;
        b=amnb3/o8X9hjy1W/hIam+EapzFfioazixmc+kSrUzMyd0lrrUVs/fqY5Crxe0TZSw1
         mRo7+xoqnd8mH0aXbvfUtn0MWrYzbUXpvnUbbxHO8+9JeGfbJOlUdYJNtBAX/mVRhbUv
         fn5/NfzXd+de84dxR47GxLCJ4XHQFjg5R9Eq+TMgkGpAc+esmCAIw+HB17he+re8atHl
         U+hRuXVbgzkiY4IgZoA0gAOYe0SdBENvAWRxGq5Q3IHfr1tFY2NuWpAOvCRkzB2Edwpi
         zwq0/27B6WsaTF5pxRPrFH5uJWfqkUxgBgJ9o4JUaT35ctQNp/3u29jvApfjOfDvtxkh
         l0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774520301; x=1775125101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0hZ31Y9xWZCM75rHGNXm/vOf5jSrN9UgPQP9ijVlB8Y=;
        b=BEhad93laL1x0QnTGvRK3822TWDoinKzg1WPsrrAwxglG6cSnXdcyidO82ORB6Bw/o
         iWavAZLTmTpepeC4Fvj/KMigC4rL8wnQtUC+SNpKSzuwowSVlNKm5eBTBUDqdAHDeC0q
         SJMxyLsYEZyQupUDsjX1XnOvAmiZeHWvqg9q/+t/wgkgb3juIUN5PuXuSYSyeTnnvZHB
         LiPaQ8Bxzc+8faD2Zd2CzLsDWw974Y7jAx9W3loAiQPkixxvETFC3DHTkJlaR/pe954N
         6fHgADPIFwltBAw8Q3uRgVW75UpaOHxNbLPUWSf1nv/3Ux3mssUW9AFGm9UTdR7cpw8b
         C5Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWKBKsnrYApibDCzM7JiXmad263Zp1n98VeJWr3zXTWPsGB11FxBp32mnQS82qpGV2fugzuUz88nfE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzK9lxCOuWnE5uCQwPQDSrq5qv2H/eN3ppEExtzSs4edCYtentF
	UPWugOlwjjBUC1aFL6j432py5QAJ6c4tQoIGQNtBVxI6d5W++t+YUb3CdZGW9KnLJsn+AZmuMUt
	aQsElxTJWw48af4m49z4nUke/oTMSbt8=
X-Gm-Gg: ATEYQzz2Z0088uSYK397O+1rfysxb56ZSSFLoJmcg0rm6/Ir8vxhpGqj+w0Dpf7o2WV
	oztq8V5KTOV5ygCEXsWa0d05ikJTPJWFceuySiZGmNWaQ+54wvzQwTGjYzlKIekras2sfGiiMMj
	9RwxStF1majikrSYOAVi/DUfhZZgEl/J9Lsjw0t1ty/lLCQD7YrSE9VcBfVOpNmJCiH/1AC8u2E
	AcoV33PFNNpS6AYKPPw6kc6zds/i1YwHgysMrNICS+AzGQWMep00r2dEvQ4NDRRY8cko8xbnGLL
	HkM1Pw7Mr4Y00Qu0xLeqYSyeCQgcA3FqMLqcEJXWig==
X-Received: by 2002:a05:600c:3154:b0:485:9a50:3369 with SMTP id
 5b1f17b1804b1-487160846d9mr94795205e9.29.1774520301331; Thu, 26 Mar 2026
 03:18:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326090222.47796-1-cuiyudong@kylinos.cn>
In-Reply-To: <20260326090222.47796-1-cuiyudong@kylinos.cn>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 26 Mar 2026 11:18:08 +0100
X-Gm-Features: AQROBzCi6MjvXtmn9Lr-aAFSeDs6HnwgHB-HmEqYFABrVT2Qel-vjfWeFx1qL6I
Message-ID: <CA+fCnZd3r47Kx_e5-Hj32NQkWrjrMSuEQSvh7EBNZ8SjZTHzxg@mail.gmail.com>
Subject: Re: [PATCH v2] usb: gadget: raw_gadget: fix double free in raw_release
To: cuiyudong <cuiyudong@kylinos.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	Gopi Krishna Menon <krishnagopi487@gmail.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35501-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andreyknvl@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,appspotmail.com:email]
X-Rspamd-Queue-Id: 08D4033396D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 10:04=E2=80=AFAM cuiyudong <cuiyudong@kylinos.cn> w=
rote:
>
> In raw_release(), when unregister =3D=3D true, there are two kref_put() c=
alls:
> 1. Inside the unregister block (extra)
> 2. At out_put label
>
> The refcount increments are:
> - 1 ref from dev_new() in raw_open()
> - 1 ref from kref_get() in raw_ioctl_run()
>
> Total: 2 references.
>
> The original code performed 3 kref_put() operations, which causes the ref=
count
> to drop below zero and leads to a double free in dev_free().

So where is the 3rd one coming from? Just above you say that there are only=
 2.

>
> Remove the extra kref_put() inside the unregister block to balance the
> reference counter correctly.
>
> Since the extra kref_put() triggers an immediate use-after-free condition
> on the dev structure, KASAN reports a double-free instead of a refcount w=
arning.

This doesn't explain anything. If refcount drops below 0 (as you say
above), shouldn't there be a refcount warning?

>
> BUG: KASAN: double-free in dev_free+0x424/0x740
> Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")
> Reported-by: syzbot+25612fe5ab3dcafc3aab@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/69c401ad.a70a0220.23629d.0000.GAE@goo=
gle.com/
> Signed-off-by: cuiyudong <cuiyudong@kylinos.cn>
> ---
> Changes in v2:
> - Removed Tested-by tag (syzbot did not test the patch)
> - Expanded commit description to explain refcount imbalance and KASAN rep=
ort
> ---
>  drivers/usb/gadget/legacy/raw_gadget.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/=
legacy/raw_gadget.c
> index 4febf8dac7ca..a1fd3fdf1323 100644
> --- a/drivers/usb/gadget/legacy/raw_gadget.c
> +++ b/drivers/usb/gadget/legacy/raw_gadget.c
> @@ -465,12 +465,10 @@ static int raw_release(struct inode *inode, struct =
file *fd)
>                         dev_err(dev->dev,
>                                 "usb_gadget_unregister_driver() failed wi=
th %d\n",
>                                 ret);
> -               /* Matches kref_get() in raw_ioctl_run(). */
> -               kref_put(&dev->count, dev_free);
>         }
>
>  out_put:
> -       /* Matches dev_new() in raw_open(). */
> +       /* Matches dev_new() in raw_open() and kref_get() in raw_ioctl_ru=
n(). */
>         kref_put(&dev->count, dev_free);
>         return ret;
>  }
> --
> 2.25.1
>

