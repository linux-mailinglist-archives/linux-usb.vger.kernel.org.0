Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50DC22A25B1
	for <lists+linux-usb@lfdr.de>; Mon,  2 Nov 2020 08:57:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbgKBH5J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Nov 2020 02:57:09 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:44448 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbgKBH5I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Nov 2020 02:57:08 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A27tXVX106797;
        Mon, 2 Nov 2020 07:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=Wef2b/yzMGsWD9DTHJSvGdiP19gLsqH3HIK7My8A+hQ=;
 b=RkCFPrIk6dvQMgT18BH12mxwZrIr6nYiG/bqijOTLc6deHQ+VVV1uHNRcta1XN6se2Mf
 jO17WQ4+kXKz0OxOIL+lT7Pj3s7Wsx3kdgW2lYERZnDEPNs/vPBwPRtvmaNwshQJBwFE
 GbcspXGQsx8MrRreIOEGwhnkjFiv2pdRlSZg0FlMCaTn8OvRXjiCGZg64q9yyuhOJnOo
 FJVJA9xWoYFSHwr7XP/KKgYjEdsA6pNvczSGr/9yKrHu5cj06ZjiqpqqRc4UG+I8c4Ou
 vRMe130g9QnXIS+rYiQY4J42JrS50hqbJepUtTpG6dvHh5XFXcCLfpfaRNBEowg3cvVy 0w== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2130.oracle.com with ESMTP id 34hhb1tfqm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 02 Nov 2020 07:57:05 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A27teT9066849;
        Mon, 2 Nov 2020 07:57:05 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 34hvrtfyhk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 02 Nov 2020 07:57:05 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0A27v4gV014130;
        Mon, 2 Nov 2020 07:57:04 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sun, 01 Nov 2020 23:57:03 -0800
Date:   Mon, 2 Nov 2020 10:56:55 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Al Cooper <alcooperx@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-usb@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: misc: brcmstb-usb-pinmap: Fix an IS_ERR() vs NULL check
Message-ID: <20201102075655.GA4163205@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9792 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011020062
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9792 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 suspectscore=0
 clxscore=1011 mlxlogscore=999 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011020062
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The devm_ioremap() function doesn't return error pointers, it returns
NULL on error.

Fixes: 517c4c44b323 ("usb: Add driver to allow any GPIO to be used for 7211 USB signals")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
The commit original commit "usb: Add driver to allow any GPIO to ..."
has a bad subsystem prefix.  This is a common anti-pattern for new
drivers.  (Although less common after I started whinging to everyone
about it).  It means that the first person to fix a bug in the driver
has to imagine what the original author wanted.  Sometimes people get
annoyed which prefix we pick for them.

 drivers/usb/misc/brcmstb-usb-pinmap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/brcmstb-usb-pinmap.c b/drivers/usb/misc/brcmstb-usb-pinmap.c
index 02144c39aaba..2326e60545f7 100644
--- a/drivers/usb/misc/brcmstb-usb-pinmap.c
+++ b/drivers/usb/misc/brcmstb-usb-pinmap.c
@@ -277,8 +277,8 @@ static int __init brcmstb_usb_pinmap_probe(struct platform_device *pdev)
 	pdata->out_pins = (struct out_pin *)(pdata->in_pins + in_count);
 
 	pdata->regs = devm_ioremap(&pdev->dev, r->start, resource_size(r));
-	if (IS_ERR(pdata->regs))
-		return PTR_ERR(pdata->regs);
+	if (!pdata->regs)
+		return -ENOMEM;
 	platform_set_drvdata(pdev, pdata);
 
 	err = parse_pins(&pdev->dev, dn, pdata);
-- 
2.28.0

