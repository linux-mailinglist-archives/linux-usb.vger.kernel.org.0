Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8003F265F
	for <lists+linux-usb@lfdr.de>; Fri, 20 Aug 2021 07:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235411AbhHTFQt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Aug 2021 01:16:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233925AbhHTFQr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Aug 2021 01:16:47 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FF27C061756
        for <linux-usb@vger.kernel.org>; Thu, 19 Aug 2021 22:16:10 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id k29so12295222wrd.7
        for <linux-usb@vger.kernel.org>; Thu, 19 Aug 2021 22:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rtst-co-kr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=eVh1i+oDLelffdg2LPqkDO7S0K0T59aI3kSY34NsMtQ=;
        b=aTr34ddIKsEZCutcib30lOaEQ3OK5yvRC6YW9VFutLoTt0q2BL0mxkgauMQa1AU8p9
         xMEMypgywI2X4jDQ0o89c7lDWN3WdKu/gyO1oArODYf9rYoOyAssIt5GS+9eCeBqxiXW
         GTdKYwjPYs0N3udZVs8SRtpf38u14SopC22lC2DSe892MwxMG8mt337tpWKKkmSskTZg
         4VzRbWA28oSPME9XdvnyfIc7iCvx2dxr/42rYVqfhmhx1MB5NDpjgEyzEaDfjzE32T2m
         XCNe4e1YB0vZUtc50ssj22SgKJsnM79sCVidkspUXPFDiYh8hSSo38+3J8o+pYD6oSUy
         pBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eVh1i+oDLelffdg2LPqkDO7S0K0T59aI3kSY34NsMtQ=;
        b=sgEyLSLUbJGYJIg+LlwOuFJOveCjdmm2qhPxvKaunZRTj7QFXctgC/+6EmgAL8yrAa
         SwmLvRv6Me9/SWlICUTYMreYIUc7spmR0klXBCZk/VfQ4TPVnayQ8Uy4owf+FYYrXEBu
         mtiZLRIiS+sub5Y7FkXdqwHJMHaXRbYdDpfRfX7B5UqzDuDxbWQXbI4uNt69Hc26ziMa
         9XlkSalEGrSGPRSuMkf2WNQaCJsTskNk5EsVKpV8m+wmKrt9VVW8OFo2XNvNx9zqh2wv
         Gw4cC/XSpHUn+dIooiz2Nj8JfMVNPuateEIGoBRUnHuLMmYsVwL5z9TmdYtMDQ1zHsvz
         rWBw==
X-Gm-Message-State: AOAM533/12jDzVEpOBLhQYdLLH1IaThm5ecEcRsMv0MTMI3jzddGuOgW
        QDz6Sr6NJ1HSPkscjThy0bHCSLalIlc6RmEbEEXJGg==
X-Google-Smtp-Source: ABdhPJwfQEsV75S1lBJjSVxorUj0NVdZ2nxEJ8iZou3pJhGCqSg7LrdP9gVv5hl8OYQTRZ6rfIF0re33jkA282nENVI=
X-Received: by 2002:adf:e7d1:: with SMTP id e17mr7613520wrn.151.1629436568680;
 Thu, 19 Aug 2021 22:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210817095313.GA671484@ubuntu> <20210818161752.vu6abfv3e6bfqz23@linutronix.de>
 <CAJk_X9h_GqUyir7oG33pFrLgknj7DZfd6esiKb07w7QWjZqX0g@mail.gmail.com> <20210819084759.stnmit32vs2be46m@linutronix.de>
