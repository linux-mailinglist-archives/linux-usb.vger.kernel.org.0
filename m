Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC1A95AFC7
	for <lists+linux-usb@lfdr.de>; Sun, 30 Jun 2019 14:18:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbfF3MS0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 30 Jun 2019 08:18:26 -0400
Received: from mout.gmx.net ([212.227.15.19]:46047 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726500AbfF3MS0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 30 Jun 2019 08:18:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561897105;
        bh=0zmsCUU6qb7mZLDFYTc5iYIo6w3oDMmlFdnDrEv2aPo=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=PGQgaYdk49ehGrrfdh+XJy8xky3/63E51vAwBCCHpSui6HHdZEEy800tbHwq/B2dC
         KYQ8cnDszv81HcM/77gF2AlOu6UFAmePAhKam/lcecWgwptYJ2SfBnLKNl3/x61QB/
         OTYR4Trm+wQa/AK87aw+9Jls5BJEJ1/s6nd13rvg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.2.102] ([94.218.88.45]) by mail.gmx.com (mrgmx003
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MBnSJ-1hsG2Q0Cvf-00ApFi for
 <linux-usb@vger.kernel.org>; Sun, 30 Jun 2019 14:18:25 +0200
Message-ID: <5D18A890.1040100@gmx.net>
Date:   Sun, 30 Jun 2019 14:18:24 +0200
From:   Markus Breunig <Markus.L.Breunig@gmx.net>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To:     linux-usb@vger.kernel.org
Subject: New USB Device
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZQOOmN/zZEXfVRp4RxmphwQKbChHE2DVEreczPqkOSoc4c5XKbl
 PEo945CHzqRx1Eij6M0IpL07hv774YOy2Y02rFzoZ6ZOcDSpegY5ekWiOJr1DSDRsHL6AGU
 0jnHLB+FdT3H9hQz/afT3j66YyHwSr9bSulydTPyTv2ly4BAO7eIMIK4ouJCc3/8sqczHOg
 SD+/3oUcHfP9bTss1zwyw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0pmSih1oqI0=:q81pnFYwTvaN4FMK6V4AfB
 OqOxbNpXkbGL5eiti7xmIoYu2rTYCRiO7pgKV/SkydQITB4EH/lis5dFh0eXb8UkRlOnSChXz
 hT7TwBA2MAxmi/SvfD6DCejNcrb5zm5P6feoWj9e7x9rAcBHldsjofj54IHnJKxrImwzSutEd
 K2bCIFnVFy7gCuSNN+ywejZs8iLXI5h/xL08TXfVd2OkQ9gcchiuuxRrtY33x2go5+HAPLP74
 he5WSHhPUm+tPjojXBbqwZsIcW+ODuR6NtUpao6KcjVpNckt05CWF10ondxzEYdstLtiZw4K4
 V+NVTDhbbirSHvqxq1OpWz+c4TDeYNsY8XD2eQKbfEUA1N1ACMZG/xDjSGUmkyMogoNF1Pifo
 aWFwDj4AX1QwUAwcszMzVnIDng7zr4M38eio9PZlmNY1OmJSq7uXiH/87M8QMr+ZxE4z7HCmU
 DrR71iF7gFmL70aTtsBFcGKWlfCg1GQZwqgN8hQH7fKzAbSGcJIpuv3Iy2OzrYVPPD+94RbwP
 y1++XymwF0qn9L+W5jL3iIccVZ3iXNWZxlGcIFScR8Pt+Ldzwpfx+m2PrkNpZJ5YhunbInks+
 FjBq4iFUC+sjTozyUjsWoXKa9aWjTz7iyGjVMv6NyDIFbWnv7gyVWcVm2q4ny5DJzRS+zg1CZ
 U4Ny/jVBh4l2YYvPRDFV7n7BXMr5sRkfImhmOMTdH8w1RwZTUkiZFrwREzIzPnz7bc9pZMpiQ
 dmkLKycRM1FQTq3EWW+Fco4F82s+Ne5X7sd1lH2jYxV0QzGO///TjSDvGgQeBOpEcdshxm5Pp
 au45FsJZKGkk46cYAei3UmjxhdfYV6lWiSo74S/rY5yl2odaxBBcmTBq1wh3llyhMaMqrED/b
 UWrAV4wPJLm11JpgbnDjEAQc+AdQVLNWb8pGufNgyQ8LyI6b5/yS6b5MrzoEs8+BYe2VSQj0A
 /BqkieJQVAglkQtIuVF2/Apqu2Pa6oW8BbaB7KVTOJFhbTBpggXBI9IvWXvyRXTezCYH14Yoq
 0WMAigr9Um4R94/uRHsymdnrletIpGvXw1eJgou2GWMOAMtbwSkBKJig/DSzsJi9Ybs1HBB4C
 Raf6t9lYK9+HKvHKd3S4HtnJMdhw4HAPE3L
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

my Raspberry Pi told me to send you the following information. I hope it
helps ...

best regards

Markus

=2D-------------------------------
[    2.081893] usb 1-1.2: new full-speed USB device number 4 using dwc_otg
[    2.219804] usb 1-1.2: New USB device found, idVendor=3D04d8,
idProduct=3Df8e8, bcdDevice=3D48.12
[    2.219821] usb 1-1.2: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D3
[    2.219830] usb 1-1.2: Product: GNS 5890 ADS-B Receiver
[    2.219839] usb 1-1.2: Manufacturer: www.gns-gmbh.com
[ 1517.863755] usbcore: registered new interface driver usbserial_generic
[ 1517.863830] usbserial: USB Serial support registered for generic
[ 1517.863916] usbserial_generic 1-1.2:1.0: The "generic" usb-serial
driver is only for testing and one-off prototypes.
[ 1517.863927] usbserial_generic 1-1.2:1.0: Tell
linux-usb@vger.kernel.org to add your device to a proper driver.
[ 1517.863939] usbserial_generic 1-1.2:1.0: device has no bulk endpoints
[ 1517.864009] usbserial_generic 1-1.2:1.1: The "generic" usb-serial
driver is only for testing and one-off prototypes.
[ 1517.864018] usbserial_generic 1-1.2:1.1: Tell
linux-usb@vger.kernel.org to add your device to a proper driver.
[ 1517.864028] usbserial_generic 1-1.2:1.1: generic converter detected
[ 1517.865108] usb 1-1.2: generic converter now attached to ttyUSB0
