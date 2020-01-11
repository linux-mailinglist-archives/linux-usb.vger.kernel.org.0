Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B4E7138387
	for <lists+linux-usb@lfdr.de>; Sat, 11 Jan 2020 21:37:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731285AbgAKUhB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Jan 2020 15:37:01 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:41874 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731281AbgAKUhB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 11 Jan 2020 15:37:01 -0500
Received: by mail-ed1-f65.google.com with SMTP id c26so4979684eds.8;
        Sat, 11 Jan 2020 12:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5lVQbTK1CQNJLbn+dfYa9kwkLSnyzK1w6ElpnSy1kD8=;
        b=JrQNGe25400SidHXkopUC0o6/smR+GNbFtP1ae37v/m/2Xm91sqTsS2CEaQHvsexqT
         nxJeoKgEvQAwP1hRLIaChq9Oye7pvR78Pb/h8taDSYbmkR8rfSn+cWqMqhdMyOiHZECm
         BJpM2MzE+lDhIhg0av5bc2hFTJlpXtmNxhK9pqaUThWmR/VH+uvZ3niJDaOqOJLt6LKQ
         hjb54JCcKYHsa+RFW+O3jkPKXVdUs9qGGu7kKgBiIx24gsO57MZS70rSm/0/fenQ9diG
         6OjfvypJ2FoamHZjIMA0cHbz3I/cnDxCQYxVPl4xvbeRiUmj2xtwGVDOV1W3v7LmmeiI
         kovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5lVQbTK1CQNJLbn+dfYa9kwkLSnyzK1w6ElpnSy1kD8=;
        b=NfxIY6de29He35yA7MiDafkFKyLU1Ihp/X/RNK7BP1bmK2+llwb9MzvtjpsLzOtu/a
         uaQcbNv3n18AVv0HuDKG5TrnkEFErieM9goDvbJXAPzDVLuT/iRkbNaFre3n77ndF4Ja
         kOjvZXo5EVHOvKi8/n7Oi0DVRAybAdTOLY79UTplO6k5lkFBs61TzyFuP/Rv4w718oNo
         Iw3dr/09OumZ2FXJ0IUslaxhuU790Yx+Y8seyCkE738FIS1zv6pFZ+rXMXT9Mhdu4q1L
         RYel0T02StdaqbUfYIcj5/govQymGbazk0pbj1z9Zjw4huBP7LBcoRUWqUQqTVOkkp+g
         Yc7A==
X-Gm-Message-State: APjAAAVcwJRVaRCXSUyUxDo/OxIu3wjRQYjgrEbz1uZUn51+CAu9D/CB
        HFq0lc2hIsFUy6o2T4OYrRzZ97mQlYVtd0mGsog=
X-Google-Smtp-Source: APXvYqy3VjOtoPNH3qxa+q4QIo6rrFf00xb5aOXFHChIgJasCdlp1oMaMFIGt2FfOI3OgpTjzTiJuOH4oRlnUqVdJHE=
X-Received: by 2002:a17:906:27cb:: with SMTP id k11mr9430045ejc.301.1578775019610;
 Sat, 11 Jan 2020 12:36:59 -0800 (PST)
MIME-Version: 1.0
References: <1578634957-54826-1-git-send-email-hanjie.lin@amlogic.com> <1578634957-54826-4-git-send-email-hanjie.lin@amlogic.com>
In-Reply-To: <1578634957-54826-4-git-send-email-hanjie.lin@amlogic.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sat, 11 Jan 2020 21:36:48 +0100
Message-ID: <CAFBinCC9fNu0HWEy05by=acuDv-06FkUU1X0BaVT8tmvNMxBMg@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] phy: amlogic: Add Amlogic A1 USB2 PHY Driver
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

On Fri, Jan 10, 2020 at 6:43 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
>
> This adds support for the USB2 PHY found in the Amlogic A1 SoC Family.
>
> It supports host mode only.
>
> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
