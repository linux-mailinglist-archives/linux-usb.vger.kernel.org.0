Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B0EF2414C0
	for <lists+linux-usb@lfdr.de>; Tue, 11 Aug 2020 04:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728122AbgHKCB3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Aug 2020 22:01:29 -0400
Received: from mail-am6eur05on2066.outbound.protection.outlook.com ([40.107.22.66]:26904
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728080AbgHKCB3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Aug 2020 22:01:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VzStihqdbnXstvjinjLc5gPXerJu5PQfJ/V/kcWBGjHGW06pnoW8rWEJcbh76QB9Nu4GjvsayFRRD7dJLZZrcXkRjsMJlfJ5lo2fp6z9qZEaelWg6SAHncMt7JpQ2dX7jPqVnWHRGBn90T371HgKaOTFGKbS04QRM+vxPPVoR/F0G5kKBrXFWWV2172x9CuiSxP2h31lIvEKl0YHecUCVOZ/UOUc1S4bC7XDj7gglUF4EfBRWSyp4iuSUurd3pJ8+L+1zuERO4E+3nzjjiwkJK2kA/MXadaLfITSeMT4SIh1y6eblrkpLdbh1L9bwYYAIeXjyZfAN+pQvzzziRY7dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HdZ6mBswAKaryU1bIl9VczT07vTRpeQZSvib0zVDiR4=;
 b=XMFwmXEQGJmGBsB/91UdL4RgcvYH/78Us2ghgUyJ/1bJk39LCXRR2EU9yEz/ELFFLzVTIOexQrfYsVuDI9mpc7kk+tpPssEKzosqWCXDabB7KTtAxxr50q7UKqX1CUMvnKycjnYSe8eCM+bNb5BPW5OtU2j9L1Zg4HbdjtiVBA1vuM/zZqv8jfE2J9hkDZ4aQAO+IjrCy3eOXgVNvyCJ6RGinDtZZzZ5ElyATaQzjhr+ODECUTJ/iRYo9rZV+KT+ODkRqp+UlRyuweqDfY/dV1GPMjOQMMXsyI2NK43j38TcyVAKb/QGS/MGvulsJVuJvGAmCnLu0n92wIq2i5Bn4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HdZ6mBswAKaryU1bIl9VczT07vTRpeQZSvib0zVDiR4=;
 b=YQy13Ob18gkj7Fo/xZoQ9kzXWOP2WwE4otCWJCtYK8Zv1LUs7bC8pjxTiBAVCbPqp/P3zbrHJZ6FmDWvcdIYK6Y9totKjTWb8SAh/y7qAqTYBQvqUeO05e/Ct4eCR6oA0gVgPDZbMoe/FowysSniD4ANcMR1s2jYKyCpkQkkncQ=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB5494.eurprd04.prod.outlook.com (2603:10a6:20b:9f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16; Tue, 11 Aug
 2020 02:01:25 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf%5]) with mapi id 15.20.3261.025; Tue, 11 Aug 2020
 02:01:25 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 1/2] usb: gadget: core: change the comment for usb_gadget_connect
