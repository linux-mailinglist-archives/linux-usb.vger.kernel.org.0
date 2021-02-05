Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3421731052E
	for <lists+linux-usb@lfdr.de>; Fri,  5 Feb 2021 07:52:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230487AbhBEGvT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Feb 2021 01:51:19 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:48778 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230448AbhBEGvM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Feb 2021 01:51:12 -0500
Received: from mail-lj1-f197.google.com ([209.85.208.197])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1l7uwl-00065h-Uu
        for linux-usb@vger.kernel.org; Fri, 05 Feb 2021 06:50:28 +0000
Received: by mail-lj1-f197.google.com with SMTP id m16so5035277ljb.20
        for <linux-usb@vger.kernel.org>; Thu, 04 Feb 2021 22:50:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jrPFbtDQsFf+eCKFtIVPRYyTFi/LPQugYwt0EUGsKy8=;
        b=WcRP1shIpRDETWCLlT2m0Q/iadQ6P1KS09PgtrKzmeFu/Bk3U1ROtneoZMtYlfsAJX
         LHqdBI/GxqzOGwyryLXWTGqEsUy11bvtK8thkWmqxZYm8IhloWs0aBPofAQYso1Kwq8t
         ESts+NBjmM9y4X4vcaSLdG6pBO/pFw/4wrRNTQfYfZ6RxerajKWf8RCo2TNqalitqDMk
         /IyUEXoHd84sHBCgBCWoN9HkptIhW7Z/We2HuwI+FrkaDnXCExrHhIkc3Lo778SNlDWG
         PXKlT2FiBO3+NGHgvQHdV698itU6a99kamWNk2LgQPK6XmUc2MVWzSM6Pwm0NwNhPI6W
         f2+w==
X-Gm-Message-State: AOAM533bNYqTWaVqqt9lPBVhrlsVhJPVu2EfzKEibzCGkObLVn+SWu4b
        oy30LD+LBGa/y7T9K+5bD3WtRser/twzvO0fhfnIbkj9JqwrH4cGyGpZ+9otL3J4dbmXNdIKPgG
        xGYZmywqC+LG5R/ym1q7UW+3v97zP6sl0QZAYYSPjrog89crFeE+kxw==
X-Received: by 2002:a19:7001:: with SMTP id h1mr1709133lfc.513.1612507827410;
        Thu, 04 Feb 2021 22:50:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzl73IbLy1fwn/PAGrPXI17t3pVODRhmH0RDwiZEA7fC882L644FgBfcoZ6bn4IJEJPdGRUfz1WXaRX2Xl7MK0=
X-Received: by 2002:a19:7001:: with SMTP id h1mr1709116lfc.513.1612507827118;
 Thu, 04 Feb 2021 22:50:27 -0800 (PST)
MIME-Version: 1.0
References: <20210204051850.64857-1-aaron.ma@canonical.com>
 <CAAd53p4euFiw7pfDnD2H8oMVeeTqQ_c+wOFDLM2xPccn5MewiA@mail.gmail.com> <cd4595e6-67da-885c-1a67-6dfd71425b8c@canonical.com>
In-Reply-To: <cd4595e6-67da-885c-1a67-6dfd71425b8c@canonical.com>
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Date:   Fri, 5 Feb 2021 14:50:15 +0800
Message-ID: <CAAd53p4z1ydFi5pwOZJnsrBDPNVLKU0ygqa0+kdZdXWYocPLgQ@mail.gmail.com>
Subject: Re: [PATCH] xhci-pci: Set AMD Renoir USB controller to D3 when shutdown
To:     Aaron Ma <aaron.ma@canonical.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Lee Jones <lee.jones@linaro.org>, peter.chen@nxp.com,
        USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Feb 5, 2021 at 2:45 PM Aaron Ma <aaron.ma@canonical.com> wrote:
>
>
> On 2/5/21 12:27 PM, Kai-Heng Feng wrote:
> > Can you please test the following patch, which should address the root cause:
> > https://lore.kernel.org/linux-acpi/20201201213019.1558738-1-furquan@google.com/
> >
> > It also helps another AMD laptop on S5:
> > https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1912935
> >
>
> No, this patch doesn't help on ThinkPad AMD platform.

Thanks for the confirmation!

Acked-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

>
> Aaron
>
> > We don't need to put bandage on drivers one by one once the patch with
> > alternative approach is in upstream.
> >
> > Kai-Heng
