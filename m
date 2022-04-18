Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A32BC505EEB
	for <lists+linux-usb@lfdr.de>; Mon, 18 Apr 2022 22:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238680AbiDRUgn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Apr 2022 16:36:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238619AbiDRUgn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Apr 2022 16:36:43 -0400
Received: from mxout02.lancloud.ru (mxout02.lancloud.ru [45.84.86.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC60630576
        for <linux-usb@vger.kernel.org>; Mon, 18 Apr 2022 13:33:59 -0700 (PDT)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 846A522F7968
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH] usb: core: devices: remove dead code under #ifdef PROC_EXTRA
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
Organization: Open Mobile Platform
Message-ID: <ec08915b-faf2-2f0b-dfb1-048dfa2c67f3@omp.ru>
Date:   Mon, 18 Apr 2022 23:33:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

usb_dump_hub_descriptor() and usb_dump_string() are defined under #ifdef
PROC_EXTRA (while PROC_EXTRA doesn't seem to have ever been #define'd)
since the dawn of the git era -- remove this dead code at last...

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
This patch is against the 'usb-next' branch of Greg KH's 'usb.git' repo.

 drivers/usb/core/devices.c |   35 -----------------------------------
 1 file changed, 35 deletions(-)

Index: usb/drivers/usb/core/devices.c
===================================================================
--- usb.orig/drivers/usb/core/devices.c
+++ usb/drivers/usb/core/devices.c
@@ -390,41 +390,6 @@ static char *usb_dump_desc(char *start,
 	return start;
 }
 
-
-#ifdef PROC_EXTRA /* TBD: may want to add this code later */
-
-static char *usb_dump_hub_descriptor(char *start, char *end,
-				     const struct usb_hub_descriptor *desc)
-{
-	int leng = USB_DT_HUB_NONVAR_SIZE;
-	unsigned char *ptr = (unsigned char *)desc;
-
-	if (start > end)
-		return start;
-	start += sprintf(start, "Interface:");
-	while (leng && start <= end) {
-		start += sprintf(start, " %02x", *ptr);
-		ptr++; leng--;
-	}
-	*start++ = '\n';
-	return start;
-}
-
-static char *usb_dump_string(char *start, char *end,
-			     const struct usb_device *dev, char *id, int index)
-{
-	if (start > end)
-		return start;
-	start += sprintf(start, "Interface:");
-	if (index <= dev->maxstring && dev->stringindex &&
-	    dev->stringindex[index])
-		start += sprintf(start, "%s: %.100s ", id,
-				 dev->stringindex[index]);
-	return start;
-}
-
-#endif /* PROC_EXTRA */
-
 /*****************************************************************/
 
 /* This is a recursive function. Parameters:
