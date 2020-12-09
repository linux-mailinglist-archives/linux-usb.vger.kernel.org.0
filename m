Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3BE2D3913
	for <lists+linux-usb@lfdr.de>; Wed,  9 Dec 2020 04:01:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbgLIDBR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Dec 2020 22:01:17 -0500
Received: from mail-eopbgr770088.outbound.protection.outlook.com ([40.107.77.88]:19183
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726931AbgLIDBR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Dec 2020 22:01:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BBq7hYkOvuWwx7XsvGberdleANMfo0JCe/EUmj3nOaAs5J6jy2aQuC0WnxhbK/5HS95QgtLfoMKyfxtZt0Dk+XUmG1UNfqkaKReieKSnkN7tlLr6gClIyXOr7mvQucqcgmHGHElwOdYQUjecVH+cMzbJMzFVSBah/z3o3LesupDkBnXOXUeFPP6Vb+9VXqNsllrjJwK731LB6qc5tlBZdi+zdOGO65qISi5jiPYP117IXQcNMmZwUUtkRjQ5AV7xyAsHtUdPrUwDU/AIgghNU6IsE6qm8o1nZosF/sB2fOJjgiLZVvDMHhXqkybtcRQU+8TCe6uRlQSHRww2juvYuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TwpLxBCJcAHYnEDVJXmm16qsqenV2g3ZfCTT/i+jWAA=;
 b=Z4TdnLIeZ827kFD2AVxdWBeyiFGpQkh5dQzTsEU0hDaPvXh9M5nmCjq8qKIJlgA6NYtBTFzQWm5L/fu3cIoSK1IAd2ldR7XDF9dlbli9TuGsumtUt5L6suJLSLlkgu268Ssg7NN4LjO5IaTyH5jxujKlIStQoSTc98u4P/FOk/RaUoOzWXYGaN3flfAtk8nyD7JgphPdveJyyLbT9zl5Qq34dmkvcfplO8JLY2IQunYWm4L78xjP+XeI+hWaUPx3ws/fTTqem4Y0pfLmCM4EdcMkhYdZiF5YXZiY5hCyaPKjmFddZpQultJE5uvk3IQhigKblR88CFWhmFV5cJGIRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TwpLxBCJcAHYnEDVJXmm16qsqenV2g3ZfCTT/i+jWAA=;
 b=jpYIfXkdcA7c+nRnxK99sRMgP9MDuBAGyAl8ZdpjcBOFhP/bNA98Wbfbwbx4JEHdLD87Duj9hhezafZ9XFfDIc4uOo4FL4XciLLfYoJUGZDtLMUajvtxq2Y9JVEqfGFjIsvso919sZrLYdUbTo7a9NNftKXJ1SPlrCfdl3uNlL0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=windriver.com;
Received: from BYAPR11MB2632.namprd11.prod.outlook.com (2603:10b6:a02:c4::17)
 by SJ0PR11MB5168.namprd11.prod.outlook.com (2603:10b6:a03:2dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Wed, 9 Dec
 2020 03:00:33 +0000
Received: from BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::94a4:4e15:ab64:5006]) by BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::94a4:4e15:ab64:5006%5]) with mapi id 15.20.3632.021; Wed, 9 Dec 2020
 03:00:33 +0000
