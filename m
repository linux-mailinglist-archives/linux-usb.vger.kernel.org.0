Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF61C62396A
	for <lists+linux-usb@lfdr.de>; Thu, 10 Nov 2022 03:02:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232417AbiKJCCX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Nov 2022 21:02:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232527AbiKJCAn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Nov 2022 21:00:43 -0500
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D80429CAB
        for <linux-usb@vger.kernel.org>; Wed,  9 Nov 2022 17:59:05 -0800 (PST)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A9MhC1P032550;
        Wed, 9 Nov 2022 17:58:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=date : message-id :
 from : subject : to : cc; s=pfptdkimsnps;
 bh=vIgCN0oNyFI270z/Mwpkt+n18yBYbwqWj3IpZdx3lG0=;
 b=Pii0QrX//Cs6pc/xZrygO4XOLcDW71sCbLf4ZiPxXHL5kcLe+KfkqUp/KurVYq3crt6r
 ajCoS+jU7ZJzdXTQ1P9FFGVBPzQoDBBpgyn2yaQ3nA1Nij0RCtCMz01F7SwMFOLtIxZg
 e2RmTZyVmXYwzlGYx9bGsiJNCIZRYzxhnmgD931T/XAiAHINduVyLOEReurJfFjUxq8M
 HkcxzBKZo0/KGUx6rvSBxWoU4j7MjLjrvyukn3gVRRkdO2ev8vikBIjj+qMHL+7a2xkI
 t8GLY4sy6gbTsL1mM3LeueL9KGTJpBeBRzJL2sKMsyBjYj5fj/gygiC7IPqiLJ+rFf9w qg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3knq35spd5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Nov 2022 17:58:53 -0800
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B3236C00F2;
        Thu, 10 Nov 2022 01:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1668045533; bh=AoEoEa6uFwJm78Uf0fVQjicfHGpQdCufgcaskiCetak=;
        h=Date:From:Subject:To:Cc:From;
        b=k9KU+xfr/5NvzY7w6RCQm2ll2WfKR7BWMNuawdLRCXOdWPcB/Lf/qXpfRZkez5nZ/
         zhOlC4tpRUK7iyZy88cQVsL+SGHue0agEhrMzYPVXailx27BcsvwzaDGCkJ3JmlziV
         U3ZMg4Kq+xojCTkBMmDTBC9B+pasLt3g5+KTxGvVK0d4bHkGOjNE5M5CnCYJMoFvph
         ha24w6jQtwXaHLKKyiKXlhi8wBQfM7kFv2IZ0i50U8n5ljNOyFepFOvXfVDcQJq3+5
         nWC9WCYd371BjOQtWsYJKHfWW+RV5Nk8vX18N6lqyRKMPeCslFrBDBYoYXw3axdvjl
         J1WJWnYiS9otw==
Received: from te-lab16-v2 (nanobot.internal.synopsys.com [10.204.48.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 18E2AA006F;
        Thu, 10 Nov 2022 01:58:50 +0000 (UTC)
Received: by te-lab16-v2 (sSMTP sendmail emulation); Wed, 09 Nov 2022 17:58:50 -0800
Date:   Wed, 09 Nov 2022 17:58:50 -0800
Message-Id: <5651117207803c26e2f22ddf4e5ce9e865dcf7c7.1668045468.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH] usb: dwc3: gadget: Disable GUSB2PHYCFG.SUSPHY for End Transfer
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
X-Proofpoint-ORIG-GUID: jvjq9bpbdm63bYxBlmohsBiwz3p7DBQE
X-Proofpoint-GUID: jvjq9bpbdm63bYxBlmohsBiwz3p7DBQE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-09_06,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 phishscore=0 impostorscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=332 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211100013
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If there's a disconnection while operating in eSS, there may be a delay
in VBUS drop response from the connector. In that case, the internal
link state may drop to operate in usb2 speed while the controller thinks
the VBUS is still high. The driver must make sure to disable
GUSB2PHYCFG.SUSPHY when sending endpoint command while in usb2 speed.
The End Transfer command may be called, and only that command needs to
go through at this point. Let's keep it simple and unconditionally
disable GUSB2PHYCFG.SUSPHY whenever we issue the command.

This scenario is not seen in real hardware. In a rare case, our
prototype type-c controller/interface may have a slow response
triggerring this issue.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index ecddb144871b..7f4ba78f2644 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -291,7 +291,8 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned int cmd,
 	 *
 	 * DWC_usb3 3.30a and DWC_usb31 1.90a programming guide section 3.2.2
 	 */
-	if (dwc->gadget->speed <= USB_SPEED_HIGH) {
+	if (dwc->gadget->speed <= USB_SPEED_HIGH ||
+	    DWC3_DEPCMD_CMD(cmd) == DWC3_DEPCMD_ENDTRANSFER) {
 		reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0));
 		if (unlikely(reg & DWC3_GUSB2PHYCFG_SUSPHY)) {
 			saved_config |= DWC3_GUSB2PHYCFG_SUSPHY;

base-commit: d65e6b6e884a38360fc1cadf8ff31858151da57f
-- 
2.28.0

