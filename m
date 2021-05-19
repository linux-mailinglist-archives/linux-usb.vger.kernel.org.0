Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE7F038882A
	for <lists+linux-usb@lfdr.de>; Wed, 19 May 2021 09:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240091AbhESHdP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 May 2021 03:33:15 -0400
Received: from mail-eopbgr140081.outbound.protection.outlook.com ([40.107.14.81]:32741
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239548AbhESHdN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 May 2021 03:33:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fde1ISGd6j6/HKiw7p6RLsaA7qAr7eSCkRCK0TmLmEaWY6M1+EkcsvMklb6mflZwFrAeHDgbwzjb8ci67RBQ64ZrNuSOXY/oKqE8HYgwniix5Qsb1WlBpnBLiZhduPmAfZqHROFenUk/RMLNxAzzyhFvfVFgmPwJgjGAh0SBulDsuPX22GvjztP7Mq18GZly5F44PxBp39b0kyNpuhzJ8NaZe4GmIni0IVw6eA7bpkQ4bvGd9oxK/7gl28BCYiKt90pq0Dui5T1JKLnE3EtZ542mbbciWTzJXF3d6CBv+44qzX0FcT61p6F6mA5GRwo1xlt5aQgLcnL0D1Sh6Bnsng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSaMlPd1n60WDqEofOVejZY9QuGO73ochJ4Fd1sFjhw=;
 b=ZLUECT9cm4uXLlzeI8bthSKG0pOiPucuN7GKiEjSqxr4kICzIkmu6vTXwh7I18/sdumYqAPp89hvkwzAy/AJy3mTI4pXO2dwraHsbQcZ4h3wI9KHSYm1dhErVbPCXZWxEtM8YrVaxPCoqzTfanpu9T7Az4piSu7pWBKLl6cDdTb4lpPcatLWwvsv2ztNpmIa/DWnUGK84MyLWNP1758+vm5fZkiEIchxhP0jNa+tsKQTe80ENUIFnDvR4MbUJbyy1V+wZU9xkYjGm2LYUT+qGJ1QwOJirHUIh29PnE87R5UPt5d4s9zG5tWl0IQNTmLlZF6g7b3l9OzO/eP0QK9baA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSaMlPd1n60WDqEofOVejZY9QuGO73ochJ4Fd1sFjhw=;
 b=Sbhzw73t1jLMXF9wgD8+LfKfmcavh6CA7NENYiOPi5CSBCbeIwUepU+u4Gf6GAQYjqW/OJl5Op2bPBv8TjxAWR38lvEoWknO/DFRiQWnQ4w6PIUZjb2l1yUrY04fmbSWVJ6oYCnV7CwfgfYhm0uzk+0Z1RPUTBulc7bSz5FQVSM=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR04MB6237.eurprd04.prod.outlook.com (2603:10a6:803:f1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Wed, 19 May
 2021 07:31:42 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe%7]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 07:31:42 +0000
From:   Li Jun <jun.li@nxp.com>
To:     heikki.krogerus@linux.intel.com, robh+dt@kernel.org,
        shawnguo@kernel.org
Cc:     gregkh@linuxfoundation.org, linux@roeck-us.net,
        linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/4] typec switch via mux controller
