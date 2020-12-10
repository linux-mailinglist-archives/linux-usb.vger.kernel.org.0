Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16E972D5095
	for <lists+linux-usb@lfdr.de>; Thu, 10 Dec 2020 03:04:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727135AbgLJCC7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Dec 2020 21:02:59 -0500
Received: from mail-bn7nam10on2059.outbound.protection.outlook.com ([40.107.92.59]:24800
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727179AbgLJCCs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Dec 2020 21:02:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENY72qw/O/GCDHN5ZIWYfUW2usv42oOl+YjaSf4WEUVMJVos6Jhk5mw54eQI0CriT+k+gHcRreVpKUDkiiIZpjADlEbOyMtpVeP/GhMBrkXDxRZY4qGDZYmRz7QRjYVE9zJC9/BixbMxxxt7kM2KhXFyAglxtX8rHj7AUfa7Y2ituBBGwhNIGaVVv87Qdoxcmksu9VpWI2Tu1wLbWWAb1SBuupJ+pWlktE/mJ5+SDqKQQ8AUs6EmVCMBku1oRuziKhFmujPvDgq6GQAx0p/75prFpf9DthiCfYOR47YjU63TN7P/sdkeVsBWQ4Ye+T9+m73C5LCj6E4h2oXTh9rEPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERq8AC9k8D1X8Ipjt2OXNkEvLW8Dk4nubWzinh5JwQU=;
 b=EQ8p1Vw9XRFFetGaApPkj9J883yQM4b/sgb8/FB2PyPzNu/OKuvQNPmZa6TRCLnhDw8+U19qy5Zg3E4wYm8KZ083HkChLFIzbnyIPDEfibLzZxhYXXa1oylzp83WsaFKWCo0JIIRWi9st/jGa3i6smYywpBpaVQnu/52p7SxpinmlbCK1LPYsiGFOSYLUG4iGpWyFkw7BeKAIwoYGzT8q4IgphtHTyYc9XlTktu4tAkL+migx31i7WMXHu9piZBoe+bT9fu5F6PCdy/XXq2nhBROJYq5t4obfGAys3aQfYDc5sLy00JrzBcn4KsNNwF9RMSl1wprR/zg1PPAAnx1pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERq8AC9k8D1X8Ipjt2OXNkEvLW8Dk4nubWzinh5JwQU=;
 b=UqoDR/0BmlVjojI3MDyic4IHWDsASLtLNBSBLlUO9TSoEmjQt1FzZzZp1G9rYFoO1cwQiZ5Y+V9XX37oPTBTZ41r8QhiyWc62Ca9Unptmfh+YoKXBz+g4fX2E+JjJxcCRierwGYhH6KN3HOdb0hW+MqiOcuY0kt8KDRXr3FJm5M=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=windriver.com;
Received: from BYAPR11MB2632.namprd11.prod.outlook.com (2603:10b6:a02:c4::17)
 by BYAPR11MB2838.namprd11.prod.outlook.com (2603:10b6:a02:cc::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.23; Thu, 10 Dec
 2020 02:01:59 +0000
Received: from BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::94a4:4e15:ab64:5006]) by BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::94a4:4e15:ab64:5006%5]) with mapi id 15.20.3632.021; Thu, 10 Dec 2020
 02:01:59 +0000
From:   qiang.zhang@windriver.com
To:     balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, peter.chen@nxp.com,
        linux-usb@vger.kernel.org
