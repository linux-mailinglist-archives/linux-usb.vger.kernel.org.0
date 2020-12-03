Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDBA62CD196
	for <lists+linux-usb@lfdr.de>; Thu,  3 Dec 2020 09:47:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726993AbgLCIpN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Dec 2020 03:45:13 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:53520 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbgLCIpM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Dec 2020 03:45:12 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B38Z0OH109128;
        Thu, 3 Dec 2020 08:44:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=yZan9ev5StxR65hBFD7JRmRtibb7usua99Dl1GfZXOU=;
 b=Kd3CGSGHKq55uw6uwCTwN/TQex/XydTprGoc8O6kqeStWHvQ+PJmWjGuqwt40csyM2pE
 wLZfpYC1IbJ+pqkVOI8+FnKecBH1b594/VW2uUfWLu0BI+jZ7uhR1dtQ23CodzTxycFz
 hrWCWtTnnlcGzq5NrfL7C87bcGtn/4s4OpnsGr4NeZna78EdBMKzV0kLGC5PlZNYewfc
 brW+sUwKho82JSF1eH5q7WWr/FPwzGMVQbgEz5PIVI/Yo/DKraIy/e/IBl1chn5CxlRs
 eHe12+NBMZDlwNGhA0v1uds6Pw8kiQeD5aasumeGx4GBMoJsPGmndt4QVYdmzcpZCUO+ Jw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 353egkvhph-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 03 Dec 2020 08:44:25 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B38dQtc173047;
        Thu, 3 Dec 2020 08:42:24 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 3540g1a66w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 03 Dec 2020 08:42:24 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B38gHh2023301;
        Thu, 3 Dec 2020 08:42:17 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 03 Dec 2020 00:42:17 -0800
Date:   Thu, 3 Dec 2020 11:42:10 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Bastien Nocera <hadess@hadess.net>, Lucas Tanure <tanure@linux.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] USB: apple-mfi-fastcharge: Fix use after free in probe
Message-ID: <X8ik4j8yJitVUyfU@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9823 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012030053
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9823 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1011 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012030052
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This code frees "mfi" and then derefences it on the next line to get
the error code.

Fixes: b0eec52fbe63 ("USB: apple-mfi-fastcharge: Fix kfree after failed kzalloc")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/misc/apple-mfi-fastcharge.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/apple-mfi-fastcharge.c b/drivers/usb/misc/apple-mfi-fastcharge.c
index 6dedd5498e8a..32a17b42d57b 100644
--- a/drivers/usb/misc/apple-mfi-fastcharge.c
+++ b/drivers/usb/misc/apple-mfi-fastcharge.c
@@ -178,6 +178,7 @@ static int mfi_fc_probe(struct usb_device *udev)
 {
 	struct power_supply_config battery_cfg = {};
 	struct mfi_device *mfi = NULL;
+	int err;
 
 	if (!mfi_fc_match(udev))
 		return -ENODEV;
@@ -194,8 +195,9 @@ static int mfi_fc_probe(struct usb_device *udev)
 						&battery_cfg);
 	if (IS_ERR(mfi->battery)) {
 		dev_err(&udev->dev, "Can't register battery\n");
+		err = PTR_ERR(mfi->battery);
 		kfree(mfi);
-		return PTR_ERR(mfi->battery);
+		return err;
 	}
 
 	mfi->udev = usb_get_dev(udev);
-- 
2.29.2

