Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69BA817C72D
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2020 21:40:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgCFUko (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Mar 2020 15:40:44 -0500
Received: from mon1.sibername.com ([162.144.64.251]:45738 "EHLO
        mon1.sibername.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbgCFUko (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Mar 2020 15:40:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lockie.ca;
         s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
        Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=pFmqGLUpxqUswq+LXQxYypjJaAnfeEmZLKipdavJoRk=; b=Kdsa2DRlTfN5RWlBEQvOjZ0G7d
        YOWCgtqth/r3pfebWOjigyhX/sCk24DdpSLZY5PkwdJqi5dUNodNek72I6f7NwpIR7BV6rOXhldlj
        jDuMc6WxvAvWvTCv7eRZcFwQZdFgX5phAK+XMAU28yJAQTSWyck/KhnCbfT3SITHSEwfn/VbIzyZh
        FrNC+ZlGwsrEG/N0yFtb/23bfQ8sf9fTxoVnWa2QaSMwE1FYOD4R+bA1ppJCMA5ZYT5qG+yJnLAXJ
        jXujflaxgL72jtqi0vuWr/XXd43mpCgzKntjFRKBng6yB9InxwgMTtK6Z/ksCYm/YwYuYvT1MSkON
        lwyR56rw==;
Received: from 216-58-17-101.cpe.distributel.net ([216.58.17.101]:44518 helo=[192.168.1.4])
        by montreal.sibername.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <bjlockie@lockie.ca>)
        id 1jAJlx-00F3hv-Kl
        for linux-usb@vger.kernel.org; Fri, 06 Mar 2020 15:40:42 -0500
To:     linux-usb@vger.kernel.org
From:   James <bjlockie@lockie.ca>
Subject: dvdrw USB3 drive seen as USB2
Message-ID: <477a12ce-e6ae-ce43-fca7-0f1dc4e00735@lockie.ca>
Date:   Fri, 6 Mar 2020 15:40:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-OutGoing-Spam-Status: No, score=-0.5
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

I bought what is supposed to be a USB3 dvdrw drive but it is detected as 
USB2.

$ dmesg
[99941.296152] usb 1-3: new high-speed USB device number 12 using xhci_hcd
[99941.464780] usb 1-3: New USB device found, idVendor=13fd, 
idProduct=0840, bcdDevice= 1.14
[99941.464783] usb 1-3: New USB device strings: Mfr=1, Product=2, 
SerialNumber=3
[99941.464786] usb 1-3: Product: External
[99941.464788] usb 1-3: Manufacturer: Generic
[99941.464789] usb 1-3: SerialNumber: 534841353132313630362020
[99941.477838] usb-storage 1-3:1.0: USB Mass Storage device detected
[99941.478063] scsi host9: usb-storage 1-3:1.0
[99942.485502] scsi 9:0:0:0: CD-ROM            hp       DVD RW AD-7586H  
KH04 PQ: 0 ANSI: 0
[99942.488054] sr 9:0:0:0: Power-on or device reset occurred
[99942.492956] sr 9:0:0:0: [sr0] scsi3-mmc drive: 24x/24x writer dvd-ram 
cd/rw xa/form2 cdda tray
[99942.493466] sr 9:0:0:0: Attached scsi CD-ROM sr0
[99942.493594] sr 9:0:0:0: Attached scsi generic sg2 type 5

$ lsusb
Bus 001 Device 012: ID 13fd:0840 Initio Corporation INIC-1618L SATA

$ lsusb -t
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 480M
     |__ Port 3: Dev 12, If 0, Class=Mass Storage, Driver=usb-storage, 480M

I plugged in a known USB3 device in the same port.
Could there be a bug that makes the bus decide it is not a USB3 device?

$ lsusb
Bus 002 Device 003: ID 13fe:6300 Kingston Technology Company Inc. USB 
DISK 3.0

$ lsusb -t
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 10000M
     |__ Port 3: Dev 3, If 0, Class=Mass Storage, Driver=usb-storage, 5000M

Is there a way to see if Windows in a VirtualBox sees it as USB3?

