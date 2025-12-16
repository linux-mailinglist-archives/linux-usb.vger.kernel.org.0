Return-Path: <linux-usb+bounces-31493-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0E7CC4741
	for <lists+linux-usb@lfdr.de>; Tue, 16 Dec 2025 17:55:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B6466300AC59
	for <lists+linux-usb@lfdr.de>; Tue, 16 Dec 2025 16:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 907E923BF9B;
	Tue, 16 Dec 2025 16:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="p2nctEGS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47FF254849
	for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 16:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765904110; cv=none; b=n/C9l/rdfp2jvmgDF+s2KHwA+ddhX/bqP5iQOWseEFwxqVCu/PzKAdgiiJB9aKit7a6Q020u67iBJ8EzunMdGYyYdQDDtOA4KiZ8G/rd0+gIM/lIY1xsByC2PJ+KNhAjPU6fz75YPxi5DZLdODh8tlKyGl/c7SKwKA/x94A5jRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765904110; c=relaxed/simple;
	bh=UN+I8vzJ8cwqizu/csjxQGAMQDSJQX7rflsi34zqodk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K+wWAXSfDpv9lT0J0GkwkgLgmP4KUT271b9uagCcYM8TjPufBOZIW9535ZXFgjDGLDnrLJ4kP/booRVf5uJ18lxGxR1+Eye7/ezdepIdQsc1dIo7yCDUTybfYv06x5GXSkya22vJFeMvT61roa+SNtAeOxRDSCYyV165+rBayE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=p2nctEGS; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64198771a9bso6811963a12.2
        for <linux-usb@vger.kernel.org>; Tue, 16 Dec 2025 08:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765904106; x=1766508906; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UN+I8vzJ8cwqizu/csjxQGAMQDSJQX7rflsi34zqodk=;
        b=p2nctEGSNrBNH4w0gv/yBfai7zSBJT37Uc/6sCOChec1JnUq/nw1WTcH4vymi0Gysn
         AroI/pZ8T3uPg5QkGXajLuB2WTjrAnztoLvBwRjqyRxmsBdcDCAW7YCLK+qAy3YVpRm5
         0jIkBfTX0ws4dfu2mNth8gjTjWhMx2EZQOKy6QhhKNirbkDGS7qdWp8SyOJJBY5ST3/z
         gC/oZXzU3ZyGWPCk/JG9jpo9Vkqgmrtj44yEOluChgE7zG0ptlixUvmEO84b9YPhYhTg
         blywLMj7i/cbZeihiF4uHL5VtC3JYGC1MiBUPlqXRuBI1Jo8lJ3VlO+hLQD3TfNz6+g/
         TiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765904106; x=1766508906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UN+I8vzJ8cwqizu/csjxQGAMQDSJQX7rflsi34zqodk=;
        b=KuN97kuPHnWoR2LdYWdI/iwlIHqRwm2xr1VJgx/GjpW+RRBzDnLo1kGZiTq3OLycQG
         vO26GFxXjwQ5VOPcn24fdskmdjRqnYfdx//nZ/ci85fnR3l8FvqV+Yu/4P2icmbtAG8q
         zfruSzwrOBWOv2+iEcYUK5r1VXm6YOHHp8/87Il+MhgQAIP8FPGuAkST0zxxedF3Wzug
         +cKjn9nOMh4YqtQMwqqTCswQe/e5jvZ6i2yg2ejjXxNmM+ivGGlqa+KYfDb3w5phXEkp
         yPOUprrPQ3w005WQ+CQV2CmNufbJ3xiNNoVju2r95/8H+HnEMUFbzW0dlJMLd/UPqH3x
         ZVMw==
X-Forwarded-Encrypted: i=1; AJvYcCX9L20cPW+R+lxxcoAkSsQ+fQrkv3112oj0qRLkQXk2WA6TR4ehNdrg2yPBePbGhx0pO54fa9N9KWo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyipzbisRgFTB1J6eC6FlNmHQd1hgh3xwkbucf74ucsQ5zokzVU
	S756hDOZVGqNgLvIt7aJgFwT86EzP6W4Usa7RX3zG1lyx6XG91itCMjnKLNB3FyIqCNoJMsZL3O
	IT+3OADsFoBgDqhuUcQE+70mJKIYh2ko2FDynVSvfDw==
X-Gm-Gg: AY/fxX7b2Q0dd8RqTwsz9bgV/+DzPjO+bm346T/bhwfon0wDPLMD/3whmPwDxWoFk8C
	x2lfkUuTH58tpY/gcABIQWY2u05p8hpwyq/LBagOkpnUY6/tBq5ZaRnWg1Y55LjdER98Thsdj7I
	kvOSPmjlYOdNB1QNJp6g2uhToX7vcBp8XCOqFuKlYWaE+EpWT8HN2/dcL5HFD6NUN6H3n8uceNZ
	E33arbklHonY4czNMeuvvvIGLLaRS0BthfRD5dCt19ybSLFFcwyzsi+3zSl2kTjyQpuKLJ9
X-Google-Smtp-Source: AGHT+IHss9Bd1xLNKBKVvo2auf8JouoGjNJ+pij6L9GBIFkYaw2yQJkBsu5mTJ8ApxjlWW3ipaEa8krFjlxvR+te8cI=
X-Received: by 2002:a05:6402:430c:b0:64b:3a8d:8f2f with SMTP id
 4fb4d7f45d1cf-64b3a8d8f4amr1282460a12.8.1765904105940; Tue, 16 Dec 2025
 08:55:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-4-robert.marko@sartura.hr> <39d5371a-ed3e-4262-9cc9-e76c039f352c@kernel.org>
In-Reply-To: <39d5371a-ed3e-4262-9cc9-e76c039f352c@kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 16 Dec 2025 17:54:55 +0100
X-Gm-Features: AQt7F2pB7VocjSO0euYm2JMWHk2AXNZHaLhwttYBwdz_DAq0CW2nlyHeH65guEQ
Message-ID: <CA+HBbNEsXG64L26S-78A4E9dUOnfdtTEQoifiv5Y16_oQeiiHw@mail.gmail.com>
Subject: Re: [PATCH v2 04/19] dt-bindings: arm: move AT91 to generic Microchip binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, Steen.Hegelund@microchip.com, 
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, 
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org, 
	linux@roeck-us.net, andi.shyti@kernel.org, lee@kernel.org, 
	andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, linusw@kernel.org, olivia@selenic.com, 
	radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, richardcochran@gmail.com, wsa+renesas@sang-engineering.com, 
	romain.sioen@microchip.com, Ryan.Wanner@microchip.com, 
	lars.povlsen@microchip.com, tudor.ambarus@linaro.org, 
	charan.pedumuru@microchip.com, kavyasree.kotagiri@microchip.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-clk@vger.kernel.org, mwalle@kernel.org, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 4:56=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 15/12/2025 17:35, Robert Marko wrote:
> > Create a new binding file named microchip.yaml, to which all Microchip
> > based devices will be moved to.
> >
> > Start by moving AT91, next will be SparX-5.
>
>
> I don't understand why. Previous layout was correct.

Hi Krzysztof,

In v1, I sent the LAN969x series as a separate binding, but Conor then
requested that
they should be merged into a generic binding, and LAN969x added to the
generic binding [1].

[1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20251203122=
313.1287950-2-robert.marko@sartura.hr/

Regards,
Robert

>
> Best regards,
> Krzysztof



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

