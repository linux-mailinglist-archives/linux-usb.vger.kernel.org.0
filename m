Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C00F2CD183
	for <lists+linux-usb@lfdr.de>; Thu,  3 Dec 2020 09:42:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388439AbgLCIma (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Dec 2020 03:42:30 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:56342 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726228AbgLCIma (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Dec 2020 03:42:30 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B38Z4bU104343;
        Thu, 3 Dec 2020 08:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=ngAHlOlhS8B8dIePlASXJBeaZG67oRhYlHd+DRQgKf4=;
 b=yko66+cI3h1IO+pmwX5XtiIVOhyCjcSE0/ncQ/jru6IoVm7YzMdFOOsKEEIxslu6+R0v
 WYCwg4GWh7Uya+lyPsClanMI8eNROY8pS82ZBrkzQGIPpK892f8i3UvEjN74OwPCenyL
 J7XInKu2Iosd3vSetvcOLC26nNMxYM9XqVurDvg29yCSf+cnTHfuIXqT29edpCeZqhN8
 Rse6n/o0nPTjyZXT+Uq2hGBQPyEiSfYO9so0ZAu0MRUPI6iZWs4APXHW2B4zykxPyqBS
 od6x0gxPbbdE5XmwKl8NDTY1dzWvXBJYML71glJowwIABZLOkxpdyYUIIcmL8nWfKe03 cg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2130.oracle.com with ESMTP id 353c2b4nnk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 03 Dec 2020 08:41:44 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B38eBai194219;
        Thu, 3 Dec 2020 08:41:44 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 3540f1hrrp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 03 Dec 2020 08:41:43 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B38fh8A023113;
        Thu, 3 Dec 2020 08:41:43 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 03 Dec 2020 00:41:42 -0800
Date:   Thu, 3 Dec 2020 11:41:35 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH 2/2] usb: mtu3: mtu3_debug: remove an unused struct member
Message-ID: <X8ikv1QA3Do50D+R@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9823 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0 mlxlogscore=992
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012030053
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9823 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012030052
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The "nregs" member is not used.  The code uses the "regset.nregs"
struct member instead.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/mtu3/mtu3_debug.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_debug.h b/drivers/usb/mtu3/mtu3_debug.h
index 3084c46017c3..9a36134b322d 100644
--- a/drivers/usb/mtu3/mtu3_debug.h
+++ b/drivers/usb/mtu3/mtu3_debug.h
@@ -19,7 +19,6 @@ struct ssusb_mtk;
 struct mtu3_regset {
 	char name[MTU3_DEBUGFS_NAME_LEN];
 	struct debugfs_regset32 regset;
-	size_t nregs;
 };
 
 struct mtu3_file_map {
-- 
2.29.2

