Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAC3025C309
	for <lists+linux-usb@lfdr.de>; Thu,  3 Sep 2020 16:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729366AbgICOnC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Sep 2020 10:43:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729223AbgICOmt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Sep 2020 10:42:49 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E49DCC061244
        for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2020 07:42:48 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id 109so2944988otv.3
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2020 07:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=N5TUuc1XOvK4T6yIQRxcVcIYjn6rnH3UmWFsDj9pqFk=;
        b=Id7LbTS7IHY4Jh/htA2L+gcJaXROGfKo+bJRGY94wst3aO5dGRNiXxdXHtz20I0nO4
         a5zP90FanpmAHmDUf/LQ1o40G8YwVtAC+9kMtMHZo5a6J+lTAx/7LaGFOF+ANr0Bo0UD
         jvSGVXqF3cG9mVOaOwCPxoUf0/Dr2oZGFz2A8d3PwvhHM2pCe+fMxKiuEmSCIEDUJTtC
         0nLihRhZzk3zmVD8H/kasJwPiQE/GVPmUl6dWjLC0/8RwjbS0j5tR1YnJxW2EdE2wM5k
         md9CfscATmbyw5r/xJIO4F39TfryeHmdg2qFvSKIZO3SGP4j+1HDjNpkVq5okJG/hoRl
         dhIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=N5TUuc1XOvK4T6yIQRxcVcIYjn6rnH3UmWFsDj9pqFk=;
        b=ICMmNIlCSrMRJmj3QTdCYUamy/It+JAl1Z9GlPT/vU1bqMGPjhYDWXZftPTEOmkHbZ
         oQWMzjCm05j2g1Yc53uxpWxbe1p1MObcP1M0CbyikXOzDYMuoCDxd7/zjFLVif85+fcH
         iPPhjZO43hzneelLdsBgxzbhzVcVfhJCMQdK/TSxyLMwnPVeH4D1BbE/03+5IqDxxQGw
         vbxvoUmxBfhptMDupj3efz9tH/4wvkMiJ8Hmlv/q15pj7yo+jlbupeuliDWiWi8bFnIN
         ihx3K9Tp36MtBDWO8hwWiuJ7nfwUSR1VEJsk/x+R9wqpjvlH/6Uk0lCd0qDZVVoxpebQ
         XxfQ==
X-Gm-Message-State: AOAM533TEGddb+wEn4s/i9YxMvmkshAUh4R5WaT5Uz59ya4fJXAR9aEw
        /hwnKoDBJcfcoeFa9E6AKGOlufZdYmPi+1uKYQ==
X-Google-Smtp-Source: ABdhPJyzo2A8y12Po3f7KKJ2XAB5feybBrNT0GjqxGOrVooNbSHQExD/WObwbPNN0xTPT9QA+NqYCYqAuS/qjNJyTJE=
X-Received: by 2002:a9d:7e93:: with SMTP id m19mr1802326otp.132.1599144166389;
 Thu, 03 Sep 2020 07:42:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAFSKS=Pv1Ji4XqHjVMCAnszq_HjFYYk7GuzeeCCScHd1NMumDA@mail.gmail.com>
 <20200901185903.Horde.NHT9rmY1GQT34m6C6YMUCNF@webmail.kiener-muenchen.de>
 <CAFSKS=M8xh3UVFEt+QxcCr_Ghie8tBkudrbLO15hpvEzQEbGfQ@mail.gmail.com> <20200902152514.Horde.-6-I20fjCayIQgkkuxwk-o2@webmail.kiener-muenchen.de>
