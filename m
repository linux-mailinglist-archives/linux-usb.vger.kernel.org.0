Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9620A70D7ED
	for <lists+linux-usb@lfdr.de>; Tue, 23 May 2023 10:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232925AbjEWIxm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 May 2023 04:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232199AbjEWIxj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 May 2023 04:53:39 -0400
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2063.outbound.protection.outlook.com [40.107.249.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A435129
        for <linux-usb@vger.kernel.org>; Tue, 23 May 2023 01:53:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FGSpT8MUAkq/Ln8II8CJGKEfCXE9IrnkdXlINO3vtQBbcllvbwi4vEDnsHbl38oIdlGR3NPQ7azsO/kyFEUYzImIZ+pNaafzc+tDdwr7UAQ8UEMSThXiXi1mcwBadPmyuYmvwDT7fPGi5wcm4UnF7p4kA3yyMOJXp+zuOSDHro/SxYSgN0AOmoD1Ahtlwxyep8xs1D8Nd/E/tCrscq9nXrCRCoWZGmhgoxO2rd/PKJnEvYZlRnpJa6gWLDTrKL00LZVuegr5+Cw+0pQeKr5QszJ+QZAzY2tXKj4zBMcIWMz5oL7WIWNlC8jKMgFH8TvY1qSjCgyZTqV6TyfuO+kXtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GidUVkNZ7BuTxY56trb+rrpMsX6OfytocIoNkca1P5k=;
 b=F2xypUk4h4EaEwOc7tjAn2oMBA5HiYrgWTBSJfnovNdchuXKVP0gm9LfAaTeeDnRSQ9MD8DItHDSMDCHUT0CW5ScuTp1qqVw8HPwNwm59ovzB2SpyfbGobY0LePxIzUkejFBsbDeupuIxUJ+lD1tV+EGyQ/fAmfPkHNB70Y5P0/59jSMapbdZ0w3Iq6UlH+Tu0ODP8tl/0uIt16Wh6cl8XU3fFsMPlfdjs+fAyA68p9GnHJqLH0F+aEwVLHF7DLh/0b2dDIvdeGylcyXsQWE38V3sLM7HyPXiLwN3KVJHscv/kuVTIR0fAYul134xxD2IdvYiZLS9NjGGcmt0e6W4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.19.86.146) smtp.rcpttodomain=gmail.com smtp.mailfrom=nordicsemi.no;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nordicsemi.no; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nordicsemi.no;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GidUVkNZ7BuTxY56trb+rrpMsX6OfytocIoNkca1P5k=;
 b=AoFahYiT6ooKvnPUZ79MbJCb2Gu/9ik/4dYmOrCbIvwUuGZaMaT9HLc64++P+tbvUZSGBcf1mqnoncblfVy17fBLGaRrgDQX8hL43jc46Gj9IQb7DMdD9jA+p8SnxSp3ZJsMvQr5P916yERCESM3cAiMfx4BOPHTEr8V8cEDy1UVgRsNgQwi4lhCnVjqqszHwiCpD7y/6MH256A7U9vhfvPBdgVRxxVuXe1A7Qd4NrR6vAhbsZf0zTqIX9IB2Ri13KjCr8NgcIYQRiOd207eq8u+L68SFW7NKPzA6/F2QW7/pVB9W2XZmtzNuLsOy+tJF9IdjuDVXlGv02FKPwSljA==
Received: from DB6PR0402CA0018.eurprd04.prod.outlook.com (2603:10a6:4:91::28)
 by AS4PR05MB9472.eurprd05.prod.outlook.com (2603:10a6:20b:4cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 08:53:26 +0000
Received: from DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:91:cafe::96) by DB6PR0402CA0018.outlook.office365.com
 (2603:10a6:4:91::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29 via Frontend
 Transport; Tue, 23 May 2023 08:53:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.19.86.146)
 smtp.mailfrom=nordicsemi.no; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nordicsemi.no;
