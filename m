Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E59AF2047CB
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jun 2020 05:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731732AbgFWDJJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jun 2020 23:09:09 -0400
Received: from mail-eopbgr20072.outbound.protection.outlook.com ([40.107.2.72]:42240
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731690AbgFWDJJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Jun 2020 23:09:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLeMFYrZmzaCCXChbNgDMJHJCti6SYkO4JdmeOk2Sj2e5W30BbdYBG5DMD4wgXvPN4dPHl3O3rDZ3TLr+Qm4jSx6eaiDDZmF8m+sXxTEKHhpZfo4Yo6ujFrJVIE8d1rYhTbixNPHnUSKYjBBtBNt8rV109oO9XZcG6TAIr9Jw36FCuqU2qy1FObatC+wI31DJZvFwvK/He3q1cYcq4LtPsS0AndVDg+kgtyQ9TfbpnOpDtc0r4eAXjEdrNjGoB9+06KXq0i0zS4LLy96AzBqWU7G0s8vMwrSt6eCW73GfznDJfKJ401zR41yAgZbtnn4QsSUZfcgFFLEltpPz3Y6/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAsaF3PsnWGX+pg8MivKXAG2235JDRNH5HMqGkDqP/A=;
 b=SnPY6N87yXw7/3LZa+EIfzWV0zxGo45M+zw+3OHXKc5jYvcfPAie5G+EcBm6uoYPEpvLB0SKUDChrtNvewM+B/w2cUjmhWSfAySX95jnlpcl7DeswF9yEVvP9vCd3lBERyEvdJUnCFqrgy5Rf2mPhiQpXQHFsbhBl4bDzLCF5tGwTdYXH9y4T1JB8BnhHbjCHHo6n9Skm7bhSATEKkArN7VVknXbC4dQY3pjaU+aB8rDzpMDQa6jbGBsSvjYU1Q3viAde9v6CIJQBhiC++o2juqu9RSLMMRBsQ8O8/k3JjN4bDuEDK5PU5vHXSd+zh13niAP8qTS9CvMJpjnHHO4kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAsaF3PsnWGX+pg8MivKXAG2235JDRNH5HMqGkDqP/A=;
 b=IucSYrjebFNNsNYSQRSQcEDsyi4d8QWMmyjWzIhxumDb4HlimsUVwDiyWzaEUCGIdo/Zi5I1yRphCQDG0fc8sDjHqvwZhHwqh+kd/t6MxIZQNloTsg2IGHoAIfp3kHIU5DEg4wAgPkEVaIZewBPyuTWcxRArPljHvK+EPFcUaj4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6854.eurprd04.prod.outlook.com (2603:10a6:20b:10c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Tue, 23 Jun
 2020 03:09:06 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3109.027; Tue, 23 Jun 2020
 03:09:06 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com, pawell@cadence.com,
        rogerq@ti.com, jun.li@nxp.com, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 0/3] usb: cdns3: bug-fixes for usb-linus
Date:   Tue, 23 Jun 2020 11:09:15 +0800
Message-Id: <20200623030918.8409-1-peter.chen@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0189.apcprd06.prod.outlook.com (2603:1096:4:1::21)
 To AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from b29397-desktop.ap.freescale.net (119.31.174.67) by SG2PR06CA0189.apcprd06.prod.outlook.com (2603:1096:4:1::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend Transport; Tue, 23 Jun 2020 03:09:03 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.67]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 62647e4e-6a9d-409c-bd29-08d81722ca13
X-MS-TrafficTypeDiagnostic: AM7PR04MB6854:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR04MB6854C8BCEE0060348EFF5EA28B940@AM7PR04MB6854.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 04433051BF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nnxcdBI6CmR1gU/fSqwLtnQ2vjYEdWoIxBs1QZaAk4kI/lJXxw0DIE5Ml0i5/HeZZbJoknachKvvZs7GptSl1NlA73COBPzprNKPDkPoQmN1ZFSsQlnfHHmKzjZW8WZbR/e6r3yS+Okw8p9iCR27TECBmy8B2eumfwCi360cJNNhaEYIKH2QL7k6DtJcsfJD9l9TfbxeGbLINeYAQNAGsAAqw/ddNWfpFlXLuOts8glEra2kdHEhzRwrwEiE5lG3PNYj9iFvUoOFnVbIIGdlsP26mQQGMl49NO9PVMLf38rp7tcappDzDrPpQCRcLez/7fNspJNeODHaLSSdgPWOeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(86362001)(6512007)(1076003)(316002)(2906002)(66476007)(66556008)(66946007)(6486002)(44832011)(956004)(5660300002)(2616005)(478600001)(6666004)(26005)(16526019)(558084003)(186003)(6506007)(8936002)(8676002)(52116002)(4326008)(83380400001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: xhKPsFBvTXP2o9K83mWVgehatvHQFumK4A8TW2S7dC7+uFF6vdDGoyg6c5zj4+MFuLr/z1JHsj0qOjhLAjEqNePNqKOZnZz6ZlCzhvoEI5dlx4Fg31mBfg+Kz2tiuwcMbkj0vqB89XGCWyMQmVYU2GGys/PFCbev5H33hS1LCT9EkYBrx2RNbc91eYIq3MkfKH4S6ADdVXiYzAI8+5AWtQ1rn5Cu27MWOG+IiOmDHjBpAd9o+ZmFs7mE7N5UpZ9RNK1oYnEUX5YvFyXqwPvOIkufcVhPPA0XhtShYwHJKLC042f9na8DLbPTy6s1iUFkkA6oNyQN1q6KDX5EJIbK3rv3qbQ6Kt+pUcP+2IMoNLMbJtdEDPRToXgXs00nB7qJJt/wf5VkUEQwIDKMQ5ktwVWlJvTg1KuW52p9RL9J5E6vEC2h5RCDCrQV/AmN48LdHi+k+C/eaJ7qU4+nUaycaaNXYVU2JezFqMMM2khJV/LPyhlujKexZD0B+mcPb5Vo
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62647e4e-6a9d-409c-bd29-08d81722ca13
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2020 03:09:06.2430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dzGmLXh9QU3UxkXO9Y1LFOmQJRVJQ+rN8SaIKwI3v6EuLGqLrBlDhjYE/F8MYPpYIrmpQljnpdOyxkoQyKbU+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6854
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Peter Chen (3):
  usb: cdns3: ep0: fix the test mode set incorrectly
  usb: cdns3: trace: using correct dir value
  usb: cdns3: ep0: add spinlock for cdns3_check_new_setup

 drivers/usb/cdns3/ep0.c   | 10 ++++++----
 drivers/usb/cdns3/trace.h |  2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)

-- 
2.17.1

