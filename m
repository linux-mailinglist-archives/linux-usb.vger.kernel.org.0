Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 601E2481D51
	for <lists+linux-usb@lfdr.de>; Thu, 30 Dec 2021 15:57:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240492AbhL3O5k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Dec 2021 09:57:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240416AbhL3O5j (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Dec 2021 09:57:39 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3F5EC061574
        for <linux-usb@vger.kernel.org>; Thu, 30 Dec 2021 06:57:38 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id v15-20020a9d604f000000b0056cdb373b82so32612458otj.7
        for <linux-usb@vger.kernel.org>; Thu, 30 Dec 2021 06:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=ZtD60u6YfrpbZ/pdml2nVphijxyDaEpQrBL8zck8hRo=;
        b=ksMED351C2ShoivBYDt+UraNy6KfC2Iou2F/1apJPQnZC4yjUtp+yf509lD9CIkqfG
         HYSWbmxbgvEPHsrjuAsdAFqLWnw40m0Jaz437QXpALlytHrQpav1K/fb15ca9sVTPwmq
         hxZWVqldO+GEjhPxwmbWUw76Hz47rIB6o6R9eZU6yCV+maOVHmvOEZNb9EN1amU73eb9
         HD/kRUt6lx1sgs8piY2Xe6yJF0aNvsgdDFN9u+LXpzaD4KSG8L+PC08hV0LMu303LQ0K
         s1Uk1pafYBTQvcPOzSkuTXar4qvtACuyluoSZ52IKU8fPIEXKnUASQlDYBbys7Ev8Klc
         im1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=ZtD60u6YfrpbZ/pdml2nVphijxyDaEpQrBL8zck8hRo=;
        b=Nwa9gUPV8YH8AIeIwl4FatCPspRbs1MKDUG3edVvjPp8RskeAQLBr5kBNf9846v+Ab
         n21i0Vpj/8W8IdEsxvVjcO9sB6+9vjJyaeAHdOmZFewSqfqMobBfO1XhN1ZQPXYu38ln
         Umn4LkCRqVo1PFXz8p1Bhf0fWFmZHCmbfvR2nM3BGHuEmzo03/2SlKFCwRjt3r1Gr2dK
         G5go2BIji5uA99zs/akH6mQRl7ReRTKLCKCiRNHH0IIkVzoPcE2KgUstnXF6R78w16Sv
         +ZomiUUC19ITk3jGToOQ1jNtOxIag9jgworOIXa/x+wETBQypPkioJR0aGUfhsf4f866
         hjwA==
X-Gm-Message-State: AOAM533FPdRp6vWxgfKRp3t46/8OT68vht4TRcN2gX46bW83I7vrYKpb
        87lU8EGnGX3fVrw63NbzfuM9eaE/up0TCX4qaFc=
X-Google-Smtp-Source: ABdhPJysgajpcCINp+rUWi4w/ALjnrQaSaqrlD2r7vGGPfJF7hRR+A69LBzulN31a75niJWR/0KAfBMbnDSkHcE+DtY=
X-Received: by 2002:a05:6830:80a:: with SMTP id r10mr23413537ots.74.1640876258125;
 Thu, 30 Dec 2021 06:57:38 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4007:0:0:0:0:0 with HTTP; Thu, 30 Dec 2021 06:57:37
 -0800 (PST)
In-Reply-To: <Yc20WPbIad44/3rd@kroah.com>
References: <f5bca159-e8de-3c76-c2b4-6f4efa001fd9@linux.intel.com>
 <20211230131014.21886-1-youling257@gmail.com> <Yc20WPbIad44/3rd@kroah.com>
From:   youling 257 <youling257@gmail.com>
Date:   Thu, 30 Dec 2021 22:57:37 +0800
Message-ID: <CAOzgRdbeQ69pWbagFwTvV4ZcYGBE5GkwdqcuxxGFLXBJSy-GMA@mail.gmail.com>
Subject: Re: USB 3.2 Gen 2x2 "Superspeed+20GBps" support for ASM3242
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     mathias.nyman@intel.com, william.allentx@gmail.com,
        linux-usb@vger.kernel.org, Thinh.Nguyen@synopsys.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

2021-12-30 21:30 GMT+08:00, Greg KH <gregkh@linuxfoundation.org>:
> On Thu, Dec 30, 2021 at 09:10:14PM +0800, youling257 wrote:
>> where i can find the series patch?
>> https://patchwork.kernel.org/project/linux-usb/list/?series=427561
>
> There is nothing at that link.
>
> What is the lore.kernel.org link for the patch you are curious about?
>
>> when i used maiwo k1690(10gbps) connect to ASM3242 Controller, only
>> 500MB/s.
>> cat /sys/devices/pci0000:00/0000:00:01.3/0000:09:00.0/usb3/speed, 480
>> cat /sys/devices/pci0000:00/0000:00:01.3/0000:09:00.0/usb4/speed, 20000
>> maiwo k1690 is on
>> /sys/devices/pci0000:00/0000:00:01.3/0000:09:00.0/usb4/4-1.
>> cat /sys/devices/pci0000:00/0000:00:01.3/0000:09:00.0/usb4/4-1/speed,
>> 5000
>>
>>
>> 01:00.0 USB controller: ASMedia Technology Inc. ASM3242 USB 3.2 Host
>> Controller (prog-if 30 [XHCI])
>>         Subsystem: ASMedia Technology Inc. ASM3242 USB 3.2 Host
>> Controller
>>
>> [    0.359281] xhci_hcd 0000:01:00.0: xHCI Host Controller
>> [    0.359283] xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus
>> number 2
>> [    0.359285] xhci_hcd 0000:01:00.0: Host supports USB 3.2 Enhanced
>> SuperSpeed
>>
>> [ 1191.734123] usb 4-1: new SuperSpeed USB device number 2 using xhci_hcd
>> [ 1191.794767] usb-storage 4-1:1.0: USB Mass Storage device detected
>> [ 1191.795049] scsi host9: usb-storage 4-1:1.0
>> [ 1051.051274] scsi 9:0:0:0: Direct-Access     Realtek  USB 3.2 Device
>> 1.00 PQ: 0 ANSI: 6
>> [ 1051.051442] sd 9:0:0:0: Attached scsi generic sg0 type 0
>> [ 1051.054461] sd 9:0:0:0: [sda] 500118192 512-byte logical blocks: (256
>> GB/238 GiB)
>> [ 1051.055068] sd 9:0:0:0: [sda] Write Protect is off
>> [ 1051.055073] sd 9:0:0:0: [sda] Mode Sense: 37 00 00 08
>> [ 1051.055716] sd 9:0:0:0: [sda] Write cache: disabled, read cache:
>> enabled, doesn't support DPO or FUA
>> [ 1051.072131]  sda: sda1 sda2
>>
>> i don't have NVMe to USB 2x2 Enclosure (ASM2364 chipset), i have NVMe to
>> USB 2x1 Enclosure (RTL9120B chipset), maiwo k1690, using it on PciExpress
>> X4 add in card (ASM3242 chipset), it only 5Gbps speed, should be 10Gbps.
>>
>
> Are you sure that your hardware can really support this?  Do you have
> the right cable and the device will support this speed?
02:00.0 USB controller: Advanced Micro Devices, Inc. [AMD] 400 Series
Chipset USB 3.1 XHCI Controller (rev 01) (prog-if 30 [XHCI])
        Subsystem: ASMedia Technology Inc. 400 Series Chipset USB 3.1
XHCI Controller

maiwo k1690 connect to mainboard usb3.2 gen2x1 port can 10gbps.
[ 1049.965556] usb 2-2: new SuperSpeed Plus Gen 2x1 USB device number
2 using xhci_hcd
[ 1050.028280] usb-storage 2-2:1.0: USB Mass Storage device detected
[ 1050.028560] scsi host9: usb-storage 2-2:1.0

pcie to usb3.2 gen2x2 asm3242 should be compatible usb3.2 gen2x1.
I don't have windows os to test them, may be 5gbps on windows yet.
Is there a way to hack them to 10Gbps on linux?

> And most important, what kernel version are you using?
kernel 5.16 rc7.
> thanks,
>
> greg k-h
>
