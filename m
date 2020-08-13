Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A11722432B1
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 05:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726529AbgHMDVV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Aug 2020 23:21:21 -0400
Received: from mail-eopbgr150075.outbound.protection.outlook.com ([40.107.15.75]:52133
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726131AbgHMDVU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Aug 2020 23:21:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2cU0IY0jo4rroDsIWLZzwWQcJC4V3UW8w4/beQdutVpVmSF/r5p2X7CrKVZ1m1/ld/avbGyXT3zI8NZhJnaP/dCdjvLjvRbfu9BRf5CByj43ToKmQpzxWadmptTyVHDJ78NCGpAC7KEjDE3HRUP/296/PwFHFPW+PzC2Vjs+UdTBv09UW8rnfGACWsBAnY+pC9Z9E9o6vlTLL4dOtMO5eYCrb4XmkpLcxCrfC0ddnJ9KM0eP59DITQ3u5UUnQ1LDOUuG7U2BOyxXbtQPpXL2feIauKOg5tjtfD9pdcBHDlDB9AUq5WaUvSmnFdJgM+x+xuQ+DXUvyUrfu3gbEG6Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSabgFmYWfy912yNWOS/brytqu/u/afGBCf2KmieQWg=;
 b=AE+jB1UZISFZQvX+fYbIGgWsbckRHP6IVQ50voacel8NUxwHFe/bjyakaf8qd5iggOqk0i5jiC548bdbhDIXmbHXN5vu0Wcr7xKHUJMdNx3tGCnSRnNJ9jlBV8DMG6bBLgfEvs4YXDDV/Dk2JTueFjaMr2nA7Cg6v5Xz+mbY//YcQ6yw5FQXpDvcNGQZGa0FqeylBlch7vH8vawGe/73seBMKAuaEji/6k8uYsx7UXH9w4Mt0mA3fOQOPiWN3TcJ+8cDyVe6Euz49Bu2EJ533GOKbC4NuoylJdPkjs+b+JGZKisGIVL3InO/IgqhikHssR48jcUpT31Bt07MjYd8dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSabgFmYWfy912yNWOS/brytqu/u/afGBCf2KmieQWg=;
 b=dqzp7bw7CtAnBlHHfzaabXFHonCQpSlamhZCPDufzjzHHsz8RYMWgrmp6DiWimedri4EvDf2ha592JuvvOp6jcP9V3kI/0nBWWuOQAR9I593r4hlwmTEYVsGKy7JqKnstz+c0gW/nqLShvRk8m09mq+Qtm0hTAvYotirNN3Fzqc=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB5911.eurprd04.prod.outlook.com (2603:10a6:20b:a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Thu, 13 Aug
 2020 03:21:09 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf%5]) with mapi id 15.20.3261.025; Thu, 13 Aug 2020
 03:21:09 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v3 6/6] Revert "usb: udc: allow adding and removing the same gadget device"
Date:   Thu, 13 Aug 2020 11:19:53 +0800
Message-Id: <20200813031953.13676-7-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200813031953.13676-1-peter.chen@nxp.com>
References: <20200813031953.13676-1-peter.chen@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0184.apcprd06.prod.outlook.com (2603:1096:4:1::16)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR06CA0184.apcprd06.prod.outlook.com (2603:1096:4:1::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Thu, 13 Aug 2020 03:21:07 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: af298180-a037-4246-7cf7-08d83f37ec3d
X-MS-TrafficTypeDiagnostic: AM6PR04MB5911:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB591146A6E455E1D48A280C518B430@AM6PR04MB5911.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:196;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7xBHsVbx5+SwTXy51EcpPl6TKGMYEV0W573OajHiBFheTcKGvF3s6/Ic6ZsfWvtH7IUGLcV4Bo3MimSOJXZ4VskYzrtFC4+IvCPLxtTzHiOyXB6IYjbidywM1zRgNUgk95I6ZWqlIZYOlWLAQ+/Bi6+gz3+JI3jmvTSgCCNDSH27id7/IDX6Hm0MqKNNDecTVtec4RsveaP8T0lZhh3X47EHDA2mHouPVcOwJz8nNsMiJUBaKhaIPVg4V28t41BzZrDgW8vnNz79KU+pqQJvpUoGM3f7BAcqYmCQ1r7govj32gOBskohP66iW0YbpXR4ar1SeMvNva6uIVtJyJnBrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(66946007)(316002)(66476007)(186003)(6666004)(66556008)(16526019)(44832011)(956004)(26005)(2616005)(6512007)(1076003)(8936002)(52116002)(6506007)(4326008)(86362001)(6916009)(2906002)(6486002)(5660300002)(478600001)(4744005)(36756003)(83380400001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: pQaWg+8B+KbvoAp9mmFkOvxHU8Q9wbDs2kuzSKH4qkckhMgU8aUrw8EjpTNJ9YN7pINxaQFEfaikwD6ZVQifCV25zIIFB6GAtqwIyws0SLky9TVFT3s6RB+da/NkXzhKEgZhB4Ovqzts8ffi6xy18+wGDmQop/wVCu0BRrt7BsF31L7J3Yxrj+6qCJrFVF3xhaUylh+H2s1Gr0nH+lojEol/M+EWKxWIobSHv2n/JP5Fg5xKYuBEU8jl35yY2LNffuKTJlkxOJN2svqufD7ml2ubr2L65kHvlORz+OMa56Sq+6eMEtrj8iEsWQxEXTpOdpKG5U/sO1QL3yvkJa+OfdwIm/VGpKwGuvZvB1qflC17nOD9QyZVIqYZLJ9UlvQTwOjudvKkIYWa0C4o7VQFmAB3Ynuz3+VICVwgP+FDjlpPMlV9c6o1HeUz9aYMEORDRylNFSjfVo3dGtGXV5K5knutBtCyqSWiAmK0nJXWZrD6JfzgYvhDwE7gZsXaxoQPDtC6pFmK0diCNrZjgdV+c/0tmElOUQEnXL2TVBn04bIShvp/n+3LdJyxHibdW98pcd2rArYu2a+VC7xY5seJe0VoFNxdmmjzVGjQurQh7YJ3ir8Blih+eN2QfIWh3yUqADhJxI0mUZ2q3TOChMrlsw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af298180-a037-4246-7cf7-08d83f37ec3d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 03:21:09.4936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sk3HqJn+RZsvrEbbBrOgzWJzwL5tKQYekiLTpPKtKORMDbXkyFD4wo1i8eat2FJOSLzDq0nSP8SJaR+ZTzPslw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5911
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We have already allocated gadget structure dynamically at UDC (dwc3)
driver, so commit fac323471df6 ("usb: udc: allow adding and removing
the same gadget device")could be reverted.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/gadget/udc/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 2b6770d9fb3f..bf1b0efcfaac 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1389,7 +1389,6 @@ void usb_del_gadget_udc(struct usb_gadget *gadget)
 {
 	usb_del_gadget(gadget);
 	usb_put_gadget(gadget);
-	memset(&gadget->dev, 0x00, sizeof(gadget->dev));
 }
 EXPORT_SYMBOL_GPL(usb_del_gadget_udc);
 
-- 
2.17.1

