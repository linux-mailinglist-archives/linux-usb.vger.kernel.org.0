Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF66727CE1
	for <lists+linux-usb@lfdr.de>; Thu, 23 May 2019 14:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729902AbfEWMaM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 23 May 2019 08:30:12 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:63324 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728309AbfEWMaM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 May 2019 08:30:12 -0400
Received: from nat-ies.mentorg.com ([192.94.31.2] helo=svr-ies-mbx-01.mgc.mentorg.com)
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1hTmrJ-0000QV-PQ from Carsten_Schmid@mentor.com ; Thu, 23 May 2019 05:30:09 -0700
Received: from SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) by
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) with Microsoft SMTP Server
 (TLS) id 15.0.1320.4; Thu, 23 May 2019 13:30:06 +0100
Received: from SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17]) by
 SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17%22]) with mapi id
 15.00.1320.000; Thu, 23 May 2019 13:30:06 +0100
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: AW: Crash/hung task in usb-storage thread
Thread-Topic: Crash/hung task in usb-storage thread
Thread-Index: AdURXgfVXaop83lMT6KXMlJmy+L2Dv//8m8A///s4kCAABlWAP//7vuA
Date:   Thu, 23 May 2019 12:30:06 +0000
Message-ID: <4412d0ddd08e41009d46c018d50ce5c3@SVR-IES-MBX-03.mgc.mentorg.com>
References: <dca3ea08836e475894bdebc7eb28acff@SVR-IES-MBX-03.mgc.mentorg.com>
 <20190523120410.GA16571@kroah.com>
 <3bb81d0da7de4745852aef52802f3b9b@SVR-IES-MBX-03.mgc.mentorg.com>
 <20190523122626.GA26641@kroah.com>
In-Reply-To: <20190523122626.GA26641@kroah.com>
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

> > > Wow that's an old kernel.
> > Indeed. Long running project.
> > 
> > > Can you reproduce this on a "clean" 5.1 kernel release?
> > As this is an automotive embedded target, we currently have 4.14.102 as the newest custom kernel.
>
> 4.14.102 is still old.
I agree

> > Porting a 5.1 will take a lot of effort.
>
> Then that implies you have an SoC with a few million lines of code added
> to the kernel, right?  Nothing we can do here about that mess, you need
> to go ask for support from the vendor that is forcing you to use that
> kernel, sorry :(
>

Well its at least an x86-64 based SoC.
I'll contact the vendor for sure.

> good luck!
Thanks. Will need it. ;-)

Carsten
