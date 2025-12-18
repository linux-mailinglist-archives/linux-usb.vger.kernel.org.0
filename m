Return-Path: <linux-usb+bounces-31591-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B985CCC737
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 16:26:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 68E4730140CB
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 15:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4125F35770D;
	Thu, 18 Dec 2025 15:26:30 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13143570B9
	for <linux-usb@vger.kernel.org>; Thu, 18 Dec 2025 15:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766071588; cv=none; b=ONGcawn4fFYvOl4qia6elvz3EfrpIFu5RjGwUsDzdsEzFW/+1m1dQHXThV09iI4dDL2aUL/dPTEmKBqUDRlIxHOEO0iM90zAOHKktbNhRQGlTR6ZDVxAPVI3YV8J72CY8JcNmP48FRyltiMK3Tgqj4SgdNJdfv7c6oui+qSCBZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766071588; c=relaxed/simple;
	bh=MZFYNuXybRkvVzjEOIC4+EfAayF8myAFp7P6EDOSejQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FAIsibD0Y7cmk4M79xYfLPc2EGIEoACH1JGTBSqgjL+VmM3Ays18KUsJ5XujPAxXhSuPMzIrovG+Z+TvkGoHwSnJTn/+ZGKzX+tjCmySHWTgVTXrcR7TsMqT1CBAp86eD/LVqICqx0hTPYGM6rAs53dGnXI0fQAaAZnUkEflc9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5597330a34fso494233e0c.2
        for <linux-usb@vger.kernel.org>; Thu, 18 Dec 2025 07:26:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766071584; x=1766676384;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dY9hOfw+nsqpN2twCEfuG3WmlvEURTIXg7HZZOHeWk=;
        b=i/w6ShvLoAmycNDXcxhedjPL+Aktf+8GrMxc4Vey1WbUgN6LWHyFRM3AgmeqZ+LvjM
         xkVup3i6kLnJL7qCmbtM0MHjHIphsyzNZ5x4924EMa5HLS0mGip/WaRb8Em3YJLbKCe4
         aAHwB9sUrmtK2FpQeFD+2AJuq17JY4wtbSb9G2l7FxcO8pYt95EPkx8ANEKMnarAz0P5
         g9FT0G9AQRSIYWWl7Maa1PcSTEbNcDGzQpVRokRsehBql2M9lMPN/oN06Tqv+vcWMmXR
         sZ8RdBKHoMnMjz/yw0L9iYCwi652RBL4P0DcuFNo5p7Wy4xAWpncQ5Utrc2yF2SBKOof
         67MA==
X-Forwarded-Encrypted: i=1; AJvYcCXyY9i4HFyD+EP0+WKoacda7lbOqKWxCub6kx7Z/uY85BR9hGpshz6lGIkIfowJLW2sjphYJ3oRkPo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9nxFHk9iX6+b7hmdlhPVxeKyxPABL98ZkZIWy+HToRbF8pR44
	7yHvsqNaLjdBOEFvfYO/mSGZT31jVhN6XqiHZd1r1ofAQ4dTCldY46Z2LFuQa2Lh
X-Gm-Gg: AY/fxX45tNruvhe2WM7r8KV7P/VVG3FVHMBbWU6wVz84eYIKUvKfsjuC8tm9HyGv1mg
	Ye1vVRVOmWW7zng5jr9KcHX1SdV8vAPtibPvruDykUqKgk+S/8OqX9ToT9bkc+ETk2QJltTOopD
	dtx8Q46DKGzygtibMZ/WOOGDek0BMu1iDsjPe5wLplIAJspmrZ0V2FzbOufMgVtKDl+wZOc/Zw+
	V5MTsCN8qHLoDLpIcxdjOv4rh7Z7YDaewahIBXkr2WR+OHAPpPiDEur7Kv5D/+Mb84317EmR6LL
	rmbfhh4XHPil0JIzVNdI9uWqFcLVqA6K4OX4sw1gwGMt3v4cqs441tzb1hhijBa8JQiGKWp6eFm
	oWI2lma4spp85kr+mL+9tKZzsxgfuFi5Jplks6ig5feCLBTJ/sH/QhweM7mE2qIvZmXQce5Yz5K
	oLNGQRJQNWkEWPqb6Mwln7+vcSa6ux71RzBqkZPrdEOWWnSpmH
X-Google-Smtp-Source: AGHT+IFHwDC6HLyJYly6H00e8ZOlpQmSiB92x10gBpi3XHq90jBZN09z8qQ2hfL/pa7cloTtHs8iZw==
X-Received: by 2002:a05:6122:489a:b0:55b:305b:4e43 with SMTP id 71dfb90a1353d-55fed6655dcmr7616545e0c.20.1766071584165;
        Thu, 18 Dec 2025 07:26:24 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56150f4e0fesm1104501e0c.3.2025.12.18.07.26.23
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 07:26:23 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5e53441429fso496299137.2
        for <linux-usb@vger.kernel.org>; Thu, 18 Dec 2025 07:26:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWWzEGsUckOn/Yrtilgs/8Oer5MfTtEiJp+J0YjHW0+mTj/bP5XVEniPSjX+o8OB2pCFaf4OAtJR1E=@vger.kernel.org
X-Received: by 2002:a05:6102:644a:b0:5db:f15a:539d with SMTP id
 ada2fe7eead31-5e827475423mr7568578137.7.1766071582885; Thu, 18 Dec 2025
 07:26:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com> <20251218152058.1521806-2-alexander.stein@ew.tq-group.com>
In-Reply-To: <20251218152058.1521806-2-alexander.stein@ew.tq-group.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Dec 2025 16:26:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWEJ-eYwUTnotsTVEtKrujYVsEB4kFVjRYh3wXZvyjfGQ@mail.gmail.com>
X-Gm-Features: AQt7F2orA3yT0lOZg8JX_FxOJmakbvS5h-4BSNrnlwxZlZ9eRsbqovvybB3Xhko
Message-ID: <CAMuHMdWEJ-eYwUTnotsTVEtKrujYVsEB4kFVjRYh3wXZvyjfGQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: clk: rs9: add clock-output-names property
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
	Roger Quadros <rogerq@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"

Hi Alexander,

On Thu, 18 Dec 2025 at 16:21, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
> Add "clock-output-names" which is a standard property for clock
> providers.

Why? Isn't that property sort of deprecated?

Will be replying to the cover letter next...

> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

