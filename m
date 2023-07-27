Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D46AF76502E
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jul 2023 11:47:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233293AbjG0JrE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jul 2023 05:47:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233277AbjG0Jqz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Jul 2023 05:46:55 -0400
Received: from clamta01.bpe.bigpond.com (clamta01.bpe.bigpond.com [203.42.22.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EB69BF;
        Thu, 27 Jul 2023 02:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bigpond.com
        ; s=202303; h=Content-Type:MIME-Version:Date:Message-ID:To:Subject:From;
        bh=7Tn6Qbwis+gUfMa7OdP8CE9Ab2YJ6cKEtbqwYs1q/BA=; b=f38hYtqeLY1i1k6v8tF60LP3mH
        D4yAwig8vt3WOL71oZPs4QKjFjv9JcWW0YmPgtSWM5HcG6xZfcYQYLX1S05JKZS25v2lhr6ja5PV1
        nGErHtus/LcS/nW6X52XKsUmz7KKzxDAngY607s7L0fupw20gDOONp6RfXunr8YT4np2ptwc8Ei7B
        +V7khFouYEVutdWw61bzXNL6sRw+ssk70203umz762+Qhaw77xNg9ob6UbEgPUAFboGK2+G7dmLvZ
        L8QFA6oo0a2cTr7MFVKQ1iXhofhRHsk+2PodjT6Jhn9xKXeQ4ENpj5JoxQuYR1/EdzvkUj7p2VgBE
        hcv5BWIg==;
Received: from claprdcmr03
         by claprdomr01 with esmtp
         (envelope-from <bids.7405@bigpond.com>)
         id 1qOxa2-000EkM-1k
         for ;
        Thu, 27 Jul 2023 19:46:46 +1000
Received: from [101.191.138.223] (helo=[10.0.0.38])
         by claprdcmr03 with esmtpa
        (envelope-from <bids.7405@bigpond.com>)
        id 1qOxa2-0001ZO-1K;
        Thu, 27 Jul 2023 19:46:46 +1000
From:   Ross Maynard <bids.7405@bigpond.com>
Subject: [PATCH] USB: zaurus: Add ID for A-300/B-500/C-700
To:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Message-ID: <8b15ff2c-baaa-eb73-5fc9-b77ba6482bd5@bigpond.com>
Date:   Thu, 27 Jul 2023 19:46:44 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-tce-id: bids.7405@bigpond.com
X-tce-ares-id: e{9e428940-842d-48c4-bdaf-1ac8a75c08d5}1
X-tce-spam-action: no action
X-tce-spam-score: 0.0
X-Cm-Analysis: v=2.4 cv=d7kzizvE c=1 sm=1 tr=0 ts=64c23d06 a=I+ymoOSk5yzZBOYXmf4WnA==:117 a=I+ymoOSk5yzZBOYXmf4WnA==:17 a=IkcTkHD0fZMA:10 a=ws7JD89P4LkA:10 a=1IlZJK9HAAAA:8 a=VwQbUJbxAAAA:8 a=zblBDeNr1pAM3S_0FrwA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
X-Cm-Envelope: MS4xfD++0fbhqPmCaByK6ZErpp9XSIEwzWSasb89n3rsACHfYOugD2m1VWBSv8FTaJwlrw4Vrye56cXz9sZTJzjJS2ULklDr01wTUKVhqgygFSkGlMFvJiVY cujFA6SiulXFel0bnRqqDkyg2YHr56eE9621Lje6aIvAO7dpXfz+krKQFFOwU5CUeQFn1uzltWBsZA==
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The SL-A300, B500/5600, and C700 devices no longer auto-load because of
"usbnet: Remove over-broad module alias from zaurus."
This patch adds IDs for those 3 devices.

Reported-by: Ross Maynard <bids.7405@bigpond.com>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=217632
Fixes: 16adf5d07987 ("usbnet: Remove over-broad module alias from zaurus.")
Signed-off-by: Ross Maynard <bids.7405@bigpond.com>
---
 drivers/net/usb/cdc_ether.c | 21 +++++++++++++++++++++
 drivers/net/usb/zaurus.c    | 21 +++++++++++++++++++++
 2 files changed, 42 insertions(+)

--- a/drivers/net/usb/cdc_ether.c
+++ b/drivers/net/usb/cdc_ether.c
@@ -616,6 +616,13 @@ static const struct usb_device_id	products[] = {
 }, {
 	.match_flags	=   USB_DEVICE_ID_MATCH_INT_INFO
 			  | USB_DEVICE_ID_MATCH_DEVICE,
+	.idVendor		= 0x04DD,
+	.idProduct		= 0x8005,   /* A-300 */
+	ZAURUS_FAKE_INTERFACE,
+	.driver_info        = 0,
+}, {
+	.match_flags    =   USB_DEVICE_ID_MATCH_INT_INFO
+			  | USB_DEVICE_ID_MATCH_DEVICE,
 	.idVendor		= 0x04DD,
 	.idProduct		= 0x8006,	/* B-500/SL-5600 */
 	ZAURUS_MASTER_INTERFACE,
@@ -623,12 +630,26 @@ static const struct usb_device_id	products[] = {
 }, {
 	.match_flags    =   USB_DEVICE_ID_MATCH_INT_INFO
 			  | USB_DEVICE_ID_MATCH_DEVICE,
+	.idVendor		= 0x04DD,
+	.idProduct		= 0x8006,   /* B-500/SL-5600 */
+	ZAURUS_FAKE_INTERFACE,
+	.driver_info        = 0,
+}, {
+	.match_flags    =   USB_DEVICE_ID_MATCH_INT_INFO
+			  | USB_DEVICE_ID_MATCH_DEVICE,
 	.idVendor		= 0x04DD,
 	.idProduct		= 0x8007,	/* C-700 */
 	ZAURUS_MASTER_INTERFACE,
 	.driver_info		= 0,
 }, {
 	.match_flags    =   USB_DEVICE_ID_MATCH_INT_INFO
+			  | USB_DEVICE_ID_MATCH_DEVICE,
+	.idVendor		= 0x04DD,
+	.idProduct		= 0x8007,   /* C-700 */
+	ZAURUS_FAKE_INTERFACE,
+	.driver_info        = 0,
+}, {
+	.match_flags    =   USB_DEVICE_ID_MATCH_INT_INFO
 		 | USB_DEVICE_ID_MATCH_DEVICE,
 	.idVendor               = 0x04DD,
 	.idProduct              = 0x9031,	/* C-750 C-760 */
--- a/drivers/net/usb/zaurus.c
+++ b/drivers/net/usb/zaurus.c
@@ -289,9 +289,23 @@ static const struct usb_device_id	products [] = {
 	.match_flags	=   USB_DEVICE_ID_MATCH_INT_INFO
 			  | USB_DEVICE_ID_MATCH_DEVICE,
 	.idVendor		= 0x04DD,
+	.idProduct		= 0x8005,	/* A-300 */
+	ZAURUS_FAKE_INTERFACE,
+	.driver_info = (unsigned long)&bogus_mdlm_info,
+}, {
+	.match_flags    =   USB_DEVICE_ID_MATCH_INT_INFO
+			  | USB_DEVICE_ID_MATCH_DEVICE,
+	.idVendor		= 0x04DD,
 	.idProduct		= 0x8006,	/* B-500/SL-5600 */
 	ZAURUS_MASTER_INTERFACE,
 	.driver_info = ZAURUS_PXA_INFO,
+}, {
+	.match_flags    =   USB_DEVICE_ID_MATCH_INT_INFO
+			  | USB_DEVICE_ID_MATCH_DEVICE,
+	.idVendor		= 0x04DD,
+	.idProduct		= 0x8006,	/* B-500/SL-5600 */
+	ZAURUS_FAKE_INTERFACE,
+	.driver_info = (unsigned long)&bogus_mdlm_info,
 }, {
 	.match_flags    =   USB_DEVICE_ID_MATCH_INT_INFO
 	          | USB_DEVICE_ID_MATCH_DEVICE,
@@ -301,6 +315,13 @@ static const struct usb_device_id	products [] = {
 	.driver_info = ZAURUS_PXA_INFO,
 }, {
 	.match_flags    =   USB_DEVICE_ID_MATCH_INT_INFO
+			  | USB_DEVICE_ID_MATCH_DEVICE,
+	.idVendor		= 0x04DD,
+	.idProduct		= 0x8007,	/* C-700 */
+	ZAURUS_FAKE_INTERFACE,
+	.driver_info = (unsigned long)&bogus_mdlm_info,
+}, {
+	.match_flags    =   USB_DEVICE_ID_MATCH_INT_INFO
 		 | USB_DEVICE_ID_MATCH_DEVICE,
 	.idVendor               = 0x04DD,
 	.idProduct              = 0x9031,	/* C-750 C-760 */
