Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 628591B3871
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2020 09:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbgDVHFg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Apr 2020 03:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725786AbgDVHFf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Apr 2020 03:05:35 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 942A3C03C1A6
        for <linux-usb@vger.kernel.org>; Wed, 22 Apr 2020 00:05:35 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id h2so998275wmb.4
        for <linux-usb@vger.kernel.org>; Wed, 22 Apr 2020 00:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=nkQ1sdWjNjO0sNn1OzyMZt4FFWvCk8//wpF1XIISOo4=;
        b=gOBXEQvF2tucgrPeza+udPK/DBNnCCMD3TtPwUPXFFmC2NtfuyNTSwKEH/AY7GPamg
         hMdBKSlo2xjFqvZHXcxv4RTZqSVrc3jxyDSw7cv+N2j5FsKL8fz/G05xmodsRuuKFo9x
         2l2guDiwm9HQRJ6fSXn97I0BVX4CkzrbWbOQyCWqS1S4jLcBDnSmbNbFA84/8TTDems4
         JkfQ4s9MAhUFTER2zyIwDE0uFcWGiFORHRDiANH5rkAaCQxi9j46149WvP6iCyMMrfTn
         ILo4GQd7HNKLgTLEUK7gUEy7WEVXLt3hulRdfdHGl6nQZNJzZFlqKYaSwnw8VNBQxu1C
         XBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=nkQ1sdWjNjO0sNn1OzyMZt4FFWvCk8//wpF1XIISOo4=;
        b=n4o7W6HGRBqj+X4LwYarEpjpnnBZvYtSUY76Ja7nUr9y+gTirC3JRHWi+zzvZOiEIC
         GU2NqMLFR1JWDZ++DjfNL33zQdpn/koq1ht+/S/qsSJBobV92eho6eg6EreMRV/lxoed
         HX9+gog+z4hjwPqR5NdUQ131+/ysbKpz9SBzTe4WaVZMDGHdPE4pWzpqBEPTg0R9Uzwq
         37E2O/FgkD/ujGA7uk6IkUhQl+llAUMlV8uZuDguDXwPdf6rnJ8MQJomg5DSIh3dP5W5
         Gy+Xl3T4zcdrdMWuTNzwbigZer9ltjmI9so53wemCIKUVxdts5JQXNizvHwePmbfMVy4
         vSwg==
X-Gm-Message-State: AGi0PuZikBvrrc1e7vB47JbJ1rJfAfKa9w4ED3F71PZ2XNeVbY2R3nT9
        wRcZEmjwVphjs7YnztCY8c2jEehwwt8=
X-Google-Smtp-Source: APiQypLocQAzuS8B76OgEBa3j2OLrhInCAWSU78gnINet1YNNTxMxjS85hVFv/rQ0jr8WDGiFLOlyQ==
X-Received: by 2002:a1c:6787:: with SMTP id b129mr9209704wmc.165.1587539133808;
        Wed, 22 Apr 2020 00:05:33 -0700 (PDT)
Received: from [192.168.1.103] ([149.200.161.180])
        by smtp.gmail.com with ESMTPSA id s6sm6430454wmh.17.2020.04.22.00.05.32
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2020 00:05:33 -0700 (PDT)
To:     linux-usb@vger.kernel.org
From:   xchetah <xchetah@gmail.com>
Subject: USB bug on BCM6318
Message-ID: <0af6243c-9c1d-ebcc-5bdd-b070816d8872@gmail.com>
Date:   Wed, 22 Apr 2020 10:05:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

  Hi
I’m using openwrt on bcm63xx bcm6318 sagemcom F@ST 2704N V1.
the router is actually V1.1 (16MB flash , 64MB RAM).
trying to connect a usb wifi dongle as AP

lsusb -v

Bus 002 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               1.10
   bDeviceClass            9 Hub
   bDeviceSubClass         0 Unused
   bDeviceProtocol         0 Full speed (or root) hub
   bMaxPacketSize0        64
   idVendor           0x1d6b Linux Foundation
   idProduct          0x0001 1.1 root hub
   bcdDevice            4.14
   iManufacturer           3 Linux 4.14.171 ohci_hcd
   iProduct                2 Generic Platform OHCI controller
   iSerial                 1 ohci-platform
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength           25
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xe0
       Self Powered
       Remote Wakeup
     MaxPower                0mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         9 Hub
       bInterfaceSubClass      0 Unused
       bInterfaceProtocol      0 Full speed (or root) hub
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0002  1x 2 bytes
         bInterval             255
Hub Descriptor:
   bLength               9
   bDescriptorType      41
   nNbrPorts             1
   wHubCharacteristic 0x0002
     No power switching (usb 1.0)
     Ganged overcurrent protection
   bPwrOn2PwrGood        2 * 2 milli seconds
   bHubContrCurrent      0 milli Ampere
   DeviceRemovable    0x00
   PortPwrCtrlMask    0xff
  Hub Port Status:
    Port 1: 0000.0100 power
