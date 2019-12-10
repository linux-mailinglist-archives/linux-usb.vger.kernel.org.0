Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAC6111804F
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2019 07:20:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727127AbfLJGUw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 10 Dec 2019 01:20:52 -0500
Received: from mga02.intel.com ([134.134.136.20]:37151 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726085AbfLJGUw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Dec 2019 01:20:52 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Dec 2019 22:20:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,298,1571727600"; 
   d="scan'208";a="210311341"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
  by fmsmga007.fm.intel.com with ESMTP; 09 Dec 2019 22:20:51 -0800
Received: from fmsmsx151.amr.corp.intel.com (10.18.125.4) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 9 Dec 2019 22:20:49 -0800
Received: from shsmsx153.ccr.corp.intel.com (10.239.6.53) by
 FMSMSX151.amr.corp.intel.com (10.18.125.4) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 9 Dec 2019 22:20:43 -0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.109]) by
 SHSMSX153.ccr.corp.intel.com ([169.254.12.195]) with mapi id 14.03.0439.000;
 Tue, 10 Dec 2019 14:20:41 +0800
From:   "Yuan, Shengquan" <shengquan.yuan@intel.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: Question for usbmon/SET_ADDRESS request
Thread-Topic: Question for usbmon/SET_ADDRESS request
Thread-Index: AdWuRcnxiBS1b5xIR76NSftKb1T3RgAG9baAADABIoA=
Date:   Tue, 10 Dec 2019 06:20:40 +0000
Message-ID: <47EE7DDB963B974E8D97CE7497B454D43FED94AD@shsmsx102.ccr.corp.intel.com>
References: <47EE7DDB963B974E8D97CE7497B454D43FED8BE2@shsmsx102.ccr.corp.intel.com>
 <Pine.LNX.4.44L0.1912091018270.1462-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1912091018270.1462-100000@iolanthe.rowland.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> 
> On Mon, 9 Dec 2019, Yuan, Shengquan wrote:
> 
> > Hi,
> >
> > I tried to use usbmon to capture the USB packets when inserting a
> > u-disk, however, I didn't see the SET_ADDRESS request
> 
> To understand what's going on, you need to know how usbmon works.  It
> intercepts data at the point where the kernel sends it to or receives it from the
> host controller driver.  usbmon is not directly aware of the actual packets that
> get transmitted on the USB bus.
> 
> > Below is the packet list, in packet 88, the host suddenly uses address
> > 74 to communicate with U-disk.  I am wondering whether usbmon will
> > capture SET_ADDRESS request?
> >
> > 71	8.463514	host	1.1.1	USB	64	URB_INTERRUPT in
> > 72	8.463536	host	1.1.0	USBHUB	64	GET_STATUS Request     [Port 6]
> > 73	8.463553	1.1.0	host	USBHUB	68	GET_STATUS Response    [Port 6]
> > 74	8.463613	host	1.1.0	USBHUB	64	SET_FEATURE Request    [Port 6: PORT_RESET]
> > 75	8.463626	1.1.0	host	USBHUB	64	SET_FEATURE Response   [Port 6: PORT_RESET]
> > 76	8.523469	host	1.1.0	USBHUB	64	GET_STATUS Request     [Port 6]
> > 77	8.523487	1.1.0	host	USBHUB	68	GET_STATUS Response    [Port 6]
> > 78	8.523495	host	1.1.0	USBHUB	64	CLEAR_FEATURE Request  [Port 6: C_PORT_RESET]
> > 79	8.523501	1.1.0	host	USBHUB	64	CLEAR_FEATURE Response [Port 6: C_PORT_RESET]
> > 80	8.583690	host	1.0.0	USB	64	GET DESCRIPTOR Request DEVICE
> > 81	8.583781	1.0.0	host	USB	82	GET DESCRIPTOR Response DEVICE
> > 82	8.583820	host	1.1.0	USBHUB	64	SET_FEATURE Request    [Port 6: PORT_RESET]
> > 83	8.583837	1.1.0	host	USBHUB	64	SET_FEATURE Response   [Port 6: PORT_RESET]
> > 84	8.643643	host	1.1.0	USBHUB	64	GET_STATUS Request     [Port 6]
> > 85	8.643666	1.1.0	host	USBHUB	68	GET_STATUS Response    [Port 6]
> > 86	8.643675	host	1.1.0	USBHUB	64	CLEAR_FEATURE Request  [Port 6: C_PORT_RESET]
> > 87	8.643680	1.1.0	host	USBHUB	64	CLEAR_FEATURE Response [Port 6: C_PORT_RESET]
> > 88	8.723558	host	1.74.0	USB	64	GET DESCRIPTOR Request DEVICE
> > 89	8.723650	1.74.0	host	USB	82	GET DESCRIPTOR Response DEVICE
> > 90	8.723692	host	1.74.0	USB	64	GET DESCRIPTOR Request BOS
> 
> usbmon _will_ capture Set-Address packets if the kernel sends them.
> However, the kernel does not always send them.
> 
> I'm going to guess that the USB host controller for your bus 1 is xHCI.
> Unlike other types of host controller, an xHCI host controller automatically
> sends a Set-Address packet whenever it discovers a new device has been
> plugged in, with no need for the kernel to tell it to do so.  As a result, there is
> no data for usbmon to intercept and so no Set-Address packet shows up in the
> usbmon output.
> 
> Alan Stern

Yes. You are right. I re-do the capture on an old laptop with UHCI controller, and now get the SET ADDRESS message.

67      4.616278        1.1.0   host    USBHUB  64      CLEAR_FEATURE Response [Port 5: C_PORT_RESET]
68      4.676011        host    1.0.0   USB     64      GET DESCRIPTOR Request DEVICE
69      4.676123        1.0.0   host    USB     82      GET DESCRIPTOR Response DEVICE
70      4.676139        host    1.1.0   USBHUB  64      SET_FEATURE Request    [Port 5: PORT_RESET]
71      4.676152        1.1.0   host    USBHUB  64      SET_FEATURE Response   [Port 5: PORT_RESET]
72      4.744000        host    1.1.0   USBHUB  64      GET_STATUS Request     [Port 5]
73      4.744250        1.1.0   host    USBHUB  68      GET_STATUS Response    [Port 5]
74      4.744266        host    1.1.0   USBHUB  64      CLEAR_FEATURE Request  [Port 5: C_PORT_RESET]
75      4.744278        1.1.0   host    USBHUB  64      CLEAR_FEATURE Response [Port 5: C_PORT_RESET]
76      4.804004        host    1.0.0   USB     64      SET ADDRESS Request
77      4.804122        1.0.0   host    USB     64      SET ADDRESS Response
78      4.832003        host    1.6.0   USB     64      GET DESCRIPTOR Request DEVICE
79      4.832117        1.6.0   host    USB     82      GET DESCRIPTOR Response DEVICE
80      4.832141        host    1.6.0   USB     64      GET DESCRIPTOR Request BOS

Thank you very much :)

