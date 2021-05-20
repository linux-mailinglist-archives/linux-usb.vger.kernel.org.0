Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D36238B18C
	for <lists+linux-usb@lfdr.de>; Thu, 20 May 2021 16:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236244AbhETOUn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 May 2021 10:20:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231882AbhETOUk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 May 2021 10:20:40 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9081EC061574
        for <linux-usb@vger.kernel.org>; Thu, 20 May 2021 07:19:18 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id l15so10225030iln.8
        for <linux-usb@vger.kernel.org>; Thu, 20 May 2021 07:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DPsMEaeNQuvCYWEMo9JbAx6heQ1LzkygwIQzo87WsoI=;
        b=YgOoChEb1vkNpOjTVaI3dFPP/IbNGrfRQMDncHlClL+t4pv6bpEn6xfCXJjdo1LkUC
         8auhXIG+5AXMMAO8/3b5KhOsVM1r3AYacbYykfOU3KpJPJo2xOw9wI4rxUwZgbqpg7uE
         hUFqxigEUpln9rimNvC6snemhgIGK2uGvxCiOTVXpPMehBsWikoQxDUQ4cY+6yEBFn1E
         K7EOAjoIW6xqATD/3JjsBsD23ZlgqV3FPv2qinnyY5oGXb01DzVpJBx/gPAjk4Db5HsO
         UkbRhX+9buok4tIs13fzBN4V3iYLRxF2vsk7jH+aRUqeb2TcU9N+S3WHO09NTHfK5c1E
         OVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DPsMEaeNQuvCYWEMo9JbAx6heQ1LzkygwIQzo87WsoI=;
        b=rO/Pjxiv9vyZQdFdCq0+P7f4w9/tx9IHqZd6iYqYm5Eyq9XTadPBtA7L3O6u4Nm0FD
         AAo/t/w+uB4vYXhFM0YuUcYd2MAwJqGvUELi851BBuIO53wDoq/hXCSfgZ/GanpOoRCG
         W4BSBXSuORKr95fWvs5dPCM+IBEqFXcErWhDZGuqkPBOYoea5wel+owyW1NK7jlJDado
         4jpeq3u+5bqeKG4Lwx98MlZW3IAs9m951poJpgMV9rpNh6eboqxhXLKz9oiX9MKIzZ9q
         R1cVKdQKXBLlHU1QDv3luHMG3L0Lfn+guJVGIzBI8LDCQaowvBPhEtZB6Rl/6JjuWNa8
         JEeg==
X-Gm-Message-State: AOAM531lnpjEmpkt1gbC+/AS+TKo5NABsv+LopstD8+K+Lh+dPb1RZJS
        ViYZgcMXgq9xRhEdzh3R50WzilfjRrj7SdDQkR7reStnaZ9+pg==
X-Google-Smtp-Source: ABdhPJzXyTlcxdtqejghvz7gi0yXZyiR3oGJkG288F/jQFb/4H0ZEfgygm7odFhO64r6y5vLKiszfCv/XDqB7Xlx3VI=
X-Received: by 2002:a92:6902:: with SMTP id e2mr6031390ilc.172.1621520357760;
 Thu, 20 May 2021 07:19:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAJs94EbV6+C81NggHtnJGZ8aoeW12POhv4zi0RTawuDcf+ybFA@mail.gmail.com>
 <20210520141633.GB1203032@rowland.harvard.edu>
In-Reply-To: <20210520141633.GB1203032@rowland.harvard.edu>
From:   "Matwey V. Kornilov" <matwey.kornilov@gmail.com>
Date:   Thu, 20 May 2021 17:18:37 +0300
Message-ID: <CAJs94Eaq_d8ntjkH2EqSQvC6rytsPbJuTq8JTZ_8Ugp=X8+EiA@mail.gmail.com>
Subject: Re: Odroid C4: dwc2_hsotg_start_req: ep1 is stalled
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     hminas@synopsys.com,
        "open list:MUSB MULTIPOINT HIGH SPEED DUAL-ROLE CONTROLLER" 
        <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=D1=87=D1=82, 20 =D0=BC=D0=B0=D1=8F 2021 =D0=B3. =D0=B2 17:16, Alan Stern <=
stern@rowland.harvard.edu>:
>
> On Thu, May 20, 2021 at 03:35:26PM +0300, Matwey V. Kornilov wrote:
> > Hi,
> >
> > I am running upstream Linux 5.12.3 on an Odroid C4 board and see lots
> > of the following lines in dmesg while using the gadget mass storage
> > driver. I suppose that this can indicate some issue in the dwc2
> > driver.
> >
> > [  189.752586] dwc2 ff400000.usb: bound driver g_mass_storage
> > [  190.118994] dwc2 ff400000.usb: new device is high-speed
> > [  190.199074] dwc2 ff400000.usb: new device is high-speed
> > [  190.267855] dwc2 ff400000.usb: new address 4
> > [  191.310603] dwc2 ff400000.usb: dwc2_hsotg_ep_sethalt(ep
> > 00000000ce48180a ep1in, 1)
> > [  191.310737] dwc2 ff400000.usb: dwc2_hsotg_start_req: ep1 is stalled
> > [  191.311015] dwc2 ff400000.usb: dwc2_hsotg_ep_sethalt(ep
> > 00000000ce48180a ep1in, 0)
> > [  191.312257] dwc2 ff400000.usb: dwc2_hsotg_ep_sethalt(ep
> > 00000000ce48180a ep1in, 1)
> > [  191.312373] dwc2 ff400000.usb: dwc2_hsotg_start_req: ep1 is stalled
> > [  191.312762] dwc2 ff400000.usb: dwc2_hsotg_ep_sethalt(ep
> > 00000000ce48180a ep1in, 0)
> > [  191.336959] dwc2 ff400000.usb: dwc2_hsotg_ep_sethalt(ep
> > 00000000ce48180a ep1in, 1)
> > [  191.447759] dwc2 ff400000.usb: dwc2_hsotg_ep_sethalt(ep
> > 00000000ce48180a ep1in, 1)
> > [  191.447823] dwc2 ff400000.usb: dwc2_hsotg_start_req: ep1 is stalled
> > [  191.448098] dwc2 ff400000.usb: dwc2_hsotg_ep_sethalt(ep
> > 00000000ce48180a ep1in, 0)
> > [  191.448550] dwc2 ff400000.usb: dwc2_hsotg_ep_sethalt(ep
> > 00000000ce48180a ep1in, 1)
> > [  191.567748] dwc2 ff400000.usb: dwc2_hsotg_ep_sethalt(ep
> > 00000000ce48180a ep1in, 1)
>
> Those look like they ought to be debugging messages.  They don't seem to
> indicate any problem.
>
> Alan Stern

Well, I have not enabled any debug info, and those messages are
flooding my dmesg. Maybe dev_warn() should be replaced with something
other?


--=20
With best regards,
Matwey V. Kornilov
