Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79DD7298F9
	for <lists+linux-usb@lfdr.de>; Fri, 24 May 2019 15:33:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391395AbfEXNdX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 24 May 2019 09:33:23 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:40241 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391529AbfEXNdX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 May 2019 09:33:23 -0400
Received: from nat-ies.mentorg.com ([192.94.31.2] helo=svr-ies-mbx-02.mgc.mentorg.com)
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1hUAJx-00076l-Qp from Carsten_Schmid@mentor.com ; Fri, 24 May 2019 06:33:17 -0700
Received: from SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) by
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2) with Microsoft SMTP Server
 (TLS) id 15.0.1320.4; Fri, 24 May 2019 14:33:14 +0100
Received: from SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17]) by
 SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17%22]) with mapi id
 15.00.1320.000; Fri, 24 May 2019 14:33:14 +0100
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: AW: Crash/hung task in usb-storage thread
Thread-Topic: Crash/hung task in usb-storage thread
Thread-Index: AdURXgfVXaop83lMT6KXMlJmy+L2DgAITEKAAC1Xc2A=
Date:   Fri, 24 May 2019 13:33:14 +0000
Message-ID: <b4d08a84df3d45bfa77d27d411a17578@SVR-IES-MBX-03.mgc.mentorg.com>
References: <dca3ea08836e475894bdebc7eb28acff@SVR-IES-MBX-03.mgc.mentorg.com>
 <Pine.LNX.4.44L0.1905231245510.1553-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1905231245510.1553-100000@iolanthe.rowland.org>
Accept-Language: de-DE, en-IE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> On Thu, 23 May 2019, Schmid, Carsten wrote:
> 
> > Hi USB maintainers,
> >
> > we recently have seen a problem with usb-storage when trying to read
> from a device.
> > This happened on a 4.14.86 kernel.
> >
> > The kernel's dmesg shows: (log has been submitted via DLT)
> > 1200.862250 kernel: usb 1-3.1: reset high-speed USB device number 10
> using xhci_hcd
> > 1285.466289 kernel: usb 1-3.1: reset high-speed USB device number 10
> using xhci_hcd
> > 1291.911286 kernel: usb-storage: Error in queuecommand_lck: us->srb =
> ffff9d66b02e3528
> > 1292.018079 kernel: usb-storage: Error in queuecommand_lck: us->srb =
> ffff9d66b02e3528
> > 1292.043073 kernel: usb-storage: Error in queuecommand_lck: us->srb =
> ffff9d66b02e3528
> > 1292.069078 kernel: usb-storage: Error in queuecommand_lck: us->srb =
> ffff9d66b02e3528
> > 1292.093066 kernel: usb-storage: Error in queuecommand_lck: us->srb =
> ffff9d66b02e3528
> 
> Since there haven't been any substantive change to usb-storage since
> 4.14 was released, there's a good chance this is a problem with
> xhci-hcd.
> 
> Is this problem repeatable?  Can you collect a usbmon trace showing
> what happens when the problem occurs?
> 
Unfortunately this happened in the field on a test drive.
I don't have access to the device.
So, no, can't be reproduced by now.

> > There has been a similar bug being fixed in 3.17 kernel series, maybe the
> bug has been re-introduced?
> > https://bugzilla.kernel.org/show_bug.cgi?id=88341
> 
> That is _extremely_ unlikely.
> 
Looked into the history of that bug report.
Strange: no fix is menioned.
Reported: 2014-17-11
Remark on 2019-02-26
No hint to a real fix.
It simply disappeared ...

> > As USB seems to be the causing subsystem, i submit this query here.
> >
> > Any idea what could cause this?
> 
> The particular error message you got means that the SCSI layer asked
> usb-storage to send a command to the device before the previous command
> was completed.  But without more information there's no way to tell why
> it did this.
> 
> Alan Stern
That's at least a hint i can forward to the vendor.

Thanks Alan, 
Carsten
