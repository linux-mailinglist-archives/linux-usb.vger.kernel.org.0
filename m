Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EDD06393C9
	for <lists+linux-usb@lfdr.de>; Sat, 26 Nov 2022 04:58:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbiKZD6o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Nov 2022 22:58:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbiKZD6n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Nov 2022 22:58:43 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E33D2CCAF
        for <linux-usb@vger.kernel.org>; Fri, 25 Nov 2022 19:58:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZYUDn+5rnzsSVrhJkavD4G+JHPemmowFYdez5J5to1KScngRPEQ4NbSHdl5FYtX24b3TYUVjVH0BhJRdPhQ9sJcJQw3cnaYfVAMvc/7H5iUy4Yp+rQhd8xQ3IVxI+G3dPm6sh9AnyJQqq39usL6VJCEDEK137KQuSv9VS+CMKB4Z8plUdU+p2hXZjOAf/+HFxbyvYkKHkPIndP4gBaU/tJglCvWZFt6cdrjjp1/ku6FSRTyZC7fzWtCMm6YIM8ryn4IO0ULKeRCdAaAFcM7uEYap9Gsed6Bmq9k2uzOAwLAeRYNOzV4gJwvyiFtcafLawz8zT2EqZoHDt3Zmotmxqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0GAah0ervR+m0ZvTY5/XV5nVuFYA8pboQJYaiMZXR1g=;
 b=Sf6lqpbZkaGzuujZ0tU297sR/h9mOzcsZHuZxPIG5u8TAkdDAtylYtf6HhGLM7rBfyA8Yqhrd3LeNMco9tWrBpZVjRf8U5o7dc0USCfKfSRtHORxO02gSS1mtckBV7xRYFF5IRyhrQQsX0sB412bGj5WuYRXfEKDkdOrTdo3ZACuBSYuRGD33qKXCtlzWQu8IShyjmKztHfFksV9HgxlGfgv8H9NysRqQ/Pg7c8lOANZZMayTiV4rE1BDXMOI2TPpLkHd4vSOuGQXGBCe6sI6swDgpF5Ld8WSbYh3b6G2zfKYwjhE7GBLd9wiJ1CtX0guHDv0Y3wp70QaUkIpMLvtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vpitech.com; dmarc=pass action=none header.from=vpitech.com;
 dkim=pass header.d=vpitech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vpitech.onmicrosoft.com; s=selector2-vpitech-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GAah0ervR+m0ZvTY5/XV5nVuFYA8pboQJYaiMZXR1g=;
 b=WOr+cBhB54u3PsbfU48UlscYzy+xbrwtrjXUZG8/mmvS9CoexZKZaN+MvnuAwSJREs7gKBulHZjXIWmMJprOznF+FtHsAyPBTRltINRadOaYiU2KF4BcmZc8UT7d5KPuJjO1ATerHpfRiZCvqn260pU+WHRSVg1ZI6jX83mZFuM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vpitech.com;
