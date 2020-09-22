Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 162C1274231
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 14:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbgIVMjL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 08:39:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726505AbgIVMjK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Sep 2020 08:39:10 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DCBBC061755
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2020 05:39:10 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x123so12309823pfc.7
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2020 05:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WH4Bc3lzXmUOZ58kpfwYVa6iGcv0NXEpT1/BrmJMMB0=;
        b=jWNmMm/HBah0Ndc1hI4157dm98Ht18ewLNouhREFEKDVuljNuu9jmLVrWa8eonrGbE
         vDFVCRAAbR3E2aZtMuLNmSukbbbxI5eQTqsz8vsEc0kl37LHNLCPek37NGI1eRz9pwtk
         IE0zhqhkmc2IXolNPhhej3eJZD5DoQnfRB7lweED7HpLbwWx/sX+hiJrh9nsCQOa6TcK
         eXnBn0N5DjztP2s6MOm3fZUZU0AbpIHwiZLmzMT61n2tbPhhmNFF0OeyjOaNeSengZM6
         /bDzPhHyyyYgBiMw4YrkXd7EY3jxm8h0q+LDcyhhkjOAP6k3lzkP1Ke6qeMN1CFqo8t9
         pVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WH4Bc3lzXmUOZ58kpfwYVa6iGcv0NXEpT1/BrmJMMB0=;
        b=Tx3CkGt6Uxar4nUZ1CHgO5dXPGvm8566DKSlzy5dA9u/8blrcgs2grdPg85DL0uEPi
         Q7JPHT3a+hwS3jS/OYmqxFjaofyTiWKO1hyNaarlbCvmU42arn/rqqurI7Ay+20sU+0I
         +NAsA2PLUpE6HuB6fFdr+95rFmKGKu6Egxr4qpSN7cvzrDHSgMSgTZOMuqqx4y44zGNM
         erdPjdnKlbLQTfzAkFgo5EVM6sYusAsffEYKcw+nSuLDfQioyBc0AZXLH9MkWgtfcqmN
         te1PODVIDWWlmtynMPtpNRqoY+obaSOYSsoLGBYBjbsYxOkEXHBQKJhIEiUS5STtlwep
         BrEw==
X-Gm-Message-State: AOAM532TtqeRvSxBT1tCf2/nBRvoOnC8tIs79qaH45bnGNjZ6nAiWgAo
        ePJrEy95/hUhpZD+4u544/od6Lf4IJm2P8Mit6y0+y3pbdY=
X-Google-Smtp-Source: ABdhPJwL7BPs5JARKRspIKqqOXp1/+Vo4q1Q9zeAPTALHmmJHFdMZpPSrdg2bv1Na7EWjIv1uOO8Nmt2NxDNuAYLAG8=
X-Received: by 2002:a17:902:b117:b029:d1:e5e7:bdf5 with SMTP id
 q23-20020a170902b117b02900d1e5e7bdf5mr4207059plr.85.1600778349805; Tue, 22
 Sep 2020 05:39:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200922110703.720960-1-m.v.b@runbox.com>
In-Reply-To: <20200922110703.720960-1-m.v.b@runbox.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 22 Sep 2020 14:38:58 +0200
Message-ID: <CAAeHK+wVjRiphvYPSH0QT4XZj+rvDzvepQQCupgBJq2BfeNgVA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Fixes for usbip and specialised USB driver selection
To:     "M. Vefa Bicakci" <m.v.b@runbox.com>
Cc:     USB list <linux-usb@vger.kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        syzkaller <syzkaller@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 22, 2020 at 1:07 PM M. Vefa Bicakci <m.v.b@runbox.com> wrote:
>
> Hello all,
>
> This is the third version of the patch sets originally published in the
> e-mail thread thread at [1]. As mentioned in the same e-mail thread with
> the e-mail at [2], I was able to find a more acceptable solution to the
> issue reported by Andrey Konovalov, where usbip takes over the
> dummy_hcd-provided devices set up by the USB fuzzing instance of the
> syzkaller fuzzer.
>
> In summary, the approach involves:
>
> * Removal of the usbip_match function.
> * Fixing two bugs in the specialised USB driver selection code.
> * Accommodating usbip by changing the logic in the specialised USB
>   driver selection code, while preserving legacy/previous behaviour.
>
> I have tested this patch set with Greg Kroah-Hartman's usb-next tree
> based on v5.9-rc6 with the base commit mentioned below in this e-mail,
> and I can report that usbip works as expected, with no regressions in
> the usbip_test.sh self-test suite output compared to v4.14.119. I have
> also verified that the apple-mfi-fastcharge driver is correctly used
> when an iPhone is plugged in to my system. Finally, I can report that
> Andrey Konovalov's "keyboard" test program making use of dummy_hcd,
> found at [3], also works as expected.
>
> I would appreciate your comments.
>
> Thank you,
>
> Vefa
>
> [1] https://lore.kernel.org/linux-usb/CAAeHK+zOrHnxjRFs=OE8T=O9208B9HP_oo8RZpyVOZ9AJ54pAA@mail.gmail.com/
> [2] https://lore.kernel.org/linux-usb/9f332d7b-e33d-ebd0-3154-246fbfb69128@runbox.com/
> [3] https://github.com/xairy/raw-gadget
>
> Cc: Bastien Nocera <hadess@hadess.net>
> Cc: Valentina Manea <valentina.manea.m@gmail.com>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: <syzkaller@googlegroups.com>
>
> M. Vefa Bicakci (4):
>   Revert "usbip: Implement a match function to fix usbip"
>   usbcore/driver: Fix specific driver selection
>   usbcore/driver: Fix incorrect downcast
>   usbcore/driver: Accommodate usbip
>
>  drivers/usb/core/driver.c    | 50 ++++++++++++++++++++++++------------
>  drivers/usb/usbip/stub_dev.c |  6 -----
>  2 files changed, 34 insertions(+), 22 deletions(-)

Hi Vefa,

This fixes the issue that I've been having.

Tested-by: Andrey Konovalov <andreyknvl@google.com>

for the series.

Thank you!
