Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB7A9131F14
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2020 06:24:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbgAGFYi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jan 2020 00:24:38 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:56322 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725835AbgAGFYh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jan 2020 00:24:37 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00758v2Q110093;
        Tue, 7 Jan 2020 05:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=Z2Q55XaPt/0JP/wEuk5ZQ8JAYBRzoi0bmzbjPqCpt/U=;
 b=HnlHsrC1pdLighxh6jsmGrNRr0+8mB3NqCxkaU/xb4gVfEJzaiCfpYfnt6BCwOc+ntR0
 NzNwC7Vi/yYM4nYDtbn6dzglHpWPVmC0YQcEveZdKdy2RyxPJMFITGsRMapbJzkvXzXO
 TGHTEGBDshxzuNdrNHClKgXgE4UOXoE8UZthLEzFGzbhec2qKphTftSsuRUJ65ZtsUQG
 JwEGZAPpJuUydSesk2YnmXtsnv8/Yu3m7PxKkfbFfRNVMk+vSUKpWvgaj0CqRCWDwQYn
 XCSZMeJvwQzMeFnlPql8XmbH5qkbETSUK0JpVzVDZQLnPGxqnyw1BIkR+6Zd+jurjuaE Rg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 2xakbqk0w5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 07 Jan 2020 05:24:34 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 0075Djn1009542;
        Tue, 7 Jan 2020 05:24:33 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 2xb4uqc5pu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 07 Jan 2020 05:24:33 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0075OW6N006954;
        Tue, 7 Jan 2020 05:24:32 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 06 Jan 2020 21:24:31 -0800
Date:   Tue, 7 Jan 2020 08:24:24 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     mika.westerberg@linux.intel.com
Cc:     linux-usb@vger.kernel.org
Subject: [bug report] thunderbolt: Add initial support for USB4
Message-ID: <20200107052424.pidwn5f7wyayany2@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9492 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=703
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001070042
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9492 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=756 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001070042
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[ Should linux-usb be listed in MAINTAINERS? - dan]

Hello Mika Westerberg,

The patch b04079837b20: "thunderbolt: Add initial support for USB4"
from Dec 17, 2019, leads to the following static checker warning:

	drivers/thunderbolt/usb4.c:242 usb4_switch_setup()
	warn: bool mask it always valse 'xhci & ((((1))) << (18))'

drivers/thunderbolt/usb4.c
   206          bool tbt3, xhci;
                ^^^^       ^^^^

   207          u32 val = 0;
   208          int ret;
   209  
   210          if (!tb_route(sw))
   211                  return 0;
   212  
   213          ret = tb_sw_read(sw, &val, TB_CFG_SWITCH, ROUTER_CS_6, 1);
   214          if (ret)
   215                  return ret;
   216  
   217          xhci = val & ROUTER_CS_6_HCI;
   218          tbt3 = !(val & ROUTER_CS_6_TNS);
   219  
   220          tb_sw_dbg(sw, "TBT3 support: %s, xHCI: %s\n",
   221                    tbt3 ? "yes" : "no", xhci ? "yes" : "no");
   222  
   223          ret = tb_sw_read(sw, &val, TB_CFG_SWITCH, ROUTER_CS_5, 1);
   224          if (ret)
   225                  return ret;
   226  
   227          parent = tb_switch_parent(sw);
   228  
   229          if (tb_switch_find_port(parent, TB_TYPE_USB3_DOWN)) {
   230                  val |= ROUTER_CS_5_UTO;
   231                  xhci = false;
   232          }
   233  
   234          /* Only enable PCIe tunneling if the parent router supports it */
   235          if (tb_switch_find_port(parent, TB_TYPE_PCIE_DOWN)) {
   236                  val |= ROUTER_CS_5_PTO;
   237                  /*
   238                   * xHCI can be enabled if PCIe tunneling is supported
   239                   * and the parent does not have any USB3 dowstream
   240                   * adapters (so we cannot do USB 3.x tunneling).
   241                   */
   242                  if (xhci & ROUTER_CS_6_HCI)
                            ^^^^^^^^^^^^^^^^^^^^^^
"xhci" is bool so BIT(18) is not set.

   243                          val |= ROUTER_CS_5_HCO;
   244          }
   245  
   246          /* TBT3 supported by the CM */
   247          val |= ROUTER_CS_5_C3S;


regards,
dan carpenter
