Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7DE9537B
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2019 03:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728809AbfHTBhI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Aug 2019 21:37:08 -0400
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]:51746 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728741AbfHTBhI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Aug 2019 21:37:08 -0400
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com [10.13.135.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BD0EDC03B2;
        Tue, 20 Aug 2019 01:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1566265027; bh=m0XsAmBepkxRRCI3gsasvFaDh9h6o2+8FioCDynUx18=;
        h=Date:In-Reply-To:References:From:Subject:To:CC:From;
        b=TOMmR1u8u9PM7VYrTWXp6XN80Iuz1eOVOPtcNJkhzJJP9l57a5MrC6DEJV/D8azUi
         QcWmM3SP9lAFxgMZ8UxXgVRyYR7hzLYVuy2kRqEgZwckW+fk/iwEKyWaCx2y5l63cN
         brLKs0mmweS5m2LNdJFS0lUEpF20F1kqWPqNh7BGcKhqoV3Fj7iG2u+N3yYfdm5Pl6
         wl5aJpOgHc4XHF2vFzDxj2cRIqdbLvFpAfz25LKENquDAYDJBBXxRSeauhgP3wOJ89
         /pdY7/QTBqo8w5cbJiHjnm80lrifMYgxzNfCxk9uqh1MSsZ15n+CzD+L7S03ZSvCxW
         thFBiaQKQiw9g==
Received: from US01WXQAHTC1.internal.synopsys.com (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id ADEE8A023B;
        Tue, 20 Aug 2019 01:37:07 +0000 (UTC)
Received: from US01WEHTC3.internal.synopsys.com (10.15.84.232) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 19 Aug 2019 18:36:06 -0700
Received: from te-lab16 (10.13.184.19) by US01WEHTC3.internal.synopsys.com
 (10.15.84.231) with Microsoft SMTP Server (TLS) id 14.3.408.0; Mon, 19 Aug
 2019 18:36:06 -0700
Received: by te-lab16 (sSMTP sendmail emulation); Mon, 19 Aug 2019 18:36:06
 -0700
Date:   Mon, 19 Aug 2019 18:36:06 -0700
Message-ID: <f86b17f0e801e758586f445f2e0a10b97c507454.1566263914.git.thinhn@synopsys.com>
In-Reply-To: <cover.1566263914.git.thinhn@synopsys.com>
References: <cover.1566263914.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 3/4] usb: dwc3: gadget: Set BESL config parameter
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.13.184.19]
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When operating with LPM signals, the controller asserts the deep
low-power signal (utmi_l1_suspend_n) to the phy when the BESL value of
the LPM token is equal to or greater than DCTL.HIRD_Thres[3:0] (and
with DCTL.HIRD_Thres[4] set). Otherwise, the shallow low-power signal
(utmi_sleep_n) is asserted. Set the recommended deep BESL equal to the
controller's DCTL.HIRD_Thres[3:0] setting, and set the baseline BESL
to 0 for the shallow low-power signal. This maximizes the opportunity
for L1 residency and optimizes power savings.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index afc2ddb080ae..8ac024c5147a 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2078,6 +2078,16 @@ static void dwc3_gadget_config_params(struct usb_gadget *g,
 {
 	struct dwc3		*dwc = gadget_to_dwc(g);
 
+	params->besl_baseline = USB_DEFAULT_BESL_UNSPECIFIED;
+	params->besl_deep = USB_DEFAULT_BESL_UNSPECIFIED;
+
+	/* Recommended BESL */
+	if (!dwc->dis_enblslpm_quirk) {
+		params->besl_baseline = 0;
+		if (dwc->is_utmi_l1_suspend)
+			params->besl_deep = min_t(u8, dwc->hird_threshold, 15);
+	}
+
 	/* U1 Device exit Latency */
 	if (dwc->dis_u1_entry_quirk)
 		params->bU1devExitLat = 0;
-- 
2.11.0

