Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 116852F58B6
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jan 2021 04:03:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727169AbhANCyC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jan 2021 21:54:02 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:42062 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726483AbhANCyC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jan 2021 21:54:02 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1080E40216;
        Thu, 14 Jan 2021 02:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1610592782; bh=W5K7Y9tO9upMy7kuj5bAb9ijb+sUN5HoyWyT6GbkzzA=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=PuzCVzFSe8zmqyV2OqFEQe6ra0fSUhJMT82DQyMsWVY+d1Z9UcnMsv5D1VWvtqkvC
         2PKcpg4z7eYLXFCsCDiV1aeV1UtEuHzk8sTzNALlCLqpvgsaSnXo2UzlEuEEuAoV07
         CvqUCeyLlEMbFdlt/YiujMMhlgfZlE56UjjsoOkXfWKGuuo7I4V7i5MsmXHxp+Tv0j
         HhvXyWdzupKiwyHlKJYNGmEFzgDrjPpgLLzir+xEp4njxdZnPAE/ORU2hlTklLPsnz
         F43zgfhjtxhOYuYfSeiJ3sHAZFg+7ihG/OYH/VfFBEDK4Mid8bTcCmwcpmhqYfsbSz
         jq0IC/cy/nVSg==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id EE4A7A0070;
        Thu, 14 Jan 2021 02:53:00 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 13 Jan 2021 18:53:00 -0800
Date:   Wed, 13 Jan 2021 18:53:00 -0800
Message-Id: <b6d2196dcc3c73747f91abf9a082b20bbe276cc4.1610592135.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1610592135.git.Thinh.Nguyen@synopsys.com>
References: <cover.1610592135.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v6 03/11] usb: gadget: Introduce SSP rates and lanes
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A USB device controller operating in SuperSpeed Plus may support gen2x1,
gen1x2, and/or gen2x2. Introduce SuperSpeed Plus signaling rate
generation and lane count to usb_gadget with the fields ssp_rate and
max_ssp_rate. The gadget driver can use these to setup the device BOS
descriptor and select the desire operating speed and number of lanes.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
Changes in v6:
- Rebase on Greg's usb-testing branch
- Remove all the sublink speed fields and use only usb_ssp_rate enums
- Update commit message
Changes in v5:
- Rebase on Felipe's testing/next branch
- Changed Signed-off-by email to match From: email header
Changes in v4:
- Change unsigned fields to unsigned int
Changes in v3:
- None
Changes in v2:
- None

 include/linux/usb/gadget.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index e7351d64f11f..02483c862444 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -339,6 +339,10 @@ struct usb_gadget_ops {
  * @speed: Speed of current connection to USB host.
  * @max_speed: Maximal speed the UDC can handle.  UDC must support this
  *      and all slower speeds.
+ * @ssp_rate: Current connected SuperSpeed Plus signaling rate and lane count.
+ * @max_ssp_rate: Maximum SuperSpeed Plus signaling rate and lane count the UDC
+ *	can handle. The UDC must support this and all slower speeds and lower
+ *	number of lanes.
  * @state: the state we are now (attached, suspended, configured, etc)
  * @name: Identifies the controller hardware type.  Used in diagnostics
  *	and sometimes configuration.
@@ -406,6 +410,11 @@ struct usb_gadget {
 	struct list_head		ep_list;	/* of usb_ep */
 	enum usb_device_speed		speed;
 	enum usb_device_speed		max_speed;
+
+	/* USB SuperSpeed Plus only */
+	enum usb_ssp_rate		ssp_rate;
+	enum usb_ssp_rate		max_ssp_rate;
+
 	enum usb_device_state		state;
 	const char			*name;
 	struct device			dev;
-- 
2.28.0

