Return-Path: <linux-usb+bounces-30866-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 641D9C80D59
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 14:45:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 78D514E4856
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 13:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47DB430AAB0;
	Mon, 24 Nov 2025 13:45:45 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCEA309DBD
	for <linux-usb@vger.kernel.org>; Mon, 24 Nov 2025 13:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763991945; cv=none; b=WQ+fSUVuu1X4Sq5Tpr/tbTFBdg2g5S44sKQ2RRt6O/0qyxdvEWT6UhMpnLLEO5frONSP1wjmSfs4y4M92z1onA0dabI+tE0+8pGggtTIZw7m83BbuyAJN2vx4ku0hFONLwbU3UviqiCjKQYPwvXjlJ25jZgkTa9KZNsJiAY3NOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763991945; c=relaxed/simple;
	bh=pGwjEOungeheGFb7JOaHZHRCSnn6bJ6yIDISOpRWkF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lipsvq+KzjFS54AxaLZKjRg3h86cakRzw6JygwdcHn74xU/GvQOj0eMVQywowW7qyrqiQhODmpDZ3zfaPr1CseVmHMFe6qAGp/V/ZxFgJw/0pRucr+xbyddRSJ2IA+w/mmRsDkfhNL2nusNerLXaE5ILW7KtAVE/zsMdeQ/q1/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-559836d04f6so2998513e0c.0
        for <linux-usb@vger.kernel.org>; Mon, 24 Nov 2025 05:45:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763991942; x=1764596742;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JzF6CGFzYEv/qypghK1+w9eJ/Y2c6REJMBluTWTXczY=;
        b=S1UEMtpER0NQ6hYEogH4HaAAff5JU7z0PageMcWTPKUjQHMWSGb5L76AuJWLxlZc0U
         v3WGL4w9JNbSwFFS3F+RsSSACW/1k99od0LsIJKPVmCeY1YKMJG+mAqE29bEDCFVi9b9
         bfb7Se1J4W3QdBfNWbYjMe9KxjFOvqwE8Lr9noGWCFVBJK/XwB6BMw1iJf7/iANT6y8t
         a81/8J78/hwEYXWfB+QtcGvv8FTWs/uyPjN3XU0kZE84bBp65JbsOvDCDy+iFS+R1EKz
         yAY4qOiHKMrTm6CDv8KwuRoV3+zfU4I3vqIBmZBqCgwy+pcXoOgrZX0sTZ6procQxJIj
         28HA==
X-Forwarded-Encrypted: i=1; AJvYcCVsWoU8Uu9kcgm2kbUH1pDyRlmsRBxykcw7QeECb/ak1dbVlhJExDXlu7vkXKOtZ7PrFUAIx7QjRhM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKKbai/JyCW+8CZY48wZjHZDp4/NhM5SabPlGLxbeqMBgBzRGT
	2oY7bB0Y6CaedpBKSYxOjD4cI8xaQ3sosQKG5iJlvdm9Sf5vYn0j5f9NtArNAHKL
X-Gm-Gg: ASbGncsDG5Ai3UJzlwzQQSPh7PRtqQk7QzKx3yp2hCy8hg6zQrogsIbd9Ca5TX+hQ98
	5Dzm1Z6G071vh6cEiWSh8BKc2rP10SYQzWEFkvXgY1hP8HI3BPaUQzwejBOQDvnCk5NFtLkF9Dt
	rD93hTO/m7Jff/5e00zi1GvwsxUvHJOXPSTzOdfea8OqMHQCIYFJ2TNXH4eS6kT30nHe/byDHEl
	u4LbNyR8ONdm82LwUTXHCUZDB4mzJtesmE3YA1YauP4ehzqxw5WdrZBzdENgda8jqD2U+K9wI3K
	tcRy7tRkPdWt0pTrs1ClQRrqmI8E4bGZpK/6IIg3pwZ2NpoeaBabw9N3OLGeILx1zgCbx8KZBXH
	XSzNgm8EuxGJb+VKX2YsCGanDLaTycUdXpznYHzFaIzzPETpXBHc7hXMvukFzVehl3LOwApDZGN
	LqbuGhqoUeAKna1on9A63rEfbtYRnW5Sz4elxrSRyaTmebhvXxgjZP
X-Google-Smtp-Source: AGHT+IFDhpK5XS8L+pFkSy1P7cde0zIOA9ksJZXIQQ5ngZEEHrM+zUGfTI9r0nioV/tjwrC80CZteA==
X-Received: by 2002:a05:6122:6602:b0:559:ed61:4693 with SMTP id 71dfb90a1353d-55b8eff01fcmr3970864e0c.10.1763991942250;
        Mon, 24 Nov 2025 05:45:42 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b7f7a06b7sm5459193e0c.17.2025.11.24.05.45.39
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 05:45:39 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5597a426807so2981421e0c.2
        for <linux-usb@vger.kernel.org>; Mon, 24 Nov 2025 05:45:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUxmDntnxt6y8XvY6U7eqNtNrbII0+swEk6F6uvhOFgY0aiuI2c2/MxC+TyOET/quKQZ9wVOVWvxSg=@vger.kernel.org
X-Received: by 2002:a05:6102:4b84:b0:5db:d60a:6b2f with SMTP id
 ada2fe7eead31-5e1ddd3b9camr4128126137.0.1763991938983; Mon, 24 Nov 2025
 05:45:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101042440.648321-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251101042440.648321-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Nov 2025 14:45:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWm2=4hgdUzS7c2gDEOikbW--HdhDLkOFAzk3K6LP5=5A@mail.gmail.com>
X-Gm-Features: AWmQ_bl9iCRqQApt_0NUXCaJN4jP56qxhVOoLl31Dhsfo_UxI7Dbre_KQS3oejc
Message-ID: <CAMuHMdWm2=4hgdUzS7c2gDEOikbW--HdhDLkOFAzk3K6LP5=5A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: renesas,rzg3e-xhci: Add RZ/V2H(P) and
 RZ/V2N support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 1 Nov 2025 at 05:24, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add device tree binding support for the USB3.2 Gen2 controller on Renesas
> RZ/V2H(P) and RZ/V2N SoCs. The USB3.2 IP on these SoCs is identical to
> that found on the RZ/G3E SoC.
>
> Add new compatible strings "renesas,r9a09g056-xhci" for RZ/V2N and
> "renesas,r9a09g057-xhci" for RZ/V2H(P). Both variants use
> "renesas,r9a09g047-xhci" as a fallback compatible to indicate hardware
> compatibility with the RZ/G3E implementation.
>
> Update the title to be more generic as it now covers multiple SoC
> families beyond just RZ/G3E.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

