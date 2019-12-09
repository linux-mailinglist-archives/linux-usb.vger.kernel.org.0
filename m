Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDB1411704D
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2019 16:24:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbfLIPYC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Dec 2019 10:24:02 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:36902 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726197AbfLIPYC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Dec 2019 10:24:02 -0500
Received: (qmail 2016 invoked by uid 2102); 9 Dec 2019 10:24:01 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 9 Dec 2019 10:24:01 -0500
Date:   Mon, 9 Dec 2019 10:24:01 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     "Yuan, Shengquan" <shengquan.yuan@intel.com>
cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Question for usbmon/SET_ADDRESS request
In-Reply-To: <47EE7DDB963B974E8D97CE7497B454D43FED8BE2@shsmsx102.ccr.corp.intel.com>
Message-ID: <Pine.LNX.4.44L0.1912091018270.1462-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 9 Dec 2019, Yuan, Shengquan wrote:

> Hi,
> 
> I tried to use usbmon to capture the USB packets when inserting a
> u-disk, however, I didn't see the SET_ADDRESS request

To understand what's going on, you need to know how usbmon works.  It
intercepts data at the point where the kernel sends it to or receives
it from the host controller driver.  usbmon is not directly aware of
the actual packets that get transmitted on the USB bus.

> Below is the packet list, in packet 88, the host suddenly uses
> address 74 to communicate with U-disk.  I am wondering whether usbmon
> will capture SET_ADDRESS request?
> 
> 71	8.463514	host	1.1.1	USB	64	URB_INTERRUPT in
> 72	8.463536	host	1.1.0	USBHUB	64	GET_STATUS Request     [Port 6]
> 73	8.463553	1.1.0	host	USBHUB	68	GET_STATUS Response    [Port 6]
> 74	8.463613	host	1.1.0	USBHUB	64	SET_FEATURE Request    [Port 6: PORT_RESET]
> 75	8.463626	1.1.0	host	USBHUB	64	SET_FEATURE Response   [Port 6: PORT_RESET]
> 76	8.523469	host	1.1.0	USBHUB	64	GET_STATUS Request     [Port 6]
> 77	8.523487	1.1.0	host	USBHUB	68	GET_STATUS Response    [Port 6]
> 78	8.523495	host	1.1.0	USBHUB	64	CLEAR_FEATURE Request  [Port 6: C_PORT_RESET]
> 79	8.523501	1.1.0	host	USBHUB	64	CLEAR_FEATURE Response [Port 6: C_PORT_RESET]
> 80	8.583690	host	1.0.0	USB	64	GET DESCRIPTOR Request DEVICE
> 81	8.583781	1.0.0	host	USB	82	GET DESCRIPTOR Response DEVICE
> 82	8.583820	host	1.1.0	USBHUB	64	SET_FEATURE Request    [Port 6: PORT_RESET]
> 83	8.583837	1.1.0	host	USBHUB	64	SET_FEATURE Response   [Port 6: PORT_RESET]
> 84	8.643643	host	1.1.0	USBHUB	64	GET_STATUS Request     [Port 6]
> 85	8.643666	1.1.0	host	USBHUB	68	GET_STATUS Response    [Port 6]
> 86	8.643675	host	1.1.0	USBHUB	64	CLEAR_FEATURE Request  [Port 6: C_PORT_RESET]
> 87	8.643680	1.1.0	host	USBHUB	64	CLEAR_FEATURE Response [Port 6: C_PORT_RESET]
> 88	8.723558	host	1.74.0	USB	64	GET DESCRIPTOR Request DEVICE
> 89	8.723650	1.74.0	host	USB	82	GET DESCRIPTOR Response DEVICE
> 90	8.723692	host	1.74.0	USB	64	GET DESCRIPTOR Request BOS

usbmon _will_ capture Set-Address packets if the kernel sends them.  
However, the kernel does not always send them.

I'm going to guess that the USB host controller for your bus 1 is xHCI.  
Unlike other types of host controller, an xHCI host controller
automatically sends a Set-Address packet whenever it discovers a new
device has been plugged in, with no need for the kernel to tell it to
do so.  As a result, there is no data for usbmon to intercept and so no
Set-Address packet shows up in the usbmon output.

Alan Stern

