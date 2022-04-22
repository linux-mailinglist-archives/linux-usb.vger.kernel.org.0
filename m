Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94E7050B045
	for <lists+linux-usb@lfdr.de>; Fri, 22 Apr 2022 08:11:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444414AbiDVGNs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Apr 2022 02:13:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1444220AbiDVGM1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Apr 2022 02:12:27 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F5325046F
        for <linux-usb@vger.kernel.org>; Thu, 21 Apr 2022 23:09:35 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-2f18982c255so75041337b3.1
        for <linux-usb@vger.kernel.org>; Thu, 21 Apr 2022 23:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WVPOUE1eoGTr9sPCFKQI4QQYdi6UaBdPpdZSqYpQZkM=;
        b=itAxsdV4tCQgNEsd1VioxnCp8XifLzPrW0ybtm2S8hWcYDEX3LMbDsluAwcakpsMwu
         75zd0r7dFJm/6KOSyxZDgLryHauhof3d96MXv5NIoc6xeoO7HT3qkY0zq+gZVCN3jOvO
         VNQ66dhI87ANwMCjHr7PPo76FBvlwY8UEKUjPbRwDUU3dpCTSN/UMc9ghby6ZRVG5LEG
         QyK02EmfO/RjCC/rd1cXkQkzGZ6mI/wCzdp7HfP0XRvt+OhMdYrbrZhguKhqa566YHnq
         oKdduMxZa+Msge7iaAJcxHUrHrpDh4wR6PgTLldkvmhHrEIISgjwjEB8XEt+NmdCnZbx
         hU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WVPOUE1eoGTr9sPCFKQI4QQYdi6UaBdPpdZSqYpQZkM=;
        b=5hwNLwwEVmu7M1YHKQbgLrYV8bHD47KsIgq0RUYiajkWJHIwSZbHmrraXgEazbRqC7
         bHm0e1Azujb/JxaL0+uIIkFz/faCacyvgHrIs75AyB43EiSLgHB2esPlZACPQcpRS45Q
         vYiI65t3g8AyUrRR+d4FYutP6y3W+MgCRIiPSH9c6DSU513+xVbx9gRl99nNRHyxwDZL
         KICl8yIi/HGv0gqd2mjbtA4JnS5OZcoyF5koc6YUsbvcTVIEQNmRZB+lW8Z4BQbH7qV2
         lHB3rmf5WWlBZ1yGunz2S0Qg8PZVB/b3/26Ple5NP2azUQDBoLHL07Ftkp/eb6qVO39m
         w+9w==
X-Gm-Message-State: AOAM531sMe9qYG0izmAMBFj0O0aDlPUY8zTPWEBkhgB3McoL3VXNF0x6
        HNehTAX48TsqndvUEI7uz+xKUPAWzY65anc+vOZk3VaENSM=
X-Google-Smtp-Source: ABdhPJzBMcqfwGb5uJlBz/9N6V0GUDFBMrs12pd7PXA66b6nw3UW9UU0gvOJIJre2nSIS41xd0GKtx/+gY3K7PGbm/w=
X-Received: by 2002:a81:1957:0:b0:2ec:91:c9da with SMTP id 84-20020a811957000000b002ec0091c9damr3249868ywz.254.1650607774593;
 Thu, 21 Apr 2022 23:09:34 -0700 (PDT)
MIME-Version: 1.0
References: <6580ca29cd8e245627c4a742189e27acf79f6b39.camel@gmail.com> <YmI8g2Jaye8Kk+hA@lahna>
In-Reply-To: <YmI8g2Jaye8Kk+hA@lahna>
From:   =?UTF-8?Q?Tomasz_Mo=C5=84?= <desowin@gmail.com>
Date:   Fri, 22 Apr 2022 08:09:23 +0200
Message-ID: <CAOHtt38-+tnyrUX5u0McHyutofEwZLeLF7siZab7XgLYXVdm9Q@mail.gmail.com>
Subject: Re: Wake from Thunderbolt dock doesn't work
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        =?UTF-8?Q?Tomasz_Mo=C5=84?= <desowin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 22, 2022 at 7:27 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Thu, Apr 21, 2022 at 09:52:18PM +0200, Tomasz Mo=C5=84 wrote:
> > I have observed that when I suspend to RAM, I cannot wakeup the host
> > (MacBook Pro 2019) with my low-speed USB keyboard (Microsoft Comfort
> > Curve Keyboard 2000) connected to Thunderbolt 3 dock (CalDigit USB-C
> > Pro Dock).
> >
> > The host runs on Intel Core i9-9980HK and lspci shows Intel Corporation
> > JHL7540 Thunderbolt 3 NHI [Titan Ridge 4C 2018] and Intel Corporation
> > DSL6540 Thunderbolt 3 Bridge [Alpine Ridge 4C 2015].
> >
> > On Windows and Mac OS the system can be successfully woken up by
> > pressing key on keyboard connected via the dock.
>
> Is the system that has the problem an Apple system or a regular PC?

It is an Apple system (MacBook Pro 2019) as noted in in first
paragraph. All tests were performed on the same host with the same
equipment.

The problem occurs when running Linux 5.17.3.
