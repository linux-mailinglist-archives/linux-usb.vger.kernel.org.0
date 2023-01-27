Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 144F167DFBF
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jan 2023 10:10:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232396AbjA0JKd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Jan 2023 04:10:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbjA0JKb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Jan 2023 04:10:31 -0500
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E1DC761E5
        for <linux-usb@vger.kernel.org>; Fri, 27 Jan 2023 01:10:23 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-50aa54cc7c0so31153437b3.8
        for <linux-usb@vger.kernel.org>; Fri, 27 Jan 2023 01:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NF9F6nmk4D5HCn1Ztkvb0MHra+in9ohTgBv6TaRKTNw=;
        b=B1gJTrcbOmj1zu+xW7j9aX1NO8wmmyRtqKIQj3kmtlGb03ApTl2+h8EuFhImEiSQdA
         IFN9F8+3AMWkbfTErjnwKdlxxByjLidWPxIccWsRvfeMNSFGcufmUFesY33d9bPH/urm
         BrNXs+eo/VwOjx2S73J4eD95r/FNOC3ceCunHuWrJrDjn0X+NZgdVWSI7UGlVPqy6ybB
         exuDCiaOT0KGpPBkVpUidCQvpCR6JG0oTZWtK6D8NhrojIM5Zz10gjq61GLFLYQZBVzE
         P1EYNoRiEU3f+YgxAB57zJ68MjiAMFYOCgNIoS0r1paS0TB1nGl+DNcx6fhQEyYeXsr9
         pq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NF9F6nmk4D5HCn1Ztkvb0MHra+in9ohTgBv6TaRKTNw=;
        b=VDaGVsM+O0OpQWO1HofJA049tvSg5lJnuhQgEd0qkKWCZ6QZyO6pyMiRLzmVYmrefR
         SC1bwMBU7XHYbjb2VKIJMvu0sdUa8eH45SPpKi+/qchkEReMaRAh2+FP8MWHyALQL6Rf
         X3ZGiza0R9HtiNH69DgBs81ivw9ewaULlChbQeIsA6Ob0YTDqzbKK03j+M+Ika34a7r6
         +m7GQJtS02L00wR6eXACkr0Uvqy9IgrxiC0BXOggABqsnmhCalQMnw3lPDtydlITMps3
         fX0GewC6ZfPtfDlc1uu7FYWXa3dker5FkvwUdEsQ4aiSaoFOpebM9IOd2Ev8QxHwj2mp
         sYEA==
X-Gm-Message-State: AO0yUKUzjGsdnK7cbuW6B6sn5t0tusMt4w/fUnbRTBgkEnTvIqjhNIIf
        7s8327C6iP+3pTsbSJAc3HNmBmEOpft74ltvdpQi8aiI3mdgIQ==
X-Google-Smtp-Source: AK7set8vlrhF2s8FUf1Ky0wGBPEHYDQbUcc2hnY7bUD6R9OD7/fVkXFTeobJsbxKHTflhAyZVDM7Yg8LQ/7zYxpQSvA=
X-Received: by 2002:a05:690c:706:b0:506:6952:b9c9 with SMTP id
 bs6-20020a05690c070600b005066952b9c9mr1187071ywb.477.1674810622569; Fri, 27
 Jan 2023 01:10:22 -0800 (PST)
MIME-Version: 1.0
References: <20230120154437.22025-1-andriy.shevchenko@linux.intel.com>
 <20230120154437.22025-5-andriy.shevchenko@linux.intel.com>
 <CACRpkdaeAkPuAQu0BW45Bn94Q_eO-Ven0-TSd38upe9XpXMzwA@mail.gmail.com> <Y9ORbi8hz7o5ek7W@smile.fi.intel.com>
In-Reply-To: <Y9ORbi8hz7o5ek7W@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Jan 2023 10:10:11 +0100
Message-ID: <CACRpkdaFZxbZ4Sw0-PKyP5s7nPDYiSjNuJC_EdPiEiORZrQnEw@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] usb: fotg210: use devm_platform_get_and_ioremap_resource()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jan 27, 2023 at 9:55 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> On Thu, Jan 26, 2023 at 09:02:30PM +0100, Linus Walleij wrote:
> > On Fri, Jan 20, 2023 at 4:44 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
>
> ...
>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Thanks for all your reviews!
>
> But I think you are a bit late with them as Greg applied the series like
> a couple of days ago.

Yeah he's so quick and I'm so slow...
But these days we record the mail thread link to lore in the
commit so I can still share the blame ;)

Yours,
Linus Walleij
