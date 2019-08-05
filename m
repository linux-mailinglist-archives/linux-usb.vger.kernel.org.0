Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F84981468
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2019 10:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727358AbfHEInT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Aug 2019 04:43:19 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:5368 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726454AbfHEInT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Aug 2019 04:43:19 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x758YSc2020595;
        Mon, 5 Aug 2019 03:43:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=message-id : subject
 : from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=PODMain02222019;
 bh=QfBcKmnEkR4bv/IaqmCwKgXrBdaWMkWLS9HKva1o4UU=;
 b=I8mjj5G+i1CIpHSKZwhgrTB33aA7uCIcC72FyS58hY0KaY0bTRD6nVemFiMbnAvzFpya
 GyBVTJQgsFJPKdVCf3gv08KBmo2QWP4yz6ujIahWRteM6wMhdzQl45ItGhUpjR0xrA3h
 pTDGhLts4kQWtXwdqGrZ++/h27y7+O0gxTrtBqOCnSX484xX2H/4kNqNnXmXgY6Js3NY
 xxWisWWC3ve7WVHZljRtx17PyMFYqsuvIdhyyXfanoNGyCbte38WE3G7fuiIwQipTAgn
 2gJVDxJbHQfNZIZvt5bCfwbB0Z7INw7Un9sRiweJZzIEn/McyMKTssC6LxxoXncmnEPi dg== 
Authentication-Results: ppops.net;
        spf=fail smtp.mailfrom=mkulkarni@opensource.cirrus.com
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
        by mx0b-001ae601.pphosted.com with ESMTP id 2u56pq23wc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 05 Aug 2019 03:43:15 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 5 Aug
 2019 09:43:14 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Mon, 5 Aug 2019 09:43:14 +0100
Received: from mkulkarni-laptop.ad.cirrus.com (mkulkarni-laptop.ad.cirrus.com [198.90.199.28])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 24DA545;
        Mon,  5 Aug 2019 09:43:14 +0100 (BST)
Message-ID: <1564994594.2877.12.camel@opensource.cirrus.com>
Subject: Re: About usb_new_device() API
From:   Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     <linux-usb@vger.kernel.org>
Date:   Mon, 5 Aug 2019 09:43:14 +0100
In-Reply-To: <Pine.LNX.4.44L0.1908021221120.1645-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1908021221120.1645-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com include:spf.protection.outlook.com
 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 clxscore=1031 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1906280000
 definitions=main-1908050100
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2019-08-02 at 12:27 -0400, Alan Stern wrote:
> On Fri, 2 Aug 2019, Mayuresh Kulkarni wrote:
> 
> > 
> > Hi Alan,
> > 
> > Thanks a lot for clearing out the confusion.
> > 
> > Our USB device can operate in 2 mutually exclusive modes: one is
> > normal
> > composite USB audio mode and other is vendor specific HID device
> > mode.
> > 
> > On the same platform (Android based):
> > - When the device is in normal composite USB audio mode,
> > "cat /sys/bus/usb/devices/.../power/control" show "auto".
> > - When the device is in vendor specific HID device mode,
> > "cat /sys/bus/usb/devices/.../power/control" show "on".
> > 
> > And hence as per your comment, I am unable to see USB-2.0 L2 for
> > vendor
> > specific HID device mode.
> > 
> > I guess I need to find out "who" is setting the /power/control =
> > "auto"
> > when composite USB audio device is detected. And explore if it could
> > be
> > moved to a more generic place.
> I'm pretty sure this is done by some program, not automatically done
> by 
> the kernel.

I think I found what is happening here:
- Looks like, the USB audio class driver is
calling usb_enable_autosuspend().
- Please check $KERNEL_SRC/sound/usb, card.c, usb_audio_probe().
- It is using interface_to_usbdev() to get the parent of its interface
device, which is the USB device allocated by the hub driver.
And hence, in above use-case, I can see L2 when our device is in
composite USB-audio mode.

Moreover, the HID-class driver doesn't seem to call
usb_enable_autosuspend() on its parent and hence I don't see L2 when our
device operates as a vendor specific HID device.
So a simple fix would be to call usb_enable_autosuspend() from HID class
driver as well.

With that said, what would be your recommendation here, Alan -
1. Is it OK for USB-class drivers to call usb_enable_autosuspend() on
their parent device to ensure low power state is entered?
OR
2. Is it recommended to call usb_enable_autosuspend() from user-space by
writing "auto" to "cat /sys/bus/usb/devices/.../power/control"?

In my opinion, both should be fine.

Thanks,

> 
> > 
> > Is there any module parameter (or some other means) by which,
> > power/control (or deprecated power/level) will always be "auto", by
> > default?
> No, there isn't.  The power/control (or power/level) attribute has to 
> be set by the user or a program.
> 
> Alan Stern
> 
