Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 779765F8A0C
	for <lists+linux-usb@lfdr.de>; Sun,  9 Oct 2022 10:06:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbiJIIGL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Oct 2022 04:06:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbiJIIGK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Oct 2022 04:06:10 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2045.outbound.protection.outlook.com [40.107.22.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB5992DAB8
        for <linux-usb@vger.kernel.org>; Sun,  9 Oct 2022 01:06:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CxLdAzZ+pPrAkc/rO3yGNiTQDnBNyBVoUg/CtPaSSg3xZa7b5GXtlD6ZjkiO7PTL3g6yIlaFAOR5lb615yccW2vKHF0gZq4CNbsZq6Z63My3rwVPtRgmgS3hvcwF4OpROFHso81mhPN2RYCpqX6gVovjkhEM8DyNgShAJgIBG4muDM9ObASFmwEcMatZ9VJsppZO4PrRwBi3U/YKM/45gAeo5EVLVVGyJ5Q3obwDf6K4M4WMXXyQ0j6p0NaH8/tiaSdHiry/kKdoQpB5fx+gvcxUVKWiqY9uzY79AMhiSicRQVb8bkb6/olbKX6CGLlJEhVq9JBWn7XvYRDutuv6yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cs9y1UPTQfCdHBQuuh1hrhcBag7ky52bXvHSoYzY2ko=;
 b=YUU1MOBS39wmc2VtrAo71DeD+7QqHQDNqzLd6r5FMzvhLyKe1fvrhJOoKpqQXr7z2Je85QWp/I0CEjlWyw9/3ZtzMc9x+fN95Zx9iTWg4LonBYnrgjcsPH8JV1knk0wal1mC9491jXmI5PPxk7UhyRDfzS5igWUDQRphK1MFlq9TD/c3Ag7zsrfjBVu4iGjqi2UUQkbF6FWuyCt1gVnY0bnid09S5f3KjyNOdO+TNwPlSZmN5usTHdWs0Jy296Be/THALkKrVC/pATD50jcJnQJP/KXM4MUa20JrGirBO4kG9G5OojzeLdo/+OYA2A9V0hHoQPN2JHvBv7sbMMgyqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cs9y1UPTQfCdHBQuuh1hrhcBag7ky52bXvHSoYzY2ko=;
 b=UAEivBisSHn7dMHbC4cvrzvn2lnoUib8lXjKF73N/w0J5+aZ9AVjxbt4tCssym39Ed9NFf6MtlRJSUFlwWvSyutBgwqtehhXCTzsZ4j2sk+qiT+YcBBoRmEwLh6jHXfGzCw95oVcv3dDOfE9fG2ezOG2quSdX4KyeJhGu+JaPXE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by PAXPR04MB9230.eurprd04.prod.outlook.com (2603:10a6:102:2bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Sun, 9 Oct
 2022 08:06:07 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::e9a7:fdfd:e80e:c6be]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::e9a7:fdfd:e80e:c6be%5]) with mapi id 15.20.5676.038; Sun, 9 Oct 2022
 08:06:07 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org, jun.li@nxp.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH 0/8] add power lost support during system suspend/resume
