Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 526D7557A3A
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jun 2022 14:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231472AbiFWMYf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jun 2022 08:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230250AbiFWMYf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jun 2022 08:24:35 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 099913057A
        for <linux-usb@vger.kernel.org>; Thu, 23 Jun 2022 05:24:34 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-101ec2d6087so15949046fac.3
        for <linux-usb@vger.kernel.org>; Thu, 23 Jun 2022 05:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qcOFv+gUkOUIJJ72OOZ9NseYxv0LoGb9wAQ/jFJ2Dk8=;
        b=ZGAwRzzE8VL85qRDYfMIvCrIHJkVRiIYei98dO36+lgVyF3FWJUe7hqqUrsTwy639Y
         fc+W8/1hfo7JZohSBn0BmrXgCAuBJ5vCaJB2sAWPRSGsx6O74BR4aBhFhTsdrI8SVpw6
         yHYggGBjd/sq0CYiDjkFfZkeqRUmrn4J7Dg4e7iicPa2yWiHeuY+8e+bLsDAiI4i8pyr
         EV80OclS5ilc1yqKp6AG1B401ALvhV3exYBeb2IeV0OW8rpAFVov8Ge0ATahc3RcmxRF
         4FFQUAnzOwhEN6/m8cyLiVsmXun+S618Er5jfz5mSVTteervSKejh8lx4MtRyhHmQCtR
         ZssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qcOFv+gUkOUIJJ72OOZ9NseYxv0LoGb9wAQ/jFJ2Dk8=;
        b=eaKvJwnB8r0pV1YqkZiwYhCWiXdQxxh251eb8y+/RLChjSRfj3PT8/T5GcoXznTffW
         02ghRZx2SnbPZSS7QjUnEfoRwqXLplLhHl+Qia6nHvIVuolnArmVNR3/BFVzXjrmYhUt
         b8RP26QjYLz7nozdPNerqVwGmhPo9+Vojh2Lv3tM0d1k/VK8jdn9G1PyGkMSL8Qr7GZE
         WFRYHOyf6NUXw9vMmUopkptri6NtrTcJjOQjZ0kE5LLqRSkfypbMV3QzwqNlZnkrjcOq
         7l9GXWxvqb2/otZbGpRILVTmpMAy0xY5UlAHWhlk9G10ZDnJI2BMKDwNnorrsT291zVg
         ZaLw==
X-Gm-Message-State: AJIora+QA91tcWN/YQ1imH4TN2gvLlFl++kwWmkfs5mKS8dN4c8wMEax
        ZcKvYddAZq5r3HhJ2nhWYgobJoQDoeNFY3KfZJ2L3A==
X-Google-Smtp-Source: AGRyM1tolYit2qOF13LQll2M1apYzVAPtBssHfNXvX79yFs+qX/QdnWSuZSn9LvvuTfowIJzogE5Gto6i2wMUvkyN5I=
X-Received: by 2002:a05:6870:33a9:b0:f2:c44c:d054 with SMTP id
 w41-20020a05687033a900b000f2c44cd054mr2317236oae.70.1655987073368; Thu, 23
 Jun 2022 05:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220621085345.603820-1-davidgow@google.com> <20220621085345.603820-6-davidgow@google.com>
 <CAGS_qxp6ZK9K0Sy1JcuU-SGqChOyr6-+5HDxgesOpxjxvDkiXQ@mail.gmail.com>
In-Reply-To: <CAGS_qxp6ZK9K0Sy1JcuU-SGqChOyr6-+5HDxgesOpxjxvDkiXQ@mail.gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 23 Jun 2022 14:23:57 +0200
Message-ID: <CAPDyKFq0cTX5pfTLxTa9SEUBiiEcMuiEeDi3OPfMjFuBWca_jw@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] mmc: sdhci-of-aspeed: test: Use kunit_test_suite() macro
To:     David Gow <davidgow@google.com>,
        Daniel Latypov <dlatypov@google.com>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Jeremy Kerr <jk@codeconstruct.com.au>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andra Paraschiv <andraprs@amazon.com>,
        Longpeng <longpeng2@huawei.com>, Paraschiv@google.com,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>,
        linux-mmc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, linux-usb@vger.kernel.org,
        linux-modules@vger.kernel.org,
        Matt Johnston <matt@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 22 Jun 2022 at 00:19, Daniel Latypov <dlatypov@google.com> wrote:
>
>  On Tue, Jun 21, 2022 at 1:54 AM David Gow <davidgow@google.com> wrote:
> >
> > The kunit_test_suite() macro is no-longer incompatible with module_add,
> > so its use can be reinstated.
> >
> > Since this fixes parsing with builtins and kunit_tool, also enable the
> > test by default when KUNIT_ALL_TESTS is enabled.
> >
> > The test can now be run via kunit_tool with:
> >         ./tools/testing/kunit/kunit.py run --arch=x86_64 \
> >         --kconfig_add CONFIG_OF=y --kconfig_add CONFIG_OF_ADDRESS=y \
> >         --kconfig_add CONFIG_MMC=y --kconfig_add CONFIG_MMC_SDHCI=y \
> >         --kconfig_add CONFIG_MMC_SDHCI_PLTFM=y \
> >         --kconfig_add CONFIG_MMC_SDHCI_OF_ASPEED=y \
> >         'sdhci-of-aspeed'
> >
> > (It may be worth adding a .kunitconfig at some point, as there are
> > enough dependencies to make that command scarily long.)
> >
> > Signed-off-by: David Gow <davidgow@google.com>
>
> Acked-by: Daniel Latypov <dlatypov@google.com>
>
> Minor, optional suggestion below.
>
> >  static int __init aspeed_sdc_init(void)
> > @@ -639,12 +620,6 @@ static int __init aspeed_sdc_init(void)
> >         if (rc < 0)
> >                 goto cleanup_sdhci;
> >
> > -       rc = aspeed_sdc_tests_init();
> > -       if (rc < 0) {
> > -               platform_driver_unregister(&aspeed_sdc_driver);
> > -               goto cleanup_sdhci;
> > -       }
> > -
> >         return 0;
> >
> >  cleanup_sdhci:
>
> This goto was added in 4af307f57426 ("mmc: sdhci-of-aspeed: Fix
> kunit-related build error") to allow for this extra call to
> aspeed_sdc_tests_init().
>
> This could now be reverted back to what is
>         rc = platform_driver_register(&aspeed_sdc_driver);
>         if (rc < 0)
>                platform_driver_unregister(&aspeed_sdhci_driver);
>
>         return rc;
>
> but let's see what the maintainers think.

I don't have a strong opinion on this, feel free to pick any of the options.

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe
