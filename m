Return-Path: <linux-usb+bounces-30942-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AD3C88883
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 08:58:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 378AC4E3BCD
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 07:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 283AD2BCF7F;
	Wed, 26 Nov 2025 07:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C9gTeJm0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF28A29E0F8
	for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 07:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764143905; cv=none; b=Asm/fm+mosbNFa1Hgvddoxr54latTh1ZmaYas5qn2+fLuAVbZv94Eel/Q7rvlCwBvJU824gS2S/JpMBfDRQJKad+3ekb3rDS4DnIGgi3ICfuLhBj7Ld1oSfpscBdbNZyTDD7IgbblRWaLCIF16ntistnhA7eDDPit25LZ+5cRJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764143905; c=relaxed/simple;
	bh=gZDk+ER1wTRAXmP9I4dVCaP0jesWbT87Ya8iGIWI0Cw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fzll5RG/viOXMYGIHhAB7hpISC2BMB6EmMNDB9s8WaXhHgaVQ9F1SdPyznU2O4AXnnMl++50XzaSUcQqo1LLGuDKvj5VgiItZOBuC4CnDjJbrtXRIydwIpb7JmDNL0onZG6vIuJNWcw1FqDvT6y1xSP+eXtkJulDxWYl3oA30hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C9gTeJm0; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-37b495ce059so52090161fa.0
        for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 23:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764143902; x=1764748702; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZDk+ER1wTRAXmP9I4dVCaP0jesWbT87Ya8iGIWI0Cw=;
        b=C9gTeJm0sReGOj/1Aj3zPdx4yJeUBUj1QtuMVoN87o5G7V1ark2bMeDbUHeQl9guRb
         wu+NLhSHqm1ARB3HUiRSIk87TQqnnl/dA714bD/DUkHqUYcb2Pq6QTbI/+cCmpT635Ra
         GYD4cgszj7959/8nQ+dKW+kLJ4Po2rnf190E0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764143902; x=1764748702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gZDk+ER1wTRAXmP9I4dVCaP0jesWbT87Ya8iGIWI0Cw=;
        b=gX0bjNhLYlnhmF22O3PuE3dEP4yb8p+UPSUCZrlcqi/EnyAWE1nYnP2ARn3PVD1Mol
         hC939BEes6XpHpmEGsMSqqHQsCDAWKJ6PrtAksUe32HHs9h2P6EoOPGzOpS4zGcFYHFe
         N7cN7rTd5db97idlM3KTPRtGWMK/79B+hCrbN+1VAki0boH0V3euHb1dnJmYpYBrPPeu
         m0mWqr8wA7/wBVrnMPvuAaQoHM8wz5KeCWHG/x3N/JXpssrgMycj0akzCgu4qVFmTVCU
         GsrZPSwcRyp11xVatchRPTUdDeDHWBX5qxs765xzwH5ZBVgsHJ6BM7jRBqPmEgztCsSc
         VhxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrcFKH+QaTVXpO/frRuFBbq+BOTPx93Kb9BY1s3UCdBvNoTGAVYaPIkIElxqE3c/h6o5KXcSr5JHI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX6uKO48nnmaQuvY+sNwIcOqvKOomxitMYt8x6oPnRXRoxSmdA
	KxpaHD7+mpTK5giKO5INxHd4cyPTF4C3rXVMd/2Is6ArtOEnjWIpj2sbqUpPsunVa1rgsJgwR8t
	A7JY1MaDzmgINNJupltf5ixAm4CzemgTPjSDXvQg=
X-Gm-Gg: ASbGncslWyr6tDBTge5+1k4hJJRYQ7GD+7sJgqHYSxP5yCHLDp1NxrpI4IIQw1G0fJt
	GILkZEThPEDIy/T2pIHUM9k+p+vKlLXqyby8Z2G0VEW9wBYpIRegRH9IFxC1+CWjoG4/RzMGLkz
	4PLz8u7HhHwEF2IlBLcV9R0MqsgQ8+aTABMWYf8VmVdVn5R/ywQ9eXxlGSzW0J/OrglEyVIf7Uy
	Wj5Nj98d0GYiaLsvFU0AWX3/wWBMc7VbevZYzvFFN6QMwYEDECynJqHwOaqmW4RlNge353idNoT
	0G/f8+3T8O30GmWYQ4Fdkg==
X-Google-Smtp-Source: AGHT+IHACag4r0ldLahUXASg2Nt5Cx51NpTmvOJ0qbRdrCI51gYaYVqbTOkSjCXVRUtnUUckUEUlJ+n7xtO23A+uONE=
X-Received: by 2002:a2e:9cc2:0:b0:37a:2c7d:2d69 with SMTP id
 38308e7fff4ca-37d078d31edmr15409651fa.40.1764143901945; Tue, 25 Nov 2025
 23:58:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125142532.2550612-1-ukaszb@google.com> <2025112616-gestate-disperser-c055@gregkh>
In-Reply-To: <2025112616-gestate-disperser-c055@gregkh>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Wed, 26 Nov 2025 08:58:10 +0100
X-Gm-Features: AWmQ_blctZ4ckaUI0UpsoCODRNQVJYRxHH-MNJ-QjZzDQwBcy4YFrlIDUFuiFiI
Message-ID: <CALwA+NYBSH01FVcggf9nNbW83sRp0GH-4jKL0ByYNTM7vz-pHg@mail.gmail.com>
Subject: Re: [PATCH] xhci: dbgtty: fix device unregister: fixup typo
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 8:15=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Nov 25, 2025 at 02:25:31PM +0000, =C5=81ukasz Bartosik wrote:
> > From: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> >
> > When DbC is disconnected then xhci_dbc_tty_unregister_device()
> > is called. However if there is any user space process blocked
> > on write to DbC terminal device then it will never be signalled
> > and thus stay blocked indefinitely.
> >
> > This fix adds a tty_vhangup() call in xhci_dbc_tty_unregister_device().
> > The tty_vhangup() wakes up any blocked writers and causes subsequent
> > write attempts to DbC terminal device to fail.
> >
> > Fixes: dfba2174dc42 ("usb: xhci: Add DbC support in xHCI driver")
> > Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>
> > Link: https://patch.msgid.link/20251119212910.1245694-1-ukaszb@google.c=
om
> >
> > Fix typo indifinitely->indefinitely
> >
> > --
> > 2.52.0.460.gd25c4c69ec-goog
> >
>
> I see no patch here :(

Hi Greg,

The typo I fixed was in the commit message indifinitely->indefinitely.

Would you please elaborate what is your expectation for a fixup in this cas=
e ?

Thanks,
=C5=81ukasz

