Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 102802967B5
	for <lists+linux-usb@lfdr.de>; Fri, 23 Oct 2020 01:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S373507AbgJVXr3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Oct 2020 19:47:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S373215AbgJVXr0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Oct 2020 19:47:26 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95233C0613CE
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2020 16:47:26 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id z5so3530788iob.1
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2020 16:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6glUpDzmBH4vL4BrJbILXHg3v9YsOEXiiafoIRTdweY=;
        b=fo9OyTMFHh+CBf4h5HMHTOypLGbG5JNJ4+MGIsebvt+J4Y6q31tGA6aRRMveMDPSRP
         YiElOA6l4Wo7ykpuk9ncQiF4jRf4sNNN7VttTNA/FJQ/3n62ub2D9fl39VBqjesvmWG1
         vCNfrFlp0si55kRp9UG6o5F0hG9hrEv07gC3lH04hzNWIW/ROTUhBIJnHgHRK1fF+pMF
         xptCLVNezhKJ828LDBWfsEinRDpZxzAAegrrEy3FWxSdiQFCR7NqQksK8DpbroIGmryQ
         B7hZobGyicqbtMmB1vYRH1I+qrCw2PNKdnYoHmVykK2vVFJJWyVJG/2u/1Rx4xzf7z97
         n94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6glUpDzmBH4vL4BrJbILXHg3v9YsOEXiiafoIRTdweY=;
        b=Mg5MFbjB0sbkfqEfqMDMAss82yhVwLn5hiHIhe4w5mfZ7svijUjL8PCZJUmi0sYJxM
         bm+XmoTwsClrTA7iE1wM/3xULvaZQDWs9l0CRh6yzZ24PTYFS5BQTs3npAhZ+3c6IBvB
         +syW2qOAYX0ytJHKbnLMp7kAIiGAPk6ZKYqcc9xk0D+xQrZ5NwzAw6rqG0wRbBl2B+aw
         7wsToQzG7oj9Sr98Vi/KUYCUoYXjbI+0KuLiytJFOmCK8FDwDMgHh0nA4DYsy5dhOpdt
         V2B4jfR+Ed8kKNBQDHP36W6hlAbl9iNmra5v5Ijp6AZN7RClDpdafQ8PwfTeCh2V0QW0
         rPeQ==
X-Gm-Message-State: AOAM533CsB57KBV6c5Rr+3HqxyHrqUTqtpqHb8HZM3+xsJG+CxIEd+Q/
        8cFHFO7LHUWfePXd9/1acVSYmAq4TeJjBzMReJvcFoCRZh4=
X-Google-Smtp-Source: ABdhPJxSPBtMFtHuvCru2rp6THJiggyMawqe2dpm+nDjj/2BC4NmMQP+UjwejxazBqSnkqfIQhYq98nDJWDeZQp7r+o=
X-Received: by 2002:a5d:91d2:: with SMTP id k18mr3518883ior.119.1603410445694;
 Thu, 22 Oct 2020 16:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAGR4S9HQiZCsA7Y5_47j-xBOkydKiT2Exam=36L=-vwRjt+UWA@mail.gmail.com>
 <20201019133607.GC1667571@kuha.fi.intel.com> <CAGR4S9F1wdUyywuBxcMYfH9wMa91xw1rL8dmZrhJrGSGbmgbzg@mail.gmail.com>
 <b2f5eaef-af5f-4c3c-91e6-eece17decd93@www.fastmail.com> <CAGR4S9EnGGpXoU5x1kNmu+J-_4rmfjCbWzT=xRKE+BQgjpmHeQ@mail.gmail.com>
 <6eff3a6b-5284-424f-96bf-ebdf5653bba7@www.fastmail.com>
In-Reply-To: <6eff3a6b-5284-424f-96bf-ebdf5653bba7@www.fastmail.com>
From:   "Dmitry N. Mikushin" <maemarcus@gmail.com>
Date:   Fri, 23 Oct 2020 01:47:14 +0200
Message-ID: <CAGR4S9EK317fSNAR0-uHW=ccO22=6tTXfogn_J=ER_g=r0SDuA@mail.gmail.com>
Subject: Re: Any example of USB gadget for DRD device mode on Intel Gemini Lake?
To:     Sid Spry <sid@aeam.us>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is exactly the purpose of my message here. Intel's approach to
UDC is different to what we've been used up to in ARMs. No USB options
are provided in BIOS; actually BIOS is almost empty :) Indeed, I
really hope to get this clarified with the help of Intel folks.

