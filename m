Return-Path: <linux-usb+bounces-31226-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEB7CAAFC8
	for <lists+linux-usb@lfdr.de>; Sun, 07 Dec 2025 01:37:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64FF4304C5ED
	for <lists+linux-usb@lfdr.de>; Sun,  7 Dec 2025 00:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A00AC1DE4C2;
	Sun,  7 Dec 2025 00:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPgqIQ2F"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1217D098
	for <linux-usb@vger.kernel.org>; Sun,  7 Dec 2025 00:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765067862; cv=none; b=nyvvjGLwh3TsDEhcE8nlP56RliIFk2YVtdZ9yG8Jg0snT1rSe//2QDMw4Ki2BFxKSGs4ujL/yrCcIvh59FbeyP9HQoaSPGldiPZjysnZ5fRvmi1p7GwUEDDaU1kl0QXuj1bHjYtIzFbow5VZPR1ZioM0J5QJPPtnbQtNhoBl5cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765067862; c=relaxed/simple;
	bh=oMBXKBpzKMyRpLgpUr0w2CwPWmutktGRt5cXvS+uaBM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NQe7aXOpmxvqlwcn+d+yiCoOR16dxHjyr/OtsIwKRkH8Q9/u45RQS/wfBFKGfWEIS8HwYz+Wg56oL+CLJHFp3VxKg925pFjPSW1IHPr+xYk/CxDqf8b+dM/UQYiKtqMecgbbuc78iIb5AeqBRlivSY4Wec5adDWyIUAC3m8XYN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPgqIQ2F; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b735ce67d1dso537249366b.3
        for <linux-usb@vger.kernel.org>; Sat, 06 Dec 2025 16:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765067859; x=1765672659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vM01g150+QWducT+gASJyqHE2lTKdYg0871uytSpEY=;
        b=UPgqIQ2F5XH2llSgMyXPGt8SyHVU2wJse+2J3qG+2HaLyrYPZ3MSiLAxmi/iC1s3VE
         AXun0w1YrWEQJ4CPWEx8BMxXDe9XMfUbkkJcDgdAQz2cpl9L9QXRq3LlAQSHnueYuf2V
         lE+Dc0r+k40LhjtYgnUofJIadM1yQalGNKyJa7bw8iQhHuoRM2ZxIFS6xOam2doZQhTM
         OuaFK1Mj+SIRGOqoWQ/E5bf3J3YPPo1JXe5aYYK7NF1aGxX73zhFyXbvz+PdT0WhnlmW
         GSKs55GmMwBSyR9hTjXMo8OzACkG6FB2yao3J5CUYVJV3N4Ws53qB/OwM5ERou5Nj2iE
         76zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765067859; x=1765672659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3vM01g150+QWducT+gASJyqHE2lTKdYg0871uytSpEY=;
        b=iiv+TdCKtmjdt4EEEWEJ/BWptvqlHNucFDyThqyDHUbi7dBm7ACaIBBL+i1snOy1J9
         GSSuhXodhPR+skzWSBKTAsxYEeDBKRSfsVEOSRCEYQVpJeQx/HUiRxeQerge7aSWoJ8h
         ACZHeqjNXvUwMq/etfozjViqaz8BSrK78lKzZWRQCKYBQuX5QHO1slesPceiTcv1Xqeo
         ldZMXgIVyQq/SM79UlIj0RAgoGWxqyVuRi9sMjj4z/0Fh+cPWToFp+quC+VIsVWkfpXn
         XfgHr9JP43mYyfAk0FZoxWvMAA8oUQSL3bJBEf8SRDqi+n/JubxtxO8Trnp+oUDdc/ah
         qZXw==
X-Gm-Message-State: AOJu0Yz4UD7Sy4jPtF/hMsuRDrzOp2Ue150B0yztPBJt+CI3zj+y0UQd
	PZGXT7bU/UZykf/TP0wk62vZjQ7CF60TcTNUf9w7jxDM69gBrM1/DJTQw088qg==
X-Gm-Gg: ASbGncu70Jn7FfAN5LyTunIxbPhQXYRZLhCEaHJKkygFTO4dgJPQDy20jiQi5zOJmo6
	3mkjp7esuE0jhoTQtDW1+MlKJqg9zdWnqzm/XQy7YRObKky96JOgtbOPWRvRiDjUH+rt4G+ZhXr
	4JvlhIvMaxaLf1B2jXV2JbnW5sdOkJHPVypSQx+qmkpMNg0DYz8jY4XMX+eFJWvVxIVFGz/F9Ix
	JWO8yKSfGlzu/vSUSeFJTFpMvrDBrtzCxM6Sv3D7bcWFVqDi9DlzGbeBH0M3lSRibrH+Z/eKUFd
	s2bAegfBSNOuOZ7esBtAZ/tsKVNlU5oFz7bh5zQ0qiTfTHGJuOD24Hguorn1/XSX4usesijpk9d
	HjTuYPny/llumvlvasTyWrvoap40W83P68+ot6xvh4FFncY+K/D0Zz7WABxnRQid6GOMZahKY2f
	zvMYivKSSj5ehS4zUVYW1Qk3sWjGE0WECHOA==
X-Google-Smtp-Source: AGHT+IFh6MHlnfdeuyIQhGXAgbvGbwc5h0gzPosg27hkAGLObIWCHeMNKRns6cTmzbKBe429Zdu5Lg==
X-Received: by 2002:a17:906:7308:b0:b76:31e6:2ee1 with SMTP id a640c23a62f3a-b7a242b0b18mr379245266b.18.1765067858559;
        Sat, 06 Dec 2025 16:37:38 -0800 (PST)
Received: from foxbook (bfg212.neoplus.adsl.tpnet.pl. [83.28.44.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79fe78c9ebsm614453566b.5.2025.12.06.16.37.37
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 06 Dec 2025 16:37:38 -0800 (PST)
Date: Sun, 7 Dec 2025 01:37:34 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Johannes =?UTF-8?B?QnLDvGRlcmw=?= <johannes.bruederl@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH] usb: core: add USB_QUIRK_NO_BOS for devices that hang
 on BOS descriptor
Message-ID: <20251207013734.4e99331f.michal.pecio@gmail.com>
In-Reply-To: <20251207000007.11631-1-johannes.bruederl@gmail.com>
References: <20251207000007.11631-1-johannes.bruederl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun,  7 Dec 2025 01:00:07 +0100, Johannes Br=C3=BCderl wrote:
> Add USB_QUIRK_NO_BOS quirk flag to skip requesting the BOS descriptor
> for devices that cannot handle it.
>=20
> Add Elgato 4K X (0fd9:009b) to the quirk table. This device hangs when
> the BOS descriptor is requested at SuperSpeed Plus (10Gbps).
>=20
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D220027
> Signed-off-by: Johannes Br=C3=BCderl <johannes.bruederl@gmail.com>

IIRC what we found in this bug is that the device will happily respond
to BOS descriptor requests issued by lsusb after it's enumerated.

So it appears that (only when running at 10G, wtf) the device expects
something to happen before it is able to produce this descriptor. And
apparently Linux is doing things in different order than certain other
operating system supported by the vendor.

But the reporter simply applied a patch similar to yours and lost
interest in debugging any further.

And unfortunately WinPCAP fails to capture most of enumeration process,
so I don't know how that other software is doing it.

Regards,
Michal

