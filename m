Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB7152F5D0
	for <lists+linux-usb@lfdr.de>; Sat, 21 May 2022 00:44:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346407AbiETWoQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 May 2022 18:44:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235930AbiETWoP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 May 2022 18:44:15 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88C4C19FF6B
        for <linux-usb@vger.kernel.org>; Fri, 20 May 2022 15:44:14 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id kq17so18065756ejb.4
        for <linux-usb@vger.kernel.org>; Fri, 20 May 2022 15:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BKPudRHbttJcLyjKjpiyZYvJ7LnbTP0JY0qSwMBvUr4=;
        b=Af0+D8Ms8xIY23vBD3Lz9KxxFdwPqgs77iFuhxqXNylJe7nYNsLSz4qTZRUD+N2Nf/
         fcBPr1fsu0LFbU5hADuVGe4RhelcuRQxsqEUOiE0WKyahoJqVPBJHAqV2MVMSYIDVeVs
         E50K/zS8oTaI3aAGYafxdMI7oCw5w6CNkRXL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BKPudRHbttJcLyjKjpiyZYvJ7LnbTP0JY0qSwMBvUr4=;
        b=xIRSS8qUScfP+bP62WmA5NRke5OrhlLKk8A+Au/XY/CorhnVDWzJNEkh57VUuWOCJu
         0i5gyQna9ym/18Acqe+nQzJgYyaQitqbYVo72+wX/4lwzWbgSXexqWxXZQELreiNIpbr
         Ol8qMzc3RvEkwXVsDiZbrKjgvBJTEPCAiAzZwbmXyl8FvL/fbhPjDkque4SKbJmW4V/u
         xgxi/C7meXeViQOKPl/m8D9rZNmmBZx4lDlMEGHCvz9y9V1+Uzk6S3Vg41eOnz/EAsrN
         8Pw5nO2EVeIf/wz0FHgcsuf2SD+5FMjcTMWMZ0pJAG5GApnBk4RxEsq37qHnGZ240POa
         zm2g==
X-Gm-Message-State: AOAM533sHpls5yWvMy5Z5Dse7fQnSW5UzA1hJSDIhPcrPARGqJuIDwDa
        aGeNIpwq0PhZTZQtNX/wuLPKDDvEaD6bp8N5Jmk=
X-Google-Smtp-Source: ABdhPJzw/b0sFjX4a1b2zoXaG+wXJ4RO3LMzy/KxM/j4yekQTwIXUcFmanBGxZIMJ/mDyNheqHMTQg==
X-Received: by 2002:a17:907:7f0f:b0:6fe:b18c:72cf with SMTP id qf15-20020a1709077f0f00b006feb18c72cfmr4048273ejc.203.1653086652869;
        Fri, 20 May 2022 15:44:12 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id s10-20020a170906778a00b006f3ef214dfesm3619550ejm.100.2022.05.20.15.44.12
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 15:44:12 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id n124-20020a1c2782000000b003972dfca96cso3301675wmn.4
        for <linux-usb@vger.kernel.org>; Fri, 20 May 2022 15:44:12 -0700 (PDT)
X-Received: by 2002:a05:600c:4f13:b0:394:8978:7707 with SMTP id
 l19-20020a05600c4f1300b0039489787707mr10638855wmq.34.1653086651600; Fri, 20
 May 2022 15:44:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220518150150.1.Ie8ea0e945a9c15066237014be219eed60066d493@changeid>
In-Reply-To: <20220518150150.1.Ie8ea0e945a9c15066237014be219eed60066d493@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 20 May 2022 15:43:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UPQV-ocuz0ovvhY0DOqUdx=-uuqMKVaDRo05=PS9vR9w@mail.gmail.com>
Message-ID: <CAD=FV=UPQV-ocuz0ovvhY0DOqUdx=-uuqMKVaDRo05=PS9vR9w@mail.gmail.com>
Subject: Re: [PATCH] usb: Probe EHCI, OHCI controllers asynchronously
To:     Brian Norris <briannorris@chromium.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dtor@chromium.org>,
        Linux USB List <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Wed, May 18, 2022 at 3:04 PM Brian Norris <briannorris@chromium.org> wrote:
>
> From: Dmitry Torokhov <dtor@chromium.org>
>
> initcall_debug shows that OHCI controllers take ~60ms to probe on
> Rockchip RK3399 systems:
>
>   probe of fe3a0000.usb returned 1 after 58941 usecs
>
> A few of these can add up to waste non-trivial amounts of time at boot.
>
> These host controllers don't provide resources to other drivers, so
> this shouldn't contribute to exposing race conditions.
>
> Chrome OS kernels have carried this patch on some systems for a while
> without issues. Similar patches have been merged for a variety of (e)MMC
> host controllers for similar reasons.
>
> Signed-off-by: Dmitry Torokhov <dtor@chromium.org>
> [Brian: rewrote commit message, refreshed, but retained dtor's original
>  authorship ]
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>
>  drivers/usb/host/ehci-platform.c | 1 +
>  drivers/usb/host/ohci-platform.c | 1 +
>  2 files changed, 2 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
