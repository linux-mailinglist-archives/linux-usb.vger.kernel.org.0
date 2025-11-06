Return-Path: <linux-usb+bounces-30156-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD16C3BDEB
	for <lists+linux-usb@lfdr.de>; Thu, 06 Nov 2025 15:51:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5081C1AA11A3
	for <lists+linux-usb@lfdr.de>; Thu,  6 Nov 2025 14:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9B73446B2;
	Thu,  6 Nov 2025 14:46:00 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555F6632
	for <linux-usb@vger.kernel.org>; Thu,  6 Nov 2025 14:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762440360; cv=none; b=sqbaEirJUrX8KsHBWsRSubJpxmjl8yRtzhIVO+kTeaSJ/CQ8aK6DobmQCcJHp+R0CMddqZQ0lw4k6ZRfLVy9GjarnUq3nqmDewCImKJysFPzd9scoH9SyPevZ3SdYytWn4dECqBNtSjMBkYy2EqMgV2Nn2PzdwYCMEGRuOvXggM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762440360; c=relaxed/simple;
	bh=Rko3xstkOlWNzB0nEx8Xajkj6lMTjfDffEyYCE5Ooa4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vj/ID3dkfuT939VEmteAK2yLmK/aOIrxs/YQFoPs99cpuoRmeRKcH06/DkmiRgA/DBvtukECa7H3kZihTHQoYhHgasPXHqfZqJCTGBXsfvDu4bLQ5VXWdf+Ok6V3b4THMTUkidZmmBCGzcy+BVV9Y/dPsSVsuiF3ytrZjISCNRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b3c2db014easo192551166b.0
        for <linux-usb@vger.kernel.org>; Thu, 06 Nov 2025 06:45:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762440355; x=1763045155;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3st7eMMaSXO0TyFbpqjCRrUrNA04OPi8LDn9CrKLFWE=;
        b=cE72o19fPr8JEKlqQPzmLnl6AXmxMThIkxudV+LzfM2okyJRiAW/WlZxdPyPdIdvfE
         +JOcIvYn8GLc9MQfGRZ3iVKrlOqxiIgv/mMwkR6tjDJ8D5WGRgSk6puNmpa5coNNMTuA
         G8R80WzbeGUriLLBc0UBEU65mdTUa8YTbw6GjQ8EbUVi7hEim/kZrFj4Y3ueDXSfVnJP
         jmk17Bwyfw5VmBgM4+UfLKQL9BrnpjoG5CLFkzJB0gfOzYBvJXeSZFgj4tUB7bKcs39s
         mPmHLzerBRmAf9iupQX4CIgqW8XaXpyySa/NlSTP1N2vtykw/0i7amai0YWSRLOVY2lk
         xlLg==
X-Forwarded-Encrypted: i=1; AJvYcCUbSLZO8NrEboW+B4FeaYdeuWJeLDXGioO9eORXVmKdNzLgbrloE+pfHg0ZTn3pVis8h8jOoJ/6Ynk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9TbyAQcs8pn1UPdpEO3jKXkSnUr1ZHKpf8fzFMCmSlR9BvaWa
	ytaGBJdTK1fB9Q06HWz6xLCbMLzRgiMarDLMLfOkubHXIezWhYzD9R26w/9dgSLHo1s=
X-Gm-Gg: ASbGncueywq8JLsPflvtHxHXkBu34szMRFFqR1QSs0CSBsKfq9BcmM7+qNC6PzCGEuX
	odDoxfFUBgT8gm/B3+wke4n5SdlEYj3KTQurVDkIgNNlOX9ULuO0vThixkVa5mLn0Vn0/M9ujhY
	7+nzqZ0w1oHOwWLg15sF6KqvVNTYLuAgzqu28k68Ved3Z1l2iv/btu+a8g3128T/bLuBYJqA/2t
	6VjW6Q+Px5RK2qW1JLwiHUDFH0G/p2FHoDMYfLchX8SqxzjubpjFY9XuGsaIDGwr2Z0tFxgfi2R
	L6DGktCWUERWJnUfZD01ZdhshDa0glbvV3et1GBTDCJ/zxuMT5UDjkhA/xP8Ankuk3Y3U69Zdi7
	hf9nquvxND/tWiw7mBxVxH8oZV9iPlC83lVF+IPSXQVDH5dcQugf2caVP/DMay9RcB1ndAfsEHP
	JcShVdRfBdWgkORukx+DPZInapSBZOqX/1OAtG1h7ot8/C+wi8
X-Google-Smtp-Source: AGHT+IEx5ZB0JiUozRguh6YWDuvVlPOv009Quez8hxbKQgw361rVZUZCbM1V2qxYnWJDGzM/eqY5OQ==
X-Received: by 2002:a17:907:6d1c:b0:b72:7a39:4416 with SMTP id a640c23a62f3a-b727a398188mr558559566b.55.1762440355041;
        Thu, 06 Nov 2025 06:45:55 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b728968318fsm234269166b.49.2025.11.06.06.45.54
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 06:45:54 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b710601e659so205779266b.1
        for <linux-usb@vger.kernel.org>; Thu, 06 Nov 2025 06:45:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUT5ZBWcroqZ7nq3KJGNvf8IDLBwFQAoLQvMp04bu3h+c8KOucHzkZyJEUoTFvOrxuPgkDJDjZSU54=@vger.kernel.org
X-Received: by 2002:a17:907:94d3:b0:b39:57ab:ec18 with SMTP id
 a640c23a62f3a-b726553b58bmr784930566b.45.1762440353864; Thu, 06 Nov 2025
 06:45:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106143625.3050119-1-claudiu.beznea.uj@bp.renesas.com> <20251106143625.3050119-2-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20251106143625.3050119-2-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Nov 2025 15:45:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXYZ2HwbjGfqec34Yi0hr42f4wqNt__qzdPtOQbQYOt+g@mail.gmail.com>
X-Gm-Features: AWmQ_bnyGe-tBa6vxDdoGWRrQ67QYUNEF41407Ery3IfFjyCSmOT93dLDuJTfnM
Message-ID: <CAMuHMdXYZ2HwbjGfqec34Yi0hr42f4wqNt__qzdPtOQbQYOt+g@mail.gmail.com>
Subject: Re: [PATCH 1/4] usb: host: Do not check priv->clks[clk]
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: stern@rowland.harvard.edu, gregkh@linuxfoundation.org, 
	p.zabel@pengutronix.de, yoshihiro.shimoda.uh@renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, kuninori.morimoto.gx@renesas.com, 
	geert+renesas@glider.be, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

Thanks for your patch!

On Thu, 6 Nov 2025 at 15:36, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> There is no need to check the entries in priv->clks[] array before passing
> it to clk_disable_unprepare() as the clk_disable_unprepare() already

them ... as clk_disable_unprepare

> check if it receives a NULL or error pointer as argument. Remove this

checks

> check. This makes the code simpler.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

