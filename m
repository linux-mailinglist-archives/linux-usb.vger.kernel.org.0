Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A980333892
	for <lists+linux-usb@lfdr.de>; Wed, 10 Mar 2021 10:20:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbhCJJT2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 04:19:28 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:33760 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbhCJJT0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Mar 2021 04:19:26 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12A9FUMA175600;
        Wed, 10 Mar 2021 09:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=AqTdyJLiz+zAScUKER1AkLR97RneyQL/b4dMC97gLzk=;
 b=SE555jWXq1fDkaFTTTiBslUsP8RVhPnrs+DCAmgeJSAR0egDUfsSwxU/k7phWkr6CF6g
 tmllogJTZKCRf52D6C0nG6iZ67eEKCjnmYVlfHWs7XOPcDoXG8/juZIgfJ6HjZpcgspo
 tX718sL/05A4o0VqLBBG8YCr9qk9JTnO/hGnW7JalELHCPqvc8OvgNBx5RzSQCFJF2Yj
 zaCCpCn76gy7o/rAgfZHpH6xq/iHitpwChW8rfVilf7QIuw29yT1B4kodmUWxSEGR035
 4rr4xDC5DBFcBj5cMA2Ly2N1MsloNR9YLR2JRjBHzSppaf4qr5aGfYH8X2ZTxdxIoIdT zA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 3741pmj7r0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 10 Mar 2021 09:19:22 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12A9FSBF103909;
        Wed, 10 Mar 2021 09:19:20 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 374kny36my-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 10 Mar 2021 09:19:20 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 12A9JHEI030766;
        Wed, 10 Mar 2021 09:19:19 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 10 Mar 2021 01:19:17 -0800
Date:   Wed, 10 Mar 2021 12:19:11 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     frank.li@nxp.com
Cc:     linux-usb@vger.kernel.org
Subject: [bug report] usb: cdns3: add power lost support for system resume
Message-ID: <YEiPD6L0BJkWrjid@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9918 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=829
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103100044
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9918 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 mlxlogscore=783
 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1011 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103100044
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Frank Li,

The patch c450e48eb570: "usb: cdns3: add power lost support for
system resume" from Feb 18, 2021, leads to the following static
checker warning:

	drivers/usb/cdns3/core.c:551 cdns_resume()
	error: uninitialized symbol 'ret'.

drivers/usb/cdns3/core.c
   544  
   545                  if (!role_changed) {
   546                          if (cdns->role == USB_ROLE_HOST)
   547                                  ret = cdns_drd_host_on(cdns);
   548                          else if (cdns->role == USB_ROLE_DEVICE)
   549                                  ret = cdns_drd_gadget_on(cdns);

What about is "ret" if the role is USB_ROLE_NONE?

   550  
   551                          if (ret)
   552                                  return ret;
   553                  }
   554          }
   555  

regards,
dan carpenter
