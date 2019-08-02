Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1CB7FDC0
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2019 17:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727987AbfHBPnu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Aug 2019 11:43:50 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:44450 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726150AbfHBPnu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Aug 2019 11:43:50 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x72FdRa6025285;
        Fri, 2 Aug 2019 10:43:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=message-id : subject
 : from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=PODMain02222019;
 bh=yaFfIM1yw/5ks3A8bgf9fmMGkqHn3ont0OP7PY4ktPg=;
 b=VKETM0cvq0xb6CNbz5nhOId1AFDiRZP15GYCOxBDpmT2PI5xBD0UpLsTIFYZSeOt0knU
 UhgmEvpso9+yjwakvXCngcHWxeJloH6SCFfLrSv4pCNAOGnHvr5O0/BzcDAxamQEHxr5
 zbwvWmMQcUCTle8+eRLE2l/CU6lbteMW6k+1qN9ihsfa0wJBWMsltRG2cuE1314LOc7i
 olebUlv+S8Re6Bg/gVIk+OYgEjENA+cDKbhwuk950CZuApZA0eO5Ib6WaBRbxiONuukd
 aL0zKeQEbYGfILao93xj844x7RftlBGSO5DzGe2hqo3t9+duOZaIBsV49iSjosSZFVtg kw== 
Authentication-Results: ppops.net;
        spf=fail smtp.mailfrom=mkulkarni@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
        by mx0a-001ae601.pphosted.com with ESMTP id 2u3gpm32k4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Fri, 02 Aug 2019 10:43:47 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 2 Aug
 2019 16:43:45 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Fri, 2 Aug 2019 16:43:45 +0100
Received: from mkulkarni-laptop.ad.cirrus.com (mkulkarni-laptop.ad.cirrus.com [198.90.199.28])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 609EB2A1;
        Fri,  2 Aug 2019 16:43:45 +0100 (BST)
Message-ID: <1564760625.15747.9.camel@opensource.cirrus.com>
Subject: Re: About usb_new_device() API
From:   Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     <linux-usb@vger.kernel.org>
Date:   Fri, 2 Aug 2019 16:43:45 +0100
In-Reply-To: <Pine.LNX.4.44L0.1908011341010.1305-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1908011341010.1305-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com include:spf.protection.outlook.com
 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 clxscore=1031 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1908020160
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2019-08-01 at 13:51 -0400, Alan Stern wrote:
> On Thu, 1 Aug 2019, Mayuresh Kulkarni wrote:
> 
> > 
> > Hi All,
> > 
> > I am seeing a peculiar behaviour which I think *might* be 
> > caused by usb_new_device(). Since usb_new_device() is one of the
> > core
> > APIs, I cannot explain how PM works for USB device at later point in
> > time.
> > 
> > In a particular use-case, our composite USB device
> > exposes HID interface with vendor report descriptor. Since the
> > standard
> > HID-class driver's HID-input part is unable to decode this vendor
> > report
> > descriptor, it is unable to bind itself to this interface.
> > After this, we don't see any L2 requests on USB bus analyser.
> > Obvious reason seems to be, since no driver is bound to interface,
> > there
> > cannot be PM call-backs since driver has these call-backs.
> There are other possible reasons.  For example, what is the setting 
> stored in /sys/bus/usb/devices/.../power/control (fill in the "..." 
> with the appropriate name for your device)?
> 
> If the file contains "on" then runtime PM is forbidden and the device 
> will always remain at full power.  If the file contains "auto" then
> the 
> device will be subject to normal runtime-PM suspends and resumes.
> 

Hi Alan,

Thanks a lot for clearing out the confusion.

Our USB device can operate in 2 mutually exclusive modes: one is normal
composite USB audio mode and other is vendor specific HID device mode.

On the same platform (Android based):
- When the device is in normal composite USB audio mode,
"cat /sys/bus/usb/devices/.../power/control" show "auto".
- When the device is in vendor specific HID device mode,
"cat /sys/bus/usb/devices/.../power/control" show "on".

And hence as per your comment, I am unable to see USB-2.0 L2 for vendor
specific HID device mode.

I guess I need to find out "who" is setting the /power/control = "auto"
when composite USB audio device is detected. And explore if it could be
moved to a more generic place.

Is there any module parameter (or some other means) by which,
power/control (or deprecated power/level) will always be "auto", by
default?

> > 
> > But I am expecting that the USB device (which is parent of HID
> > interface) should see L2. The reason being, USB-core seems to
> > properly
> > do runtime get/put wherever needed. And HID interface has no driver,
> > so
> > from USB-core point of view, it is a USB device w/o any interface.
> > (please correct if this is incorrect expectation).
> More accurately, it is a USB device with one interface which is not 
> bound to a driver.
> 
> > 
> > With that said, I am confused about usb_new_device() in this
> > context. It
> > seems to call usb_disable_autosuspend() ==> pm_runtime_forbid() ==>
> > increment usage_count.
> Correct.  By default, all USB devices except hubs are forbidden to go 
> into runtime suspend.  This setting can be changed by userspace (by 
> writing to the sysfs file mentioned above).
> 
> > 
> > However, it never calls usb_enable_autosuspend() itself.
> > Now since USB PM (and L2) works fine at later point in time (i.e.:
> > after
> > all the interfaces are bound to their appropriate drivers), I think
> > somewhere the equivalent of usb_enable_autosuspend() gets called for
> > the
> > USB device and hence USB PM works fine.
> There are programs, like powertop, which will automatically write
> "auto" to the power/control sysfs file when a new device appears.  
> Doing so calls pm_runtime_allow(), which decrements usage_count.
> 

Cool, thanks for this info.

> > 
> > I wonder this *may be* be an issue I am seeing with the use-case
> > mentioned above. But definitely confused about it and hence thought
> > of
> > sending this email.
> > 
> > Does this description makes sense? Is it necessary to
> > call usb_enable_autosuspend() in usb_new_device()?
> It is not necessary.  Check that sysfs file and see what it
> contains.  
> In fact, you can check the contents of all the files in the device's 
> sysfs power/ subdirectory.

Thanks, the files under power/ have useful info (great for doing
diagnosis).

> 
> Alan Stern
> 
