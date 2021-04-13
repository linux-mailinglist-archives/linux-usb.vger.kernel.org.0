Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE4435E6BA
	for <lists+linux-usb@lfdr.de>; Tue, 13 Apr 2021 20:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245591AbhDMS6I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Apr 2021 14:58:08 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:42982 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233027AbhDMS6H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Apr 2021 14:58:07 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13DIu89n023490;
        Tue, 13 Apr 2021 18:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=5rAWI33pbhctfGJrm6FjwmYdUL2fpowiUzMCHv8Asnc=;
 b=w8LG6ZFZxGoO59rxpbPICGuL42CT0iMRgrn7GJTT7bDrJQsPTPULnQLi2TULcP2rxjlM
 9+1Nr0/d4Y9YlFRahde0i+KXL9R/ELhe3UQ4vXX1qD72hFNeEOdqZJBYnYIAWoblgwF0
 ULLghkbM9OsKqvJ0VJx+PtIp85f84WZC0cTuOq16vOoCPI3uOJcOAMtF6wBJly6AaKwc
 xLWvB1tAztrHUwdKkp/82rxKx9HdXKm6X8Qzd80ZZVhY2Aq/XiflK6SkRjJsHE2bL7Zq
 ISNyc5P+LBK2+GoL8OXELVWfBL55Zv/+o8IZU1ciTrmi1aYlGeaPfL5FXzC8XYJoQs+a Ew== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2130.oracle.com with ESMTP id 37u1hbg8ww-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 13 Apr 2021 18:57:46 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13DIuTaX016983;
        Tue, 13 Apr 2021 18:57:44 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 37unkpwybs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 13 Apr 2021 18:57:44 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 13DIvgCU019804;
        Tue, 13 Apr 2021 18:57:43 GMT
Received: from mwanda (/10.175.166.128)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 13 Apr 2021 11:57:42 -0700
Date:   Tue, 13 Apr 2021 21:57:37 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org
Subject: [bug report] usb: typec: Port mapping utility
Message-ID: <YHXpocjNVY7MyXzJ@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9953 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104130126
X-Proofpoint-GUID: oGWGxVNRvcuA-oRs29eKSzGlxMcQTxJW
X-Proofpoint-ORIG-GUID: oGWGxVNRvcuA-oRs29eKSzGlxMcQTxJW
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9953 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 priorityscore=1501
 clxscore=1011 adultscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104130126
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Heikki Krogerus,

The patch ae196ddb0d31: "usb: typec: Port mapping utility" from Apr
7, 2021, leads to the following static checker warning:

	drivers/usb/typec/port-mapper.c:168 typec_link_port()
	warn: missing error code 'ret'

drivers/usb/typec/port-mapper.c
   156  int typec_link_port(struct device *port)
   157  {
   158          struct device *connector;
   159          struct port_node *node;
   160          int ret = 0;
   161  
   162          node = create_port_node(port);
   163          if (IS_ERR(node))
   164                  return PTR_ERR(node);
   165  
   166          connector = find_connector(node);
   167          if (!connector)
   168                  goto remove_node;

Set error code?

   169  
   170          ret = link_port(to_typec_port(connector), node);
   171          if (ret)
   172                  goto put_connector;
   173  
   174          return 0;
   175  
   176  put_connector:
   177          put_device(connector);
   178  remove_node:
   179          remove_port_node(node);
   180  
   181          return ret;
   182  }

regards,
dan carpenter
