Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 597D5787D96
	for <lists+linux-usb@lfdr.de>; Fri, 25 Aug 2023 04:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232148AbjHYCWE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Aug 2023 22:22:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232708AbjHYCVl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Aug 2023 22:21:41 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2116.outbound.protection.outlook.com [40.107.96.116])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D1AC1BE5
        for <linux-usb@vger.kernel.org>; Thu, 24 Aug 2023 19:21:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJEyBypLgiUlqOJ6ZQpr3NKoaukue2sRa78aVhhPEBRqDeYZpow6iI4e8bAuTR/Zv6D3mxxPq//aVgybzQbGWeFLRxmCy3HLOFyu/zyKsoPmz221vvos/ifG8M0RoXuglvlgmsQEZKq7HUYDkyrbdvaH+duqJ9sLoZ2QY1ZBui8JzEdjNHBYUgH6yX8jAJ7GFRO37JCe0YM+it4TLtyUb6Yf9maTpcyg0W7Hv4Sg6O7cNghQMw+rHl6gJRJH3vPFO00oRedoIXRdCDd5dhdBzPz9NF/Yz43hXH9ChKG8jIaHKW2qzeTgc7xsAm9JA67nChrBUVnCHS3BC4H0JbYhDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8gTL/n2wP5zMtEVNr0PG6+4Gaxaf3ZjKpHCLirgwIro=;
 b=f6Y5XZoTe3k+sl7cM7h4V3ErPiLY0TnA5nuM4x2Am57edB6PVcQzvOlZWc0OZetOZc1FfKrBzlTi6AHmNC2ODyfilgR0yUtCcvo0A1P4+biZubJaw1DroJRKa7ncZFk28RHsddgl85NNcrdI+wQ/0PdmqkiUWv0aMw61zA5BrSiDTwAhV9lX0HTibgf3OB4QusAuC27kuyXX6ZLEclssDiPvp3tj0tiwuinQCMF0uSMa5SIBDhoB7oGqcceqEJwcAuxuFyufAnceHo/RWYBx76oa99GeahJd3nIA4nsoBVpZEmme5vZ9cfePm2cGIP+2EcSOoeHPd1bTj3RThlswsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 201.217.50.26) smtp.rcpttodomain=ntu.edu.tw smtp.mailfrom=ips.gov.py;
 dmarc=bestguesspass action=none header.from=ips.gov.py; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ipspy.onmicrosoft.com;
 s=selector2-ipspy-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8gTL/n2wP5zMtEVNr0PG6+4Gaxaf3ZjKpHCLirgwIro=;
 b=dhuXoY79IwIye8bdvQa9CPx9NQ1A4m0eiYanngeDqsZQwX6AUjOlr1VsfahNat9QWct+LBNYjVbHGOI6eMysUXum/c9emsSNeplbCHFwgeeL8zbL5ws/Ka2+s3lD1Zcy3PA40AZrkaB7vAxxWtCfQWtXkmDCdtfnMON/yp/MBAg=
