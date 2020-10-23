Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAC89296D95
	for <lists+linux-usb@lfdr.de>; Fri, 23 Oct 2020 13:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S462931AbgJWLY0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Oct 2020 07:24:26 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:35370 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S462871AbgJWLY0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Oct 2020 07:24:26 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09NBK9RQ009719;
        Fri, 23 Oct 2020 11:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=vMD+gwEZ/wAHugAJxUnMCz+5hpM32mZk+9wzVpSelIc=;
 b=c+OIvcr0ddYJq0op7XEVQzAeuYAtC9uUE7w9a7h2OF12/8MdpJUsp9ToUm35Y6hbgWeB
 X5MOqi7KCt6Qjhp60xpzpTtR4FAW8f2S8kCUQ4NqJVMGZEOpgi5W+DszegTXzkKpxbmu
 g/sKORuly6yd9NEi0q/Dhyi3ILcyt6Kzg5bZYS5rCuN9Oea1qZ8T1FmdU4v5HXlTpESf
 dDAX+sS5dSiAT7W6W5hk0K3mLsgG2Oeb7wMQSylR7hjNmxG91ZwEwnsnMRTZTDlSQ9WF
 eWuc5a71e0dGPdTe8SfX8BJhaMWiGsSW2HkE0IYQ2F6vJgADLcl5IqlHr4ervt3ds/Qj dA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2130.oracle.com with ESMTP id 347p4baqwj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 23 Oct 2020 11:24:20 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09NBJkIZ106124;
        Fri, 23 Oct 2020 11:24:20 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 348ah1w65r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 23 Oct 2020 11:24:19 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09NBOI8R011154;
        Fri, 23 Oct 2020 11:24:18 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 23 Oct 2020 04:24:18 -0700
Date:   Fri, 23 Oct 2020 14:24:12 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Amelie Delaunay <amelie.delaunay@st.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 2/2] usb: typec: stusb160x: fix some signedness bugs
Message-ID: <20201023112412.GD282278@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9782 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010230080
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9782 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010230080
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

These variables are enums but in this situation GCC will treat them as
unsigned so the conditions are never true.

Fixes: da0cb6310094 ("usb: typec: add support for STUSB160x Type-C controller family")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/typec/stusb160x.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/stusb160x.c b/drivers/usb/typec/stusb160x.c
index f7369e371dd4..da7f1957bcb3 100644
--- a/drivers/usb/typec/stusb160x.c
+++ b/drivers/usb/typec/stusb160x.c
@@ -545,7 +545,7 @@ static int stusb160x_get_fw_caps(struct stusb160x *chip,
 	ret = fwnode_property_read_string(fwnode, "power-role", &cap_str);
 	if (!ret) {
 		chip->port_type = typec_find_port_power_role(cap_str);
-		if (chip->port_type < 0) {
+		if ((int)chip->port_type < 0) {
 			ret = chip->port_type;
 			return ret;
 		}
@@ -567,9 +567,10 @@ static int stusb160x_get_fw_caps(struct stusb160x *chip,
 	if (!ret) {
 		chip->pwr_opmode = typec_find_pwr_opmode(cap_str);
 		/* Power delivery not yet supported */
-		if (chip->pwr_opmode < 0 ||
+		if ((int)chip->pwr_opmode < 0 ||
 		    chip->pwr_opmode == TYPEC_PWR_MODE_PD) {
-			ret = chip->pwr_opmode < 0 ? chip->pwr_opmode : -EINVAL;
+			ret = (int)chip->pwr_opmode < 0 ? chip->pwr_opmode :
+							  -EINVAL;
 			dev_err(chip->dev, "bad power operation mode: %d\n",
 				chip->pwr_opmode);
 			return ret;
-- 
2.28.0

