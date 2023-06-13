Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A500C72D66A
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jun 2023 02:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239493AbjFMA0g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jun 2023 20:26:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239496AbjFMA0S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Jun 2023 20:26:18 -0400
Received: from ZAF01-CT2-obe.outbound.protection.outlook.com (mail-ct2zaf01hn2030d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e99::30d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F29B1FCA
        for <linux-usb@vger.kernel.org>; Mon, 12 Jun 2023 17:24:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EqZdp6rtfyj3VbG4UhgzLqEfLl2mrLNDHayBtJLHrpB3pMJC0nih9EKFq1vxXyU8T1qEEyq5UUw5YiKf7bxWZpG5thpwCbf8Bel+7TXrpl0nrQaVnzdFS7g51MSPs3faGBL6FtglzXxwiyipa4Xplr2VY988KYZsOncGd1GhSplLxPjKvREYG/t1/hD4OmYEJMG3//3labWI2iRDssivknT+8gE/bWFGIL9GQJw2rSD0iek1xgG3O7KGYDnUYk4sfVzuXEP2c2CK3FyoTxwd2ftX9Gg9MgeRXDnZl9rjUZ5pfzbtKkFSeK8TilBf3vpm9f1Sf4DWTzhZ+ZHBWxqhUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ypllNK1Fapin4wbpo079ajyFvRdaTX3CiXPOxGn2Vw=;
 b=UEYTML+Vgfu3tbbmbk0fNIxaXj5AedIDsUDk/w6WWLlkv5AVLzCzgiR1f/fPX92mkKsfVZ7WRG8aDu6qUZquihVw/nR4Zt5E4In5UO16bSjeQZYfgqxdRNubxuRITucto7TFYWzJifTfKgm5bn0Ae1K9WfCNrnXdFHcD+obYNIJP9RC6/arjVhhGV+Ak0A9tovrcdfi9jCOWKTU7RU48T723NQ+XECsu5Pv0v4AaB1/S/7M/lVn7nW2tblI3BnZf/TLFbe+2ZpwHnDl6gZssvjnWoP3Z4ZUz4yrC/RO16W8nSIPCMXVlcjaERdphLltD8bgmrdhBMXZgFgseJtMIiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 196.37.118.239) smtp.rcpttodomain=nmrc.ucc.ie smtp.mailfrom=1service.kz;
 dmarc=none action=none header.from=1service.kz; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mutualandfederal.onmicrosoft.com;
 s=selector1-mutualandfederal-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ypllNK1Fapin4wbpo079ajyFvRdaTX3CiXPOxGn2Vw=;
 b=rAGVXAQPRikxjU7csPnzEYvc3w7Dc2qTCCubcsGj0TorKA9nSE88bRpBL7UVMW6fwTx+TwWFN4U0CvRjA5zSvjLgPmPCCRvaGcfpQOoR6aTsEehnFz3UNv5YOScGWhxCD2Wl91N8hd8y+xrzna5IqO55Cg0pUpq2o3c9oLea3xG7ZPntezLXuaZQSffYIpIJkX8rVG8oOuAK4o9/Jo/qUU7iCTtseCp8ps6Qcx1r/FwlTDulzI6/4M1Ga0RtYFT59d93gdgVdeBdakkA8hKxORMB9xU6RJ0mPUiuJKPOgsf+2swulK8sO9KiSQAP0wOTFjxUeAlpKFAkEk2rL7EWng==
Received: from GV2PEPF000000FB.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:1:0:1b) by JN1P275MB0549.ZAFP275.PROD.OUTLOOK.COM
 (2603:1086:0:23::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Tue, 13 Jun
 2023 00:15:06 +0000
Received: from HE1EUR01FT028.eop-EUR01.prod.protection.outlook.com
 (2a01:111:f400:7e1f::203) by GV2PEPF000000FB.outlook.office365.com
 (2603:1026:900::3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.32 via Frontend
 Transport; Tue, 13 Jun 2023 00:15:04 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 196.37.118.239) smtp.mailfrom=1service.kz; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=1service.kz;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 1service.kz discourages use of 196.37.118.239 as permitted sender)