Received: from SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:1ff::7)
 by SJ0P222MB0299.NAMP222.PROD.OUTLOOK.COM (2603:10b6:a03:3fc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.21; Sat, 26 Nov
 2022 03:58:37 +0000
Received: from SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM
 ([fe80::1ac3:14ac:b83:b2fa]) by SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM
 ([fe80::1ac3:14ac:b83:b2fa%9]) with mapi id 15.20.5857.019; Sat, 26 Nov 2022
 03:58:37 +0000
From:   Alex Henrie <alexh@vpitech.com>
To:     linux-usb@vger.kernel.org, johan@kernel.org,
        johanna.abrahamsson@afconsult.com, alexhenrie24@gmail.com
Cc:     Alex Henrie <alexh@vpitech.com>
Subject: [PATCH] USB: serial: cp210x: map B0 to B9600
Date:   Fri, 25 Nov 2022 20:58:25 -0700
Message-Id: <20221126035825.6991-1-alexh@vpitech.com>
X-Mailer: git-send-email 2.38.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR18CA0060.namprd18.prod.outlook.com
 (2603:10b6:930:13::18) To SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:1ff::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1P222MB0296:EE_|SJ0P222MB0299:EE_
X-MS-Office365-Filtering-Correlation-Id: 32cef34c-518b-41e7-04e6-08dacf627ee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IfdjmWbwlvXzDeL7QiELDFO/SMwiO/eYPe0VFvKtZRe5A8gDKxnvl9p5md2TTht9WLRawTmjb7O+GLKP2MuDfhUobte0Pnmnwn+bJNs2KS3geRYLjMvgVkyY+WmDYdKUfBO+wPAjAKkCguoOAE915L+qFdw1THdmUun6SS6xDnTsRPfr2q/BZ25O9oupx0yoGRjJbtOukN2+E+Fcsbyg0+GAA8Yj5E1f8rl1RM6snnOaR43RAqphegVVEqkiZmbU5SRu3iBblP+ksRO0LobiX0qfQFuCFr945rpOwslyPViAlYWWBinVxMWgwCCO8e9ZEthVVnFefHuRrkvUEuSyHMFJoAz8iwyD0D4jffQS4pl+PIf7yQP4Tn2RuuzHQ3F6V6Yq2BZhiVtOo4+T31tRy/hV/Yrf434i9/Url5GJ54Y9DF6v+3J4w+FM2bYcpaMLDJihsykB2pJ15e8sL2VyBlZOTaEOIUtnlKU7taUa87fsqFyicCzVsU60t40laGTIXmg+xv5EkdoCjBZFQ8m5MWEBEK6tM1vGKLWR0S3ww+beReqsfdmNlkc2J+puegqy6wRpPDDxwAZ4TRex81eXrxebPwhzcMFe+eaq1Bon2wU+tIfUtvk5PmyNdYeEViU2MYHcp/TbxnXNKklEVnL5LA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(39830400003)(136003)(346002)(376002)(396003)(366004)(451199015)(38100700002)(83380400001)(2906002)(6512007)(86362001)(186003)(8936002)(1076003)(36756003)(5660300002)(2616005)(478600001)(66476007)(66556008)(66946007)(41300700001)(316002)(107886003)(6666004)(4326008)(6486002)(8676002)(52116002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yif9KPi0mCVQGwXqOeP7YzAH/+UfU0Er18DyieizAiSs0ERnS0nimEvPGri8?=
 =?us-ascii?Q?1MptVJw5WrD894IyO4ih5/ROdhtVrOwTFdkjN4+kpsLiTenpV7Uk1AGAfA9B?=
 =?us-ascii?Q?UUc9mCTUwJEnixENYEZSlLYDuJC2s/QTyZ7aHNdkSvpdhCVj0lqyyvegGB8Z?=
 =?us-ascii?Q?lTaWrhR6bxgmVeeUL4/I2FdQSANjLvJZGkZMx55TaWzyUSWHL03IAvJ7BLui?=
 =?us-ascii?Q?6SBA76j6TdZ3SRP1ZoQqeJCanuXLoa4PhQptTJmp5XobzCbWXoLv5xI4CKU4?=
 =?us-ascii?Q?CpSrQOA3SX72XyiGzL+ZhpWouA2/qisWmRkUIgpVsFqbnnALq9OnH0ELCcqI?=
 =?us-ascii?Q?9h4t7xWt+xF17n3IT42FlBizSeVQtzgl5s7n+Q+2zSqPQBSefU5sePrS3BOF?=
 =?us-ascii?Q?ZStBn6U1x2rxhbCqrLj5oKcSOWOZW5TsapyRrxujT4GLx1lSjiG/7CatlUiI?=
 =?us-ascii?Q?eK79c/X30PS+S19F3yDTwnhuHQ6qBRKSKOIqh3dauVgBCKKyr1rOCLS5FWQV?=
 =?us-ascii?Q?vwdRcAk232dUiTR0wFN3CfuJ/6l5NEBHjWMPeSev97nAW5cMxli3jt0DYObI?=
 =?us-ascii?Q?dWgRd0k4YbjQLIP6Qiyp/vpk0g5Rdx62hqkK3IX5xGdgGPPBl7RoLQPgAwem?=
 =?us-ascii?Q?gQ9h2AP3aKKXDdPnvBnGpM5HARkHyBGOoPep+D5hYbVscqFlWtZ9J+hb/W4i?=
 =?us-ascii?Q?I7/CZyZVftMJzJZVi70feqJpvrXILG7bWosCA8phYREds/+nUEAR9s4grc53?=
 =?us-ascii?Q?O5I+HVww35D1XlzOJaF1Fm5KoqQEJonZqndpt4kbCRxjRPPsNZNiXLgL85Sy?=
 =?us-ascii?Q?j55eiXKZpkPph95kTLgbx9+R/5BwD0YDFEDv5XpdU8XvU5t2cXzO9EzR2X7h?=
 =?us-ascii?Q?IUwTZbXlTY+3XGFPjqDWqIGjJsEphMOb6i4RKVkNx6R2eeuWIxVCH3jz6lpG?=
 =?us-ascii?Q?j9hqWTkl2Lg7kk7p+z5sBSh34xEz8tn9xle407p205dg+7WSVadDl2zSnpw4?=
 =?us-ascii?Q?mLAllldDoEVfMezY1eoM9bb5Vkxa6gDvQHzNFkir7UBRP3AdUfRNIQGZsLIO?=
 =?us-ascii?Q?p4suV80fm+Q0aElGPr4z3sIXy78SK2xAXFqOjlSrSMOrbdLrMX4H3q2yTIB5?=
 =?us-ascii?Q?lG5WzU6ACs5InmTOTurOfCNNMixYaaO1MofUNrQ1aF1CDW/a41IpCAJSbWxA?=
 =?us-ascii?Q?aXHUfATNFHMBIYamM0L3evbzI7G12qVoihWYJWgDnb01zBcLyV+2S7ORem38?=
 =?us-ascii?Q?4WTZ0MMJeCjPEZfCRwFP7wr+BQyB1cnfkN/cWkftNAVembfJm5wZGLR/hXww?=
 =?us-ascii?Q?If7kYtS8Rp9UECm84nhAfclvfJfVibtxfgTYQQQZa4gM1aWy97mTBWO5JCKn?=
 =?us-ascii?Q?uTX/qb9cY6apqFn023Cdat5JXA8bcu9kXXFRdT6mUEFOlo00xvfSNZkOff2W?=
 =?us-ascii?Q?LxnWAFpamq749ZcFyMuLDn9AkMGSy58Zl404K0q+U3xDTDDctmq+jvJxr7iU?=
 =?us-ascii?Q?nhzQIUbPN/OUUFQy28rfvMs6rRsiFmXBTr+Y0ZdorRHNXl0SDAYQAeplsI7+?=
 =?us-ascii?Q?hSFaxK34QVRwncdVbBjWid/TJfOgifxquVqUjyNgPVmNucZlvSyxAUEBKvHd?=
 =?us-ascii?Q?Bg=3D=3D?=
X-OriginatorOrg: vpitech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32cef34c-518b-41e7-04e6-08dacf627ee1
X-MS-Exchange-CrossTenant-AuthSource: SA1P222MB0296.NAMP222.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2022 03:58:37.1279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 130d6264-38b7-4474-a9bf-511ff1224fac
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c1hw6RZpfKzAykQ2WZHHaZgyDhkYl5vfyK0xD0TzGAULZkPjj+Ewy5hxI6bCh5BLIxppHgKa8Awt9eu2qM+txg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0P222MB0299
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
 drivers/usb/serial/cp210x.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index 3bcec419f463..2c910550dca8 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -1051,9 +1051,14 @@ static void cp210x_change_speed(struct tty_struct *tty,
 	 * This maps the requested rate to the actual rate, a valid rate on
 	 * cp2102 or cp2103, or to an arbitrary rate in [1M, max_speed].
 	 *
-	 * NOTE: B0 is not implemented.
+	 * NOTE: B0 is not implemented, apart from returning the baud rate to
+	 * the default of B9600.
 	 */
-	baud = clamp(tty->termios.c_ospeed, priv->min_speed, priv->max_speed);
+	if (tty->termios.c_ospeed) {
+		baud = clamp(tty->termios.c_ospeed, priv->min_speed, priv->max_speed);
+	} else {
+		baud = 9600;
+	}
 
 	if (priv->use_actual_rate)
 		baud = cp210x_get_actual_rate(baud);
@@ -1069,7 +1074,8 @@ static void cp210x_change_speed(struct tty_struct *tty,
 			baud = 9600;
 	}
 
-	tty_encode_baud_rate(tty, baud, baud);
+	if (tty->termios.c_ospeed)
+		tty_encode_baud_rate(tty, baud, baud);
 }
 
 static void cp210x_enable_event_mode(struct usb_serial_port *port)
-- 
2.38.1