Kind regards,
- Dmitry.

=D0=BF=D1=82, 23 =D0=BE=D0=BA=D1=82. 2020 =D0=B3. =D0=B2 01:05, Sid Spry <s=
id@aeam.us>:
>
> On Thu, Oct 22, 2020, at 4:51 PM, Dmitry N. Mikushin wrote:
> > Hi Sid, alas no device in udc, what can I do?
> >
> > marcusmae@m1k:~$ cat /sys/class/usb_role/intel_xhci_usb_sw-role-switch/=
role
> > device
> > marcusmae@m1k:~$ ls -l /sys/class/udc
> > total 0
>
> I don't have an exact answer, but the device in /sys/class/udc must be th=
ere
> (as far as I am aware) if the kernel is properly communicating with the h=
ardware.
>
> On my ARM systems I've found that DRD seems to not work in general, and
> I've had to set device mode operation via devicetree. On an Intel board I
> assume this would be a UEFI/BIOS option.
>
> If Intel is still providing support for the hardware you should try to co=
ntact
> them. In the meantime, hopefully someone else can comment.
>
> >
> > =D1=87=D1=82, 22 =D0=BE=D0=BA=D1=82. 2020 =D0=B3. =D0=B2 23:26, Sid Spr=
y <sid@aeam.us>:
> > >
> > > On Thu, Oct 22, 2020, at 4:06 PM, Dmitry N. Mikushin wrote:
> > > > Yes, AFAIK PCI_DEVICE_ID_INTEL_GLK_XHCI is actually 0x31a8, and I d=
o have it:
> > > >
> > > > 00:15.0 USB controller [0c03]: Intel Corporation Device [8086:31a8]=
 (rev 03)
> > > >
> > > > Board is M1K.
> > > > My kernel is 5.4.0-48-lowlatency with the following additional patc=
h:
> > > > https://lore.kernel.org/patchwork/patch/1037542/
> > > > I have dwc3 as a kernel module.
> > > > I'm not testing any gadget, I just have no idea what to test. Could
> > > > you please suggest some sources on how I should map gadget onto my
> > > > dwc3 port?
> > > >
> > > > Thanks & Kind Regards,
> > > > - Dmitry.
> > > >
> > >
> > > After you set the DRD switch to device do you see a device in /sys/cl=
ass/udc?
> > >
> > > I will show you how to use configfs. You must enable USB gadget confi=
gfs. It
> > > is easier to use in my opinion. The other gadget drivers simply need =
to be
> > > loaded, but I am unsure how they work with newer DWC3 hardware. Most
> > > of the code is written for android and android uses configfs.
> > >
> > > `modprobe libcomposite` then execute the following, using that name:
> > >
> > > #!/usr/bin/env bash
> > > cd /sys/kernel/config/usb_gadget
> > > if [[ -d "g0" ]]; then
> > >         echo "" > g0/UDC
> > >         rm -rf g0;
> > > fi
> > >
> > > mkdir g0
> > > cd g0
> > >
> > > echo "0x1d6b" > idVendor
> > > echo "0x0104" > idProduct
> > >
> > > mkdir strings/0x409
> > > echo "0000000000" > strings/0x409/serialnumber
> > > echo "Your Company" > strings/0x409/manufacturer
> > > echo "Your Device" > strings/0x409/product
> > >
> > > mkdir functions/ncm.usb0
> > >
> > > mkdir configs/c.1
> > > ln -s functions/ncm.usb0 configs/c.1
> > >
> > > # List /sys/class/udc and take a name for this line:
> > > echo "" > UDC
> > >
> > > This will set up a Ethernet NCM device. There are similar instruction=
s
> > > from the configfs author in a powerpoint. More device types are in th=
e
> > > documentation.
> >
