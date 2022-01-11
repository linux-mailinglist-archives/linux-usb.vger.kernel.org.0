Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19D7A48B039
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jan 2022 16:03:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243264AbiAKPC7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Jan 2022 10:02:59 -0500
Received: from netrider.rowland.org ([192.131.102.5]:58345 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S240354AbiAKPC6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Jan 2022 10:02:58 -0500
Received: (qmail 204540 invoked by uid 1000); 11 Jan 2022 10:02:56 -0500
Date:   Tue, 11 Jan 2022 10:02:56 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     James <bjlockie@lockie.ca>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Subject: Re: no name mouse?
Message-ID: <Yd2cIDMMDhGkcn9M@rowland.harvard.edu>
References: <9cb86662-d1f6-5d7e-65a4-c5a071e9b4f1@lockie.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9cb86662-d1f6-5d7e-65a4-c5a071e9b4f1@lockie.ca>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 10, 2022 at 09:48:56PM -0500, James wrote:
> $ lsusb -tv
> /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 5000M
>     ID 1d6b:0003 Linux Foundation 3.0 root hub
> /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
>     ID 1d6b:0002 Linux Foundation 2.0 root hub
> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 10000M
>     ID 1d6b:0003 Linux Foundation 3.0 root hub
>     |__ Port 3: Dev 4, If 0, Class=Mass Storage, Driver=uas, 5000M
>         ID 0bc2:ab5a Seagate RSS LLC
>     |__ Port 4: Dev 3, If 0, Class=Mass Storage, Driver=uas, 5000M
>         ID 0bc2:2321 Seagate RSS LLC Expansion Portable
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 480M
>     ID 1d6b:0002 Linux Foundation 2.0 root hub
>     |__ Port 5: Dev 4, If 0, Class=Human Interface Device, Driver=usbhid,
> 1.5M
>         ID 04d9:1503 Holtek Semiconductor, Inc. Keyboard
>     |__ Port 5: Dev 4, If 1, Class=Human Interface Device, Driver=usbhid,
> 1.5M
>         ID 04d9:1503 Holtek Semiconductor, Inc. Keyboard
>     |__ Port 6: Dev 3, If 0, Class=Human Interface Device, Driver=usbhid,
> 1.5M
>         ID 30fa:0400
> 
> Port 6 Dev 3 is the mouse I bought from Amazon.
> Why doesn't have a name beside it?

Because there is no entry for that vendor/product ID in the udev/systemd 
hardware database.  See "man hwdb" and "man systemd-hwdb", and also the 
files in /usb/lib/udev/hwdb.d.  Near the top of the 70-mouse.hwdb file 
in that directory are instructions on how to submit a new ID for 
inclusion in the database.

Alan Stern
