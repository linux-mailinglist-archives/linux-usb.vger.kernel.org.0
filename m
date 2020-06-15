Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FFB91F9556
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jun 2020 13:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729651AbgFOL3d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Jun 2020 07:29:33 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:44392 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729038AbgFOL3d (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Jun 2020 07:29:33 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05FBRWUF059132;
        Mon, 15 Jun 2020 11:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=4coqbX3lUdocJ8nxjkh0UMsl/hf6XyG3L2JDfwHo3L4=;
 b=rJC1rysNng2MECEcxXwLbn9S+Ptmi/G80oBYhAEnfuXhmuEsvNJwa8XNhyGbRrVJ53R8
 RDN7wMyhAQNkP5gr8vLmW15X1Yr7cqgWCvIEDch4Cf1+3Mk6wBDY1hqlk2nypim6Kly7
 8KOLdlscwpJr7IfKGtyF6FSuW7b8ccz1/lkXt7DnAJCnPkc9FxJIbAle88OQpZY4kbkb
 JbGbjTz3j+8+zn03zzROE/sOpMlpVhaaL4d6fySrM7ITsrgg1WUIqHfPgmOomtQ0KMGG
 rPgwHETi1+jSRHPVcFC2Do7Trt8lprC0BvopIz4a20QSXsQFA/jJ3KFVlaGfv1olBkmh 4Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 31p6e5rgms-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 15 Jun 2020 11:29:28 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05FBItJ4191125;
        Mon, 15 Jun 2020 11:27:28 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 31p6dd0utq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 15 Jun 2020 11:27:28 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 05FBRPlL017846;
        Mon, 15 Jun 2020 11:27:25 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 15 Jun 2020 04:27:25 -0700
Date:   Mon, 15 Jun 2020 14:27:19 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Felipe Balbi <balbi@kernel.org>, Chao Xie <chao.xie@marvell.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: gadget: udc: Potential Oops in error handling code
Message-ID: <20200615112719.GA1207669@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9652 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2 adultscore=0 bulkscore=0
 phishscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006150091
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9652 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 adultscore=0
 mlxscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1011
 suspectscore=2 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006150092
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If this is in "transceiver" mode the the ->qwork isn't required and is
a NULL pointer.  This can lead to a NULL dereference when we call
destroy_workqueue(udc->qwork).

Fixes: 3517c31a8ece ("usb: gadget: mv_udc: use devm_xxx for probe")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/gadget/udc/mv_udc_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/mv_udc_core.c b/drivers/usb/gadget/udc/mv_udc_core.c
index cafde053788bb..80a1b52c656e0 100644
--- a/drivers/usb/gadget/udc/mv_udc_core.c
+++ b/drivers/usb/gadget/udc/mv_udc_core.c
@@ -2313,7 +2313,8 @@ static int mv_udc_probe(struct platform_device *pdev)
 	return 0;
 
 err_create_workqueue:
-	destroy_workqueue(udc->qwork);
+	if (udc->qwork)
+		destroy_workqueue(udc->qwork);
 err_destroy_dma:
 	dma_pool_destroy(udc->dtd_pool);
 err_free_dma:
-- 
2.26.2

