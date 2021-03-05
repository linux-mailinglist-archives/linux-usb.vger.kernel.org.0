Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEE0A32F3A2
	for <lists+linux-usb@lfdr.de>; Fri,  5 Mar 2021 20:15:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbhCETPD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Mar 2021 14:15:03 -0500
Received: from netrider.rowland.org ([192.131.102.5]:59619 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S230054AbhCETOi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Mar 2021 14:14:38 -0500
Received: (qmail 49193 invoked by uid 1000); 5 Mar 2021 14:14:37 -0500
Date:   Fri, 5 Mar 2021 14:14:37 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Matthias Schwarzott <zzam@gentoo.org>
Cc:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        hirofumi@mail.parknet.co.jp
Subject: Re: Amazon Kindle disconnect after Synchronize Cache
Message-ID: <20210305191437.GC48113@rowland.harvard.edu>
References: <9f57532f-1fb7-0fdd-b91c-2dfecef5aff3@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f57532f-1fb7-0fdd-b91c-2dfecef5aff3@gentoo.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 05, 2021 at 05:54:43PM +0100, Matthias Schwarzott wrote:
> Hi folks,
> 
> I have an issue with my Amazon Kindle. Since some time the device
> disconnects 2 seconds after a sync command sent via USB.
> 
> See also this matching bug report:
> https://bugzilla.kernel.org/show_bug.cgi?id=203973
> 
> My current workaround is this udev-rule:
> 	SUBSYSTEM=="block", ACTION=="add", ENV{DEVTYPE}=="disk",
> ENV{ID_VENDOR}=="Kindle", RUN+="/bin/bash -c 'echo write\ through >
> /sys/block/%k/queue/write_cache'"
> 
> But I like to find a proper solution.
> 
> I did various recordings of usb-traffic with wireshark on linux and windows.
> 
> On windows, the device does not disconnect after the "Synchronize Cache"
> command.
> 
> One major difference I noticed looking at service answer time statistics:
> Windows sends a lot more requests of type "Test Unit Ready".
> * Windows: 6385 calls
> * linux: 71 calls

It's generally well known that Windows issues lots and lots of redundant 
commands to USB storage drives.

> After most of the "Synchronize Cache" commands on windows there was directly
> a following "WRITE" command. It seems WRITE commands avoid the disconnect.
> 
> But sending a plain "Synchronize Cache" under windows (8.1 and 10) does not
> trigger the disconnect.
> 
> Windows:
> 1583	14.891478	host	1.6.1	USBMS	58	SCSI: Synchronize Cache(10) LUN: 0x00
> (LBA: 0x00000000, Len: 0)
> 1584	14.891595	1.6.1	host	USB	27	URB_BULK out
> 1585	14.891613	host	1.6.1	USB	27	URB_BULK in
> 1586	14.896866	1.6.1	host	USBMS	40	SCSI: Response LUN: 0x00 (Synchronize
> Cache(10)) (Good)
> 1589	15.687209	host	1.6.1	USBMS	58	SCSI: Test Unit Ready LUN: 0x00
> 1590	15.687353	1.6.1	host	USB	27	URB_BULK out
> 1591	15.687358	host	1.6.1	USB	27	URB_BULK in
> 1592	15.687405	1.6.1	host	USBMS	40	SCSI: Response LUN: 0x00 (Test Unit
> Ready) (Good)
> 1713	16.699689	host	1.6.1	USBMS	58	SCSI: Test Unit Ready LUN: 0x00
> 1714	16.699820	1.6.1	host	USB	27	URB_BULK out
> 1715	16.699825	host	1.6.1	USB	27	URB_BULK in
> 1716	16.699915	1.6.1	host	USBMS	40	SCSI: Response LUN: 0x00 (Test Unit
> Ready) (Good)
> 1717	17.709334	host	1.6.1	USBMS	58	SCSI: Test Unit Ready LUN: 0x00
> 1718	17.709547	1.6.1	host	USB	27	URB_BULK out
> 1719	17.709552	host	1.6.1	USB	27	URB_BULK in
> 1720	17.709586	1.6.1	host	USBMS	40	SCSI: Response LUN: 0x00 (Test Unit
> Ready) (Good)
> 1721	18.712864	host	1.6.1	USBMS	58	SCSI: Test Unit Ready LUN: 0x00
> 1722	18.713081	1.6.1	host	USB	27	URB_BULK out
> 1723	18.713086	host	1.6.1	USB	27	URB_BULK in
> 1724	18.713148	1.6.1	host	USBMS	40	SCSI: Response LUN: 0x00 (Test Unit
> Ready) (Good)
> 1741	19.735245	host	1.6.1	USBMS	58	SCSI: Test Unit Ready LUN: 0x00
> 1742	19.735410	1.6.1	host	USB	27	URB_BULK out
> 1743	19.735415	host	1.6.1	USB	27	URB_BULK in
> 1744	19.735474	1.6.1	host	USBMS	40	SCSI: Response LUN: 0x00 (Test Unit
> Ready) (Good)
> 1811	20.747477	host	1.6.1	USBMS	58	SCSI: Test Unit Ready LUN: 0x00
> 1812	20.747699	1.6.1	host	USB	27	URB_BULK out
> 1813	20.747704	host	1.6.1	USB	27	URB_BULK in
> 1814	20.747766	1.6.1	host	USBMS	40	SCSI: Response LUN: 0x00 (Test Unit
> Ready) (Good)
> 1905	21.755419	host	1.6.1	USBMS	58	SCSI: Test Unit Ready LUN: 0x00
> 1906	21.755579	1.6.1	host	USB	27	URB_BULK out
> 1907	21.755584	host	1.6.1	USB	27	URB_BULK in
> 1908	21.755674	1.6.1	host	USBMS	40	SCSI: Response LUN: 0x00 (Test Unit
> Ready) (Good)
> 1911	22.769205	host	1.6.1	USBMS	58	SCSI: Test Unit Ready LUN: 0x00
> 1912	22.769355	1.6.1	host	USB	27	URB_BULK out
> 1913	22.769360	host	1.6.1	USB	27	URB_BULK in
> 1914	22.769415	1.6.1	host	USBMS	40	SCSI: Response LUN: 0x00 (Test Unit
> Ready) (Good)

Unless the Kindle advertises removable media, there doesn't seem to be 
any real point to all those TEST UNIT READY commands.  Unless they are 
what prevents the disconnections...

> How can I get further on this topic?

Is runtime power management enabled?  Maybe the Kindle disconnects 
whenever the computer tries to suspend it.  This typically happens 2 
seconds after the last command was issued, which matches your 
observations.  If runtime PM is enabled, you can try disabling it.

Alternatively, a number of Linux kernel developers work for Amazon (or 
at least, use email addresses ending in "@amazon.com"), as shown by the 
MAINTAINERS file.  Maybe one of them can get in touch with the Kindle 
software development people and find the actual answer.

Alan Stern
