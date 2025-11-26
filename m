Return-Path: <linux-usb+bounces-30956-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B7871C891F9
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 10:53:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0E6E04E9ECC
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 09:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81B3B302776;
	Wed, 26 Nov 2025 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GNphF4sM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0F8303A15
	for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 09:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150673; cv=none; b=ey/C43QvoOJXT6m/lrh7DpnkwHCqiKl58WUdQ677o4Jzdljg3ygK9oxrfCvTG8BygLW7OZS2BHzSmoaZhv70jAdBkjPnWmX1NCAhKBte8hUQoYRz2BVQQchpejLVzB4sHaJ2qV2o/f92NGEgbyX+4dJtt+kpiVm6DVZ5x1s2gXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150673; c=relaxed/simple;
	bh=Wq+ng6ZxoJZXw+yoS29UjcTGvr3rz0ekLkJNnAAAHrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cv1ObGKO9F/sW+Kp+3EtArt+Xwnyb8whGDH3agowFKfV6pvmq6JCBJEKthcCCkakXv5fsEugjZUjkJ0PZL1Qq9V0MdZ6o0eTBLdMxjCq2OedqqRDPLfLpalRrmyPunF0YxgEjbhVj+e3bhHBiA6fmEMWcWo6O2eRc8eR7ClmjHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GNphF4sM; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5959105629bso6226373e87.2
        for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 01:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764150668; x=1764755468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czg8+gxM+jlFcqPZNpaIfi1atwVhPAnrGnczKcwKfLQ=;
        b=GNphF4sMbtjjYEC4skEshvlD3a8OVVDYg5vbgSAGShZSDCyEkE+Xv/5067Djh54xkr
         u9j3VAV33vVHUBuExhHmQNxOBfN5mI76rg5UEXJzmNVJcrr4tfwUa/TBmp6rthWhNZzi
         rZ8/J3MwxmBfj4cgRLcm7HHZX6/LI84BzqolU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764150668; x=1764755468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=czg8+gxM+jlFcqPZNpaIfi1atwVhPAnrGnczKcwKfLQ=;
        b=EYO9mxDH4eg28ZJr6D3BKB3r4DygS9xw50oTVcEARlQ8mQbFNpoLaktGGp0u3cNHgR
         zfp0dYJ9wZQWtE2wb0av5s0rF8Kny4djwzLDMt3E20jZSsGO0Rfc/ST+6UNuBpnA6Tju
         oOlqTi43Idlvic9RJOARyuQxl2gu51UBklRJ+1oP5OxTy7xJutefPVgXYMbDYd1QgF7t
         Zq3d9oF2X8/jpExkOfNEBYi5P0jGhE2v49WQVkMZ7NtgUpqENIZIQvcQwF++RF+eyImv
         WhqdrTQ5sTR0/mnLrumRqZ/Wj/jOT2lqtZzpuPIGi0jwdMLHG2d8Xafxfwylli8e4DS0
         nx/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBaGw4dwUBdX6PsPosyOs67s/encukWESU7eIdyH+OjPE62knHhsv0cjh3q5m7/UVVQ+nJ932ZSqs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHm39fBlzpGMcwEfATVAG4Nk9nzKGmEZlpzM8+JJ7PGVfITREb
	H8A32Jz8SYr2q0qQ0K43sNulezLY+7e9NIh0gZDHX30BQ1SzYg6MgaMnPv1MSAVoedNHwuUgzoi
	uTrDg2g6ST4ouazX5qa6g5+j7lnUFuMJh0ZtEjRI=
X-Gm-Gg: ASbGnctuR3NPL4L5+4Jolo/ztlfBCv3DiD3e0UtmI00JrE8/lx5OPSWZmfE6Z0wlO93
	LH/LZX/tmY2pJWZHx7XJctMqxoJHboeVajH+gz0dh3uvdIZHfgYY2ABPisVnG3cHKddaToWhUXO
	x87El08e3HZYvNCxUmlT4plPJr27htBjry+6nntHAcMMvLRms1aN+zd8GY2eV/9orwdygRx3Csy
	qyHAPnOSpDerFE/K/iluffwvSawpCy24OHomcSTZGGBiOoM+AFaaor1uu07ZiN7prq1qEXmwrfN
	TLvvS7QyYWSKYdYqqRh3WDc=
