Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC08B12CE2B
	for <lists+linux-usb@lfdr.de>; Mon, 30 Dec 2019 10:22:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727299AbfL3JWc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Dec 2019 04:22:32 -0500
Received: from mail-ed1-f48.google.com ([209.85.208.48]:41156 "EHLO
        mail-ed1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727162AbfL3JWc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Dec 2019 04:22:32 -0500
Received: by mail-ed1-f48.google.com with SMTP id c26so32048918eds.8
        for <linux-usb@vger.kernel.org>; Mon, 30 Dec 2019 01:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=vUe0w7TDEfqQFOmBMK0L3YNRUeurEJcVAoTgIN6ZN5g=;
        b=bXTkUYVhERxGsQ4NjqXFZd3KKAMFONpbcxhsm0t1C2kkrtBa8NqYYro3g9hAzdt0gB
         wpYx8KvdbjgMWoLYsTlOR1imiwtEtkQUX0g++vxQS10vXNdgZRZ28eBNulEG0yt7I+3D
         AQGXT2mUY0QYxBh46dI8y3R529ZQ8lizruZTbw2UzVHxfna9Jbdki4VKyZuUBTmy4HL9
         gzfFqXTVGSrfmI/6o5qEEI6mHai0229DcU4aM5MxNHrMbhN+E+1XwLNbDZu74lKUkoo8
         DHlXGVPcHzwbVGtETtcIGWXYeVftL6ufhdZaku/TBxVEA9QA5XL0S2lC5KHGNSyU64hC
         OXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=vUe0w7TDEfqQFOmBMK0L3YNRUeurEJcVAoTgIN6ZN5g=;
        b=oHKy761tXZPJUlOStOdhDIr35lG5o51dDbE7+AHKz5sbm9beKm+ZxAOeL1YhXdsWvA
         LZqOEpCOY+5jnGcDYvr5/e5zqXCEPchOqCupi/qzQ/fVh0puMzb7I9bDQ1jwvazMxgs4
         LVNAn9TmY/1IW/BRQ0d4nMncI7aqVQH0ofrYggvRnin2EdYNgeAzm3b4iojgOjLPRXoe
         m4KePLmqEfhyeYzRGMLKOCVPPSwBteSSnUze1oUXrJwX7PiVrLhXmWuDUFyCjvPb1oi2
         xxLYDQv9dAsAKL4Ac8zN1F5mkKHsirzgf0wDSFLm5eu9z3zEJ/msQqjhwqdAAlyUWVid
         pmzA==
X-Gm-Message-State: APjAAAV/x24jkQWjdsYl5Qgrd2boMsvLGr+wOhd32NieH2zEPYFkLzxH
        juG9TNvTF319At9TfzXJU75I2++b0QVAAbDkHJ2TubZV
X-Google-Smtp-Source: APXvYqwaLjsRowLVB+VrWlf9GAgEpgYKNa6y5Oz8QWlD+GTQN9Ma0ebCyWJF/z517dhFDBX57iTpJSO5nzzlNQ5wMeI=
X-Received: by 2002:a50:a824:: with SMTP id j33mr69836685edc.274.1577697750033;
 Mon, 30 Dec 2019 01:22:30 -0800 (PST)
MIME-Version: 1.0
References: <CAPXMrf_d_uKZbohYWfO8rVEg7voBhESesU0w8Ng0M=wsw_75FQ@mail.gmail.com>
In-Reply-To: <CAPXMrf_d_uKZbohYWfO8rVEg7voBhESesU0w8Ng0M=wsw_75FQ@mail.gmail.com>
From:   RAJESH DASARI <raajeshdasari@gmail.com>
Date:   Mon, 30 Dec 2019 14:52:25 +0530
Message-ID: <CAPXMrf-kf9ZsYKUBffZW2MrMJVQr3M9dSb1djaBspOGoF63FFg@mail.gmail.com>
Subject: Re: Reg: USB network interface is down after the reboot
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Could someone please respond to my query.
Thanks,
Rajesh.

On Thu, Dec 26, 2019 at 3:01 PM RAJESH DASARI <raajeshdasari@gmail.com> wrote:
>
> Hi,
>
> I have an USB network Interface connected between two devices.
>
>                       usb0
> Device A       ---------      Device B
>
> Device A side:
>
> ifconfig usb0
> usb0      Link encap:Ethernet  HWaddr 72:81:17:44:9A:C6
>           inet addr:169.254.0.18  Bcast:0.0.0.0  Mask:255.255.240.0
>           inet6 addr: fe80::7081:17ff:fe44:9ac6/64 Scope:Link
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:104 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:1000
>           RX bytes:0 (0.0 B)  TX bytes:7553 (7.3 KiB)
>
> Device B side:
>
> ifconfig usb0
> usb0      Link encap:Ethernet  HWaddr DA:A4:50:01:5C:B8
>           inet addr:169.254.0.17  Bcast:169.254.15.255  Mask:255.255.240.0
>           inet6 addr: fe80::d8a4:50ff:fe01:5cb8/64 Scope:Link
>           UP BROADCAST RUNNING  MTU:1500  Metric:1
>           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:913 errors:200 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:0
>           RX bytes:0 (0.0 B)  TX bytes:319658 (312.1 KiB)
>
> Ping from device A usb to device B usb interface is working fine.
>
> # ping 169.254.0.17
> PING 169.254.0.17 (169.254.0.17) 56(84) bytes of data.
> 64 bytes from 169.254.0.17: icmp_seq=1 ttl=64 time=0.807 ms
> 64 bytes from 169.254.0.17: icmp_seq=2 ttl=64 time=0.459 ms
>
> I have restarted the Device B and i could see the below logs on Device
> A console.
>
> usb 1-3.3: USB disconnect, device number 5
> cdc_ether 1-3.3:2.0 usb0: unregister 'cdc_ether' usb-0000:00:15.0-3.3,
> CDC Ethernet Device
> usb 1-3.4: USB disconnect, device number 6
> usb 1-3: USB disconnect, device number 4
>
> When the Device B was coming up  the below logs are seen on the device
> A console.
>
> usb 1-3.3: new high-speed USB device number 8 using xhci_hcd
> cdc_ether 1-3.3:2.0 usb0: register 'cdc_ether' at
> usb-0000:00:15.0-3.3, CDC Ethernet Device, 4e:7b:fc:19:ad:62
>
> Device B side usb0 interface is up and RUNNING after the Device B
> reboot but the usb0 interface  on the device A shows that interface is
> down and it is RUNNING bit
> is set not set.
>
> Device B side:
> ifconfig usb0
> usb0      Link encap:Ethernet  HWaddr 76:2D:4D:E7:76:73
>           inet addr:169.254.0.17  Bcast:169.254.15.255  Mask:255.255.240.0
>           inet6 addr: fe80::742d:4dff:fee7:7673/64 Scope:Link
>           UP BROADCAST RUNNING  MTU:1500  Metric:1
>           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:8 errors:8 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:0
>           RX bytes:0 (0.0 B)  TX bytes:648 (648.0 B)
>
> Device A side:
>
> ifconfig usb0
> usb0      Link encap:Ethernet  HWaddr 72:81:17:44:9A:C6
>           BROADCAST MULTICAST  MTU:1500  Metric:1
>           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:1000
>           RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
>
> Driver used at device A side:
> ethtool -i usb0
> driver: cdc_ether
> version: 22-Aug-2005
> firmware-version: CDC Ethernet Device
> expansion-rom-version:
> bus-info: usb-0000:00:15.0-3.3
>
> kernel version: 4.9.164
>
> Could someone please help, why the usb0 is down on Device A side and
> it there is any known issue or is this  expected behaviour?
>
> Regards,
> Rajesh.
