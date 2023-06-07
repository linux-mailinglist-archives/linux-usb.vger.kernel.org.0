Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47479726250
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jun 2023 16:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240869AbjFGOIK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Jun 2023 10:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235770AbjFGOH4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Jun 2023 10:07:56 -0400
Received: from qs51p00im-qukt01071502.me.com (qs51p00im-qukt01071502.me.com [17.57.155.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BEA42693
        for <linux-usb@vger.kernel.org>; Wed,  7 Jun 2023 07:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pen.gy; s=sig1;
        t=1686146271; bh=WH4UOMGuaBmvgJW4vrRLk/Li3o9mJBIOoSyjNRAIx0M=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=H2na3Y8cfOjzYfmG6gcNvLMSrtQHCGdFVX5KVpc+C/sTovwybYiuz63GJAvzphhl2
         XT6D2zwoHhyTinJ3Uz3nv3YHHHT426hUuIiYSRm1qTzY0YbzUpWxGLCE4XwLRlsyhz
         ZXPVBkMxQhS7gSaC7nTvY6vwtRLUNlrwhaYDMabh8tNWjbSGMZFCx7NAEvP6gYvT8g
         EXu9o5Zie5tBHvnn+G/CRxefN/IA/fov008fRvUR2p1DBcirlYustSh9psHuBvgGO3
         9AzbQMRZLBdq1MtWvLKuYZonFtH1HYv4QHtqDAI/mGJGm9NlLM94VLYBaXQFrxj6yG
         zXBszpCxxIV8A==
Received: from fossa.iopsys.eu (qs51p00im-dlb-asmtp-mailmevip.me.com [17.57.155.28])
        by qs51p00im-qukt01071502.me.com (Postfix) with ESMTPSA id 1E98B66803F3;
        Wed,  7 Jun 2023 13:57:48 +0000 (UTC)
From:   Foster Snowhill <forst@pen.gy>
To:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     Georgi Valkov <gvalkov@gmail.com>,
        Simon Horman <simon.horman@corigine.com>,
        Jan Kiszka <jan.kiszka@siemens.com>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH net-next v4 4/4] usbnet: ipheth: update Kconfig description
Date:   Wed,  7 Jun 2023 15:57:02 +0200
Message-Id: <20230607135702.32679-4-forst@pen.gy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230607135702.32679-1-forst@pen.gy>
References: <20230607135702.32679-1-forst@pen.gy>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: te8fs2XClFkTHjm9KHtE2AbGV3RREIzr
X-Proofpoint-GUID: te8fs2XClFkTHjm9KHtE2AbGV3RREIzr
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.790,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-12=5F02:2020-02-14=5F02,2022-01-12=5F02,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=1 adultscore=0 phishscore=0 spamscore=1
 clxscore=1030 suspectscore=0 malwarescore=0 mlxlogscore=228 mlxscore=1
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2306070117
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

This module has for a long time not been limited to iPhone <= 3GS.
Update description to match the actual state of the driver.

Remove dead link from 2010, instead reference an existing userspace
iOS device pairing implementation as part of libimobiledevice.

Signed-off-by: Foster Snowhill <forst@pen.gy>
---
v4:
  Change added in v4.
v3: n/a
v2: n/a
v1: n/a
---
 drivers/net/usb/Kconfig | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/net/usb/Kconfig b/drivers/net/usb/Kconfig
index 4402eedb3..3fd7dccf0 100644
--- a/drivers/net/usb/Kconfig
+++ b/drivers/net/usb/Kconfig
@@ -583,12 +583,10 @@ config USB_IPHETH
 	default n
 	help
 	  Module used to share Internet connection (tethering) from your
-	  iPhone (Original, 3G and 3GS) to your system.
-	  Note that you need userspace libraries and programs that are needed
-	  to pair your device with your system and that understand the iPhone
-	  protocol.
-
-	  For more information: http://giagio.com/wiki/moin.cgi/iPhoneEthernetDriver
+	  iPhone to your system.
+	  Note that you need a corresponding userspace library/program
+	  to pair your device with your system, for example usbmuxd
+	  <https://github.com/libimobiledevice/usbmuxd>.
 
 config USB_SIERRA_NET
 	tristate "USB-to-WWAN Driver for Sierra Wireless modems"
-- 
2.40.1

