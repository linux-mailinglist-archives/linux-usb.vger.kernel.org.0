Return-Path: <linux-usb+bounces-36910-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGDfH1pA+Wkr7QIAu9opvQ
	(envelope-from <linux-usb+bounces-36910-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 02:56:58 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F06754C595D
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 02:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE0513019FEC
	for <lists+linux-usb@lfdr.de>; Tue,  5 May 2026 00:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6E7314A9E;
	Tue,  5 May 2026 00:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DbGdpx84"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5DB30146C
	for <linux-usb@vger.kernel.org>; Tue,  5 May 2026 00:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777942611; cv=pass; b=Nl67fbqxDOwGsiP8rkKqYOWnbqJelTJqTaz8Ox6i9NhoUADHCaP0siKrlD5lsqwmzaiCETGg6IShRP2wtmtZo3FcVmh3hlEgWqYnRcZI0Qdb13vploqS9oyTkVYXo6IGOCTxrTBC8UmbGNqlujpFkcwzgpKyTkVLmj44/Tso4TQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777942611; c=relaxed/simple;
	bh=IeCugNOF/0VrIrRyZUIejh0Dfm8yCouMQlcG/pruqFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=grZTKh51gkNr2YS/YvQm5yv5PKrKmHfCravnMbpKQXf6UoAIWgS3cqxjTd5OJ6v6QiZb/3zFrSjStAOv1kpHdATOZw4YK4JWFbb6yCulFBfIqOMAhGyzu2ZSbaZruCGP3qEQhGVvN+FpHCYuDBLxAsR11vGgDL2qmKb9hiRMteo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DbGdpx84; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-672645dbfeaso5232298a12.0
        for <linux-usb@vger.kernel.org>; Mon, 04 May 2026 17:56:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777942608; cv=none;
        d=google.com; s=arc-20240605;
        b=b9b4MlzCJDMicsZEZB9AYP4dUlqBF08xDSwIJrOhWHZsuenrtX5Pis3x7Hb2hOJlxZ
         4C5JNBPEEs85YcwEu3VtGVDumnyMIPT+MuTiT1By0DK8fJErb7Q+8JbIJ1neGL/nKPCi
         tp8LhoJol5XHHR0Ut26/eQHYcv2E0ipKZAQxs99Xiu7iT49lVAhdQWvwvTR87BWMQoMG
         NJX/dR5kA7c5I7nf3p5keTROvGhkk+RV0+Yu8gD1uuu7xelvPuK+NyonIPnxDxK2m1c7
         SgiTbHVh6JiDWPrXBiRrsK8GiBpwEMeaUBbaBrK6vtT3D3baZJJOZtOXm69scd9oFVWL
         ND+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z9uROoH6g0nKwqBk6jm0NS5lhsKYzLExzLhwk9caFeM=;
        fh=ZEI9YFh2Eb7zrnYdjx7gHVJkLPgyxMrM9neUWMKAbUE=;
        b=ku4SlKvKmgrxZTY6TFLqPDE2Z4JXF/yWF7rBIjko55GVee+eyBZvvzwKVQr7FszllM
         7/kQ+hZ3F+JyPzPho+HCiRTjH4T7Ie7Rcd+YOiVZi/fbe9nZGUsK5hQQYhvu0HYO70TX
         O0hDYGjtQAa0YRekxEfir4VpmqEkMy1Ih13i0U/23jEgG3OpQyktWNRI2a0SONChueqb
         ZytcqIOrp8abN7KysJ+N4UnDMj7zdoFB0WMfCDv14Z/Br2GVa4Zw2/YgkFr8GAmKiA/W
         WDoHMaUFWStkXmORQ520e3pIux9IYGfgO+w1rwWqhS3Sw0Z1lNdsSI1Q51RFzQ1h8GEn
         I3ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777942608; x=1778547408; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9uROoH6g0nKwqBk6jm0NS5lhsKYzLExzLhwk9caFeM=;
        b=DbGdpx84/Zku7yO3zleNnDMgxZce+rYS2jwB9m2YQb+xFifsVkkUNwRMbGe5TNTnr0
         gVqBQg9xCjgxBO0Qho/3GA54KMXnM5xhZ0T7A3bBRNbI7pCKCFUnVTGtt9Q3L1LQoiB4
         En2hiKhD/AZObswq1E1D3YlgcFp35YCFak7/L7mKJgwMzyQr+8OsDLABLQS1kEf3eAsT
         P+56h01dVDlWF96k+NmBTY0HzVslE8SRjduyUCQ52un/sVIiO7WlCcsXRJ25M1ZmiYik
         cZrh0VTRuUFS304kR5tbb0bteNv8+sZa7pqUJBt77VlwKZj0F1hpm+FfiO+CELt/v+MB
         Aumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777942608; x=1778547408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z9uROoH6g0nKwqBk6jm0NS5lhsKYzLExzLhwk9caFeM=;
        b=s2m/BFt2tLekg2/5nJJAOhAO38K+1rOemKDU4g/r84vGrxREVM5nML5JdsLwFBZlkA
         OIcof+VRfSLDE3F2K+9GrmTTItjXpabo58MLWgf9pv8nHoatE2TTdX+IWunfpePH5QZ6
         PE2lj3xzcMfERfARTGQS9cyDpWlTXHWQY5wDL9jtdtg4gz4rWsq7K//WafE5pQ9gOArc
         L2+sukex59fU4onCrKxaxzeaJ2SbM2RjoyefekTVXYry4AkscAAA0qXVwjLgDSr7gjGh
         4/GWakWwo18mInEM61Is/Q2EfidAwGi6CK3/d6/jukZrAofzmUJr8E4g35IcHpM1VKa/
         3PuA==
X-Forwarded-Encrypted: i=1; AFNElJ/JwhmB0ONnZ0HpZ4CYKatqzXuN2nXttvqnGXXqyanxW0QnKL/ZaPsPsvGM8d0f3bp1ljjOEOs/yW4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhnB5pTd8wTWnGtZHMci9AnO9LbhB1Q136YPW0rmfsLdoun5NH
	EXHKxn0KseTzA3OFalwyCQ0P/eL3k4Exsu4qbKHFQxXjH13jgmgsUVfEvnxi+joqKBwrWXPKUGT
	DCD1La3lMIdhXe8CE5iHGwO2hW+HthZeEZQ==
X-Gm-Gg: AeBDievHmeUwTu7zSC4ey2N1m9M8dXmIQq04TsSoqRiZfwvHb9v0tutmE/2/pKog5/0
	tPhy3NmfnLTE80yn875GnKq44wU5B4A3sfnWnpuRSXi0VqUTvxfd0L1h7ZZ7k1thlTaHcC8RX7e
	+5l93XTVH/U8VrMnGttnwyW+5wOm+6FePV5RJpVTjC2plDuPd0n/14feU9aCMOT+6PK+5C9oYTd
	IhDrjs/iXI2v+SiapAFGQzz1aDaNeg4nqcwHOy63S8K9oguoSTZxN1Bu9VHl9Cru+S32L6A9WOi
	gzexj8w710TfP96wiIS9AFWbSIcpwA4cBOYnaIhDXAmjW/iovfc6YAQsbTN7jc++8bn2dCx/BTD
	RWCwJM8j3w3XEVdW+v9bUck+t41JSTQ5h3B7BMvC+2QPUeD0BQWNYDWlDu/H3RukpvUuf
X-Received: by 2002:a05:6402:796:b0:678:a507:e837 with SMTP id
 4fb4d7f45d1cf-67c17e27044mr3972403a12.1.1777942608385; Mon, 04 May 2026
 17:56:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <177793914437.2560.9287713196857718000@997d03828cfd> <0a8be4da-73f4-42cc-b026-c3ac031f3268@infradead.org>
In-Reply-To: <0a8be4da-73f4-42cc-b026-c3ac031f3268@infradead.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 4 May 2026 17:56:35 -0700
X-Gm-Features: AVHnY4IKrnDSsi15lQasC7pxxX_wLSKZMiIfF54CrEwOmOtvnCw9EXINHRwtjj0
Message-ID: <CAKxU2N9WxA9tg0EqDQ0bzxpB79Sa+zh7HgGs_u-witFcuCsQew@mail.gmail.com>
Subject: Re: [REGRESSION] next/master: (build) variable 'num_ports' is
 uninitialized when used here [-Werror,-Wun...
To: Randy Dunlap <rdunlap@infradead.org>
Cc: kernelci@lists.linux.dev, kernelci-results@groups.io, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, regressions@lists.linux.dev, 
	gus@collabora.com, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: F06754C595D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36910-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kernelci.org:url,kernelci.org:email,mail.gmail.com:mid,infradead.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Mon, May 4, 2026 at 5:18=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
>
> [add more people/list]
>
> commit 8bdb0b3830ea
> Author: Rosen Penev <rosenp@gmail.com>
> Date:   Fri Apr 24 18:42:01 2026 -0700
>     usb: typec: intel_pmc_mux: combine kzalloc + kcalloc
>
>
> On 5/4/26 4:59 PM, KernelCI bot wrote:
> >
> >
> >
> >
> > Hello,
> >
> > New build issue found on next/master:
> >
> > ---
> >  variable 'num_ports' is uninitialized when used here [-Werror,-Wuninit=
ialized] in drivers/usb/typec/mux/intel_pmc_mux.o (drivers/usb/typec/mux/in=
tel_pmc_mux.c) [logspec:kbuild,kbuild.compiler.error]
> > ---
> >
> > - dashboard: https://d.kernelci.org/i/maestro:4c562376c15477320ad9a138b=
83a5256431b57cb
> > - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git
> > - commit HEAD:  9d0d467c3572e93c5faa2e5906a8bbcd70b24efd
> > - tags: next-20260504
> >
> > Please include the KernelCI tag when submitting a fix:
> >
> > Reported-by: kernelci.org bot <bot@kernelci.org>
> >
> >
> > Log excerpt:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > /tmp/kci/linux/drivers/usb/typec/mux/intel_pmc_mux.c:740:3: error: vari=
able 'num_ports' is uninitialized when used here [-Werror,-Wuninitialized]
> >   740 |                 num_ports++;
> >       |                 ^~~~~~~~~
> > /tmp/kci/linux/drivers/usb/typec/mux/intel_pmc_mux.c:735:14: note: init=
ialize the variable 'num_ports' to silence this warning
> >   735 |         u8 num_ports;
> >       |                     ^
> >       |                      =3D '\0'
That =3D 0 is correct and was an oversight on my part. The original code
initialized to 0 because of kzalloc.
> > 1 error generated.
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >
> >
> > # Builds where the incident occurred:
> >
> > ## x86_64_defconfig+kselftest+x86-board on (x86_64):
> > - compiler: clang-21
> > - config: None
> > - dashboard: https://d.kernelci.org/build/maestro:69f922810e4ee292cbd1a=
001
> >
> >
> > #kernelci issue maestro:4c562376c15477320ad9a138b83a5256431b57cb
> >
> > --
> > This is an experimental report format. Please send feedback in!
> > Talk to us at kernelci@lists.linux.dev
> >
> > Made with love by the KernelCI team - https://kernelci.org
> >
>
> --
> ~Randy
>

