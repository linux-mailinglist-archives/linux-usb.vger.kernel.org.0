Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41CDB29B73
	for <lists+linux-usb@lfdr.de>; Fri, 24 May 2019 17:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390152AbfEXPrJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 24 May 2019 11:47:09 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:44872 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389079AbfEXPrJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 May 2019 11:47:09 -0400
Received: from nat-ies.mentorg.com ([192.94.31.2] helo=svr-ies-mbx-01.mgc.mentorg.com)
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1hUCPR-0002iw-MM from Carsten_Schmid@mentor.com ; Fri, 24 May 2019 08:47:05 -0700
Received: from SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) by
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) with Microsoft SMTP Server
 (TLS) id 15.0.1320.4; Fri, 24 May 2019 16:47:02 +0100
Received: from SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17]) by
 SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17%22]) with mapi id
 15.00.1320.000; Fri, 24 May 2019 16:47:02 +0100
From:   "Schmid, Carsten" <Carsten_Schmid@mentor.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: AW: AW: Crash/hung task in usb-storage thread
Thread-Topic: AW: Crash/hung task in usb-storage thread
Thread-Index: AdURXgfVXaop83lMT6KXMlJmy+L2DgAITEKAAC1Xc2AAAfMAAAACqlUg
Date:   Fri, 24 May 2019 15:47:01 +0000
Message-ID: <29cade7abfc94b1e92cbaa2224d9e913@SVR-IES-MBX-03.mgc.mentorg.com>
References: <b4d08a84df3d45bfa77d27d411a17578@SVR-IES-MBX-03.mgc.mentorg.com>
 <Pine.LNX.4.44L0.1905241118410.1435-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1905241118410.1435-100000@iolanthe.rowland.org>
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

> A more detailed look through the email archives and git log finds the
> following two commits, either of which might be relevant:
> 
> 	511833acfc06 ("SCSI: fix regression in scsi_send_eh_cmnd()")
> 	f45681f9beca ("USB: Add quirk to support DJI CineSSD")
> 
> For the second commit, it might be that your storage device requires
> the US_FL_NO_ATA_1X quirk in unusual_devs.h.
> 
> Alan Stern

Hi Alan,
both patches are present in our 4.14.86.
And, additionally, we disabled lpm for hotpluggable devices.

Seems we need to find out the device's ID and add a patch similar to the DJI quirk.

Could be a path to follow up.

Thanks,
Carsten
