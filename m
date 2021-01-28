Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D13773072E2
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jan 2021 10:40:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231534AbhA1Jiz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jan 2021 04:38:55 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:43190 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232098AbhA1Jev (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jan 2021 04:34:51 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10S9EvU8068668;
        Thu, 28 Jan 2021 09:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=w3iV5r8kuL47CL6//7J83sa1KxrHJ5YqJYKYLxIpWgw=;
 b=x3PTS8K4CkVNxjkhV5ETcjPpIuCK+rp3hXzwt8DQJx6lK8obrD3Hlwy3tb9KjCzD/x/c
 axnbSFZGuATipUainJ63bVbrDav9U+9GeyNjLayzpzOozUMarUZXdLV4wkdLYM6PBr0Y
 VUyD0npqvpmMzzq44DQzpHvlk9YMo5f61CeuSbm9U7X8HezvwVb8ANr+g/JfRY1v+whJ
 WJY902ZPfG8+ydPZsOc9EFUTEkULVq9ps0PfBT3qacvMrWX3iMpHUhx3MmBvAVCVCGyp
 P0SbUQ1TpSiBxQQ2WMd4zteSqt6V4VZMerLIk5lP0eTXek2NcAFusly+ntUGg89/tEX7 DA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 368brku2xx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Jan 2021 09:33:53 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10S9GEPC156326;
        Thu, 28 Jan 2021 09:33:50 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 368wr02m57-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Jan 2021 09:33:50 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10S9Xmxr031680;
        Thu, 28 Jan 2021 09:33:48 GMT
Received: from mwanda (/10.175.203.176)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 28 Jan 2021 01:33:48 -0800
Date:   Thu, 28 Jan 2021 12:33:42 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Roger Quadros <rogerq@ti.com>, Li Jun <jun.li@freescale.com>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] USB: gadget: legacy: fix an error code in eth_bind()
Message-ID: <YBKE9rqVuJEOUWpW@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101280048
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=986
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101280048
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This code should return -ENOMEM if the allocation fails but it currently
returns success.

Fixes: 9b95236eebdb ("usb: gadget: ether: allocate and init otg descriptor by otg capabilities")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/gadget/legacy/ether.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/legacy/ether.c b/drivers/usb/gadget/legacy/ether.c
index 30313b233680..99c7fc0d1d59 100644
--- a/drivers/usb/gadget/legacy/ether.c
+++ b/drivers/usb/gadget/legacy/ether.c
@@ -403,8 +403,10 @@ static int eth_bind(struct usb_composite_dev *cdev)
 		struct usb_descriptor_header *usb_desc;
 
 		usb_desc = usb_otg_descriptor_alloc(gadget);
-		if (!usb_desc)
+		if (!usb_desc) {
+			status = -ENOMEM;
 			goto fail1;
+		}
 		usb_otg_descriptor_init(gadget, usb_desc);
 		otg_desc[0] = usb_desc;
 		otg_desc[1] = NULL;
-- 
2.29.2

