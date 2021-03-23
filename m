Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59D45345F88
	for <lists+linux-usb@lfdr.de>; Tue, 23 Mar 2021 14:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231366AbhCWNU1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Mar 2021 09:20:27 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:51654 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231548AbhCWNTn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Mar 2021 09:19:43 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12NDJLl5091112;
        Tue, 23 Mar 2021 13:19:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=6dgzOb3CiJkSySCZ1RJQwzXP6iqC3Xa1CHOUgaq1Sfs=;
 b=x68fuZoDGFxy7KTLaXZjjHqKFkvcP1MNi0ZPVJjcOC5p7//5jP9YIrfKsTV1FNeeTpvl
 j8ORf976vy30ygvzg577RRJYqyrbuJ17zaAmzivWm8Yjq/ji4dzWaTSNtB+rRs3Ug6ba
 RwiPNumWcu7sefP9BmFVcX6gGIK97+pRYIBNO8mF6nsUmHxNvEZFYTsVWQquXzXQAjMY
 RqV/LNbjD9tiPjgwe+DcPE96z/RJsX9MN08CCyJR0NcL5KwyYL/xxwjCVIxxzRGA1CCA
 iWZoZ7IB78mvlIAqVBkCsmE1ojauSW+3L26rc0BItl8E4mVWKHWQrLJWV+RjjAkmBTPd mQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 37d90mex1b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 23 Mar 2021 13:19:21 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12NDEjGt133981;
        Tue, 23 Mar 2021 13:19:16 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 37dtyxe4ph-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 23 Mar 2021 13:19:16 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 12NDJEKh026480;
        Tue, 23 Mar 2021 13:19:15 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 23 Mar 2021 13:19:14 +0000
Date:   Tue, 23 Mar 2021 16:19:06 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Richard Weinberger <richard@nod.at>, linux-usb@vger.kernel.org,
        linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] thunderbolt: unlock on error path in tb_domain_add()
Message-ID: <YFnqyqDzSHenVN9O@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9931 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103230097
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9931 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 clxscore=1011 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103230098
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We accidentally deleted this unlock on the error path.  Undelete it.

Fixes: 7f0a34d7900b ("thunderbolt: Decrease control channel timeout for software connection manager")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/thunderbolt/domain.c | 1 +
 1 files changed, 1 insertions(+), 0 deletion(-)

diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index a7d83eec3d15..98f4056f89ff 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -493,6 +493,7 @@ int tb_domain_add(struct tb *tb)
 	device_del(&tb->dev);
 err_ctl_stop:
 	tb_ctl_stop(tb->ctl);
+	mutex_unlock(&tb->lock);
 
 	return ret;
 }