From:   qiang.zhang@windriver.com
To:     balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH] usb: gadget: function: printer: Fix a memory leak for interface descriptor
Date:   Wed,  9 Dec 2020 11:00:18 +0800
Message-Id: <20201209030018.6001-1-qiang.zhang@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0011.apcprd03.prod.outlook.com
 (2603:1096:203:c8::16) To BYAPR11MB2632.namprd11.prod.outlook.com
 (2603:10b6:a02:c4::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-qzhang2-d1.wrs.com (60.247.85.82) by HKAPR03CA0011.apcprd03.prod.outlook.com (2603:1096:203:c8::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.8 via Frontend Transport; Wed, 9 Dec 2020 03:00:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5111f33e-a01e-49d2-b163-08d89bee989b
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5168:
X-Microsoft-Antispam-PRVS: <SJ0PR11MB5168B7CCDDE80A82250AA77DFFCC0@SJ0PR11MB5168.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rdllHvRuCklW68tenpbJP2Cuak1DG1IiqUAt2Bk2qBsLeKmLoBDBjs33jrtKQRBnsXo8EfSE9XznR6tA6ycb1fUtvEr8L/EZ1n6H1X2UafAWLnpXegE7S0rwPMeTjkJDVeDjXxuqEvVNrjRhaxKcS92cjhj01GGyuqt7WoWCgh3tBwMtR6yef3N0Dc41cBcptspiI1mpyJqgNT5pxKTUp1F7Yk1bcmZicuIAb9iqnSosfssveVMuwcJvFba1bwUuT9XYavne9xlTvPZFFU0TLFqfpvdlkPUIwMVEezcHEnzKI4YI3uXvU+mG9iFWp/t+OaJY7X75OU8mQL+N2ZBMiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2632.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(346002)(52116002)(6666004)(956004)(2616005)(508600001)(2906002)(86362001)(4326008)(66476007)(66556008)(66946007)(36756003)(6486002)(6506007)(16526019)(186003)(26005)(8936002)(9686003)(6512007)(8676002)(1076003)(5660300002)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?x2bRkX0HeHq0n2IvjM5CBq/3n64ZBXkW3zRO/NOpmSnzujj78+GKIxwB1GJO?=
 =?us-ascii?Q?Cd0DsPOpXUOeO+t70b6oGe6Ls2rgMOfT1D9pxPWkU6NR2XI5fikFl6gx/2qT?=
 =?us-ascii?Q?dPV+zcXG7lCIIaRMsze5FbzWN2vtk+c49Wztl+AKUpCoMJ1aKR//jafKcShB?=
 =?us-ascii?Q?8L6SLOZhEOdhRGvOKJGXpr1gQNb1mH+yfYSwr/P1dM0/29e/XhLazW/YdVrA?=
 =?us-ascii?Q?demYak0dhFgNbjQp3VbfSQPzOEyRD/YL6eSVo5rM+b0ywiHz3w6coNeW1MKx?=
 =?us-ascii?Q?bXYNtW6loeUQ6Jb8uHOh0tK4re+I3gg/QpGOVA7OBhahWIZOsFQEoxhJEi+V?=
 =?us-ascii?Q?bltUwqDkXwQ/Y8qwji/LxyYRXmMfNbxbVkslSAJoPTwB3KM5a5a/7ZPoMOU2?=
 =?us-ascii?Q?2NF8BtCuOessiCQYm4yuYmeJr8ovI5uq/SqMQSi7uRasaUtITPyKU/H88+BY?=
 =?us-ascii?Q?V9/XokRcY8z/bpxGE5cRgRw7zaxf2Xc8Eecyl30lIJz/MaLjRImwyHCuJj2A?=
 =?us-ascii?Q?c7HqqqkPNCO0hyv7ijRzxxACLsdKMwvzxkw9cS5TfxQ81cRK0MJFeNsV0HmU?=
 =?us-ascii?Q?tIk95/7Te1OWrnRxGPOJlCLRBR+vAxbeoQSyIRGjhmT08WFTaGYW9ohtAZoi?=
 =?us-ascii?Q?KptvA5RxYmzirBxJmypDwgzISIaoraYujTJ1eh1IuKzKx2ZG1vUQmqPXEVCq?=
 =?us-ascii?Q?7M1FnMX/2PQZjPez3fzObBvuJX7YcaFh4GlN3D4AmY/SOiV/mc/tYQZlhJ+H?=
 =?us-ascii?Q?lY4iECEcccfNWKNfZM9JdKushqZcHaxOxglROyB0jAJFSg5iyYJ+/06g7JD9?=
 =?us-ascii?Q?heXQMTEAHcS3JnKowGEYwsFWUXMj/b37Us3taGiZJ9Y63jmCN2RH5ylb6+DP?=
 =?us-ascii?Q?z96Xc705jnKnrq/nx0s6f0ff0Rnv1mEB6j70BCJF+gACgBPdi5VQMNC4LbS0?=
 =?us-ascii?Q?78G7WtAfS7QxiWgH7gf/Pv+zR1Esyk+sHlaTa5+Pr4E=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 03:00:33.6358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 5111f33e-a01e-49d2-b163-08d89bee989b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C++lI5uDMuqzbv1B/LUiDGt+W55chAm9aXXFM7+pWloTaoVYj0eOi56JjsMaexuyLvWUFwN8vUMtbzbmWNjr/xwZfXK0dWhMw5M9PKeMc2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5168
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Zqiang <qiang.zhang@windriver.com>

When printer driver be load, the printer_func_bind function be called, in
this function, the interface descriptor be allocated memory, if after that,
the error occurred, the interface descriptor memory need to be free.

Signed-off-by: Zqiang <qiang.zhang@windriver.com>
---
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

