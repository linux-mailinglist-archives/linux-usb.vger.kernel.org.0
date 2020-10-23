Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12FD4296DDA
	for <lists+linux-usb@lfdr.de>; Fri, 23 Oct 2020 13:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S463136AbgJWLkb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Oct 2020 07:40:31 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:55148 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S463081AbgJWLkb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Oct 2020 07:40:31 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09NBcnio160965;
        Fri, 23 Oct 2020 11:40:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=pmgqEiFa5ebIiYDwVlKkbL1Oo5Ge+iNlwCQELPsg1gQ=;
 b=ofNSOJzfcTZ+YrMmiLvwXTHLfkwS3WlBjki3u5CwW+jOxgjX6MhmMN7192EJsVEQVDo1
 urHwYV77JwE9B44WLTDMucsyDAvbWQ1TOMpsFpjDela3jejVcqJ7QfGC2HYSiCHaKkdn
 rzVpmnfKhx7r3BV4s60H+c1YDZ0fnmNWo3vKSzUNZKYbiptPALOSb5iqMLMHp+zZ2x5j
 XcyslVAIOo5oJcoSNG/7Qv76oHDxDGZmLbHrCV+lX9BiByb3sf27mOz1qZKTTVKXB1hJ
 WDDzbvAfJTtfcSoFmsvRxeOUAwGtufz190L3nV66DHToCvaVbUxOJKORfuM3tHVLPD/3 8w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 349jrq2t6y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 23 Oct 2020 11:40:26 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09NBe4IK186655;
        Fri, 23 Oct 2020 11:40:25 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 34ak1ays21-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 23 Oct 2020 11:40:25 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09NBeNFj015469;
        Fri, 23 Oct 2020 11:40:24 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 23 Oct 2020 04:40:23 -0700
Date:   Fri, 23 Oct 2020 14:40:17 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Amelie Delaunay <amelie.delaunay@st.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 1/2 v2] usb: typec: stusb160x: fix an IS_ERR() vs NULL check
 in probe
Message-ID: <20201023114017.GE18329@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201023112347.GC282278@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9782 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010230083
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9782 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010230083
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The typec_register_port() function doesn't return NULL, it returns error
pointers.

Fixes: da0cb6310094 ("usb: typec: add support for STUSB160x Type-C controller family")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Fix a typo in the commit message.  s/return error pointers/return NULL/.
    Thanks, Walter!

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
