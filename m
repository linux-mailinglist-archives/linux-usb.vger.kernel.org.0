Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D4992208F7
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 11:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730591AbgGOJjM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 05:39:12 -0400
Received: from mail-eopbgr10063.outbound.protection.outlook.com ([40.107.1.63]:31605
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728820AbgGOJjM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 15 Jul 2020 05:39:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cRRKNMqJL4Fv8XbvAHOw5D/mGadj0JKpJ/I5eg9Oxs7hAj8IL85qbm0wXztKQgpMS/inrxPuH6oR8JIK4Nz4iota36W/PU5nMt2AHLeVcm4ITCZavps2G16LTHgwZieXli3mIcFGJHzw9MAh3z51m7iEwtyh8oxFJCficy8+DWRIRirTBx0vWrm/FeHCDd8+AjaHeCrNUCMk0YhUpNrCz7teDN2CBr4cw0Sca/St41kVAhjUy/0IkU3H2sFcppwt/fljKOZJsBIMYozLlZYp/4QdiYNhurnS/spe7Z2DcFEW1iPzr/rh1+8Ls4GCr3nA5/6YPCFw0inA4YzDc3gMyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIRwA7e6CW4/tikFZCsz2RDDSW7W+hgiX2h6FmPOz0w=;
 b=AfL4FsNqf0+3xFaTSzhgn9YEnKhqx4wnA2RQ7Wn6p+9QA3rBC213mGbCOtIrb6EURrODk0279h5vv4ROisqQt+l7XSjJNC1joEhyicNmIe5B5sQhAFxMzeTTzuCWuRZqJExAukkasqALum5X0RQzFBff5vonL+psaK66fO0N55i4Rlpq8fZ2c5ppJNHRiZgRyMiRo/jcDLn9eKjRDVaA2qZv5yilWYQbmFXr8gpEUfdus7miTdqmX4JaV86SJtKHZDI3lUvBV2saeeEOY66KTn+fKTJemn8gtwGqqhrUWHnB0hEgukCANzaxYRF4bOr0/4+mVwIP/y2s+r1CTIOxag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIRwA7e6CW4/tikFZCsz2RDDSW7W+hgiX2h6FmPOz0w=;
 b=mHq6QJlf9nc3AOFm8uEnWimwB4UnuRmr1MoUo2YZ35S/RXgWWshBCauAHczwS32bPOmRv9uAbEqLKYNMuyS4NPX/elxa6CeRLrfv5bBEHl+n9FoeBWztc2ZTeqDsQOtsPmY+qjGqExZD0ecgv1V9xp1Bi+Xnncgh6NaJ0nwZxDA=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4245.eurprd04.prod.outlook.com (2603:10a6:209:4f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Wed, 15 Jul
 2020 09:39:07 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3174.026; Wed, 15 Jul 2020
 09:39:07 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     mathias.nyman@intel.com
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-imx@nxp.com, stern@rowland.harvard.edu,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/3] usb: host: xhci: avoid calling contineous two times for xhci_suspend
Date:   Wed, 15 Jul 2020 17:38:56 +0800
Message-Id: <20200715093858.12830-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:3:17::15) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR02CA0003.apcprd02.prod.outlook.com (2603:1096:3:17::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend Transport; Wed, 15 Jul 2020 09:39:05 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1687fec4-665b-4fcd-cb60-08d828a2eb64
X-MS-TrafficTypeDiagnostic: AM6PR04MB4245:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB424525C09E497ED39D75E2ED8B7E0@AM6PR04MB4245.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sR3+WGnxnYP4Jn8omWbMV9r2Q7AOxA81iLchFypSTMMXUzYt2ahORgRa2kjnLOH6KSAqbQ7CNdYj+75/kSMz39IL4BPo4qjczUXBIyE9T6y6nIhb5n9aBu05r+JzSue9CDgCRBB2qEkbp0UxscVuNJmzT7YOT/eytU2TMqdDHpu9Rw+JuDndDEklBahhUcw1HEQ2VLtGs7f4Mr8hw/KbkKw8XeRli8zjEcga0kU2kNsZoaCbfXRfnFKhtKNtuoOT/NyAx0WAiBbipAz0VxIm35BRImrZ5tUS+fR4YH74SWCcOj0iHS9h2YpBDdfmkSYj
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(5660300002)(8676002)(66476007)(6916009)(66946007)(4326008)(1076003)(36756003)(6512007)(186003)(16526019)(26005)(52116002)(478600001)(83380400001)(8936002)(956004)(6666004)(6506007)(2616005)(44832011)(66556008)(2906002)(316002)(6486002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: cffGynxpyg+6aFqL9I+Ir9t/uqc032fXrwgWKyWaHZ5lwdKcH77MZiAk0lXK07rTxs2B3eXoZsXsbNmGF15tONVREtvTnBM5mlEDlbFDsXZcY/1OhwcD3UYRG8/sv0cRjgsIBvq4v0sPqc2r18ZGEodDj/XIvQYnl8W3Wt/whNjdOKmv7RrgiHwDsFE7TOw86692T8L8eeNCFylTSpHMWAeWAYSbK/j3UOksu14MIhuaeL5SzrKoP4zwgTdjaqvtGWN8G8nWtX5mMnui1stpzRtpQtsLm+sBuG9u/0l3OKFgJP1MiM+7wsvn9OWr9A7bGV0ShAAB6x1RjDYYrVW8pN/739+aS9RFjDmF5ntZZ0wL6ORVmrunV/SJvftTlrGRB27Nke6IcItVPXPms6TVDFVlpZicB6vlexEmQiNC01HgH5Bm7w11ypPoiycOl4zNOhSAuhfUs6zthXdK+izfDMEbQ8dYDZycH48401nLXHpyHww2RYxUmrf6ShdlW9jM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1687fec4-665b-4fcd-cb60-08d828a2eb64
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2020 09:39:07.5474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OuVFNQq44Hfkl8L5nL1abH8NqWjzhh2xXZdtpscRoTHC936qXnTfUya9yllFbiYsC/KynioT1n3EaDihRQk2VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4245
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the xhci-plat.c is the platform driver, after the runtime pm is
enabled, the xhci_suspend is called if nothing is connected on
the port. When the system goes to suspend, it will call xhci_suspend again
if USB wakeup is enabled.

Since the runtime suspend wakeup setting is not always the same with
system suspend wakeup setting, eg, at runtime suspend, we always need
wakeup if the controller is in low power mode; but at suspend system,
we may not need wakeup. So, we move the judgement after changing
wakeup setting.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/host/xhci.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 159e084cfd2f..6e7e2419bf85 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -982,12 +982,15 @@ int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
 			xhci->shared_hcd->state != HC_STATE_SUSPENDED)
 		return -EINVAL;
 
-	xhci_dbc_suspend(xhci);
-
 	/* Clear root port wake on bits if wakeup not allowed. */
 	if (!do_wakeup)
 		xhci_disable_port_wake_on_bits(xhci);
 
+	if (!HCD_HW_ACCESSIBLE(hcd))
+		return 0;
+
+	xhci_dbc_suspend(xhci);
+
 	/* Don't poll the roothubs on bus suspend. */
 	xhci_dbg(xhci, "%s: stopping port polling.\n", __func__);
 	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
-- 
2.17.1

