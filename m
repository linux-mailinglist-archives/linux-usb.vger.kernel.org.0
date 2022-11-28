Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE3A163B133
	for <lists+linux-usb@lfdr.de>; Mon, 28 Nov 2022 19:24:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234122AbiK1SYI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Nov 2022 13:24:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233909AbiK1SXu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Nov 2022 13:23:50 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 783C72B1BD
        for <linux-usb@vger.kernel.org>; Mon, 28 Nov 2022 10:13:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjWcSaWsDwnCyTgt+QV/WX/2SU3u1eryacK33Kxv2QiT/HDw7SfRiHUeU7o6Hkqfe9nzx2NVBylLI9V2pHhRDcNwK8Y8H7oF2UX4JqmqNJTRF4c6ortOfLAlgtyqKEIFhEXjLsRzVu1qIke8ftFcOrd/rc/V9FyD/lPy9mnPBELfyAjCgDXH/9afEgqC/UnfbYhk7LJ0kFbLBIB01iwJczVqmUwjH0WE7AUOevW6KVMoquOEdRZFuIJc6oZS/ry3AH8vzr3LRm+k7OfHQbJiWupAqsBtWbp0rdrYvVaciJkh2fcpje6BXj3WLpeDGzr23KM/MxMaz1pDrFvvmjP29Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dn7s5askaW4ZlipRRL1CKk2GQudJM07MiPVVzWjZmYI=;
 b=B3n402D1nFCH0wayIc+G4fCQ7acaX3Ec72pW7FoaoHwNUl12VQzso/lTtak4SHIHrle1tqEhRX2YKNZJFzpQ0MzK8EJ2OBjPNtW1y/BJQkqX66Bvl9mZpJ2Vagxi8HkKKRrl/9yFw9oWQaDaoGJVhYXIPsEcVoxYbo3qeoOnS2LWpZQBIicQPh7Bdggg9VD6NHkp8/zDFPyUUTMK4RKjCtZeHdnUcsq75GZasSz355gHV2H8Po4k9bGHdJnG8eV/YRINDFILsJqZr1SKDqBwd45rz6v+PSS8R0D2gRdMCq9JWKSBTAjN0lJvhjxYP3JgVPLRNtbdV65vqksRdmqy9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vpitech.com; dmarc=pass action=none header.from=vpitech.com;
 dkim=pass header.d=vpitech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vpitech.onmicrosoft.com; s=selector2-vpitech-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dn7s5askaW4ZlipRRL1CKk2GQudJM07MiPVVzWjZmYI=;
 b=QIQSD3nhzRAOz+ewaJB2njKmDtxwpJLpErFXwCsLJsHESeP3phZL9ZOVulo4Xf6Ib/SU7tF/J+L9gB/bi7WNOPGGOSgnhg1zkSsQPPGhqkME6hObqSSEVGeF0p7GUvTlunFBRAK+QriVv5BInq9tR5vBiLikPdgOqb80gkyzf+o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vpitech.com;
Received: from SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:1ff::7)
 by PH0P222MB0111.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 18:12:57 +0000
