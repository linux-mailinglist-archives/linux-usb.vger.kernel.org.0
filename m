Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA67B57B0
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2019 23:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728625AbfIQViQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Sep 2019 17:38:16 -0400
Received: from mail-io1-f43.google.com ([209.85.166.43]:45843 "EHLO
        mail-io1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727261AbfIQViP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Sep 2019 17:38:15 -0400
Received: by mail-io1-f43.google.com with SMTP id f12so11144567iog.12
        for <linux-usb@vger.kernel.org>; Tue, 17 Sep 2019 14:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=x0VQXDrBHGIzMbHJhuwjF3Xv0XEq8hC+Je0qAvEm9vM=;
        b=W85jzRMBTchal2/yiGdgTWKidf3UHllRQRimQkjWRnFgYet0ilMKe11CsK4Yr0XW0Q
         PqyfB+s3tGyURgsdAx/rZ4qBmPzj307iLfW/BPktrb6ej2fzr6wyBHr6jdRMOTNIeLrA
         /y2K/aqHKfT3AhJle1pRLT2dX3ga9UoXkyeAzyLpl5SnRg+c+is5Hykjp3ls2PqLnr2G
         bAQ/3ZWRU4HxHCzVgC3uAuswJIpUUCUN8tbR4C5eLCDmgpjU4hK7n7pir2DqpdNZ4YO9
         we5L4Gmv3C3PxYyoG3EraD/SBG20tffYwEuR78Jv/ZHOlysI3gnK2//cJQygE9O3R6M2
         Szzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=x0VQXDrBHGIzMbHJhuwjF3Xv0XEq8hC+Je0qAvEm9vM=;
        b=q/PDleqwcq/477oc2bRYrdArqfRQ2YxrYnNsu0Ay4wAgH1bvF+3mQmxZ7CHojlGteG
         wTgxi2qz1/FnHiw7IxE/28r18/9HC4UmzLtE/l2+kpAlzp82wdxV+ZdDXG2m0vvRbk3c
         WfQH4mUXvSZECK1NgZGA5Tr272pt+8/M+VcmS5ZRENAN//6l6I8vO6e2QWHV/oa3X+mk
         8+YbX06SPdby0Ak5rWigjMiEFO/Xr4FozTFs1kg+sa1gFTOKYB5VXfbnu755pJQ4P+77
         xS4sa9BlcJ3vYq8KXkOpQwTOlVWjTbkh5DYDvHw1s1ftZ3M/cgYJFAPB990plT4A1wv5
         Uq9g==
X-Gm-Message-State: APjAAAV95KJ8awFpe/PPYeGxu9GqWx22t0QADQ6NvWYO6GNUjdEjS4/J
        +ikbr1ROKm6NPqVbMre3wcJ7FMLhSt6zX22NTg8=
X-Google-Smtp-Source: APXvYqzMowBJVPylmHZ+sQCxEFmxTzdVbiW+pD26Vqjg9xPogB872OiE9K9R1LvbeGVWJAZn0AXBzOJoNltYmO0feXg=
X-Received: by 2002:a6b:6c06:: with SMTP id a6mr1134509ioh.306.1568756294843;
 Tue, 17 Sep 2019 14:38:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:9c85:0:0:0:0:0 with HTTP; Tue, 17 Sep 2019 14:38:14
 -0700 (PDT)
In-Reply-To: <20190917120258.GB489142@kroah.com>
References: <CAA=hcWRF00syz8jB1+qdy1pFA7Wk_B=1Z_DT5vYuQrzFKhtZbw@mail.gmail.com>
 <20190917120258.GB489142@kroah.com>
From:   JH <jupiter.hce@gmail.com>
Date:   Wed, 18 Sep 2019 07:38:14 +1000
Message-ID: <CAA=hcWTD2zYD0gVTu6sDuRqUcTOnn42Gm0s1tOGvBQdQ40Q7LA@mail.gmail.com>
Subject: Re: Failed to connect to 4G modem
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

On 9/17/19, Greg KH <gregkh@linuxfoundation.org> wrote:
> On Tue, Sep 17, 2019 at 09:29:34PM +1000, JH wrote:
>> Hi,
>>
>> I am running kernel LTS 4.19 in an i.MX6 board with a 4G LTE modem, it
>> continually displayed following messages in a serial port tried and
>> failed to connect to LTE modem, are there any problems in kernel 4.19
>> LTS to support usb qmi protocol and LTE modem connection?
>>
>> I did try the kernel version 5.1, it can connect to the modem, but
>> failed in couple of hours or days, when it disconnected, it got the
>> same following messages.
>>
>> Are there serious problems in kernel to support usb qmi LTE modem
>> communication and connection?
>>
>> [   43.837243] option1 ttyUSB0: GSM modem (1-port) converter now
>> disconnected f0
>> [   43.882941] option 1-1:1.0: device disconnected
>> [   43.942788] option1 ttyUSB1: GSM modem (1-port) converter now
>> disconnected f1
>> [   44.001445] option 1-1:1.2: device disconnected
>> [   44.011575] qmi_wwan 1-1:1.3: nonzero urb status received: -71
>> [   44.017461] qmi_wwan 1-1:1.3: wdm_int_callback - 0 bytes
>> [   44.022801] qmi_wwan 1-1:1.3: wdm_int_callback - usb_submit_urb failed
>> with 9
>> [   44.059958] qmi_wwan 1-1:1.3 wwan0: unregister 'qmi_wwan'
>> usb-ci_hdrc.1-1, We
>> [   47.675604] usb 1-1: new high-speed USB device number 5 using ci_hdrc
>> [   47.905246] usb 1-1: New USB device found, idVendor=05c6,
>> idProduct=90b2, bc0
>> [   47.913732] usb 1-1: New USB device strings: Mfr=3, Product=2,
>> SerialNumber=4
>> [   47.921099] usb 1-1: Product: Qualcomm CDMA Technologies MSM
>> [   47.927087] usb 1-1: Manufacturer: Qualcomm, Incorporated
>> [   47.932746] usb 1-1: SerialNumber: 5ff10299
>> [   47.964528] option 1-1:1.0: GSM modem (1-port) converter detected
>> [   47.989484] usb 1-1: GSM modem (1-port) converter now attached to
>> ttyUSB0
>> [   48.014760] option 1-1:1.2: GSM modem (1-port) converter detected
>> [   48.026996] usb 1-1: GSM modem (1-port) converter now attached to
>> ttyUSB1
>> [   48.048810] qmi_wwan 1-1:1.3: cdc-wdm0: USB WDM device
>> [   48.082751] qmi_wwan 1-1:1.3 wwan0: register 'qmi_wwan' at
>> usb-ci_hdrc.1-1, 8
>> [   51.581595] usb 1-1: USB disconnect, device number 5
>> [   51.613737] option1 ttyUSB0: GSM modem (1-port) converter now
>> disconnected f0
>> [   51.644564] option 1-1:1.0: device disconnected
>> [   51.713919] option1 ttyUSB1: GSM modem (1-port) converter now
>> disconnected f1
>> [   51.771139] option 1-1:1.2: device disconnected
>
> The device is disconnecting itself from the USB bus, and then connecting
> itself, and then disconnecting...
>
> Probably an electrical issue, the kernel can not disconnect a device
> directly from the USB bus, that information comes from the USB hub
> itself.

That was always my thought until I tried kernel 5.1 under the same
platform (nothing changed except the kernel version), the kernel 5.1
can connect to the 4G modem, I could not tell the hardware engineer if
it was hardware problem where kernel 5.1 can connect, kernel 4.19
could not, how would you explain it? Seems some differences between
kernel 5.1 and kernel 4.19, what I could be missing?

I cannot use kernel 5, we need kernel LTS on product, too late to wait
for 5.4 LTS.

Thanks Greg.

- jh
