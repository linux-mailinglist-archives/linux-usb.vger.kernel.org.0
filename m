Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25E6056942C
	for <lists+linux-usb@lfdr.de>; Wed,  6 Jul 2022 23:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234194AbiGFVUJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Jul 2022 17:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231407AbiGFVUI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Jul 2022 17:20:08 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 074D117A81
        for <linux-usb@vger.kernel.org>; Wed,  6 Jul 2022 14:20:07 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id u15so4761384ejx.9
        for <linux-usb@vger.kernel.org>; Wed, 06 Jul 2022 14:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g2UCDhMKypb3YzjSBsPeyBiF2PeTe0+wdsZ8OfsVOrY=;
        b=sVFcjcHg2LfnGZPa5eF4aYhrF8RBJQ8TTDW3HHOvEbkPNvYtsAnwKb0K9pOEDOHtGr
         5MLLVwfPiM5Ww6QytB5EQA6Nv4l7GlTpEl6BHslrWSxudyACtyeDn+/ZFJZbD1bb3K9g
         TZc7d/Zj9PZ7ZFUq4pHASajIqU2e8MJPeQkohIwy1iMQWIy/F/DvYF5Pg7FC73nJd9sj
         zfOlEUGVa9h3Ia4yQ4Di7y12ZyeK4KqxzVmiemdXbK61C1koJczt92TGDpDqfG5fy06O
         a4NUSg/QnJ0l5x1VskRXEKu8EID1WZo1+FI60c+NpXidysJLk+EWwBPd3Ybclut9mea0
         NJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g2UCDhMKypb3YzjSBsPeyBiF2PeTe0+wdsZ8OfsVOrY=;
        b=ZbAHbIet3rdhcs6G9JExyhGmhbb0QbxdmDajzNXh/j8G5m4pIxOTVMqtw6THVieuGl
         milJw/pbyKuESbcGjul7n9ShHHotdXjdGf8aDB8PtRSxCgQ8TlcoOYYkTei6U58qo9g0
         8bhkVDBkEr9vcWfyieHZqLUirHLua8gnke+hnycf+HqAzaOHq3lOf6sP3/KJKKxbiq4i
         +sy27iTCZIjlXRG60s8XjMYnOxxzKzqBT/55fV5tXJTZ5qhaMei7JYZZ2hUGgyL4rZhw
         F8KLIcgP9U/tc6vfUU5Bq7XXTTc3rK5nnTyIEdEA+0eQkVuwFNVSfagGgJiEaOqNON1d
         uZrA==
X-Gm-Message-State: AJIora+rP3ml2pCuIUxlPJHqpu8NyMPOtK+bgmMqhFxXt0bJhz+MMBSP
        lNmzjnAWmX18kR4he8n6c7+4V4dx0zS0vPfH03boUQ==
X-Google-Smtp-Source: AGRyM1susXO3wYeoDf0WuEIfBGex3/UVxBp2DE1XLABw70yWDUei6RgD/KNu5S+8rGhboeMpSh2JSE05/UMRGugtit0=
X-Received: by 2002:a17:907:3f81:b0:6ff:1a3d:9092 with SMTP id
 hr1-20020a1709073f8100b006ff1a3d9092mr41342820ejc.319.1657142405356; Wed, 06
 Jul 2022 14:20:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220625050838.1618469-1-davidgow@google.com> <20220625050838.1618469-4-davidgow@google.com>
In-Reply-To: <20220625050838.1618469-4-davidgow@google.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Wed, 6 Jul 2022 17:19:54 -0400
Message-ID: <CAFd5g471_it8CQmBJnrhS=T3AgdfQF2tr4A9n=sYuWayovXmLw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] thunderbolt: test: Use kunit_test_suite() macro
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
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jun 25, 2022 at 1:10 AM David Gow <davidgow@google.com> wrote:
>
> The new implementation of kunit_test_suite() for modules no longer
> conflicts with module_init, so can now be used by the thunderbolt tests.
>
> Also update the Kconfig entry to enable the test when KUNIT_ALL_TESTS is
> enabled.
>
> This means that kunit_tool can now successfully run and parse the test
> results with, for example:
>         ./tools/testing/kunit/kunit.py run --arch=x86_64 \
>         --kconfig_add CONFIG_PCI=y --kconfig_add CONFIG_USB4=y \
>         'thunderbolt'
>
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Acked-by: Daniel Latypov <dlatypov@google.com>
> Signed-off-by: David Gow <davidgow@google.com>

Acked-by: Brendan Higgins <brendanhiggins@google.com>
