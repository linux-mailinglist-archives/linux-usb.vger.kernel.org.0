Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB73B2400CB
	for <lists+linux-usb@lfdr.de>; Mon, 10 Aug 2020 04:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbgHJC0O (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Aug 2020 22:26:14 -0400
Received: from mail-eopbgr70077.outbound.protection.outlook.com ([40.107.7.77]:52739
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726219AbgHJC0O (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 9 Aug 2020 22:26:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m8SAk8Bqfe+ovNZdHMulMvBjJxwRXwCHHb8JHR6t1A0kgSFc7JgLG1l1UsBpVppU/NYuhTIS9mfU/PjNDDm2nDSgKqB003ITEhtAlDvaxGeQ1iCz7Xu2vEKSICnUCTnenEXzyoYdtatVe6en9poRkgRe8ia2eskcNueITMQGukRTLoS3y333Cv/RtfWW5O9HdkLz0dc+3rBnBpV7YSSCcDltTHbCbqa4Xz15qhkoQszGKy47cJHpjcYfFolZb5wQuzmegoft7/I/jYXaVuWibyoBSzwL3NQowhJ70IB/+Ht9EcFvQVtrvQRis2QVdZwgwAAzDW4uup0j6FDMWVWIgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1M97GwHBpurzIe2w7m+ML10ARVZh+QMHst/clPZ5wNY=;
 b=crSgS0cJC9b9J+SSRJ46YKZFJOUMNyMdfMeKf+HGHCFqyQzbZyvXyIIa9KZ98Zx9qUuVKEkSGTmnUTOU7E8/zSBn5+dUcQeVJhM7QVouYfuNQmvY4skwjfwwdthzlOtPegPt9npaxVmmhqr+BX+vIMOVufvMcU5sUkU/rzdA3MfMpI13Yo7S4IReP6WXTn1ZFBUPK2TyKzTw2FjaVbBI+yByxuwuoJpteCOKKdVSmAeuUVENdOQXjssVTBgI9tm6Ae1kEr+nOogV9WSbwkcnp0pMQxBIKwrbmh5U8zgTE8aZ98oxtOGNRpJzJSfG7B+UYeR0qScbyoZGnKL/FgJCdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1M97GwHBpurzIe2w7m+ML10ARVZh+QMHst/clPZ5wNY=;
 b=brdIqkRre7CA59l1/V3xqUHb6d6njIz5m9OJMmbDp90w6UcQMFIlEgVlrQF3V68K/3t+lQFAFtBkGJ3YP3Fya4n8YxtRzu52ToaFRNK0FlpQjufChSdvUOacWTsAVhnFIgL11TBHxL9M9e3OzIdg51ckw+iqpspAnwioE03Gilw=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7160.eurprd04.prod.outlook.com (2603:10a6:20b:119::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19; Mon, 10 Aug
 2020 02:26:09 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::ed7f:8755:5994:7fcf%5]) with mapi id 15.20.3261.023; Mon, 10 Aug 2020
 02:26:09 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 0/6] USB: UDC: Fix memory leaks by expanding the API
Date:   Mon, 10 Aug 2020 10:25:04 +0800
Message-Id: <20200810022510.6516-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0120.apcprd03.prod.outlook.com
 (2603:1096:4:91::24) To AM7PR04MB7157.eurprd04.prod.outlook.com
 (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR03CA0120.apcprd03.prod.outlook.com (2603:1096:4:91::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.5 via Frontend Transport; Mon, 10 Aug 2020 02:26:07 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f930e870-b22a-4766-8159-08d83cd4be4b
X-MS-TrafficTypeDiagnostic: AM7PR04MB7160:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB7160C67B9494ADB4DBFD26038B440@AM7PR04MB7160.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I4n6a9hto9ko87TFNKsOTZ1wGVNjgw+2dkAwntFiPt6lCqB7i/lZlkQK6diu9+hOJwkZTXuDrDH9h4ZFwyuhTeG5jpRiONMh55w9vX6rmsCtD2QkUlQ5FU7WlvDEPVa9ACxfiLxWstLVgdR97u+FRphiVvfnyPkijCth/0FhZgPq2rPOYSODJd+xKwvvTQHeDqHu27rZBwa9uKEvG27ZLX3a/HlPkXNa6J/ZTMEozF7yf5OjF+ou8pAvhalnf3seAGmPvfj62Y/oI4tQPgXqScw2S7JiCsRoAmbO6CN1nNxiR/5S9YRnoGNwnCZMbF4UeAyho4bSM8taxtg7uUt4Xg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(36756003)(2906002)(86362001)(83380400001)(1076003)(5660300002)(6916009)(6666004)(6506007)(6512007)(44832011)(2616005)(956004)(8676002)(66476007)(8936002)(66946007)(66556008)(478600001)(16526019)(26005)(52116002)(316002)(186003)(6486002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 3Vme1TVj1boDyplw1kZ35qhazzYholMP6x31oxjITJGdRUUtju/I0VgAWTdubEmWSxO818ra3eU0US2/vL6kz2A+f0vyu3sYa85rKgcKRPs+clmTJPf8sgzzjtVPPWQ81CTZA8BmzCnSlBHndMMG2dQ8AbfKcqmHrahg6ai0hNh6WSnnA/9ZtPLdOmrA8hP9U59MlX8ixlnKJ7snzEw1A7PfVZjyoFT1IyRSxRYcjIOn7VnOn7G2Wr9zpdAjUvIjFooSpN4mcHbWr5b78iMy6xBPZWNojgAR5t+pR4ambMClZnGmkTa3xbeyIa5l/dMxNVOmgauZBjb9EQu9uEfLcyU5uXAKUHQInr5pa3Pz5vFApW80IT+ixNXjMI/uykRAUIY649rC4eK0x4AOp7k6wbesb22Iy2zTIkgsJn4ZXLH+ZO3QlC9ur/OQeBNxWPMDTcZyWVK2gqJ2r0CiNatC201mXGkmFFWKlwDxjEXzng1d/fHR0ufeX5ysmlNRUJPuYwy3sffovALqYggcr8Ih7sGRHzQ7prc/UkktYu739LyHm63YW+B0EdtNSxPK4et+8x9TvK8Jb+4N1iIhk/JTf4SolMWwBRXqBJEXKrsMsEr/7lCTYagjKy3XYCO/BuNEJ9leiDc05My9zFstb2qSAQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f930e870-b22a-4766-8159-08d83cd4be4b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 02:26:09.9105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: arr29tfCRR9LXViC1HTqZY8XOJk1nmgKJaIRLjG47jgb0wXcS98e9royejhl/etgfwoxVrL3b+asiQjMLn3gtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7160
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series expands the UDC API to fix some long-standing memory leaks
in the net2280 and net2272 drivers. And with expanding APIs, it could
manage cdns3 and dwc3 gadget device memory better without the hacks
at UDC core.

Alan Stern (3):
  USB: UDC: Expand device model API interface
  USB: UDC: net2280: Fix memory leaks
  USB: UDC: net2272: Fix memory leaks

Peter Chen (3):
  usb: cdns3: gadget: fix possible memory leak
  usb: dwc3: allocate gadget structure dynamically
  Revert "usb: udc: allow adding and removing the same gadget device"

 drivers/usb/cdns3/gadget.c       |  20 ++++--
 drivers/usb/dwc3/core.h          |   2 +-
 drivers/usb/dwc3/ep0.c           |  26 ++++----
 drivers/usb/dwc3/gadget.c        | 106 ++++++++++++++++++-------------
 drivers/usb/dwc3/gadget.h        |   2 +-
 drivers/usb/gadget/udc/core.c    |  79 ++++++++++++++++++-----
 drivers/usb/gadget/udc/net2272.c |  23 ++++---
 drivers/usb/gadget/udc/net2272.h |   1 +
 drivers/usb/gadget/udc/net2280.c |  11 ++--
 drivers/usb/gadget/udc/net2280.h |   1 +
 include/linux/usb/gadget.h       |  27 ++++++--
 11 files changed, 198 insertions(+), 100 deletions(-)

-- 
2.17.1

