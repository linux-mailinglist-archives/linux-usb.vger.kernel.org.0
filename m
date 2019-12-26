Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C83D12AB4C
	for <lists+linux-usb@lfdr.de>; Thu, 26 Dec 2019 10:31:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbfLZJbP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Dec 2019 04:31:15 -0500
Received: from mail-ed1-f50.google.com ([209.85.208.50]:35939 "EHLO
        mail-ed1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbfLZJbP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Dec 2019 04:31:15 -0500
Received: by mail-ed1-f50.google.com with SMTP id j17so22109289edp.3
        for <linux-usb@vger.kernel.org>; Thu, 26 Dec 2019 01:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=/nmn4YJh2mSRsFqiML/jYxjaa0kKiTQhQqqheiLJa+A=;
        b=FyQ/fNylvSkndiUh1ewecdxt8ISPPnJ9idi69e4b9xY4xY/t592+oDdw0F1BkLzuU9
         olMixkUn/Fz4+VQulXxNvvJEh4tCgn6it2t0f6thJszikQCOwcEdMnqI+VCFHTstnRy9
         Zu5cRewi2WUH+mk6QGKs4OxiC1dLFpBueRr5qYIyoj5nt75lBWPaSIl4jA3nmudI8ihe
         eFKUTz9KMp86UVDdlptVAW0KFEJPcQ+oL2N6RfEs9XEpdL1Z4Bj/EBoVaAmDarrsVblz
         NhxYBzrzgqyL32uzNNizi7Oj4yiGGiVAVmILqBp1KLMZQVm0vINaYduhe/XVTecNXdOH
         CJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=/nmn4YJh2mSRsFqiML/jYxjaa0kKiTQhQqqheiLJa+A=;
        b=Cvr5P6o+jYq3IN6VC+YJTNVBSv1jATSWsS5bp7WEcm6Y6CUq3Bc3yhhp8wzOBGY943
         FKRZWhivlyFULK327bVqmATWefRPMghpmr186MtfB5+QWjiHX7T7UnMWWDM64SFj2NZn
         va65ynldLsP6VWfiG7SN7VDrlJ/8gXAnqNri1LjJNvApYRmazAJWZfjFHA/dQM13pz1V
         PG3yTSvm6bvIkquS27pfn/4PChDcXwxA30T2QXUEyppIkLe8dirbw9KEZxzcseH33fg+
         XB9g4WtIHlLc3gwpPXEJz58h7oHnMyNGdQiSCCPQnua1XJoN3MAYbwg9fpmGGL1uq6a1
         5iPQ==
X-Gm-Message-State: APjAAAUkGntuMMYQamdWPfhH89aSqwbYKzktvOOqpit2H50Ct1mVOnON
        KL9hws0ONu60vQ4NeqbYC4EN4cofaeNAHB9QnPb0pEP03mA=
X-Google-Smtp-Source: APXvYqzva6EOcQr3K3vJKDtTAMY/em5QVfFBK0QDv9Fa4SNbf26DffBGML0CRFzO9bRIp5SZZM0H+ZAD10XyRWIQXDQ=
X-Received: by 2002:a17:906:ae8f:: with SMTP id md15mr47577530ejb.35.1577352672924;
 Thu, 26 Dec 2019 01:31:12 -0800 (PST)
MIME-Version: 1.0
From:   RAJESH DASARI <raajeshdasari@gmail.com>
Date:   Thu, 26 Dec 2019 15:01:03 +0530
Message-ID: <CAPXMrf_d_uKZbohYWfO8rVEg7voBhESesU0w8Ng0M=wsw_75FQ@mail.gmail.com>
Subject: Reg: USB network interface is down after the reboot
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I have an USB network Interface connected between two devices.

                      usb0
Device A       ---------      Device B

Device A side:

ifconfig usb0
usb0      Link encap:Ethernet  HWaddr 72:81:17:44:9A:C6
          inet addr:169.254.0.18  Bcast:0.0.0.0  Mask:255.255.240.0
          inet6 addr: fe80::7081:17ff:fe44:9ac6/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:104 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:0 (0.0 B)  TX bytes:7553 (7.3 KiB)

Device B side:

ifconfig usb0
usb0      Link encap:Ethernet  HWaddr DA:A4:50:01:5C:B8
          inet addr:169.254.0.17  Bcast:169.254.15.255  Mask:255.255.240.0
          inet6 addr: fe80::d8a4:50ff:fe01:5cb8/64 Scope:Link
          UP BROADCAST RUNNING  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:913 errors:200 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:0 (0.0 B)  TX bytes:319658 (312.1 KiB)

Ping from device A usb to device B usb interface is working fine.

# ping 169.254.0.17
PING 169.254.0.17 (169.254.0.17) 56(84) bytes of data.
64 bytes from 169.254.0.17: icmp_seq=1 ttl=64 time=0.807 ms
64 bytes from 169.254.0.17: icmp_seq=2 ttl=64 time=0.459 ms

I have restarted the Device B and i could see the below logs on Device
A console.

usb 1-3.3: USB disconnect, device number 5
cdc_ether 1-3.3:2.0 usb0: unregister 'cdc_ether' usb-0000:00:15.0-3.3,
CDC Ethernet Device
usb 1-3.4: USB disconnect, device number 6
usb 1-3: USB disconnect, device number 4

When the Device B was coming up  the below logs are seen on the device
A console.

usb 1-3.3: new high-speed USB device number 8 using xhci_hcd
cdc_ether 1-3.3:2.0 usb0: register 'cdc_ether' at
usb-0000:00:15.0-3.3, CDC Ethernet Device, 4e:7b:fc:19:ad:62

Device B side usb0 interface is up and RUNNING after the Device B
reboot but the usb0 interface  on the device A shows that interface is
down and it is RUNNING bit
is set not set.

Device B side:
ifconfig usb0
usb0      Link encap:Ethernet  HWaddr 76:2D:4D:E7:76:73
          inet addr:169.254.0.17  Bcast:169.254.15.255  Mask:255.255.240.0
          inet6 addr: fe80::742d:4dff:fee7:7673/64 Scope:Link
          UP BROADCAST RUNNING  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:8 errors:8 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:0 (0.0 B)  TX bytes:648 (648.0 B)

Device A side:

ifconfig usb0
usb0      Link encap:Ethernet  HWaddr 72:81:17:44:9A:C6
          BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

Driver used at device A side:
ethtool -i usb0
driver: cdc_ether
version: 22-Aug-2005
firmware-version: CDC Ethernet Device
expansion-rom-version:
bus-info: usb-0000:00:15.0-3.3

kernel version: 4.9.164

Could someone please help, why the usb0 is down on Device A side and
it there is any known issue or is this  expected behaviour?

Regards,
Rajesh.
