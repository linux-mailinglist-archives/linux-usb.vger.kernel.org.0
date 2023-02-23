Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D917C6A0357
	for <lists+linux-usb@lfdr.de>; Thu, 23 Feb 2023 08:39:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232305AbjBWHjp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Feb 2023 02:39:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjBWHjo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Feb 2023 02:39:44 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E4E63B87B
        for <linux-usb@vger.kernel.org>; Wed, 22 Feb 2023 23:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1677137983; x=1708673983;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=c9wjmui+xbUX+JYVLVzL5c0eaH4OvKYPCGaUUkkTLZE=;
  b=fgIL3kh5QrcgaRySy3QMDDK0pqdT4YDRhBc/+jJL4SJL7lWGIyi1VRCA
   mbuz4jL4f5q+bIXbEsxadTgp1NOHgLfq/ifvurytKO99VT/Zq4c9X9u6B
   WCokL1426200g2N+MUM9U+HR1tZdWt2nzqhDlIM9AwMD5ulRLp7GNJ6n3
   /Lz1XgwzIyFMtjUT34W/h/r8AkcymJ8s5fKPpTvDW8jEXC7BNE3aJBqGP
   Rl27RC0+Ysx5UwLseKvao36ao63PFn13La8q82UlBA2E+oA+q6BfMKa8G
   YPUyuvDsZbGIJzUMNsqaIY0WGCzwepuxMggGjgAAnZ3yth83dqMF0ZB5w
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,320,1669071600"; 
   d="scan'208";a="29262289"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 23 Feb 2023 08:39:41 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 23 Feb 2023 08:39:41 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 23 Feb 2023 08:39:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1677137981; x=1708673981;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=c9wjmui+xbUX+JYVLVzL5c0eaH4OvKYPCGaUUkkTLZE=;
  b=m/BiTPz4Mws+Gv9YPhm2Pzd9Rjz6fBsBWN0XQbtVu8tM4ScJc7NBjmP5
   rwDOR5fFIEmMFXBJmpixISs4hZxkLIu+jIzbV4Mqx2UtCB+THu9XsjmN2
   s6ol9l9jrAJ7Xlmmc2gUwAsDdnDkibloGjastNP+ZjNI25QON2ugtQXyb
   xTh3/cbasQLIDY/Qt+2ijD/ggG0WVDmiNS+8OZzQUZt0Hd40RbN7p6IoP
   oBwD+TcuIRFms69ORQpdxDV7Ex+KAQhlygEY2lx65A8L8DoNn+chlvzEO
   +tI4Rek9cj4z2MpCKfOb28O9wPrBPQ5gXz+h1QlOSNpzdlvA3NRx8+aon
   g==;
X-IronPort-AV: E=Sophos;i="5.97,320,1669071600"; 
   d="scan'208";a="29262288"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 23 Feb 2023 08:39:41 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id DC85A280056;
        Thu, 23 Feb 2023 08:39:40 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Anand Moon <linux.amoon@gmail.com>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Icenowy Zheng <uwu@icenowy.me>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 1/1] usb: misc: onboard-hub: add support for Microchip USB2517 USB 2.0 hub
Date:   Thu, 23 Feb 2023 08:39:20 +0100
Message-Id: <20230223073920.2912298-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add support for Microchip USB2517 USB 2.0 hub to the onboard usb hub
driver. Adopt the generic usb-device compatible ("usbVID,PID").
This hub has the same reset timings as USB2514, so reuse that one.
There is also an USB2517I which just has industrial temperature range.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/usb/misc/onboard_usb_hub.c | 1 +
 drivers/usb/misc/onboard_usb_hub.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
index 5402e4b7267b..12fc6eb67c3b 100644
--- a/drivers/usb/misc/onboard_usb_hub.c
+++ b/drivers/usb/misc/onboard_usb_hub.c
@@ -410,6 +410,7 @@ static const struct usb_device_id onboard_hub_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0608) }, /* Genesys Logic GL850G USB 2.0 */
 	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0610) }, /* Genesys Logic GL852G USB 2.0 */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2514) }, /* USB2514B USB 2.0 */
+	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2517) }, /* USB2517 USB 2.0 */
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0411) }, /* RTS5411 USB 3.1 */
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5411) }, /* RTS5411 USB 2.1 */
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0414) }, /* RTS5414 USB 3.2 */
diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
index 0a943a154649..aca5f50eb0da 100644
--- a/drivers/usb/misc/onboard_usb_hub.h
+++ b/drivers/usb/misc/onboard_usb_hub.h
@@ -36,6 +36,7 @@ static const struct onboard_hub_pdata vialab_vl817_data = {
 
 static const struct of_device_id onboard_hub_match[] = {
 	{ .compatible = "usb424,2514", .data = &microchip_usb424_data, },
+	{ .compatible = "usb424,2517", .data = &microchip_usb424_data, },
 	{ .compatible = "usb451,8140", .data = &ti_tusb8041_data, },
 	{ .compatible = "usb451,8142", .data = &ti_tusb8041_data, },
 	{ .compatible = "usb5e3,608", .data = &genesys_gl850g_data, },
-- 
2.34.1

