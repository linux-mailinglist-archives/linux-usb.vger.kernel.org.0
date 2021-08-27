Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05E473F9953
	for <lists+linux-usb@lfdr.de>; Fri, 27 Aug 2021 15:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231623AbhH0NEW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Aug 2021 09:04:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231271AbhH0NEV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Aug 2021 09:04:21 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3718C061757
        for <linux-usb@vger.kernel.org>; Fri, 27 Aug 2021 06:03:32 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id g138so3832022wmg.4
        for <linux-usb@vger.kernel.org>; Fri, 27 Aug 2021 06:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:content-transfer-encoding:date:message-id:from:to:cc
         :subject:references:in-reply-to;
        bh=pmsF4syJr7747mwgPXPsm0mLWfEWAKqzYbyDHqdjfcw=;
        b=MUDO3wH2jaM0xqiCiKYsMiPGOb5bTw+sJaj2ckYh2ytrhHPZNvO7qOv3CGx0ByV5BT
         kNYMByUESrJX4cfIFWXY+V6qyzPSiNe2m0UgMAfWryDY5AUM+Cv6lHvxQ5nQ3qjXI0H4
         OjiOxmPskU0NpYjaxemCgSRQdaxDYgqijDQ3OeIDTwTL+CAHLkgAN551sxU8mmAkaB0l
         MHMhpoQNv4AUlf3wct+8s7LsewfoXY06i3qL9ZSU5uQanTjFE6ngHC/009hgBtxBExNh
         IlSdMNSHJWPf+ud8hOBybd6jtYxzW3tHEJIRq1Kp92yRpM5cQ4bXRMwZcLYMwI93ezRq
         DiEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:from:to:cc:subject:references:in-reply-to;
        bh=pmsF4syJr7747mwgPXPsm0mLWfEWAKqzYbyDHqdjfcw=;
        b=mwcd1rZfkPiRl6sAEENMoIf06padhmtSp521Wtf1BpCbNZu0602JHa1YyJ5OW40d0g
         c++5zZIM6RyKg/AwxtCeFaaeAWgJMkwU8hpzEYmyVnWTjWfS2lBtzpY3lhryaTnA+KnA
         UVJ9QPgWCE3OMt3cZl0g6coa1iGS2pI6tjSy4c2/50UhN0aMRMcducZ+N6+jw8oKEyL3
         Nw0GFM7lQIkh8QtGisOmtH/JNW6dkTyiq/bCViufklMt0VLdyUUFySDyI13koTn4D4vd
         3KXyPBNldcNxDHqVpc26BQEAv/108EICEhZTxEGFN+7jZZmRmAGpahjUI5K1Yzu3ZhDF
         2/NQ==
X-Gm-Message-State: AOAM5313x834q8GjRR4d1Vgmz6u/T3Lj2QF941qnAhH35IreXP2Y+g3L
        T4pEy1LiVz0rblAkT9ZdPVAgAmKXrrjUYw==
X-Google-Smtp-Source: ABdhPJzr4nZOOjJMNfMroARyvbVaLw8CszKQfilY9Zi9jjIDl0sygitB6J8Vp8iDujqzMLxLlLuljQ==
X-Received: by 2002:a7b:c922:: with SMTP id h2mr19640431wml.186.1630069411261;
        Fri, 27 Aug 2021 06:03:31 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id n3sm5922841wmi.0.2021.08.27.06.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 06:03:30 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 27 Aug 2021 14:03:29 +0100
Message-Id: <CDUBDOZHL5NC.2DP7OD0R936NH@arch-thunder>
From:   "Rui Miguel Silva" <rui.silva@linaro.org>
To:     "Dietmar Eggemann" <dietmar.eggemann@arm.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 0/5] usb: isp1760: arm tc2 board isp1761 fixes
References: <20210827082112.4061086-1-rui.silva@linaro.org>
 <f9f1ceb6-6db5-8ef1-944d-381bdf65599a@arm.com>
In-Reply-To: <f9f1ceb6-6db5-8ef1-944d-381bdf65599a@arm.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi  Dietmar,
On Fri Aug 27, 2021 at 12:15 PM WEST, Dietmar Eggemann wrote:

> - deggeman@gmx.de
> + dietmar.eggemann@arm.com
>
> On 27/08/2021 10:21, Rui Miguel Silva wrote:
> > Hi,
> > Dietmar complained that the latest changes to this driver
> > broke booting his Arm TC2 board [0]. I did not have one of
> > that boards but Dietmar provided out of band help trying to
> > debug the issue, many thanks for that.
> >=20
> > Meanwhile, yesterday I could get access (remotely) to one of
> > TC2 board and manage to fix the issues that were breaking
> > this to work on that system.
> >=20
> > This is rebased on top of the latest (this evening)
> > usb-testing/(this morning) usb-next. If, and I am sure it is
> > too late to include in to 5.14, it should go to the first
> > 5.14.y stable with this tag:
> >=20
> > Fixes: 1da9e1c06873 ("usb: isp1760: move to regmap for register access"=
)
> >=20
> > Thanks again Dietmar for reporting and your help.
> >=20
> > Cheers,
> >   Rui
> >=20
> > [0]: https://lore.kernel.org/linux-usb/11ed5458-4b88-ad72-4497-89ff9346=
a40b@gmx.de/
> >=20
> > Rui Miguel Silva (5):
> >   usb: isp1760: fix memory pool initialization
> >   usb: isp1760: fix qtd fill length
> >   usb: isp1760: write to status and address register
> >   usb: isp1760: use the right irq status bit
> >   usb: isp1760: otg control register access
> >=20
> >  drivers/usb/isp1760/isp1760-core.c | 50 ++++++++++++++++--------------
> >  drivers/usb/isp1760/isp1760-hcd.c  | 33 ++++++++++----------
> >  drivers/usb/isp1760/isp1760-regs.h | 16 ++++++++++
> >  drivers/usb/isp1760/isp1760-udc.c  | 12 +++----
> >  4 files changed, 65 insertions(+), 46 deletions(-)
>
> Works fine on my TC2 too. Thanks!
>
> Tested-by: Dietmar Eggemann <dietmar.eggemann@arm.com>

Great, ...
>
> Maybe you can change as well to:
>
> Reported-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
>
> I used the wrong email address last week.

Ok, I will spin a V2 with the test tag and with the email changed.
Thanks for your time.

Cheers,
  Rui



