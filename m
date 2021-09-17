Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0EFF40FC36
	for <lists+linux-usb@lfdr.de>; Fri, 17 Sep 2021 17:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233320AbhIQP1W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Sep 2021 11:27:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbhIQP1V (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Sep 2021 11:27:21 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EF34C061574
        for <linux-usb@vger.kernel.org>; Fri, 17 Sep 2021 08:25:59 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id t189so1908419oie.7
        for <linux-usb@vger.kernel.org>; Fri, 17 Sep 2021 08:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2koZ04x2DtN9e//aryMeE1LzZuubx+x/O9XaETJf4J4=;
        b=qUfMDQeH+WgQHKhRYH8dqZVy3VQQGMrdTVkTLCWpIJ3qSVB/4ZKWv0MfQJLogNdS5E
         /gx05f+snZW1SZ+whZSNodzniyPIlx9LEcx8kUgdpvEn/kW2cTNzvjTYdOpq5ltkeMxI
         35jt0/sw5CYXns62+cqx097Y/X1lsFW4hz16/wLBxS9gsZqj+Mvw2FNeRmEPqIpOoNgE
         R3EBiB6pfSKZ4Xh+fBlHdtf58iSDvPRbDTSOSu961dGYzGcoSBWSQdl7spRlYE6exCib
         GFdF6LM4vQjgP+0KEp96fCzMhKtd9s3X98wJDMz0e3ePzntig83gMkeX/XJJgxBh7RaZ
         XogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2koZ04x2DtN9e//aryMeE1LzZuubx+x/O9XaETJf4J4=;
        b=Hkm+tBf8qhIURQBzMIlcd3ufv7VWq1IctDC9UZTEbuSMV1fWsGOBk7cwDNGD5rweOK
         BIDUCmA3EubmeA7DMY7mxJi3gsUdkgCfE0dlbtqUKzZY9sfiQVo9pX6vpgQNodKpJaaW
         xIhm/vpYcgbmzxgoeul2XEyBPbAdINEr7FE8g1dHNahs+V8zrwLA6v1tooqYNeZKdboG
         R1VrsfJUqWMgPacaZcEuQ9giWUNwPCq+OJP2RCZugKDyNMU1KEXbeIwQmvMr9Zsjj9Xi
         LvdOko6eyq8M+pFuWQE/FWt3A38JZczOht7to+Fw925RXxeEKffq/bcl78j2oKHBUvgE
         OvuQ==
X-Gm-Message-State: AOAM5333h7AJ9oV0PYt33UZrhn1JaEgC/9U6YUCv5WiCtGaWSlxySLKw
        +C9D3d7MWnsj1VOYxs7pIcn3O/EPf04yd2KzUVN+QQsMcWaRYg==
X-Google-Smtp-Source: ABdhPJx1T5bqoWOXufFx6vHynhp5lfGycAAGfa9lsAwhQbHFVgmd+cGTIT56Y6ieLvA/U+h4V3lyp28lZ1ZnaHmgP0Q=
X-Received: by 2002:a05:6808:654:: with SMTP id z20mr4430964oih.118.1631892358960;
 Fri, 17 Sep 2021 08:25:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAHP4M8Vc+0eChmJDnLLa3ibuzGLOnc5hJ1Nk09794RHEJ7tEPw@mail.gmail.com>
 <CE84D77A-93F8-43B2-A952-896D6BED2E6D@msweet.org> <CAHP4M8VYhUDzvXO35=urBsz0suTA+0eMQ34f6-v9D0zE9fvDgQ@mail.gmail.com>
 <CAHP4M8W-z_L3r0kDbW943A6hm9y3gXzYJd=ZOpi+w9okS1zaaQ@mail.gmail.com> <3C27F76A-CE48-49E3-9078-CBE02B4E287E@msweet.org>
In-Reply-To: <3C27F76A-CE48-49E3-9078-CBE02B4E287E@msweet.org>
From:   Ajay Garg <ajaygargnsit@gmail.com>
Date:   Fri, 17 Sep 2021 20:55:46 +0530
Message-ID: <CAHP4M8WB3_Vf6p6=-yoA2MXa2Zun46DWL05MPra_VbOe6-uj5A@mail.gmail.com>
Subject: Re: How to register a new "function" in configfs?
To:     Michael Sweet <msweet@msweet.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael, thanks for the reply.

My gadget-driver is actually an almost copy of
drivers/usb/gadget/function/f_serial.c, except that the above
TTY-layer has been removed. I wrote this driver for my learning, to
learn simply sending/receiving of bytes using a host-driver as the
peer.

This test-driver of mine loads/works/communicates fine if

* I load my test-driver, exposing *gser* function.
* I load the gadget using *gser* function.

However, if

* I change the exposed function to something like *ajaytest* in my test-dri=
ver.
* Then load the driver (successfully).
* Then try loading the gadget using *ajaytest* function, the gadget
fails to load, saying "Function not found".


Let me see if I can post my code, probably on github, for a better public-v=
iew.

On Fri, Sep 17, 2021 at 7:47 PM Michael Sweet <msweet@msweet.org> wrote:
>
> Ajay,
>
> It is really hard to help further without seeing source code...
>
> I assume you've verified that your gadget driver module is loaded?
>
> And in your code:
>
> - Did you use the MODULE_LICENSE, MODULE_AUTHOR, and MODULE_DESCRIPTION m=
acros to define your driver metadata?
> - Did you use the module_init and module_exit macros?
>
>
> > On Sep 15, 2021, at 9:51 AM, Ajay Garg <ajaygargnsit@gmail.com> wrote:
> >
> > Any pointers, please?
> >
> > On Sat, 11 Sep 2021, 20:28 Ajay Garg, <ajaygargnsit@gmail.com> wrote:
> > Hi Michael,
> >
> > Thanks for the reply.
> >
> > I am a bit of old-school, and would prefer things in one place only
> > (in the kernel) :)
> > Thus :
> >
> > a)
> > I wish to have all the endpoints configuration/management in the
> > kernel only (like done in drivers/usb/gadget/function/f_serial.c,
> > drivers/usb/gadget/function/u_serial.c).
> >
> > b)
> > Only the attributes like vendorId/productId would be in configfs, to
> > help setup the device.
> >
> > c)
> > No user-space management of kernel objects.
> >
> >
> > Either-way, I think that my issue of "function exposure" would remain
> > the same, irrespective of whether we use configfs for managing the
> > kernel-objects (please correct me if I am wrong).
> >
> >
> > Thanks again for your time, look forward to listening back !
> >
> >
> > Thanks and Regards,
> > Ajay
> >
> > On Sat, Sep 11, 2021 at 8:01 PM Michael Sweet <msweet@msweet.org> wrote=
:
> > >
> > > Ajay,
> > >
> > > Quick question (as someone who has been down this road), do you need =
to do a kernel driver or could you just use the functionfs support to imple=
ment everything in userspace?  I found that path to be much easier and less=
 error-prone (and one of these days I'm going to be contributing some docum=
entation changes to make some things clearer...) and I was able to get my I=
PP-USB implementation up and running very quickly.
> > >
> > >
> > > > On Sep 11, 2021, at 1:43 AM, Ajay Garg <ajaygargnsit@gmail.com> wro=
te:
> > > >
> > > > Hi All.
> > > >
> > > > As a first step, I have been able to load a gadget on configfs, whi=
ch
> > > > binds to the function "gser" (thus loading up the usb_f_serial modu=
le
> > > > when the gadget mounts). Things work well till here.
> > > >
> > > > Now, I have written a brand-new gadget-side device-driver, trying t=
o
> > > > create a new function "gusb", via DECLARE_USB_FUNCTION_INIT.
> > > > However, now when I try to load the gadget for binding to "gusb", I
> > > > get the error that the function cannot be found.
> > > >
> > > > Seems that firing up a new gadget-side driver, that registers a new
> > > > function via DECLARE_USB_FUNCTION_INIT, is not enough to make the n=
ew
> > > > function visible across the kernel.
> > > >
> > > > Kindly let know what I am missing.
> > > > Will be grateful for pointers.
> > > >
> > > >
> > > > Thanks and Regards,
> > > > Ajay
> > > >
> > >
> > > ________________________
> > > Michael Sweet
> > >
> > >
> > >
>
> ________________________
> Michael Sweet
>
>
>
