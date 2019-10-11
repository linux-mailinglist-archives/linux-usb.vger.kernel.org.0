Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5C80D4179
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 15:38:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728204AbfJKNiO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 09:38:14 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:44914 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728034AbfJKNiO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Oct 2019 09:38:14 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9BDYO97194336;
        Fri, 11 Oct 2019 13:36:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=TjrnQALuYDVJkzee38ilNTX7TwmWeZMteytY12xUTx4=;
 b=hCZ0u/5+SovbQLegWHHR/GSdiD3QD/QojxMuyHYNsTpqL3biaf2oSfd+y4uHWGq5i9rX
 S2gnj7Txf377DuFuTSDhOHgwQeFGlJw5D6obcFF5Z7E+JZoKory8MD5P+irBtCT4BcK6
 /QmujpkorqC9gR/zxbcYYBb2EB7J+I+GTl917+C1ts9QaNYoyMHpklNS2FrIzRDPMWee
 wBCLQ43S9uVwSmSY+OqffE6ZEuVp8QPEKR+25DqWXub3LiOaBVpF+eRdzGV6uWwr2RvR
 oefs7gLn0TINL5g0kucI/pj0AaYDLdK2jq2awcsx63JozM1yxhEOvynakyMC9tBvoZam Vw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 2vejkv1t37-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 11 Oct 2019 13:36:08 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9BDXCNA171820;
        Fri, 11 Oct 2019 13:36:07 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 2vjdym0p6w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 11 Oct 2019 13:36:07 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x9BDa5oT030205;
        Fri, 11 Oct 2019 13:36:05 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 11 Oct 2019 06:36:04 -0700
Date:   Fri, 11 Oct 2019 16:35:58 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Biju Das <biju.das@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: typec: fix an IS_ERR() vs NULL bug in hd3ss3220_probe()
Message-ID: <20191011133558.GC22905@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9406 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910110127
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9406 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910110127
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The device_get_named_child_node() function doesn't return error
pointers, it returns NULL on error.

Fixes: 1c48c759ef4b ("usb: typec: driver for TI HD3SS3220 USB Type-C DRP port controller")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/typec/hd3ss3220.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index 9715600aeb04..37b08f57aac4 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -172,8 +172,8 @@ static int hd3ss3220_probe(struct i2c_client *client,
 	hd3ss3220_set_source_pref(hd3ss3220,
 				  HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_DEFAULT);
 	connector = device_get_named_child_node(hd3ss3220->dev, "connector");
-	if (IS_ERR(connector))
-		return PTR_ERR(connector);
+	if (!connector)
+		return -EIO;
 
 	hd3ss3220->role_sw = fwnode_usb_role_switch_get(connector);
 	fwnode_handle_put(connector);
-- 
2.20.1

