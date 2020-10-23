Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1C24296D93
	for <lists+linux-usb@lfdr.de>; Fri, 23 Oct 2020 13:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S462903AbgJWLYC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Oct 2020 07:24:02 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:35074 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S462871AbgJWLYB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Oct 2020 07:24:01 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09NBKHRg019538;
        Fri, 23 Oct 2020 11:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=tLJo7Te/+UGecvdayfXa3Pq3Xl699Ew8dl17GGtE0Nw=;
 b=ONBLXtqpIyJviAFplWicnWahKkHCfpybvMtVGUusxYNqQZVHXl3xcxz0Jg9Lxb5rd2lF
 PN93tbPreoYmbWzS3Ywne0jQnoZV+Yob6KIKeNienRgLxVVIrQWrpT2HPHWbTXtOnNJV
 m8gfi/RZZPm9XjLQ59G09hMXDAEUjghWEVyi8GnjQ3pSo8i0QDWXLHLTdqzZkWl1/VnT
 JmSCeqz0B0d5ORqEU9t4HXjWLF+ElrgzVjoSrCp1PT5nPZaIJCt6+xJQcwS2ry2QdWBz
 xM1fBZGsN0w7Uxjj5hffaQ5k7Ah42awfrOLte2rnEyDaPQ2QcIhN1kbQ9Hxc7bYFwKGr dg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 34ak16tyna-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 23 Oct 2020 11:23:55 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09NBKDb4099179;
        Fri, 23 Oct 2020 11:23:55 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 348a6rnev7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 23 Oct 2020 11:23:55 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09NBNrCq006441;
        Fri, 23 Oct 2020 11:23:53 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 23 Oct 2020 04:23:52 -0700
Date:   Fri, 23 Oct 2020 14:23:47 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Amelie Delaunay <amelie.delaunay@st.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 1/2] usb: typec: stusb160x: fix an IS_ERR() vs NULL check in
 probe
Message-ID: <20201023112347.GC282278@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9782 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010230080
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9782 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0
 priorityscore=1501 clxscore=1011 malwarescore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010230080
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The typec_register_port() function doesn't return error pointers, it
returns error pointers.

Fixes: da0cb6310094 ("usb: typec: add support for STUSB160x Type-C controller family")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/typec/stusb160x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.c
index ce0bd7b3ad88..f7369e371dd4 100644
--- a/drivers/usb/typec/stusb160x.c
+++ b/drivers/usb/typec/stusb160x.c
@@ -729,8 +729,8 @@ static int stusb160x_probe(struct i2c_client *client)
 	}
 
 	chip->port = typec_register_port(chip->dev, &chip->capability);
-	if (!chip->port) {
-		ret = -ENODEV;
+	if (IS_ERR(chip->port)) {
+		ret = PTR_ERR(chip->port);
 		goto all_reg_disable;
 	}
 
-- 
2.28.0

