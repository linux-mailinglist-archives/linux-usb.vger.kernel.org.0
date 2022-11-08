Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7CCB6204B8
	for <lists+linux-usb@lfdr.de>; Tue,  8 Nov 2022 01:38:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233000AbiKHAiM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Nov 2022 19:38:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231796AbiKHAiL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Nov 2022 19:38:11 -0500
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FD4720BC6
        for <linux-usb@vger.kernel.org>; Mon,  7 Nov 2022 16:38:10 -0800 (PST)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A7KLBul016175;
        Mon, 7 Nov 2022 16:37:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=date : message-id :
 from : subject : to : cc; s=pfptdkimsnps;
 bh=c1ELMByHLYe9UHOKo/rYhS29dz0prjte9XBrRFji20w=;
 b=Aq30hJwi0xc9GnmdWfaE9uiO6ZFd2fvTOu7lBItbFQkB0DaMZx4E45sjJ5gWjs/aMVvc
 cJgivPxBnOv19TKT6h/9kyzoSIcEH7HuPR69OEcwwW+Y0+NZPBiPGJBy8rPF3iJUdGlU
 bJDA9RIvyATWteri3439/hohqs7QXORBMuRI6xawi4WhUjFamaUOjq7YYYHMhWe6VJNV
 CvOHLeDl85sKEas4zyIAng6OfxP+t78i00DG8w3hFlX5EFKdAkVLmHUJ/Vvcp8LXP3+v
 sZmM1SI5X5PNjtuFfk+Ly5pDTptJQXnN9WOJEUzjv3IkeGU6Nj/5fJDHXC9F9UwMlVw0 WA== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3knq35bae7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 07 Nov 2022 16:37:59 -0800
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 52272C0101;
        Tue,  8 Nov 2022 00:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1667867878; bh=YEstGtJaiMfUotSgYQyrIsmqOTJeln7nQVritENNNrQ=;
        h=Date:From:Subject:To:Cc:From;
        b=LLkaHIEDffIPMZDEi5XLK3vQoh2h1lyMc+S0T5dTSy0MwUwzRvrfLEu7iSkG/eKLp
         1zX1mua4jMg6YMwKI/khaFe6AZN2VTUMuzGZ968WDE74J0gXm5L/VcquPNGcrEEwfk
         IqVSTfX97OAeUklXNzSc5LOeyovoVXjapvy7v1WhCmf/04tXdY/77/v/fIN47vZhN5
         bllgV7aUZ0xlhNowvafb8NaWPjIcanM3HoaT0KDjsnHfoFHj5GaytNBHVwKf3TYqOF
         b95kRoeR8hCwB/x2239DwRURWqrgTQq3S09sYiZJF4ICs1dtqFrtSA+wlOrKtb+HWG
         ow6zDBgziTj7A==
Received: from te-lab16-v2 (nanobot.internal.synopsys.com [10.204.48.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 83E26A0080;
        Tue,  8 Nov 2022 00:37:56 +0000 (UTC)
Received: by te-lab16-v2 (sSMTP sendmail emulation); Mon, 07 Nov 2022 16:37:55 -0800
Date:   Mon, 07 Nov 2022 16:37:55 -0800
Message-Id: <72a1fa448eb1201b152e65be7902a5d1c75b9f3a.1667867687.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2] usb: dwc3: gadget: Reduce TRB IOC settings
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
X-Proofpoint-ORIG-GUID: c3n7fA-7uWJz0wFrJV_e-RRZD38XeLSX
X-Proofpoint-GUID: c3n7fA-7uWJz0wFrJV_e-RRZD38XeLSX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 phishscore=0 impostorscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=734 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211080001
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
handling. Only forcefully set IOC when we run out of TRBs and none of
the TRBs in the TRB ring has had IOC set.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 Changes in v2:
 - The previous version assumes all requests have interrupt on
   completion set. We must check for the request's no_interrupt setting
   also.
 - Remove unnecessary note in commit.

 drivers/usb/dwc3/gadget.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 5fe2d136dff5..ecddb144871b 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1463,8 +1463,18 @@ static int dwc3_prepare_trbs_sg(struct dwc3_ep *dep,
 			 */
 			if (num_trbs_left == 1 || (needs_extra_trb &&
 					num_trbs_left <= 2 &&
-					sg_dma_len(sg_next(s)) >= length))
-				must_interrupt = true;
+					sg_dma_len(sg_next(s)) >= length)) {
+				struct dwc3_request *r;
+
+				/* Check if previous requests already set IOC */
+				list_for_each_entry(r, &dep->started_list, list) {
+					if (r != req && !r->request.no_interrupt)
+						break;
+
+					if (r == req)
+						must_interrupt = true;
+				}
+			}
 
 			dwc3_prepare_one_trb(dep, req, trb_length, 1, i, false,
 					must_interrupt);

base-commit: a8bc8cc193c69e41df5e757d1a592346526e136d
-- 
2.28.0

