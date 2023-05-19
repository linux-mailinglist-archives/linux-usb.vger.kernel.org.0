Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC0B6709102
	for <lists+linux-usb@lfdr.de>; Fri, 19 May 2023 09:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231553AbjESHvj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 19 May 2023 03:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231552AbjESHvQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 May 2023 03:51:16 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7686210FC
        for <linux-usb@vger.kernel.org>; Fri, 19 May 2023 00:50:26 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-561afe72a73so40111377b3.0
        for <linux-usb@vger.kernel.org>; Fri, 19 May 2023 00:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684482276; x=1687074276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o9eCjR4wA5ZTBtiDxQkBdiELVfdZhFqijpbIt+hbbDo=;
        b=hEY4D6DOkN6sDvUna6L5v7YAx9RiP+olxmZG+HKbHCnan/V1F+C7YQSrzem692oC+i
         TdDHWvwlTERZJX0W7Ukspo6g0oG0Wbv44+7UXdiCNvxoANB4KJRFmzkYrVyRX0/usHAp
         GsonboB2uDyQ3T9zPPB4yXHhI4JifZsiD8tbB4QaMoesOveZmL/tysvugXfrt7DcrRp6
         IXmX43JoKJuui8jYcXdsTq5Tex4Vd+gJhZ7TVA4xu9T0VdFITls9Nmncqhxzs/s0N3et
         WJiJnBD2HQ0XYJp9k48WS0sGHTWMrTFBI64hJIrqepLWW+SqQkuSAwcHQAd74XuXUrN8
         gvPw==
X-Gm-Message-State: AC+VfDyjHHhH4udy3g7KRT//pkFTorfvFG384i/erO2pbgxUXo3dnBeh
        YRRWFcB2D3AHeZtJLK+z4aIunns2iulxWA==
X-Google-Smtp-Source: ACHHUZ4pwVmrl5AidN6zbuLptyCbn+Jp0eITK71dr4zhwtwy7HcRlwyifG0s/PVAqDkVS+juotn3Kg==
X-Received: by 2002:a0d:d4c7:0:b0:561:bc1d:9a95 with SMTP id w190-20020a0dd4c7000000b00561bc1d9a95mr1105858ywd.37.1684482276536;
        Fri, 19 May 2023 00:44:36 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id q7-20020a0de707000000b0054fdb1dad0fsm995062ywe.43.2023.05.19.00.44.33
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 00:44:34 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-ba81ded8d3eso4265499276.3
        for <linux-usb@vger.kernel.org>; Fri, 19 May 2023 00:44:33 -0700 (PDT)
X-Received: by 2002:a25:cf51:0:b0:ba7:473e:9ecf with SMTP id
 f78-20020a25cf51000000b00ba7473e9ecfmr731505ybg.64.1684482273306; Fri, 19 May
 2023 00:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de> <20230517230239.187727-40-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230517230239.187727-40-u.kleine-koenig@pengutronix.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 19 May 2023 09:44:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU=yZd3E4Ogbur5zd+CH0h9XfMpwNC0PiO4vx+1ViitLw@mail.gmail.com>
Message-ID: <CAMuHMdU=yZd3E4Ogbur5zd+CH0h9XfMpwNC0PiO4vx+1ViitLw@mail.gmail.com>
Subject: Re: [PATCH 39/97] usb: gadget/renesas_usb3: Convert to platform
 remove callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Zheng Wang <zyytlz.wz@163.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-usb@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 18, 2023 at 1:02 AM Uwe Kleine-König
<u.kleine-koenig@pengutronix.de> wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart from
> emitting a warning) and this typically results in resource leaks. To improve
> here there is a quest to make the remove callback return void. In the first
> step of this quest all drivers are converted to .remove_new() which already
> returns void. Eventually after all drivers are converted, .remove_new() is
> renamed to .remove().
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
