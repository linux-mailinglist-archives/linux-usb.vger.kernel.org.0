Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C88B078A8E7
	for <lists+linux-usb@lfdr.de>; Mon, 28 Aug 2023 11:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbjH1J01 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Aug 2023 05:26:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbjH1J0T (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Aug 2023 05:26:19 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2049.outbound.protection.outlook.com [40.107.13.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C093C2
        for <linux-usb@vger.kernel.org>; Mon, 28 Aug 2023 02:26:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OxrILR/ClTPKApw0E8i3mH0Uch9HAjH6m63Qlj1EZ2Du6LTpQDYSh7AAe7ESECLKFck2pq7WbOZlubn979OoUJgnmvyS/hmbxXHrRYUrSPIUIO3NUJEigZEtPUSUzwzlnrOMDQ8abutv/IYhM04x6jDIEx3lHkArBB5/BM9DzdUgjOSaeHEyPhw5DK7gsVwiBfOtdV4j0YCvnJyip321wDbx6qmCWOVbo8aYRGGzZWv92/3VoezftLP2+MKo4ih6lthvUaGyDjLkCEuvcPKecM64+hC8XntNycd+NR+gOqB2EWUlbgn7OrSKvTBjxKG5F1xNyoXuk2RzjPuiFmbDrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MT9syemS/1TFYVK9dzQldZPJrhmlkArm+zIAFcRUajo=;
 b=Cba2/V3a+bZE45SpiEJf/hu2I634rwsyYcMpf8n3MVw13fmi/j/JSW/Zyf+EEXdTV7G/qLfUX5FuPNcBHN+XoegRPSGxUQQtwuXBeG3GbgljpzSNoR2BFXvNJ1ZKrXVn0h3wGTminWt7G6f02p6ufdghcs7EE0we1vQJfSb3D7OEuBo8EPLjOaGjtAK60h5My6skmVEvnOd4FpzHw5BikWGCp5kNTvT+Y7X159NGNme8+HWgyoXYlbP2k9A9f4P5mSWYg1WFrzg/uxPJ2supDOA9+abk1vlx/hRmEkb+mBCKF4zlNGeEbZPXFjP3ehn6V7I8LNhIgY4iEHTvjeqJww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MT9syemS/1TFYVK9dzQldZPJrhmlkArm+zIAFcRUajo=;
 b=m38mikHrkmR20qjdFW/KVbokO3WGov1Tg59X+HPIED5yBUXwmhDfQ9TgvsmvPtdEqx5wqsUaWjhHXKpqCQK2Yx7zNVm7WIhRJ9ts1jyizxVDugxMPVqOfRn85jar5mQ9Gz26uRF1cTeHuZnkFkIURXNUOnXUnyzti9OvFTUrOyg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 PA4PR04MB9246.eurprd04.prod.outlook.com (2603:10a6:102:2a1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 09:26:15 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::6444:e07a:e7f7:3923]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::6444:e07a:e7f7:3923%6]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 09:26:15 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        jun.li@nxp.com
Subject: [PATCH 2/2] usb: typec: tcpci: enable vSafe0v Detection and Auto Discharge Disconnect for PTN5110
Date:   Mon, 28 Aug 2023 17:30:35 +0800
Message-Id: <20230828093035.1556639-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230828093035.1556639-1-xu.yang_2@nxp.com>
References: <20230828093035.1556639-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0123.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::27) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|PA4PR04MB9246:EE_
X-MS-Office365-Filtering-Correlation-Id: 41381d37-ad89-472f-7a65-08dba7a8d3f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sT4xscZnE1/yGvkCa8zn5mD3zRrAi/5/UT81OW4CrGLLK1a4SHGf2zH3u/jkCWIHc/uF+W9lvDjQOezooXfq7E9fQxB1XAALMyQbp+C4nlNyEI/xjcqLHVVEnMy69Vbq4MuN50LHr5hSUJVgTq9/Sx6z/bsb3LeWcGhsppZgDZC8abycV/VgiAKcvuABowpRB6lhWyyB9FxpvfnwQ0ELNvOHEcqaqIHI/ccwYIDKAL3vNJoSAyiCy7RZy/4CLeVZy+SkEEuZKG1E5Lhxpngf4ISftYA0u+f9F3mjzHf7gegR5UUjaoBfz+OSgT1/g5aGkhBqD0PMHiXsdk2fZpQynL8FWeGMjKhHzB2A3/84GRYwxxjsUgP2llocYMb53IhQYvsQl16rlpJL1HLq6CUqjXIcAGBGQRFje7Gq9HbcbTzhSXhs1iyW1utqvE6yKjF9akBvJV3Re5ejk3klpR1NbJHP/pb8MTOMWRI3w2kO+9bgEFfD9N9ijcRNyCdrbkR+pozFc3NvROQQsN9sOtNZO8vv0NssaCPdvlqEU34ssHaB54Djv8KxQpYTRizfhD8Xz8IOAtatxhuNDcKs5ZSqs2iSdYOSVj/hJU2g7U5BDXTuf13nO4ACLiA2OGVDLfT4/QzU4aHc6LWXsbrvTBcaoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(376002)(396003)(39860400002)(186009)(451199024)(1800799009)(41300700001)(38350700002)(38100700002)(6666004)(86362001)(83380400001)(478600001)(2616005)(26005)(1076003)(6512007)(52116002)(6506007)(6486002)(4744005)(66946007)(36756003)(66476007)(2906002)(316002)(66556008)(5660300002)(8676002)(8936002)(4326008)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fCkYUCgoJjRmGXJlivmDgYu28P7ok1D2QZ/8F7INAeQdaevW9GSuAIc0L3YR?=
 =?us-ascii?Q?gBFXuORheK4Wf8Ctq7K/ueOkXpxO317V46aFLnv9apg5EhDHh9D/W8EPp/C5?=
 =?us-ascii?Q?q0y0oe3yagL5GpCRiQMtIIVkQA1dy/3wI8y8I/tbOpqDXWqUA/wYzjG/qE2A?=
 =?us-ascii?Q?YQ5xNINngeZ02hTUKn7vAMWlOvDhIP+Lhrcf86FF6TRYS9VnHgIDpZ9H0Cp2?=
 =?us-ascii?Q?inlVIBLEfuEMx4zjnhYVd/Cv4vgvP/iTXrWsWgMR99kg0mqXbvIrtSYpZ8Tx?=
 =?us-ascii?Q?xrwON46V3y5tqE17HDW0TDMVWfsmcnEAusmqtYH6XPuiT0iz+MyABXIOyQzJ?=
 =?us-ascii?Q?aNRsGmQALLaMICkyv8Y42P3fRuGc2dtMYxIZt0r2LlnGwMseifKGnmERIL9/?=
 =?us-ascii?Q?UKWsqBIyGeNp2ba1Mu7fUUEYdQvuZLoCvzeSxgC20pGBxZet0feYsGEn5cds?=
 =?us-ascii?Q?Srn+cPtq6YZzE+Fwlw8/V1dwPnhtUtAMT8OCfAAIwzP6p/mMqtwjFtJonQS8?=
 =?us-ascii?Q?8naEeaxfjviczWzE7mDL8yNF7/zLCr7lnBOmf6WcQ7A8ExddHEAnLZoLygdT?=
 =?us-ascii?Q?IMNc/e0XLInrqPsPbRkPiUPqTfdShL4EIJGP4+NC0YeOkUncF0hOa7lk0ARz?=
 =?us-ascii?Q?XTBfOKSAJvUTo1qMCUPDX566bFeYUE1+9pBFDF6T6MKvvvbBGXDy28dGJv1z?=
 =?us-ascii?Q?/7kgjGeVxkBIb5b7UgnrpZ/V855lG+kNwNo0O5jgd/t19a+zn9khxOo2cD5j?=
 =?us-ascii?Q?klG0I1WpjgHGGMaEH6dLyALskvQmNZhY9OpxA3i2X0+GZSJ7fl2isGEtAYWD?=
 =?us-ascii?Q?wB053pxxB5hEuGo5n3F5ORaKeB1HvJiSL7S/9T/QnE2sQMJhjO+cIizoRN4k?=
 =?us-ascii?Q?Epzqsfw16xf79IRvCV4SzsnfF5JMNFbeoqxe66LgECUYhTXuw0apOXft8MHw?=
 =?us-ascii?Q?k3UBOJlKGvkuTSap+8heoeWyCObZ+jhBfFV82en5PYAokSBIFB2T9RPgd0sx?=
 =?us-ascii?Q?r1nP2RFfTkA6Vr4+5TmBcauRxBDZ8cGUti4DKmnCLG9Vg9ot7rXSQpqR8mXC?=
 =?us-ascii?Q?S23U1iNyZ1TLEVhbfvgoJbO/bWUvPsmvWdc/4WMq6LRT8K4D6a2Rpmn1ds1S?=
 =?us-ascii?Q?FsDngvnaUdLbTNVTA7uyG86U0KVyfQ6GQ/SO6MB2BcVA4HoHAjtylGfed96q?=
 =?us-ascii?Q?1dUjwkz6z5MfvlTZSFPFh1ShCUmrsPUl57zVopufy/8vfVcUI0EGE9hkMEMB?=
 =?us-ascii?Q?HGgy7VNh6yAgz+x96YyfNqC4TOirm4yzYX6nCgEVTzpzzAieCEBJ9AlFRrOc?=
 =?us-ascii?Q?0E7Yn6y/+8n7lf0t9moUJ3dSMYO+OObaGJpLz3xny/vd7zIjjLVyIuTrLJ6v?=
 =?us-ascii?Q?BwtA/YVZWAlQ/H161GAK+ro5yYQPt/QBYmpZ4Nw9LW3lYTAGA9DQtZaHsfvo?=
 =?us-ascii?Q?ZEwLWy3Xx1jZryom+h5xvqaXisZ1UUmJQKUN/sukg5uzRN2pTqjCHPNCBMFL?=
 =?us-ascii?Q?tqOtB8ytE1EC6gFN5+SdkawKEwcfLnfmZguwYy1lLafSK7HOP6FbF+Z4NTQ0?=
 =?us-ascii?Q?WzeunBC7sJzc/KnYqBbVIx9743QLhy0HfJmFgmh8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41381d37-ad89-472f-7a65-08dba7a8d3f0
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 09:26:15.8703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eFTizL5E5puN+p3Y5ndaYSux9KfnUvnsV8hB52hRZ4+Fr5w6m1kFFJwp6F+XsDRPzoSJtgBI2H5t1EJ5oV3yNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9246
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

PTN5110 itself supports vSafe0V detection and auto discharge disconnect
capabilities. This will enable these feature.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/typec/tcpm/tcpci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 698d00b7fce9..c128c24f8603 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -863,6 +863,9 @@ static int tcpci_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, chip);
 
+	chip->data.vbus_vsafe0v = 1;
+	chip->data.auto_discharge_disconnect = 1;
+
 	/* Disable chip interrupts before requesting irq */
 	err = regmap_raw_write(chip->data.regmap, TCPC_ALERT_MASK, &val,
 			       sizeof(u16));
-- 
2.34.1

