Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D127A619FEB
	for <lists+linux-usb@lfdr.de>; Fri,  4 Nov 2022 19:30:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232085AbiKDSa4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Nov 2022 14:30:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232081AbiKDSaz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Nov 2022 14:30:55 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 348863FB90
        for <linux-usb@vger.kernel.org>; Fri,  4 Nov 2022 11:30:55 -0700 (PDT)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A4GIEc1029292;
        Fri, 4 Nov 2022 11:30:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=date : message-id :
 from : subject : to : cc; s=pfptdkimsnps;
 bh=1784FG5WIYuldUCxP02q1+N6u2UfE0qLQCAV5XxMKk0=;
 b=sSDi+MCLJLVPTIuhtgKxV+WlFAlUsGXmsZRfcPlHVGAqnoQ22B104mttR0XpFyAoNOpa
 X9QYmBETG9oQeLorRDZChFNfjolA7INYeNyNLwfgN/TVns9vY+bOA2I8b/WatloZkdyr
 shk7pCkeD0P3WWn7HLJhsZZVR3d5jgbzDnRqJCiA5u4f7YXW5NGL/s3YdDCzOdrKiLz+
 J9WQE2dqDYlrUgww/Qx7GGcor9TDIjh4fHisR0uFvkgF/ZgZtsCfwfzPyBbtNvlaQbx+
 J8ByWwuWUP+YqAzqSZ5cmYmIyrLBWrcBb5K81xVt886bz/KztlkiSyaCM3fbXJamaeFm vA== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3kmq25mx4k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 04 Nov 2022 11:30:48 -0700
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EC5A8C00F3;
        Fri,  4 Nov 2022 18:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1667586647; bh=Qj7GzfRCYEPVd6dry+nA+rakY54QJN9ItJJS7txr8o0=;
        h=Date:From:Subject:To:Cc:From;
        b=fAO6fHslnhihC6tBIqe5QlQI/AYyZJoVGap5bzbqD74CtXS8R7Ln7geeyYE65bp8Y
         ORp2kgGHJaSdCdLtv7wuIu0RfHI6N6y0/jVr654aHwDGMVyeTLzeFK78pVI3a5qz3L
         Hg0KVtHWEFtB9or3vGbhJpKvyZrrcSoJ2yvFI+htpxli/hp1Owf4Us7OIs+C0mog59
         MD7jjJFNKvBPR2h8DfYNlVRsvbZVQHEXSxriIZ03QKG6bvGTZnWYngE/7HClWglcJa
         hOjWU4XdB7fMiEIXhiYPgNkNUPmoPvzU1APyfAOKfogO2Tjaue/rxG/3VvC3hsfKB0
         TzOjZ7CKP/NsQ==
Received: from te-lab16-v2 (nanobot.internal.synopsys.com [10.204.48.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 31781A0065;
        Fri,  4 Nov 2022 18:30:45 +0000 (UTC)
Received: by te-lab16-v2 (sSMTP sendmail emulation); Fri, 04 Nov 2022 11:30:44 -0700
Date:   Fri, 04 Nov 2022 11:30:44 -0700
Message-Id: <a5e0408867d422f12c31b282a1d95fd6dcb96651.1667586534.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH] usb: dwc3: gadget: Reduce TRB IOC settings
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
X-Proofpoint-GUID: Fe5agiclLZmZx-iDmvsDkzTwbm1tS2P_
X-Proofpoint-ORIG-GUID: Fe5agiclLZmZx-iDmvsDkzTwbm1tS2P_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-04_11,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 adultscore=0 mlxscore=0 phishscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=640 bulkscore=0 clxscore=1015 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211040116
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When the TRB ring is full, the dwc3 driver must make sure that there's
at least 1 TRB with Interrupt On Completion (IOC) set to notify of
available TRBs.

The current logic just sets the TRB's IOC whenever we run out of TRBs,
but it doesn't consider that there may be other TRBs with IOC/LST set
already. This creates more events and unnecessary delay from interrupt
handling. Set must_interrupt when we run out of TRBs and all the TRBs in
the TRB ring belong to the same request.

Note: if the gadget driver keeps queuing requests with more than the
DWC3_NUM_TRBS, it prevents the controller from caching new TRBs as
often, affecting performance. However, that's a separate issue that
needs a separate driver enhancement. Regardless, currently no gadget
driver setups a request with more than DWC3_NUM_TRBS.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 5fe2d136dff5..095edcc28f23 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1461,9 +1461,10 @@ static int dwc3_prepare_trbs_sg(struct dwc3_ep *dep,
 			 * resume preparing the next SG entry when more TRBs are
 			 * free.
 			 */
-			if (num_trbs_left == 1 || (needs_extra_trb &&
-					num_trbs_left <= 2 &&
-					sg_dma_len(sg_next(s)) >= length))
+			if (next_request(&dep->started_list) == req &&
+			    (num_trbs_left == 1 ||
+			     (needs_extra_trb && num_trbs_left <= 2 &&
+			      sg_dma_len(sg_next(s)) >= length)))
 				must_interrupt = true;
 
 			dwc3_prepare_one_trb(dep, req, trb_length, 1, i, false,

base-commit: a8bc8cc193c69e41df5e757d1a592346526e136d
-- 
2.28.0

