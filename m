Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5376F9823C
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2019 20:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728036AbfHUSCP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Aug 2019 14:02:15 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33801 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728008AbfHUSCP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Aug 2019 14:02:15 -0400
Received: by mail-pg1-f196.google.com with SMTP id n9so1764789pgc.1
        for <linux-usb@vger.kernel.org>; Wed, 21 Aug 2019 11:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=ubzr14D/m7NN4Gig+J49yEfObSCnRlFHpZMQCxBRrVE=;
        b=Rv35xrv1gcfayU9R+qpmA5rQGMwtfLgnRrLjmQlH51d9QkX0YDczI+50P0E1BoCsNr
         HXcgtPIvxKBSh9TZjiFurL+mwdWWx6RUI/yCQOaPlsFZ4yMkzqpaoRVEQcMeZk+qlGgI
         hRYTF+OmFOX22XlupG67mIr/N5Orwjlc3P5piwe45L2/wNqoXyFFu257j8F/TtFUm1EV
         qMKbbxF0xBV39nThclx3/qg+0roqn8ekes/qhsJMELrev+j0UtLh+Xu3tgMRwyk8ewle
         I+hr4KQ6nWsyHa5+3d4j9zi2TSDc8DN/sG0HkR3u0Kp3jZL10YcL3s5QRdgao2SZpWN8
         GDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=ubzr14D/m7NN4Gig+J49yEfObSCnRlFHpZMQCxBRrVE=;
        b=bfW5WRxJnlvX29xvbsKYy0PrnveANVkM9Kc1ChEuT11lSk31iU5IiIrt41E7DwZj/u
         EbirSv55oWaFa21oQcF/juy8Pqyd5c3JaVOe9XyBJNEOWn+cZgDG7rdn/Z3b1upcMvdb
         3e/Fg/JQHbNxIiLrVsl73O87CQ4G8B0yIfvSnm/0fhsvsU1MJMx1LLXg/aNgaYgaVnyN
         qk1FmgkAenMJyOWmMnporX8pA7hKYDw4ort3J2zGMyYuNo6CIKCnFkanHEJh6/YL10Dk
         0BI1Dz40BjqxI1kplJH41IQILhdoWsF+IbSzYTM3Sx4V/7AeKXEalFTY6g0wSUdAz59y
         DvEA==
X-Gm-Message-State: APjAAAXOnz5s8dmWgjWOg5dkKCnpIaBmQrrbC9VGmgGa/iRdKdVyTvBi
        /uaVTm3NCWl2Gn5j/3VSKwmPMQ==
X-Google-Smtp-Source: APXvYqzlmjNDEJBXLF4y15j0jF5pl7SHAfLJmB9j2o+pnjNpIbZCoiTyxhWaFefXMOPZ/JAxPpq7qQ==
X-Received: by 2002:aa7:8c57:: with SMTP id e23mr26690422pfd.48.1566410534247;
        Wed, 21 Aug 2019 11:02:14 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id y16sm35101574pfc.36.2019.08.21.11.02.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Aug 2019 11:02:13 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>, balbi@kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: meson-g12a: fix suspend resume regulator unbalanced disables
In-Reply-To: <20190821133518.9671-1-narmstrong@baylibre.com>
References: <20190821133518.9671-1-narmstrong@baylibre.com>
Date:   Wed, 21 Aug 2019 11:02:12 -0700
Message-ID: <7h7e76bdnf.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> When going in suspend, in Device mode, then resuming back leads
> to the following:
>
> unbalanced disables for USB_PWR_EN
> WARNING: CPU: 0 PID: 163 at ../drivers/regulator/core.c:2590 _regulator_disable+0x104/0x180
> Hardware name: Amlogic Meson G12A U200 Development Board (DT)
> [...]
> pc : _regulator_disable+0x104/0x180
> lr : _regulator_disable+0x104/0x180
> [...]
> Call trace:
>  _regulator_disable+0x104/0x180
>  regulator_disable+0x40/0x78
>  dwc3_meson_g12a_otg_mode_set+0x84/0xb0
>  dwc3_meson_g12a_irq_thread+0x58/0xb8
>  irq_thread_fn+0x28/0x80
>  irq_thread+0x118/0x1b8
>  kthread+0xf4/0x120
>  ret_from_fork+0x10/0x18
>
> This disables the regulator if enabled on suspend, and the reverse on
> resume.
>
> Fixes: c99993376f72 ("usb: dwc3: Add Amlogic G12A DWC3 glue")
> Reported-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Tested-by: Kevin Hilman <khilman@baylibre.com>
