Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B129482775
	for <lists+linux-usb@lfdr.de>; Sat,  1 Jan 2022 13:05:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232355AbiAAMFs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 Jan 2022 07:05:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232358AbiAAMFq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 1 Jan 2022 07:05:46 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7038C06173F
        for <linux-usb@vger.kernel.org>; Sat,  1 Jan 2022 04:05:45 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id w24so21740204ply.12
        for <linux-usb@vger.kernel.org>; Sat, 01 Jan 2022 04:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=dhFaFNGf9P/hgzfpigNOAcNefTeR7Csml9+Bh/hdy/w=;
        b=aPFCJjmmH4jORuVazNvTAmuM3SzgWIIPSLzOJw3tjt1mp7njN4ixG3I8w7qFmi0OUZ
         q7qGG3PVK99yRABvjBlFQ7KV31uVqjONYFty6Mojh9Y8OUagM/k1iz4scpM7RnNeWrTi
         CwVIL2BD7WwZrTGKfb/z3m15rAPOUbHNjOD3GfikzkxgZhWAIg8wMPrHXYGOtOwnorVA
         tD/8o7Xa258T6VHwIzmR+B26HJoAYpXPZrsrrUxxo9XfUvpHXQKwmtY3uy3NuiWnacY+
         zu/BWoS5gDfZFNHVQ6AdL1fLZbs/fNSYZB9FXV0WNgLRoujMyIdbtrC6OExOpSYiJF5N
         0kMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=dhFaFNGf9P/hgzfpigNOAcNefTeR7Csml9+Bh/hdy/w=;
        b=kOIV0HF1YM0K+NDS+bok2o6IjXVyiJ94DIZsviKGRbCGzuxD6KIlmxFBjBc1DehpER
         R0ZJSZB569CQz5+HlfEtq8CL1vK1ZRjIBQVuoW0ocZDpWtWX7OyaEuCfVJg1p7Z5wJFu
         4i5LyaAPYmcmdLw9HIymg8QGv+MpD38TelP2v8HGUFdA48OwH9GwVP97KZiiAQv76f5/
         2ePWz0FDfLO7V+pXIjBRn4uvX88Cfi1NzTsrqCyoiATnUqIR5OMerPED+fnVOk0/bGW/
         FtCfQqU35j39cNlLC3oX7Vph/5X0cUMjfv1PPalboJaitDbTa6gGRn2ScUfXjoH2HUML
         m3Og==
X-Gm-Message-State: AOAM533QVrGMY/pGnS8KWY2gWikUN25W8IUYiBCriK5E8A1jKvelguUS
        cXD5tg3kWRpdCVVNWEEyJvY=
X-Google-Smtp-Source: ABdhPJy3JcPfwyn4I4+THRZvqk1mIndY8hnH55si8kHBeaZd443Qr7WNa88MF0hu7Xz3/GJhTSFZbQ==
X-Received: by 2002:a17:902:c94d:b0:149:16cb:22e1 with SMTP id i13-20020a170902c94d00b0014916cb22e1mr38407558pla.34.1641038745354;
        Sat, 01 Jan 2022 04:05:45 -0800 (PST)
Received: from [192.168.0.153] ([143.244.48.136])
        by smtp.gmail.com with ESMTPSA id kb1sm33652672pjb.45.2022.01.01.04.05.35
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Jan 2022 04:05:43 -0800 (PST)
Message-ID: <61d04397.1c69fb81.e9f32.a168@mx.google.com>
From:   yalaiibrahim818@gmail.com
X-Google-Original-From: suport.prilend@gmail.com
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: RE:
To:     Recipients <suport.prilend@gmail.com>
Date:   Sat, 01 Jan 2022 14:05:26 +0200
Reply-To: andres.stemmet1@gmail.com
X-Mailer: TurboMailer 2
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I want to confide in you to finalize this transaction of mutual benefits. I=
t may seem strange to you, but it is real. This is a transaction that has n=
o risk at all, due process shall be followed and it shall be carried out un=
der the ambit of the financial laws. Being the Chief Financial Officer, BP =
Plc. I want to trust and put in your care Eighteen Million British Pounds S=
terling, The funds were acquired from an over-invoiced payment from a past =
contract executed in one of my departments. I can't successfully achieve th=
is transaction without presenting you as foreign contractor who will provid=
e a bank account to receive the funds.

Documentation for the claim of the funds will be legally processed and docu=
mented, so I will need your full cooperation on this matter for our mutual =
benefits. We will discuss details if you are interested to work with me to =
secure this funds. I will appreciate your prompt response in every bit of o=
ur communication. Stay Blessed and Stay Safe.

Best Regards


Tel: +44 7537 185910
Andres  Stemmet
Email: andres.stemmet1@gmail.com  =

Chief financial officer
BP Petroleum p.l.c.

                                                                           =
                        Copyright =A9 1996-2021

