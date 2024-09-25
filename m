Return-Path: <linux-usb+bounces-15444-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6E6986133
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 16:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B1801C2695B
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 14:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27ED9187344;
	Wed, 25 Sep 2024 14:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jm2x4cJD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F043F190470
	for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2024 14:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727272941; cv=none; b=TWyn4D0OKgY8oGqkiW2BdKuIy691XN4Zxc7A5Sg5NiYyeNGT1zgmSUc7e0+dOoNAq5BfFG4tu3k2vkX6RyN2PaNqivpqalYV0rvisd202kKNirbHCAJq/EOKxJ4R8F8X4Jv5+35MfYYvLL8hGiP4LltI7o5rYYkJDWrS3aHrNYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727272941; c=relaxed/simple;
	bh=8YDbIe30UvCTr+iYs9UYlXuVaHXcwLqJ6aCT2H4HVPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NZG2S28X0qt9qv0CGGLJ5GgG0RxTSGQANRZXtZ6SskO4VvQuP93R3r13XiYFcPcUBs6X8zuWWbwfOQXDhdnlx78mckfpQ9qj0sYeeSkTo1HCFNlcaHS6zDcY/BVa88/yI0b7r2A1PNPtVx1x7fNTNquPqjqOCa9rBSZS9m5hqt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jm2x4cJD; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6d9f65f9e3eso59784417b3.3
        for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2024 07:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727272939; x=1727877739; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ToUKIzEuriYR9o6QD0qmgl4Fmelj6t2JR4wuG3YJ1Ec=;
        b=Jm2x4cJDhL9aeCvoBj26hX7AJYtpH28Rw6yhcsDcFUtiyoskD4xT/cVvWWm9k4wHNL
         ytsm7ISRQritfJidLUZBAbALxSZu5/djTbg5P/KKe/LfNJCmNiiBIdu2nJc5kcWCm7xD
         HkbEfW38ePft7IMtJFF06W1vT3gnWHtwsUBlmwbwAekUpon7b/hZjLM1LGD84tUOEarL
         pELarkq7fhcdfw2DK1zgUWeFxLwaeWwLYHcMKgquR4Uj3oIjByZFzaMFruu1lRRuaVVI
         F8akQ1LfsllfeUk6dU/Am8Vv7EPdP/MiGm7HXYsZCqBvMFnXkvi24Wo8gF1YubBHd57w
         +efA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727272939; x=1727877739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ToUKIzEuriYR9o6QD0qmgl4Fmelj6t2JR4wuG3YJ1Ec=;
        b=ngr/Qv7KjXtmWcX4TMoI4EQwMvGMprfBKvfdtZebWB62kmKrQ3sV+uA+Zo58ML2SYx
         nzhdUgwA7mBIr7hddaoJxwSNj5iIw7/bxrbbLVo5x26v2eZW/fSU+fScU6l/OhI5Lubc
         2X5qmQ1bv5Rmfb8Edimwc0S3b+jlQeJxngm1iNEvFRDw4jueRbE5mamj6GCdjZCPIJIT
         Cxmlj8EmGfv3mA5RNkRCNcT34nACbuGWCBxSdxngqZUrH1KZ0JwJ4Gu7UoDfBmS/P1IB
         Uy5IsBm3PG84civjHQjQH6uImIy7DE7CrLItx+ryfKtDSbDj5efTq/hP+1vwbIhpcUZ7
         /78Q==
X-Forwarded-Encrypted: i=1; AJvYcCVjqNkyejsg9miQ50pB4aGg/jLzzWUdSg31Wxgjt/06u41uUl+Xo/3ULvcywwaE0Jvb73LTC96zsHA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNrwZ1UIi/N+c0EcMj16XIvCvF15cQLxMgfT23hHxMJtoess1X
	BzaT4OHy7JiswFmyMrJz/s8Ps7V9mKWHQttwcOpY9cRFyTqeGruvBMUjwQOUuDl2aC0qddAhvRM
	CFN0ieJEYXrOH2/o+/ihu0bPjueIjbAQbWQCDkA==
X-Google-Smtp-Source: AGHT+IE841pjxIKVha/+JpcEn2ee0Lx4ty464a7C8jVO8vOObnE+8Yr/dOWMzAzJZ++Do5wiVDiWTFPS1iajgW2vevE=
X-Received: by 2002:a05:690c:67c7:b0:6dd:bcfd:f168 with SMTP id
 00721157ae682-6e21d833475mr25994197b3.18.1727272938607; Wed, 25 Sep 2024
 07:02:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240826081900.2284-1-liulei.rjpt@vivo.com>
In-Reply-To: <20240826081900.2284-1-liulei.rjpt@vivo.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 25 Sep 2024 16:01:41 +0200
Message-ID: <CAPDyKFqJAwr7S9nMywnEica77+UeT9pbbcZ05g7+xmT_1Xtd7Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] usb drivers use devm_clk_get_enabled() helpers
To: Lei Liu <liulei.rjpt@vivo.com>
Cc: Neal Liu <neal_liu@aspeedtech.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Bin Liu <b-liu@ti.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-aspeed@lists.ozlabs.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, opensource.kernel@vivo.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Aug 2024 at 10:19, Lei Liu <liulei.rjpt@vivo.com> wrote:
>
> The devm_clk_get_enabled() helpers:
>     - call devm_clk_get()
>     - call clk_prepare_enable() and register what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
>
> This simplifies the code and avoids calls to clk_disable_unprepare().

As I stated on another thread too [1], using devm_clk_get_enabled()
isn't solely a nice cleanup of the code. It may actually introduce a
change in behaviour. Therefore, I would not recommend applying that
kind of changes, unless some of the maintainers acks it or it gets
tested on real HW.

Kind regards
Uffe

[1]
https://lore.kernel.org/all/20240827074857.2671808-1-xirui.zhang@vivo.com/

>
> ---
> version 3 changes
> Fix the email thread.
>
> ---
> version 2 changes
>
> The files ux500.c, mpfs.c, and pxa27x_udc.c have incorrect usage of
> certain interfaces due to the lack of synchronization during the
> commit updates. These issues have been corrected in the v1 version.
>
> 1.ux500: Incorrect usage of clk_prepare_enable() should be corrected to
>   devm_clk_get_enabled().
> 2.mpfs: Incorrect usage of devm_clk_get_enable() should be corrected to
>   devm_clk_get_enabled().
> 3.pxa27x_udc: Incorrect usage of clk_prepare_enable() should be
>   corrected to devm_clk_get_enabled().
>
> Lei Liu (5):
>   usb: aspeed_udc: Use devm_clk_get_enabled() helpers
>   usb: pxa27x_udc: Use devm_clk_get_enabled() helpers
>   usb: r8a66597-udc: Use devm_clk_get_enabled() helpers
>   usb: mpfs: Use devm_clk_get_enabled() helpers
>   sb: ux500: Use devm_clk_get_enabled() helpers
>
>  drivers/usb/gadget/udc/aspeed_udc.c   |  9 +--------
>  drivers/usb/gadget/udc/pxa27x_udc.c   |  6 +-----
>  drivers/usb/gadget/udc/r8a66597-udc.c | 16 ++++------------
>  drivers/usb/musb/mpfs.c               | 22 ++++++----------------
>  drivers/usb/musb/ux500.c              | 18 ++++--------------
>  5 files changed, 16 insertions(+), 55 deletions(-)
>
> --
> 2.34.1
>
>

