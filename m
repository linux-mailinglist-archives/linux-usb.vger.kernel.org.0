Return-Path: <linux-usb+bounces-31786-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EFCCE4F3B
	for <lists+linux-usb@lfdr.de>; Sun, 28 Dec 2025 13:58:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F34153014DED
	for <lists+linux-usb@lfdr.de>; Sun, 28 Dec 2025 12:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88CD2D5C61;
	Sun, 28 Dec 2025 12:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aOMqtfvn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CB82D6401
	for <linux-usb@vger.kernel.org>; Sun, 28 Dec 2025 12:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766926492; cv=none; b=d0KDGIXu4qdja6nCNAkpHpoABlNDpDTmwuZgZML58Yfl5KyVkfsKeGL77tKKuQ35PE/NiJZcjCZ1GoOvmb6FmfWxqgw7svWpI3x+Mqfk44ArDrwclHnZ4AV0xxWlAGzmUQNub0hXW54pIDf01EeCfsgHTopcyq7U0UdpRRCMxTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766926492; c=relaxed/simple;
	bh=k1udt5i4JC/KiX/tMYzcN0APlVV4RgNQMCCSYZRuXjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vD6d5e1gA+JI6057wwThIr8ex2Ekzbfh0EZ6Xg7BbkVcLtK8qGohN8UhQTlJQc8eOcpb/1KSaxbtUAV8LmknSlscG3/Z6wGP9wOdd3i44ceHj0bGLEtN4zVsZ1CSik5jiik/Srb01NEXa1F6yYjwEpRcaQ39JPeA/Zd8iT7f78w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aOMqtfvn; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-455af5758fdso5482046b6e.1
        for <linux-usb@vger.kernel.org>; Sun, 28 Dec 2025 04:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766926485; x=1767531285; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mbO8ygl0+LvUYCsXs5tELsSvHTLlshwMLulQXQvMj8=;
        b=aOMqtfvnvZOWY4U/e45kxbJ2PbKBBYlBbKkGTXmrMpYWMI/UJrMbh314wdmSv2OY9q
         RS8l+M0mhAoBQjZQWh5ZYDmptoNMD/Oa9qvvae1t+Xuu4gi5aeoZr6VZEGUPshIAkDAU
         qgnEoRRcMTg0BI7m/EWU92Y+jZb4Ypqrc0g/td66RyJ2tMSnSPwqsMuYrORE5EuNDwDc
         GuldWB5ju1ntmnue8ezI5sr+TUk8jk3wf4O/YJn/eWCagwn8dQ1j8vvjBb+jlvJw05T5
         l0eTebeNRpKnxYsW+4iAuH9/zosjpVU778UBuvsaE80nYqbVpWoKNtDmbW9JoDXX+cw3
         4hCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766926485; x=1767531285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2mbO8ygl0+LvUYCsXs5tELsSvHTLlshwMLulQXQvMj8=;
        b=VPbZXIg9r2dhorbcd+lErYICiAWAbEEIJasFKMNOkBpjl3a10IiOUisXtOUxe8K8Q5
         pw8XJeNQ8Wp0Tn0cLsULJs47ZFRgySqz3zDeuZXGa0BJHnuuRPWsfjxU75iuFAg/8Rdf
         6W3KMOCfjXf3dnnmefSaxc1288NZc7Ae8duReFNHGwn84tx/etcTYEU4ZfcZxWCvvmjQ
         I94Du9qYOGunqiwDg3SpI8mp4gorN4fgNY1Ji4Mdij0rReGCXf+1uIb1pFA0NzWoT8RU
         NyOswZGYv/S6DPFo+3Vi9Dphfp6DrAFoHktnI1oxWYGJfXGf5LJPb9IglWJ/EMptiq49
         tLYw==
X-Forwarded-Encrypted: i=1; AJvYcCWwAa+ErNDOO6EpnczEX0f64d1NvneUOUX8Wd87Y6dzKHS5h08VIO5GJyLuVNBVkFlxaJcLivgo/N8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLLjwt+QONWXR/JnUus91Vd3rpypnmGerVxIo0tn4cG5okMB9d
	o7FoceL57Sj+8Qnbh0Kls/+WLuMfak/GlhQE0kmij4/LfljENgxDQq9HeTjxpZopnzcq7UZR6WH
	uGC2MVYF96sgCat7htp1NboHMlKnjOJ0=
