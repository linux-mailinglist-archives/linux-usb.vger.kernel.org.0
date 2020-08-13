Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D674243401
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 08:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgHMGZt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Aug 2020 02:25:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:38114 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726174AbgHMGZr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Aug 2020 02:25:47 -0400
Received: from saruman.elisa-laajakaista.fi (unknown [194.34.132.57])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 17B6620716;
        Thu, 13 Aug 2020 06:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597299946;
        bh=Xfu4dFBmXNFvSByz5OjqWRdtRbMq7N32vvQ7SmTVS8A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ptqGwN9mweFa9Cz4lfN1LY+t9YEtsRT3Jo60A/q+P9zZlLcJrMK7qEyDwqEts7+O7
         kEitCVdFaujuhqbERQGex4D2lwkIqPhWer2T5gQ2iHyCk95eqGB2J6p3js98UYH4/g
         RrgNgLux3gjl7knIQUmPyO23coRiyAQ/btC8mNrI=
From:   balbi@kernel.org
To:     Linux USB <linux-usb@vger.kernel.org>
Cc:     Felipe Balbi <balbi@kernel.org>
Subject: [PATCH 07/11] dwc3: core: fix checkpatch warnings
Date:   Thu, 13 Aug 2020 09:25:28 +0300
Message-Id: <20200813062532.829720-7-balbi@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200813062532.829720-1-balbi@kernel.org>
References: <20200813062532.829720-1-balbi@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Felipe Balbi <balbi@kernel.org>

no functional changes

Signed-off-by: Felipe Balbi <balbi@kernel.org>
---
 drivers/usb/dwc3/core.h | 37 +++++++++++++++++++------------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 2f04b3e42bf1..ce457950606e 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -634,7 +634,7 @@ struct dwc3_trb;
 struct dwc3_event_buffer {
 	void			*buf;
 	void			*cache;
-	unsigned		length;
+	unsigned int		length;
 	unsigned int		lpos;
 	unsigned int		count;
 	unsigned int		flags;
@@ -694,7 +694,7 @@ struct dwc3_ep {
 	struct dwc3		*dwc;
 
 	u32			saved_state;
-	unsigned		flags;
+	unsigned int		flags;
 #define DWC3_EP_ENABLED		BIT(0)
 #define DWC3_EP_STALL		BIT(1)
 #define DWC3_EP_WEDGE		BIT(2)
@@ -893,9 +893,9 @@ struct dwc3_request {
 	struct scatterlist	*sg;
 	struct scatterlist	*start_sg;
 
-	unsigned		num_pending_sgs;
+	unsigned int		num_pending_sgs;
 	unsigned int		num_queued_sgs;
-	unsigned		remaining;
+	unsigned int		remaining;
 
 	unsigned int		status;
 #define DWC3_REQUEST_STATUS_QUEUED	0
@@ -908,11 +908,11 @@ struct dwc3_request {
 	struct dwc3_trb		*trb;
 	dma_addr_t		trb_dma;
 
-	unsigned		num_trbs;
+	unsigned int		num_trbs;
 
-	unsigned		needs_extra_trb:1;
-	unsigned		direction:1;
-	unsigned		mapped:1;
+	unsigned int		needs_extra_trb:1;
+	unsigned int		direction:1;
+	unsigned int		mapped:1;
 };
 
 /*
@@ -1010,8 +1010,8 @@ struct dwc3_scratchpad_array {
  * @has_lpm_erratum: true when core was configured with LPM Erratum. Note that
  *			there's now way for software to detect this in runtime.
  * @is_utmi_l1_suspend: the core asserts output signal
- * 	0	- utmi_sleep_n
- * 	1	- utmi_l1_suspend_n
+ *	0	- utmi_sleep_n
+ *	1	- utmi_l1_suspend_n
  * @is_fpga: true when we are using the FPGA board
  * @pending_events: true when we have pending IRQs to be handled
  * @pullups_connected: true when Run/Stop bit is set
@@ -1047,13 +1047,13 @@ struct dwc3_scratchpad_array {
  *			instances in park mode.
  * @tx_de_emphasis_quirk: set if we enable Tx de-emphasis quirk
  * @tx_de_emphasis: Tx de-emphasis value
- * 	0	- -6dB de-emphasis
- * 	1	- -3.5dB de-emphasis
- * 	2	- No de-emphasis
- * 	3	- Reserved
+ *	0	- -6dB de-emphasis
+ *	1	- -3.5dB de-emphasis
+ *	2	- No de-emphasis
+ *	3	- Reserved
  * @dis_metastability_quirk: set to disable metastability quirk.
  * @imod_interval: set the interrupt moderation interval in 250ns
- *                 increments or 0 to disable.
+ *			increments or 0 to disable.
  */
 struct dwc3 {
 	struct work_struct	drd_work;
@@ -1456,9 +1456,10 @@ void dwc3_gadget_exit(struct dwc3 *dwc);
 int dwc3_gadget_set_test_mode(struct dwc3 *dwc, int mode);
 int dwc3_gadget_get_link_state(struct dwc3 *dwc);
 int dwc3_gadget_set_link_state(struct dwc3 *dwc, enum dwc3_link_state state);
-int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned cmd,
+int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned int cmd,
 		struct dwc3_gadget_ep_cmd_params *params);
-int dwc3_send_gadget_generic_command(struct dwc3 *dwc, unsigned cmd, u32 param);
+int dwc3_send_gadget_generic_command(struct dwc3 *dwc, unsigned int cmd,
+		u32 param);
 #else
 static inline int dwc3_gadget_init(struct dwc3 *dwc)
 { return 0; }
@@ -1472,7 +1473,7 @@ static inline int dwc3_gadget_set_link_state(struct dwc3 *dwc,
 		enum dwc3_link_state state)
 { return 0; }
 
-static inline int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned cmd,
+static inline int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned int cmd,
 		struct dwc3_gadget_ep_cmd_params *params)
 { return 0; }
 static inline int dwc3_send_gadget_generic_command(struct dwc3 *dwc,
-- 
2.28.0

