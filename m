Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDF82AE807
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2019 12:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390539AbfIJKZj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Sep 2019 06:25:39 -0400
Received: from mail-lf1-f54.google.com ([209.85.167.54]:43194 "EHLO
        mail-lf1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729700AbfIJKZi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Sep 2019 06:25:38 -0400
Received: by mail-lf1-f54.google.com with SMTP id q27so12978284lfo.10
        for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2019 03:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=86PBgefI/y6X/Isd1n0htxpzll5TC6xu2rYWUoOg2+E=;
        b=ExqvI2xn9CJJpk4iCHBRebb8Z9iziuTPjPohh4nkXLq31YjmvLjecF8HaVD1b03Zwp
         BmLmeDpN/7+qkAbxeUzkffB2MRHqZfH+tOLHexeSWoxHaJNeMuv8HNdAPCnRcb1gZ/5a
         f5eHP58LUGy/385RwTvXwD+XwN0OPXFjOn9ytYD85Uxsc7OrZFqdclb8T7ch5gygoH86
         HaDeRzxgs4jW/Ig38MwZfRMFk3u/jWISZNWTwHDxy3wXACxguMRTIbjlki94IlZtP/0E
         /1te8vF5EdgDwHXV17XE18Q1yzV6xbuCWx62fuAhxy9QTlELMJa2cbelEUrW1X6KWzdp
         9DEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=86PBgefI/y6X/Isd1n0htxpzll5TC6xu2rYWUoOg2+E=;
        b=kvPKzeMlrtYgHCCvyp4y9pg/MElKijODuJ4ezsy2WfiE7WM4XQ91wQqNnWuBaaQlkF
         vCsF8nMgjKnJdBttYFQc52Gbbs1OaZRiy66ZwEcN58JTHdutHA/suVaRMeA72CEzn8BY
         jruHM24EajTm5rdQi/AEdU3uXoc8ayLJnbmdmrL+RQI37WObKj2g5FodBahQCLXpkPeQ
         iRf4Dgs0nzqE+U5y0+Qbe6zB9M0HBdUtyfqstXSkBW3nYzG+o4h3E62RD4KSPYv7vjxv
         SUlKxbz+OXpngXGxijQ3m5A42A09kHmsHj7jROnszBc6zuUazA6XafOY7Rl3XggdglxK
         gN+g==
X-Gm-Message-State: APjAAAXpHZEHxqdV7XLf/6x3q6n/LD2TyHkWm7sK+bO3P99k03ypCTTT
        waq7UFALr2AAX4EHXx5qYwUlnih+E+MsnlR3w91mjQ==
X-Google-Smtp-Source: APXvYqxzAgxWmnCAlWjLbJSC2xDUVMd1qjJIhYHnDdxKGJ4zV+g693y3TgzFL0iinVPQnVMmNKjBkeRooOIaDrac4HQ=
X-Received: by 2002:ac2:5c11:: with SMTP id r17mr20173197lfp.61.1568111136928;
 Tue, 10 Sep 2019 03:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190908085133.GA7233@amd>
In-Reply-To: <20190908085133.GA7233@amd>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Sep 2019 11:25:25 +0100
Message-ID: <CACRpkdYuaoc=0Ljn+xM8nqdo16-5tfS0=N5VeAnM6Lx0FME4Jg@mail.gmail.com>
Subject: Re: next-20190904: build failure in cp210x usb serial, gpio related?
To:     Pavel Machek <pavel@denx.de>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Sep 8, 2019 at 9:51 AM Pavel Machek <pavel@denx.de> wrote:

> I'm getting this compiling the -next:
(...)
>   ./include/linux/gpio/driver.h:722:19: error: static declaration of
>   =E2=80=98gpiochip_lock_as_irq=E2=80=99 follows non-static declaration
>     722 | static inline int gpiochip_lock_as_irq(struct gpio_chip
>   *chip,

Yes this was fixed pretty much the same day the next release came
out, and by now I got like 4 different patches solving the same problem,
because no new next releases are coming out right now...
bad timing with no next releases during the kernel summit, sorry!

Yours,
Linus Walleij
