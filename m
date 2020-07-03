Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4357213208
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 05:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbgGCDIr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 23:08:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725915AbgGCDIr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jul 2020 23:08:47 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E34D9C08C5C1
        for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2020 20:08:45 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id n24so23480485otr.13
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2020 20:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=a1Dmjf3CNiNUYzR3pGrWU6oYBj18GRfQ00iBbm82VFQ=;
        b=N/0Rqw2V9siONOYGP3p7k7Sh4p7vXiEhMv0pPPaZvDFspGbMux94/6YPKS9vriL2tW
         /W5vl8k5SPD6lOJLUJPrpADj76k3AcShr6Jbo1pc3AP0yVZRJpEO5Y3gmbUGC7ps+hOO
         URdWPpS73fqsbeS7OUCStnpvUqLCVi799AouKloO4L4Uq+frQagJK3bCKDxjTODhhz1/
         D53D0XTsV7B1LHQgjYVR3U6JxDsGQLjaQ9c+yFR5x390qi4XHyII9qflgVlGJTD+LmbI
         q518yTlAn6E1NCzDmgO22/Zp7YBoJ6zjpLI/Kf79RdWHca36LXelYuyDkjlcBCA3TEQj
         iXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=a1Dmjf3CNiNUYzR3pGrWU6oYBj18GRfQ00iBbm82VFQ=;
        b=trYvjAFM49AiLvuhMTcQuycKeR3Zb+ZRXddAwg7NnZH4/8WrWfY8g/YbV4oE9KP1JU
         pC7tO1RSq1uh2mkwyIb7sP9ryzxxYZYkTim+uZhW1O5qYBACBqC4DD7u0vMlTCzdaxyo
         ENgHRXxzXWHM0DerysmDEnq8kAQBDa3eeRzAaiAd7qaAMqL1Uva1SzwfqqdyaF/lXFEX
         VA51B6PXVpkP4yhGUXMJENygy4XYmtx9ZGxw+/AYq+ubMleD655/5HMLG7zhjhQoP0m6
         GpcPwbIdkGL4R6brWXTR2pRZZzLc5MvEEM8rhytyIMSBIHQJzkK3onXDW8wG0U2mqogU
         z4FA==
X-Gm-Message-State: AOAM533xaeKmfux+/KeRX61j83MTIjcZhHdB2fdnRyBYJBhbnQjs1/a/
        ukoYwL2oEptKSgwcQkMEAhbpkxSLv37h4qcy8lvWBw==
X-Google-Smtp-Source: ABdhPJxU5A1fsw1LmTTG7p8vyYeRdFo2AzNnKplZhyN5vQIt2Gz3+fy0z+vNm3fX8jNuK3NXEAT5Bc6+LJ0AScr+2SU=
X-Received: by 2002:a05:6830:1e13:: with SMTP id s19mr30827897otr.102.1593745724825;
 Thu, 02 Jul 2020 20:08:44 -0700 (PDT)
MIME-Version: 1.0
References: <CALAqxLWAvvHGo1RYef1fJ_k65WqHAPCDhLfehO6_j_f8E2jB7Q@mail.gmail.com>
 <CAKgpwJV3pF0x6X6eUPVu4PnicTKta9qTQGsbaAZQ1rznZhkeLw@mail.gmail.com>
In-Reply-To: <CAKgpwJV3pF0x6X6eUPVu4PnicTKta9qTQGsbaAZQ1rznZhkeLw@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 2 Jul 2020 20:08:34 -0700
Message-ID: <CALAqxLWSj+cXg3Oi+HH3DobhtZRiXQ_LeiWS8CLkR3E2v5A20Q@mail.gmail.com>
Subject: Re: dwc3 inconsistent gadget connection state?
To:     Jun Li <lijun.kernel@gmail.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Tejas Joglekar <tejas.joglekar@synopsys.com>,
        Yang Fei <fei.yang@intel.com>,
        Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
        YongQin Liu <yongqin.liu@linaro.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Thinh Nguyen <thinhn@synopsys.com>,
        Linux USB List <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 2, 2020 at 7:55 PM Jun Li <lijun.kernel@gmail.com> wrote:
> John Stultz <john.stultz@linaro.org> =E4=BA=8E2020=E5=B9=B47=E6=9C=883=E6=
=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8A=E5=8D=885:46=E5=86=99=E9=81=93=EF=BC=9A
> > I was curious if you or anyone else had any thoughts on how to debug
> > this further?
>
> If you force your gadget to be USB2(e.g. in dts)
>
> +       maximum-speed =3D "high-speed";
>
> will you still reproduce this issue?

Thanks for the suggestion! Unfortunately, I gave that a try, but still
reproduced the same issue with this setting.

Curious, what the issue is your were thinking this would help with?

> Does your gadget connect to host super speed port directly via a C-to-A c=
able
> in your test labs? or there is something between?

I'm not sure of the details in the lab, however I can reproduce this
on my desk with a Host machine <-> USB hub <-> USB-C port.

Additionally, the board itself is a little complicated, in that the
USB-C port is USB2 only (however, it does have two USB-A USB3 ports
behind an on-board hub and a switch to decide if the USB-C or hub
ports are enabled since there is only one usb controller).

thanks
-john
