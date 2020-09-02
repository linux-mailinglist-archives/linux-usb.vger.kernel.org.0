Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4218925A901
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 11:58:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbgIBJ6M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Sep 2020 05:58:12 -0400
Received: from mail-am6eur05on2053.outbound.protection.outlook.com ([40.107.22.53]:61537
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726247AbgIBJ6L (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Sep 2020 05:58:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A4VIOVb1FvfgauoonFqYkXhnZslwsiL7xA/2STZGKCWOivuErK4tmoh26hey5ueygLSKwO+g+znH3EKZIH9YoDOdgaQGJxuYVT9tyN8RHwLcYzFok1shG8a0wSKvOA4x1sn1KWAxzBbybvS+6yby0eqslmgp5zCCkRXgE0zGAoLRfasIgXDAAkdzz1LE3OvaL950k6Lwwq4ZDV/B95pibYvcgDIpFfchIwnuPWQb5CZkVs9mfXi4VU9mGZKMgR0yiZxPWgbW6ay7emekgeSaldy7dP9NzTePCww9OVP9lQGou9PQ4DUvocI9cq68fEhipC+dOODMg/YO27Fx3krshg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WX30Y+404WTmSzZInARo07yZp5bKKCWdnPl8zzxH4Rw=;
 b=KO+AWZJHxmNED6N3zGODU8DEYzUypIiNBtPlwZVTzr9FzgOtZyCpaI6FLG1z4aft1wO1ujQpRlqMM7gpYGsQSIJzsvRXXlEM8LCohT4sbRnE/VmrDYNILwBHNg1iIh2v99sKfFkSihHrztVk8ihNn4Qbfgr9UYXo3MtdKULRZMteiQVFDgbXyTDktBX1lK47A85cSsJcuiK4Flqmu8be0t9Ra0iFvJi9JM1AwWmSSSSyrfxteljIhqa1nOzBHUkJ9ThNU4mcHDvQJ0D6U3/mJQavGHmavGzltfeVwNd/rJx1tKaUR35FrNja3gDZBqKs6DeTSzo6jhlc6B4QUeiyCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WX30Y+404WTmSzZInARo07yZp5bKKCWdnPl8zzxH4Rw=;
 b=ST8v7Wqwsy5iUsXienXmXDV2lUJb8XWgtLV0rhBW+ygkaOzlRTF3fuA92bnFwWRU6n10Kth8YLTHankYUTZnIvW0CElykrJKXu+NuqrWOTpTMPR1p4awZcjfhrdWsTX9Z708roh61xHZQimrt64mOKkM6CX2lnCDlvBgGs8PC0A=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4296.eurprd04.prod.outlook.com (2603:10a6:209:50::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Wed, 2 Sep
 2020 09:58:05 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 09:58:05 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v8 0/3] usb: cdns3: add runtime pm support
Date:   Wed,  2 Sep 2020 17:57:30 +0800
Message-Id: <20200902095733.3453-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0164.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::20) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by SG2PR01CA0164.apcprd01.prod.exchangelabs.com (2603:1096:4:28::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 09:58:02 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a30f1efa-5d6d-4ac9-9ae0-08d84f26b027
X-MS-TrafficTypeDiagnostic: AM6PR04MB4296:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB429648F8C345042F39B804528B2F0@AM6PR04MB4296.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:660;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C2jiLiOZzkewPZzvTk/BhI5cjljeb7HTLU9Aca2yn6sgWEErUaGoY52htxoQ5qeGD1AV/qR+8G5UMEEJWzznqpVgjIDH51qCJgpW8EzQk9K8fDMHgdjLUMGfV/H4yJlY/x3/M2N42crUD/PMX6LavLLEiaePzXg/esgqA3gF3VsHiPXO+g1GRR7ZaCbgWin8D5M0MRDoI/ZeS8PRk99dC1ct5xVodjhleZaiVwXNyYUoRFsNIaEFdAUccAOrzsYEKFocfwROplvQPlhpvrVBYv+T0lZs7v+4+ia+Y5Qj0Hqg/QfpjqdCcMjy05SswEiVztbkp5CoXMTK31p2NHyPHJCcaIX03pNomNfrgj5/tbm/ociKJeKF1iYZ37l2opZ1Xz2CKaOTFbposJ5q7R3JOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(44832011)(2616005)(66476007)(5660300002)(83380400001)(16576012)(66556008)(52116002)(26005)(86362001)(66946007)(6486002)(966005)(186003)(6916009)(956004)(1076003)(6666004)(8676002)(36756003)(4326008)(2906002)(498600001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Iyitg78SPf0gmdrJrYLbXAtu+NXnq7ba9Y9NYS8VRJeJFF2mac75uJkMTlBE+IWzhqP2+9Awp8mEqvPy53snmLcS2S4okF5ubNb3uO1sa+0Ddbat4gNWrN2U+lKC7ohJNFvNSVRlCAOj8hDYVSjCInSTpVD1lS4xB7XBYgdyLgx3IRECRK2M3AC5/L/9HpFhQuXTLFWo7VyEcgxp6oJS+01NTlZqYXu4xN3irJ4suXzKlm/DQZlii78w8/v1Q4od9GdIXef16GrPQB2tfUDatJCGX4B5qJVYt2QwWjauMzu7MDh0UaLrY3F+K8kB9YyjFlyhUEkS00mykDncXOay3IAT/lyFfoEtYxFog0L4tad8za6nTWkq7JNMna8UDI41jFJCQ8MacN4OK3LYHcQw8rZ9AeR+sIXqVvpwvG4UG8hLBVPlpCHOZOTsXTiLqFBp+N/vz5rU/R7Emzt4nd3aeGhayf+t0Kkr8x0is/6jHSSLTEFqBgc1NjI9RDDRntZfkt+QdesxjSZT6JZ4E19luwIXDFpBNhd8mzaP53/G+H6L6kXSHrfHb/MNx/TlMqNCRcpuurHqkEPIPMo9ikzVO9QGDjKF2zfasNK24Q9gYyNwYcEOj+UaogPHdo+wD7shT4wFpcw03fgSvuNyDsgi1Q==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a30f1efa-5d6d-4ac9-9ae0-08d84f26b027
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 09:58:05.7603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7pQ4AoQD/0AO/aBRZHatrnQgH4I+lESMxUzGk26mcTHaMSznq2Od9ItXC9etF9cTWx4AU93pEo9Vdio/rDsPqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4296
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Felipe,

In this series, it adds cdns3 runtime PM support, and verified at
NXP i.MX8QM and i.MX8QXP platforms.

Changes for v8:
- Add judgement for zero valued wakeup-irq number, and using devm_request_irq
for wakeup interrupt handler request [Patch 2/3]
- Remove unrelated changes, and using const for of_dev_auxdata. [Patch 3/3]

Changes for v7:
- Fix one coding style issue [Patch 2/3]
- Fix one sparese isse Reported-by: kernel test robot <lkp@intel.com> [Patch 3/3]

Changes for v6:
- Add Pawel's reviewed-by
- Remove xhci-plat patches, which was sent by xhci patch series [1]
- Rebased on the newest usb/next

Changes for v5:
- Address Greg's comments for more obvious PHY power controller APIs [Patch 1/2]
- One build warning from kernel test robot

Changes for v4:
- Address Jun Li's comments for cdns3 core changes [Patch 2]
- Some small fixes for cdns3-imx for CLK_125_REQ bit
- Rebase the latest usb-next

Changes for v3:
Add Jun Li’s reviewed-by [Patch 1 and Patch 6]
Add Mathias’s acked-by [Patch 4-6]
Some wakeup logic improvement [Patch 2]
Add dedicated wakeup interrupt for core, and improve the commit log [Patch]
Fix build error found by kbuild test robot [Patch 3]
Using xhci_plat_priv quirk for skip PHY initialization [patch 7, patch 9]
Some other typo and tiny improvements

Changes for v2:
- Add the 1st patch. Without it, the build on the usb-next will fail.
- Change the subject for cover letter a little to reflect all contents.

[1] https://www.spinics.net/lists/linux-usb/msg199399.html

Peter Chen (3):
  usb: cdns3: introduce set_phy_power_on{off} APIs
  usb: cdns3: add runtime PM support
  usb: cdns3: imx: add glue layer runtime pm implementation

 drivers/usb/cdns3/cdns3-imx.c | 191 ++++++++++++++++++++++++++++++++-
 drivers/usb/cdns3/core.c      | 196 ++++++++++++++++++++++++++++------
 drivers/usb/cdns3/core.h      |  16 +++
 drivers/usb/cdns3/drd.c       |   3 +
 drivers/usb/cdns3/gadget.c    |   4 +
 drivers/usb/cdns3/host.c      |   7 ++
 6 files changed, 380 insertions(+), 37 deletions(-)

-- 
2.17.1

