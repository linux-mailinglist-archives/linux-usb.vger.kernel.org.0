Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04E956C04DD
	for <lists+linux-usb@lfdr.de>; Sun, 19 Mar 2023 21:44:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbjCSUoH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Mar 2023 16:44:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbjCSUoH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Mar 2023 16:44:07 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FFCB13DFD
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 13:44:06 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5416698e889so192093457b3.2
        for <linux-usb@vger.kernel.org>; Sun, 19 Mar 2023 13:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679258645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cf24yEFVehDqGkp+eaxYHmE8JzN6YGso0CVOmkr/CAY=;
        b=QwHm8ow3/dpANyG2FXORD2WSi/y91BYu55cCrjw9b+EfzVQfvZHyHEWzBX/24KW2bX
         /pX1pIi6WtuudsK1G/BRepACITE57zva8Q2+qaR2O2xgNp2SDjGx/15p85pLuTsAVcP+
         dnUB3/hisI+uA4mcagq5YyfwVZ3Iw07rG4teM7qBPZIIyQfMwxsHq5f8F0N35qohV1oH
         vd0RR/oFF6CH0NKxPKr/bWMb3n2lYqogP1j02FvWgN22jZzhYxI2Evp7ePvzhp0W/8Zd
         nGC0ZGU/2UosShYhHcGTgzXmJckeDGAsdusmrwQLn9xy9UPrF2YuCz/u+eXEpLd6wkwC
         Hutw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679258645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cf24yEFVehDqGkp+eaxYHmE8JzN6YGso0CVOmkr/CAY=;
        b=6G6rej02QQSeML86QnlKH5T1mLswKVQeOvk2Lpqjr7FY89fKK1lfj6QCT9gz4gFsRM
         BYvSix9ZE/94KoFQ1Is/rBK4mKBENE3ZnashsPPrOch6Te4vnAlof0afnypzt1ldrjPZ
         TcQaEsX7qzDU/3Q6vO4kTyne6/F9m6Crp5PepkeH+HbQREcEf7BJ2ssSyx7LjbA72XSH
         fZevbB0BskUPGZSsaQoZ8Il9XnRf1JMhLLfyVQxvD4mvniwoOqifYUf2EtRxCTwjEbAc
         JUfxr4AWVEgSbzTx0yNzyXadBol/ATdgDq4aLLpp1XWfqpnjQXXJDdK7L1B6tFFHJrq7
         xuzg==
X-Gm-Message-State: AO0yUKVNoczWaBxvxP+1vdxvC6HDuOIqPoBdcCr6iqOPqEdPU69PnnaX
        koO5Zre8qkJbMGvC42Nr+ERMqqwcJCgkf7EL0n9HRp4TaoX4b4lS
X-Google-Smtp-Source: AK7set9r5wYze6RXTe0mkjYB5lqovpffDs8c0YJy6ORrWv4iJTzIoLxOIlrO2WXSacislmYCW91Sctt67Jj9hsaLGg8=
X-Received: by 2002:a81:e205:0:b0:52a:9f66:80c6 with SMTP id
 p5-20020a81e205000000b0052a9f6680c6mr8210789ywl.9.1679258645340; Sun, 19 Mar
 2023 13:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230319092428.283054-1-u.kleine-koenig@pengutronix.de> <20230319092428.283054-6-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230319092428.283054-6-u.kleine-koenig@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 19 Mar 2023 21:43:54 +0100
Message-ID: <CACRpkdYcWhcR+ZePotgdwM2BmT5V1xKJm8xj4jBZvJAXvyZoWQ@mail.gmail.com>
Subject: Re: [PATCH 05/11] usb: phy: gpio-vbus: Convert to platform remove
 callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Mar 19, 2023 at 10:24=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
