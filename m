Return-Path: <linux-usb+bounces-30966-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FC0C89C01
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 13:27:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E2073AB3C0
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 12:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E7C5322C7F;
	Wed, 26 Nov 2025 12:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="etRBYotV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F175B1E570D
	for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 12:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764160027; cv=none; b=aKAQc9s0skHca9SiFSo/CKA7bXGHZsAYBUs48UMYu+ggAX08Xiu9x7jwbhH2dBDkjsDTk1yyX40T2JCVhP3zKw58N90EUInx1MM/aOZoxMW2ZzbGLjgKyZJJFDG/LSSEHiWv/nYpd+pWK5OqkHrgm9jRoJODwDNJ9B0i16LHr4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764160027; c=relaxed/simple;
	bh=MxRPH4OI+jq7u3FFsPykkcwYxWzFT5nC1r6Xn44eH2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nPGgjlX3TkxGSlc7/3bH+wz/KC/9jzinIjADHowIV2OzpQNNVI0jdx27sXf5Bae6Tvji6zAQnDlcrpArME34cN7BG0ZHOFqqzJDXZIf6V8Gxm/dapcTM6SdASkGR6gb5ig2JKNdT7KVTO5UZykAsrqHNpRvD3xymbEVtBITtMLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=etRBYotV; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-594330147efso6793778e87.2
        for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 04:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764160023; x=1764764823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M39NueHohmNMWq87JqLJZZG3KM6+f0KMO0Y5dIBS1n8=;
        b=etRBYotVzrEqOirdpXoxzrTVO3guHUpBGXAro/pfXJWoXMMUoQKObh/VeZYeof4hZo
         Ovcgf0sCbWa9zu8cwocJIhwS6pN0E1xONwyhxGwfjpKNswkDf+2tMX4BmuZEKUOmk+NP
         /keaepshSLPvoeK6g6VzbquSvBuxd09VdF0QY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764160023; x=1764764823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M39NueHohmNMWq87JqLJZZG3KM6+f0KMO0Y5dIBS1n8=;
        b=qcfRgiGEkimo64kqOSdSJYSmbMWu/dc+kNw2kQ1FKAOOiznuRIuIp6OK3J/QcwpR1P
         MP+axfYxRMw3ZqOiXakpFc2wNkRJcKO4i3ktLkzKYoqv0Hdxm+EDCPKeUsnoP/41+A0M
         n3t8mPZPtJa/LpaookfBH770O0Cw52x2TBCqYeQiiQNS7UqKOnJG95ET39borOmnB9ut
         wiNpfckFeBqPFBIX+w9/WDWT6HnZaaD2uF1DeZPEgWO9wjiCs/jSRrDosyz1hP720LJC
         xsi0VAjpk9o4woODWcdfP6NE1TEY/4jIwO2YF3pas5UjG8uqnB/mswtlSMiWCQxWrauW
         tdeg==
X-Forwarded-Encrypted: i=1; AJvYcCXsvIbuiI1/kxf310LBRC4Jue8SYvVkBRN2AM5EDB5EGbxvEZ1/fK8TACCeHOWu+HyRr1hE0fyJbvM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoZKCrJNBPIDhUwee692XuEpjouhrFMQMsfmcyu/ZW5TgDUuc2
	B72QcqBBh1xpiHxdsDAbLG90m3UlQhJ+9SvphcpeuOb4AMLNygM9uXIqTiRGTAGGmarEKDai8VC
	0kfIGw7i8Fc8C/I3O9iWHFxGerDrt7F6HC33BDhQ=
X-Gm-Gg: ASbGncsPcu+upGqORAYDWIXzw3o9v/bRrv2uoj93YXz4oxeZ+3eQ3VmP/e/EDXiAaOL
	WngW8WOJB61TpulWOZ5r2cxYBCkcuS859z0c4H9Yuea4NV5A6GD9+q0Eq9zldRxTg10PUi+3LVp
	AfHka37B4H0c3eIVvpOAgKYOC6D54ILRCOcR4QirEmppzhz7YmZYw8UqyvwKWoooU1qQrHyoyEP
	mg1YZcH4aCPWhIQ3IQb2PPvw/3lVOYZcBW3s3tKtTBjGkEJhTF0e4KvPwcRNqYbLRzJMKMUvttL
	4brQ2orqxwW6Nu8mfIh2olk=
X-Google-Smtp-Source: AGHT+IEHMBlhPNnyD80Uk8xE4aqtfm+js6M42t2KkRhBdLMKSuUtMH7IJAY0gFAQG3kVr8/hFSGOIRUePsiwaz2uDdg=
X-Received: by 2002:a05:6512:15a6:b0:591:eab5:d8dc with SMTP id
 2adb3069b0e04-596a3ee2f7dmr6978035e87.35.1764160022991; Wed, 26 Nov 2025
 04:27:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125142532.2550612-1-ukaszb@google.com> <2025112616-gestate-disperser-c055@gregkh>
 <CALwA+NYBSH01FVcggf9nNbW83sRp0GH-4jKL0ByYNTM7vz-pHg@mail.gmail.com>
 <e7e984f4-4aa7-4428-8da4-b48d55f32098@linux.intel.com> <CALwA+NaXYDn1k-tVmM+-UQNJZQEZGiB4QmBfv1E6OeWyMicUig@mail.gmail.com>
 <fb7dc13b-d572-4537-89dd-427bbf43567b@kernel.org>
In-Reply-To: <fb7dc13b-d572-4537-89dd-427bbf43567b@kernel.org>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Wed, 26 Nov 2025 13:26:50 +0100
X-Gm-Features: AWmQ_bngQtj8MJY-S7_hQRN_iyByb3k8FNgECmpEzvAee_C_OZBITg-rFxuI6N8
Message-ID: <CALwA+NY5o9yBetMYN78KK=mujuDY3_jtkc6rwDHohO6OO=t2og@mail.gmail.com>
Subject: Re: [PATCH] xhci: dbgtty: fix device unregister: fixup typo
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 10:56=E2=80=AFAM Jiri Slaby <jirislaby@kernel.org> =
wrote:
>
> On 26. 11. 25, 10:50, =C5=81ukasz Bartosik wrote:
> >> I still think we need a fixup patch for the missing null check
> >>
> >> -       tty_vhangup(port->port.tty);
> >> +       if (port->port.tty)
> >> +               tty_vhangup(port->port.tty);
> >>
> >> or just use tty_port_tty_vhangup()
> >>
> >
> > IMHO it looks good because tty_vhangup calls two functions inside:
> > 1) tty_debug_hangup - which handles the case when tty is null
> > 2) __tty_hangup - which also checks tty for null
>
> Is it still good when someone closes the TTY right after the "if (!tty)"
> checks?
>

Hi Jiri,

Will putting tty_vhangup around get and put reference as follows suffice:
tty =3D tty_port_tty_get(port);
if (tty) {
    tty_vhangup(tty);
    tty_kref_put(tty);
}

Thanks,
=C5=81ukasz

> thanks,
> --
> js
> suse labs

