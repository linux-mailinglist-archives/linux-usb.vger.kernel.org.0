Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9FD672181D
	for <lists+linux-usb@lfdr.de>; Sun,  4 Jun 2023 17:10:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbjFDPKE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 4 Jun 2023 11:10:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjFDPKD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 4 Jun 2023 11:10:03 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0FEDBC
        for <linux-usb@vger.kernel.org>; Sun,  4 Jun 2023 08:10:01 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6261a8bbe5fso35466676d6.0
        for <linux-usb@vger.kernel.org>; Sun, 04 Jun 2023 08:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685891400; x=1688483400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yuLHC7Wv2yDBGXfqj++BRx0+yfHPaNHrLbU42BxQVNA=;
        b=XoydbfJk8gLKDQ+7n+2xONzEMxk2m+tBgoRtGxwuoEFujDV3YD1hprOw9rtjYXMIPC
         uqfDdMv5ybk8R9BO6bGFblDjyv9SsMC/kRn/A5qL/y9QrUOLDMEoDeqMmc34nt+AJ1Pa
         jmnKz8FRB/a+KXiT+eay3F74mwMkzOWhaX37CRU2YftxsZ2p4Ck7M3a8XcNvbkQCZE1L
         7AuhFI0ry6doJ0AiMoRNtLs0qCpsr4ZFacY/oFAKlOeeuVKBn/PsxEvFMh42lLY0GcZt
         JdvIcSI73hOTSQrh/pAGXvq4wXjoxW5AacJwnSHHfApUWrZKErK49tOHh4w1dyr8hUvA
         la6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685891400; x=1688483400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yuLHC7Wv2yDBGXfqj++BRx0+yfHPaNHrLbU42BxQVNA=;
        b=I0QrIPZX7UG4gemZCxOEa+bshQQwqV9zGjQ+VbJqo1ljLL+khF4NtT0rf5AtditUK2
         CmL8xyVN48qkmpLxBCGtuWfuoC7pjLuPyrWOgJy+K7OQqqnRxyWgDDQ0pIGs5wzXe7J5
         n5/mR/LwkgUhX63G2qGHFgnBe4nwrkdoLm4c+lHYL3CBa8EMge4DnjhmcrfGJQSFi5B6
         /XoDhr3paJUABpUc57n0MeTX1tEH6JrwVCbWFYBtEvScb7z4HfTMhon1ECUEJcKOUw3Z
         NAf46tx/nKTxcyd2Euw44auuBFVHAg5kVf/P6YQbLd2MnISKetPM+ogTpPyXWVvkgDlA
         z5kw==
X-Gm-Message-State: AC+VfDxhgCPdvmjGf3AGqK51EJeYmCtqWinfGnFDxxq/eOXyArPHM+0v
        6elFNoeMDE/oFDKx6pu9fJyA0Zh6nFm8nJpeVKQ=
X-Google-Smtp-Source: ACHHUZ6CL+QWoX13O7jnUeT7uQ6BK0ar2c4Bp2OGm6JAFozGCuXWwuX5upAPpPpiAQ1zRnpY1BKLTBkoBk6nXK1Gi0k=
X-Received: by 2002:a05:6214:2a89:b0:628:6253:e481 with SMTP id
 jr9-20020a0562142a8900b006286253e481mr3749754qvb.51.1685891400544; Sun, 04
 Jun 2023 08:10:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAM82uABnohNw1Rv8q7qJi-WT9wXCuHyYV5w3++A_EeaodZr46A@mail.gmail.com>
 <90e7ff3c-aaab-8427-7610-2a6d9229af14@linuxfoundation.org>
In-Reply-To: <90e7ff3c-aaab-8427-7610-2a6d9229af14@linuxfoundation.org>
From:   Alexander Timofeev <alex42timofeev@gmail.com>
Date:   Sun, 4 Jun 2023 18:09:49 +0300
Message-ID: <CAM82uADv27i89FOKs20oE735BvVF88j_0MW6Uwmy4RQGVvEtaA@mail.gmail.com>
Subject: Re: [BUG] Potential race condition in usbip attach
To:     Shuah Khan <skhan@linuxfoundation.org>, valentina.manea.m@gmail.com
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi!

Here's a small report including the script to reproduce.

Test environment:
    QEMU/KVM Virtual Machine with Fedora 38 Workstation x86-64

    Kernel: 6.4.0-0.rc4.20230604gte5282a7d.339.vanilla.fc38.x86_64
from mainline repo

    usbip user-space package:
    Name         : usbip
    Version      : 5.7.9
    Release      : 8.fc38
    Architecture : x86_64
    Size         : 164 k
    Source       : usbip-5.7.9-8.fc38.src.rpm

    USB devices: two USB sticks passed to the VM, busid 1-5 and 1-6

usbipd and usbip attach commands are called on the same host.

Set up commands:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
modprobe usbip_host
modprobe vhci_hcd

