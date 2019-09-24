Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1A2FBC995
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2019 15:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727328AbfIXN6K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Sep 2019 09:58:10 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:56732 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726257AbfIXN6J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Sep 2019 09:58:09 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8ODs196032693;
        Tue, 24 Sep 2019 13:58:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=oANeCNLB06fjqCk0Vxb5BOas5qKPF69XI4u9j5h9af8=;
 b=a65YCizw5X2fX+RWPPWBzH2WaPMqKpAnEuLDHuT7LvCzLieX163PpHVYtBtd2c9jZDKX
 6aQm4xhMcuVVI9aee2le/Bxj6f5UeNqBi6mZJAoi7dXiUyztyBdXkqJ/6YueoO264TJR
 vciu387KDRxydbFGen7KkJRq+GV8AaS39wF68byN2voC+ZgWV3299ECXiHwM9/rlsIvL
 WNUPFZgoLjikAlMOqiFsZu3t5bJ/Ahuu8lPhbhjoztlJZA9zP9g9d6VHaKuYsy0u/fie
 OEwmyI4SRoqQcRovqkFx3mbkWIx9y9ihrs4azKLT/7hqFMpABgEBVJr1+ZlW//O14wcH 6w== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 2v5btpx99n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 24 Sep 2019 13:58:06 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8ODsH4j052756;
        Tue, 24 Sep 2019 13:56:05 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 2v6yvkh08m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 24 Sep 2019 13:56:05 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x8ODu4Cw015384;
        Tue, 24 Sep 2019 13:56:05 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 24 Sep 2019 06:56:04 -0700
Date:   Tue, 24 Sep 2019 16:55:58 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Pawel Laszczak <pawell@cadence.com>
Cc:     linux-usb@vger.kernel.org
Subject: [bug report] usb: cdns3: Add Cadence USB3 DRD Driver
Message-ID: <20190924135558.GA18359@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9389 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=450
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909240137
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9389 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=525 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909240137
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Pawel Laszczak,

The patch 7733f6c32e36: "usb: cdns3: Add Cadence USB3 DRD Driver"
from Aug 26, 2019, leads to the following static checker warning:

	drivers/usb/cdns3/ep0.c:335 cdns3_ep0_feature_handle_device()
	error: scheduling with locks held: 'spin_lock:lock'

drivers/usb/cdns3/ep0.c
   309  
   310                  priv_dev->u2_allowed = !!set;
   311                  break;
   312          case USB_DEVICE_LTM_ENABLE:
   313                  ret = -EINVAL;
   314                  break;
   315          case USB_DEVICE_TEST_MODE:
   316                  if (state != USB_STATE_CONFIGURED || speed > USB_SPEED_HIGH)
   317                          return -EINVAL;
   318  
   319                  tmode = le16_to_cpu(ctrl->wIndex);
   320  
   321                  if (!set || (tmode & 0xff) != 0)
   322                          return -EINVAL;
   323  
   324                  switch (tmode >> 8) {
   325                  case TEST_J:
   326                  case TEST_K:
   327                  case TEST_SE0_NAK:
   328                  case TEST_PACKET:
   329                          cdns3_ep0_complete_setup(priv_dev, 0, 1);
   330                          /**
   331                           *  Little delay to give the controller some time
   332                           * for sending status stage.
   333                           * This time should be less then 3ms.
   334                           */
   335                          usleep_range(1000, 2000);
                                ^^^^^^^^^^^^^^^^^^^^^^^^
This is called with locks held and IRQs disabled in
cdns3_device_thread_irq_handler().  The call tree is:

cdns3_device_thread_irq_handler()
  cdns3_check_ep0_interrupt_proceed()
    cdns3_ep0_setup_phase()
      cdns3_ep0_standard_request()
        cdns3_req_ep0_handle_feature()
          cdns3_ep0_feature_handle_device()

You would need to have certain debug config options enabled to see the
might_sleep() warnings and probably USB_DEVICE_TEST_MODE isn't used
very often.

   336                          cdns3_set_register_bit(&priv_dev->regs->usb_cmd,
   337                                                 USB_CMD_STMODE |
   338                                                 USB_STS_TMODE_SEL(tmode - 1));
   339                          break;
   340                  default:
   341                          ret = -EINVAL;
   342                  }
   343                  break;
   344          default:
   345                  ret = -EINVAL;
   346          }

regards,
dan carpenter
