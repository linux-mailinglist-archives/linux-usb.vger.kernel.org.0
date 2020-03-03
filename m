Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 326741773C2
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2020 11:17:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728480AbgCCKRa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Mar 2020 05:17:30 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:41042 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728242AbgCCKR3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Mar 2020 05:17:29 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 023ADDhP161608;
        Tue, 3 Mar 2020 10:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=g4Fj4RCs8bygm5l9JixjrRbOjWG5iw+AvJKbF4xphFY=;
 b=xoIXXSSxJ7eN5IxTCeSfIE8ReUGfe0cNdpD37MCO2u1rMKqeYk+Qy39fP0yS1kd3roz1
 MOTHUiort1tQFGNB7H8UJWmFAblELi2xo/axQkYVAVZBjHwk21mLtFe+sflAgZQ2YS6L
 hrEIXDpFYCNwwpvwz7qnz9gCpEG8XIbJtXLpamy8gsUqexQgRp2Xnp4fcNJTnLNRlYD9
 tUU9XfSIlF/oLWNIVTriXvdcyG7tUphzfUBxyPBwdkjH19as80K/+aYNOjLqdG9ZCP6o
 EbGTrBw4MzJEpKOrrgO1TNZFqp8TnT6YXKxDGpT+bU83d1WBqXIAQh5Yb1MIhJNTyzmj Xw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 2yghn31wq1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 03 Mar 2020 10:17:26 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 023AGhWR058251;
        Tue, 3 Mar 2020 10:17:25 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 2yg1rkb68s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 03 Mar 2020 10:17:25 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 023AHOOT002966;
        Tue, 3 Mar 2020 10:17:24 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 03 Mar 2020 02:17:24 -0800
Date:   Tue, 3 Mar 2020 13:17:16 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] thunderbolt: Fix error code in tb_port_is_width_supported()
Message-ID: <20200303101716.uf6l62oavfqmf6hm@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9548 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003030078
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9548 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003030077
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This function is type bool, and it's supposed to return true on success. 
Unfortunately, this path takes negative error codes and casts them to
bool (true) so it's treated as success instead of failure.

Fixes: 91c0c12080d0 ("thunderbolt: Add support for lane bonding")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/thunderbolt/switch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 7d6ecc342508..a2ce99051c51 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -954,7 +954,7 @@ static bool tb_port_is_width_supported(struct tb_port *port, int width)
 	ret = tb_port_read(port, &phy, TB_CFG_PORT,
 			   port->cap_phy + LANE_ADP_CS_0, 1);
 	if (ret)
-		return ret;
+		return false;
 
 	widths = (phy & LANE_ADP_CS_0_SUPPORTED_WIDTH_MASK) >>
 		LANE_ADP_CS_0_SUPPORTED_WIDTH_SHIFT;
-- 
2.11.0

