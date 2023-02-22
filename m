Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01E9869F026
	for <lists+linux-usb@lfdr.de>; Wed, 22 Feb 2023 09:28:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbjBVI2Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Feb 2023 03:28:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbjBVI2X (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Feb 2023 03:28:23 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0D4123300
        for <linux-usb@vger.kernel.org>; Wed, 22 Feb 2023 00:28:21 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id ck15so28334120edb.0
        for <linux-usb@vger.kernel.org>; Wed, 22 Feb 2023 00:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ddNDGoySB8s0FHorVqQ+PPB38nwRZaU8CJqKcPqDu4=;
        b=NC57j60NhoT3lZCaV+FRUR2ynEAkJENGI749nQYEJ+mWFvQZq7xYkBu+jXJGpaIqdR
         n+0blOWhB1pFqNDi3VKOts2n9coq/OBEwEEm2DQxLg1BvCyK65NoSzwfwsJJx5ECxSAK
         bzWoGL+weHXeyEylbUAXMxVEmt4xvBqJgHHA2jEx7ThDsGT/BAsZLrf/ZdjQQPJkmFts
         ue/+UqcKw4ZyhdyO4XdmuxZnf4Xk/cGPvDcvZ4IBI/Vs3njoC8SSrAcxkxwBuLr/hY6y
         G1eN66+LGfQlWJspfv2PS1jtRPrY35U78ERn5BhH5Yawi269djIx3j9CpEfu226UNpLK
         Zu1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ddNDGoySB8s0FHorVqQ+PPB38nwRZaU8CJqKcPqDu4=;
        b=NBur92XUf2dg0jIDC5u83R/KMS81/etQkD27j9rLYp1Vqar0lJ22pxvMz+UrridGwD
         AsMEjl7ww+o76OqTIdUpY/ayolntwMuz7SFBk6W4w6Fuec/cMT7+zVSAoq/r3VLnLDO4
         3fjRK1xcJPHQ7LFvc4O7rqSgYjiYaAsQ7OgX8w26Yn/vqri2TSjG1p49vpbo9XpcTnbU
         i+4huZkRFJNI7ntk34rqJ7xWZ7gXSDpADpp1JtjcOK2435ueYUxJ/geHnirGhvIe3KfW
         U6nXH7TinhYS0MoBLkzaS+1auC3lNtR0L1NVSRWJhYA9wJuawye4Z8KfdrZnU/HiUIo3
         S9/A==
X-Gm-Message-State: AO0yUKWOih+hB6BI3eqmpFMx1yVHgg/zyIilB0L5MgaF6uX5RPNs05eV
        2H+AmTx3IR2dMAQTQ/hqPQ==
X-Google-Smtp-Source: AK7set8h66PMYUjSS1xH4eHatqQ/eqhJa0dkzXfngMXmnwdMd3NMma7u+xBY7eZ9SYjG91Xfr7706A==
X-Received: by 2002:a17:907:d13:b0:8de:baf0:338c with SMTP id gn19-20020a1709070d1300b008debaf0338cmr6570475ejc.14.1677054500014;
        Wed, 22 Feb 2023 00:28:20 -0800 (PST)
Received: from IAS-200827.ad.werk5.local ([195.226.175.106])
        by smtp.gmail.com with ESMTPSA id y14-20020a1709064b0e00b008c979c74732sm4595577eju.156.2023.02.22.00.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 00:28:19 -0800 (PST)
From:   Thilo Roerig <thilo.roerig@googlemail.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, thilo.roerig@googlemail.com
Subject: Re: Receiving report multiple times when changing cpu
Date:   Wed, 22 Feb 2023 09:27:45 +0100
Message-Id: <20230222082745.549-1-thilo.roerig@googlemail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <Y0lpnMsHNVUvnkLp@kroah.com>
References: <Y0lpnMsHNVUvnkLp@kroah.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> On Fri, Oct 14, 2022 at 01:18:55PM +0200, Thilo Roerig wrote:
> > > > I have a problem with a custom usb device on a raspberry pi running a
> > > > buildroot 64bit linux with a v5.19.14 kernel.
> > > > I ran into a problem reading data from a custom usb hid device using
> > > > interrupt transfers. I'm using
> > > > the python hidapi library (https://pypi.org/project/hidapi/) with the
> > > > libusb backend. After sending
> > > > a custom command to the device, the driver changes from usbhid to usbfs.
> > > > The device starts sending
> > > > reports of size 1023 bytes to endpoint 0x83. `usb-devices` yields the
> > > > following output:
> > >
> > > USB devices do not "send" anything, they require a request from the host
> > > to be able to transfer any data.  So you have to ask the device "do you
> > > have any data?" before it can respond with anything.
> > >
> > > So just wait, don't ask the device if you are not ready for the data to
> > > be recieved, do not allow the device to continue to flood the data to
> > > you if you can not recieve it all.
> >
> > Thank you for pointing this out. I looked into the implementation of the hidapi
> > library. The library immediately starts submitting transfer when opening the
> > device. So to get a better grip on the issue, I'm now using libusb and in
> > this case I only get the reports, when I'm asking for it.
> >
> > > > T:  Bus=01 Lev=03 Prnt=13 Port=00 Cnt=01 Dev#= 14 Spd=480 MxC> > > h= 0
> > > > D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> > > > C:  #Ifs= 1 Cfg#= 1 Atr=80 MxPwr=500mA
> > > > I:  If#= 0 Alt= 0 #EPs= 1 Cls=03(HID  ) Sub=00 Prot=00 Driver> > > =usbfs
> > > > E:  Ad=83(I) Atr=03(Int.) MxPS=1024 Ivl=125us
> > > >
> > > > The reports are numbered by an increasing report id and are available via
> > > > interrupt transfer approx. every
> > > > 230 microseconds (1.85 microframes). The device does not retain any old
> > > > reports.
> > >
> > > So is the buffer in the device overflowing because the host is not
> > > asking for enough data from it, or is the data overflowing in the host
> > > because you are not reading the buffers fast enough?
> >
> > The buffer on the device does not buffer reports, that are as old as the
> > reports I am receiving via libusb. Interestingly, the speed that I can receive
> > the reports in userspace increases, when the wrong pattern starts to occur.
> > Initially, I receive ~4350 reports per second (with correct report id and
> > increasing order), but once the wrong pattern occurs, the speed goes up to
> > ~7650 reports per second, which is approx. 1 microframe. Without having found
> > any reference in the code, the pattern in the data looks as if some dequeue
> > pointer is "overtaking" the enqueue pointer in a ring buffer - but this is just
> > a wild guess. It would maybe explain the pattern in the data and maybe also the
> > speedup once the ring buffer is not preventing the dequeue from reading once
> > the enqueue pointer is reached.
> 
> Are you sure that the firmware in the device itself is not just broken
> when you ramp up the speed?  It is the thing that is filling the buffers
> to the host, when it has it ready, so it is the thing that is in control
> of how fast it responds.
> 
> If all works well at slower speeds, try just doing that and not letting
> the device itself work too hard.
> 
> What does other operating systems do with this device, how do they
> control it?  With a in-kernel driver or with userspace code that takes a
> long time between requests?

Based on your (and Alans) replies, I could narrow down the potential reasons
for the duplicate reports and it turned out to be a problem with a buffer on 
the device when reports were not read fast enough.

Together with the device provider we could adapt the firmware on the device to
avoid the buffer overflow that caused the duplicate reports. Additionally, I
moved some of the code processing the reports from python to C, so that the HID
report queue used by hidapi does not overflow, when reading to slowly from
userspace. 

I did not dig deeper into how windows handles the device, but this is something
I will investigate, if I continue to have issues with the reports.

Thank you very much again for your great help.

Best
Thilo Roerig