Received: from BN9PR03CA0089.namprd03.prod.outlook.com (2603:10b6:408:fc::34)
 by SCZP152MB7697.LAMP152.PROD.OUTLOOK.COM (2603:10d6:300:d4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 02:21:28 +0000
Received: from BN7NAM10FT095.eop-nam10.prod.protection.outlook.com
 (2603:10b6:408:fc:cafe::b2) by BN9PR03CA0089.outlook.office365.com
 (2603:10b6:408:fc::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27 via Frontend
 Transport; Fri, 25 Aug 2023 02:21:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 201.217.50.26)
 smtp.mailfrom=ips.gov.py; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=ips.gov.py;
Received-SPF: Pass (protection.outlook.com: domain of ips.gov.py designates
 201.217.50.26 as permitted sender) receiver=protection.outlook.com;
 client-ip=201.217.50.26; helo=mail.ips.gov.py; pr=C
Received: from mail.ips.gov.py (201.217.50.26) by
 BN7NAM10FT095.mail.protection.outlook.com (10.13.156.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.6723.19 via Frontend Transport; Fri, 25 Aug 2023 02:21:25 +0000
Received: from vs-w12-exch-02.ips.intranet.local (10.20.11.162) by
 vs-w12-exch-01.ips.intranet.local (10.20.11.161) with Microsoft SMTP Server
 (TLS) id 15.0.1497.48; Thu, 24 Aug 2023 22:21:23 -0400
Received: from vs-w12-exch-02.ips.intranet.local ([fe80::51d8:6d9b:b423:434c])
 by vs-w12-exch-02.ips.intranet.local ([fe80::51d8:6d9b:b423:434c%14]) with
 mapi id 15.00.1497.048; Thu, 24 Aug 2023 22:21:23 -0400
From:   Silvia Veronica Haifuch Gonzalez <shaifuch@ips.gov.py>
Subject: =?big5?B?sXqqurZsvWOkd7qhoUM=?=
Thread-Topic: =?big5?B?sXqqurZsvWOkd7qhoUM=?=
Thread-Index: AQHZ1vqyTwqZnphMBEiZmntUAOksoQ==
Date:   Fri, 25 Aug 2023 02:21:23 +0000
Message-ID: <1692929361060.27860@ips.gov.py>
Accept-Language: es-PY, es-ES, en-US
Content-Language: es-PY
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [102.91.46.189]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To:     Undisclosed recipients:;
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7NAM10FT095:EE_|SCZP152MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: fed5dc17-a6be-4737-4079-08dba511fb96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I/u9LzKdUEi+wlForWrpRA08y9c6C6CUuDvkdgo+f/0ccj6bIpXvEFTUOU15ZtC4D3VNOqC/YfHf3NcYjV15tliFyAPgX5w6Iewo+VxurI8Lg4d7nLnyLTZxAqJ/i7g66QwBJkPYqkWZBfbfjEi4BxB/KOmdfOVySGpZaCm34woZJCfyh7u8w/fX86vXuj632Jj0uZxme3HoNFgp+USG9FTQGQy3pEM56z/upVUXTUg8EfyOGX1thV6MApIn7GrqxB2PLdS4kTaS+ttiDYe2QWCLA5aRMN4C/KNUIqXu8ZINlGAbG3SiIWKgFkcXuntQDvGWjkg2giKukN2QrzcdWVaZCfodhH+7cRoQGZGCmRbzP7LeHbcSd0N0WNbSqUTnMyp3Mau5begUHzDyZ31jfMJk3KTiWLvFumsl+N0cTzh1/KR/DcXb+0F8jORtWhgsU1j+4jAw5HPg7UKZqA9u2BTtxu1uHVb0k+HRx0U2udg1qhtSzguUJUDlpuoVHq2q6Pc9i5vEUT+yNWNBcvtq4FjbGufmDin0KanIq4s7+jghmZlCbabi8D7pR84BkXCwRySHURpoMGIZL0nJjUT9FDce/odiZtYHzkCCOm6r2SluV8tf2N04Zu5KBtsPdD/97FZjGwVkdh2VoouNjCyt8xaKR/xQWDVcgNMOKYr00AZFfuyXVZl1cUtatrRMD/p5/QPzoEPngxxk9SJFRwBF66d1od+GqFA4+4iONgUob5Y=
X-Forefront-Antispam-Report: CIP:201.217.50.26;CTRY:PY;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.ips.gov.py;PTR:mail.ips.gov.py;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(346002)(376002)(82310400011)(1800799009)(186009)(109986022)(451199024)(40470700004)(46966006)(36840700001)(47076005)(5660300002)(36756003)(40460700003)(36860700001)(5009610100001)(2906002)(356005)(7596003)(82740400003)(224303003)(86362001)(558084003)(40480700001)(41300700001)(70586007)(70206006)(316002)(2616005)(8936002)(478600001)(26005)(7366002)(7276002)(7336002)(7406005)(7416002)(336012);DIR:OUT;SFP:1102;
X-OriginatorOrg: ips.gov.py
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 02:21:25.1231
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fed5dc17-a6be-4737-4079-08dba511fb96
X-MS-Exchange-CrossTenant-Id: 601d630b-0433-4b64-9f43-f0b9b1dcab7f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=601d630b-0433-4b64-9f43-f0b9b1dcab7f;Ip=[201.217.50.26];Helo=[mail.ips.gov.py]
X-MS-Exchange-CrossTenant-AuthSource: BN7NAM10FT095.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SCZP152MB7697
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

sXqqurZsvWOkd7qhoUMgIsJJwLuzb7jMPGh0dHA6Ly90YWkuYnVpbGRlci5oZW1zaWRhMjQuc2Uv
PiIgpUin87dzsXqqurZsvWOxYqThqMOxtaast3O2bKXzoUMNCg0KwcLBwiwNCqh0ss663rJ6rfuh
Qw0KDQo/DQoNCg==