X-Google-Smtp-Source: AGHT+IFz3A3R6AMUopkOE+i4MH1pbKRVbTKUs04pIKDkgl+zOCJd7Q2DCldJurKAZb5QQJeXDLIHAYaJS1Dy3feHQpE=
X-Received: by 2002:a05:6512:1116:b0:594:3567:e835 with SMTP id
 2adb3069b0e04-596b5286281mr2715823e87.35.1764150668016; Wed, 26 Nov 2025
 01:51:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125142532.2550612-1-ukaszb@google.com> <2025112616-gestate-disperser-c055@gregkh>
 <CALwA+NYBSH01FVcggf9nNbW83sRp0GH-4jKL0ByYNTM7vz-pHg@mail.gmail.com> <e7e984f4-4aa7-4428-8da4-b48d55f32098@linux.intel.com>
In-Reply-To: <e7e984f4-4aa7-4428-8da4-b48d55f32098@linux.intel.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Wed, 26 Nov 2025 10:50:56 +0100
X-Gm-Features: AWmQ_blDwDsZN2smf9Jn9hsWoR2nlfosVRCslUC3GQc0La4bNq95ulLrqGT1op4
Message-ID: <CALwA+NaXYDn1k-tVmM+-UQNJZQEZGiB4QmBfv1E6OeWyMicUig@mail.gmail.com>
Subject: Re: [PATCH] xhci: dbgtty: fix device unregister: fixup typo
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, 
	linux-usb@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 10:15=E2=80=AFAM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 11/26/25 09:58, =C5=81ukasz Bartosik wrote:
> > On Wed, Nov 26, 2025 at 8:15=E2=80=AFAM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> >>
> >> On Tue, Nov 25, 2025 at 02:25:31PM +0000, =C5=81ukasz Bartosik wrote:
> >>> From: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> >>>
> >>> When DbC is disconnected then xhci_dbc_tty_unregister_device()
> >>> is called. However if there is any user space process blocked
> >>> on write to DbC terminal device then it will never be signalled
> >>> and thus stay blocked indefinitely.
> >>>
> >>> This fix adds a tty_vhangup() call in xhci_dbc_tty_unregister_device(=
).
> >>> The tty_vhangup() wakes up any blocked writers and causes subsequent
> >>> write attempts to DbC terminal device to fail.
> >>>
> >>> Fixes: dfba2174dc42 ("usb: xhci: Add DbC support in xHCI driver")
> >>> Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> >>> Link: https://patch.msgid.link/20251119212910.1245694-1-ukaszb@google=
.com
> >>>
> >>> Fix typo indifinitely->indefinitely
> >>>
> >>> --
> >>> 2.52.0.460.gd25c4c69ec-goog
> >>>
> >>
> >> I see no patch here :(
> >
> > Hi Greg,
> >
> > The typo I fixed was in the commit message indifinitely->indefinitely.
> >
> > Would you please elaborate what is your expectation for a fixup in this=
 case ?
> >
>
> A fixup patch is just a new patch that is applied on top of the first.
>

Thank you for the clarification.

> If the typo was in the commit message then it can't be helped.
>

:(

> I still think we need a fixup patch for the missing null check
>
> -       tty_vhangup(port->port.tty);
> +       if (port->port.tty)
> +               tty_vhangup(port->port.tty);
>
> or just use tty_port_tty_vhangup()
>

IMHO it looks good because tty_vhangup calls two functions inside:
1) tty_debug_hangup - which handles the case when tty is null
2) __tty_hangup - which also checks tty for null

Thanks,
=C5=81ukasz

> Remember to add Jiri Slaby and stable to CC, and a new Fixes tag
> Fixes: 1f73b8b56cf3 ("xhci: dbgtty: fix device unregister")
>
> Thanks
> Mathias
>
>