Device Status:     0x0001
   Self Powered

Bus 001 Device 002: ID 148f:5370 Ralink Technology, Corp. RT5370 
Wireless Adapter
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass            0 (Defined at Interface level)
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0        64
   idVendor           0x148f Ralink Technology, Corp.
   idProduct          0x5370 RT5370 Wireless Adapter
   bcdDevice            1.01
   iManufacturer           1 Ralink
   iProduct                2 802.11 n WLAN
   iSerial                 3 1.0
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength           67
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0x80
       (Bus Powered)
     MaxPower              450mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           7
       bInterfaceClass       255 Vendor Specific Class
       bInterfaceSubClass    255 Vendor Specific Subclass
       bInterfaceProtocol    255 Vendor Specific Protocol
       iInterface              5 1.0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x01  EP 1 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x02  EP 2 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x03  EP 3 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x04  EP 4 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x05  EP 5 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x06  EP 6 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
Device Qualifier (for other device speed):
   bLength                10
   bDescriptorType         6
   bcdUSB               2.00
   bDeviceClass            0 (Defined at Interface level)
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0        64
   bNumConfigurations      1
Device Status:     0x0000
   (Bus Powered)

Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass            9 Hub
   bDeviceSubClass         0 Unused
   bDeviceProtocol         0 Full speed (or root) hub
   bMaxPacketSize0        64
   idVendor           0x1d6b Linux Foundation
   idProduct          0x0002 2.0 root hub
   bcdDevice            4.14
   iManufacturer           3 Linux 4.14.171 ehci_hcd
   iProduct                2 EHCI Host Controller
   iSerial                 1 ehci-platform
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength           25
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xe0
       Self Powered
       Remote Wakeup
     MaxPower                0mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         9 Hub
       bInterfaceSubClass      0 Unused
       bInterfaceProtocol      0 Full speed (or root) hub
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0004  1x 4 bytes
         bInterval              12
Hub Descriptor:
   bLength               9
   bDescriptorType      41
   nNbrPorts             1
   wHubCharacteristic 0x0009
     Per-port power switching
     Per-port overcurrent protection
   bPwrOn2PwrGood       10 * 2 milli seconds
   bHubContrCurrent      0 milli Ampere
   DeviceRemovable    0x00
   PortPwrCtrlMask    0xff
  Hub Port Status:
    Port 1: 0000.0503 highspeed power enable connect
Device Status:     0x0001
   Self Powered

the problem is that there’s no connectivity at all , I can connect to 
the AP (only without encryption ) and the ssid doesn’t always show on my 
mobile phone.
the usb port is working fine , I tried mounting a usb flash drive with 
no problem.
also the adapter is working , I tried it on Orange pi , Raspberrypi , 
bcm6328 , all with openwrt installed on them and didn’t have any problem .
I guess it is something related to bcm6318 or its architecture code .
the onboard broadcom pci wifi is working .
I suspected that its a power problem so I added an external usb power , 
but with same issues.
also I tried openwrt 19 ,18 ,17 with same problem.
I’m also using two bcm6328 routers as point to point wifi 5ghz link with 
Ralink RT5572 chipset ( rt2800usb driver ) withouyt any problem.
dmesg is filled with :

[ 1269.191198] rt2800usb_tx_sta_fifo_read_completed: 13054 callbacks 
suppressed
[ 1269.191239] ieee80211 phy1: rt2800usb_tx_sta_fifo_read_completed: 
Warning - TX status read failed -32
[ 1269.208421] ieee80211 phy1: rt2800usb_tx_sta_fifo_read_completed: 
Warning - TX status read failed -32
[ 1269.218373] ieee80211 phy1: rt2800usb_tx_sta_fifo_read_completed: 
Warning - TX status read failed -32
[ 1269.228285] ieee80211 phy1: rt2800usb_tx_sta_fifo_read_completed: 
Warning - TX status read failed -32
[ 1269.238151] ieee80211 phy1: rt2800usb_tx_sta_fifo_read_completed: 
Warning - TX status read failed -32
[ 1269.248029] ieee80211 phy1: rt2800usb_tx_sta_fifo_read_completed: 
Warning - TX status read failed -32
[ 1269.257902] ieee80211 phy1: rt2800usb_tx_sta_fifo_read_completed: 
Warning - TX status read failed -32
[ 1269.267793] ieee80211 phy1: rt2800usb_tx_sta_fifo_read_completed: 
Warning - TX status read failed -32
[ 1269.278183] ieee80211 phy1: rt2800usb_tx_sta_fifo_read_completed: 
Warning - TX status read failed -32
[ 1269.287995] ieee80211 phy1: rt2800usb_tx_sta_fifo_read_completed: 
Warning - TX status read failed -32

using rmmod to remove rt2800usb module results in kernel crash 
/sometimes hang and sometimes panic and reboot.

steps to reproduce:
-boot the router with usb wifi dongle
-configure it as access point or client mode and enable it
- dmesg log starts to fill and adapter is not working

