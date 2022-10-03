Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86DB15F36F2
	for <lists+linux-usb@lfdr.de>; Mon,  3 Oct 2022 22:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbiJCUWf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Oct 2022 16:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiJCUWc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Oct 2022 16:22:32 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51A0237427
        for <linux-usb@vger.kernel.org>; Mon,  3 Oct 2022 13:22:31 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id p202so9020758iod.6
        for <linux-usb@vger.kernel.org>; Mon, 03 Oct 2022 13:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=uR/4wy/e+6xnlLMpXMSviaIabHpaK14t3vtDWYgDMrQ=;
        b=R/TPwzuS6gNmbGJ5CZDIFbBw1f8KUQ6ukkwPX9p6GT3DNlb8axlwjxdsNWGoGPknc4
         XF1wEhXe2/2uYw8s7e8X5WOLuxnWCwSHfmAP9RQKilQmbZpATzmQ/qNbdORqjkzAJPnR
         GOmUxZVKOldtuBzoaJ4he6OoIQxF2RMOWcpgwbzZW5eWKcoXb66Dzg7O8JPPIp1BXx9m
         QoO6ru9PvCdpY9CItNEemAt+3MGoRQuNpnndMZfhp+jS8RUU3LpiNOt62i1MXkJinYi0
         n391ue3DccrbshJUcepMG8LzUCrB08TXfue7dnJRfcbRy8BL79EONrldr6TISz1c7EKk
         IWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=uR/4wy/e+6xnlLMpXMSviaIabHpaK14t3vtDWYgDMrQ=;
        b=eeOv5AHpmk+nhRLlyx/CsSBWaPrbPNIcR1vMAL5Q4ft+2sOS6zv28DM0lIrAjysUfQ
         qjvOwcN+YssDGdJxhOtIUiO6ibqFA7X+EyvAvyhzSxc7/ZiMuo8vDf90odyCBsmyCpWm
         lHePm+XdLQukq7sPgTOlI7g22mjsxXttgb4kpV5EO237Qaz7GYxWGHvG33pJ0Rcy119e
         KrYV9blsF82pPdMwXaiBNVWYHqJmEH28Vq2vvGmIAOmURM5xNnLHqHxF5jmPHHfWazFS
         6EkMp0oLWccG2QCK+AvvaHt735uGw8/JTlz3lSuzxwbTxLvx2gCymGAgyxQiPuTMwEbw
         gy+A==
X-Gm-Message-State: ACrzQf1lHXc4WTUHf7u7H7HMSNyp28Wi0+0rt9sUMQwS4GFZgUnVG5gK
        d6ef3jZ06r1ImwGWJrQnUqDKFjm6q8yAxd2CgTBBbwu82vG3zg==
X-Google-Smtp-Source: AMsMyM5XqYGPje9UjFMz5plezK27Ce+anAzPFhGEGE2RDYI4r2ZtcFbrk0197VkzwmZvjCv2OxzYKbDr+9WKzZfS1tI=
X-Received: by 2002:a02:b80d:0:b0:35a:f049:b8b with SMTP id
 o13-20020a02b80d000000b0035af0490b8bmr11277939jam.141.1664828550663; Mon, 03
 Oct 2022 13:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAAMvbhFJ+jdFPh5dMV+_jjYUYYgWhCpv5E43Bh=Eoo6su80cUA@mail.gmail.com>
 <CAAMvbhEV_ssOwsWU-37pauDSfM3Ekv2mrKWTjCP0vov84dMDMQ@mail.gmail.com> <YzsnSPEfBesJRr9R@rowland.harvard.edu>
In-Reply-To: <YzsnSPEfBesJRr9R@rowland.harvard.edu>
From:   James Dutton <james.dutton@gmail.com>
Date:   Mon, 3 Oct 2022 21:21:53 +0100
Message-ID: <CAAMvbhFtDpfr+54RPPWJH5p=QnL+UW1wZmC7f8dNav965bD=cw@mail.gmail.com>
Subject: Re: USB disk disconnect problems
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 3 Oct 2022 at 19:17, Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Mon, Oct 03, 2022 at 07:04:05PM +0100, James Dutton wrote:
> > I have done some more tests.
> > With the device plugged in, I manually send a command to reset
> > the USB device.
> > Using instructions listed here:
> > https://askubuntu.com/questions/645/how-do-you-reset-a-usb-device-from-the-command-line
> >
> > The reset fails.
> > It never recovers.
> > So, I think there is some problem relating to USB 3.x reset, and maybe
> > just my specific device which is an NVME storage in a USB dock.
> > I think the problem is more to do with the Linux kernel's USB 3.x
> > reset procedure, rather than any other cause.
> > Is there any quirk or test I can add, that would remove power from the
> > USB port and return it, as part of the reset procedure?
> > Or, is there any extra debug logging I can enable to help diagnose
> > where the reset function is failing?
>
> You can try collecting a usbmon trace of the reset (instructions on the
> web or in Documentation/usb/usbmon.rst in the kernel source).  That will
> provide some clues as to whether the problem lies in the reset itself or
> in the activities that follow the reset.
>
> Have you tried running a similar test using, say, a plain old USB thumb
> drive in place of the NVME storage device?
>

I have tried the reset command on USB 2.0 and USB 3.0 flash sticks,
and they reset OK.
So, it seems to be a problem with this specific NVME USB device.
This NVME USB device says it is USB 3.2 when I do lsusb. I don't have
a USB 3.2 flash stick
lsusb output:
Bus 004 Device 002: ID 0bda:9210 Realtek Semiconductor Corp. RTL9210
M.2 NVME Adapter
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.20
  bDeviceClass            0
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0         9
  idVendor           0x0bda Realtek Semiconductor Corp.
  idProduct          0x9210 RTL9210 M.2 NVME Adapter
  bcdDevice           20.01


I will try to capture a usbmon and compare the flash sticks reset vs
the NVME USB device.
