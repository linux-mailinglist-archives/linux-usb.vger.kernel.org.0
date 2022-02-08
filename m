Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90EF74AE44F
	for <lists+linux-usb@lfdr.de>; Tue,  8 Feb 2022 23:30:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241960AbiBHWYM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Feb 2022 17:24:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386435AbiBHUcg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Feb 2022 15:32:36 -0500
Received: from mxout04.lancloud.ru (mxout04.lancloud.ru [45.84.86.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8786DC0613CB
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 12:32:32 -0800 (PST)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 5845020AD36D
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
To:     Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH] usb: common: usb-otg-fsm: drop unreachable code in
 otg_statemachine()
Organization: Open Mobile Platform
Message-ID: <5c923258-67c3-bae1-80d1-87a187202a4c@omp.ru>
Date:   Tue, 8 Feb 2022 23:32:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The *switch* statement in otg_statemachine() does handle all possible OTG
states explicitly, so the *default* label is unreachable.

Found by Linux Verification Center (linuxtesting.org) with the SVACE static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
This patch is against the 'usb-next' branch of Greg KH's 'usb.git' repo.
Peter Chen's 'usb.git' repo seems outdated, so I chose to ignore it...

 drivers/usb/common/usb-otg-fsm.c |    2 --
 1 file changed, 2 deletions(-)

Index: usb/drivers/usb/common/usb-otg-fsm.c
===================================================================
--- usb.orig/drivers/usb/common/usb-otg-fsm.c
+++ usb/drivers/usb/common/usb-otg-fsm.c
@@ -440,8 +440,6 @@ int otg_statemachine(struct otg_fsm *fsm
 		if (fsm->id || fsm->a_bus_drop || fsm->a_clr_err)
 			otg_set_state(fsm, OTG_STATE_A_WAIT_VFALL);
 		break;
-	default:
-		break;
 	}
 	mutex_unlock(&fsm->lock);
 
