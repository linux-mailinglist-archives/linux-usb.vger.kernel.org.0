Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D242D248C5D
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 19:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727069AbgHRRD4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 13:03:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbgHRRDy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Aug 2020 13:03:54 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B036BC061389
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2020 10:03:54 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id j9so18211225ilc.11
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2020 10:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mw/okGQ9Ng8Osv4lUeHuk6OYxEiSlELA/Wo/ab2YIK0=;
        b=VRvzzP1ToknH0zOVK+loS22535jWTBUXBALtHV1SJPYJCqK8KGFgilWEk9Kf/Zqy64
         aeepV34+Ax628yOi/r0PtV/WBnIOrT/qmeKoQhNalh5Of2yq25raHn1OnpA7H/sgNW6S
         coH2gXk3UMx1nRkVe4IV8TiqlpFyHPJp/isIVML6r9oi8RJgbwNh69/KB7HLHF6Nhpdx
         W+53/d6Apud4yW9nYjk1m1HxEOvfyVqyQqqpcG69ZHbw0xwjuqERO9iYZ+bfpJhe0hrM
         55zIkjbii2vW07cvtpj/lyUww1Pf61aEDvzFLuw6/2l6VgMr9MPdGygfPGBn/bDNiZDG
         KhAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mw/okGQ9Ng8Osv4lUeHuk6OYxEiSlELA/Wo/ab2YIK0=;
        b=Pul3x/05D7kAhnEaS53sMDn/yUkWzRccxGDirFaZg4iRFoX/QQLM6B7Nfia4XNEznt
         IAdUDB45UZ01ZgO3jHK9eQM2fN56525DtBh6UA9x0wz8I+zbqbPQ7nKg9kchGhPeq3Wa
         pbMxzhbKiwG15cOfV/suzziI4ngT//1xswRR60h/pu3Hyh08Cf+XWEgln4FwJyOHe0Zo
         sltO038gqHpWB3gFzGZ/Rt+1bogtmmlotZwd8xBBKXmPwL2KeBFCP0SancSN0hyCx3p3
         ac6YWbGkN/b3Xhw8c+3vkdb2oerQkHtj0AA0n7ktkTRP0zWZAoUWxX9IGO/lAOptyof2
         tOCw==
X-Gm-Message-State: AOAM531ihXCZ9cuAUA0i9J7wO0ceSEaQg+yZ4wesyGnAxCkzIL9RuEA9
        rKPaTY0xFXLGCR2Nz54zwD2faPO5XZN5/jC3F/vLwg==
X-Google-Smtp-Source: ABdhPJxOcG4WUb3AzMR4MfDBpVnfdJSHTWAECU1yw6Sj5CYQOuzkWw3pLZgPZOG7Q9grVtifRQMz7/+oeWIe1gI5vZE=
X-Received: by 2002:a92:d089:: with SMTP id h9mr15990503ilh.60.1597770233684;
 Tue, 18 Aug 2020 10:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200805075810.604063-1-lorenzo@google.com> <87mu39tmu6.fsf@kernel.org>
 <CAKD1Yr17hFju=xvDHWWcLjwj=nuSBBVJn9xQ5ocHHXQm6PAw_A@mail.gmail.com> <87ft8lzalp.fsf@kernel.org>
In-Reply-To: <87ft8lzalp.fsf@kernel.org>
From:   Lorenzo Colitti <lorenzo@google.com>
Date:   Wed, 19 Aug 2020 02:03:42 +0900
Message-ID: <CAKD1Yr2niaigsksT-_w=G=2UzGf+T2wTgBtF6COVv23PGE8Btg@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: f_ncm: allow using NCM in SuperSpeed Plus gadgets.
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <zenczykowski@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 17, 2020 at 10:05 PM Felipe Balbi <balbi@kernel.org> wrote:
> >          /* Calculate bMaxBurst, we know packet size is 1024 */
> >         max_burst = min_t(unsigned, FSG_BUFLEN / 1024, 15);
> >
> > so perhaps this is fine to do in NCM too? If we want to set bMaxBurst
> > to 15, should that be in this patch, or in a separate patch?
>
> yup, should be fine. A separate patch is okay too :-)

Thanks. Bumped up existing SS descriptors to 15 in a separate commit,
and amended this commit (with the SSP descriptors) to use 15 as well.
