Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40F8520A71B
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jun 2020 22:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405259AbgFYUyA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Jun 2020 16:54:00 -0400
Received: from mon2.sibername.com ([162.144.51.228]:44267 "EHLO
        mon1.sibername.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2405184AbgFYUx7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Jun 2020 16:53:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lockie.ca;
         s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
        Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=+FWW6N/zb7TS1MHD/3e/b19NaxnyCpolbBmPKRBgx3s=; b=YNhNGkRgDACJD/dij5aq5VdAdr
        vr7B6lrbl7EafdSVOBxgB4O0vJ5YqL3o48zq4zcf53gO7wL12bfaotR/CVXmjycUxZgDkEt8J0uKs
        AU9VuqYXvOw+y18K4ejOITnMTSrfnMjOzmv5jTqYWv8FUEvPDMeBaRWFYFtoji5GBB8zyceZ+67OK
        qPDroGd4uQ2NopioJ5u0iInd8hsHe+Kf+IO2yk0ANJiB3VDqaUuf9JwyZ34E1hTkGqbaVLWBfUEPP
        IO7BU2t+6/78tsdh2QD6pc5AjdMImtxasXEigr0n/fRJ7W6XqlMNBSOwTEJDDgLE+p16tYt9E+Q6b
        9rkKQ9UQ==;
Received: from 216-58-17-101.cpe.distributel.net ([216.58.17.101]:54968 helo=[192.168.1.4])
        by montreal.sibername.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <bjlockie@lockie.ca>)
        id 1joYsJ-006fic-4x
        for linux-usb@vger.kernel.org; Thu, 25 Jun 2020 16:53:56 -0400
To:     linux-usb <linux-usb@vger.kernel.org>
From:   James <bjlockie@lockie.ca>
Subject: bad hub?
Message-ID: <cfa36d30-0ca1-2a38-e12d-6068ef5b687c@lockie.ca>
Date:   Thu, 25 Jun 2020 16:53:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - montreal.sibername.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lockie.ca
X-Get-Message-Sender-Via: montreal.sibername.com: authenticated_id: bjlockie@lockie.ca
X-Authenticated-Sender: montreal.sibername.com: bjlockie@lockie.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I have a USB wifi adapter that is having problems so I thought I'd get a 
powered hub.
The wifi adapter works directly in my Raspberry Pi 4 but not in the hub.
The device appears to be there but I can't use it.
I don't understand the labelling of ports.
Does the error mean one of the ports on my hub is bad?


[ 2034.225213] usb 2-1: new SuperSpeed Gen 1 USB device number 8 using 
xhci_hcd
[ 2034.252133] usb 2-1: New USB device found, idVendor=05e3, 
idProduct=0612, bcdDevice=92.24
[ 2034.260336] usb 2-1: New USB device strings: Mfr=1, Product=2, 
SerialNumber=0
[ 2034.267487] usb 2-1: Product: USB3.0 Hub
[ 2034.271439] usb 2-1: Manufacturer: GenesysLogic
[ 2034.277570] hub 2-1:1.0: USB hub found
[ 2034.281697] hub 2-1:1.0: 4 ports detected
[ 2034.388914] usb 1-1.1: new high-speed USB device number 6 using xhci_hcd
[ 2034.502787] usb 1-1.1: New USB device found, idVendor=05e3, 
idProduct=0610, bcdDevice=92.24
[ 2034.511202] usb 1-1.1: New USB device strings: Mfr=1, Product=2, 
SerialNumber=0
[ 2034.518568] usb 1-1.1: Product: USB2.0 Hub
[ 2034.522704] usb 1-1.1: Manufacturer: GenesysLogic
[ 2034.529002] hub 1-1.1:1.0: USB hub found
[ 2034.533716] hub 1-1.1:1.0: 4 ports detected

[ 2035.646132] usb 1-1.1-port2: Cannot enable. Maybe the USB cable is bad?

[ 2040.309270] usb 2-1.1: new SuperSpeed Gen 1 USB device number 9 using 
xhci_hcd
[ 2040.334867] usb 2-1.1: New USB device found, idVendor=0e8d, 
idProduct=7612, bcdDevice= 1.00
[ 2040.343265] usb 2-1.1: New USB device strings: Mfr=2, Product=3, 
SerialNumber=4
[ 2040.350601] usb 2-1.1: Product: Wireless
[ 2040.354621] usb 2-1.1: Manufacturer: MediaTek Inc.
[ 2040.359419] usb 2-1.1: SerialNumber: 000000000
[ 2040.445815] usb 2-1.1: reset SuperSpeed Gen 1 USB device number 9 
using xhci_hcd
[ 2040.475214] mt76x2u 2-1.1:1.0: ASIC revision: 76120044
[ 2040.514953] mt76x2u 2-1.1:1.0: ROM patch build: 20141115060606a
[ 2040.688338] mt76x2u 2-1.1:1.0: Firmware Version: 0.0.00
[ 2040.693587] mt76x2u 2-1.1:1.0: Build: 1
[ 2040.697431] mt76x2u 2-1.1:1.0: Build Time: 201507311614____
[ 2041.512649] ieee80211 phy2: Selected rate control algorithm 'minstrel_ht'

