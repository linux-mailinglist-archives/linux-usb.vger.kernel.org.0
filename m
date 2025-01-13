Return-Path: <linux-usb+bounces-19273-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE7AA0C143
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 20:22:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F8DE1882E25
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 19:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E99361C9DCB;
	Mon, 13 Jan 2025 19:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eOoj0yyp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15421C5F0B
	for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2025 19:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736796143; cv=none; b=KIQlSA4C4teZLtT+Ni2oA5+jw4al8aqk0b7Lu5Fvs82B08p912LSk1FlUQiHiEcR/SaW17kreQOU0MDLD42oqryx74V8p30Ft9uMTMoC29TjWa5jEPIZiVHNkjjwJTmY0xZs0zA7zfqZ1u2xVB3d44jehu+nrnEWOtJJVIdaHtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736796143; c=relaxed/simple;
	bh=IP3oT9TrcqZ0Bnf86EMH5jRtZjfj1ziDMjZViaZM28Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pFmHkghS2nOYk5On7ccbHrBEVDrmN4IQwp6r1NcZ6zjfnl+3O0vgmntScxqIF4BFfX6yW7605+nU1Xo8dI7tz9tBrXitw5jCzSWc8N7YVwLgo/HfpJWUTQ85UVBwiRIclNEiYmNRAn8ECfaTQvOBYf+ymU3XcAZr0yfNxnK/8+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eOoj0yyp; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d3e638e1b4so853a12.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2025 11:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736796138; x=1737400938; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0xjsKp2OLYRFRqJwssjhQwqwCL4yYWaWjRpYckyAMc=;
        b=eOoj0yypOis2se7MJLIZou0TKkRkl4JtavSCm+uTnVh7s652t4wZ+yCvo6wdTMTxUJ
         pT1XjStOZ13X6ZagE4zA5C9RiMtYjwOxB/pW4cEmPfjfitXR/wKQZVP25WmUKDodR4ys
         tGN7OB+W4aMOdOJ1mEeB6v8eTPx9Xr6ckgBKTtRQRJHmy0yk3pqs7eEFhW9z/M5IcSBc
         V7SAAFZ3shIbh5vodLkM/wflEoTgb5y1VAv5KwxqY8/afDJTNPFwJlY373CDAzeteqKy
         GWM94xu5LFeWYFBJub9xhySyCfBr70kcd4l/IUPWKF+9VIOKbaOJDsBeTISBA9JqI4QO
         C7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736796138; x=1737400938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x0xjsKp2OLYRFRqJwssjhQwqwCL4yYWaWjRpYckyAMc=;
        b=HQspfiCTLcpV1ycmnrnZM+E+VsmDTFtB4TjejNv/En6q8Sxzn9s+Oeb4O9qfgmd0Ry
         upiR99kgadVnajQU4jujdfOFcQnBGcebxHO1WirveyMZBOkBqln0R0yaSNxr40b40CjM
         /c3cvezTdrvlGl2ZFdO189T2SlJMzBWk1x7mj0nE0lO0VGxeXyi1XNaP6ejuUIuTtEDS
         Xt95eC13oYyHSfbwJK948GE0nm1ym6sVZQoH6lcu2gjQCsS4Z6DVK7Ck1Q4u1VlNOpIl
         dqT8x9t7mAFq/v9WGU9XYlVD7D9OAnc+fp3HjndlpJBwzuM4HH4CGQhmz3Eem6ZQqTLR
         062Q==
X-Forwarded-Encrypted: i=1; AJvYcCXq3plJvPFM3MrtXcnhvy5d/b0yiYX9IAY+HoeDjISMJwtNVbJH3DhBLN1as99k5JxSC/kJFd8E0DM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr8N0vOh5vMj5rM3i59Xwyqg2TiMKaSTI+PWtYcar0+31NCs3e
	zChjFWdvIrkNOnupQW7WesZ0Yq9oyE9ikcF3Tqnx6b/CiMCHF7MxtWD/D9/j9tJBW/iiKP2zfLh
	wwd/yHRtZRQbYUDkbpsGb7KuTC2osEtTk/n0q
