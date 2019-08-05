Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D67ED82266
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2019 18:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729132AbfHEQbC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Aug 2019 12:31:02 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:54604 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726620AbfHEQbC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Aug 2019 12:31:02 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x75GTgTp014219;
        Mon, 5 Aug 2019 11:31:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=message-id : subject
 : from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=PODMain02222019;
 bh=ysmGjEpb9/jlTtp2iFdLweBFjLWfgASxOfRHBuVTxqo=;
 b=VN5OyzeSjNS0geNeVYwcrNNDipXHVEz1F7VeM18VX0KUADVBb7UbIszEvnfeO/tLNl1W
 0Y9DeFpjWOBvaqaeP+xBQSHkabUxpBAoZ4N8QbWYjySSPWvE7lE3G1Rz59U7ApdLFbKo
 rjWqiYsV+I0JE9SmrXUtTDFlbs/wCAtc8bV1WV1OMB4sxMeOXo93K1nzBCpSuib0dTp7
 KK07S8Ls70RWr1uvHCWoZAVaFOL0QNmzEf8fNzhasY+ASKT6NfAp1ToVQ7rwfcrGpf21
 VHb4BFgTWjJSyvKCcUVsxjUsAsioq1k6qCSkGR9t59T70UURT0V40NQGW33o9USPU4d0 9Q== 
Authentication-Results: ppops.net;
        spf=fail smtp.mailfrom=mkulkarni@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
        by mx0b-001ae601.pphosted.com with ESMTP id 2u56pq2mp9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 05 Aug 2019 11:31:00 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 5 Aug
 2019 17:30:57 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Mon, 5 Aug 2019 17:30:57 +0100
Received: from mkulkarni-laptop.ad.cirrus.com (mkulkarni-laptop.ad.cirrus.com [198.90.199.28])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AC89345;
        Mon,  5 Aug 2019 17:30:57 +0100 (BST)
Message-ID: <1565022657.10537.9.camel@opensource.cirrus.com>
Subject: Re: About usb_new_device() API
From:   Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     <linux-usb@vger.kernel.org>
Date:   Mon, 5 Aug 2019 17:30:57 +0100
In-Reply-To: <Pine.LNX.4.44L0.1908051003420.1626-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1908051003420.1626-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com include:spf.protection.outlook.com
 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 clxscore=1031 mlxlogscore=805 bulkscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1906280000
 definitions=main-1908050183
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 2019-08-05 at 10:07 -0400, Alan Stern wrote:
> On Mon, 5 Aug 2019, Mayuresh Kulkarni wrote:
> 
> > 
> > I think I found what is happening here:
> > - Looks like, the USB audio class driver is
> > calling usb_enable_autosuspend().
> The audio maintainers must have some good reason for doing that, but
> I 
> don't know what it is.  Normally kernel drivers are not supposed to 
> enable autosuspend.
> 

Thanks, please see my comment below.

> > 
> > - Please check $KERNEL_SRC/sound/usb, card.c, usb_audio_probe().
> > - It is using interface_to_usbdev() to get the parent of its
> > interface
> > device, which is the USB device allocated by the hub driver.
> > And hence, in above use-case, I can see L2 when our device is in
> > composite USB-audio mode.
> > 

Apologies, as I send the above response, without checking the latest
stable kernel tree.

In the kernel used on the platform I use (and also in Pixel-2 kernel),
the .probe() of USB-audio class driver calls usb_enable_autosuspend().

usb_enable_autosuspend() call is NOT present in latest stable kernel's
USB-audio class driver, which is in-sync with your comment.

> > Moreover, the HID-class driver doesn't seem to call
> > usb_enable_autosuspend() on its parent and hence I don't see L2 when
> > our
> > device operates as a vendor specific HID device.
> > So a simple fix would be to call usb_enable_autosuspend() from HID
> > class
> > driver as well.
> > 
> > With that said, what would be your recommendation here, Alan -
> > 1. Is it OK for USB-class drivers to call usb_enable_autosuspend()
> > on
> > their parent device to ensure low power state is entered?
> Generally it is _not_ okay.  Especially not for the HID class driver
> -- 
> there are far too many HID devices (like mice and keyboards) that
> don't 
> work correctly when they go to low power.
> 
> > 
> > OR
> > 2. Is it recommended to call usb_enable_autosuspend() from user-
> > space by
> > writing "auto" to "cat /sys/bus/usb/devices/.../power/control"?
> That is the recommended approach.
> 

This all makes sense now.
Thanks for all the comments and explainations.

> > 
> > In my opinion, both should be fine.
> Alan Stern
> 