I many removed the hub and reinserted it.
I don't know why
usb 2-2: Product: USB 10/100/1000 LAN
is affected, it is my TPLink USB adapter in the other USB (maybe I 
jiggled it).

# dmesg
[ 2907.250244] usb 1-1.1: USB disconnect, device number 6
[ 2907.811665] usb 2-1: USB disconnect, device number 8
[ 2907.816721] usb 2-1.1: USB disconnect, device number 9
[ 2930.688013] usb 2-2: USB disconnect, device number 7
[ 2930.693580] xhci_hcd 0000:01:00.0: WARN Set TR Deq Ptr cmd failed due 
to incorrect slot or ep state.
[ 2931.304203] usb 2-2: new SuperSpeed Gen 1 USB device number 10 using 
xhci_hcd
[ 2931.328883] usb 2-2: New USB device found, idVendor=2357, 
idProduct=0601, bcdDevice=30.00
[ 2931.337086] usb 2-2: New USB device strings: Mfr=1, Product=2, 
SerialNumber=6
[ 2931.344235] usb 2-2: Product: USB 10/100/1000 LAN
[ 2931.348948] usb 2-2: Manufacturer: TP-LINK
[ 2931.353052] usb 2-2: SerialNumber: 000001000000
[ 2931.488606] usb 2-2: reset SuperSpeed Gen 1 USB device number 10 
using xhci_hcd
[ 2931.549045] r8152 2-2:1.0 eth1: v1.10.11
[ 2934.584899] IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready
[ 2934.591844] r8152 2-2:1.0 eth1: carrier on
[ 2935.552429] usb 2-1: new SuperSpeed Gen 1 USB device number 11 using 
xhci_hcd
[ 2935.581347] usb 2-1: New USB device found, idVendor=05e3, 
idProduct=0612, bcdDevice=92.24
[ 2935.589595] usb 2-1: New USB device strings: Mfr=1, Product=2, 
SerialNumber=0
[ 2935.596750] usb 2-1: Product: USB3.0 Hub
[ 2935.600692] usb 2-1: Manufacturer: GenesysLogic
[ 2935.607169] hub 2-1:1.0: USB hub found
[ 2935.611316] hub 2-1:1.0: 4 ports detected
[ 2935.664095] usb 1-1.1: new high-speed USB device number 9 using xhci_hcd
[ 2935.788117] usb 1-1.1: New USB device found, idVendor=05e3, 
idProduct=0610, bcdDevice=92.24
[ 2935.796546] usb 1-1.1: New USB device strings: Mfr=1, Product=2, 
SerialNumber=0
[ 2935.803932] usb 1-1.1: Product: USB2.0 Hub
[ 2935.808077] usb 1-1.1: Manufacturer: GenesysLogic
[ 2935.814959] hub 1-1.1:1.0: USB hub found
[ 2935.819274] hub 1-1.1:1.0: 4 ports detected
[ 2935.912368] usb 2-1.1: new SuperSpeed Gen 1 USB device number 12 
using xhci_hcd
[ 2935.937437] usb 2-1.1: New USB device found, idVendor=0e8d, 
idProduct=7612, bcdDevice= 1.00
[ 2935.945844] usb 2-1.1: New USB device strings: Mfr=2, Product=3, 
SerialNumber=4
[ 2935.953189] usb 2-1.1: Product: Wireless
[ 2935.957225] usb 2-1.1: Manufacturer: MediaTek Inc.
[ 2935.962057] usb 2-1.1: SerialNumber: 000000000
[ 2936.048805] usb 2-1.1: reset SuperSpeed Gen 1 USB device number 12 
using xhci_hcd
[ 2936.077910] mt76x2u 2-1.1:1.0: ASIC revision: 76120044
[ 2936.109762] mt76x2u 2-1.1:1.0: ROM patch build: 20141115060606a
[ 2936.248963] mt76x2u 2-1.1:1.0: Firmware Version: 0.0.00
[ 2936.254239] mt76x2u 2-1.1:1.0: Build: 1
[ 2936.258091] mt76x2u 2-1.1:1.0: Build Time: 201507311614____
[ 2936.966265] usb 1-1.1-port2: Cannot enable. Maybe the USB cable is bad?
[ 2937.067763] ieee80211 phy3: Selected rate control algorithm 'minstrel_ht'