X-Gm-Gg: ASbGncullOuSXI8ZgSqNY7mcas+JuX4WFUiun0Lr65BJqnKJSAhsrqZtfw2Jlw7PK0u
	9/ej+oX2hGQOEU7s8K33J0bMAboeDqN0+crPqjtt1QhroW+EhtjlL/nqMWR1Pmm3Co8oa4azb
X-Google-Smtp-Source: AGHT+IGGZSYZZCqG+QsrlIe8oZgoFyNwW4y2dGZDFrel3NZa4DIalawZv0wHEcwF1odQcv3YxYY0SyXDhAUf9Bb7oaM=
X-Received: by 2002:aa7:dbc1:0:b0:5d0:eb21:264d with SMTP id
 4fb4d7f45d1cf-5d9f696d4f7mr2247a12.1.1736796137755; Mon, 13 Jan 2025 11:22:17
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205074650.200304-1-quic_kriskura@quicinc.com>
 <ME0P300MB05534EDF5293054B53061567A61C2@ME0P300MB0553.AUSP300.PROD.OUTLOOK.COM>
 <CANP3RGc_SBROWVA2GMaN41mzCU28wGtQzT5qmSKcYsYDY03G5g@mail.gmail.com>
 <ME0P300MB0553900AF75E50947B011FF3A61D2@ME0P300MB0553.AUSP300.PROD.OUTLOOK.COM>
 <CANP3RGc7n2vv6vGh7j0Y=7DNqfXnQxZaTcwdPD15kzoY1in08Q@mail.gmail.com> <ME0P300MB05538EF3A86116EF73BE3BE9A61F2@ME0P300MB0553.AUSP300.PROD.OUTLOOK.COM>
In-Reply-To: <ME0P300MB05538EF3A86116EF73BE3BE9A61F2@ME0P300MB0553.AUSP300.PROD.OUTLOOK.COM>
From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date: Mon, 13 Jan 2025 11:22:06 -0800
X-Gm-Features: AbW1kvZRLF5VehN_NpB_EfzPpuIFACGspEu8crYcUGGWt2h1hk2BctjKq1uiJmo
Message-ID: <CANP3RGdj0gRohsT=3GUZ84dYZxPDUhe3-Zz26bQrsavYnwtDmQ@mail.gmail.com>
Subject: Re: [PATCH v3] usb: gadget: ncm: Avoid dropping datagrams of properly
 parsed NTBs
To: Junzhong Pan <panjunzhong@outlook.com>
Cc: quic_kriskura@quicinc.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	quic_jackp@quicinc.com, quic_ppratap@quicinc.com, quic_wcheng@quicinc.com, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 5:31=E2=80=AFAM Junzhong Pan <panjunzhong@outlook.c=
om> wrote:
>
> Hi Maciej,
>
> On 2025/1/13 1:49, Maciej =C5=BBenczykowski Wrote:> (a) I think this look=
s like a bug on the sending Win10 side, rather
> > than a parsing bug in Linux,
> > with there being no ZLP, and no short (<512) frame, there's simply no
> > way for the receiver to split at the right spot.
> >
> > Indeed, fixing this on the Linux/parsing side seems non-trivial...
> > I guess we could try to treat the connection as simply a serial
> > connection (ie. ignore frame boundaries), but then we might have
> > issues with other senders...
> >
> > I guess the most likely 'correct' hack/fix would be to hold on to the
> > extra 'N*512' bytes (it doesn't even have to be 1, though likely the N
> > is odd), if it starts with a NTH header...Make sence, it seems we only =
need to save the rest data beside
> dwBlockLength for next unwrap if a hack is acceptable, otherwise I may
> need to check if a custom host driver for Windows10 user feasible.
>
> I didn't look carefully into the 1byte and padding stuff with Windows11
> host yet, I will take a look then.
>
> > (b) I notice the '512' not '1024', I think this implies a USB2
> > connection instead of USB3
> > -- could you try replicating this with a USB3 capable data cable (and
> > USB3 ports), this should result in 1024 block size instead of 512.
> >
> > I'm wondering if the win10 stack is avoiding generating N*1024, but
> > then hitting N*512 with odd N...Yes, I am using USB2.0 connection to be=
tter capture the crime scene.
>
> Normally the OUT transfer on USB3.0 SuperSpeed connection comes with a bu=
nch
> of 1024B Data Pakcet along with a Short Packet less than 1024B in the end=
 from