Date:   Wed, 19 May 2021 15:14:46 +0800
Message-Id: <1621408490-23811-1-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0142.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::22) To VI1PR04MB5935.eurprd04.prod.outlook.com
 (2603:10a6:803:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0142.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4129.32 via Frontend Transport; Wed, 19 May 2021 07:31:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6554d77-af42-4feb-88a8-08d91a9825d3
X-MS-TrafficTypeDiagnostic: VI1PR04MB6237:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6237BAC0C7D466119269CDB2892B9@VI1PR04MB6237.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rHz/s6eyHgYM86NhHUoG0hUxDckxMrPIQEsXw/ngp3yDrnX1xcwsU2IsI0w7uCaqwp7tuMN8oCqE7DW1NYTbAwkDq5f0hAUdtrYqaYijz1se3HDuGuCSFOQQJhOi7nJepwe6GRrNvEeccwKV6jl8eP5AQfthd9SAG+YQ5Tj8PB/jDZtNp9iaNGZ9jT5RzK9lXXgJZLPdBxTbGQLkov8xKYyZ4wr5S9vg8FQyHpbtzKLZ+WPPdmcgvI5jTm0ZhYtm3WXsbu2PQxPsY+MOEl+r00iFjre/uWyMLrs3shYjmm3PWDJtvBgG10kFNWWmaRwf4/SAl9LScEyiYxq5AqPfINb7GrPpFv10SWq8FGZYoXq9jHQPwBteg1QPCK7RtEsl3+rquhKzDaF8At77nHRy8a0ksR7Q0pmqF30cs9Dsp+Vn0rPZ9AftkpeQwV+a9ejKY9VxNbhArEPROL1BZCJ8Fxe+rj435Eq9b/64PmgiuwANuczFqIGQL9D95LF8KAHxiKI9TNgUyiU0zMNAC4+QkeHINFr0Zt4TbGW8mtgdONdIgIlsV33bk+VVnZBp3VO+xhG9fZZi7hWu2/m0Wi9FrXOGShBqkufoxG1HCVnIc/76FtOZn454eiAB0WdnJqMuV+phWXz6yfXOkQtMC3u5xZ0bTT34Wfmads2s3X2YBUR2//P4rtrh3eq/ExkgPo2RPz73dUcp9we22zSnND4ehRqpl+SoKBtrNtrfefM0n0/q5/IEs5neZKyuTdgCjxx6U80NSsqahZ8wVIV7hxrvqn8I7/7l67YTpyIkr1SyftCYFQsjojTObsIOPtQkc7hw
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39860400002)(376002)(366004)(66476007)(5660300002)(66556008)(4744005)(8936002)(66946007)(316002)(2616005)(8676002)(956004)(6512007)(6666004)(86362001)(478600001)(36756003)(966005)(83380400001)(6506007)(38100700002)(38350700002)(16526019)(186003)(52116002)(4326008)(2906002)(26005)(6486002)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Teqg9C1OkTJEwa96DwwEY2uibvY3eMvOSiBwebDgcDho4lfNhgl6HtINnfzi?=
 =?us-ascii?Q?bZpgLHkUaCChnalZhoGKGW1nzfzXYckrtB6w9E4yXFOEfeTYdPXbPuEEELqD?=
 =?us-ascii?Q?K25U1tknQ/UbCRfpRAmI32KCFguiaMp/ng0ILdB9fiFVYmpHWHq8l1vIF2HY?=
 =?us-ascii?Q?wqStA8MtKyBRKN0SREHVOP6wl7pvl4eL2bprfsGPfvWQHrshhkG9d4gNjNvX?=
 =?us-ascii?Q?fxhA4sQNVRwIWQ9nuJlRSYlP72v2zLmGcMssLA1PLTcqXkg17pyvliqtyUEO?=
 =?us-ascii?Q?IAV4lM8XJit8olNbBLTb8sZUJWWzF11zJy0cxDWuwHcfv1KnARQvv4zOsFTU?=
 =?us-ascii?Q?1pp0zxyQczfq0CD1pq7dmIDAWU/YHD5xG91FIJbHEuKAVjm3fqlCYRK6Xjqb?=
 =?us-ascii?Q?0JB7Twx1y7y28uBrpdOWEFYio4Lu4/QUI/E9Fwi9ONxevp4FW8yALQJ/K+A3?=
 =?us-ascii?Q?9VvdB6IP6qijohAXD5GN2c2JFgv4kqIQo/+X/t1jRAQZb1oEw0tKWAjJLsrp?=
 =?us-ascii?Q?UxObeqgObUJt9iXr+Y9xn4tYauAUoeXgheALhoOGqt5g0Vv1VVtOCabR/Sgj?=
 =?us-ascii?Q?6v4gV8PXyzk6FhE2toKQEQcsuj3CX+D0nDiS6BiisJ2rMJo6pfqvU7hQQOWp?=
 =?us-ascii?Q?7m6y5kBV9w6NaKRRl1/Dhm1/X/Ztz2xvS0lrhTAOq/6rS3cne8IXdn74IHx0?=
 =?us-ascii?Q?mElV/BQ69MfrhuvwS/cu23qGWz+4RqQ6gnAwdxZItGXA9//HHUm7o0/+6nTK?=
 =?us-ascii?Q?1LvFSNUjL7sqRwJkDbJ5G+aFN+SjMcGZZZEjWc90aWLFh/4EIAy76ncey9S9?=
 =?us-ascii?Q?Z9wVkM3v82tUyUGyp0W88otjTg0deDOUG69pW/BZYtSUrDk3drUdCVNyq7yF?=
 =?us-ascii?Q?wP8zdUvVXIY3LhtnHh2Jbn7E37Tgr9/b1TZu2Mj9ZxYl9RqUFawHGRkXNfaJ?=
 =?us-ascii?Q?QsSc8ScWb7APyMzf7PJZ5jIDo1mXX4JH1h6VJugHRdA10l7fUbC25ArqkrvK?=
 =?us-ascii?Q?ZEjOq2AS+oe0Gn2ebjIElAOwOUkOJR+YjceNu2wopuAQASnXZIiwHiLan+aE?=
 =?us-ascii?Q?0yHSBJgVz0/dY3ivQDKsl3m7XXROtdoLw7RXiWhgCwMmQDZH9pwYyZXhtNgG?=
 =?us-ascii?Q?Nxxr4mh6Pp9B6Hh0FJ14D1Cex7g5nO2vWg189IW+ogwrUF1F7GSfaqilSKby?=
 =?us-ascii?Q?KAM5q2QAfxwchHHkacY0HWLC9xLwx1/cF0GaNVW2wB84K2PjHAzwqVvwe7d2?=
 =?us-ascii?Q?MBGYd5hjrhwDI++9ADHL782efO6rdMHhn0S3i3AJ6f7UUfMKq+IxSYnounfC?=
 =?us-ascii?Q?x9k93mrOMABirDfJQeMfci9t?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6554d77-af42-4feb-88a8-08d91a9825d3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 07:31:42.6244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rVrHNv51Rb+d1hEF2DVZ1wlTZjBKT1Bvmx5QhIl15ahDZZc73opsk37PqFDp0mk/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6237
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a follow up patch set to enable typec orientation swtich
via a simple HW block(e.g. controlled by GPIOs), the implementation
is based on Rob's commment to use existing mux controller bindings,
typec port directly use mux controller consumer API, typec_switch
struct is not used.

Last discussion is here:
https://www.spinics.net/lists/linux-usb/msg205492.html

Li Jun (4):
  dt-bindings: connector: Add typec orientation switch properties
  usb: typec: use typec cap fwnode's of_node for typec port
  usb: typec: add typec orientation switch support via mux controller
  arm64: dts: imx8mp-evk: enable usb0 with typec connector

 .../bindings/connector/usb-connector.yaml     |  21 ++++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts  | 110 ++++++++++++++++++
 drivers/usb/typec/class.c                     |  28 ++++-
 drivers/usb/typec/class.h                     |   2 +
 drivers/usb/typec/mux.c                       |  34 ++++++
 include/linux/usb/typec_mux.h                 |   4 +
 6 files changed, 198 insertions(+), 1 deletion(-)

-- 
2.25.1

