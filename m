Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFE55D4801
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 20:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728883AbfJKSyK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 14:54:10 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:46284 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728603AbfJKSyK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Oct 2019 14:54:10 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9BInHq1057189;
        Fri, 11 Oct 2019 18:53:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2019-08-05; bh=HHDwUBgH2SNzkov7VJYo/6PQPC/UBB5flZBfQpz4CNg=;
 b=TrbzywzVLp+TJt6hG8+BsLGELv98VwtL8N0nfwigpb+JtMOVJIjhszhfduNPUUd9USO5
 ad+2lqo9qJY9JKboh1+rs5twU2d7POeMdG1MXpNfu3BsjpJ0XDv50niWkOhbp2HiuwdN
 Si7Pu0j4WNyh0cniSmqnyTC/MS+RIs1f/+gmJOFbFk0EVZCddB2csRTjC9u/0Y4v2csu
 EZX9zNsCO+jEJyauOSjlML3plCx4msVoLv3gUNcr2tkpyvBFCJg6ONn306xoRJoQasRk
 CjH0XH0hA0cXe8k4k+pU40Af2/9B9b1KfMePHfVkwTsYw/CpTzIfeV5Q3/covzZUvJJF Rw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 2vekts37ns-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 11 Oct 2019 18:53:04 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9BIlkRY071692;
        Fri, 11 Oct 2019 18:51:03 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 2vj9qvhv45-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 11 Oct 2019 18:51:03 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x9BIp2FL030724;
        Fri, 11 Oct 2019 18:51:02 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 11 Oct 2019 11:51:01 -0700
Date:   Fri, 11 Oct 2019 21:50:55 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Biju Das <biju.das@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] usb: typec: fix an IS_ERR() vs NULL bug in
 hd3ss3220_probe()
Message-ID: <20191011185055.GA20972@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011135935.GB32191@kuha.fi.intel.com>
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9407 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910110158
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9407 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910110158
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The device_get_named_child_node() function doesn't return error
pointers, it returns NULL on error.

Fixes: 1c48c759ef4b ("usb: typec: driver for TI HD3SS3220 USB Type-C DRP port controller")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: remove -ENODEV instead of -EIO

 drivers/usb/typec/hd3ss3220.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index 9715600aeb04..8afaf5768a17 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -172,8 +172,8 @@ static int hd3ss3220_probe(struct i2c_client *client,
 	hd3ss3220_set_source_pref(hd3ss3220,
 				  HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_DEFAULT);
 	connector = device_get_named_child_node(hd3ss3220->dev, "connector");
-	if (IS_ERR(connector))
-		return PTR_ERR(connector);
+	if (!connector)
+		return -ENODEV;
 
 	hd3ss3220->role_sw = fwnode_usb_role_switch_get(connector);
 	fwnode_handle_put(connector);
-- 
2.20.1

