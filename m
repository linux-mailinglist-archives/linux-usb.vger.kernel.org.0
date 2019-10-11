Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5084CD416D
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 15:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728437AbfJKNfp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 09:35:45 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:38820 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727589AbfJKNfp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Oct 2019 09:35:45 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9BDYO8q180571;
        Fri, 11 Oct 2019 13:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=dLM1T4OpS5iMI4bQ0tNKPOEvox31FBZSydJh3WTIRbs=;
 b=g+8aA5gUHib/yI6o3s1FfU4x3FWhDIVkKKuIc3ZotnrFNDOu6nGAviEqBLF/QfSFNO3u
 Dq5b6Xk5NAN7F1ZQqqp96Ocx7mrXGP0DfgJMokH5PtWLd3TXAgO1ZpiLx4HuCNhiw4pb
 JX3MUnk5pLlwjSsaMvm+zde7tpxmqXbXly6cy5o5DymhGZWg/ib1k5LfS26f+VqkF6/L
 XU4WIPqo9BTj8Jh6D8aM9hUUXcAjIE+wxgTGdAduHL6nbqUT2RKF54BtwGDQ0M9VtvtF
 g6srHZPnmqx1z/+Gj1YzFMqsvqI8g6LYwdDsMB4d7ahD2IGUgRh/Ps5oPEnUHETljfsA bw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 2vekts1h81-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 11 Oct 2019 13:35:35 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9BDXDT7171873;
        Fri, 11 Oct 2019 13:35:34 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 2vjdym0na7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 11 Oct 2019 13:35:34 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x9BDZWKQ018065;
        Fri, 11 Oct 2019 13:35:32 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 11 Oct 2019 06:35:32 -0700
Date:   Fri, 11 Oct 2019 16:35:25 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Juergen Stuber <starblue@users.sourceforge.net>,
        Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        legousb-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] USB: legousbtower: fix a signedness bug in tower_probe()
Message-ID: <20191011133525.GB22905@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9406 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910110127
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9406 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910110127
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The problem is that sizeof() is unsigned long so negative error codes
are type promoted to high positive values and the condition becomes
false.

Fixes: 1d427be4a39d ("USB: legousbtower: fix slab info leak at probe")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/misc/legousbtower.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
index 9d4c52a7ebe0..835908fe1e65 100644
--- a/drivers/usb/misc/legousbtower.c
+++ b/drivers/usb/misc/legousbtower.c
@@ -881,7 +881,7 @@ static int tower_probe (struct usb_interface *interface, const struct usb_device
 				  get_version_reply,
 				  sizeof(*get_version_reply),
 				  1000);
-	if (result < sizeof(*get_version_reply)) {
+	if (result < 0 || result < sizeof(*get_version_reply)) {
 		if (result >= 0)
 			result = -EIO;
 		dev_err(idev, "get version request failed: %d\n", result);
-- 
2.20.1

