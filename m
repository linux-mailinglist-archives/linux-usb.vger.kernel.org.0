Return-Path: <linux-usb+bounces-9085-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B385389CA86
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 19:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70E372881A0
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 17:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44F7114388A;
	Mon,  8 Apr 2024 17:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TR2e+Ocw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20256142E9F
	for <linux-usb@vger.kernel.org>; Mon,  8 Apr 2024 17:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712596374; cv=none; b=bhO1htsq76EC/9mmrFLFxeWRYxDLQgpjEyrujHY4ter/iHAEoR2xAVmauTX0s/E9txFgGYo6bV9gFplZAkWMsunRKcbJqiyUK290Sg4+CtflDI9YFI4VR8qMaKJYgx+uxdwtHzyfWXXbASqQqgFX+Dth1n3w2d/ts8RnYoYXZxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712596374; c=relaxed/simple;
	bh=MMK6LDRIXHQaIEX/xSO/ytOm4Z0nzdBmVfF6/7CVjLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HCsbP7iuaCco32XKxMkFxZYZPB876MgyuHRLHVlgNg3HWa1cvMmMUwaA4+PgiKHyJvIBnjQ8dr1kzAYvOalvNu8tO2hafSM6EnCaVZ1Mu1re6EoJwDZF4GNh2mFXvsoZOoOGitehpSr+sAlIQ1AACQi5yCN/7pYNR9uJ3iiQu+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TR2e+Ocw; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-56bdf81706aso6304365a12.2
        for <linux-usb@vger.kernel.org>; Mon, 08 Apr 2024 10:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712596371; x=1713201171; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMK6LDRIXHQaIEX/xSO/ytOm4Z0nzdBmVfF6/7CVjLs=;
        b=TR2e+Ocw6lPng4KXMXumyQkqTmEiCkd2zreUEAei16Ih6w7kiVLQVgWipF2wOTVD71
         fQ7T/DhGv9GcykbvAi7jsLl9kn5ZUeH1Xn+3fef9kjRpXLUwIO091HoxRDZP/o69uYD2
         S3WOph1iYmm6nZcXapoVTVrof0NQrMJnRGLeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712596371; x=1713201171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MMK6LDRIXHQaIEX/xSO/ytOm4Z0nzdBmVfF6/7CVjLs=;
        b=a3b25K+9W+DqAvS/m59+D5xGK7yE/1kBV2XslLjdaWRXc5hLdAK5SFBQB8bKHIsQ7Q
         kaEkvUwXgH3574HpWJuIF+kEVnrmFHYH4CkfrFHomWVq/HEgWL/3pZgIGLBxybZuKXVQ
         MvaoAHKg8F2TcFCfrae4+jQtYXhx5FVnGMVpM2r2pp/X2k1Hsnwb0s5tj45u0HjtKe9r
         B7DcPDNiiqGxJ3JwC/pCNETyxSJmWHs/GdlBrUazIWzqFgA9LzcYomzjsUMo1WChY3/v
         hhRlbDLTn6KQVLi7B8gGr1Z/jFL5XDj9HTYJEj2yWD15VdLGVn4wik/v23YSSpfFwef4
         CbFw==
X-Forwarded-Encrypted: i=1; AJvYcCWWOligjnist4fKmw181Aq12mB1Sqfiaz272iNUP/YfebjkJYdywDD5bH0PUYeO+V8sCjSamEZHKyKKuezsTTro/ASHSvUhTTPr
X-Gm-Message-State: AOJu0YzMku6ZFotU7idvGJoULNSK9PnaICgPTJschzDnVQcxXVKhChh0
	NQ7oRKX+g1zcJglTlJ8JNkXFseHxlElclQEXPLZdLSTuaKRhB6EMMmyTbEMCKue9Md0UBos/eF8
	=
X-Google-Smtp-Source: AGHT+IGr3xf2DGlQqc7zHtAD8NQN/sLPBOIiPiUa3IoLHjksocBDjeiH75NPqVijaY3UMKif1YB4gw==
X-Received: by 2002:a17:907:d16:b0:a51:d628:5b81 with SMTP id gn22-20020a1709070d1600b00a51d6285b81mr2603827ejc.43.1712596370763;
        Mon, 08 Apr 2024 10:12:50 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id p18-20020a170906229200b00a4a396ba54asm4621873eja.93.2024.04.08.10.12.50
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 10:12:50 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4169d7943c1so349235e9.3
        for <linux-usb@vger.kernel.org>; Mon, 08 Apr 2024 10:12:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV5fNKJOFCC7TdrvL9Fp8KKpGRDUHVJZcpiYcmHp7MkcijBQr3JC29ibialHz2MfyObMvzIvxnsP+Hbp5TD+PNFVLHLQ4Zbq3we
X-Received: by 2002:a05:6000:1566:b0:345:fa50:ba8e with SMTP id
 6-20020a056000156600b00345fa50ba8emr1333371wrz.37.1712596369615; Mon, 08 Apr
 2024 10:12:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240408151700.1761009-1-festevam@gmail.com>
In-Reply-To: <20240408151700.1761009-1-festevam@gmail.com>
From: Matthias Kaehlcke <mka@chromium.org>
Date: Mon, 8 Apr 2024 10:12:35 -0700
X-Gmail-Original-Message-ID: <CAKZ8rEOZ2bPkxNxSRGMWQH6frvipwYXc79Lw2C8xndZmybaUbw@mail.gmail.com>
Message-ID: <CAKZ8rEOZ2bPkxNxSRGMWQH6frvipwYXc79Lw2C8xndZmybaUbw@mail.gmail.com>
Subject: Re: [PATCH] usb: misc: onboard_usb_hub: Disable the USB hub clock on failure
To: Fabio Estevam <festevam@gmail.com>
Cc: gregkh@linuxfoundation.org, frieder.schrempf@kontron.de, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 8, 2024 at 8:17=E2=80=AFAM Fabio Estevam <festevam@gmail.com> w=
rote:
>
> From: Fabio Estevam <festevam@denx.de>
>
> In case regulator_bulk_enable() fails, the previously enabled USB hub
> clock should be disabled.
>
> Fix it accordingly.
>
> Fixes: 65e62b8a955a ("usb: misc: onboard_usb_hub: Add support for clock i=
nput")
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Acked-by: Matthias Kaehlcke <mka@chromium.org>

