Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B5564A3C88
	for <lists+linux-usb@lfdr.de>; Mon, 31 Jan 2022 03:09:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357349AbiAaCIr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 30 Jan 2022 21:08:47 -0500
Received: from netrider.rowland.org ([192.131.102.5]:41331 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1357336AbiAaCIq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 30 Jan 2022 21:08:46 -0500
Received: (qmail 259863 invoked by uid 1000); 30 Jan 2022 21:08:44 -0500
Date:   Sun, 30 Jan 2022 21:08:44 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     James <bjlockie@lockie.ca>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Subject: Re: what could cause a cmd cmplt err -2
Message-ID: <YfdErJ/SyFB2I5UA@rowland.harvard.edu>
References: <b83861ab-fd5e-3021-70d1-3647f7b8eeb0@lockie.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b83861ab-fd5e-3021-70d1-3647f7b8eeb0@lockie.ca>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jan 30, 2022 at 01:55:35PM -0500, James wrote:
> What do these mean?
> I get a lot of them in dmesg.
> sda is
> 
> [885862.931385] usb 2-2.1: cmd cmplt err -2

This means a data transfer was cancelled (probably because the device 
didn't respond after 30 seconds or so).

> [885863.015996] usb 2-2.1: reset SuperSpeed USB device number 3 using
> xhci_hcd
> [885863.040134] scsi host0: uas_eh_device_reset_handler success
> [893205.111118] sd 0:0:0:0: [sda] tag#1 uas_eh_abort_handler 0 uas-tag 4
> inflight: CMD IN
> [893205.111147] sd 0:0:0:0: [sda] tag#1 CDB: Read(10) 28 00 51 20 ab 90 00
> 00 08 00
> [893205.127136] scsi host0: uas_eh_device_reset_handler start

The command that was cancelled was a READ(10).  After the cancellation, 
the device was reset so that it ought to be ready to accept a new 
command.

It's not easy to tell why the command timed out.  Maybe the drive 
encountered a problem and therefore wasn't able to execute the command.  
Or maybe it did execute the command but the response message going back 
to the computer got lost.

Alan Stern

> sda is Bus 002 Device 003: ID 0bc2:ab5a Seagate RSS LLC One Touch HDD USB3
> hard drive.
> It's on a powered hub with the wireless adapter.
> 
> 
> $ lsusb -tv
> \/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 5000M
>     ID 1d6b:0003 Linux Foundation 3.0 root hub
>     |__ Port 2: Dev 2, If 0, Class=Hub, Driver=hub/4p, 5000M
>         ID 05e3:0612 Genesys Logic, Inc. Hub
>         |__ Port 1: Dev 3, If 0, Class=Mass Storage, Driver=uas, 5000M
>             ID 0bc2:ab5a Seagate RSS LLC
>         |__ Port 3: Dev 4, If 0, Class=Vendor Specific Class,
> Driver=mt76x2u, 5000M
>             ID 0e8d:7612 MediaTek Inc. MT7612U 802.11a/b/g/n/ac Wireless
> Adapter
