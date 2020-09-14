Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4EA3268247
	for <lists+linux-usb@lfdr.de>; Mon, 14 Sep 2020 03:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbgINB0V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 13 Sep 2020 21:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgINB0S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 13 Sep 2020 21:26:18 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3249DC06174A
        for <linux-usb@vger.kernel.org>; Sun, 13 Sep 2020 18:26:18 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id q8so11628989lfb.6
        for <linux-usb@vger.kernel.org>; Sun, 13 Sep 2020 18:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p4oMITD+1AXa98qYRU0FQiQqPDEDwmZOf5GmLaoqw8s=;
        b=tP2g/6IHNpGihxg7lr1JIjXf6GTYPL3Qd8ZWgtrsa9hrnrWKO9mlFo05mfrsmxzZw4
         dkD9jQraZoD/DpwtekHYv1piBqeBVhetNPM0bRu17+unw+WmQX+7S50Swzi9U6LDDULS
         8bn3ApXb6ZOqz25bYxp1yo1vzV72AiS1K82apTLEc64PUz3oX1+UZmOC4tMWCERb7ziq
         fnt/c8u+eoITLdSbA/I91yfjpJxR5k3tSeeORq1TgAqoKhS6jG1+aI8JiSylcsu29H6n
         yAaMyd+BQbc3+BL31cuqTLgzfT9agOTLfUO23jblKAS9PqsFi+/1kRpCGQxlvnwuuBxi
         1Ykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p4oMITD+1AXa98qYRU0FQiQqPDEDwmZOf5GmLaoqw8s=;
        b=gF1Hf+ayAdgiGTg/NCfxYmZD8fBhxKPH14tB6I9BAw2IXuNds45sY36d6F0mhEw52C
         WEZSJY93ZswcFTvXD2Wqjo2UidifWcZ9WjbZHduvxvMzbTUM+npygKTvYVEW4gkn/Sj3
         sasFLjfA7q9pW//hlni/8BjZNFuCOE0WLEUfdgc9LuBbl9et9GgR9P0/BBw2K1APTTJa
         9zj4oNS6MMoy4w027YMeSGKzigp0LmRiDHwbb0/k76/BCus0EufCoHv3n6WAAfua63sY
         W+DDofGIaDHJ1pIeE7S6cff5gKfJLFGXufMys8NNzbBW+oilYXuQ2wYcpXnBr3HSUEUx
         I2ng==
X-Gm-Message-State: AOAM530FgsYQIWC14Hglk0XWZY1fqJ/qHxHndi02r2QCYBmdIMQlxZEh
        9Pi28L54PIAGxQcUMqjwqx6SVHh81OZ4CctLxRY=
X-Google-Smtp-Source: ABdhPJwvEGwbhkNN9Ab/ihTnvko+Vrrs7lHZGJ3DysUJMAVT7cqWjKfMIY7PUbisd6CkG/sKTtj5X2HMS8Xk4GSIQNg=
X-Received: by 2002:a19:dd6:: with SMTP id 205mr3259802lfn.228.1600046776474;
 Sun, 13 Sep 2020 18:26:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200901023352.25552-1-peter.chen@nxp.com>
In-Reply-To: <20200901023352.25552-1-peter.chen@nxp.com>
From:   Peter Chen <hzpeterchen@gmail.com>
Date:   Mon, 14 Sep 2020 09:26:05 +0800
Message-ID: <CAL411-o3XX0AdFES_nEVcnniX9dp=3jjRM--VM1zgXYMxW6hmQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] usb: cdns3: misc improvements
To:     Peter Chen <peter.chen@nxp.com>
Cc:     balbi@kernel.org, USB list <linux-usb@vger.kernel.org>,
        linux-imx@nxp.com, pawell@cadence.com, rogerq@ti.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>, jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 1, 2020 at 10:36 AM Peter Chen <peter.chen@nxp.com> wrote:
>
> Peter Chen (5):
>   usb: cdns3: core: quit if it uses role switch class
>   usb: cdns3: gadget: set fast access bit
>   usb: cdns3: gadget: clear the interrupt status when disconnect the
>     host
>   usb: cdns3: drd: call PHY .set_mode accordingly
>   usb: cdns3: gadget: move wait configuration operation
>
>  drivers/usb/cdns3/core.c   |  4 ++++
>  drivers/usb/cdns3/drd.c    |  5 +++++
>  drivers/usb/cdns3/ep0.c    | 10 +++++++++-
>  drivers/usb/cdns3/gadget.c | 15 ++++++++-------
>  4 files changed, 26 insertions(+), 8 deletions(-)
>
> --

A gentle ping.

Peter
