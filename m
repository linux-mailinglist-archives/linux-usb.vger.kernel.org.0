Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA0532F06F
	for <lists+linux-usb@lfdr.de>; Fri,  5 Mar 2021 17:55:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbhCEQyz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Mar 2021 11:54:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbhCEQyu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Mar 2021 11:54:50 -0500
Received: from smtp.gentoo.org (woodpecker.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6D40C061574
        for <linux-usb@vger.kernel.org>; Fri,  5 Mar 2021 08:54:50 -0800 (PST)
To:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
From:   Matthias Schwarzott <zzam@gentoo.org>
Subject: Amazon Kindle disconnect after Synchronize Cache
Cc:     hirofumi@mail.parknet.co.jp
Message-ID: <9f57532f-1fb7-0fdd-b91c-2dfecef5aff3@gentoo.org>
Date:   Fri, 5 Mar 2021 17:54:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi folks,

I have an issue with my Amazon Kindle. Since some time the device 
disconnects 2 seconds after a sync command sent via USB.

See also this matching bug report:
https://bugzilla.kernel.org/show_bug.cgi?id=203973

My current workaround is this udev-rule:
	SUBSYSTEM=="block", ACTION=="add", ENV{DEVTYPE}=="disk", 
ENV{ID_VENDOR}=="Kindle", RUN+="/bin/bash -c 'echo write\ through > 
/sys/block/%k/queue/write_cache'"

But I like to find a proper solution.

I did various recordings of usb-traffic with wireshark on linux and windows.

On windows, the device does not disconnect after the "Synchronize Cache" 
command.

One major difference I noticed looking at service answer time statistics:
Windows sends a lot more requests of type "Test Unit Ready".
* Windows: 6385 calls
* linux: 71 calls

After most of the "Synchronize Cache" commands on windows there was 
directly a following "WRITE" command. It seems WRITE commands avoid the 
disconnect.

But sending a plain "Synchronize Cache" under windows (8.1 and 10) does 
not trigger the disconnect.

Windows:
1583	14.891478	host	1.6.1	USBMS	58	SCSI: Synchronize Cache(10) LUN: 0x00 
(LBA: 0x00000000, Len: 0)
1584	14.891595	1.6.1	host	USB	27	URB_BULK out
1585	14.891613	host	1.6.1	USB	27	URB_BULK in
1586	14.896866	1.6.1	host	USBMS	40	SCSI: Response LUN: 0x00 (Synchronize 
Cache(10)) (Good)
1589	15.687209	host	1.6.1	USBMS	58	SCSI: Test Unit Ready LUN: 0x00
1590	15.687353	1.6.1	host	USB	27	URB_BULK out
1591	15.687358	host	1.6.1	USB	27	URB_BULK in
1592	15.687405	1.6.1	host	USBMS	40	SCSI: Response LUN: 0x00 (Test Unit 
Ready) (Good)
1713	16.699689	host	1.6.1	USBMS	58	SCSI: Test Unit Ready LUN: 0x00
1714	16.699820	1.6.1	host	USB	27	URB_BULK out
1715	16.699825	host	1.6.1	USB	27	URB_BULK in
1716	16.699915	1.6.1	host	USBMS	40	SCSI: Response LUN: 0x00 (Test Unit 
Ready) (Good)
1717	17.709334	host	1.6.1	USBMS	58	SCSI: Test Unit Ready LUN: 0x00
1718	17.709547	1.6.1	host	USB	27	URB_BULK out
1719	17.709552	host	1.6.1	USB	27	URB_BULK in
1720	17.709586	1.6.1	host	USBMS	40	SCSI: Response LUN: 0x00 (Test Unit 
Ready) (Good)
1721	18.712864	host	1.6.1	USBMS	58	SCSI: Test Unit Ready LUN: 0x00
1722	18.713081	1.6.1	host	USB	27	URB_BULK out
1723	18.713086	host	1.6.1	USB	27	URB_BULK in
1724	18.713148	1.6.1	host	USBMS	40	SCSI: Response LUN: 0x00 (Test Unit 
Ready) (Good)
1741	19.735245	host	1.6.1	USBMS	58	SCSI: Test Unit Ready LUN: 0x00
1742	19.735410	1.6.1	host	USB	27	URB_BULK out
1743	19.735415	host	1.6.1	USB	27	URB_BULK in
1744	19.735474	1.6.1	host	USBMS	40	SCSI: Response LUN: 0x00 (Test Unit 
Ready) (Good)
1811	20.747477	host	1.6.1	USBMS	58	SCSI: Test Unit Ready LUN: 0x00
1812	20.747699	1.6.1	host	USB	27	URB_BULK out
1813	20.747704	host	1.6.1	USB	27	URB_BULK in
1814	20.747766	1.6.1	host	USBMS	40	SCSI: Response LUN: 0x00 (Test Unit 
Ready) (Good)
1905	21.755419	host	1.6.1	USBMS	58	SCSI: Test Unit Ready LUN: 0x00
1906	21.755579	1.6.1	host	USB	27	URB_BULK out
1907	21.755584	host	1.6.1	USB	27	URB_BULK in
1908	21.755674	1.6.1	host	USBMS	40	SCSI: Response LUN: 0x00 (Test Unit 
Ready) (Good)
1911	22.769205	host	1.6.1	USBMS	58	SCSI: Test Unit Ready LUN: 0x00
1912	22.769355	1.6.1	host	USB	27	URB_BULK out
1913	22.769360	host	1.6.1	USB	27	URB_BULK in
1914	22.769415	1.6.1	host	USBMS	40	SCSI: Response LUN: 0x00 (Test Unit 
Ready) (Good)

How can I get further on this topic?

Thanks
Matthias

linux:
===========================================================================
SCSI Service Antwortzeit - kindle-linux-copy.pcap:
Index  Procedure  Calls  Min SRT (s)  Max SRT (s)  Avg SRT (s)  Sum SRT (s)
---------------------------------------------------------------------------
SBC (disk)
Inquiry         18      1     0.000742     0.000742     0.000742 0.000742
Mode Sense(6)         26      6     0.104194     0.110284     0.108607 
0.651640
Prevent/Allow Medium Removal         30     10     0.000115     0.015012 
     0.002431     0.024309
Read Capacity(10)         37      3     0.000631     0.001004 0.000835 
   0.002506
Read(10)         40   2200     0.000136     0.020928     0.002452 5.393555
Request Sense          3     27     0.000295     0.003102     0.001022 
0.027604
Synchronize Cache(10)         53      6     0.000223     2.703190 
0.654663     3.927976
Test Unit Ready          0     71     0.000081     0.007955     0.000816 
     0.057908
Write(10)         42    195     0.001204     0.236517     0.022452 4.378117
SBC (disk)
---------------------------------------------------------------------------

windows:
===========================================================================
SCSI Service Antwortzeit - Kindle-sideload-win81.pcapng:
Index  Procedure  Calls  Min SRT (s)  Max SRT (s)  Avg SRT (s)  Sum SRT (s)
---------------------------------------------------------------------------
SBC (disk)
Inquiry         18      6     0.001026     0.109327     0.055329 0.331972
Mode Select(6)         21      2     0.001499     0.002851     0.002175 
   0.004350
Mode Sense(6)         26      8     0.102380     0.116633     0.108400 
0.867199
Prevent/Allow Medium Removal         30      9     0.000274     0.644009 
     0.072284     0.650556
Read Capacity(10)         37     51     0.000144     0.109027 0.009779 
   0.498711
Read(10)         40   1269     0.000537     0.107562     0.003026 3.840104
Request Sense          3     19     0.000461     0.001388     0.000889 
0.016893
Start Stop Unit         27      1     0.001695     0.001695     0.001695 
     0.001695
Synchronize Cache(10)         53      7     0.000511     0.001765 
0.001052     0.007362
Test Unit Ready          0   6385     0.000090     0.083883     0.000605 
     3.859785
Unknown-0x%02x         35      3     0.108739     0.111119     0.109720 
   0.329159
Write(10)         42    303     0.001117     0.257120     0.030089 9.117113
SBC (disk)
---------------------------------------------------------------------------