Received: from SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM
 ([fe80::1ac3:14ac:b83:b2fa]) by SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM
 ([fe80::1ac3:14ac:b83:b2fa%9]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 18:12:57 +0000
From:   Alex Henrie <alexh@vpitech.com>
To:     linux-usb@vger.kernel.org, johan@kernel.org,
        gregkh@linuxfoundation.org, s.shtylyov@omp.ru,
        alexhenrie24@gmail.com
Cc:     Alex Henrie <alexh@vpitech.com>
Subject: [PATCH v2] USB: serial: cp210x: map B0 to B9600
Date:   Mon, 28 Nov 2022 11:12:22 -0700
Message-Id: <20221128181222.182554-1-alexh@vpitech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221126035825.6991-1-alexh@vpitech.com>
References: <20221126035825.6991-1-alexh@vpitech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR19CA0084.namprd19.prod.outlook.com
 (2603:10b6:930:69::20) To SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:1ff::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1P222MB0296:EE_|PH0P222MB0111:EE_
X-MS-Office365-Filtering-Correlation-Id: d3910d28-8606-4495-b9f9-08dad16c2d59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xPLPVgTcdsTuvmbpuYr0ujK/TRtLRkE6R8kcDgetceR/kVlGyDyvYhSlqlRFMVgIeOuOcxCfrzoBYMgGQg5l6IEMHcy8lnJObp07I5EWQPKAxN5L/P/DEiqdElKzgfN68fwc1cB5+p3KHzwCkegXNGKJ+4eCuOPs6wg7nxJCGoJHBiqeGYsh5cWmaYTOiDhX52JxL/ZFFtfrnm0nGjTv1r9g6itvxfXL2UGP8BI5lwqza3ohxZpjNHKxpo1scVFLuLjwOJ2FQFF8oUAhYsM2dYWtke0MjNdZNGJRaHeTbDcx896hzceo5GR8gVJC+mKP8xkgsVXxoMgHhs98HMX22ddIi8ZNpqdeM5Z7miBJbTwcDoszbsmxUPp+XNTTV+nXt+fdZaLiLLnWkGVBnoCQPrkuxFh68ffKKQPvFgEWgzXvq/8+d2FZZmedMs+2nyXR06Ag7EqUoNgoMAFcrZ5swPSwkBWs4JPJSpYwkAsNcmyrqr4Gld67Slh08L3m3udwyJ/YKKAqYv/juXVy/RLHaVX3H6ix41nO73P1vF9rAodp+CpFEmlKr7I3+LRVRXHPMW9yFb2GPYD8GdGzO66Eic62NGw6WuSYyIyH1pmTMRCfsnosDyQTcaDr77emFxjQQ2Y5RufMWjrr6AuQo7zsuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(39830400003)(366004)(396003)(346002)(451199015)(36756003)(4326008)(66476007)(6512007)(8936002)(1076003)(41300700001)(66946007)(8676002)(52116002)(186003)(6666004)(316002)(478600001)(107886003)(6486002)(2616005)(6506007)(66556008)(86362001)(83380400001)(5660300002)(2906002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GfID/wcVfr8WqYJ2wiKI8hPu6udlHhvZgfvW0bRbCeBudgMT6taU3Bhrykjy?=
 =?us-ascii?Q?rezu61qSzKiBWpc5CjBYozrJyeeUVWzFQxGczdegy1IL3kQb0yHE3liM5qwv?=
 =?us-ascii?Q?aQ5pSDzscta3sgdqGi2dpl6bTxV7d8oeycQuXU+yr1sqe/raoKhS1IWSAgnY?=
 =?us-ascii?Q?UJMIJgOJwVBqR5bZW5i4ZGQOFYkzwyUT7FXJjGE98VBDw+zxMvLlLVGWjydF?=
 =?us-ascii?Q?v/sBVZpRQd+0Y4dmgqXqo1bILEuhl8F3vsPfmIXUUKT4RF4asRFZk/Dq1WHP?=
 =?us-ascii?Q?x0lurXKOUh0pRQtgiqyeXmT0m+eKf6j5M8ryluDRfEPjdNi2EiO+GA1GDNpo?=
 =?us-ascii?Q?gWE7X1LjbzyylT6CKiHlR1XXd747gbZdd8YDGzGn0+l6OhZ8gUnOzHUuW7PN?=
 =?us-ascii?Q?JMctjkI/9VOTOF/vonf1clUIMETQIFwe7K94oerC0CS7wioWo+B6SEl6Oq9a?=
 =?us-ascii?Q?zzrt1VkN0XHKOWO+EWP0fKYXbaSnRKEpCjGrtVZ8lOc/jG8R8/NWMNs7RgSV?=
 =?us-ascii?Q?kslJnizSrfAq+4paFuJHYHz9oImyqZMEGheAVue35ohQsLcNq/Ndlfjg8tcU?=
 =?us-ascii?Q?8WwjvQuUIlT+CPyLkDeNfkGgsjjfLHedx+FkccuZWc5x3eiQzdMhuhSvjMpI?=
 =?us-ascii?Q?v5yy7wqsZlVrNhKDAWK39kaWvrbUTf6QtWjobqwX14TK9e7Cl1Cl4E7+xvYe?=
 =?us-ascii?Q?sPFmzLYIijg42Buf01nFHyydUKELKBvPHyph81DHSlWkVNZEKg+nm64mzm5/?=
 =?us-ascii?Q?5ODu2q7WNgBXnHco2m6LaW8J1x0Fov4aE3uHevJdBK9HZzi6KJGzlAEy1Y3B?=
 =?us-ascii?Q?FuHzHMJ8nJvyLeUO1xYJAehqXlSxd5X0/pLMZoOJwCfH1JVRP/WUrOwiDxCS?=
 =?us-ascii?Q?Jzhr4A22ySrMUCuZICJFf9MfDm859D91K78v7bYCyo8B+rsUxCcJwVMKuIl5?=
 =?us-ascii?Q?fAcpaFf1vhZk0GCID0D8rZQhXtaxZZjK6BOQBxA67CADTlzgMd6wo8mY9yth?=
 =?us-ascii?Q?duMHbPfrAXkGedsTjHZ/MnIIT3x2k50Mrce+gmyuob/r8y2yrfkOmADvxM4m?=
 =?us-ascii?Q?jhEhLIF/WzOJEMFUUmGjIq3iE0aVsuos+WWBJQYPcrZ7wq0Duws+uc+iHBTJ?=
 =?us-ascii?Q?r0MgBsB6MI6e73tuR3P4mWQrfH07j4u734h48TywT1G2e1gq56EC3jTftX9d?=
 =?us-ascii?Q?7U7zkA30Z/5xn22TSlka+co2gvi2TU3TsJI8z+6I/DIxjrMl3BsJnJ8mLkNk?=
 =?us-ascii?Q?6dcnpZnOo/2Z2+X03iNqtyackXDAt7ECrL7oBexWKqJnqtH8mtFpB4GC7/k8?=
 =?us-ascii?Q?glxS7Fnu3qo0CTTz7cYayRMOsDjWtBhr05a1ID2Rvh9gmBQOKOVIXp28jF/d?=
 =?us-ascii?Q?n+fQwclr+fJApfb7HrXMgw5A9zoYJT1/wGnsoIrxLNPkGl0M2JFSGZlY0xuu?=
 =?us-ascii?Q?jVmkmS2UhI1qHP+EO22DUrzDjpTBbKLaP6B2tdzmqIqaC/1chmyozuZqNGxB?=
 =?us-ascii?Q?PiA6U7LFoIrwZMncm+bTLK2YhhrTI9BGDr7q31izKhucVW4sOARzlLVQz6x8?=
 =?us-ascii?Q?2K35S0FU3Q93i9KN0xKEJihkIimfRvR51DLkEqVtbhTcBpI4XylzwXRRPrtW?=
 =?us-ascii?Q?UESB/t0zEHDChBYf0cVy/Xc=3D?=
X-OriginatorOrg: vpitech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3910d28-8606-4495-b9f9-08dad16c2d59
X-MS-Exchange-CrossTenant-AuthSource: SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 18:12:57.5280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 130d6264-38b7-4474-a9bf-511ff1224fac
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5pkDXXT8kgNO8FuDJZq9PfuYyxOTX6lh+E9drJux1+hCsnoAm3zhCGKuyaUtAkFnDIwvfpkP67TkwHDvK+PGpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0P222MB0111
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When a baud rate of 0 is requested, both the 8250 driver and the FTDI
driver reset the baud rate to the default of 9600 (see the comment above
the uart_get_baud_rate function). Some old versions of the NXP blhost
utility depend on this behavior. However, the CP210x driver resets the
baud rate to the minimum supported rate of 300. Special-case B0 so that
it returns the baud rate to the more sensible default of 9600.

Signed-off-by: Alex Henrie <alexh@vpitech.com>
---
 drivers/usb/serial/cp210x.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index 3bcec419f463..b2409167b27f 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -1051,9 +1051,13 @@ static void cp210x_change_speed(struct tty_struct *tty,
 	 * This maps the requested rate to the actual rate, a valid rate on
 	 * cp2102 or cp2103, or to an arbitrary rate in [1M, max_speed].
 	 *
-	 * NOTE: B0 is not implemented.
+	 * NOTE: B0 is not implemented, apart from returning the baud rate to
+	 * the default of B9600.
 	 */
-	baud = clamp(tty->termios.c_ospeed, priv->min_speed, priv->max_speed);
+	if (tty->termios.c_ospeed)
+		baud = clamp(tty->termios.c_ospeed, priv->min_speed, priv->max_speed);
+	else
+		baud = 9600;
 
 	if (priv->use_actual_rate)
 		baud = cp210x_get_actual_rate(baud);
@@ -1069,7 +1073,8 @@ static void cp210x_change_speed(struct tty_struct *tty,
 			baud = 9600;
 	}
 
-	tty_encode_baud_rate(tty, baud, baud);
+	if (tty->termios.c_ospeed)
+		tty_encode_baud_rate(tty, baud, baud);
 }
 
 static void cp210x_enable_event_mode(struct usb_serial_port *port)
-- 
2.38.1

