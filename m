Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A8C42966D0
	for <lists+linux-usb@lfdr.de>; Thu, 22 Oct 2020 23:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S372513AbgJVVv5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Oct 2020 17:51:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S372511AbgJVVv4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Oct 2020 17:51:56 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAAE2C0613CE
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2020 14:51:56 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id z17so2544521iog.11
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2020 14:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=N9MCP3RxJjAIqUY68iFPdMJ44mwIOjbo8h+GCttUR84=;
        b=TIsTTbmw7w3+FV8tNQwk7lp6e7yH+vbUcff2RGEhTG3EQHF6GWI/Aj/GeHMyT8RC5f
         Uxt660vCBp7zlbKKI7rkKTo3NbRhRi+WdEIDsW4tyzB08JGatjqi6B2jUVHTC8/M6BFW
         HqJ81uQD/V4WEvIPfjnfXnr/b7HN9dPxdwcgnOFlg4K666HwSbdV4xUQQY3Cv/Q9IxVL
         JR8cRX4NjYO2uEACEuNxA3a9dN8xIhicp1V/MGi/LriV5yG01CiJkNc2qwqHwutHQHzY
         9rEL56XZrVvyFvBSsnsH52R1YWPr6zL15cSo3CBuba4NQB0XMr1aXCLU7eZ2cSKh9/qA
         RzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=N9MCP3RxJjAIqUY68iFPdMJ44mwIOjbo8h+GCttUR84=;
        b=g4TAZSb7QomUggv9OEYh9sklBGVEDYkKgSijYen0SiP7UcouSw3qbitGlzxOEbLbvz
         yPHklM8oMOpy07t0PlJZR85i4Qx5LfxlH2M0+mxtkH5uP/CgO8zLvie1SbW82M0h9JxP
         p7Lr0z/WhDk5JWD5zch7hn7PTBZhrQYZrEh3PZ3F4dLVvC4LoQgYOzIpkbb5xc6NZpEo
         csrbGf8XWEklLBD2jkUAZHhAe/QUFFdTFBrxaucj9PomGytED7VWdp9UAPsUFniTILB0
         UBNvtbnXlOzViShtPRslgB4dm6ArqDYsyzDbV1P3os8I3dsNTE4uWotJbGYa+Ukt9SZn
         uWGw==
X-Gm-Message-State: AOAM532ZDOS4ndZ7KQqIzb1TC/+mH6wR9h4qTRuBKx6uxgisR0DVEWu8
        3xF+ptXj5DwJ0oSuIVkv0echjeLm/rWgAPXDQpeZxW0yPU5EGA==
X-Google-Smtp-Source: ABdhPJwHIg3ZZoiETg7d4rhx1Nt8AkF8HoxqwJre61k04GSTMpaQgVu2vVodItCviTpGS42AR1AO8TY/h5U00PR5kmU=
X-Received: by 2002:a5d:9615:: with SMTP id w21mr3399393iol.59.1603403515989;
 Thu, 22 Oct 2020 14:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAGR4S9HQiZCsA7Y5_47j-xBOkydKiT2Exam=36L=-vwRjt+UWA@mail.gmail.com>
 <20201019133607.GC1667571@kuha.fi.intel.com> <CAGR4S9F1wdUyywuBxcMYfH9wMa91xw1rL8dmZrhJrGSGbmgbzg@mail.gmail.com>
 <b2f5eaef-af5f-4c3c-91e6-eece17decd93@www.fastmail.com>
In-Reply-To: <b2f5eaef-af5f-4c3c-91e6-eece17decd93@www.fastmail.com>
From:   "Dmitry N. Mikushin" <maemarcus@gmail.com>
Date:   Thu, 22 Oct 2020 23:51:45 +0200
Message-ID: <CAGR4S9EnGGpXoU5x1kNmu+J-_4rmfjCbWzT=xRKE+BQgjpmHeQ@mail.gmail.com>
Subject: Re: Any example of USB gadget for DRD device mode on Intel Gemini Lake?
To:     Sid Spry <sid@aeam.us>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Sid, alas no device in udc, what can I do?

marcusmae@m1k:~$ cat /sys/class/usb_role/intel_xhci_usb_sw-role-switch/role
device
marcusmae@m1k:~$ ls -l /sys/class/udc
total 0


=D1=87=D1=82, 22 =D0=BE=D0=BA=D1=82. 2020 =D0=B3. =D0=B2 23:26, Sid Spry <s=
id@aeam.us>:
>
> On Thu, Oct 22, 2020, at 4:06 PM, Dmitry N. Mikushin wrote:
> > Yes, AFAIK PCI_DEVICE_ID_INTEL_GLK_XHCI is actually 0x31a8, and I do ha=
ve it:
> >
> > 00:15.0 USB controller [0c03]: Intel Corporation Device [8086:31a8] (re=
v 03)
> >
> > Board is M1K.
> > My kernel is 5.4.0-48-lowlatency with the following additional patch:
> > https://lore.kernel.org/patchwork/patch/1037542/
> > I have dwc3 as a kernel module.
> > I'm not testing any gadget, I just have no idea what to test. Could
> > you please suggest some sources on how I should map gadget onto my
> > dwc3 port?
> >
> > Thanks & Kind Regards,
> > - Dmitry.
> >
>
> After you set the DRD switch to device do you see a device in /sys/class/=
udc?
>
> I will show you how to use configfs. You must enable USB gadget configfs.=
 It
> is easier to use in my opinion. The other gadget drivers simply need to b=
e
> loaded, but I am unsure how they work with newer DWC3 hardware. Most
> of the code is written for android and android uses configfs.
>
> `modprobe libcomposite` then execute the following, using that name:
>
> #!/usr/bin/env bash
> cd /sys/kernel/config/usb_gadget
> if [[ -d "g0" ]]; then
>         echo "" > g0/UDC
>         rm -rf g0;
> fi
>
> mkdir g0
> cd g0
>
> echo "0x1d6b" > idVendor
> echo "0x0104" > idProduct
>
> mkdir strings/0x409
> echo "0000000000" > strings/0x409/serialnumber
> echo "Your Company" > strings/0x409/manufacturer
> echo "Your Device" > strings/0x409/product
>
> mkdir functions/ncm.usb0
>
> mkdir configs/c.1
> ln -s functions/ncm.usb0 configs/c.1
>
> # List /sys/class/udc and take a name for this line:
> echo "" > UDC
>
> This will set up a Ethernet NCM device. There are similar instructions
> from the configfs author in a powerpoint. More device types are in the
> documentation.
