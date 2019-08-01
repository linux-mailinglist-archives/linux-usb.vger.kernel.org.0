Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12D297DE3C
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2019 16:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730800AbfHAOtp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Aug 2019 10:49:45 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:15164 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726017AbfHAOto (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Aug 2019 10:49:44 -0400
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x71En4NQ010116
        for <linux-usb@vger.kernel.org>; Thu, 1 Aug 2019 09:49:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=message-id : subject
 : from : to : date : content-type : mime-version :
 content-transfer-encoding; s=PODMain02222019;
 bh=ayLEmac+54CLbVvmaTj/V+CL4pxBdhjnoVJF9CIH9uE=;
 b=KLoNnlaQZzTLT5FWmFjqc2RUm3WJDiqvb9q/Hsm4BA1LklpRFl/z810Azyi3cUkPXJ/G
 G/qN7ZwBwEyoTEkTRoBm96lqpbRqrgbtXzfSwfXBVf8AXLBgVZ0G/AnVyc282mqW0zhw
 sJFb/0bq5wsGoJM/SYNYw8UrgiFBAexoT4bvr0LkgBhiOLCnrRT7yOcrMKsynSyIyI4n
 4eZI4g6J2RyRnaZ5FsuhEXtD50UxV8Eez7yQ7L+JEXJ663y8soURB7YkC1wt1yJ3OruL
 7d+pGH5gmouX9fisw+TpG2bX5xvDjQFKbA2pe2YyrLemhwM5lrcKfxCoprLBRfRE9BPY gA== 
Authentication-Results: ppops.net;
        spf=fail smtp.mailfrom=mkulkarni@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
        by mx0a-001ae601.pphosted.com with ESMTP id 2u3gpm1a1f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <linux-usb@vger.kernel.org>; Thu, 01 Aug 2019 09:49:43 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 1 Aug
 2019 15:49:41 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Thu, 1 Aug 2019 15:49:41 +0100
Received: from mkulkarni-laptop.ad.cirrus.com (mkulkarni-laptop.ad.cirrus.com [198.90.199.28])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EC29545
        for <linux-usb@vger.kernel.org>; Thu,  1 Aug 2019 15:49:40 +0100 (BST)
Message-ID: <1564670980.22099.3.camel@opensource.cirrus.com>
Subject: About usb_new_device() API
From:   Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
To:     <linux-usb@vger.kernel.org>
Date:   Thu, 1 Aug 2019 15:49:40 +0100
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com include:spf.protection.outlook.com
 -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 mlxlogscore=916 phishscore=0 spamscore=0 clxscore=1031 bulkscore=0
 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1908010157
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi All,

I am seeing a peculiar behaviour which I think *might* be 
caused by usb_new_device(). Since usb_new_device() is one of the core
APIs, I cannot explain how PM works for USB device at later point in
time.

In a particular use-case, our composite USB device
exposes HID interface with vendor report descriptor. Since the standard
HID-class driver's HID-input part is unable to decode this vendor report
descriptor, it is unable to bind itself to this interface.
After this, we don't see any L2 requests on USB bus analyser.
Obvious reason seems to be, since no driver is bound to interface, there
cannot be PM call-backs since driver has these call-backs.

But I am expecting that the USB device (which is parent of HID
interface) should see L2. The reason being, USB-core seems to properly
do runtime get/put wherever needed. And HID interface has no driver, so
from USB-core point of view, it is a USB device w/o any interface.
(please correct if this is incorrect expectation).

With that said, I am confused about usb_new_device() in this context. It
seems to call usb_disable_autosuspend() ==> pm_runtime_forbid() ==>
increment usage_count.
However, it never calls usb_enable_autosuspend() itself.
Now since USB PM (and L2) works fine at later point in time (i.e.: after
all the interfaces are bound to their appropriate drivers), I think
somewhere the equivalent of usb_enable_autosuspend() gets called for the
USB device and hence USB PM works fine.

I wonder this *may be* be an issue I am seeing with the use-case
mentioned above. But definitely confused about it and hence thought of
sending this email.

Does this description makes sense? Is it necessary to
call usb_enable_autosuspend() in usb_new_device()?

Thanks,
