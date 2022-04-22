Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB80C50ADB0
	for <lists+linux-usb@lfdr.de>; Fri, 22 Apr 2022 04:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1443274AbiDVCZZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Apr 2022 22:25:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231551AbiDVCZZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Apr 2022 22:25:25 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE7D749698
        for <linux-usb@vger.kernel.org>; Thu, 21 Apr 2022 19:22:33 -0700 (PDT)
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id ACCF741EEC;
        Fri, 22 Apr 2022 02:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1650594153; bh=CavEKzfkSBum4XrcPqNv04p/G7jXkgxXYN087G1HfV8=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=bygvOSkL7P8e4L6zbAUVancDbmfE6FOSTbl+uoPO2wTf21NnIOEIcfCgeE4LB70Ag
         /fOrn4oMimhUEoXPyDei2SKWBB0Yeg0xd0K6gcrKS43O7OI49n66N17w72drxnSoJu
         4dEoVlNU5LnOv06N41FdPokqe6sVNQ3k8omXcqpuBuRIzSEetCYcPS6fojCm2JEPhR
         XZU7pXaSYmAWsSYU40a2ia4yr/tNdNsb889w5Lg21LAIgiewCt187n9WeAHJKPgrbT
         eAhqmnB4uEorYR2qvcgMewobNkR8G9f4Jumgj7v/ySthOgXsBd1G/2+8XY1xrwEWID
         isRdN9FpiQXNw==
Received: from te-lab16-v2 (nanobot.internal.synopsys.com [10.204.48.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 57E20A006F;
        Fri, 22 Apr 2022 02:22:31 +0000 (UTC)
Received: by te-lab16-v2 (sSMTP sendmail emulation); Thu, 21 Apr 2022 19:22:31 -0700
Date:   Thu, 21 Apr 2022 19:22:31 -0700
Message-Id: <1c1345bd66c97a9d32f77d63aaadd04b7b037143.1650593829.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1650593829.git.Thinh.Nguyen@synopsys.com>
References: <cover.1650593829.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 1/6] usb: dwc3: gadget: Prevent repeat pullup()
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Don't do soft-disconnect if it's previously done. Likewise, don't do
soft-connect if the device is currently connected and running. It would
break normal operation.

Currently the caller of pullup() (udc's sysfs soft_connect) only checks
if it had initiated disconnect to prevent repeating soft-disconnect. It
doesn't check for soft-connect. To be safe, let's keep the check here
regardless whether the udc core is fixed.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index c3d95f9b010b..f30468b35c8c 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2505,6 +2505,10 @@ static int dwc3_gadget_pullup(struct usb_gadget *g, int is_on)
 	int			ret;
 
 	is_on = !!is_on;
+
+	if (dwc->pullups_connected == is_on)
+		return 0;
+
 	dwc->softconnect = is_on;
 	/*
 	 * Per databook, when we want to stop the gadget, if a control transfer
-- 
2.28.0

