Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6876E7134DE
	for <lists+linux-usb@lfdr.de>; Sat, 27 May 2023 15:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232071AbjE0NDv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 27 May 2023 09:03:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjE0NDu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 27 May 2023 09:03:50 -0400
Received: from st43p00im-ztdg10063201.me.com (st43p00im-ztdg10063201.me.com [17.58.63.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F3FA10A
        for <linux-usb@vger.kernel.org>; Sat, 27 May 2023 06:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pen.gy; s=sig1;
        t=1685192621; bh=ypmPoU8i0dNbKAcQkSnsWSpXzhJA8qAna7N7NKesFms=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=FDcdklO2f9fpbt4VkUP0QM6bL+/xog/PM4A3NF3yv0DVUe58mPJIK0wMlj0FjExTq
         4A4H8YrrJsMw3qciDUkdTxUUX9cbqFIQzwDrOTNAZGaIQZAe9hB5oOt0lqFe7pWBqB
         Er0jcLrNFk0QV5cqpCHUNvwND9CCl4Mqt7e83IEPVXsIdgr4mZTAsSgRovQf0yKyzN
         ssackiuXYB3wBb1O6KTBjIqt3vAYb68bBUVZWdrA2u06IQgnMNC2V0B7HSrH4TgJtS
         2PP+ePztc3TbnQFeH/6q3i6uMRoBwPVccyljeoJAmz7PZLJW4SG3BmKNkRucTlIRa+
         GuODkP0rm9UTg==
Received: from Eagle.se1.pen.gy (st43p00im-dlb-asmtp-mailmevip.me.com [17.42.251.41])
        by st43p00im-ztdg10063201.me.com (Postfix) with ESMTPSA id 35D00380F9D;
        Sat, 27 May 2023 13:03:36 +0000 (UTC)
From:   Foster Snowhill <forst@pen.gy>
To:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     Georgi Valkov <gvalkov@gmail.com>,
        Simon Horman <simon.horman@corigine.com>,
        Jan Kiszka <jan.kiszka@siemens.com>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH net-next v3 1/2] usbnet: ipheth: fix risk of NULL pointer deallocation
Date:   Sat, 27 May 2023 15:03:08 +0200
Message-Id: <20230527130309.34090-1-forst@pen.gy>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7ZEhPLPWOLib7xQPZgJOEGTCObwBdGsm
X-Proofpoint-GUID: 7ZEhPLPWOLib7xQPZgJOEGTCObwBdGsm
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.957,17.11.170.22.0000000_definitions?=
 =?UTF-8?Q?=3D2023-05-18=5F15:2020-02-14=5F02,2023-05-18=5F15,2023-02-09?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 spamscore=0
 clxscore=1030 malwarescore=0 mlxlogscore=523 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2305270113
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Georgi Valkov <gvalkov@gmail.com>

The cleanup precedure in ipheth_probe will attempt to free a
NULL pointer in dev->ctrl_buf if the memory allocation for
this buffer is not successful. While kfree ignores NULL pointers,
and the existing code is safe, it is a better design to rearrange
the goto labels and avoid this.

Signed-off-by: Georgi Valkov <gvalkov@gmail.com>
Signed-off-by: Foster Snowhill <forst@pen.gy>
---
v3:
  - Reword commit msg to indicate design improvement rather than bugfix
  - Add missing signoff for Foster Snowhill
  No code changes
v2: https://lore.kernel.org/netdev/20230525194255.4516-1-forst@pen.gy/
  - Factor out goto label change from v1 into this separate patch
v1: n/a
  Part of https://lore.kernel.org/netdev/20230516210127.35841-1-forst@pen.gy/
---
 drivers/net/usb/ipheth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/usb/ipheth.c b/drivers/net/usb/ipheth.c
index 6a769df0b..8875a3d0e 100644
--- a/drivers/net/usb/ipheth.c
+++ b/drivers/net/usb/ipheth.c
@@ -510,8 +510,8 @@ static int ipheth_probe(struct usb_interface *intf,
 	ipheth_free_urbs(dev);
 err_alloc_urbs:
 err_get_macaddr:
-err_alloc_ctrl_buf:
 	kfree(dev->ctrl_buf);
+err_alloc_ctrl_buf:
 err_endpoints:
 	free_netdev(netdev);
 	return retval;
-- 
2.40.1