> the Lecroy trace.
>
> It's also reproducible on USB3.0 SuperSpeed connection using dwc3 control=
ler,
> but it will cost more time and make it difficult to capture the online da=
ta
> (limited tracer HW buffer), I can try using software tracing or custom lo=
gs
> later:
>
> [  5]  26.00-27.00  sec   183 MBytes  1.54 Gbits/sec
> [  5]  27.00-28.00  sec   182 MBytes  1.53 Gbits/sec
> [  206.123935] configfs.gadget.2: Wrong NDP SIGN
> [  206.129785] configfs.gadget.2: Wrong NTH SIGN, skblen 12208
> [  206.136802] HEAD:0000000004f66a88: 80 06 bc f9 c0 a8 24 66 c0 a8 24 65=
 f7 24 14 51 aa 1a 30 d5 01 f8 01 26 50 10 20 14 27 3d 00 00
> [  5]  28.00-29.00  sec   128 MBytes  1.07 Gbits/sec
> [  5]  29.00-30.00  sec   191 MBytes  1.61 Gbits/sec>
> > Presumably '512' would be '64' with USB1.0/1.1, but I guess finding a
> > USB1.x port/host to test against is likely to be near impossible...
> >
> > I'll try to see if I can find the source of the bug in the Win
> > driver's sources (though based on it being Win10 only, may need to
> > search history)
> > It's great if you can analyze from the host driver.
> I didn't know if the NCM driver open-sourced on github by M$ is the corre=
spond
> version. They said that only Win 11 officially support NCM in the issue o=
n github
> yet they do have a built-in driver in Win10 and 2004 tag there in the rep=
o.

Looking at https://github.com/microsoft/NCM-Driver-for-Windows

commit ded4839c5103ab91822bfde1932393bbb14afda3 (tag:
windows_10.0.22000, origin/master)
Author: Brandon Jiang <jiangyue@microsoft.com>
Date:   Mon Oct 4 14:30:44 2021 -0700

    update NCM to Windows 11 (21H2) release, built with Windows 11
(22000) WDK and DMF v1.1.82

-- vs previous change to host/device.cpp

commit 40118f55a0843221f04c8036df8b97fa3512a007 (tag:
windows_10.0.19041, origin/release_2004)
Author: Brandon Jiang <jiangyue@microsoft.com>
Date:   Sun Feb 23 19:53:06 2020 -0800

    update NCM to 20H1 Windows release, built with 20H1 WDK and DMF v1.1.20

it introduced

    if (bufferRequest->TransferLength < bufferRequest->BufferLength &&
        bufferRequest->TransferLength %
hostDevice->m_DataBulkOutPipeMaximumPacketSize =3D=3D 0)
    {
        //NCM spec is not explicit if a ZLP shall be sent when
wBlockLength !=3D 0 and it happens to be
        //multiple of wMaxPacketSize. Our interpretation is that no
ZLP needed if wBlockLength is non-zero,
        //because the non-zero wBlockLength has already told the
function side the size of transfer to be expected.
        //
        //However, there are in-market NCM devices rely on ZLP as long
as the wBlockLength is multiple of wMaxPacketSize.
        //To deal with such devices, we pad an extra 0 at end so the
transfer is no longer multiple of wMaxPacketSize

        bufferRequest->Buffer[bufferRequest->TransferLength] =3D 0;
        bufferRequest->TransferLength++;
    }

Which I think is literally the fix for this bug you're reporting.
That 'fix' is what then caused us to add the patch at the top of this threa=
d.

So that fix was present in the very first official Win11 release
(build 22000), but is likely not present in any Win10 release...

https://en.wikipedia.org/wiki/Windows_10_version_history (2004 - 20H1
- May 2020 Update - 19041 - May 27, 2020)
https://en.wikipedia.org/wiki/Windows_11 (first version is 21H2 - Sun
Valley - 22000 - October 5, 2021)