usbip bind -b 1-5
usbip bind -b 1-6
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Start usbipd server:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
usbipd
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Test script:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
#!/bin/bash

# This script tries to trigger the race condition during two parallel
calls of the usbip attach command.

while true; do
        usbip attach -r localhost -b 1-5 &
        # comment out this sleep to trigger race condition
        sleep 2
        usbip attach -r localhost -b 1-6 &
        wait
        echo "usbip attach called twice"
        # comment out this sleep to see usbip port command fail
        sleep 1
        check_attach=3D"$(usbip port | wc -l)"
        if [[ ! $check_attach =3D~ "10" ]]; then
                echo "usbip port failed"
                usbip port
                break
        fi
        usbip detach -p 0
        usbip detach -p 1
        # comment out this sleep to see usbip port command fail
        sleep 1
        check_detach=3D"$(usbip port | wc -l)"
        if [[ ! $check_detach =3D~ "2" ]]; then
                echo "usbip detach or usbip port failed"
                break
        fi
done
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Test results:
1. With all three sleeps uncommented we observer the correct output:
the infinite loop repeats printing
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D script outp=
ut start =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
usbip attach called twice
usbip: info: Port 0 is now detached!

usbip: info: Port 1 is now detached!

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D script outp=
ut end =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
which means that we can attach and detach devices as many times as we want.

usbip port shows correct number of usbip devices
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D usbip port out=
put start =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[root@localhost-live ~]# usbip port
Imported USB devices
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Port 00: <Port in Use> at High Speed(480Mbps)
       Silicon Motion, Inc. - Taiwan (formerly Feiya Technology Corp.)
: unknown product (090c:2000)
       3-1 -> usbip://localhost:3240/1-5
           -> remote bus/dev 001/004
Port 01: <Port in Use> at High Speed(480Mbps)
       unknown vendor : unknown product (0000:7777)
       3-2 -> usbip://localhost:3240/1-6
           -> remote bus/dev 001/005
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D usbip po=
rt output end =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

2. Comment out the first sleep and you will get race condition. The
script hangs since one of the
usbip attach commands is stuck in its inner infinite loop and the same
message is repeated in dmesg output:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D dmesg =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
[  691.760921] vhci_hcd vhci_hcd.0: port 0 already used
[  691.761022] vhci_hcd vhci_hcd.0: port 0 already used
[  691.761428] vhci_hcd vhci_hcd.0: port 0 already used
[  691.761553] vhci_hcd vhci_hcd.0: port 0 already used
[  691.761752] vhci_hcd vhci_hcd.0: port 0 already used
[  691.761892] vhci_hcd vhci_hcd.0: port 0 already used
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D dmesg =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

usbipd does not know about the client issue and prints the following
as nothing happened:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D usbipd o=
utput start =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
usbipd: info: connection from ::1:42928
usbipd: info: connection from ::1:42942
usbipd: info: received request: 0x8003(5)
usbipd: info: found requested device: 1-5
usbipd: info: received request: 0x8003(5)
usbipd: info: found requested device: 1-6
usbip: info: connect: 1-5
usbipd: info: request 0x8003(5): complete
usbip: info: connect: 1-6
usbipd: info: request 0x8003(5): complete
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D usbip=
d output end =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D

usbip port command shows only one device attached to the client:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D usbip=
 port output start =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[root@localhost-live ~]# usbip port
Imported USB devices
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Port 00: <Port in Use> at High Speed(480Mbps)
       unknown vendor : unknown product (0000:7777)
       3-1 -> usbip://localhost:3240/1-6
           -> remote bus/dev 001/005
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D us=
bip port output end =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


3. Speaking about the second and the third sleep, we need to put sleep ther=
e
because there is no synchronization between kernel and userspace.
Comment it out to observe other behaviour.

Best,
Alexander Timofeev

On Sat, May 27, 2023 at 1:32=E2=80=AFAM Shuah Khan <skhan@linuxfoundation.o=
rg> wrote:
>
> On 5/24/23 11:48, Alexander Timofeev wrote:
> > Hi!
> >
> > Sorry if you have received this email twice. My first email contained
> > html and was not accepted by the mailing list.
> >
> > I think I have found a race condition which can be triggered for
> > example when calling two usbip attach commands in parallel on the same
> > host.
> >
> > In file linux/tools/usb/usbip/src /usbip_attach.c:
> > In function static int import_device(int sockfd, struct usbip_usb_devic=
e *udev):
> >
> > At first two processes may call usbip_vhci_driver_open() before
> > entering the do-while loop.
> > Next they both call usbip_vhci_get_free_port() and get the same free po=
rt.
> > Finally, they pass the same port number to usbip_vhci_attach_device().
> >
> > Current recommendation to end users: run usbip attach commands only
> > sequentially.
> >
>
> Will you be able to share the reproducer?
>
> thanks,
> -- Shuah
>
