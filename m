Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ADA1264357
	for <lists+linux-usb@lfdr.de>; Thu, 10 Sep 2020 12:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730460AbgIJKKW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Sep 2020 06:10:22 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:38670 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730380AbgIJKKU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Sep 2020 06:10:20 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08A9waUk118560;
        Thu, 10 Sep 2020 10:10:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=dJPdwqxAhYznmHRspV8tsQZer1P2erCXwmDyEJdSu6c=;
 b=nnUIPZyd6aiOrXWgqNDVnee+AiExuVmYz/JwnoWxusRpxhpRf8fRKv3hvUqRNA6dKw7z
 rjGT1R5cr2JrWtqWwCegkwifQbH2ZUWr5sTmDn9JhH13xnl4SafuThxdyk2a1Y3xvGiP
 HgUqIjINvSV2SNwhCng4vNlTyJ0VSYr/smJ+1e3JSRi+VIYU36oQ2FRoiLa/Upw5FcW6
 dxRkF/GoaTZyfSqZe7ayZHzrkMT7mWQcwKVu9TUPX2VuOGFJsBmERevwYRrRupHCd/pI
 EjkJA3WCchPWyCca9/8o3KP/Deydxo/SZM97vvu/5mh4g+lWSLg8L1th/VTWZnKg4Out oQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 33c2mm73g8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 10 Sep 2020 10:10:14 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08AA6RrF136447;
        Thu, 10 Sep 2020 10:08:13 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 33cmm0pyf7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 10 Sep 2020 10:08:13 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08AA8CIU011495;
        Thu, 10 Sep 2020 10:08:12 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 10 Sep 2020 03:08:12 -0700
Date:   Thu, 10 Sep 2020 13:08:05 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Andreas Noever <andreas.noever@gmail.com>
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Gil Fine <gil.fine@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] thunderbolt: debugfs: Fix uninitialized return in
 counters_write()
Message-ID: <20200910100805.GB79916@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9739 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 suspectscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009100094
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9739 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1011 mlxlogscore=999
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009100093
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the first line is in an invalid format then the "ret" value is
uninitialized.  We should return -EINVAL instead.

Fixes: 54e418106c76 ("thunderbolt: Add debugfs interface")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/thunderbolt/debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index fdfe6e4afbfe..3680b2784ea1 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -231,6 +231,7 @@ static ssize_t counters_write(struct file *file, const char __user *user_buf,
 		char *line = buf;
 		u32 val, offset;
 
+		ret = -EINVAL;
 		while (parse_line(&line, &offset, &val, 1, 4)) {
 			ret = tb_port_write(port, &val, TB_CFG_COUNTERS,
 					    offset, 1);
-- 
2.28.0

