Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4E2840FF8C
	for <lists+linux-usb@lfdr.de>; Fri, 17 Sep 2021 20:41:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240839AbhIQSm0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Sep 2021 14:42:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240530AbhIQSmZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Sep 2021 14:42:25 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE4C7C061574
        for <linux-usb@vger.kernel.org>; Fri, 17 Sep 2021 11:41:02 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id d42so14952269lfv.10
        for <linux-usb@vger.kernel.org>; Fri, 17 Sep 2021 11:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cpak71tpwGIH8sDgLDrdJbMzVDQHoqt6rJZasCMwdzc=;
        b=PPZqYKySWRBXLCmQqLignaVRzeemkJWbOSVm4Nk3LB3/dwYqxZT99gFitFC859Cqmo
         5dHLqIWjBbL09xTf3eNTCSAzEfwW62QnHoObFrYVOWn0PPzzY6lksRvKhahbrO9bPfvT
         /jfwN2l8iu/pKIRl254LqCHUDuwZMUECiAh00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cpak71tpwGIH8sDgLDrdJbMzVDQHoqt6rJZasCMwdzc=;
        b=tCNZGbgAB9xX46DCXRvTARxM94IQaIKLZxllVb2/MF25FANEgw8ZI7W4sDFnMoV5qn
         AAwEZ6ANlEoDVTn949xCU1cwBYfCd63eSrheaNkGXoWuRt/KvdE68h095mYbBRKKASmd
         2OROFUjxmZzFnUNkAbo/ayrrBPgKHKlfuA+/O/+MlupngEohYQYKT/mcpexXt02sJGeP
         59ZqX+rtIENjvYO/DzNTeDUyqCNOIwM+7AmVfEMCG9xeDizHOvpQQ+Zqu+TtesUdbZlM
         rt8z/xPTPUUacYZPTSB0sv/IUBjASRu6wy8UQVrqZd8FxcdhltudAD5UhIiTtyhnfo04
         D2fg==
X-Gm-Message-State: AOAM532gPR4RNZQd1Sud31rG6ON1OivXpXuWWgreCQcmRSWEnoSLeZ5W
        1fXRLzCP4bb/wvhUdh7bK49vV6X76t9aFJB2+zY=
X-Google-Smtp-Source: ABdhPJyPYusvCq6VnyabOfiQ/ByzBNoIN1qMZ8WEDGCU2tM79/l328Ajoo0S8i1veeGDrvPRVFKjRA==
X-Received: by 2002:a2e:a4ba:: with SMTP id g26mr10889739ljm.254.1631904060904;
        Fri, 17 Sep 2021 11:41:00 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id w19sm778525ljd.110.2021.09.17.11.41.00
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Sep 2021 11:41:00 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id g41so3472664lfv.1
        for <linux-usb@vger.kernel.org>; Fri, 17 Sep 2021 11:41:00 -0700 (PDT)
X-Received: by 2002:a19:ae15:: with SMTP id f21mr9099719lfc.402.1631904049054;
 Fri, 17 Sep 2021 11:40:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210917061104.2680133-1-brendanhiggins@google.com>
 <20210917061104.2680133-6-brendanhiggins@google.com> <202109170856.8DDB49112D@keescook>
In-Reply-To: <202109170856.8DDB49112D@keescook>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 17 Sep 2021 11:40:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=whck4RtO7yp-jKK8QQc0bCDZBkdHc=3pGiFsFjwnQ+-mw@mail.gmail.com>
Message-ID: <CAHk-=whck4RtO7yp-jKK8QQc0bCDZBkdHc=3pGiFsFjwnQ+-mw@mail.gmail.com>
Subject: Re: [PATCH v1 5/6] mmc: sdhci-of-aspeed: build kunit tests without
 structleak plugin
To:     Kees Cook <keescook@chromium.org>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Shuah Khan <shuah@kernel.org>, David Gow <davidgow@google.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Rafael Wysocki <rafael@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Ulf Hansson <ulf.hansson@linaro.org>, andreas.noever@gmail.com,
        michael.jamet@intel.com,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        YehezkelShB@gmail.com, Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 17, 2021 at 8:57 AM Kees Cook <keescook@chromium.org> wrote:
>
> This isn't a stand-alone test object, so I'm less excited about
> disabling STRUCTLEAK here.

Yeah, please don't do this for things that aren't pure tests. You're
now disabling security measures (even if I hate the gcc plugins and
hope they will go away).

             Linus
