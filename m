Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2521E6F11F1
	for <lists+linux-usb@lfdr.de>; Fri, 28 Apr 2023 08:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345389AbjD1Gtj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Apr 2023 02:49:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345341AbjD1Gti (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Apr 2023 02:49:38 -0400
Received: from www484.your-server.de (www484.your-server.de [78.47.237.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C845B30E8;
        Thu, 27 Apr 2023 23:49:34 -0700 (PDT)
Received: from sslproxy03.your-server.de ([88.198.220.132])
        by www484.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <k.graefe@gateware.de>)
        id 1psHv7-000KXf-R2; Fri, 28 Apr 2023 08:49:29 +0200
Received: from [2003:ca:6730:e8f8:9fd6:4f62:9dbd:374f] (helo=tethys.gateware.dom)
        by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <k.graefe@gateware.de>)
        id 1psHv7-0005zg-3u; Fri, 28 Apr 2023 08:49:29 +0200
From:   =?UTF-8?q?Konrad=20Gr=C3=A4fe?= <k.graefe@gateware.de>
To:     Quentin Schulz <quentin.schulz@theobroma-systems.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     =?UTF-8?q?Konrad=20Gr=C3=A4fe?= <k.graefe@gateware.de>,
        stable@vger.kernel.org
Subject: [PATCH v4 2/2] usb: gadget: u_ether: Fix host MAC address case
Date:   Fri, 28 Apr 2023 08:49:05 +0200
Message-Id: <20230428064905.145858-2-k.graefe@gateware.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230428064905.145858-1-k.graefe@gateware.de>
References: <20230427115120.241954-2-k.graefe@gateware.de>
 <20230428064905.145858-1-k.graefe@gateware.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: k.graefe@gateware.de
X-Virus-Scanned: Clear (ClamAV 0.103.8/26889/Thu Apr 27 09:25:48 2023)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The CDC-ECM specification [1] requires to send the host MAC address as
an uppercase hexadecimal string in chapter "5.4 Ethernet Networking
Functional Descriptor":
    The Unicode character is chosen from the set of values 30h through
    39h and 41h through 46h (0-9 and A-F).

However, snprintf(.., "%pm", ..) generates a lowercase MAC address
string. While most host drivers are tolerant to this, UsbNcm.sys on
Windows 10 is not. Instead it uses a different MAC address with all
bytes set to zero including and after the first byte containing a
lowercase letter. On Windows 11 Microsoft fixed it, but apparently they
did not backport the fix.

This change fixes the issue by using "%pmU" to generate an uppercase hex
string to comply with the specification.

[1]: https://www.usb.org/document-library/class-definitions-communication-devices-12, file ECM120.pdf

Fixes: bcd4a1c40bee ("usb: gadget: u_ether: construct with default values and add setters/getters")
Cc: stable@vger.kernel.org
Signed-off-by: Konrad Gräfe <k.graefe@gateware.de>
---

Changes since v3: None

Changes since v2:
* Add uppercase MAC address format string and use that instead of
  manually uppercasing the resulting MAC address string.

Changes since v1:
* Fixed checkpatch.pl warnings

 drivers/usb/gadget/function/u_ether.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
index 6956ad8ba8dd..70e6b825654c 100644
--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -963,7 +963,7 @@ int gether_get_host_addr_cdc(struct net_device *net, char *host_addr, int len)
 		return -EINVAL;
 
 	dev = netdev_priv(net);
-	snprintf(host_addr, len, "%pm", dev->host_mac);
+	snprintf(host_addr, len, "%pmU", dev->host_mac);
 
 	return strlen(host_addr);
 }
-- 
2.34.1