Date:   Mon, 10 Oct 2022 00:08:05 +0800
Message-Id: <20221009160813.776829-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::21) To PAXPR04MB8784.eurprd04.prod.outlook.com
 (2603:10a6:102:20f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8784:EE_|PAXPR04MB9230:EE_
X-MS-Office365-Filtering-Correlation-Id: 505f3dfe-dbb7-44f2-7a16-08daa9cd1e68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W0JE/zIrzH17dgb2IaQyfWMqjCm+kg9SY/HSi9p56bW0/hFPulv2QWzP/gWE5YbQz/we4YBdwgxzkSpczpPTN1rKvjmING+gFj9PF863MKpKlXydU/H3BofK+ElanIzGclNFnFiTzawAhfKAOmdizlUiijujxa+L6usBrrlX61u0/2BUt58KwY78Swo//Ccfx+MFbaPQmHfCT2bjc4zwDQZ55aZYU43x/Mbpd0UV3KfL3gn1CEPjSjTmY5W5++AxVpSryIljjKOmbRp1Xfda/Uy+voFErZkLTmVG6Ub9KT5gvACSkT7KRDJPTEmb8lUyS2q+PTxu5ARYN5nyDcOyr5g1wismCYnxf8Xl6QkcXkXYSKyXr2Z/kcWx5HH/2JFw1BGTvCPFRE//O9kHG5Vxy7CEHrobe6QCvcVLXKSMV1LeQ9mNv+Vc+WcRhvxvWL/l3AOIhCI3cQ5ZXGAxMfs/CtAjDDB0tTYPhSRDw+irOR6zhkktUAtXIBRNI30DfPFBIq39KWyMNpdDjNBcy96/uB6PZmZpfUdZDaugUc00ABxuj3e031ni6mYWEuVhJi6f0YLmphGk4Dbfpj4/4crQZYjeIWCMbix2aaCyEB2LJDbqrmR45s9fylr+kTq/vhCgiSk694DIBEgV2w0NpbH76d+QwP0mjcGwWqAmzKrKNbM8Hw87pKS/pODA9764ek/B4UHsihl81FMP2i/imwKKFrMOaCSbdYcjjGeyAtX+//qtmmhjlLh9OhQpPnV7XRAMPjCb/dEV+CFpM94eurWGgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199015)(83380400001)(1076003)(186003)(2616005)(38100700002)(38350700002)(2906002)(8936002)(41300700001)(6486002)(6636002)(26005)(6506007)(52116002)(478600001)(8676002)(15650500001)(66946007)(66556008)(4326008)(5660300002)(316002)(66476007)(36756003)(6512007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Man3GEWo0BawhT+Eza//eiAgQhlV7xlZ8dr1XMjOl84sAFnDf8BPJXob4+As?=
 =?us-ascii?Q?lp6ZzsQPh/dhFWXopWfy3uGKfwyf5aXWUpfraqsJ5PGtlxZKpqlhLGL+fjX2?=
 =?us-ascii?Q?gQPy5wkGIaUmBoQbbogwUQ1JMf2jCl3eb5/aZrcooFR0sjwfUUHfNh6FZDZy?=
 =?us-ascii?Q?sfDYMwUsBqBGuzPqgUAKXpZ6Y7eU79b+C1ChJm0XQHcx/iO7ALReNSl8wVmi?=
 =?us-ascii?Q?7JqaPCcuTcoy74uBB1BahVzHfeDPVigCsqM6OZ1lmWKiaq7NM5Mju9U+VjbH?=
 =?us-ascii?Q?+CxHrCKHkXeDTBIEEFQgySGXNMT1ghI+Mzh89xL7JBGJ7mxHx+BXdV1YEfWK?=
 =?us-ascii?Q?qpWmTbpqBzrih00DXCWdtHekRFdZtVV/cx+ZRvGCluiirn3ULlV8b+swOlFj?=
 =?us-ascii?Q?L0Ud4S4lItJ9oHQZUuyooLcYi1LbUEKrR6/jwBMp0nXpMZ4pdGjmd47XzNGG?=
 =?us-ascii?Q?ojDB6+xyHhSFOD5kMvvR8qwdzSZIvBGy6TunmVGAyOhj23zRUlcR3Vz214fA?=
 =?us-ascii?Q?dvIi4ZykhUoSI6l2zYwWQTgYSkzyt35fjjbvRGUbp2Qsh5R3zbPNRBnThBCG?=
 =?us-ascii?Q?Gdf4iTEs+suSpJxy7A7KFGVh+U/nuqOpkN9SoaYmglaPHvzBzi9/xM3fqWSo?=
 =?us-ascii?Q?5Sp1ztwhdPKId2GQU816ctLha2RlJXMH58yt+WWacRH3zHV7hTQDG1HQOSIA?=
 =?us-ascii?Q?zwTTvV6IViOurFDOkCG3cT7rxWASy91aV3oj2nEajvqYWUMYZTMRWz2eX1ex?=
 =?us-ascii?Q?rxXxIvPsUYq7XrH1wMREWgynFt2U2zlRyRUDwk/BzhbxHxmLqPVnuk5Fe+dR?=
 =?us-ascii?Q?sO4ZovWjLCtaHktUxDQo8+K//3EbAYfpl4OsCBnCIcLN/yoTbk9x5V/hlbsO?=
 =?us-ascii?Q?DSLP249NiY1Cj5LimB135JZMzhHv21M7tP1qOH5jbzRk8UDADDM4FrzGevwq?=
 =?us-ascii?Q?FUF6ZID8xbjuUWRCGKJqQxgjJ/KyY4B260bzCZ9D0VAXffmqKrNrdBLw96G2?=
 =?us-ascii?Q?rP71Nd1c+zh/O+2ktizeAsHWcWkB0G90kUFZ7DLrxp9yJTdqneyWXXh0gj3D?=
 =?us-ascii?Q?OjhNjWFo4tKWVY0UsaX1Kk6oGHNABNYgiR5nK3fU6w421aoL+u5L3xxzihtD?=
 =?us-ascii?Q?3s9Vrx/xFV3xHV7ToPOqJ+Du9/qy+yT+IugmrV+UMbo7DQ8MN2Znnq86OdII?=
 =?us-ascii?Q?zUGvGennlkKo9mv8WKX8stBiMLuI99medl96JUXOtsTJgGVDFbHCEr4j+mlZ?=
 =?us-ascii?Q?iD8Wd3e4AYyTvr/pvQP6PYDUyUlq55KpQ+vfkdR3ga9LxjPEbHKUz6vyKw5c?=
 =?us-ascii?Q?a/vFh/KFNWZwyCyfJUfgcdNVPLgS/I7ehD9DFWXL7u7hCibEULUy/CyycnNn?=
 =?us-ascii?Q?M3FRLpN1KfnlFks34QeQnBayO8QNXosdNgz+3gQMmsidakCELgUm9uDj5vJ5?=
 =?us-ascii?Q?wkI8i72bVBnl+YISXlpD0U1wFC+2uVooDT2tpSWyEokKAOjrX7rQ1uqT+aZH?=
 =?us-ascii?Q?V1cVWDJIKew6AZHjkasjbhgYUT/ipCB2cH3G0L9k18yTV8HG7YvGjhCpyG6N?=
 =?us-ascii?Q?VPgdJSCm4GB+8sgzi5/d3j2JTUfq+OWcp0tI3eYo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 505f3dfe-dbb7-44f2-7a16-08daa9cd1e68
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2022 08:06:07.2712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uDUBqgGVlTtRn/uHN3/VD9Daq23pIuM43IZjjrX8F/ah75NhXgMzZK0w1lalQ4i/fy1B7OJEEmC9aMrxgMg05w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9230
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For some SOC, the controller may be powered off during system suspend. Then,
it will not work after system resume without other means. These patches will
add such support if the controller suffer power lost. 

Li Jun (4):
  usb: chipidea: usbmisc: group usbmisc operations for PM
  usb: chipidea: usbmisc: add power lost check for imx6sx
  usb: chipidea: usbmisc: add power lost check for imx7d
  usb: chipidea: usbmisc: add power lost check for imx7ulp

Xu Yang (4):
  usb: chipidea: core: add controller resume support when controller is
    powered off
  usb: chipidea: core: handle suspend/resume for each role
  usb: chipidea: host: add suspend/resume support for host controller
  usb: chipidea: udc: add suspend/resume support for device controller

 drivers/usb/chipidea/ci.h          |   4 +
 drivers/usb/chipidea/ci_hdrc_imx.c |  49 +++------
 drivers/usb/chipidea/ci_hdrc_imx.h |   4 +-
 drivers/usb/chipidea/core.c        |  88 ++++++++++++----
 drivers/usb/chipidea/host.c        |  12 +++
 drivers/usb/chipidea/otg.c         |   2 +-
 drivers/usb/chipidea/otg.h         |   1 +
 drivers/usb/chipidea/udc.c         |  28 +++++
 drivers/usb/chipidea/usbmisc_imx.c | 160 +++++++++++++++++++++++------
 9 files changed, 262 insertions(+), 86 deletions(-)

-- 
2.34.1

