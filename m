Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3131D1651F2
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2020 22:55:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727326AbgBSVze (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Feb 2020 16:55:34 -0500
Received: from mon1.sibername.com ([162.144.64.251]:52406 "EHLO
        montreal.sibername.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbgBSVze (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Feb 2020 16:55:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lockie.ca;
         s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
        Message-ID:Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=p4s1YETsa1jtx9JNXDqMheHq5+VDpOH4pekz5LpGjyU=; b=CcErfFDuOTJrryFIdvPF/pUjwx
        yAXdnvnzr+RznWlxjmPg0qGjy1JCsdZCBfxmQ+XbinB9PK2clG+m9pWzR3jnmhYFz42bbzcsTmFuo
        squQ0k0CQi2WaaY76NUJikipILA+6UaZUq8EsHPwDlzTpqERsakB9XE0Hmq8fpA5Rc+Qd84DY8J3Q
        zToskJvOy29SVuhl0GbEJHPXzlTnMHRN5qYH0RjzPKZxleNFrkzQFpsT45PwweoLLMU+vB2KEDSEj
        oPLR/OkzdNpD2hzm84Noai/xL08HjDuVI5znaZKaT+M3ThKrknPdGBMO0WZ/Y9hAWAZhBG5te6AhO
        Z8wmHqkA==;
Received: from 216-58-18-206.cpe.distributel.net ([216.58.18.206]:41154 helo=[192.168.1.17])
        by montreal.sibername.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <bjlockie@lockie.ca>)
        id 1j4XJZ-001yi7-Ef
        for linux-usb@vger.kernel.org; Wed, 19 Feb 2020 16:55:32 -0500
From:   James <bjlockie@lockie.ca>
To:     linux-usb@vger.kernel.org
Subject: USB questions
Message-ID: <eaab70b2-e95f-0ea8-bddc-995c1bde3b5d@lockie.ca>
Date:   Wed, 19 Feb 2020 16:55:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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

https://asrock.com/MB/AMD/B450M%20Pro4/index.us.asp#Specification
- 2 x USB 2.0 Ports (Supports ESD Protection)
- 1 x USB 3.1 Gen2 Type-A Port (10 Gb/s) (Supports ESD Protection)
- 1 x USB 3.1 Gen2 Type-C Port (10 Gb/s) (Supports ESD Protection)
- 4 x USB 3.1 Gen1 Ports (Supports ESD Protection)

$ lsusb
Bus 004 Device 002: ID 13fe:6300 Kingston Technology Company Inc. USB 
DISK 3.0
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 004: ID 051d:0002 American Power Conversion 
Uninterruptible Power Supply
Bus 003 Device 003: ID 04a9:190f Canon, Inc. CanoScan LiDE 220
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 002: ID 0bc2:2321 Seagate RSS LLC Expansion Portable
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 006: ID 1bcf:0005 Sunplus Innovation Technology Inc. 
Optical Mouse
Bus 001 Device 005: ID 04d9:1503 Holtek Semiconductor, Inc. Keyboard
Bus 001 Device 004: ID 1a40:0101 Terminus Technology Inc. Hub
Bus 001 Device 003: ID 046d:082c Logitech, Inc. HD Webcam C615
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

$ lsusb -t
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 5000M
     |__ Port 1: Dev 2, If 0, Class=Mass Storage, Driver=usb-storage, 5000M
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
     |__ Port 2: Dev 3, If 0, Class=Vendor Specific Class, Driver=, 480M
     |__ Port 4: Dev 4, If 0, Class=Human Interface Device, 
Driver=usbfs, 1.5M
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 10000M
     |__ Port 2: Dev 2, If 0, Class=Mass Storage, Driver=uas, 5000M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 480M
     |__ Port 5: Dev 3, If 0, Class=Audio, Driver=snd-usb-audio, 480M
     |__ Port 5: Dev 3, If 1, Class=Audio, Driver=snd-usb-audio, 480M
     |__ Port 5: Dev 3, If 2, Class=Video, Driver=uvcvideo, 480M
     |__ Port 5: Dev 3, If 3, Class=Video, Driver=uvcvideo, 480M
     |__ Port 6: Dev 4, If 0, Class=Hub, Driver=hub/4p, 480M
         |__ Port 3: Dev 6, If 0, Class=Human Interface Device, 
Driver=usbhid, 1.5M
         |__ Port 1: Dev 5, If 1, Class=Human Interface Device, 
Driver=usbhid, 1.5M
         |__ Port 1: Dev 5, If 0, Class=Human Interface Device, 
Driver=usbhid, 1.5M


1. Does this mean the installer used the USB2 connections on the 
motherboard even though it looks like USB3.1 Gen ones were available?

2. What is the number after the slash (4p) on xhci_hcd/4p?

3. Shouldn't "Linux Foundation 3.0 root hub" be "Linux Foundation 3.1 
Gen 1 root hub"?
