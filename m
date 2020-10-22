Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA2029665D
	for <lists+linux-usb@lfdr.de>; Thu, 22 Oct 2020 23:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S372146AbgJVVHN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Oct 2020 17:07:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2897417AbgJVVHM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Oct 2020 17:07:12 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 342ECC0613CE
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2020 14:07:11 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id a20so3023913ilk.13
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2020 14:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4/MmXkGYQSAWqtMuBewX+h/2Dgjot3Uv3Om1CU78wuw=;
        b=OOHRv5NlkvZCCS38aXZcR0tAfuZNuLr01E0Q+21vV47tOI5ispvXYQzQ7sesgsEnob
         mdE0HXcyadTEbhXEsAf22ZsFzCRn/ihqP+Z8ggy1vFbyp5Sl+9tnUADFwqLEUym3S2YQ
         K+6CSbUxMnle+4tuEqwbaW7JytG1m72QVVKimrC0Nh7AWl+K+SnTTVVRuWYd2FePTyqT
         rB1ZxkwVmBNaYNfrHIsJAezJR9QIElmpWg+tFXP5ifUMCX5kKykFkxGnpC3CAchVbZl+
         EkFioiwFPtC01+f3vSpyUxWu0svNYUlHK7vOM1LufsfDDkGZ1fWpidXAutZun4PEp3TL
         kb2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4/MmXkGYQSAWqtMuBewX+h/2Dgjot3Uv3Om1CU78wuw=;
        b=ePWSQq5SENT8pFQCEyIAWajMWoZ0qnQHczv/2JXM8h7yof0GbC+LCmXwGoYnymgjgr
         Ahj4TthsyDub1DUYn+PhfLUNn2dbAy9utiA+qrQjV1BiS/RPWHnSbSSbFF0SHN5YvUrt
         gCV8TPpabNaj0YT4JzwNsw/wpxEvMlMj8Dhpd0InekLMCwKA/6+P59dOWN8OWeILXYZw
         SsVMfAgGfRnfdCR0BRu6HHnyevj5kviDcDJ/rjSM5ZJ/ZysffV3i0mxBKBx8C89CKZJ4
         dOjP0TnxWYK7xEP24mBvJ9QkBM7cx1R4sR8eqKmLWbg0yqU831DYq7earL147BZbl+8A
         JkSA==
X-Gm-Message-State: AOAM530bxObXQH+FinLq5ir9wxCGB3RbeJqyYHMQmIb+gcGnemtGfkZF
        54p9jIXy0/AzOCqlz14YZBQDEc2HpVJDsFRXMxWiJIuvw8+uEw==
X-Google-Smtp-Source: ABdhPJw7/c1R9L4ZeWw6mEF6GrbSTzyMJLlhKYtqYWmQSmlFomXsPNCoyf1F5gWBwpybnIWQysDTeqYcIzAP27sH8Hw=
X-Received: by 2002:a92:1911:: with SMTP id 17mr3226301ilz.129.1603400830520;
 Thu, 22 Oct 2020 14:07:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAGR4S9HQiZCsA7Y5_47j-xBOkydKiT2Exam=36L=-vwRjt+UWA@mail.gmail.com>
 <20201019133607.GC1667571@kuha.fi.intel.com>
In-Reply-To: <20201019133607.GC1667571@kuha.fi.intel.com>
From:   "Dmitry N. Mikushin" <maemarcus@gmail.com>
Date:   Thu, 22 Oct 2020 23:06:59 +0200
Message-ID: <CAGR4S9F1wdUyywuBxcMYfH9wMa91xw1rL8dmZrhJrGSGbmgbzg@mail.gmail.com>
Subject: Re: Any example of USB gadget for DRD device mode on Intel Gemini Lake?
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Yes, AFAIK PCI_DEVICE_ID_INTEL_GLK_XHCI is actually 0x31a8, and I do have i=
t:

00:15.0 USB controller [0c03]: Intel Corporation Device [8086:31a8] (rev 03=
)

Board is M1K.
My kernel is 5.4.0-48-lowlatency with the following additional patch:
https://lore.kernel.org/patchwork/patch/1037542/
I have dwc3 as a kernel module.
I'm not testing any gadget, I just have no idea what to test. Could
you please suggest some sources on how I should map gadget onto my
dwc3 port?

Thanks & Kind Regards,
- Dmitry.

=D0=BF=D0=BD, 19 =D0=BE=D0=BA=D1=82. 2020 =D0=B3. =D0=B2 15:36, Heikki Krog=
erus <heikki.krogerus@linux.intel.com>:
>
> On Mon, Oct 19, 2020 at 01:27:35PM +0200, Dmitry N. Mikushin wrote:
> > Dear All,
> >
> > I'm confused by the USB gadget mode on the recent Intel SoCs, such as
> > Gemini Lake. The /sys/class/udc is empty, and a SoC can't present
> > itself as a IoT gadget this way, yet definitely being designed as
> > such. I've noticed the concept of dual-role-device, which seems to
> > replace the OTG. Particularly, Harry Pan mentioned that Gemini Lake
> > supports DRD in port 0.
>
> So do you have the dwc3 (the USB device controller) PCI device
> available/visible on your system? What do you get if you run:
>
>         lspci -nn|grep USB
>
> The DWC3 PCI device ID on Gemini lake is 0x31aa (search
> PCI_DEVICE_ID_INTEL_GLK in drivers/usb/dwc3/dwc3-pci.c).
>
> Which board/product are you using.
> Which kernel are you using?
> Is the dwc3 driver enabled in your kernel?
> Which gadget are you testing with? g_zero?
>
> thanks,
>
> --
> heikki