Received-SPF: Pass (protection.outlook.com: domain of nordicsemi.no designates
 194.19.86.146 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.19.86.146; helo=mail.nordicsemi.no; pr=C
Received: from mail.nordicsemi.no (194.19.86.146) by
 DBAEUR03FT030.mail.protection.outlook.com (100.127.142.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.6433.14 via Frontend Transport; Tue, 23 May 2023 08:53:26 +0000
Message-ID: <bd807b391dec726401e36a25f8c8987571d771be.camel@nordicsemi.no>
Subject: USB 2.0 host controller for Thunderbolt 4
From:   Tomasz =?UTF-8?Q?Mo=C5=84?= <tomasz.mon@nordicsemi.no>
To:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        <linux-usb@vger.kernel.org>
CC:     Tomasz =?UTF-8?Q?Mo=C5=84?= <tomasz.mon@nordicsemi.no>
Date:   Tue, 23 May 2023 10:53:17 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 
MIME-Version: 1.0
X-Originating-IP: [10.241.138.38]
X-ClientProxiedBy: exch02.nvlsi.no (192.9.200.127) To exch01.nvlsi.no
 (192.9.200.126)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBAEUR03FT030:EE_|AS4PR05MB9472:EE_
X-MS-Office365-Filtering-Correlation-Id: fa95de84-b5ca-473c-1bf7-08db5b6b2c33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vsj3cDkgpcoWx9cN4YmNnBV29Baehld7hUrVrfld2zRbOjiSj9Gxz4OV8mIa9D3IIRs4H0k7c8H/Tk4U95XPJMTotMe3Da5LlFTsKROBT4QK/Ts7Dgx62n1YwAtLOVDGW8rQnhqmYCCqLZrVLP6F8y4ALsCyzrbbELUPpbTEos5WEgABN+YS3nczF2ASW7J24CoPRgiHOLTO7Qr7141P0sxwbU03OXGwfr60c1UoYvj1o/Hw4nyfsMaaUpWtVWig5BRW2m1US3Uf8YChmetSCSogepC2UnFeO2N4BvsoeKiyJFAYIOGeFX0E8kU++kAnCfsM+5QuizI+9iqo+oI5cqw02gGHkoLTGwTE0f+Iyx2LRvVeIunuFyYHRnbSoljFsygofadCT35G1Xf3ZW+NnyQVlKF7Fhpl3nabBFNsBmZQoe5pPv/wJ76TH9YyV8F2HDbwGIn0iKUrMCMHeewTCfbh/MNQknTyNRqIAFXTxQed1aq11McS1omddz75rEAwajYBgb9EvnUxkTe+weeUK2YucdvV2UjWM1tl9/KFP+OnM7pVe+G23M0kUw2s9lGCAySldymNlJF1oesB7bMXs0wtF5yZptQoBvY6p5LcrCrEOM56JrDA+pI9RwJkzwwgWPgcWJ/iBVAkzlCHkQCiSkiToS6wYRY38JMGghBhYhZdVTO00J/yLccHlCOlaTcd9NlCCxG7s1WQb6F6Eo3avw==
X-Forefront-Antispam-Report: CIP:194.19.86.146;CTRY:NO;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nordicsemi.no;PTR:mx01.nordicsemi.no;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199021)(36840700001)(46966006)(2906002)(118246002)(110136005)(5660300002)(36860700001)(47076005)(82310400005)(8676002)(8936002)(6666004)(41300700001)(316002)(478600001)(36736006)(70206006)(70586007)(36756003)(4326008)(40480700001)(7696005)(6486002)(336012)(7636003)(26005)(82740400003)(2616005)(956004)(86362001)(186003)(9316004)(107886003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: nordicsemi.no
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 08:53:26.3138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa95de84-b5ca-473c-1bf7-08db5b6b2c33
X-MS-Exchange-CrossTenant-Id: 28e5afa2-bf6f-419a-8cf6-b31c6e9e5e8d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=28e5afa2-bf6f-419a-8cf6-b31c6e9e5e8d;Ip=[194.19.86.146];Helo=[mail.nordicsemi.no]
X-MS-Exchange-CrossTenant-AuthSource: DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR05MB9472
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

Dell Latitude 5330 with 12th Gen Intel(R) Core(TM) i7-1265U contains
following PCI devices:
  * 8086:461e - Alder Lake-P Thunderbolt 4 USB Controller
  * 8086:51ed - Alder Lake PCH USB 3.2 xHCI Host Controller

Thunderbolt 4 USB Controller initializes first and therefore following
usb host controllers are registered:
  * usb1 - USB 2.0 High-Speed
  * usb2 - USB 3.2 Enhanced SuperSpeed
  * usb3 - USB 2.0 High-Speed
  * usb4 - USB 3.1 Enhanced SuperSpeed

When I connect SuperSpeed device directly to the Dell Latitude, it ends
up on usb4. Low/Full/High-Speed devices end up on usb3 as expected.

When I connect Thunderbolt 3 dock, two new host controllers show up:
  * usb5 - USB 2.0 High-Speed
  * usb6 - USB 3.0 SuperSpeed

Devices connected through Thunderbolt 3 dock end up on expected host
controllers, i.e. Low/Full/High-Speed devices connect to usb5 and
SuperSpeed devices end up on usb6.

Is Thunderbolt 3 essentially tunnelling the USB 2.0 traffic (by
tunnelling PCIe xHCI host controller traffic) on the superspeed
differential pairs (operating in alternate TBT3 mode)?

When I connect Thunderbolt 4 dock, the SuperSpeed devices connected to
dock ports end up on usb2 host controller. However, Low/Full/High-Speed
devices do end up on usb3 (USB 3.2 xHCI) and not on usb1 (Alder Lake-P
Thunderbolt 4 USB Controller).

Is there any condition under which the Low/Full/High-Speed devices
would end up on usb1 (USB 2.0 High-Speed host controller interface
created for Thunderbolt 4 USB Controller)?

Does the Alder Lake-P Thunderbolt 4 USB Controller even feature USB 2.0
interface?=C2=A0If not, should the (effectively dummy) usb1 host controller
even be registered? Is the USB 2.0 functionality provided entirely by
the Alder Lake PCH USB 3.2 xHCI Host Controller (i.e. when there is no
TBT3 dock connected)?

--=20
Tomasz Mo=C5=84        | Senior Firmware Engineer
P +48 882 826 111 | Wroc=C5=82aw, Poland
nordicsemi.com    | devzone.nordicsemi.com
