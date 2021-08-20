Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D55A3F2D23
	for <lists+linux-usb@lfdr.de>; Fri, 20 Aug 2021 15:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234553AbhHTNbU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Aug 2021 09:31:20 -0400
Received: from mout.gmx.net ([212.227.17.21]:56799 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229707AbhHTNbU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 20 Aug 2021 09:31:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1629466229;
        bh=CzX7hi+vbXIJgCjKxc7ExDQbURD/bhsHAtQOZWHlHuE=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=ZdhM5JAm6Bgufr2p8xjVLPSBTrnLh4J7rhuCBBG5sF9cLqYtVZrucIMj0cXNJtRhs
         oYs2IXtMyv/BgBzkYo9CTFv640a3tVHO/PzsR/dCniTsRmFSuEQ8BjLGG5D/3iLMJb
         fflXtafxrIFgN8lkbsW3Ln0ipzS57LtmTE+/QRQA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.6] ([91.64.210.93]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MzQkK-1n3Q1d0Dho-00vPL9; Fri, 20
 Aug 2021 15:30:29 +0200
Subject: Re: [PATCH v4 2/9] usb: isp1760: move to regmap for register access
To:     Rui Miguel Silva <rui.silva@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org
References: <20210513084717.2487366-1-rui.silva@linaro.org>
 <20210513084717.2487366-3-rui.silva@linaro.org>
From:   Dietmar Eggemann <deggeman@gmx.de>
Message-ID: <11ed5458-4b88-ad72-4497-89ff9346a40b@gmx.de>
Date:   Fri, 20 Aug 2021 15:30:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210513084717.2487366-3-rui.silva@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:npqCNr8ExQrz5AI4K5EBJHi2PCFEMdp0Yz0plVD/QVUULpzWNKB
 oipIcZUuEpZakWpIqs16b2PBzHa22772NaAFjDZdo8dwDyEs4MtMKH0yMzdD58kz+OC5Eud
 eYdg48GYWZ0uotfu0kKUC7Q9sXuV3EXPJEQQr6RmCvE2uFy6H9/se8duVbLTBCcMiAUfM05
 ovVf5dEajDjJYwwmeQNPg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dgjU/O3nP9s=:vMgUjk4Emx0OVOz8qOK7dB
 +FzXabBsOIBF6BChOlM+SqMigTi5JbopuY90+jo/u+mGOpsh1YIBKW/aX07XX5Y1bWkq1RAYF
 OUO0m+NZybMnHVr2Y7zey1ghXN2zp3yE7Hy3/JtkSW2E3rzk3cbXNluJrCN5lWHm20rlDwHgS
 ACSqTLNzamQChu6kZZmkfcl+zR8SlGzRTMEP0ugxOUGGOnTfZZnzmIuRt1WOLkBAD9xEUZFXk
 GP5WSVYAq07tM0ONKTNQRyOXwTwyOpp754Tc8jNZ4vbDLfmOQaU85A4HY4Z+TdTedYB50bQdR
 HDO7gllupdhZV9f9OY+4USBhcCgvvrSHkszy1YbyTekKauTQnfNpTgy/+Muj9uPCo2c9y3xLf
 a6OAMWMfyc6bCny+Zh1fVuvgIYy7kNAPmVpYnMaI3FfUzPcwgryNT5FG4iWhDY4XKYFgPIiZA
 buYnR2tlYLW2iNTV7iVTtj1I74628yxVw0x1l/pd3Mjad8xpl5Ug2uafOVlVvvRC48umA4gAR
 q/RaAn+sJzEgQiqY/9BtL/+8XS46xntr14wpc6ArfIPYe1AGmahXdz0MtU2F8v+ml0AlHzIxy
 PHdqsONCJHNOQZyv+m3rhQOAnBENSRfytCio8rCgNMxyBxvcUm0GNKPeF24gP1/VDbodEs08r
 5ZbBKQpNVPL8ffrcBblS0TRN7ih1O0ULvRhaggJc7sRZNwlUAlIQjKzBdQpl9BaFrQkOIoKUb
 Ty3ZZeJ0nfpk+iXS5kTyBGOYE7J5w+rQJj5NtuAnyGWnhkiFDT8Om8CaNUnB20hhrOvSTp6Zd
 +nxjTb/YyFIMsXpESmxJgqZG37hRdE0FfaTyOP+D4YDYTE3rUYL19yo7oFkKlqXzR7DHLlwaI
 iH/t381czPQJQDB+NSHqPLrYmKAHFxJ3a2lOynVBjc6P3iWPyF6o1fUl5jkDBnO0jiFv3KsLT
 xGVGYLDk4SWVcCANod0nFy2q+qXE/M6Il5G1n2ECAZ6qoaJ99K5BOhNsEj5opWufkdWpYtUoQ
 abMclu2oC/WPj4Z6rZURFWBIXMyuiTTU9COT+Vjlx5Hrva5tIJTtyW+bbuTkz7ova4YHzmeQv
 1JY+5M6cTzdDH1KNg43y1cLdGxHNVl/ZLDwe7YYJpb1/aLMt3KJwg0Kuw==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Rui,

On 13/05/2021 10:47, Rui Miguel Silva wrote:
> Rework access to registers and memory to use regmap framework.
> No change in current feature or way of work is intended with this
> change.
>
> This will allow to reuse this driver with other IP of this family,
> for example isp1763, with little changes and effort.
>

1da9e1c06873 - usb: isp1760: move to regmap for register access

Starting from this patch, our Arm TC2 platform (multi_v7_defconfig,
vexpress-v2p-ca15_a7.dts) doesn't boot anymore.
We discovered this in our v5.14-rc1 based task scheduler test build.

With 1da9e1c06873^1 :

# lsusb
Bus 001 Device 001: ID 1d6b:0002 <-- NXP ISP1760 USB Host Controller
Bus 001 Device 002: ID 0471:3526
Bus 001 Device 003: ID 0781:5591

# dmesg | grep -i isp
[    4.014307] isp1760 1b000000.usb: bus width: 32, oc: digital
[    4.014442] isp1760 1b000000.usb: NXP ISP1760 USB Host Controller
[    4.014715] isp1760 1b000000.usb: new USB bus registered, assigned bus =
number 1
[    4.025076] isp1760 1b000000.usb: irq 32, io mem 0x1b000000
[    4.025288] isp1760 1b000000.usb: USB ISP 1761 HW rev. 1 started
[    4.055802] ISP1760 USB device initialised
[    4.257911] isp1760 1b000000.usb: port 1 high speed
[    4.325662] usb 1-1: new high-speed USB device number 2 using isp1760
[    4.475670] isp1760 1b000000.usb: port 1 high speed
[   14.320372] usb 1-1.2: new high-speed USB device number 3 using isp1760

With v5.14-rc1 :

there is no boot output at all, but I debugged it a little bit and the
system seems to hang here:

[    1.847494] [<c0cac46c>] (isp1760_udc_register) from [<c0ca668c>] (isp1=
760_register+0x5d0/0x5f0)
[    1.847527] [<c0ca668c>] (isp1760_register) from [<c0ca6b7c>] (isp1760_=
plat_probe+0x150/0x1b0)
[    1.847557] [<c0ca6b7c>] (isp1760_plat_probe) from [<c0a46ef0>] (platfo=
rm_probe+0x5c/0xb8)
[    1.847589] [<c0a46ef0>] (platform_probe) from [<c0a44924>] (really_pro=
be.part.0+0x9c/0x32c)
...

    isp1760_udc_register()->isp1760_udc_init()

        ....
        /* Reset the device controller. */
        isp1760_udc_set(udc, DC_SFRESET); <-- hangs here !!!
        usleep_range(10000, 11000);
        isp1760_reg_write(udc->regs, ISP176x_DC_MODE, 0);
        usleep_range(10000, 11000);

[...]
