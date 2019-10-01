Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 623D7C33A5
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 14:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732492AbfJAMBs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 08:01:48 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:33704 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbfJAMBs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Oct 2019 08:01:48 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x91Bwpgr166536;
        Tue, 1 Oct 2019 12:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2019-08-05; bh=u6lavK+wT9mNhlsyTtMKXpLWVYjyiZkQ5I/Y4zuuoVc=;
 b=qnzzjXy5xZhn30ejq4FOJiGiQWhFTlll9I44x83fsAMipI5iwF12qreTb95vevOwzt/l
 r19zi3PPtS5L6Azfjvzg2d2TLbAMyhCaU6OacpWBv9zyN4bh+wr4pDhoGlTF11Gi3d2E
 XSWsK96C/W8qGt3hL1ZwwNx0uNWecrMAb2hRzSxivbtfzXsRMLryECoKFio0n9Jrg8PA
 sEXk5VK8uv3PMX03Xk9+egFORHKcvRiyH+/EsVvnW31TSFVUD5QNmfLV83OEnuydf98m
 GFxzDufr+1fWtu0zD1YQ9vB1cazMBi/gw2YvH9xHrdybJzBPNlEkzq+o+JstQBTLcZgu CQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 2va05rn7mh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 01 Oct 2019 12:01:27 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x91Bx6Db064342;
        Tue, 1 Oct 2019 12:01:26 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 2vbsm1uteu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 01 Oct 2019 12:01:26 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x91C1OHB020602;
        Tue, 1 Oct 2019 12:01:24 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 01 Oct 2019 05:01:23 -0700
Date:   Tue, 1 Oct 2019 15:01:17 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] usb: typec: tcpm: usb: typec: tcpm: Fix a signedness bug
 in tcpm_fw_get_caps()
Message-ID: <20191001120117.GA23528@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190926125310.GA9967@roeck-us.net>
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9396 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910010111
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9396 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910010111
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The "port->typec_caps.data" and "port->typec_caps.type" variables are
enums and in this context GCC will treat them as an unsigned int so they
can never be less than zero.

Fixes: ae8a2ca8a221 ("usb: typec: Group all TCPCI/TCPM code together")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: preserve the error code

 drivers/usb/typec/tcpm/tcpm.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 96562744101c..5f61d9977a15 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4409,18 +4409,20 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
 	/* USB data support is optional */
 	ret = fwnode_property_read_string(fwnode, "data-role", &cap_str);
 	if (ret == 0) {
-		port->typec_caps.data = typec_find_port_data_role(cap_str);
-		if (port->typec_caps.data < 0)
-			return -EINVAL;
+		ret = typec_find_port_data_role(cap_str);
+		if (ret < 0)
+			return ret;
+		port->typec_caps.data = ret;
 	}
 
 	ret = fwnode_property_read_string(fwnode, "power-role", &cap_str);
 	if (ret < 0)
 		return ret;
 
-	port->typec_caps.type = typec_find_port_power_role(cap_str);
-	if (port->typec_caps.type < 0)
-		return -EINVAL;
+	ret = typec_find_port_power_role(cap_str);
+	if (ret < 0)
+		return ret;
+	port->typec_caps.type = ret;
 	port->port_type = port->typec_caps.type;
 
 	if (port->port_type == TYPEC_PORT_SNK)
-- 
2.20.1