In-Reply-To: <20200902152514.Horde.-6-I20fjCayIQgkkuxwk-o2@webmail.kiener-muenchen.de>
From:   George McCollister <george.mccollister@gmail.com>
Date:   Thu, 3 Sep 2020 09:42:32 -0500
Message-ID: <CAFSKS=P-kY=CJhbf_QCAPRJKrZQ1OR9FyrrMSzm-7Wm6BxSgYA@mail.gmail.com>
Subject: Re: usbtmc: stb race condition introduced by 4f3c8d6eddc272b386464524235440a418ed2029
To:     guido@kiener-muenchen.de
Cc:     linux-usb@vger.kernel.org, guido.kiener@rohde-schwarz.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 2, 2020 at 10:25 AM <guido@kiener-muenchen.de> wrote:
>
> >> More info see:
> >> https://github.com/GuidoKiener/linux-usbtmc/blob/master/README.md
> >>
> >> > My USBTMC device has an interrupt endpoint with a 1ms interval.
> >> >
> >> > 1) A query is sent to the USBTMC device.
> >> >
> >> > 2) An SRQ is reported via the interrupt endpoint with MAV set.
> >> >
> >> > 3) Userspace performs a read to get the reply since MAV is set after
> >> > being notified by poll().
> >>
> >> Did you start reading (read()) without checking the Status Byte after
> >> poll() event?
> >
> > I check the status byte after poll(). The problem seems to be that I
> > also check the status byte in a loop (until there is nothing to
> > service) before calling poll again.
>
> This is not a problem. You can check the status byte several times
> as long as you like. When RQS Bit (0x40) is set, then you know it was
> an intermediate SRQ, sent according to chapter 3.4.1
> (USBTMC_usb488_subclass_1_00.pdf). Otherwise it is a requested status
> byte according to chapter 3.4.2.

I wouldn't call myself a USBTMC or 488 expert. I read the USBTMC spec,
488.1 and 488.2 but it's been three years since I implemented most of
my device firmware and wrote the userspace code. It runs in a
contained environment so I haven't done any interoperability testing.
However, my understanding is that MSS shares the same bit with RQS and
if something is still needing service the MSS bit will be set in the
status byte given in reply to a READ_STATUS_BYTE request. If that is
the case how would you tell a status byte sent as an SRQ vs one with
MSS sent in reply to READ_STATUS_BYTE? See IEEE Std 488.2-1992 Figure
11-3=E2=80=94Service Request Enabling.

>
> > As long as you only check the
> > status byte when there is a cached value available it should be no
> > problem. However if you call USBTMC488_IOCTL_READ_STB when there is
> > not a cached SRQ value an SRQ can occur after the lock is released in
> > usbtmc488_ioctl_read_stb() and cache an older value (which will be
> > read by the next USBTMC488_IOCTL_READ_STB) than the one returned.
>
> Yes, interrupts (here SRQ) can happen at any time. Therefore the user
> can enable/disable interrupts (e.g. with SCPI command SRE) and
> postpone interrupt handling.

This wasn't necessary before but perhaps it could be used to work
around the issue.

>
> The SRQ sends a status byte with RQS bit set (chapter 3.4.1) and the
> request initiated by the client returns a status byte without RQS bit
> (chapter 3.4.2).

Again maybe I'm confused by how MSS is supposed to work.

>
> > This
> > is a race condition and sounds broken to me but if this is the
> > intended behavior I can adjust my userspace code to only do
> > USBTMC488_IOCTL_READ_STB once after poll indicates an SRQ and live
> > with it.
> > It doesn't seem right for USBTMC488_IOCTL_READ_STB to ever report an
> > older value than what was reported on the previous call.
>
> I agree that this can result in an odd behavior (E.g. the MAV bit
> is unset with reading the subsequent cached status byte).
> I was not aware about this problem and I need to check whether this is
> a common problem in VISA implementations or whether we just need to fix
> the kernel (e.g. drop requested status byte and return older cached value=
).
>
> A workaround to avoid this odd behavior is to read the status byte
> again with USBTMC488_IOCTL_READ_STB when your user application detects
> the RQS bit.
>
> BTW when you look at the old implementation
> https://elixir.bootlin.com/linux/v4.7.10/source/drivers/usb/class/usbtmc.=
c#L1332
> then you can see that you will never get a status byte with RQS bit set.
> The status byte was never stored in data->bNotify2
>
> Regards,
>
> Guido
>
>
>
