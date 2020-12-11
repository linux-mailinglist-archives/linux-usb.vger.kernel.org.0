Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 083D02D7048
	for <lists+linux-usb@lfdr.de>; Fri, 11 Dec 2020 07:39:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391336AbgLKGhi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Dec 2020 01:37:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391539AbgLKGh0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Dec 2020 01:37:26 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51E35C0613D3
        for <linux-usb@vger.kernel.org>; Thu, 10 Dec 2020 22:36:46 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id t18so4122085plo.0
        for <linux-usb@vger.kernel.org>; Thu, 10 Dec 2020 22:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J9Gkfw6PqMYjMiqAsCdoTdxmVJeKL3b8kE1ybX0wQp8=;
        b=WIyjZRThPyIcByjD1VjOn8yzB/aMzxMJnGFYKBhQUxHL/8D99o1+TixNQQzj97PI2l
         Oblyp0AWTkMt/E7msPxQhosmku8buexCrgtuWx2B1epKLnou7e3T2QboFcEldqVJgvoL
         5rcIzR7SGYwuoKzqr5+ki7K/3DAxIn0tB6nLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J9Gkfw6PqMYjMiqAsCdoTdxmVJeKL3b8kE1ybX0wQp8=;
        b=FCRQkJVrWduebJ694MjZ1MfYM3TyptfeNFVarMYqoo9p3qpAV6RWl3KMbUsW5CfrRo
         OHrn+uN0eV1mW4dfWAAGRbxvOJbpCA1kFQ2ttDt/zESDMTpahduPzj5UfmnDhAmV0zyu
         eI2XEIqyKRbBK3FoVV9UNS6eh/Hd7VSKUho/REZ6vwoy4AVS1byVIGIiQEWOH2fux8hE
         x01pulyXb1Dx2q+jf7aAGMeMp08syKg/kv6RYl8ryzmW6QpgFKcWezp+oePBW+tPDAm2
         72KVSw3SRQwe30En+4PI+Gs5PI3/9rQz3RHA+ZFWs/bpjJ8BcKvIwa5JZeXDObijmTaI
         rYng==
X-Gm-Message-State: AOAM531/VTFevXL0Qy/n8/b+5MUe08c9FGLSw8Q3HTcBK46AVTrAv4wj
        1VAwj+IdCzM/zqSl81aNodoe2MuKZCRstNMQY5ZDFw==
X-Google-Smtp-Source: ABdhPJwDkFoCYggY1gxt7bDTcWLRlh1MKnrt/rA2AHX4t0ASRNBzxtBE4WdNwcsyoyiZN/ZDRw+9M6uyYvI/XuRdFF4=
X-Received: by 2002:a17:90a:902:: with SMTP id n2mr11676752pjn.126.1607668605729;
 Thu, 10 Dec 2020 22:36:45 -0800 (PST)
MIME-Version: 1.0
References: <20201210104747.3416781-1-ikjn@chromium.org> <1607651584.23328.20.camel@mhfsdcap03>
In-Reply-To: <1607651584.23328.20.camel@mhfsdcap03>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Fri, 11 Dec 2020 14:36:34 +0800
Message-ID: <CAATdQgBZn3oehw_20D3yMmDA8G61oMHVax8LqJ-hPQv+9kJGLQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Release allocated periodic bandwidth data from reset_bandwidth()
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, linux-usb@vger.kernel.org,
        Zhanyong Wang <zhanyong.wang@mediatek.com>,
        Tianping Fang <tianping.fang@mediatek.com>,
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

On Fri, Dec 11, 2020 at 9:53 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> On Thu, 2020-12-10 at 18:47 +0800, Ikjoon Jang wrote:
> > xhci-mtk releases allocated TT bandwidth data only when whole
> > endpoints of a device are dropped as there're only {add|drop}_endpoint()
> > hooks are defined. This patchset adds more hooks and releases all
> > bandwidth data from reset_bandwidth() path, not drop_endpoint().
> >
> >
> > Changes in v2:
> > - fix a 0-day warning from unused variable
> > - split one big patch into three patches
> > - bugfix in hw flags
> >
> > Ikjoon Jang (3):
> >   usb: xhci-mtk: code cleanups in getting bandwidth table
> >   usb: xhci-mtk: delay association of tt and ep
> >   usb: xhci-mtk: fix unreleased bandwidth data
> >
> >  drivers/usb/host/xhci-mtk-sch.c | 180 ++++++++++++++++++++------------
> >  drivers/usb/host/xhci-mtk.h     |  13 +++
> >  drivers/usb/host/xhci.c         |   9 ++
> >  3 files changed, 133 insertions(+), 69 deletions(-)
> Thanks for your patch, I'll test it and check it with our DE

Thanks, I will upload v3.
But I don't expect any logic changes from v2.
Can you please give me feedback on v2 if you find anything?

>
> >
>