Received: from mail.ominsure.co.za (196.37.118.239) by
 HE1EUR01FT028.mail.protection.outlook.com (10.152.0.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.21 via Frontend Transport; Tue, 13 Jun 2023 00:15:03 +0000
Received: from OMIPRIETS01AP.mufep.net (10.91.31.35) by
 OMIPRIETN01AP.mufep.net (10.91.31.36) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.12; Tue, 13 Jun 2023 02:12:07 +0200
Received: from OMIPRIETN01AP.mufep.net (10.91.31.36) by
 OMIPRIETS01AP.mufep.net (10.91.31.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 02:12:05 +0200
Received: from [87.121.221.62] (87.121.221.62) by OMIPRIETN01AP.mufep.net
 (10.91.31.36) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 13 Jun 2023 02:12:01 +0200
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: RE: INVESTMENT PROPOSITION:
To:     Recipients <info@1service.kz>
From:   "Edward Stevenson," <info@1service.kz>
Date:   Mon, 12 Jun 2023 17:11:57 -0700
Reply-To: <stevensonedward792@gmail.com>
Message-ID: <ee2f69ce-5c44-4bfa-aafd-c1cdfe330569@OMIPRIETN01AP.mufep.net>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1EUR01FT028:EE_|JN1P275MB0549:EE_
X-MS-Office365-Filtering-Correlation-Id: 746257bf-bf53-41e3-e53e-08db6ba33c7b
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1NJSSs2dWFnSkZhbWFITEs1V0JBeS82Wmw5V0ZFbHhMOTlEZVFiZGRicHdk?=
 =?utf-8?B?ZmhFaWZLVVBvU2oyVm5Edlllamg0NjRHdDRSQ2s1dkdCZHpla2RvMzl6WGg4?=
 =?utf-8?B?K1doa1IwTGJ5VG4rY3NwSXE1SVhrNkJ2QWtGWkg4SVUvc25XTHRCYVFwVDhl?=
 =?utf-8?B?ZlVYTzlBUVpVK3IxWnQ0WTJQSGx5aGxmRUtaclczVXRZVTlMWldJL1pIWHRt?=
 =?utf-8?B?Z1NiT2luOW02eFVaZUE0bzFkeVpEOVpqUmpmWDcxcVkyTzBZU3RUam1XQUlE?=
 =?utf-8?B?ZGhJSWJYWVdKM3lEVG9KSjlCUmZrb3hMVXk5QlVrdlkwN2JXbU0wYXR0MmNp?=
 =?utf-8?B?RUV5eHBMTEZjV0NDVEJLSTF5c0syaTF4VDhHNVVqd1E3SjNRUkVLODZJMVM3?=
 =?utf-8?B?dUN1Tkp6UXB6blNxWFd5NHViQVBsN3BVY25WMndNZ2U4NWI4NzR6ZWJZbUVk?=
 =?utf-8?B?M2JWbnEvMEtlaXZCOFlGM3VPWGJVWEZ4Ti9lamw4K0VuVDczZ292MEdiK0xu?=
 =?utf-8?B?OUJOZ3ZZcWQrbzA1TGJWWk9iQ2tBVE8wUEcvd0F5Q2Z6RWlEK1dLQ1BHMFZ2?=
 =?utf-8?B?Y2JDMjJ3VVRLTm9hWWF0VjZxMkl0aDkwcHBCem9HbGU4M1FOTVUrSTVmTGkx?=
 =?utf-8?B?MDhWYUxJcHhVNVhHQVJhSk1yOXYzVHhDVHZDZDJXS2hSQ1MvN0NPYWZRZk80?=
 =?utf-8?B?eUFYelgwZHJxbzluTXdqenpIcG1vUGVscmNmS05MSWVvc2g4QkJYN0JBdDJZ?=
 =?utf-8?B?bFFObHViSXpZZzVkaUNDdWcxTDQzRkF3U0JucVRzeHBoWVNpZEJiYnlxa3V5?=
 =?utf-8?B?Ly9LZ1MzNnR2R0w4czR0eVkraEVIcUhuK0twOUpNM2tManU0VnpIalZRSXox?=
 =?utf-8?B?VEt0TkhhemFsWWxmYnB1UmJDSTJyQkZwQjBHZXZUNUVTa3UwSDNCQnpEb1hE?=
 =?utf-8?B?SzkrUmxyQmREdUtIcEs2a0FtM2RZU0ZVcU5KYVh6V2ZzTnFoWnlSbEY2d1BO?=
 =?utf-8?B?anoySW54WWNndnZBdEVJdEl4bzk1S1JMMVNFeEwrOTJiMjdvVlRVMVhQZ01t?=
 =?utf-8?B?ZXlHMTAxbnRxSDBrZWx6blJLZTJVZkt5SStWMmRXcjFQM3lnd0Q2T3hBeVdF?=
 =?utf-8?B?YzFRMUJOUFAyK1NYSVBSSzFtSldLYVpTc25haXdaTFJvWEkxNUxmSWpMSGNp?=
 =?utf-8?B?ZWNQZ1pkK1BydzVNa3JzQzJxcFlJWkJPZ3VweUc2K1cyZHRxWVRHMHN5Y3Jm?=
 =?utf-8?B?NVFFVm9Wcmo1VVMxc3VyOEhkWE9oY3Iwa2FHYm0zOFNoV1hIeVg0dHNrNkp5?=
 =?utf-8?B?Rmg1bDZzUE50UCtQaDN1OGl4TGFzbkFZS3VRd0hWUmtQeTYzYm5XZjNCQzY1?=
 =?utf-8?B?UXR1L0hTOG1kVzlnMlpwd05VTksxZnIwZHFEdXJlaVBNLzZCSDBnQU1zaGpR?=
 =?utf-8?B?OGRnSnJiRDdTZWlHSXltbVRyRkUxN1JsUzNxelc1NnhWQUhTN2RGSERnZHVB?=
 =?utf-8?B?R3BGVEljbGNRU1BnTmJZQmJhTzdLZDgzRTk5MWg1Y2dYK0ZMWGlMakR2Q3BN?=
 =?utf-8?Q?ReieP2VwSOJu0kXThGZeWcP44=3D?=
X-Forefront-Antispam-Report: CIP:196.37.118.239;CTRY:ZA;LANG:en;SCL:5;SRV:;IPV:CAL;SFV:SPM;H:mail.ominsure.co.za;PTR:InfoDomainNonexistent;CAT:OSPM;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199021)(40470700004)(46966006)(6706004)(8676002)(8936002)(5660300002)(6862004)(16576012)(2860700004)(70206006)(70586007)(31686004)(508600001)(6666004)(66899021)(40460700003)(41300700001)(296002)(316002)(40480700001)(3480700007)(356005)(81166007)(82740400003)(7116003)(9686003)(7416002)(35950700001)(26005)(47076005)(83380400001)(6200100001)(956004)(336012)(82310400005)(31696002)(86362001)(5001810100001)(2906002)(6320200004);DIR:OUT;SFP:1501;
X-OriginatorOrg: mf.co.za
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 00:15:03.7432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 746257bf-bf53-41e3-e53e-08db6ba33c7b
X-MS-Exchange-CrossTenant-Id: 9cea85f3-a573-4c2a-8071-9288b3c683b5
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9cea85f3-a573-4c2a-8071-9288b3c683b5;Ip=[196.37.118.239];Helo=[mail.ominsure.co.za]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT028.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JN1P275MB0549
X-Spam-Status: Yes, score=7.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FORGED_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_SBL,RCVD_IN_SBL_CSS,
        SPF_HELO_PASS,SPF_PASS,SUBJ_ALL_CAPS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.1 RCVD_IN_SBL RBL: Received via a relay in Spamhaus SBL
        *      [87.121.221.62 listed in zen.spamhaus.org]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
        *      mail domains are different
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [stevensonedward792[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RE: INVESTMENT PROPOSITION:

To Whom It May Concern:

My name is Edward Stevenson. I am a Certified Outsourcing Specialist {COS} =
based in the Republic of Ghana. By virtue of my profession,I have my client=
=E2=80=99s mandate to source for Investment/Fund Manager or Entrepreneur wi=
th wealth of experience from any part of the World  that will be willing an=
d ready to manage my client's  Investment Capital for a long period of 10 y=
ears and above without interference from the ultimate beneficial owner eith=
er directly or indirectly.

Furthermore, you shall retain 15% of the Investment Capital as your Gratifi=
cation, Commission and Investment Management Fees should you find this offe=
r interesting. In addition, you will at the same time ratain 30% Net Profit=
 from the client's Investment Capital for managing the Investment satisfact=
orily. The Return on Investment {ROI} payable annually to my client will be=
 determined by you and finally, you will have a Grace Period of 18 months b=
efore ROI will be paid to my client annually. If you are eminently qualifie=
d to work with us as specified herein, kindly introduce yourself, your comp=
any and what type of business you  do in order to assess your qualification=
s. Moreso, add your WhatsApp Number for more effective communication.


Truly Yours,

Edward Stevenson,CSO
