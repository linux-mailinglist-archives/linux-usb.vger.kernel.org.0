Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 935A32EF0E2
	for <lists+linux-usb@lfdr.de>; Fri,  8 Jan 2021 11:52:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727494AbhAHKvU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Jan 2021 05:51:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbhAHKvU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Jan 2021 05:51:20 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4245FC0612F4
        for <linux-usb@vger.kernel.org>; Fri,  8 Jan 2021 02:50:40 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id c13so3306944pfi.12
        for <linux-usb@vger.kernel.org>; Fri, 08 Jan 2021 02:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hUYexvGQkq4ls/OimwsO5Jd0RZqGFOW3s7MoFq9zFTo=;
        b=YJkyuQWXhbFLgxwObjUfAmF83zKljdj7aMi/D0QeB/d+QLVbsGCvwyase5VS/GWSpg
         Es1unRr4cp3Fvy24ZBffOLz0Lfh11nBkmofiM2flPrgjewamfaSpMXKulclYD2Pltylo
         jrH2DnIwA96hZC5n+910xx3mFFG4aCgPnl1+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hUYexvGQkq4ls/OimwsO5Jd0RZqGFOW3s7MoFq9zFTo=;
        b=CRO/dnQV8vJiOayDZFr1yCnhFPjgn5S4cYeBzaqbafAt3j1WwmLkBbGLixbn9tvJCx
         b71Zh7F8Fq3oiS+Fs610YBSdAp2Vu1T246uAySZYiDiBBfsypakCydinUb1OcDQ5lOXg
         Iv2YqV9hcWfXZRLyCzsMu8eoJjG9t4OuOVnSdFrKagG40qguDN0sVbf3zBOKxk8S5VAC
         hCpDIspkcszn+AKUus6db25FsMzAvMpbeiSpMU4WPZF8r2natc9y2bv2mVJ3SV4slQ4C
         YVFdDJlKH4PWXNUj6LiJhLSEeQ8BSZAkE8D+WykwKLdJsLOJ+BuwLB7pmv278Qvtkove
         L2sQ==
X-Gm-Message-State: AOAM530fiBcdtdIXvfwsPGFCuPmPVvA5wjVErJhWrrC94AbDX9unOgbJ
        bUAM+ZkpFBEqVxiEDj6hGtBjWweVoonGjP6JzqAV6A==
X-Google-Smtp-Source: ABdhPJznWhv1cTUN3HY6O/t1DpDD7sg3cxH33OEwBKtFZhXYshd0vUiYpemVN8VSwVvSOQqG6eW9FQ92uaiCom4uJ+4=
X-Received: by 2002:aa7:8813:0:b029:19d:cd3b:6f89 with SMTP id
 c19-20020aa788130000b029019dcd3b6f89mr3048408pfo.42.1610103039797; Fri, 08
 Jan 2021 02:50:39 -0800 (PST)
MIME-Version: 1.0
References: <20201229142406.v5.1.Id0d31b5f3ddf5e734d2ab11161ac5821921b1e1e@changeid>
 <1610087648.24856.41.camel@mhfsdcap03>
In-Reply-To: <1610087648.24856.41.camel@mhfsdcap03>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Fri, 8 Jan 2021 18:50:29 +0800
Message-ID: <CAATdQgAfRTxbzG4tJ-ftX7M6wrYFR6v+ji+-nSk_dTRTMXzXwQ@mail.gmail.com>
Subject: Re: [PATCH v5] usb: xhci-mtk: fix unreleased bandwidth data
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, linux-usb@vger.kernel.org,
        Tianping Fang <tianping.fang@mediatek.com>,
        Zhanyong Wang <zhanyong.wang@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jan 8, 2021 at 2:34 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> On Tue, 2020-12-29 at 14:24 +0800, Ikjoon Jang wrote:
> > xhci-mtk has hooks on add_endpoint() and drop_endpoint() from xhci
> > to handle its own sw bandwidth managements and stores bandwidth data
> > into internal table every time add_endpoint() is called,
> > so when bandwidth allocation fails at one endpoint, all earlier
> > allocation from the same interface could still remain at the table.
> If failed to add an endpoint, will cause failure of its interface
> config, then the other endpoints in the same interface will be dropped
> later? you mean some endpoints in an interface may fail but without
> affecting its function?

Yes, drop_endpoint() is called for a failed interface when set_interface()
fails to switch alt settings, but set_configuration() does not call
drop_endpoint().
TT data seems to remain allocated until a device gets removed.

>
> >
> > This patch adds two more hooks from check_bandwidth() and
> > reset_bandwidth(), and make mtk-xhci to releases all failed endpoints
> > from reset_bandwidth().
> >
> > Fixes: 08e469de87a2 ("usb: xhci-mtk: supports bandwidth scheduling with multi-TT")
> > Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
>
