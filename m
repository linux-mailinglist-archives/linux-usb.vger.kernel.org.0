Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E41522390B
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jul 2020 12:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbgGQKNl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jul 2020 06:13:41 -0400
Received: from mail-eopbgr60050.outbound.protection.outlook.com ([40.107.6.50]:40051
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725864AbgGQKNj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 17 Jul 2020 06:13:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J6nmdVxgvJxNKJcsJJFHkiDzo44en9DbBStnV5aX78STgSU1C95XHT5CbeIM2q++lsyKfjERzIdhbKPcl3jM5+VN/r6ywHucwkqOxRnQJlRbctrYMtMpN2/HfetLWrX5lAgmPakmHbEjRvn6yiIW0J6BeT3K4EKWe+SykmqmstW1diDzewdQjCu/zmv+CQyG1DVIPEUamZDuAVSliUqoxCc9FxPcStpLWWd4mti/sJKu1xYskqD+za86LVnxGVzXPVaNs0+YvGCWOIbsnJCJeZJV9/c+QRMyl2HrN1YHAJfffCczANv39k3Z5B23fhbrtIx2/yj2uibRa6MBzThmKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zw0v6ZeN9EggmoHVK7NwUL9TrqAx+UeTVnEl6IDWb7E=;
 b=hP9MpYHT+5XFK26haLG5gemI3+S2/SMnbk9xci/I0UrH7RGf73UqPtMYLVMxp9C1AaWsUGQ6KnmDs/WMn+hcCaozqu3nYh3CtYg6d/fG6l0YzUpz1Axo3VtTggjkqQui0TjUHhLqMDKEMDrAVNidCvG2NdbQLay77XjJ+udJHjuhz+CKPbT5lnLwFppm+M/ctQHA3OO3QZs7dXBKIucramCmlI53ohK3Sn531jo5Nk6g8wsFF60p9pqsmDBhrmGAGqcV7tMWDj6mkb7l9YaF6Ds8UvXIqI1tKUeiOI7RbSK/SglF99TwBfYrSOsmG3HqTu5SO17PGmuCcxPgsxG2AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zw0v6ZeN9EggmoHVK7NwUL9TrqAx+UeTVnEl6IDWb7E=;
 b=Jf0WFJktm7Skgip06LIMyTMryX5TxOKODVPgFAIh6AlXXZhHHKCrsx++uTTvgdakWRRKPyrPtOt5vPKBtcjnbyOpVdhX2eDf4jDLa0qCKUNchcJOxIIlWfbin7vF6XznkOFHrQkw6jMvd/QMCraxt14UG7WNYS9x42uzwWdnaNM=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM5PR0401MB2481.eurprd04.prod.outlook.com (2603:10a6:203:39::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18; Fri, 17 Jul
 2020 10:13:36 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3174.026; Fri, 17 Jul 2020
 10:13:36 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/1] usb: cdns3: gadget: improve the set_configuration handling
Date:   Fri, 17 Jul 2020 18:13:17 +0800
Message-Id: <20200717101317.25647-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0013.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::25)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SGXP274CA0013.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17 via Frontend Transport; Fri, 17 Jul 2020 10:13:32 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ba9aecdb-d289-448c-f1e0-08d82a3a115d
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2481:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0401MB24818F92D4089843257B8DFC8B7C0@AM5PR0401MB2481.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qvm223Sw3no4zt94thd1ZwNkdf/VkuCjiL15UAn4KMyk9xNjaTwXyzaZSO3aX+gkj6Rzx4+yCmPBtJvUGUCua6ArZ97yjPvc8OPs0K6ylSDnL/a946U3Ikw+f6708s0Fs7kxFFissCbRtYFprQ/mg40DPfbMPGWhSXtI3JDbONlFkP9pt3jOCCH6jEeWsJ/ecwXFybZ0gcv+M4Mg8c611eIh/xM1yk8sPNwkiYr6GigeEDy+Aa1qZPJqAXPCJq0XtgceDWpstVhvhDJ39uViAiWnYckglEDHhri0bg5A4CnxGvzoLm2ZoTKLDzIVJs5+w2l5vmk2yMTK5ha/v45+UQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(478600001)(956004)(44832011)(8676002)(2616005)(6486002)(36756003)(6512007)(66946007)(66476007)(66556008)(8936002)(83380400001)(4326008)(86362001)(16526019)(316002)(2906002)(5660300002)(6506007)(6666004)(26005)(52116002)(1076003)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: x2GaNmTao0X7AhaofXczl3oByYZKO/IVbNViuhryIPW1lIMBGegkJ4rRgF21HvArEyt5Fkqv5Lxe98d1ngxFozaxAf6PXJUhN1aRu8OSXYagl2ygpOU4A1XxYGMLC72Zaem1CXPEgFF7QuQyww6sQCgEuJNXyCWUWq+Rlv+zX4glSSLmLGt/IFgJ4fP757MOZ9plhUt9FxwP2IgyDoAWCXu5z8rNKbKBbiq6MrCPJSUeoMxklh0kb/Vwx2QtHaaEQ6/bJ8lyiF3YIxh48cRVL+YN1pnYW4b6p6rsjrEVWCgA6li13RhyT3BXP47Ff57DSD+qcQoiuiuQBUxAaY31g1kJHj69GIOXLfhbVbrrz6mxl9GBeSzuZfcOEiLm6+4K8GKU5iEGbh5SoWAOcfxqrweOPQJfUZvx1YDQ+MWJYrhajggQ9g7nT+XAlCklru9YDvrWt0DX4Ddmv875/+1BBnTmj90Lx/lic0/z6ybHdMZZVcq94Fbyhq7lUATe+I+K
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba9aecdb-d289-448c-f1e0-08d82a3a115d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2020 10:13:36.4129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: //EjAx03z0EaOeh67bKZ4Un8Dxuv8ZcAtfyHf4nex7XxP4Jaygmax03nekGzgSXDAd2LXvK0YXxu3ugm/Kt8AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2481
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

