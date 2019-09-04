Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E81CA7FEF
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2019 12:02:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729286AbfIDKCT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Sep 2019 06:02:19 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:51238 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728259AbfIDKCS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Sep 2019 06:02:18 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x84A0UVH119080;
        Wed, 4 Sep 2019 10:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=UM+SwFNr0NZqjE23wbuHlkhD3KZ5eqc7RvBW7cs6I4o=;
 b=CUm2SRHGblQACE6D2lFl/UJJlDCFFGPRG21XRHS5kFBWVPGcOyhUMICsKVoq/4Rqx0aw
 9XRT8SUOKiy1i0/yBDdUdHgpQgRvng1QRQh0UlNELOPockzvGFNnNYdhpdHR0vaZpo3T
 6ZrWhMpbrFbyswOH7tdWQri+zqdWgrrys0CPnAXi1pH1OQSdGx6UXPKs90meargUArp+
 yX9vzTHSXJoIpNbpPrQAKzEkm9yK4T30HmJc6jJkz7uH1zqIdSIRoG8YXbzcBTMrDf0X
 2Nrg/hBPVLCeter25JDBKn59Vw2D1EmuNMLIMFhiBH23lG/TwWK2BY90eMbN3km+aJqx lw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 2utb4f00tt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 04 Sep 2019 10:01:11 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x849wDEV131414;
        Wed, 4 Sep 2019 10:01:10 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 2ut1hn7xja-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 04 Sep 2019 10:01:10 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x84A197q000449;
        Wed, 4 Sep 2019 10:01:09 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 04 Sep 2019 03:01:08 -0700
Date:   Wed, 4 Sep 2019 13:01:02 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pawel Laszczak <pawell@cadence.com>
Cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: cdns3: Fix use after free in probe error handling
Message-ID: <20190904100102.GB7007@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9369 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909040099
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9369 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909040099
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We can't use "wrap" after it has been freed.

Fixes: 7733f6c32e36 ("usb: cdns3: Add Cadence USB3 DRD Driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/cdns3/cdns3-pci-wrap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/cdns3-pci-wrap.c b/drivers/usb/cdns3/cdns3-pci-wrap.c
index c41ddb61b857..b0a29efe7d31 100644
--- a/drivers/usb/cdns3/cdns3-pci-wrap.c
+++ b/drivers/usb/cdns3/cdns3-pci-wrap.c
@@ -159,8 +159,9 @@ static int cdns3_pci_probe(struct pci_dev *pdev,
 		wrap->plat_dev = platform_device_register_full(&plat_info);
 		if (IS_ERR(wrap->plat_dev)) {
 			pci_disable_device(pdev);
+			err = PTR_ERR(wrap->plat_dev);
 			kfree(wrap);
-			return PTR_ERR(wrap->plat_dev);
+			return err;
 		}
 	}
 
-- 
2.20.1

