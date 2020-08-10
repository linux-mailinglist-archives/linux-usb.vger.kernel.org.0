Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3330C2400D0
	for <lists+linux-usb@lfdr.de>; Mon, 10 Aug 2020 04:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbgHJC0i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Aug 2020 22:26:38 -0400
Received: from mail-eopbgr70080.outbound.protection.outlook.com ([40.107.7.80]:49993
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726439AbgHJC0h (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 9 Aug 2020 22:26:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WRreKGgIejTGwporL0Ja9GimToVYgGDG5XIkJ2GZyG8dOWgA2+AinvcKWBQnCfzuhab/4Mn76gjQ/Z62XgVGCZg5guwAbdNaQglNwjT91PDHtPMG5dieHVy0pdg2F0ItHbWYYl2vj/zpOazrL5zHUN6EZe95ahALfLmeljFKDJSPDmjEtMHcY/HuV0bBXyd+QjNIlj/+QTI7G9Ta1Sdwsl4uLrt726IoIqWkoAESUhEBuhrgj/q1IJFTI+qhU5UTo96fxGVLIR04Y/Byij2tETIiH5pYrHMin5IYfvaWU+iOsuX8unjbNQwhDRiWwtfDzS25X6yK957fDAXgjopTpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KC3qEjWJJ1y1lDv5k/w1ohIrahLkW/FbKSLvCc+iqng=;
 b=jUg7vgchpfsUewj+2P7Kv0EeyHtacgCbtjFS86C5xjzpujAgcT4lCSQqtV+eyr6WWeDezvK6J0/QMb/9D5eou9dcp37wIoWp7TE4sMGFhd7nIayxPJ2/cOq+5HkfCMUUSASP/987EmjSacH+3oZCqzQRWyRZOy79rn4AtMlTeiqFFw0xlJZoXnZNjghaeiRC0kn7pw0UwAwUH7QIT07anGQ49vAiUoGwkdomdPIBidfsukjZ5vVpxOvniKOETlySKiQhCEbo6GnV5S6ahXmLOrOfclHER7z0gm4owtNSr3zqcyc9hg5sIqHmUTJktrtgBEnY3/Ja0xbnGNfYidYZQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KC3qEjWJJ1y1lDv5k/w1ohIrahLkW/FbKSLvCc+iqng=;
 b=o93Y7AlapdvvEqC3x4RisYvmzLDs/dwOBUq+miTVbDWkuYxKfP6MVpZQeVJOvAfiUAhJ1oF5JjgZqTQxo44blJeEw65yjOKUlvlJzGMoQgeF23aDUjQsBqvlHLyYcqzvmCiPKGIBpJrDnRrgcgzsksUsvLCd7YQ/7eF6uRpT8gY=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7160.eurprd04.prod.outlook.com (2603:10a6:20b:119::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Mon, 10 Aug
 2020 02:26:28 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf%5]) with mapi id 15.20.3261.023; Mon, 10 Aug 2020
 02:26:28 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 5/6] usb: dwc3: allocate gadget structure dynamically
