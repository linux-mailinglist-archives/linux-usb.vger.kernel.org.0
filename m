Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCF9D2E6E6
	for <lists+linux-usb@lfdr.de>; Wed, 29 May 2019 23:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbfE2VBC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 May 2019 17:01:02 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:33297 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbfE2VBA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 May 2019 17:01:00 -0400
Received: by mail-vs1-f66.google.com with SMTP id y6so2991902vsb.0
        for <linux-usb@vger.kernel.org>; Wed, 29 May 2019 14:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tBUjmO48wu/hXLqovuR/vBZEzCJTLpXLZDjTGDnkOW0=;
        b=MYnV6jPu3a4BZPAh5FXxalqN3ma14VPcQRvqY79POudpgHYhgJbyDkql8QqTIWTnNa
         Ha96YuKY1DB0lO7JRbCKXd4dCUgk2VlapjcA+t7crTi3f995C9ZFomGjGZaLctZNMu1k
         F5yQ+2gRo1ViDm7xJoYEYJTlzdj79aYtkhiRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tBUjmO48wu/hXLqovuR/vBZEzCJTLpXLZDjTGDnkOW0=;
        b=Dts8IiIJ8A0pWmG38lDQjFYJsFaa9lLLPyP/ESpsGeti3URKXoVN3xLB1/DqChawIk
         /zWM5Fu2RoHJqtGKwuKuZ8fEv1IKR9/K6g3kMNSs2o/6mgIosjEiYrUGVsDJVPYPujtA
         /BWiByPNQlEdoDxYcyMQG1q1e+Z92ZX0WWuH6bZmJOLUDIn7tug3npOsOX44qtDCB58c
         RJWgDAE7mdKld4MfGxwfCI5WuMudt5Qm+OzLlFWdKAXA5mVaV17SPvWEm8hge1t7283k
         /uvQ/mDvrkEl2Udw26jKskdQo4z0XJb3Zl6ARVBhZxH9SlIjPdvVqeawCPRBW6lBxwCf
         2zcQ==
X-Gm-Message-State: APjAAAU+jJLXfuGCV8oVwi6NbvWNw4sj1xCZBxWfix88xNazyY0Vlv7p
        o7rdiDjUA9FXrhOMGiqqrPH0DJwIBwI=
X-Google-Smtp-Source: APXvYqyXq3HKdUybDZSqkdOZ3Yn6xwmuowW4ahJOgzuPMvG/vimq6bb43eWkqLzWOXBwLDDAFjLsUg==
X-Received: by 2002:a67:ef99:: with SMTP id r25mr76435546vsp.101.1559163659425;
        Wed, 29 May 2019 14:00:59 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id k70sm286098vke.20.2019.05.29.14.00.53
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 14:00:56 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id p24so311492vki.5
        for <linux-usb@vger.kernel.org>; Wed, 29 May 2019 14:00:53 -0700 (PDT)
X-Received: by 2002:a1f:3692:: with SMTP id d140mr30303598vka.70.1559163653164;
 Wed, 29 May 2019 14:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <1559163283-2429-1-git-send-email-linux@roeck-us.net>
In-Reply-To: <1559163283-2429-1-git-send-email-linux@roeck-us.net>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 29 May 2019 14:00:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WaWf51QTzPAv68e8m-WZ287E63M_y2G=dVmowh91p9jg@mail.gmail.com>
Message-ID: <CAD=FV=WaWf51QTzPAv68e8m-WZ287E63M_y2G=dVmowh91p9jg@mail.gmail.com>
Subject: Re: [PATCH] Revert "usb: dwc2: host: Setting qtd to NULL after
 freeing it"
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Minas Harutyunyan <hminas@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Vardan Mikayelyan <mvardan@synopsys.com>,
        John Youn <johnyoun@synopsys.com>,
        Douglas Anderson <dianders@chromiun.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Wed, May 29, 2019 at 1:54 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> This reverts commit b0d659022e5c96ee5c4bd62d22d3da2d66de306b.
>
> The reverted commit does nothing but adding two unnecessary lines
> of code.  It sets a local variable to NULL in two functions, but
> that variable is not used anywhere in the rest of those functions.
> This is just confusing, so let's remove it.
>
> Cc: Vardan Mikayelyan <mvardan@synopsys.com>
> Cc: John Youn <johnyoun@synopsys.com>
> Cc: Douglas Anderson <dianders@chromiun.org>
> Cc: Felipe Balbi <felipe.balbi@linux.intel.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/usb/dwc2/hcd.c | 1 -
>  drivers/usb/dwc2/hcd.h | 1 -
>  2 files changed, 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
