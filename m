Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF163C7BCB
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jul 2021 04:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237628AbhGNCaf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jul 2021 22:30:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237621AbhGNCaf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Jul 2021 22:30:35 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C28D9C0613EE
        for <linux-usb@vger.kernel.org>; Tue, 13 Jul 2021 19:27:43 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id h9so617587oih.4
        for <linux-usb@vger.kernel.org>; Tue, 13 Jul 2021 19:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FKr65vfR2TdVe8GBpKpEMCo3zswr0/dtqzTR9ciGq6A=;
        b=uoBMWDRKB2h5zkZgtNGjB5PUPYoGSOLtb3zF4sUvR2vepVPa1PFSMQpuOZMtsNSMF5
         Hzt5PAC4Ae4rtH3smb6oPZAjFy7mh1HuAQ8xAB79NBCW54xVS0DQMIV0mPtbvwlqJXGj
         ztHfmUKpK4Pr+PryEJH3QJWnCmFdsZUoM3TbuD+XrmZmzNG7Ryz6nkKixeQYSallRYsn
         BmV7MG1ULrw8rNkFguVubx17Sf4FNw0XqVwmqVFmClOc6/Lm2Js6fgMMXmLT9GXkXKHl
         3cbmOrvpLvXMDQVEDlISNIlIaLHB5Fj4qBjWSOKwBJKvXjLuE8R3MsUzp5hS3MQNzsVF
         R1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FKr65vfR2TdVe8GBpKpEMCo3zswr0/dtqzTR9ciGq6A=;
        b=FWQ3HtaJlc7a/jxNse5yM4k+X446DpbivS/OPUD0DXZs28f6GitgebW2ax2wcVZNFg
         A6Kf9wjWpos+wxCP93zFhDarIXCGT/tNb5dUZ3WtuBPhwH7CfUEi7qvFiz10B2pLM8PF
         Ofk7Xdia1z7b041v7upR09xpj2YM0bMl8l4ZmSCyWCozZHMjhwndzdN4SqkTBhCTQ6Jt
         xgehkYMZiQF2v01QukdOCWa6GTWyr8Y07q2Rja7hUNqT1aQJYRIFMsHOs4AeMrvWlEix
         JNEfJ2e+pK2fXBtNBPluhstttIXJJjVipxn0UWLzNA5m7UvJq+LBvYO3pWeBfnCAxLUX
         oZ3A==
X-Gm-Message-State: AOAM530vzzyqESdDGUrlpGHfKmRgEYFZt1rXjHuspd2ManXohHp/IGT1
        om3wUYZIrumnG35i3tYxG3MNOg==
X-Google-Smtp-Source: ABdhPJz/ytXCZ8BRBiVtna/vi/6ubcxZ+G6RnZaRINMM7ogFKSWmRMxswDIcrHAlc372iWrarNnkiQ==
X-Received: by 2002:aca:3d8a:: with SMTP id k132mr1058697oia.120.1626229663063;
        Tue, 13 Jul 2021 19:27:43 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v7sm172544ooj.46.2021.07.13.19.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 19:27:42 -0700 (PDT)
Date:   Tue, 13 Jul 2021 21:27:39 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Amit Pundir <amit.pundir@linaro.org>
Subject: Re: [PATCH 29/29] arm64: dts: qcom: Harmonize DWC USB3 DT nodes name
Message-ID: <YO5Lm0zMEEP5uSSl@yoga>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
 <20201020115959.2658-30-Sergey.Semin@baikalelectronics.ru>
 <CALAqxLX_FNvFndEDWtGbFPjSzuAbfqxQE07diBJFZtftwEJX5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALAqxLX_FNvFndEDWtGbFPjSzuAbfqxQE07diBJFZtftwEJX5A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue 13 Jul 19:07 CDT 2021, John Stultz wrote:

> On Tue, Oct 20, 2020 at 5:10 AM Serge Semin
> <Sergey.Semin@baikalelectronics.ru> wrote:
> >
> > In accordance with the DWC USB3 bindings the corresponding node
> > name is suppose to comply with the Generic USB HCD DT schema, which
> > requires the USB nodes to have the name acceptable by the regexp:
> > "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
> > named.
> >
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> I know folks like to ignore this, but this patch breaks AOSP on db845c. :(
> 

Sorry, I totally forgot that the name of that node is part of the USB
gadget configfs interface.

> In the exact same way an earlier patch broke HiKey960:
>   https://lore.kernel.org/lkml/CALAqxLWGujgR7p8Vb5S_RimRVYxwm5XF-c4NkKgMH-43wEBaWg@mail.gmail.com/
> 
> (which I still have to carry a revert for).
> 
> I get that this change is useful so more dynamic userland can find
> devices using consistent naming with future kernels (but doesn't the
> dynamic userland have to handle the case for older kernels as well?)
> But for userland that uses static configs, its painful as updating
> userland to use the new node ids then causes older kernels to fail.
> 

It won't help you, but having a mechanism to provide user friendly names
would certainly be welcome. I always struggle with the question of what
"6a00000.dwc3" (now .usb) actually is...

> I'm looking into how we might be able to probe and set the property
> dynamically, but AOSP's init system is far more aligned to static
> configs.
> 
> This will probably be ignored again, but it would be nice if we could
> have a release where DTS changes don't break userland for one of my
> boards. As it feels like its been awhile.
> 

I don't have any preference to this being names "dwc3" or "usb" and we
could back out the change in time for v5.14. But you will still have the
problem for Hikey iiuc and the dts would then violate the binding - so
we need to fix that, and all the other Qualcomm boards defined by the
same binding.

Regards,
Bjorn
