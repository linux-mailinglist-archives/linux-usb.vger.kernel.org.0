Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9227117B9
	for <lists+linux-usb@lfdr.de>; Thu, 25 May 2023 21:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235261AbjEYTzA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 May 2023 15:55:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242278AbjEYTy5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 May 2023 15:54:57 -0400
Received: from st43p00im-ztfb10063301.me.com (st43p00im-ztfb10063301.me.com [17.58.63.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F7961BD
        for <linux-usb@vger.kernel.org>; Thu, 25 May 2023 12:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pen.gy; s=sig1;
        t=1685043805; bh=7qTQoFvIqowISFG0SsZjr8VVFkKEqUXMz8EjBTX/N9s=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=SJJ4ZJDQTYYGTcl/HoWkVi8tnsrisCEUmSq3u6Vz/z5aAqebXX3mxopFTeOW1wxvm
         584lWPyZpiHTgWedvuVQyR41mVXu5wMkkIhLsuOYoiLWosodYNFZzJU+Y3R/QYeb9N
         FdVmiG8ycUhzDQQX1Epd0vXid6/vGnFtNp/ySPHG8VbTe/soRmo8AmxuGIyhkCe8uV
         nd09ylETMlNW0dum/YSUqAck4iWOAvKZX4BxhVDpG1MCpFHtMdcDm3rCLlJmc0Xy8a
         1VoF037xMjRQgqdcyvtAG9oz+KlN8Lp9objirCDFYZllp/5fuloRGTnIrdI630tZST
         UOQc3ZkbzVG2w==
Received: from Eagle.se1.pen.gy (st43p00im-dlb-asmtp-mailmevip.me.com [17.42.251.41])
        by st43p00im-ztfb10063301.me.com (Postfix) with ESMTPSA id AF0CE700477;
        Thu, 25 May 2023 19:43:23 +0000 (UTC)
From:   Foster Snowhill <forst@pen.gy>
To:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     Georgi Valkov <gvalkov@gmail.com>,
        Simon Horman <simon.horman@corigine.com>,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH net-next v2 1/2] usbnet: ipheth: fix risk of NULL pointer deallocation
Date:   Thu, 25 May 2023 21:42:54 +0200
Message-Id: <20230525194255.4516-1-forst@pen.gy>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3hI-HWMBjo6aieRqhnIrucz4KdKH5qNX
X-Proofpoint-GUID: 3hI-HWMBjo6aieRqhnIrucz4KdKH5qNX
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.573,18.0.957,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2023-05-18=5F15:2023-05-17=5F02,2023-05-18=5F15,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 mlxscore=0 spamscore=0 adultscore=0 clxscore=1030 malwarescore=0
 mlxlogscore=590 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2305250166
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Georgi Valkov <gvalkov@gmail.com>

The cleanup precedure in ipheth_probe will attempt to free a
NULL pointer in dev->ctrl_buf if the memory allocation for
this buffer is not successful. Rearrange the goto labels to
avoid this risk.

Signed-off-by: Georgi Valkov <gvalkov@gmail.com>
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

