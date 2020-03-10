Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAC6F17F44D
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2020 11:04:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgCJKEq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 10 Mar 2020 06:04:46 -0400
Received: from mail.actia.se ([195.67.112.82]:59672 "EHLO mail.actia.se"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726202AbgCJKEp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Mar 2020 06:04:45 -0400
Received: from S036ANL.actianordic.se (192.168.16.117) by
 S035ANL.actianordic.se (192.168.16.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Tue, 10 Mar 2020 11:04:42 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.1913.007; Tue, 10 Mar 2020 11:04:42 +0100
From:   Jonas Karlsson <jonas.karlsson@actia.se>
To:     Peter Chen <peter.chen@nxp.com>
CC:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Oliver Neukum <oneukum@suse.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: RE: USB transaction errors causing RCU stalls and kernel panics
Thread-Topic: USB transaction errors causing RCU stalls and kernel panics
Thread-Index: AdXxbFdECZ2tmAAoQZaxVkfgHyprqgABZ9yAAAiGryAAIGdeAAAEO3aAAAR/HgAARX+KgACtYMrAACnez4AABbFG8A==
Date:   Tue, 10 Mar 2020 10:04:42 +0000
Message-ID: <d1f68ef3316e484b9cc1360f71886719@actia.se>
References: <ddf8c3971b8544e983a9d2bbdc7f2010@actia.se>
 <20200303163945.GB652754@kroah.com>
 <ca6f029a57f24ee9aea39385a9ad55bd@actia.se>
 <6909d182-6cc5-c07f-ed79-02c741aec60b@linux.intel.com>
 <1583331173.12738.26.camel@suse.com>
 <4fa64e92-64ce-07f3-ed8e-ea4e07d091bb@linux.intel.com>
 <VI1PR04MB532785057FD52DFE3A21ACA88BE30@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <699a49f2f69e494ea6558b99fad23cc4@actia.se>
 <20200310081452.GA14625@b29397-desktop>
In-Reply-To: <20200310081452.GA14625@b29397-desktop>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.11.14.24]
x-esetresult: clean, is OK
x-esetid: 37303A2914C9726A627467
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> On 20-03-09 14:21:56, Jonas Karlsson wrote:
> > >
> > > If autosuspend is suspicious, Jonas, could you please try to disable
> > > autosuspend for all USB devices (including the roothub and controller) to see
> what happens?
> > >
> > > Peter
> >
> > I have run some tests with autosuspend turned off by doing this:
> > for i in $(find /sys -name control | grep usb);do echo on > $i;echo
> > "echo on > $i";done;
> >
> > To make our modem misbehave we need to cool it down in a temp chamber
> > which I haven't had access to the past days. However we have found two
> > other ways to reproduce the event storm causing event ring full
> > messages spamming the logs. The pattern in the attached file repeats itself
> until I unbind the driver.
> 
> Hi Jonas,
> 
> Do you have below commit at your local tree? If you have, I am puzzled why you
> still get "Event Ring Full Error" error, maybe Mathias have the answer?
> 
> commit dc0ffbea5729a3abafa577ebfce87f18b79e294b
> Author: Peter Chen <peter.chen@nxp.com>
> Date:   Fri Nov 15 18:50:00 2019 +0200
> 
>     usb: host: xhci: update event ring dequeue pointer on purpose
>

Yes, I have applied that commit. The logs I have attached so far have had that commit applied.
It reduces the amount of Unknown event type 37 messages significantly.
 
> @Mathias, could xhci design some software retry limits for transaction error? It
> may avoid retry storm due to hardware issue (eg, signal issue). For EHCI, there is
> a design to define QH_XACTERR_MAX at qh_completions for that.
> 
> Peter
