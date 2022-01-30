Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 234CE4A384A
	for <lists+linux-usb@lfdr.de>; Sun, 30 Jan 2022 19:55:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354934AbiA3Szh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 30 Jan 2022 13:55:37 -0500
Received: from titan58.planetwebservers.net ([51.79.1.102]:58333 "EHLO
        titan58.planetwebservers.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229847AbiA3Szh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 30 Jan 2022 13:55:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lockie.ca;
        s=default; h=Content-Transfer-Encoding:Content-Type:Subject:From:To:
        MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=hCDbqygtw+4lqQVSId0Xf0cYsHS1s3MjP7c4rkF8g3g=; b=rOl220AwMxgPSTfO+q8eVKNWt1
        V1npIIZEwk3yts3Rtpc5LjGtpIYX095ivIeXYp1haXhlngZkItb5YfXyLqnB9kZdBMEN6FyOX6O1s
        dKJHyy9bdARrd9J2G/Ld1GyDf8vzwK0gyo9Q4tCKLSlyRXkD2UFr0I4eFamDSLqp5NcrhS2mpXW9C
        U/RH/66YMOeYFwqOsme96lLL6cxmSYg8/qZ+RhqmTt1oXrXknAJEFaU048TSciASAkDlUVgGGnwAz
        pfM0EHNr7QO0dYmgcNDx/PYP7gDCbA9ytPlzE7Ajg2+PMQtDt+KS7i/Zz9wLyXOdhoSQ3XsQMQeVY
        7nm5qSzQ==;
Received: from [66.79.250.116] (port=55742 helo=[192.168.68.65])
        by titan.planetwebservers.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <bjlockie@lockie.ca>)
        id 1nEFMO-0005dA-GI
        for linux-usb@vger.kernel.org; Mon, 31 Jan 2022 05:55:36 +1100
Message-ID: <b83861ab-fd5e-3021-70d1-3647f7b8eeb0@lockie.ca>
Date:   Sun, 30 Jan 2022 13:55:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To:     linux-usb <linux-usb@vger.kernel.org>
From:   James <bjlockie@lockie.ca>
Subject: what could cause a cmd cmplt err -2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - titan.planetwebservers.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lockie.ca
X-Get-Message-Sender-Via: titan.planetwebservers.net: authenticated_id: bjlockie@lockie.ca
X-Authenticated-Sender: titan.planetwebservers.net: bjlockie@lockie.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-From-Rewrite: unmodified, already matched
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

What do these mean?
I get a lot of them in dmesg.
sda is

[885862.931385] usb 2-2.1: cmd cmplt err -2
[885863.015996] usb 2-2.1: reset SuperSpeed USB device number 3 using 
xhci_hcd
[885863.040134] scsi host0: uas_eh_device_reset_handler success
[893205.111118] sd 0:0:0:0: [sda] tag#1 uas_eh_abort_handler 0 uas-tag 4 
inflight: CMD IN
[893205.111147] sd 0:0:0:0: [sda] tag#1 CDB: Read(10) 28 00 51 20 ab 90 
00 00 08 00
[893205.127136] scsi host0: uas_eh_device_reset_handler start

sda is Bus 002 Device 003: ID 0bc2:ab5a Seagate RSS LLC One Touch HDD 
USB3 hard drive.
It's on a powered hub with the wireless adapter.


$ lsusb -tv
\/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 5000M
     ID 1d6b:0003 Linux Foundation 3.0 root hub
     |__ Port 2: Dev 2, If 0, Class=Hub, Driver=hub/4p, 5000M
         ID 05e3:0612 Genesys Logic, Inc. Hub
         |__ Port 1: Dev 3, If 0, Class=Mass Storage, Driver=uas, 5000M
             ID 0bc2:ab5a Seagate RSS LLC
         |__ Port 3: Dev 4, If 0, Class=Vendor Specific Class, 
Driver=mt76x2u, 5000M
             ID 0e8d:7612 MediaTek Inc. MT7612U 802.11a/b/g/n/ac 
Wireless Adapter
