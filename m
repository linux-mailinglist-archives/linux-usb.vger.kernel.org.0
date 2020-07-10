Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2534621BDDC
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jul 2020 21:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728321AbgGJTlc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Jul 2020 15:41:32 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:53748 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726908AbgGJTlb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Jul 2020 15:41:31 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06AJapxs079119;
        Fri, 10 Jul 2020 19:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id; s=corp-2020-01-29;
 bh=6GfIvdrYzUJSwmqErb69295pyab1LqwVAjC8pe/INEk=;
 b=CmWv4iyEB8pn9qPWXOGY1dvDUZdDq3ZTyR/FiwAHQ0x4Xsz9RudAv0R/FM3BoV7ArwSd
 Bsq2KaGXl0da8Eh4tNjPOonXGiJFJI4ITDfBFoKQqxcLY1CWspxh+gpyiYukGGJQkhjv
 TI2NsTu7ZhUiNfj9Wo8FtKgVwQ+zcrSH7IEWcu47PjfK3T+UmODkUgqh3mfyOyEYMKfv
 W4cQfTIlmEDA3JuR4g8wvgouZnfZdOSaOc4ql4dH4gGuAn/L/67WG5hK7TxeyIvBaGiQ
 nLmcgH6UpG3ZuUqQ/joLDIuLFR+CkxMTPLGW2rQRd8fk8A8s5UDDU857OZzrBheNzvRF ZQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 325y0asc61-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 10 Jul 2020 19:41:26 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06AJbNKT182413;
        Fri, 10 Jul 2020 19:39:26 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 325k3kcmcq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 10 Jul 2020 19:39:26 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 06AJdP73026153;
        Fri, 10 Jul 2020 19:39:25 GMT
Received: from dhcp-10-152-34-21.usdhcp.oraclecorp.com.com (/10.152.34.21)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 10 Jul 2020 12:39:25 -0700
From:   George Kennedy <george.kennedy@oracle.com>
To:     george.kennedy@oracle.com, davem@davemloft.net, kuba@kernel.org,
        dan.carpenter@oracle.com, dhaval.giani@oracle.com,
        linux-usb@vger.kernel.org
Subject: [PATCH 1/1] ax88172a: fix ax88172a_unbind() failures
Date:   Fri, 10 Jul 2020 15:38:48 -0400
Message-Id: <1594409928-15763-1-git-send-email-george.kennedy@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9678 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 mlxlogscore=864 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
 suspectscore=11 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007100130
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9678 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1011 mlxlogscore=885
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=11
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007100130
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If ax88172a_unbind() fails, make sure that the return code is
less than zero so that cleanup is done properly and avoid UAF.

Signed-off-by: George Kennedy <george.kennedy@oracle.com>
Reported-by: syzbot+4cd84f527bf4a10fc9c1@syzkaller.appspotmail.com
---
 drivers/net/usb/ax88172a.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/usb/ax88172a.c b/drivers/net/usb/ax88172a.c
index 4e514f5..fd9faf2 100644
--- a/drivers/net/usb/ax88172a.c
+++ b/drivers/net/usb/ax88172a.c
@@ -237,6 +237,8 @@ static int ax88172a_bind(struct usbnet *dev, struct usb_interface *intf)
 
 free:
 	kfree(priv);
+	if (ret >= 0)
+		ret = -EIO;
 	return ret;
 }
 
-- 
1.8.3.1