Subject: [PATCH v2] usb: gadget: function: printer: Fix a memory leak for interface descriptor
Date:   Thu, 10 Dec 2020 10:01:48 +0800
Message-Id: <20201210020148.6691-1-qiang.zhang@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: BYAPR11CA0048.namprd11.prod.outlook.com
 (2603:10b6:a03:80::25) To BYAPR11MB2632.namprd11.prod.outlook.com
 (2603:10b6:a02:c4::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-qzhang2-d1.wrs.com (60.247.85.82) by BYAPR11CA0048.namprd11.prod.outlook.com (2603:10b6:a03:80::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Thu, 10 Dec 2020 02:01:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7778d7b5-2fe7-44d6-9022-08d89caf9445
X-MS-TrafficTypeDiagnostic: BYAPR11MB2838:
X-Microsoft-Antispam-PRVS: <BYAPR11MB283859A0D069EDB9DA1884FDFFCB0@BYAPR11MB2838.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GVvp6p5IoeGLhW3Cln5GSujElxkk1lTCXdwPdtZKx32wv/+CjvYgyIhyAHsGmRuwdhGCpPmDSWQWBcDn6fXqyj7FR/9TzSZD9H5YKw/IDihhnqsnTmNNwDX+OGKB35T4ibRbcJEn1vX30mv3XMwG+ZEoULmakl23i4/T0nCWtPeOIuBZGw0df6d3vQodEHCU5i/jIup70Vrz6YNEpqzw8tHntHfyb5mbzCuUnNrej2Bcl//GvbV+sMDQ9SsN9mPkNkvuZdkfJs5NskShOzq6ZUTfNhwFu3IqQ/NDXy8luegow0i9l+yP3bP4ecjYRsfkpKaxvNFUMt3opfC3hjAomzElHHj8thNFeAZktZ3NJwTRC/atbw3kuXwDUDFlRA5G
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2632.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(366004)(508600001)(4326008)(34490700003)(66476007)(6506007)(66556008)(36756003)(9686003)(6916009)(26005)(186003)(6512007)(2616005)(16526019)(956004)(4744005)(52116002)(2906002)(5660300002)(6666004)(66946007)(1076003)(8936002)(8676002)(86362001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?fgOvfDeNFYwLZh7iP5MdgE+U31WG5a0JJTo2+R2dOLFhpN8w+pOwTrT4fEu0?=
 =?us-ascii?Q?KC1ui4w9JSFFN0mZ49PRhknXrwwkD3/Z40dP/Qt+s31KYHdI8VIfVpwAvaIi?=
 =?us-ascii?Q?4m40jLV4Apg3Yypisogl3/DJ3vAz6sRcindH4NQcChFT78zZOEIFEQUsQTHU?=
 =?us-ascii?Q?QhlGLBHrhkge+Rmb5dNoEN0bmKZk6+xDZElW/TxFWGoicRwLAo5TJ8VO1fW8?=
 =?us-ascii?Q?6KV140bVNdvbNWSU3cvq85WKOWfDdK28gZy1P9DV2kdYMX7P5wbKeU7bnOVJ?=
 =?us-ascii?Q?98RnQp6CujtgJP86qvZ2jvzufryw2485L03BBecbr1nr8jnOuYTxeHQKHUqb?=
 =?us-ascii?Q?KIlEPzFglOh4XloIKpA1MoCCE32Uf5M5YGjcY9fWXDkgwV5T5ElIm6bVf2uI?=
 =?us-ascii?Q?MS+rt/Hzm8LjBoodAixhCcqct/NTc6Ujlr15t+rlB29Rk9NQe1ggfciLjU3u?=
 =?us-ascii?Q?252/IgNk33zt6J7ulKzhY8r1cslJdgelzUuHLvveRqcp766nnxn6C7242jw2?=
 =?us-ascii?Q?sSWh5c3tr7ZUhDk7v5e0jceXucGAO4qM9Vm9S4opqNWKFYuWdmF6TNk46cpI?=
 =?us-ascii?Q?+7ise/fk4BG0OS1ShyEhwiaORK3JFHLWJgjJPfc0Hk0ss8zBIrjAKZfwqPy3?=
 =?us-ascii?Q?KU1DGzH2bFqywrlwTN1NYfbpS9k/uVVlCO7ck2f1yFYhe80dog73BbBTapcc?=
 =?us-ascii?Q?Kptoigu/xq6axnR/QksXRN8mhnNA4r4vYLcSXTNVAG3Er+KsH1xl/tALR+8B?=
 =?us-ascii?Q?FyEBDZN/H6t7SgsneTjagR7BqcP7w8UCyKgeUJI7edlRHGh2khulHdBt8ZB2?=
 =?us-ascii?Q?cMPp5A5YSca3tiFdLpWxTbmlUVcO9ZjOiMB/RztIw7mFdDHlMEFFgOjDNYiQ?=
 =?us-ascii?Q?RO7eksOXI3sozIxdxeI37+Z4Fa4nFAl2Zc//b4zEc9rlrGSkqlgzKtIGX1PH?=
 =?us-ascii?Q?dz5d2WqWvUBhp2hcs/psFsKDWbNCnayD1OxFUHTdEzpCL8VODj8vUVxoB7sj?=
 =?us-ascii?Q?zhIj?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 02:01:59.1723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 7778d7b5-2fe7-44d6-9022-08d89caf9445
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZqI1sHSiL+RocSdZuvcrb7W0sSfhiMhqdcBpMmlk5O0GQFcCMLSJwyV39cGrCvnTzvLVKYk0zrSkBrCDFxSuIWiNzWOdZYqnn5Sx6QS9/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2838
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Zqiang <qiang.zhang@windriver.com>

When printer driver is loaded, the printer_func_bind function is called, in
this function, the interface descriptor be allocated memory, if after that,
the error occurred, the interface descriptor memory need to be free.

Reviewed-by: Peter Chen <peter.chen@nxp.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Zqiang <qiang.zhang@windriver.com>
---

 v1->v2:
 Modify description information and add tags.

 drivers/usb/gadget/function/f_printer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
index 64a4112068fc..2f1eb2e81d30 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -1162,6 +1162,7 @@ static int printer_func_bind(struct usb_configuration *c,
 		printer_req_free(dev->in_ep, req);
 	}
 
+	usb_free_all_descriptors(f);
 	return ret;
 
 }
-- 
2.17.1