In-Reply-To: <20210819084759.stnmit32vs2be46m@linutronix.de>
From:   Jeaho Hwang <jhhwang@rtst.co.kr>
Date:   Fri, 20 Aug 2021 14:15:55 +0900
Message-ID: <CAJk_X9gyWch6Z1=hbe2vvqGu61mdavAU62+6dSka0tZoMzxu5Q@mail.gmail.com>
Subject: Re: [PATCH v2] usb: chipidea: local_irq_save/restore added for hw_ep_prime
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-rt-users@vger.kernel.org, Linux team <team-linux@rtst.co.kr>,
        =?UTF-8?B?67OA66y06rSRKEJ5ZW9uIE1vbyBLd2FuZykv7J6Q64+Z7ZmU7JewKUF1dG9tYXRpb24gUGxhdGZvcm0=?=
         =?UTF-8?B?7Jew6rWs7YyA?= <mkbyeon@lselectric.co.kr>,
        =?UTF-8?B?7LWc6riw7ZmNKENob2kgS2kgSG9uZykv7J6Q64+Z7ZmU7JewKUF1dG9tYXRpb24gUGxhdGZvcm3sl7A=?=
         =?UTF-8?B?6rWs7YyA?= <khchoib@lselectric.co.kr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

2021=EB=85=84 8=EC=9B=94 19=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 5:48, S=
ebastian Andrzej Siewior
<bigeasy@linutronix.de>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On 2021-08-19 08:50:27 [+0900], Jeaho Hwang wrote:
> > Without RT, udc_irq runs as a forced threaded irq handler, so it runs
> > without any interruption or preemption. NO similar case is found on
> > non-RT.
>
> I see only a devm_request_irq() so no force-threading here. Booting with
> threadirqs would not lead to the problem since commit
>    81e2073c175b8 ("genirq: Disable interrupts for force threaded handlers=
")
>

I was wrong. udc threaded irq handler allows twd interrupt even on
non-RT and with threaded irq.
I believed Chen's comment "The function hw_ep_prime is only called at
udc_irq which is registered as top-half irq handlers. Why the timer
interrupt is occurred when hw_ep_prime is executing?".
We have additional experiments and got the results like below. RNDIS
host was Windows.

RT, 1ms delay between first ENDPTSETUPSTAT read and priming : error
case occurred
RT, 1ms delay + irq_save : no error case occurred.
non-RT, threaded irq, 1ms delay : no error case occurred even twd
fires inside the function execution.

It doesn't seem to be a timing issue. But irq definitely affects
priming on the RT kernel. Do you RT experts have any idea about the
causes?
If isr_tr_complete_handler fails ep priming it calls _ep_set_halt and
goes an infinite loop in hw_ep_set_halt. It was an actual problem we
experienced.
So we protect irqs inside hw_ep_priming not to make error cases and
also add a timeout inside the hw_ep_set_halt loop for a walkaround.
The timeout patch is submitted to linux-usb.
( https://marc.info/?l=3Dlinux-usb&m=3D162918269024007&w=3D2 )

We withdrew this patch since we don't know if disabling irq is the
best solution to solve the problem and udc would work fine with
hw_ep_set_halt walkaround even though hw_ep_prime fails.
But we are still trying to find out the cause of this symptom so We'd
so appreciate it if RT or USB experts share some ideas or ways to
report somewhere. Xilinx doesn't provide any support without their
official kernel :(

Thanks for the discussion Sebastian.

Jeaho Hwang.

> =E2=80=A6
> > > If this function here is sensitive to timing (say the cpu_relax() loo=
p
> > > gets interrupt for 1ms) then it has to be documented as such.
> >
> > The controller sets ENDPTSETUPSTAT register if the host sent a setup pa=
cket.
> > yes it is a timing problem. I will document that and resubmit again if
> > you agree that local_irq_save could help from the timing problem.
> >
> > Thanks for the advice.
>
> If it is really a timing issue in the function as you describe below
> then disabling interrupts would help and it is indeed an RT only issue.
>
> So you read OP_ENDPTSETUPSTAT, it is 0, all good.
> You write OP_ENDPTPRIME, wait for it to be cleared.
> Then you read OP_ENDPTSETUPSTAT again and if it is 0, all good.
>
> And the TWD interrupt could delay say the second read would read 1 and
> it is invalidated. Which looks odd.
> However, it is "okay" if the TWD interrupt happens after the second
> read? Even if the host sends a setup packet, nothing breaks?
> Do you have numbers on how long irq-off section is here? It seems to
> depend on how long the HW needs to clear the OP_ENDPTPRIME bits.
>
> Sebastian



--=20
=ED=99=A9=EC=9E=AC=ED=98=B8, Jay Hwang, linux team manager of RTst
010-7242-1593
