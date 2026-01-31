Return-Path: <linux-usb+bounces-32954-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJgJAVNkfWmtRwIAu9opvQ
	(envelope-from <linux-usb+bounces-32954-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 03:09:23 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 97414C0387
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 03:09:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 08C9E3008301
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 02:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE95732F762;
	Sat, 31 Jan 2026 02:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mdY9sAoL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B324132936C
	for <linux-usb@vger.kernel.org>; Sat, 31 Jan 2026 02:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769825355; cv=pass; b=bro3is3kuqKTVXlmAq+poTTaGITQrFZLIZj9WvLch/w498mr27RIZvNnj+dbuVioGLQmBenczlE+YBlyOzUSA9oSggdCmNzWuXZHcXUAQlgsHfENTTow/E1l9p4igKJ70Z32WZvxyPwXQVkoPWutRljf3lhbl3uSt1Af6owrSoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769825355; c=relaxed/simple;
	bh=q1+m69AC8OyppS+g1qL0airmm2fN+rGF7m5h75RejBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P+BNFxKREAIksMawfrwwigPe+MVvdOInoTicJAwuGW86jXZQ1QyidN13r5mmyils9jrHsUyhaCbX9qNABf58+KzH3101FfdRSQEem61aeiGVKjeyphl1HgqVzC47NLL3sp3bqsCA2yGWYvz7WCWJ15ppfPsTbVk9lrQ36Y719m8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mdY9sAoL; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b8849dc12f6so406058166b.1
        for <linux-usb@vger.kernel.org>; Fri, 30 Jan 2026 18:09:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769825352; cv=none;
        d=google.com; s=arc-20240605;
        b=H97dlf5sKKg0sdDORV1pbcMq5DBSeBhVIj/oWZ7MgDmetNvlBIXp15t76h5rRDUjtu
         eT36U0+JvaxG8t+lORv8p/BMhBupDExJsBSBuapx4FyMSEY502+lXXH0ilGUdpnl5dHt
         zysXnVzt18qPp5opgQQnyRMmJ9bjOWyE9pyIS49bV70z5b0qYURjayz1rvtAG3bycV6m
         6hKt9GKQRUrYEJzwnMNFkTxdjKSaUx+BfxvxuItUaoWTU4PS9igRFudCrAQaI8Ktvrd5
         yE7omqiPi1a0N6e5sjDBP1A5JdyiPAyoYHhnCz3ZC6yWpeTX+jn5cyKbDXrNv01jOKJk
         xSCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fXBSGIys3SzCpVetTGHBAjMTb+eZCN0LoIysZIFKUFQ=;
        fh=I657mEFfl14QRRSH9XiWXxAK0sj6BTJZgaI076Ks22c=;
        b=XZQOMz71uYs8T22n28sr4a+zyNUJwl051U2faji7EcFlegkNI9V2FO4a6X+RUkD41+
         pngvltqdzWSec4MnAxEcp3w/MCcTYyNX11YW+aoraq6cD6mSVUKojQfYi85ivmZGZTP+
         YZf5/vqLQ7S/lvkgaTt0ZxeiKzvD/jl5VScwj+gefVVUXiVZDY0UqM1iUYNj9me/tgKX
         iXtOjqCHr4/Wfovxpaw6CfVb+Fesc10GAP1g1aC4Sz5pI3ZQumdOkPgz6HEbl7pccMIG
         azNifBS+UUPS/HFNhfi6sVEyRpishJGxfI3DFXy60vmjZufBIN88qE5aXQEbgs7oSNGM
         jSKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769825352; x=1770430152; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXBSGIys3SzCpVetTGHBAjMTb+eZCN0LoIysZIFKUFQ=;
        b=mdY9sAoLvV09pJjCxND5Iu74NfN+XMMgrupYs9by8DK5G2zZFOokwzfRRZKmBD1gRY
         AjgQpgB5EjSE4J0xzK51/PodGanFU83GL26fHQqfL9/acxZXA7eQC4icggJ3OPvsx39F
         rYB9x3Oswo696/SSnggh0yy/9Iw7SYfPVlLnKssfKPM5puJqBDEgC8TBKfmP2p9p8y9J
         mT2bVhCFO3fDAmUxql8ri6GZjywb818fU2vt3kLT6LeM+Nf8WkTqwYY0efhXBrLT+AY4
         ERI/xwg6zoS67zkSfCmJiRPlXMmkdYhH8jWl+xYzOwFG7Hx6lv8E8XyifBvgTABOhkOv
         aGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769825352; x=1770430152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fXBSGIys3SzCpVetTGHBAjMTb+eZCN0LoIysZIFKUFQ=;
        b=RDS62+IH0j1tb9JEELj+aP/SV1Yi01jXfF9QzzUQdPwRPt/rrB0g/xB6ftu4TTSqAe
         7GJ86d+736DiV8Mle4pBWBzLtMEvRjxvQwGzbLhKtS4no9M27UFAf9Ne0FIaZlD6WyMx
         1sT/HMZfm3Xv/LnpzFBzIyydDOYbmNQz5aIYJYKEwKg8zSXYBJqB87nHMh2TcJh8/c3p
         rS3JSxO4wpiqs7VNwFjrJTzF03bPpdBVhCY0j+pCbJSeIsajQi6boh0R0gG5D9OkXMVF
         guN8TyZ+agBVERcTG316bZheRT28qGmjv4VWpPHVKOrN49hKwXkRwvT/ruo3ZIhBmguK
         SVYw==
X-Forwarded-Encrypted: i=1; AJvYcCW06S55PmIvk1T9HCRVV6UjElBLapQ5jLBtqv/e3IxYc8IFoyhwKIni4zS4kvC6hCpzEU4YjGRVRPs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6TRpLHZXTCCSe7Hd17zURH51tPEaVCBkJ3TNmg0p2zdFQDsy9
	e5KVS4aWRSG4U+yNTD+yOojOsOQSMSaglJGpa6nxlYTdgQ7Yv06heh5T3UztmNc6JPOZ3SVf+6a
	baqdIna3kddHSY8vbxzxSZrgxJU04tcVOqrSOGJFQ
X-Gm-Gg: AZuq6aI2Q77TWQFfv68ULpm4ibVblxB0xMXi8s67i17oQoqrHCV1CNqUcxDpfgNpXRl
	ZJ4KkXqhxuXB0XIyeOBya4V+OKSRmwnspnpo2lBVZqQDuSBM7Dx7fcf81sLiXr4H9yXYi5bqgyG
	J26uaSdppUTTBBX9+RS51juDGFlHBxhBMJqZCYJO2S91chZdj0RSi8pY6TE++25BB9MwAdzY8Fh
	RFOYmZ3+eFhEQZQWlm4jdrOJwII5MoS0DYX/3KRQRkoo9xBFYJlTJmD+mJptYV8EEu//xwQzroL
	Mlg=
X-Received: by 2002:a17:906:f5a8:b0:b74:984c:a3de with SMTP id
 a640c23a62f3a-b8dff5d84a1mr304116566b.28.1769825351931; Fri, 30 Jan 2026
 18:09:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAG2Kctoo=xiVdhRZnLaoePuu2cuQXMCdj2q6L-iTnb8K1RMHkw@mail.gmail.com>
 <20260128045954.GS3183987@ZenIV> <CAG2KctqWy-gnB4o6FAv3kv6+P2YwqeWMBu7bmHZ=Acq+4vVZ3g@mail.gmail.com>
 <20260129032335.GT3183987@ZenIV> <20260129225433.GU3183987@ZenIV>
 <CAG2KctoNjktJTQqBb7nGeazXe=ncpwjsc+Lm+JotcpaO3Sf9gw@mail.gmail.com>
 <20260130070424.GV3183987@ZenIV> <CAG2Kctoqja9R1bBzdEAV15_yt=sBGkcub6C2nGE6VHMJh13=FQ@mail.gmail.com>
 <20260130235743.GW3183987@ZenIV> <CAG2KctotL+tpHQMWWAFOQEy=3NX-7fa9YroqsjnxKmTuunJ2AQ@mail.gmail.com>
 <20260131011831.GZ3183987@ZenIV>
In-Reply-To: <20260131011831.GZ3183987@ZenIV>
From: Samuel Wu <wusamuel@google.com>
Date: Fri, 30 Jan 2026 18:09:00 -0800
X-Gm-Features: AZwV_QgpcNm32QTyYTJNZ2e8MpZD_azq4tiS_evKebHi_xWHPJAAyFUDpR04HdE
Message-ID: <CAG2KctoKDsfbyopQYq3-nJBg3fG+7Nrer17S6HqQ+nCWEcHeWQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/54] tree-in-dcache stuff
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org, 
	torvalds@linux-foundation.org, brauner@kernel.org, jack@suse.cz, 
	raven@themaw.net, miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org, 
	linux-mm@kvack.org, linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	kees@kernel.org, rostedt@goodmis.org, linux-usb@vger.kernel.org, 
	paul@paul-moore.com, casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org, 
	john.johansen@canonical.com, selinux@vger.kernel.org, 
	borntraeger@linux.ibm.com, bpf@vger.kernel.org, clm@meta.com, 
	android-kernel-team <android-kernel-team@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32954-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wusamuel@google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux.org.uk:email]
X-Rspamd-Queue-Id: 97414C0387
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 5:16=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> w=
rote:
>
> On Fri, Jan 30, 2026 at 05:05:34PM -0800, Samuel Wu wrote:
>
> > > How lovely...  Could you slap
> > >         WARN_ON(ret =3D=3D -EAGAIN);
> > > right before that
> > >         if (ret < 0)
> > >                 return ret;
> >
> > Surprisingly ret =3D=3D 0 every time, so no difference in dmesg logs wi=
th
> > this addition.
>
> What the hell?  Other than that mutex_lock(), the only change in there
> is the order of store to file->private_data and call of ffs_data_opened()=
;
> that struct file pointer is not visible to anyone at that point...

Agree, 09e88dc22ea2 (serialize ffs_ep0_open() on ffs->mutex) in itself
is quite straightforward. Not familiar with this code path so just
speculating, but is there any interaction with previous patches (e.g.
refcounting)?

> Wait, it also brings ffs_data_reset() on that transition under ffs->mutex=
...
> For a quick check: does
> git fetch git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git for-=
wsamuel2
> git switch --detach FETCH_HEAD
> demonstrate the same breakage?

Had to adjust forward declaration of ffs_data_reset() to build, but
unfortunately same breakage.