Date:   Mon, 10 Aug 2020 10:25:09 +0800
Message-Id: <20200810022510.6516-6-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200810022510.6516-1-peter.chen@nxp.com>
References: <20200810022510.6516-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0120.apcprd03.prod.outlook.com
 (2603:1096:4:91::24) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR03CA0120.apcprd03.prod.outlook.com (2603:1096:4:91::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.5 via Frontend Transport; Mon, 10 Aug 2020 02:26:24 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1d0f0c78-db80-4521-3e91-08d83cd4c944
X-MS-TrafficTypeDiagnostic: AM7PR04MB7160:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB7160785CA1EF628B66960BCD8B440@AM7PR04MB7160.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:352;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zK1ViDiQR5UumU9SmAsEYRZzVNgkoZjwL+WtsFipmUMkkl2LDxvsVW1z1px6GvfgRPdN/Va5bpSGS6IcVBKG6l5VcCFq360tKC9pcUUdJeIXujcKPI35FFJHt5ud5jJjIVXwbBFuXWcT5SQgfi86FyUguWP/PxLjrCkBJ7zblMRmKWYSJEzDmHSxWd9KvRB+d3WJb1tJwO9jQUnM1V4CRMCgQuRw9AY7yDrt2Oes+GMJ5H7VNNuEQnDPYUH128dBMw2bk7c7oRFjW06mOA3yJrNXq0AM/T2H7bk8timdjdSoIrCJdUZknF+zEJ3IBf1GLHuCYN9lRjK9ksNEFKfDoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(36756003)(2906002)(86362001)(19627235002)(83380400001)(1076003)(5660300002)(6916009)(30864003)(6666004)(6506007)(6512007)(44832011)(2616005)(956004)(8676002)(66476007)(8936002)(66946007)(66556008)(478600001)(16526019)(26005)(52116002)(316002)(186003)(6486002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: HGQP8ewv7QtiVQhD2Bu5j2ETZSb/jB01bGtSHC7Py+d44ZukTUgq3UuQHZBeMfC/bxZS9ELb3vWYPGQbqHnGqzYseHcn3QD49c5mL5pOjPrVdo0VrNAAilC0UpjuEc5oKLF8oIPqlntmcrS7fU6/3OC4sQlDWGpjemE7zKczY9Reqourg7b/pHMnhmEHrMqO0DZZIdG/Zd8FZqHzfJ8xppwNNn7U4K1q1N/R7qfIqBGC5xgtMush+8+Ed+J+P1cEN89a5bjpXO95z3p3VJEn1PsBVopeEj/aWz4FpDFxHgnYf/zS+FZJOJVEvDGU8XqkFP/N9Esw8SiHhpx4UOCh82LGkJydaMdCcKYChlef8EN83M2VYcTByupwkegPOg3WOBkdLketsSd72RLP23rlVXDaCOF53TBUYqr72JAg3OFCpZoBTdIEoTTje2SQLhMIcZOJ8Z1+Yug/vhEenWclmkHdlMBW1iLCoPg5pwwXQ3ANqi/MXNa+e+Hl63WLcyps/almj9rb/2veS+9e+RyyTSL4wsNfJ3WOV36Eccr5E1R6/A3atuJLBsuvz/nuz0/TdTwL2D42oMuTjQTKGllkSYWuo6/uNQxlCIhY87vZlz7X3fkfYmj6IiuenuxcdIom6ku7NQ8FhCHKcU85EgfUHA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0f0c78-db80-4521-3e91-08d83cd4c944
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 02:26:28.3348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /0EgQs/ugPyJyL7DGSBPBOhYq40unveAqx/z18SnmMloCfihM98oue5yCLLMf47lyqoeGpNcweYhpIWgxxOqCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7160
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The current code uses commit fac323471df6 ("usb: udc: allow adding
and removing the same gadget device") as the workaround to let
the gadget device is re-used, but it is not allowed from driver
core point. In this commit, we allocate gadget structure dynamically,
and free it at its release function. Since the gadget device's
driver_data has already occupied by usb_composite_dev structure, we have
to use gadget device's platform data to store dwc3 structure.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
Changes from v1:
- No changes.

 drivers/usb/dwc3/core.h   |   2 +-
 drivers/usb/dwc3/ep0.c    |  26 +++++-----
 drivers/usb/dwc3/gadget.c | 106 ++++++++++++++++++++++----------------
 drivers/usb/dwc3/gadget.h |   2 +-
 4 files changed, 77 insertions(+), 59 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 18c7a9907679..48301d950068 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1102,7 +1102,7 @@ struct dwc3 {
 	struct dwc3_event_buffer *ev_buf;
 	struct dwc3_ep		*eps[DWC3_ENDPOINTS_NUM];
 
-	struct usb_gadget	gadget;
+	struct usb_gadget	*gadget;
 	struct usb_gadget_driver *gadget_driver;
 
 	struct clk_bulk_data	*clks;
diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
index 8dd69728add3..1799bd19bf6f 100644
--- a/drivers/usb/dwc3/ep0.c
+++ b/drivers/usb/dwc3/ep0.c
@@ -131,7 +131,7 @@ static int __dwc3_gadget_ep0_queue(struct dwc3_ep *dep,
 
 		direction = !dwc->ep0_expect_in;
 		dwc->delayed_status = false;
-		usb_gadget_set_state(&dwc->gadget, USB_STATE_CONFIGURED);
+		usb_gadget_set_state(dwc->gadget, USB_STATE_CONFIGURED);
 
 		if (dwc->ep0state == EP0_STATUS_PHASE)
 			__dwc3_ep0_do_control_status(dwc, dwc->eps[direction]);
@@ -325,7 +325,7 @@ static int dwc3_ep0_handle_status(struct dwc3 *dwc,
 		/*
 		 * LTM will be set once we know how to set this in HW.
 		 */
-		usb_status |= dwc->gadget.is_selfpowered;
+		usb_status |= dwc->gadget->is_selfpowered;
 
 		if ((dwc->speed == DWC3_DSTS_SUPERSPEED) ||
 		    (dwc->speed == DWC3_DSTS_SUPERSPEED_PLUS)) {
@@ -450,7 +450,7 @@ static int dwc3_ep0_handle_device(struct dwc3 *dwc,
 
 	wValue = le16_to_cpu(ctrl->wValue);
 	wIndex = le16_to_cpu(ctrl->wIndex);
-	state = dwc->gadget.state;
+	state = dwc->gadget->state;
 
 	switch (wValue) {
 	case USB_DEVICE_REMOTE_WAKEUP:
@@ -559,7 +559,7 @@ static int dwc3_ep0_handle_feature(struct dwc3 *dwc,
 
 static int dwc3_ep0_set_address(struct dwc3 *dwc, struct usb_ctrlrequest *ctrl)
 {
-	enum usb_device_state state = dwc->gadget.state;
+	enum usb_device_state state = dwc->gadget->state;
 	u32 addr;
 	u32 reg;
 
@@ -580,9 +580,9 @@ static int dwc3_ep0_set_address(struct dwc3 *dwc, struct usb_ctrlrequest *ctrl)
 	dwc3_writel(dwc->regs, DWC3_DCFG, reg);
 
 	if (addr)
-		usb_gadget_set_state(&dwc->gadget, USB_STATE_ADDRESS);
+		usb_gadget_set_state(dwc->gadget, USB_STATE_ADDRESS);
 	else
-		usb_gadget_set_state(&dwc->gadget, USB_STATE_DEFAULT);
+		usb_gadget_set_state(dwc->gadget, USB_STATE_DEFAULT);
 
 	return 0;
 }
@@ -592,14 +592,14 @@ static int dwc3_ep0_delegate_req(struct dwc3 *dwc, struct usb_ctrlrequest *ctrl)
 	int ret;
 
 	spin_unlock(&dwc->lock);
-	ret = dwc->gadget_driver->setup(&dwc->gadget, ctrl);
+	ret = dwc->gadget_driver->setup(dwc->gadget, ctrl);
 	spin_lock(&dwc->lock);
 	return ret;
 }
 
 static int dwc3_ep0_set_config(struct dwc3 *dwc, struct usb_ctrlrequest *ctrl)
 {
-	enum usb_device_state state = dwc->gadget.state;
+	enum usb_device_state state = dwc->gadget->state;
 	u32 cfg;
 	int ret;
 	u32 reg;
@@ -622,7 +622,7 @@ static int dwc3_ep0_set_config(struct dwc3 *dwc, struct usb_ctrlrequest *ctrl)
 			 * to change the state on the next usb_ep_queue()
 			 */
 			if (ret == 0)
-				usb_gadget_set_state(&dwc->gadget,
+				usb_gadget_set_state(dwc->gadget,
 						USB_STATE_CONFIGURED);
 
 			/*
@@ -641,7 +641,7 @@ static int dwc3_ep0_set_config(struct dwc3 *dwc, struct usb_ctrlrequest *ctrl)
 	case USB_STATE_CONFIGURED:
 		ret = dwc3_ep0_delegate_req(dwc, ctrl);
 		if (!cfg && !ret)
-			usb_gadget_set_state(&dwc->gadget,
+			usb_gadget_set_state(dwc->gadget,
 					USB_STATE_ADDRESS);
 		break;
 	default:
@@ -697,7 +697,7 @@ static void dwc3_ep0_set_sel_cmpl(struct usb_ep *ep, struct usb_request *req)
 static int dwc3_ep0_set_sel(struct dwc3 *dwc, struct usb_ctrlrequest *ctrl)
 {
 	struct dwc3_ep	*dep;
-	enum usb_device_state state = dwc->gadget.state;
+	enum usb_device_state state = dwc->gadget->state;
 	u16		wLength;
 
 	if (state == USB_STATE_DEFAULT)
@@ -741,7 +741,7 @@ static int dwc3_ep0_set_isoch_delay(struct dwc3 *dwc, struct usb_ctrlrequest *ct
 	if (wIndex || wLength)
 		return -EINVAL;
 
-	dwc->gadget.isoch_delay = wValue;
+	dwc->gadget->isoch_delay = wValue;
 
 	return 0;
 }
@@ -1102,7 +1102,7 @@ static void dwc3_ep0_xfernotready(struct dwc3 *dwc,
 			 */
 			if (!list_empty(&dep->pending_list)) {
 				dwc->delayed_status = false;
-				usb_gadget_set_state(&dwc->gadget,
+				usb_gadget_set_state(dwc->gadget,
 						     USB_STATE_CONFIGURED);
 				dwc3_ep0_do_control_status(dwc, event);
 			}
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 0b59b2f1cf26..a6d60f53747d 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -290,7 +290,7 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned cmd,
 	 *
 	 * DWC_usb3 3.30a and DWC_usb31 1.90a programming guide section 3.2.2
 	 */
-	if (dwc->gadget.speed <= USB_SPEED_HIGH) {
+	if (dwc->gadget->speed <= USB_SPEED_HIGH) {
 		reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0));
 		if (unlikely(reg & DWC3_GUSB2PHYCFG_SUSPHY)) {
 			saved_config |= DWC3_GUSB2PHYCFG_SUSPHY;
@@ -422,7 +422,7 @@ static int dwc3_send_clear_stall_ep_cmd(struct dwc3_ep *dep)
 	 */
 	if (dep->direction &&
 	    !DWC3_VER_IS_PRIOR(DWC3, 260A) &&
-	    (dwc->gadget.speed >= USB_SPEED_SUPER))
+	    (dwc->gadget->speed >= USB_SPEED_SUPER))
 		cmd |= DWC3_DEPCMD_CLEARPENDIN;
 
 	memset(&params, 0, sizeof(params));
@@ -562,7 +562,7 @@ static int dwc3_gadget_set_ep_config(struct dwc3_ep *dep, unsigned int action)
 		| DWC3_DEPCFG_MAX_PACKET_SIZE(usb_endpoint_maxp(desc));
 
 	/* Burst size is only needed in SuperSpeed mode */
-	if (dwc->gadget.speed >= USB_SPEED_SUPER) {
+	if (dwc->gadget->speed >= USB_SPEED_SUPER) {
 		u32 burst = dep->endpoint.maxburst;
 		params.param0 |= DWC3_DEPCFG_BURST_SIZE(burst - 1);
 	}
@@ -947,7 +947,7 @@ static void __dwc3_prepare_one_trb(struct dwc3_ep *dep, struct dwc3_trb *trb,
 		unsigned no_interrupt, unsigned is_last)
 {
 	struct dwc3		*dwc = dep->dwc;
-	struct usb_gadget	*gadget = &dwc->gadget;
+	struct usb_gadget	*gadget = dwc->gadget;
 	enum usb_device_speed	speed = gadget->speed;
 
 	trb->size = DWC3_TRB_SIZE_LENGTH(length);
@@ -1476,7 +1476,7 @@ static int __dwc3_gadget_start_isoc(struct dwc3_ep *dep)
 	if (!dwc->dis_start_transfer_quirk &&
 	    (DWC3_VER_IS_PRIOR(DWC31, 170A) ||
 	     DWC3_VER_TYPE_IS_WITHIN(DWC31, 170A, EA01, EA06))) {
-		if (dwc->gadget.speed <= USB_SPEED_HIGH && dep->direction)
+		if (dwc->gadget->speed <= USB_SPEED_HIGH && dep->direction)
 			return dwc3_gadget_start_isoc_quirk(dep);
 	}
 
@@ -2160,7 +2160,7 @@ static int dwc3_gadget_start(struct usb_gadget *g,
 	spin_lock_irqsave(&dwc->lock, flags);
 	if (dwc->gadget_driver) {
 		dev_err(dwc->dev, "%s is already bound to %s\n",
-				dwc->gadget.name,
+				dwc->gadget->name,
 				dwc->gadget_driver->driver.name);
 		ret = -EBUSY;
 		goto err1;
@@ -2332,7 +2332,7 @@ static int dwc3_gadget_init_control_endpoint(struct dwc3_ep *dep)
 	dep->endpoint.maxburst = 1;
 	dep->endpoint.ops = &dwc3_gadget_ep0_ops;
 	if (!dep->direction)
-		dwc->gadget.ep0 = &dep->endpoint;
+		dwc->gadget->ep0 = &dep->endpoint;
 
 	dep->endpoint.caps.type_control = true;
 
@@ -2378,7 +2378,7 @@ static int dwc3_gadget_init_in_endpoint(struct dwc3_ep *dep)
 	dep->endpoint.max_streams = 15;
 	dep->endpoint.ops = &dwc3_gadget_ep_ops;
 	list_add_tail(&dep->endpoint.ep_list,
-			&dwc->gadget.ep_list);
+			&dwc->gadget->ep_list);
 	dep->endpoint.caps.type_iso = true;
 	dep->endpoint.caps.type_bulk = true;
 	dep->endpoint.caps.type_int = true;
@@ -2427,7 +2427,7 @@ static int dwc3_gadget_init_out_endpoint(struct dwc3_ep *dep)
 	dep->endpoint.max_streams = 15;
 	dep->endpoint.ops = &dwc3_gadget_ep_ops;
 	list_add_tail(&dep->endpoint.ep_list,
-			&dwc->gadget.ep_list);
+			&dwc->gadget->ep_list);
 	dep->endpoint.caps.type_iso = true;
 	dep->endpoint.caps.type_bulk = true;
 	dep->endpoint.caps.type_int = true;
@@ -2488,7 +2488,7 @@ static int dwc3_gadget_init_endpoints(struct dwc3 *dwc, u8 total)
 {
 	u8				epnum;
 
-	INIT_LIST_HEAD(&dwc->gadget.ep_list);
+	INIT_LIST_HEAD(&dwc->gadget->ep_list);
 
 	for (epnum = 0; epnum < total; epnum++) {
 		int			ret;
@@ -2924,7 +2924,7 @@ static void dwc3_disconnect_gadget(struct dwc3 *dwc)
 {
 	if (dwc->gadget_driver && dwc->gadget_driver->disconnect) {
 		spin_unlock(&dwc->lock);
-		dwc->gadget_driver->disconnect(&dwc->gadget);
+		dwc->gadget_driver->disconnect(dwc->gadget);
 		spin_lock(&dwc->lock);
 	}
 }
@@ -2933,7 +2933,7 @@ static void dwc3_suspend_gadget(struct dwc3 *dwc)
 {
 	if (dwc->gadget_driver && dwc->gadget_driver->suspend) {
 		spin_unlock(&dwc->lock);
-		dwc->gadget_driver->suspend(&dwc->gadget);
+		dwc->gadget_driver->suspend(dwc->gadget);
 		spin_lock(&dwc->lock);
 	}
 }
@@ -2942,7 +2942,7 @@ static void dwc3_resume_gadget(struct dwc3 *dwc)
 {
 	if (dwc->gadget_driver && dwc->gadget_driver->resume) {
 		spin_unlock(&dwc->lock);
-		dwc->gadget_driver->resume(&dwc->gadget);
+		dwc->gadget_driver->resume(dwc->gadget);
 		spin_lock(&dwc->lock);
 	}
 }
@@ -2952,9 +2952,9 @@ static void dwc3_reset_gadget(struct dwc3 *dwc)
 	if (!dwc->gadget_driver)
 		return;
 
-	if (dwc->gadget.speed != USB_SPEED_UNKNOWN) {
+	if (dwc->gadget->speed != USB_SPEED_UNKNOWN) {
 		spin_unlock(&dwc->lock);
-		usb_gadget_udc_reset(&dwc->gadget, dwc->gadget_driver);
+		usb_gadget_udc_reset(dwc->gadget, dwc->gadget_driver);
 		spin_lock(&dwc->lock);
 	}
 }
@@ -3055,9 +3055,9 @@ static void dwc3_gadget_disconnect_interrupt(struct dwc3 *dwc)
 
 	dwc3_disconnect_gadget(dwc);
 
-	dwc->gadget.speed = USB_SPEED_UNKNOWN;
+	dwc->gadget->speed = USB_SPEED_UNKNOWN;
 	dwc->setup_packet_pending = false;
-	usb_gadget_set_state(&dwc->gadget, USB_STATE_NOTATTACHED);
+	usb_gadget_set_state(dwc->gadget, USB_STATE_NOTATTACHED);
 
 	dwc->connected = false;
 }
@@ -3136,8 +3136,8 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 	switch (speed) {
 	case DWC3_DSTS_SUPERSPEED_PLUS:
 		dwc3_gadget_ep0_desc.wMaxPacketSize = cpu_to_le16(512);
-		dwc->gadget.ep0->maxpacket = 512;
-		dwc->gadget.speed = USB_SPEED_SUPER_PLUS;
+		dwc->gadget->ep0->maxpacket = 512;
+		dwc->gadget->speed = USB_SPEED_SUPER_PLUS;
 		break;
 	case DWC3_DSTS_SUPERSPEED:
 		/*
@@ -3157,27 +3157,27 @@ static void dwc3_gadget_conndone_interrupt(struct dwc3 *dwc)
 			dwc3_gadget_reset_interrupt(dwc);
 
 		dwc3_gadget_ep0_desc.wMaxPacketSize = cpu_to_le16(512);
-		dwc->gadget.ep0->maxpacket = 512;
-		dwc->gadget.speed = USB_SPEED_SUPER;
+		dwc->gadget->ep0->maxpacket = 512;
+		dwc->gadget->speed = USB_SPEED_SUPER;
 		break;
 	case DWC3_DSTS_HIGHSPEED:
 		dwc3_gadget_ep0_desc.wMaxPacketSize = cpu_to_le16(64);
-		dwc->gadget.ep0->maxpacket = 64;
-		dwc->gadget.speed = USB_SPEED_HIGH;
+		dwc->gadget->ep0->maxpacket = 64;
+		dwc->gadget->speed = USB_SPEED_HIGH;
 		break;
 	case DWC3_DSTS_FULLSPEED:
 		dwc3_gadget_ep0_desc.wMaxPacketSize = cpu_to_le16(64);
-		dwc->gadget.ep0->maxpacket = 64;
-		dwc->gadget.speed = USB_SPEED_FULL;
+		dwc->gadget->ep0->maxpacket = 64;
+		dwc->gadget->speed = USB_SPEED_FULL;
 		break;
 	case DWC3_DSTS_LOWSPEED:
 		dwc3_gadget_ep0_desc.wMaxPacketSize = cpu_to_le16(8);
-		dwc->gadget.ep0->maxpacket = 8;
-		dwc->gadget.speed = USB_SPEED_LOW;
+		dwc->gadget->ep0->maxpacket = 8;
+		dwc->gadget->speed = USB_SPEED_LOW;
 		break;
 	}
 
-	dwc->eps[1]->endpoint.maxpacket = dwc->gadget.ep0->maxpacket;
+	dwc->eps[1]->endpoint.maxpacket = dwc->gadget->ep0->maxpacket;
 
 	/* Enable USB2 LPM Capability */
 
@@ -3245,7 +3245,7 @@ static void dwc3_gadget_wakeup_interrupt(struct dwc3 *dwc)
 
 	if (dwc->gadget_driver && dwc->gadget_driver->resume) {
 		spin_unlock(&dwc->lock);
-		dwc->gadget_driver->resume(&dwc->gadget);
+		dwc->gadget_driver->resume(dwc->gadget);
 		spin_lock(&dwc->lock);
 	}
 }
@@ -3416,7 +3416,7 @@ static void dwc3_gadget_interrupt(struct dwc3 *dwc,
 			 * Ignore suspend event until the gadget enters into
 			 * USB_STATE_CONFIGURED state.
 			 */
-			if (dwc->gadget.state >= USB_STATE_CONFIGURED)
+			if (dwc->gadget->state >= USB_STATE_CONFIGURED)
 				dwc3_gadget_suspend_interrupt(dwc,
 						event->event_info);
 		}
@@ -3591,6 +3591,13 @@ static int dwc3_gadget_get_irq(struct dwc3 *dwc)
 	return irq;
 }
 
+static void dwc_gadget_release(struct device *dev)
+{
+	struct usb_gadget *gadget = container_of(dev, struct usb_gadget, dev);
+
+	kfree(gadget);
+}
+
 /**
  * dwc3_gadget_init - initializes gadget related registers
  * @dwc: pointer to our controller context structure
@@ -3601,6 +3608,7 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 {
 	int ret;
 	int irq;
+	struct device *dev;
 
 	irq = dwc3_gadget_get_irq(dwc);
 	if (irq < 0) {
@@ -3633,12 +3641,21 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 	}
 
 	init_completion(&dwc->ep0_in_setup);
+	dwc->gadget = kzalloc(sizeof(struct usb_gadget), GFP_KERNEL);
+	if (!dwc->gadget) {
+		ret = -ENOMEM;
+		goto err3;
+	}
 
-	dwc->gadget.ops			= &dwc3_gadget_ops;
-	dwc->gadget.speed		= USB_SPEED_UNKNOWN;
-	dwc->gadget.sg_supported	= true;
-	dwc->gadget.name		= "dwc3-gadget";
-	dwc->gadget.lpm_capable		= true;
+
+	usb_initialize_gadget(dwc->dev, dwc->gadget, dwc_gadget_release);
+	dev				= &dwc->gadget->dev;
+	dev->platform_data		= dwc;
+	dwc->gadget->ops		= &dwc3_gadget_ops;
+	dwc->gadget->speed		= USB_SPEED_UNKNOWN;
+	dwc->gadget->sg_supported	= true;
+	dwc->gadget->name		= "dwc3-gadget";
+	dwc->gadget->lpm_capable	= true;
 
 	/*
 	 * FIXME We might be setting max_speed to <SUPER, however versions
@@ -3661,7 +3678,7 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 		dev_info(dwc->dev, "changing max_speed on rev %08x\n",
 				dwc->revision);
 
-	dwc->gadget.max_speed		= dwc->maximum_speed;
+	dwc->gadget->max_speed		= dwc->maximum_speed;
 
 	/*
 	 * REVISIT: Here we should clear all pending IRQs to be
@@ -3670,21 +3687,22 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 
 	ret = dwc3_gadget_init_endpoints(dwc, dwc->num_eps);
 	if (ret)
-		goto err3;
+		goto err4;
 
-	ret = usb_add_gadget_udc(dwc->dev, &dwc->gadget);
+	ret = usb_add_gadget(dwc->gadget);
 	if (ret) {
-		dev_err(dwc->dev, "failed to register udc\n");
-		goto err4;
+		dev_err(dwc->dev, "failed to add gadget\n");
+		goto err5;
 	}
 
-	dwc3_gadget_set_speed(&dwc->gadget, dwc->maximum_speed);
+	dwc3_gadget_set_speed(dwc->gadget, dwc->maximum_speed);
 
 	return 0;
 
-err4:
+err5:
 	dwc3_gadget_free_endpoints(dwc);
-
+err4:
+	usb_put_gadget(dwc->gadget);
 err3:
 	dma_free_coherent(dwc->sysdev, DWC3_BOUNCE_SIZE, dwc->bounce,
 			dwc->bounce_addr);
@@ -3704,7 +3722,7 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 
 void dwc3_gadget_exit(struct dwc3 *dwc)
 {
-	usb_del_gadget_udc(&dwc->gadget);
+	usb_del_gadget_udc(dwc->gadget);
 	dwc3_gadget_free_endpoints(dwc);
 	dma_free_coherent(dwc->sysdev, DWC3_BOUNCE_SIZE, dwc->bounce,
 			  dwc->bounce_addr);
diff --git a/drivers/usb/dwc3/gadget.h b/drivers/usb/dwc3/gadget.h
index 24dca3872022..b547db228f1e 100644
--- a/drivers/usb/dwc3/gadget.h
+++ b/drivers/usb/dwc3/gadget.h
@@ -17,7 +17,7 @@
 
 struct dwc3;
 #define to_dwc3_ep(ep)		(container_of(ep, struct dwc3_ep, endpoint))
-#define gadget_to_dwc(g)	(container_of(g, struct dwc3, gadget))
+#define gadget_to_dwc(g)	(dev_get_platdata(&g->dev))
 
 /* DEPCFG parameter 1 */
 #define DWC3_DEPCFG_INT_NUM(n)		(((n) & 0x1f) << 0)
-- 
2.17.1

