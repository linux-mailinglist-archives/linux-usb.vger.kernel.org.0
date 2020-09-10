Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B25FD26410C
	for <lists+linux-usb@lfdr.de>; Thu, 10 Sep 2020 11:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730150AbgIJJNx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Sep 2020 05:13:53 -0400
Received: from mail-eopbgr40061.outbound.protection.outlook.com ([40.107.4.61]:49482
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728443AbgIJJND (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Sep 2020 05:13:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vl1QAt1craqjJejf2PPwEP2X2ZaR7smpMbh5pDNULfhkH7Tu7QFL1kq01IuetQav9rSX6HLhf5Vx1gdsHPxxDZmBxxbKXo8zctx536r4vEynMHC9wTHq2Un53p8Ko7ItjLEhjmy5Qn6PL7fGEmYFdNAExhbFh7blGazb4I0eXU2qJDAI0Cgr8OZ3tqQaFyNIowf3G6leLGsZilzDWqYCZovWcdlUAJftTZOnNE4/KwWxArP84BvUxOkb6lr0TNlMXimeYWVuh7BkaZ9EDnIuFNW8SaBs4rpKXkjcywJUEhaV05ERYo8W+PhNktd+odCb7IrUu1NiEUGr7irNu9KOgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W4TZoScKIhA3wHDVBEv8t+9wFAZ8+SpzlYPT4lZ01TU=;
 b=K+22WNJAtSM967OJlvxhdcfpflrJvTCA2PD5NZ923qWk8ix+TGgWksQe+YAQIB8NLimheOS3qt0hfag5FDuCSUlq/hzn5KjRY+wW9rWIPrjprtfm7H7UKG3wAlZhTEei7MsICcyx2mzEos7HlNIXD1vMYffgsiu4Zgr87zXron85JzLJ20GlX1IuX33TarlSgVdp4DqSJatDu0VpufgN6ZR49lnD9GAVgrKkOoLrRG4M2SMW6YRUl75F+fdRCcVHn3agZjHVummELSuirgH/2pCDA+o+VBPGH2v9XS2RE1EuZ+5oaJbwImtyi8tUEQyW+M4Yu3vS9fGAECiFCTBt+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W4TZoScKIhA3wHDVBEv8t+9wFAZ8+SpzlYPT4lZ01TU=;
 b=JIx/WF81EgLQyOdXDQc0tuD4Fm91cCKeWbuS4sFUC5tICQZoaS+NgqQMXf6/N4f+wNoR57dxa1OgMBam+0JZDk36W+/nOEaKRA3egiN+5HpHqRPXFJbUu37z4MpaZtZ/3spnQDIlrcd7AgS1wXF4Y2eLoS6XOslRzOTd2a8AE8s=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4168.eurprd04.prod.outlook.com (2603:10a6:209:43::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Thu, 10 Sep
 2020 09:12:25 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3370.016; Thu, 10 Sep 2020
 09:12:25 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 4/8] usb: cdns3: gadget: add CHAIN and ISP bit for sg list use case
Date:   Thu, 10 Sep 2020 17:11:26 +0800
Message-Id: <20200910091130.20937-5-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200910091130.20937-1-peter.chen@nxp.com>
References: <20200910091130.20937-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0134.apcprd06.prod.outlook.com
 (2603:1096:1:1f::12) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by SG2PR06CA0134.apcprd06.prod.outlook.com (2603:1096:1:1f::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend Transport; Thu, 10 Sep 2020 09:12:22 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 78376ace-9890-481d-203f-08d85569a1d3
X-MS-TrafficTypeDiagnostic: AM6PR04MB4168:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB41688F4EE8864CA927BD061F8B270@AM6PR04MB4168.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:327;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AAnWt20YAS6ok4HbPwlzaixkoFfa/DVIPJrpuIhYIaPhuZUS3fGcZRCgakDU7bKjx1n3MtfoYk3j1TrI6tETMcXPtPXB+wjdZCmIHv9IGDE8SiEF4ovVpP22ovS2qIaqkHkKn+URu3+5GqsOe5hZh2Wrvj5FM/wXBjcZsA/WM23voNUxvNbnI7O47c4vtKVPa3RHOUXv872jGc9IFsySert6eVTD0BI7wG8fFbwhfpT+B/Ps1cm+lakgFh50zz33JWf0yu8ALbr6unECYjvSlvWlIUJl7HpE7xRjLDJuh9PLgHrQcAOw+bq0zkQbW1xpInKTN6W9Fknz/Pp5A2UAaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(4326008)(6512007)(83380400001)(186003)(6486002)(16526019)(36756003)(66946007)(66556008)(1076003)(8936002)(66476007)(52116002)(26005)(478600001)(44832011)(316002)(2616005)(2906002)(8676002)(956004)(5660300002)(6916009)(4744005)(6506007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: vMRnL6mxk22qRSQxDUUhSCV5xvbjSdGzn0SCEzx4FPOhj8dOR8AuZ+Ix9g2WKpFP+uLcINptXniM0Mm2lr4f8mcN1uFtS/fEehuwun/sge1dNDxYv8Lhl+AxMDip+BGqY/3S7ByQXr7gUsfXEcOKbnxYZvThLgCqpUjC0rsD+InWvYvio1JGTIcjAxgPRgQ7u4FGrLySUeSdMMtKgTgAV2vj0EcAGRO/NBrPdj2cXy22lpfe5lOyQlLqqSFv5iWSDG2euheMVn3BspFKq9mo36F6ma5GZmlQMuX72q/XIipgb5fxrNvh3hz1TLixgap0olLXi04ttl/EspGmw9AbSqnHEB1h9V4qlp58nqD2v43Lil6Nnz4yguVnHrwVzDK8VvkFIYMkGuKKw3PQVynj0eMGcP1TEJZXmPm3tCQdePveLwogCERfBB123JvN7YMTyGiC0qILPg74UEXMlBlKcgdtAZN/WMaK1KAtb71+oKdy9MlpX/Qa/peJ1wchJzkPx/NvUbU8qMpqJUaE730mWZGcKtTnOg2HIA4PdSr0u8X8LRTSpy5aAJgLTazSs3bNp+76SS82+obPa1y1YmqX58T2ZtXqeZ2e2nHS+n5F5OvWqNE84lxMOycKVQaY5Sb2iSUcoPZjMxzeRpsNeup3dw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78376ace-9890-481d-203f-08d85569a1d3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2020 09:12:25.0717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/diTPMN2jnaA6Pw4DIls55LHs2QQm3e/E328q3ezpGowcLNirkzy85db7Kb77vQTWTQJq3MIwYpRXRuujUktA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4168
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For sg buffer list use case, we need to add ISP for each TRB, and
add CHAIN bit for each TRB except for the last TRB.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/cdns3/gadget.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index f1626df65255..1df4ee2857e9 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -1220,8 +1220,14 @@ static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 		else
 			priv_req->trb->control = cpu_to_le32(control);
 
-		if (sg_supported)
+		if (sg_supported) {
+			trb->control |= TRB_ISP;
+			/* Don't set chain bit for last TRB */
+			if (sg_iter < num_trb - 1)
+				trb->control |= TRB_CHAIN;
+
 			s = sg_next(s);
+		}
 
 		control = 0;
 		++sg_iter;
-- 
2.17.1

