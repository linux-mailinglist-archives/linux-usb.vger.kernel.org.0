Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 223952EADFF
	for <lists+linux-usb@lfdr.de>; Tue,  5 Jan 2021 16:15:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbhAEPPJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Jan 2021 10:15:09 -0500
Received: from smtp4.unipi.it ([131.114.21.141]:42010 "EHLO smtp.unipi.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725813AbhAEPPJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 5 Jan 2021 10:15:09 -0500
Received: from localhost (localhost [127.0.0.1])
        by smtp.unipi.it (Postfix) with ESMTP id 75F91810DC
        for <linux-usb@vger.kernel.org>; Tue,  5 Jan 2021 16:14:27 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at unipi.it
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
        (Authenticated User)
        by smtp.unipi.it (Postfix) with ESMTPSA id 5A8D98074B
        for <linux-usb@vger.kernel.org>; Tue,  5 Jan 2021 16:14:26 +0100 (CET)
Received: by mail-vs1-f48.google.com with SMTP id b23so76499vsp.9
        for <linux-usb@vger.kernel.org>; Tue, 05 Jan 2021 07:14:26 -0800 (PST)
X-Gm-Message-State: AOAM53056R4aW1/QFp4EWiG5/jYVINU+tJW4CD2ss/i8wSRsF6fC7WhJ
        4yucCboXnciR07awfXmRSkuEf0GqsgMoBxCqrIQ=
X-Google-Smtp-Source: ABdhPJywEEu94onul462masFFC0JIgTnCnlnOQYHaHeLKpkSRh5lykm7PwJoI5UZ943i39TdYFop08c00GxxkD8wVf4=
X-Received: by 2002:a67:8949:: with SMTP id l70mr47569270vsd.21.1609859665690;
 Tue, 05 Jan 2021 07:14:25 -0800 (PST)
MIME-Version: 1.0
From:   Augusto Ciuffoletti <augusto.ciuffoletti@unipi.it>
Date:   Tue, 5 Jan 2021 16:14:14 +0100
X-Gmail-Original-Message-ID: <CAOefePC_PEkra4adLq4Risea3VCtN41jU42_C=5UJ=mYuGfFog@mail.gmail.com>
Message-ID: <CAOefePC_PEkra4adLq4Risea3VCtN41jU42_C=5UJ=mYuGfFog@mail.gmail.com>
Subject: Problem with the CH341 driver in Ubuntu 20.04
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I run into this problem trying to program an ESP8266 board, which uses
the CH341 chip in the programming interface as a USB-to-Serial
interface. The problem appeared after an upgrade from Ubuntu 19.10 to
20.04 (that I carried out one week ago).

This is the kernel I am using:

===
$ uname -r
5.4.0-58-generic
===

When I connect the ESP8266 board (a Wemos D1 mini) to the USB there is
no activity on the syslog (or dmesg), and the kernel module is not
loaded. In fact I do not see the /dev/ttyACM0 device in the /dev
directory and no useful device appears in the Arduino GUI.

I have found the module in the kernel tree but, even forcing the
installation, nothing happens:

===
augusto@Legion:~$ ls
/usr/lib/modules/5.4.0-58-generic/kernel/drivers/usb/serial/ch*
/usr/lib/modules/5.4.0-58-generic/kernel/drivers/usb/serial/ch341.ko
augusto@Legion:~$ sudo modprobe ch341
[sudo] password di augusto:
augusto@Legion:~$ lsusb
Bus 002 Device 002: ID 05e3:0626 Genesys Logic, Inc. USB3.1 Hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 003: ID 13d3:56a6 IMC Networks Integrated Camera
Bus 001 Device 005: ID 0cf3:e500 Qualcomm Atheros Communications
Bus 001 Device 006: ID 046d:c517 Logitech, Inc. LX710 Cordless Desktop Laser
Bus 001 Device 004: ID 093a:2510 Pixart Imaging, Inc. Optical Mouse
Bus 001 Device 002: ID 05e3:0610 Genesys Logic, Inc. 4-port hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
augusto@Legion:~$ lsmod | grep ch34
ch341                  20480  0
usbserial              53248  1 ch341
===

Without this module it is impossible to work with a relevant number of
SBC devices, besides the named Wemos D1 Mini.

Trying to solve the problem I also downloaded and installed the module
source from https://github.com/juliagoda/CH341SER and compiled on my
PC, after removing the "secure boot" feature.

Thank you for any help.

Note: I originally posted this question on AskUbuntu
(https://askubuntu.com/questions/1304116/problem-with-the-ch341-driver-in-ubuntu-20-04),
but with no answer after 40+ views.