Date:   Tue, 11 Aug 2020 10:00:25 +0800
Message-Id: <20200811020026.25157-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0123.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::27) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR01CA0123.apcprd01.prod.exchangelabs.com (2603:1096:4:40::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Tue, 11 Aug 2020 02:01:23 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4c3edfa7-8433-4479-6086-08d83d9a73fb
X-MS-TrafficTypeDiagnostic: AM6PR04MB5494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB5494BED5C68BCD6FF52058AA8B450@AM6PR04MB5494.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TsPl2h3PkE6iJDm2DMBmv0DceKtYRJiv1bQZnADcGdkvaiouj5JkVACVdCUJpRlxvvXSO7FaBc6bXFPYjTHj1BgH9S2VEbYHR4M4Suj359pAT+q0dykuAeUN9aWkGApGhpBj3Ew91L1FDYUj3gLXsPM7wpyDulJ+Dh2UtXly/yF5Jsnr5LCX/Vp4+ZUCISQSbpPD7bOIARQz2l8fou4ZfgEMXL8Pas4+6MVdQGS7RP9eOljXwMdSHcaA5hHdjJxCbeYSFFdtZ2dyvAjepjZ9RUDUXVR89t1AVu3Wrp5b7FHGLFZ7H4ZT1azGMgIp4X178NeYdcxEqo8q4jl/KbhjuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(6512007)(86362001)(6506007)(26005)(52116002)(16526019)(6486002)(83380400001)(6916009)(8676002)(2906002)(36756003)(8936002)(316002)(66556008)(44832011)(478600001)(186003)(5660300002)(66946007)(2616005)(956004)(1076003)(4326008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 7y7Hx+o8QVfrcHiOn10yhb3Ulp40LwV1aSLPE8ZFzex+icEriRhUZGINbjG/K5GMxitodEKhgULaIfg0HNbYsOhx73rrdFgDqLFlWHPvIO9r+WFXspKN5aRV/Yk7TqHjE2220weQ8CcKvdzg//FCnGqRsCXrQgUccmfqjZtteKF9BP59nWaclGwqG04rJRgScF7faf62EzqLcDl9QOlP/GLFCI2U808dGbKozASbCmmyvCA18IHXylMBpA7Ea+0cU4q/nJoqY5eSH2EknY/L0WhwBQ8u1UYHmYfD1fpfaW26BZeEodwqDQ0Bet1DbI5Kbr2ZnPBs3OYb9LTsiCD91IhL36z61/755r3+HlTOGrNtb1spWGfg7aSr5yG/P03fK2CJXwhUBZDf4oqufKBtCkyozx7dnGhhFh0sddejmQmtKV0dXCTt7px3D6zV+kR/aaNB1li9TkhE4WqugsVc8h2TqurgSfAPqhnGf5e/3++lnk/hei1gcyiLAu8U/TBgMZvopK7nbn0qGolyKC2bmFSrC5oCxbSCkVUAAYvKbGUnmzyuwsYUYCm+ejERGfHEKIPZgmw38LrFj2k0uGgICEwIcYdIp5UszFTNPIpfa/Tksaw3JD5KMZ0W2PgC2UahLdj2YYQf2L9AvaTvp/L01A==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c3edfa7-8433-4479-6086-08d83d9a73fb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2020 02:01:25.5128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: htfUQRUNo7L8/fmBoImkiUgHNMIfb+eYwfOJeX3LdIAUn9fRZkoKe898qai4HAga78LPHs6GXoas6shheCwxyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5494
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The pullup does not need to be enabled at below situations:
- For platforms which the hardware pullup starts after setting
register even they do not see the VBUS. If the pullup is always
enabled for these platforms, it will consume more power and
break the USB IF compliance tests [1].
- For platforms which need to do BC 1.2 charger detection after
seeing the VBUS. Pullup D+ will break the charger detection
flow.
- For platforms which the system suspend is allowed when the
connection with host is there but the bus is not at suspend.
For these platforms, it is better to disable pullup when
entering the system suspend otherwise the host may confuse
the device behavior after controller is in low power mode.
Disable pullup is considered as a disconnection event from
host side.

[1] USB-IF Full and Low Speed Compliance Test Procedure
F Back-voltage Testing
Section 7.2.1 of the USB specification requires that no device
shall supply (source) current on VBUS at its upstream facing
port at any time. From VBUS on its upstream facing port,
a device may only draw (sink) current. They may not provide power
to the pull-up resistor on D+/D- unless VBUS is present (see
Section 7.1.5).

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/gadget/udc/core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 43351b0af569..0df73ac28c93 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -659,8 +659,7 @@ EXPORT_SYMBOL_GPL(usb_gadget_vbus_disconnect);
  *
  * Enables the D+ (or potentially D-) pullup.  The host will start
  * enumerating this gadget when the pullup is active and a VBUS session
- * is active (the link is powered).  This pullup is always enabled unless
- * usb_gadget_disconnect() has been used to disable it.
+ * is active (the link is powered).
  *
  * Returns zero on success, else negative errno.
  */
-- 
2.17.1