X-Gm-Gg: AY/fxX4i6vvVHyk0C46jeZmFkAXSlrYExTmuO8xEqPQvVUXiJqVc6J2HbjNR6uphE2m
	02tP6QIttRMIpF1OsntqaEghPwNjGjgDQdxbyEQE9VwJ2V9if8uZwigIOR+HFf0s+rpp5baxC3F
	psPt5uJU+kqRIs4T1KjrjO7fkFo1VVVtb5w0ZW234tPhWen5DE1muz6DWUFSl9nkltvJArKmEFh
	WM/jXmYvVaro1cCypaVdssV2RbCb+9ldv0iJEZVLdx+yXv6TsO5X0lwvyNfZzUXUO2zwkrT
X-Google-Smtp-Source: AGHT+IGBfZaDj3d0RLZMvLfclop/f+T5HGv5WKLD5CwM1UJOPXPe37hGHp1ADBWCEYh5abMCNyGRmJsdvDQ2e5Xu/7c=
X-Received: by 2002:a05:6808:4449:b0:450:b7a0:41d3 with SMTP id
 5614622812f47-457b2281a36mr13313878b6e.67.1766926485284; Sun, 28 Dec 2025
 04:54:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2025120708-header-startling-ffaf@gregkh> <20251207012059.7899-1-johannes.bruederl@gmail.com>
 <20251207084012.7c232e52.michal.pecio@gmail.com> <CAP=XvD+dNNDj75DYjjByE3o7F8i-QxusAdz-5+hG24fCesWYRw@mail.gmail.com>
 <20251207104505.1d5f3718.michal.pecio@gmail.com> <CAP=XvDJJP2orxYcgiKzp0FrQE2UMiXndZe8Z6BdBRFvkujWu5w@mail.gmail.com>
 <2025120748-extras-retrain-16eb@gregkh> <2025120846-nearby-breath-e5fe@gregkh>
 <dacafa36-10dc-4f2a-95fd-10ff785e4670@suse.com> <2025120941-unhappily-smilingly-59e9@gregkh>
In-Reply-To: <2025120941-unhappily-smilingly-59e9@gregkh>
From: =?UTF-8?Q?Johannes_Br=C3=BCderl?= <johannes.bruederl@gmail.com>
Date: Sun, 28 Dec 2025 13:54:34 +0100
X-Gm-Features: AQt7F2qp6YVb23S2GmL9gjH-ktgjQDp8Tq5F7c6QB1CyZJyZc_8vNBMSdXowXek
Message-ID: <CAP=XvD+LDvjyX7XRueuQ-NnHvuZEoJ7zH=nWOJhoOzupKMjuOQ@mail.gmail.com>
Subject: Re: [PATCH v2] usb: core: add USB_QUIRK_NO_BOS for devices that hang
 on BOS descriptor
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Oliver Neukum <oneukum@suse.com>, Michal Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 8, 2025 at 9:46=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Mon, Dec 08, 2025 at 09:58:55AM +0100, Oliver Neukum wrote:
> > On 07.12.25 22:12, Greg KH wrote:
> > > Ok, I can duplicate this here.  Maybe we just don't ask for the BOS
> > > descriptor if no one needs/asks for it.  I can play with that later a=
nd
> > > see if that helps as I'm sure this isn't going to be the only device
> > > that can't handle the BOS descriptor if Windows isn't querying for it=
,
> > > so we don't want to make a huge quirk table if we don't have to.
> >
> > 1. That means we'd let lsusb crash devices. Not a good idea.
>
> I don't think that it will crash.  hopefully not, as just reading a
> descriptor after enumerated shouldn't cause that.  I'll test it out...
>
> > 2. It is, unfortunately, possible that firmware authors simply
> > script a detection sequence. That means devices would crash
> > if you request a descriptor at a time when Windows would not
> > request it, not just in general.
> > I am afraid I need to point you at the horrible example
> > of HID_ALWAYS_POLL
>
> That is horrible, hopefully we don't have to do that here :(
>
> thanks,
>
> greg k-h

Hello Greg,
I apologize for the "blunt bump" of this topic.
Are you (still) open to considering the quirk ?

A small number of users have started using the Patch, and it seems to
solve a real problem.. (ref:
https://www.reddit.com/r/elgato/comments/1lw1e0v/comment/ntrdjpb/?utm_sourc=
e=3Dshare&utm_medium=3Dweb3x&utm_name=3Dweb3xcss&utm_term=3D1&utm_content=
=3Dshare_button)

Given that the options for 4k60fps recording are very limited for
Linux these days - I suggest it might be worth it. AFAIK, there's no
good other option in terms of hardware as of December 2025.
I understand it's a special quirk for just this device, which is not pretty=
..

(Note: i've submitted a v3 patch that addressed the feedback).

Thanks and Best Regards,
Johannes

