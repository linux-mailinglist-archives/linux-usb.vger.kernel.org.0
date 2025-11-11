Return-Path: <linux-usb+bounces-30389-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD2DC4C4C7
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 09:13:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2D49E4F8E5F
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 08:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A53D2DC76C;
	Tue, 11 Nov 2025 08:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9lzz7Wb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D092BE658
	for <linux-usb@vger.kernel.org>; Tue, 11 Nov 2025 08:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762848512; cv=none; b=Qy+MyAhmjHlrMS+ihrTjvvaq205s+/DySRkl+wsn89HDBmjojiTo1S3J5Ds3zW+1ZQ193zrgNhs7zCE1Sp0jzeuHVNM3Q9umiwBcSzXviowh5I2FkbJ8tDw0ZONgyXhHRrWc4ERoqc3ur252tyM9Zsv5YWjPuliKAVaIwYEXcs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762848512; c=relaxed/simple;
	bh=/EzhxUbgXu8TwphJDNg/nG6YdPSxeoOM709DbPBznw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BXoSR5Ze3Lr2qI9/xoChtYCgWPsFjdOS92p4tKfBP/GFAAOYVhHgcmFT3m//X2TFHAYSS8QZ4L8MhiNacdVML1kSXAv05zLQLjZICRDt/CA3X4YH61Qx4HRUv1Kb1/Sa7dL9cmLf2IOrAOGFgBT0jcZlHwIQzvxUlSKsKAjZWmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9lzz7Wb; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42b3ad51fecso1507070f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 11 Nov 2025 00:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762848509; x=1763453309; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EzhxUbgXu8TwphJDNg/nG6YdPSxeoOM709DbPBznw0=;
        b=W9lzz7WbCkEDK12RoaXsBUeDy1V47hSyLmtCQQS9t/5FTlZI7fKa92tyUFW7RLVRd4
         BJkV/0kkRjvYMVXrYaFRXt+MVZv5q/pweieSwwZ7VU+JIELWqFgD0bheJHpOQYR63ON4
         GTlNcMM000B0O/VTp1AAANjlih+YgQP181Vby4hatmS/9ZM6ZdG4eDHAt90qsJ7Pvmsf
         rBYtQLt5E/kTSFk+zt/CJGMii6X5v2c2chUmNe/IZJSkVeo1/fODkyLCNA4L+VVIXtK6
         hcD/4jZALJgZQpoyn3OS+kfFoqQj/X63HXSTn3xnSV2k8QtVb+HRuMmGFS8jRmd9/5v1
         SvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762848509; x=1763453309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/EzhxUbgXu8TwphJDNg/nG6YdPSxeoOM709DbPBznw0=;
        b=oshchq8UoGqb12tD5DEeY58FX/L4sIi+6U9T+Y02WhvAZchq5UeszOEQjDbi+SB2Mz
         k13wL9Dxaj70oM6fbQ3U0E+biGpEyVJk4KaNDmlXRFPj2N6X3kz/aPT4C+0bMzKc9umQ
         A5HmqiaEEmmf4A87dlHIPG4p0e+3RU/k+LYlVP1LeThxyVZ1EicLejXN9JSuvU+T+Ub4
         Ltau9/fJom3ta1ka0ygYcjJd0LAH/vCz/Ew1P7Kcm4jY7c1wzUH2CNOUQJ2l0T27svZx
         iugREKvN01xOOfTwAbB3GSRtVdB1KjYWZAb7XPorIEBcbhU+NCkSSv847JW0yfVNNwaf
         /1lA==
X-Forwarded-Encrypted: i=1; AJvYcCXcQBWcAJ4iDpAcrpHMQX2vSaAAJhf7Xl5bLemreY8yY1ictRQAAmXUnprEassMr4D3DZnBy0SBF5M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwb9FWVkwyLCbtEd9SsoTVo3ndhnJ9tz9bmRVvseswOrBvwmJ9
	N67AEIgokAWeLso/7DpWf004KLxCO1nBALHGSEOCUg/Vk6x5T7vlDz/NCdk1AczkMwu89VcaMJi
	KYO6diwnvW4vCYgFMZxaKhmQ6/FqWFKw=
X-Gm-Gg: ASbGncujUF38gvI/LQvOOda7qxJsau/WugA00L3EYQY76Xgikx5KJWzIcr08WqqNEv5
	uNqhwFtM+Yn4IFeRnVWEIS0guLW1cqR1/5RpCaWyGqyFx1W7E0MFeN0LmnCOD+RHDRSP818vFpy
	CqZsU4P+weNcNmlcG2uND1uak7eWmRXssPLTeF3Ca7Hptg2Js66x4wcvwAqo18h93WIjpP79dOa
	ttcvBr0hhRpICaZX66JB5fcQY+CW6gPn/+MFGJh0eos6cNNpAoGTkVpXtIapKay5LkUf2CSip55
	EsbkUMMwA91o7NuFJ0N9qvdNX6HO3HY8CI1WnoOie6b7cTLq0s6xI30AnzpB/BT3
X-Google-Smtp-Source: AGHT+IFvSfTIU4Z4qFzOo2YJfLilhL94JX4cA1j/1rEFPdljVva6t9U+b00rwrHwvs9/nnWZ5H+ImqldCjksQoIqQAs=
X-Received: by 2002:a05:6000:40cd:b0:429:b958:218a with SMTP id
 ffacd0b85a97d-42b2dc4967amr8587827f8f.28.1762848508970; Tue, 11 Nov 2025
 00:08:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c6d506f7-f13b-4d57-a522-a2ccd09e7a1f@cosmicgizmosystems.com> <20251111074205.1533558-1-lugathe2@gmail.com>
In-Reply-To: <20251111074205.1533558-1-lugathe2@gmail.com>
From: The-Luga <lugathe2@gmail.com>
Date: Tue, 11 Nov 2025 05:08:16 -0300
X-Gm-Features: AWmQ_bmDNcXrvdWFtWzr7GXasgYB3WfrnIRIsSzhNeM-NRsY4FCwIBHXAWepbOU
Message-ID: <CALvgqEBS3NJxdJ1LF2j5g3q0DTyU=ZSFyeygDP1eitgRwSjvmQ@mail.gmail.com>
Subject: Re: [PATCH] The Edifier QR30 USB speaker, identified as: Jieli
 Technology EDIFIER Hal0 2.0 SE 2d99:a101, reports a HID interface that needs
 HID_QUIRK_ALWAYS_POLL to ensure it does not crash when changing the RGB
 brightness with the physical knob.
To: linuxhid@cosmicgizmosystems.com
Cc: bentiss@kernel.org, dmitry.torokhov@gmail.com, jikos@kernel.org, 
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org, linuxsound@cosmicgizmosystems.com, 
	michal.pecio@gmail.com, stern@rowland.harvard.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you all! This was my first time contributing.

>ALSA and the rest are triggered to bump the volume up or down with the
>Consumer Control Volume Up and Volume Down events. Those HID usages are
>declared in the other HID interface but never fired as your testing shows.

Thank you for the suggestion! I might try something like that in the
future. For now, I=E2=80=99m happy mapping the codes of the speaker. Revers=
e
engineering is so much fun! I hope this patch helps others avoid the
frustration I experienced with this bug haha.

