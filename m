Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83324252883
	for <lists+linux-usb@lfdr.de>; Wed, 26 Aug 2020 09:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbgHZHkx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Aug 2020 03:40:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbgHZHkx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Aug 2020 03:40:53 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0AC3C061574
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2020 00:40:52 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id g6so1182793ljn.11
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2020 00:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0yuLEsvL+B9cR+5AOulF3DN6du/5xThYBJtyxEcSuto=;
        b=D16gnqXzQQoFUUiXU7/4/nQwDInWkAzy2icvNsCNeQLAOimIIj31fUYJsvH+RhO6yv
         +ozDL6JxOvb9wPULkNfSC0CbLS+n5QcXmOyahAzuTZGsgSSp++OA7yy/eNiVddVlq7yQ
         SAZmSDXUzHxLjWVJYjwMJVettaV/zJ01NFa4N/u2NqYtMg94pZMbSPVOmAcYg4x/Uog3
         8/vXNX8Hax47wlTjRDKHDgh776OUT53Es1oSw5DFsQ+Xj19840FZOisK4zCN9woBdjci
         +lbWBFoTIGAjpN/36QrFXyyP33BhgQGbDTo6pAM327u8qbIYe9RYZ0m+KIBV0c2SC/mB
         7OQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0yuLEsvL+B9cR+5AOulF3DN6du/5xThYBJtyxEcSuto=;
        b=FrKBwzilj8hcN21vv59U2/h853Fj5ilMTiI31vwpWExe1mCFuesATm2JIgpxowqXR1
         fp6f9SlnFmRT1o2EBjmeYwcSxFCHK4xYEP/PHqhktSNIPob0iqYga43uuJ6N5NK0edra
         VMRhcoOS8trMIH8sV0TQ9w76U0olC6PcpZO3oWFgEHOuCROa1eM2x8hufsZG9XfD8Oiw
         ZQULwYHoGbYxGylyjS43gDnr8+0FjLi65skk6hbuF+6vBd1Cew8husqah07v65MAXe9q
         kCwMhYQHdh0qBDlPhADhbpDFr61cp0NfFbYh7shbmGRuxyqTnHt7iyV5KlQzjpP2fVY1
         +s+Q==
X-Gm-Message-State: AOAM531bkD9m82eMGFuMT1x6mXgbfEatp58NDZIsXLhQXLVKXTBp6ZUB
        JWinEHlkZHfqAgK02Q7N07pfBSeAr66qxi10dlr4kpNSvKQ=
X-Google-Smtp-Source: ABdhPJxGG7ZzY0HHbMBy5cxNi8L4f5tWFC6F1YEzC+Rte4zUj06XkVrPHMsYTis9vFduqa/mqdwA1Mzbw/BSrSKt7IU=
X-Received: by 2002:a05:651c:555:: with SMTP id q21mr6250418ljp.6.1598427649921;
 Wed, 26 Aug 2020 00:40:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAL3BvCzb6dGZOm6jy2PddSfioM7hThMEBm+aQ_gmMAWAXFYOuQ@mail.gmail.com>
 <20200821160321.GA256196@rowland.harvard.edu> <CAL3BvCyz3W+aRu0e=RE3teaMMh6KDYxu8NbFicY07Xt-=f9Whg@mail.gmail.com>
 <20200821170106.GB256196@rowland.harvard.edu> <d11a91f5-2bb8-01ce-c8b8-4512a2cf2793@linux.intel.com>
 <CAL3BvCyxTvfUjecoYO0ie1vt4_+1cad+8Dt=xmcXogZSooGj+A@mail.gmail.com>
 <cbdfafed-b8d4-ca07-bde1-4598f5117f04@linux.intel.com> <a66ea20a-5406-ed31-e607-08552598ed68@linux.intel.com>
 <CAL3BvCzsAZjt23XjD-9T2JyUtLFPLB0prKn3Bw3nC4AC1nTbgA@mail.gmail.com> <9017830d-a4d2-66d5-6b42-b1162856ef90@linux.intel.com>
In-Reply-To: <9017830d-a4d2-66d5-6b42-b1162856ef90@linux.intel.com>
From:   Martin Thierer <mthierer@gmail.com>
Date:   Wed, 26 Aug 2020 09:40:34 +0200
Message-ID: <CAL3BvCzKdRAVNMgG2do1D_QgKnR_x+P-uBuv3-kPMi7z6iabwQ@mail.gmail.com>
Subject: Re: Data toggles not reset on "set configuration" for ports handled
 by "xhci_hcd" driver
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Here's a second version.
> I'm again not able to test this at all from my current location, so it might fail because
> of some silly mistake, but it compiles..
>
> This version keeps endpoint pointers intact until endpoints are dropped from hcd side,
> it also removes the recover path (might need to fix one later)

Thanks, that seems to work! (Judging by the absence of my original
issue with the xum1541 adapter; I haven't checked what's actually
happening on the bus).

Martin
