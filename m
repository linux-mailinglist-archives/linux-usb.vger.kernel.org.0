Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 327CD1CC702
	for <lists+linux-usb@lfdr.de>; Sun, 10 May 2020 07:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725907AbgEJFam (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 10 May 2020 01:30:42 -0400
Received: from mail-eopbgr150055.outbound.protection.outlook.com ([40.107.15.55]:55168
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725846AbgEJFam (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 10 May 2020 01:30:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvCCMlr8UjDd3ILBW4OMdjJmFzt4BMYR3HKhMDTF3h9T8eFo3TwnErLo/pQEo7/NaNhr2EScWi9hGbIUYbV1VcILY42hinshWPJGb5MagpV1q/MhcRGRl0W6gVLoI/vWTIxpp/nJCh25gF/T4zE/GDmTjwi9xc+7ERTP+rbNiRjnCEVfSDReNlJUWN1F8yyfHpXTwx4gSv5ch8hqqC9zXZAXjeUXYo+J3YcS+XbWbhzfJZDkDEZldzL38JEPc6HCl3EWqAwHBz83xOvqA79UrI1V0qVq9TxpVw1QJOkQU+9Z5LFrtNHjOAyv3x8dzX+joJkEq0h5T2T1IUl7EgIMlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CCgWA2vpY0XbEox5KTOjUDHcFrH4YeBoxHDcXruk3Q=;
 b=mP7tQ1QoJpXlJw3XM5vqv5OEVP3zKuNKiumDmaSH5Iifl3yn4FYygUYl0RCmNmxt35JvP5ghx8Uex1pCAGmSCzfKFyBa1+62IvHujGJIF0JY4kPNhl8Kzqihe8uuVlkBKpTktpVaGRH4tJbN9B7G9n6wd/2dZdfRjye6iRv28LhGDoyqd5hdLngq5HrAa7/NeI+Q9unJCi5ZsqZtKmE21drIdtBAZG+Y452fxyhyryUO3Q9NqjKmDBAcMUqCbuLo3q9YSumUzhBuqb9Eo4kCSzot7I6SDgaGtsh9UBPBkFG1uzpsbvxdP5MetLA5PzUkJzrJYLGBp3W1ixT9I/CU0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CCgWA2vpY0XbEox5KTOjUDHcFrH4YeBoxHDcXruk3Q=;
 b=crUSsZxDpo1YABZ4JwHsRvynzNFBpPl6VLCYdeLA5GJPLGoVBdpDox66rjhGgy6Z0b6D+s6Hny0gvNfV+m2IKNuYBha5CA4vChWUbuLNp5yjYX5eHs/wl4fca2+97yqlz4mNlUSuz59wjL/z9e1aSzHrNtkw9jY86042zn2BYsk=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6821.eurprd04.prod.outlook.com (2603:10a6:20b:105::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28; Sun, 10 May
 2020 05:30:38 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792%9]) with mapi id 15.20.2979.033; Sun, 10 May 2020
 05:30:38 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 2/2] usb: cdns3: gadget: assign interrupt number to USB gadget structure
Date:   Sun, 10 May 2020 13:30:42 +0800
Message-Id: <20200510053042.25994-2-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200510053042.25994-1-peter.chen@nxp.com>
References: <20200510053042.25994-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0204.apcprd06.prod.outlook.com (2603:1096:4:1::36)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR06CA0204.apcprd06.prod.outlook.com (2603:1096:4:1::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28 via Frontend Transport; Sun, 10 May 2020 05:30:36 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8df49f50-200e-4a74-c1e3-08d7f4a345d2
X-MS-TrafficTypeDiagnostic: AM7PR04MB6821:|AM7PR04MB6821:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB68210017B688C0BBEF854B7D8BA00@AM7PR04MB6821.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:361;
X-Forefront-PRVS: 039975700A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rjcFDnVh9cof3ydOu4CKW4YOxyuBvrnb1I3uZ9I/g5xBaqICtagzYYhYMW0f+4JI/sCJhgvC3IQ2c4oBCGxsQcA2qW0DHAloKGfQrfLRVrPR4Q4vW4js2QDWxkyxkAe24lgg1643XVTkDzaQauoMWPiyFFHIMeDUQ8q+Ze5+mA4hafeWbpMrmozqdJ6HlPrddmogUrP7w0tTZQ9fTFn6KVmWwjYVye/d6Ylb+yDeyW8PRDqSnK8ywQZSZ7M5rcKGFuBj4AFOTdZft3f2taM1f6fFxZc+YZJmcBIwPC9BWZ7NcVAyIYdtuZlmkG3NLacBihYgsoFO/Q+Wg2G7tObSZH70T5B/IcqChiJmkxr3UZdC4RY60gP+Vdw++4koasQYPGDjz+lrfjhFC5EqwohVPuWOBiRowebJMt7CuZeCgJARr0UkaJmbydtML7xB35rS/cJHdvYnWwDkNYZlpInVy65S1F8yKngBTMkwSg3dHSTY3etFZTkMxuALHiGNWGNSF1paDnzOIlNBb/fDQgNeFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(33430700001)(6916009)(478600001)(66476007)(66556008)(66946007)(316002)(2616005)(956004)(52116002)(44832011)(36756003)(8676002)(6666004)(6512007)(5660300002)(33440700001)(4326008)(6506007)(86362001)(8936002)(2906002)(26005)(6486002)(1076003)(4744005)(16526019)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: kEiwHtzin2jI5MHVNjY1J8FhCyp5CjF8XHppn3jOQl116XP/ud7sq2espLM0+FNyrToYisXHkcwv7JvXb3kjE1nr5hZyEapaUAvOKcNw/PtiDhs/lNTDr9lnI4FAmG/1iZ66iQTgL2oJ49U9OHJSqzfOKn9xGzInxLPavjmoLI5TOPKoT+AWNTwx8V6EGXywp+B5KtmC6/aEPMabInEWwCzVpXR6qwHhJz01T7t3T1Se7ZG7rUANfV3d/m9L/7T2GiNtM8384RzN6HqJPNa/lfq9Z0NuvjqARiOPEiJtpd2hGtGmmBh8XIirEQWEJUZI3MZUX1SaP/EC9lUANOujhyCjBtdLFcC+qAky0lBnotukDcDk5Gb+1njiSy2LMg3XdSG5ZbrD2/f6vds7Z8Ja9kYFniRAnS6Rr0laIGKxIAIT/PGwZJAiUUpQHCRFb94umfMecOICiNSGzHY9xJstjJKP7Y1ogFR7zP/f8RHSvxY=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df49f50-200e-4a74-c1e3-08d7f4a345d2
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2020 05:30:38.8045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mq7uCKz70NcbS+7+8/0geO1IrzvD9+YO6RflxOVY53pqpDtrRoVzZNrmCXpgEEYhourX58AnRHEg68AH3cv0Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6821
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Assign interrupt number to USB gadget structure.

Reviewed-by: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/gadget.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index c6908374232a..2cee12195978 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -3073,6 +3073,7 @@ static int cdns3_gadget_start(struct cdns3 *cdns)
 	priv_dev->gadget.name = "usb-ss-gadget";
 	priv_dev->gadget.sg_supported = 1;
 	priv_dev->gadget.quirk_avoids_skb_reserve = 1;
+	priv_dev->gadget.irq = cdns->dev_irq;
 
 	spin_lock_init(&priv_dev->lock);
 	INIT_WORK(&priv_dev->pending_status_wq,
-- 
2.17.1