- Delete the duplicated EP_CMD_ERDY and EP_CMD_REQ_CMPL setting
- Prepare the next setup before setting EP_CMD_ERDY and EP_CMD_REQ_CMPL,
it could avoid a bug that DMA hang at EP0 OUT for DEV_VER_NXP_V1
- Delete the duplicated cdns3_set_hw_configuration calling at
cdns3_req_ep0_set_configuration, the composite.c will handle
this request, and call .ep0_queue back, and at .ep_queue it will
call cdns3_set_hw_configuration.
- Move cdns3_allow_enable_l1 into cdns3_set_hw_configuration since
it is part of this function.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/ep0.c    | 15 +++------------
 drivers/usb/cdns3/gadget.c |  3 ++-
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/cdns3/ep0.c b/drivers/usb/cdns3/ep0.c
index 5104414ce243..f7f7b2610d24 100644
--- a/drivers/usb/cdns3/ep0.c
+++ b/drivers/usb/cdns3/ep0.c
@@ -158,13 +158,12 @@ static int cdns3_req_ep0_set_configuration(struct cdns3_device *priv_dev,
 		if (result)
 			return result;
 
-		if (config) {
-			cdns3_set_hw_configuration(priv_dev);
-		} else {
+		if (!config) {
 			cdns3_hw_reset_eps_config(priv_dev);
 			usb_gadget_set_state(&priv_dev->gadget,
 					     USB_STATE_ADDRESS);
 		}
+
 		break;
 	case USB_STATE_CONFIGURED:
 		result = cdns3_ep0_delegate_req(priv_dev, ctrl_req);
@@ -698,7 +697,6 @@ static int cdns3_gadget_ep0_queue(struct usb_ep *ep,
 	struct cdns3_endpoint *priv_ep = ep_to_cdns3_ep(ep);
 	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
 	unsigned long flags;
-	int erdy_sent = 0;
 	int ret = 0;
 	u8 zlp = 0;
 
@@ -714,15 +712,8 @@ static int cdns3_gadget_ep0_queue(struct usb_ep *ep,
 	/* send STATUS stage. Should be called only for SET_CONFIGURATION */
 	if (priv_dev->ep0_stage == CDNS3_STATUS_STAGE) {
 		cdns3_select_ep(priv_dev, 0x00);
-
-		erdy_sent = !priv_dev->hw_configured_flag;
 		cdns3_set_hw_configuration(priv_dev);
-
-		if (!erdy_sent)
-			cdns3_ep0_complete_setup(priv_dev, 0, 1);
-
-		cdns3_allow_enable_l1(priv_dev, 1);
-
+		cdns3_ep0_complete_setup(priv_dev, 0, 1);
 		request->actual = 0;
 		priv_dev->status_completion_no_call = true;
 		priv_dev->pending_status_request = request;
diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 8384b86363fd..cb3c8de4cf99 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -1314,7 +1314,6 @@ void cdns3_set_hw_configuration(struct cdns3_device *priv_dev)
 		return;
 
 	writel(USB_CONF_CFGSET, &priv_dev->regs->usb_conf);
-	writel(EP_CMD_ERDY | EP_CMD_REQ_CMPL, &priv_dev->regs->ep_cmd);
 
 	cdns3_set_register_bit(&priv_dev->regs->usb_conf,
 			       USB_CONF_U1EN | USB_CONF_U2EN);
@@ -1331,6 +1330,8 @@ void cdns3_set_hw_configuration(struct cdns3_device *priv_dev)
 			cdns3_start_all_request(priv_dev, priv_ep);
 		}
 	}
+
+	cdns3_allow_enable_l1(priv_dev, 1);
 }
 
 /**
-- 
2.17.1

