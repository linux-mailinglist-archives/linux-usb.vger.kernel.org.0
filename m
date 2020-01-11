Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA18713838E
	for <lists+linux-usb@lfdr.de>; Sat, 11 Jan 2020 21:45:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731302AbgAKUpY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Jan 2020 15:45:24 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:45465 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731283AbgAKUpY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 11 Jan 2020 15:45:24 -0500
Received: by mail-ed1-f67.google.com with SMTP id v28so4985628edw.12;
        Sat, 11 Jan 2020 12:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fptJHxfJcn8XPXLFZgO9QVg2TjNMVukyouEJjCWDXV8=;
        b=GF+UHv17+im9hGltahc9unerkHkyQ5OVQwSM50qplG7IuREOcD9QMEgYUblCEqN3N/
         0OPv7W8dvRSeoheT6OzralJLFc/pzzaOVIpL/4AsoHIHWeAvrs9l1ohuyF0cllD182AO
         nol87ON0HLhrbhewaDhNPnOO/XyY7xHUhu6BA/DiC0dQ0ljBV2Jw33WUVlttfemgj74x
         oBpj2x1V9D2QBf6OHoEUjhmVo0mxOGwPVoNGxvK7np5dmL6UTj8SeB2PDfKMKFx2mDUb
         GxcVozLSn++R9TAG1YaHI/GWTRuQOjDj24OnYvwWI6bTNlkkcalppgx2r/YDVv5Zdztr
         t6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fptJHxfJcn8XPXLFZgO9QVg2TjNMVukyouEJjCWDXV8=;
        b=cG15VuGeop+FtJY9tFrtCOji7taKaaNyt4dAZc4x3MZ6edW9vdOkKDxAeWB4V8wi25
         km9Kkg3PkL2n1c+mlzxjOcUtQqN0bA4Kl4IVXLQUiAOLT9dUieT73RziOe5Qna4votM0
         klNn6JUjUniKfl45VneOAKxF8HSwbkMo1duDQXK3UU7FRyxVjU2n9oTk6Qvljx4XMVAp
         btDNV5zr+vpqDpWrzyOkn8XIbyRgVv75qe2aJQSuNjZuS8mFhtqVkFHSuCM/ha1ULYcR
         geQvIiDDfFijoU9JHu5Z8wb7CHa9CxEJIC1YLF/uSrmi3NU4x7OLHfeUBdSS1XECKZ57
         z85A==
X-Gm-Message-State: APjAAAW3iqej/k095SLxBC7Ew7iuXlIbNFFY1+leoK5c2EEuY0UmU4E+
        8Jk3CMkasScF3seYvPCxOtKMpVcjzxs9QyheqoFPYmuG
X-Google-Smtp-Source: APXvYqxx35msRJwJFzncZx/Qn0rrX3K1+YRYlLX5GGk8pBBABXjfJI1q8LiSfcgC2cSU3qRDnzBHHHafnSeTQ/+zoKg=
X-Received: by 2002:aa7:d94d:: with SMTP id l13mr7296961eds.328.1578775522271;
 Sat, 11 Jan 2020 12:45:22 -0800 (PST)
MIME-Version: 1.0
References: <1578634957-54826-1-git-send-email-hanjie.lin@amlogic.com> <1578634957-54826-5-git-send-email-hanjie.lin@amlogic.com>
In-Reply-To: <1578634957-54826-5-git-send-email-hanjie.lin@amlogic.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sat, 11 Jan 2020 21:45:11 +0100
Message-ID: <CAFBinCCFUDst_-QtSuNioAa3ckt5GzTFDAhZWh3zu42VRByPpw@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] usb: dwc3: Add Amlogic A1 DWC3 glue
To:     Hanjie Lin <hanjie.lin@amlogic.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Yue Wang <yue.wang@amlogic.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Hanjie,

On Fri, Jan 10, 2020 at 6:43 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
[...]
> -       devm_add_action_or_reset(dev,
> -                                (void(*)(void *))clk_disable_unprepare,
> -                                priv->clk);
> +       ret = clk_bulk_prepare_enable(priv->drvdata->num_clks,
> +                                     priv->drvdata->clks);
I don't see clk_bulk_disable_unprepare in dwc3_meson_g12a_remove()
please test that the clocks are all disabled (see
/sys/kernel/debug/clk/clk_summary for example) when unloading all USB
related kernel modules

> +
> +       if (!priv->drvdata->otg_switch_supported)
> +               goto setup_pm_runtime;
my brain doesn't like the goto in this place because this is not an
error condition. I was about to write that
usb_role_switch_unregister() is now skipped even though we're calling
usb_role_switch_register().

I want to hear Neil's opinion on this because I got confused while
reading the code again.
my proposal is to move all of this OTG related code from
dwc3_meson_g12a_probe() into a new function, for example called
dwc3_meson_g12a_otg_init()
then only call that function when OTG switching is supported


Martin
