Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 302B45693D5
	for <lists+linux-usb@lfdr.de>; Wed,  6 Jul 2022 23:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233940AbiGFVGC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Jul 2022 17:06:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233276AbiGFVGB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Jul 2022 17:06:01 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30F8F237F2
        for <linux-usb@vger.kernel.org>; Wed,  6 Jul 2022 14:05:59 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id f23so4879632ejc.4
        for <linux-usb@vger.kernel.org>; Wed, 06 Jul 2022 14:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3covsTOEQGoLyVnwY5XV95mNRZOh4Tyvakfc5xsujkQ=;
        b=sZqocmz/4Y6K3wsDgmovwFwithWhO/dCbYzuKxivdgc0XQYQdnRdM+AleiWifaYGgT
         hJLwE8XQPN5iuUIPEwm6EfX9vdptcvXJqMqu3iXvNGGQ4jwu+aDh/QV/JNT42IU+BPlQ
         q/IGOXSQOqrfYmN0cOxx06bi8zpmRiUslSCEX6xpoyoXq4jDy49hk3Di8m28bq+56IDc
         dIDtPF2RymL4nU++R7LvJ7LQEj7KWzPzmZgw9bPK8GPKu531YDYJryJO712s/mORW1FT
         Qzg6cTUTJOBSXiu5R27vO112u/mnJpxE9UiYlxl+eMqz9jZMkgbblmttxIEWtB3poDPM
         BtEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3covsTOEQGoLyVnwY5XV95mNRZOh4Tyvakfc5xsujkQ=;
        b=fvr1wf8l0/GMRLJHJgrmIwGRcscIHd05o42CPrM/TavEBwAs+DV08wak0LxfgLzAJr
         xPKHALVoRSiBKBNdKWVyOd62TN7Ur/ur7aVTgjsjfzkuKNXGjMIyPuAg1CRD6PC96FSK
         XYxQ4sm37BXHfMTH6pSV2+SijUhudicQSRQWgfjJLx0D1pp+IZHT/0C5ilasy3jzTLuM
         CaIr5ys4xzOfPbRGVma4k9apT6sEA6IiLnCsosHHOcAjN7zFnnfhQYdbJySkurhtmFm8
         I47Vz0R8gE/Z2vGlKV3HaoVblhscvrRyRlUeTHP6l7Gs0vclvxL31II7YazpO67FMr25
         JylA==
X-Gm-Message-State: AJIora/SBk5S5LQPB4x3YXKR8Hw5wBTLbvIWwbLi5y2/ez0tKzpOfRd4
        RnU6VayfQK0AjChK7ECFFZRUnJGupjCT1o/+UpKKuw==
X-Google-Smtp-Source: AGRyM1uWI/PvLqWhv5jXHuhpc/hX5L1uVg66QNyDvRE3wDI2b9gqE97i1K3GG/FkfgwtLBSS6hsAfp1U0XizVDZkO+g=
X-Received: by 2002:a17:907:e8e:b0:72a:ad07:8357 with SMTP id
 ho14-20020a1709070e8e00b0072aad078357mr23742385ejc.338.1657141557573; Wed, 06
 Jul 2022 14:05:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220625050838.1618469-1-davidgow@google.com> <20220625050838.1618469-2-davidgow@google.com>
In-Reply-To: <20220625050838.1618469-2-davidgow@google.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Wed, 6 Jul 2022 17:05:46 -0400
Message-ID: <CAFd5g44w0h-EFfw-1wY=bBu_BbO1xi3Ys6gPoDogthCxrF14Qg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] kunit: unify module and builtin suite definitions
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
        Matt Johnston <matt@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sat, Jun 25, 2022 at 1:10 AM David Gow <davidgow@google.com> wrote:
>
> From: Jeremy Kerr <jk@codeconstruct.com.au>
>
> Currently, KUnit runs built-in tests and tests loaded from modules
> differently. For built-in tests, the kunit_test_suite{,s}() macro adds a
> list of suites in the .kunit_test_suites linker section. However, for
> kernel modules, a module_init() function is used to run the test suites.
>
> This causes problems if tests are included in a module which already
> defines module_init/exit_module functions, as they'll conflict with the
> kunit-provided ones.
>
> This change removes the kunit-defined module inits, and instead parses
> the kunit tests from their own section in the module. After module init,
> we call __kunit_test_suites_init() on the contents of that section,
> which prepares and runs the suite.
>
> This essentially unifies the module- and non-module kunit init formats.
>
> Tested-by: Ma=C3=ADra Canal <maira.canal@usp.br>
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> Signed-off-by: Daniel Latypov <dlatypov@google.com>
> Signed-off-by: David Gow <davidgow@google.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
