Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 210D4569446
	for <lists+linux-usb@lfdr.de>; Wed,  6 Jul 2022 23:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231872AbiGFVYc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Jul 2022 17:24:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233809AbiGFVYa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Jul 2022 17:24:30 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C69D4186FF
        for <linux-usb@vger.kernel.org>; Wed,  6 Jul 2022 14:24:28 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id u15so4777164ejx.9
        for <linux-usb@vger.kernel.org>; Wed, 06 Jul 2022 14:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+IXn0jI0ldRL7YIjp8QrMhyxAPtVIFHuatfuckvUqnQ=;
        b=fQNvjxAJ1U+/Z5BLvLosjiWEbNpCZr4z3sBkgnVLosoYyjz5Kec9u9Kf+o2d4q/jrl
         zJwnBFX/aQaqwYhjaVXnYTPOA2N2wRNI1ZdXo3LS5c53rJQDBg/01HLlXC+3nnmX1FkL
         MSdhueU1Cby+/ZbGkB6Mdv+e7uPB4fONBcFU7hDeLOqJrh0okawS2UkVcxgAZSr0S41d
         EjuYNIXct/or+FpmV7ItHH0l+xZ+FN4ZCnWFp1FCF0qr6P13rCX9ffwocjeI/nUoEGLH
         Lz9yGwfWbHPhHgAWaHOOnshg+WGNM0O/k+l0h1lGaoviuCLThNi+10/uzCb/6nd4wSY3
         rrjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+IXn0jI0ldRL7YIjp8QrMhyxAPtVIFHuatfuckvUqnQ=;
        b=UfZdilfKwedFRqcoYTmWj5dVsbM7SFpKiudm7emNe1cXGMa6T4kqKOr4B08d/OlIsA
         /WbxaiSpfz9qG2GquRJvUxLP6TZv1x2eyEvqOjTjgbWswBXQySCHYkWMHB3RG6s7IOoJ
         +w57m3AA0+uSTa7FIj750in9IrU4LswoY0wKKYMJknYMorv2F2p1ENsLlA/5yP/I60FD
         tiJ53M481vLSvXbAfHvYqMEWkGYewN+vDt4DScPZADOlh7KnN+pQGOuNmcnHr4V/QB+/
         97zHofzhhyLPJt7YCnIjurqIUKivhNzdvNVDA8oqtgSbsZYkfJ9jpwJUV+7TY3IFSf/q
         mmuQ==
X-Gm-Message-State: AJIora9W8NhUoWd6uTDXrETVoGdXTSY+qZYp7sQ/yCmHYOmMAgZMgfeD
        g+J2Ru5AVTym8xNy+hhQ5vCcSYuYfLZDzEG9qBuLlQ==
X-Google-Smtp-Source: AGRyM1sbHYk2Pqpc9qaurG8ACQ+7E+4bfTKqXLTRu9d3ipv8YkEaaHIX9oSlPBTljwJ+/ekeV3QqQO0PmuZmUQvJ4AU=
X-Received: by 2002:a17:907:3f81:b0:6ff:1a3d:9092 with SMTP id
 hr1-20020a1709073f8100b006ff1a3d9092mr41359251ejc.319.1657142667241; Wed, 06
 Jul 2022 14:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220625050838.1618469-1-davidgow@google.com> <20220625050838.1618469-6-davidgow@google.com>
In-Reply-To: <20220625050838.1618469-6-davidgow@google.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Wed, 6 Jul 2022 17:24:16 -0400
Message-ID: <CAFd5g45-SPvFs7JUNEsm=bMbDEZYTA57r0bA6cgRbSGoMz9-uQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] mmc: sdhci-of-aspeed: test: Use kunit_test_suite() macro
To:     David Gow <davidgow@google.com>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        Jeremy Kerr <jk@codeconstruct.com.au>,
        Daniel Latypov <dlatypov@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andra Paraschiv <andraprs@amazon.com>,
        Longpeng <longpeng2@huawei.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>,
        linux-mmc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org,
        linux-modules@vger.kernel.org,
        Matt Johnston <matt@codeconstruct.com.au>,
        Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jun 25, 2022 at 1:11 AM 'David Gow' via KUnit Development
<kunit-dev@googlegroups.com> wrote:
>
> The kunit_test_suite() macro is no-longer incompatible with module_add,
> so its use can be reinstated.
>
> Since this fixes parsing with builtins and kunit_tool, also enable the
> test by default when KUNIT_ALL_TESTS is enabled.
>
> The test can now be run via kunit_tool with:
>         ./tools/testing/kunit/kunit.py run --arch=x86_64 \
>         --kconfig_add CONFIG_OF=y --kconfig_add CONFIG_OF_ADDRESS=y \
>         --kconfig_add CONFIG_MMC=y --kconfig_add CONFIG_MMC_SDHCI=y \
>         --kconfig_add CONFIG_MMC_SDHCI_PLTFM=y \
>         --kconfig_add CONFIG_MMC_SDHCI_OF_ASPEED=y \
>         'sdhci-of-aspeed'
>
> (It may be worth adding a .kunitconfig at some point, as there are
> enough dependencies to make that command scarily long.)
>
> Acked-by: Daniel Latypov <dlatypov@google.com>
> Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: David Gow <davidgow@google.com>

Acked-by: Brendan Higgins <brendanhiggins@google.com>
