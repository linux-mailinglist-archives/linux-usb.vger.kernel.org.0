Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30354746CE6
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jul 2023 11:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230493AbjGDJIy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Jul 2023 05:08:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230161AbjGDJIy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Jul 2023 05:08:54 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C304B6
        for <linux-usb@vger.kernel.org>; Tue,  4 Jul 2023 02:08:53 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-c581c758ad8so1552082276.1
        for <linux-usb@vger.kernel.org>; Tue, 04 Jul 2023 02:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688461732; x=1691053732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GdaHmnlsV8S6Cig719VwA16gJQYVyJKz/YSsgg7mS0=;
        b=q4uA38keofPHO2TUVFek3LJkw2yMGrDyEfrbrAiLFLSARwYr6g6ZFsvWZkWNrL7rYZ
         p4MR/teWbictMYdRW2MNHqaSvEndKH7//CF27YKVWrbDgrgbHuENYlG37EHzRXU7MUj8
         CNJn08RAGoXKutpYp7T5MVaMwgQdZUCZztm4SPRvAPtlF7zU4ZMvPycd+2FljeAU9ARn
         B51AlnuT+f6Op0P24zbC7K6PxFr2kgCKSXnrztegwXu0xaygRGM9owxLNMH/UVS2yCjg
         ljPC25M4HGHxo9Yo6cwoXKqj0SVG3CIAZbigTJwGICRyzVAWDEmbwGtMvr6y/7l08ctd
         9PKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688461732; x=1691053732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6GdaHmnlsV8S6Cig719VwA16gJQYVyJKz/YSsgg7mS0=;
        b=RlLh5Qnsq/S8ehzWqBkCc8HZMB8d/IsWvyQfrTYNHg2rvDz1HndXNrlOReCmi4lw+W
         H5mTb/Tzi9L2J1B/nNK38c8YxjCCnPvmMjV+f3bVPTnAKeRIuqg3hg92azq2mi4Y9bOb
         5Tmm1NcI4qH0mgc7UeqEhB2ijG46G1N036jcuodm7olSJCBwpmmLZAAtITaXOXBCWPd6
         aXmUaQ/wG76tx1x/KoTxgul+UgydN5STVjYYXDwozfUP7lrQ8tHXp0qIGod3dNxK6C41
         Sc9V6sARu/5AIJAn5BbxmR6ttAjIqusCajZtiVMh5g0t7hqUZj+VyTARQ+B+VUw1bS7+
         xKBw==
X-Gm-Message-State: ABy/qLY6J/FAR1SJzxYqkhprp3aVry3Cqf/fVm8sdG9gfhftwzetv6dD
        wjV8Hx6tHpFqU0POXk6G4hjqLablFDFC9/RpXNP1EQ==
X-Google-Smtp-Source: APBJJlEYeHaQF+mTMHQltwbXWZ0etgHbEPYw7SB4rbAC1Fsm/EntK2zNDR/B5ka7AH25VOtwQkIlURWWnXQaAR0ZADc=
X-Received: by 2002:a25:cf55:0:b0:c5c:66db:56c4 with SMTP id
 f82-20020a25cf55000000b00c5c66db56c4mr1499236ybg.21.1688461732510; Tue, 04
 Jul 2023 02:08:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230703121936.71623-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230703121936.71623-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 4 Jul 2023 11:08:41 +0200
Message-ID: <CACRpkdbySh+XFUDnFWUQHULYag0hukJ_ogfSREPLvs1iV=YmwQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] usb: musb: Use read_poll_timeout()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bin Liu <b-liu@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 3, 2023 at 2:19=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Use read_poll_timeout() instead of open coding it.
> In the same time, fix the typo in the error message.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
(...)
> +       ret =3D read_poll_timeout(gpiod_get_value, reg, !reg, 1000, 10000=
0, true,
> +                               glue->intpin);

Wow that's really cool. I had no idea that you could use read_poll_timeout(=
)
together with gpiod_get_value() like this!

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
