Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 066E6721DEB
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jun 2023 08:17:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbjFEGRX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Jun 2023 02:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbjFEGRP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Jun 2023 02:17:15 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2081.outbound.protection.outlook.com [40.107.21.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F3E2DF
        for <linux-usb@vger.kernel.org>; Sun,  4 Jun 2023 23:17:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGZsSHTkQM9/CcQrBm4BWgCgxPjurr9eYi/uBd8oc3UMNKIRP2/Kvg0LTPLz6zn5fVlSSQJ7sFyWn24DoZ2KmiejzrOtCMMYln6FOnS1tNAiZG2hhVJjtMf18hYBahSbePvO4B4spw48CWUPoT3m6sqJ0eEpUfEENZwXOH5L9iBaF/v/ZWjlaMlxINpJ35+JsxOvUf9BvHjaxvSJN37bXAQQL7g1vQ8fs595/4GcFSZ8cMtuEfN4ZeL8MROQS8kEkr/50dRNHF4rj7bbGGd1Sj4ZE6n3Po7lhQeGkGzC6nQJREKU48WbpRH16yTqgGxrN69a0hAiHWEPYEOiTm5K4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CmYzP4atBImj0rGu8w4qph+VeCzNxMkV0gc4disAk0=;
 b=g1DkA9vMfWywopdjtR5+8Hppn263oQuUYDwPALqq8mmHBKo74/YU2HaE+Mp9qoaHwVOBCKEKqxtJvDSyGWSCH4YMpfgkaAIzjcXML+lYA1/F/4/lhL9U3CJabkX/6pTIYlexsGLmN3uTg7nYohV8dkTL1mDwntsNZSlXUZ4C7TuE4GL9HFlbny4G3SB8I4d2Birql3KHFjIc21Xwu60miFUi0zfb1GXFQqXHMXwnZqScQDEAIb6Ahf2t5UPRO15pojFP9HuaVj8Mi17I4U4vNVxwIHGujZI4XvEsYvAiGu5SQp9nWqtafS+0maWxPVPEThKTSO5NrXH2DbDe9Osz1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9CmYzP4atBImj0rGu8w4qph+VeCzNxMkV0gc4disAk0=;
 b=pCW1tGW8B5Qt4Ofa+EFl9OS3+QVjVI973Pa7Kcpwxd+oITqrXpthbpuxnpLcPb+ZAFQhAnClgU7+fZI1NIrL0D+o1LtgGIDOSDeUmehT5IRqeLcwm7BX1z0ehzCfPnBtq1iFirgi/tYDAdwtgg1BPM+ktHXILQYFC8p6b6/+RB5ybt+piJdn6xge7IyjbUbPCzAkNGbSkASKgPCAa2R9zoGNwaiyUIHt2CeH/jksVOd427MuvwEJSp3/pYm9Zep92nC0GjI5lnU/UT83Fde/5So/a9PANcMmzCbnTrh+hdW9MFAu7rzKi/xvaecpOcF9Pkk8UqHBXi4F0ZyiCA5kEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by GVXPR04MB9780.eurprd04.prod.outlook.com (2603:10a6:150:114::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.31; Mon, 5 Jun
 2023 06:17:06 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::db34:4ec1:a01c:951b]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::db34:4ec1:a01c:951b%4]) with mapi id 15.20.6433.025; Mon, 5 Jun 2023
 06:17:06 +0000
Message-ID: <a4539841-b652-973b-f94b-aec35d137cf2@suse.com>
Date:   Mon, 5 Jun 2023 08:17:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: USB driver assignment request
Content-Language: en-US
To:     info@kaufmann-automotive.ch, Oliver Neukum <oneukum@suse.com>,
        linux-usb@vger.kernel.org
References: <40a1a3f4-46bf-1f3d-34a4-ff5c6f67dbaa@kaufmann-automotive.ch>
 <02366b3d-0dcf-2e13-579f-3da3726175f6@suse.com>
 <c2193d66-bf49-6a0e-1b7a-cf357265ffa6@kaufmann-automotive.ch>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <c2193d66-bf49-6a0e-1b7a-cf357265ffa6@kaufmann-automotive.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0230.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::17) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|GVXPR04MB9780:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e126450-16cd-4f40-782d-08db658c7c59
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0DIe0AUuNJa1g4c2vW/Fgr8QfuTh49kD61ncJI5ssbPEFKn8EqYRTCAp0KIL1jGY40VWhfW/Jmyxl5b9zDEmUWqba29NoXvjLYo5BOpdjFXcmUko6Bmc7y2GtPsoRRBBSnRdyxnBqjQ2GJjWHJ3b8P1PxBWmlSCJ4vrgEbpcpatSOh/CXvihBUo+2pvECC/5RCfKIzSQUa799HC9m92isoBZ1KChs5AufeOvunG33q5zmVy7hhoFnF181v2ZEfZUAC0vuCcBPwqOFoEoJnKc8yCI08Af/R+8IVPL1DuTLD4uamiJDdnJsVT1LzBPWXc9dukUpz40p1lrvBtVpDoMVESoRxitaUXvGBuLeSeCga2jtkKjNNc0d9CcO85JwK0ozsTR9d7FzABTXx74Lypda13b177WjbAr6m+mEb51MBAlEJSP/QCGrk/6cN96rAALMX4Obx5BZZf3K806sqe/zxndkjIDcCK/FsIczmCRGOrfivS55mxVXkz6IgmCG6HATuc7aSJpAG6mDbck8iTAH4Vqpqsxo2FVJGQuCJg9v2caNiG7ULtxxiXjbBg5TYAv/Nao3+EiYYJayHgctPZeQWUaEJMS3WF3RuKKA8R73NRwgKDiPnbzjDooL3K32ZARGYNIUZ7rOad7yOPEvqDiqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(39860400002)(376002)(136003)(346002)(451199021)(86362001)(4744005)(2906002)(31686004)(5660300002)(31696002)(41300700001)(316002)(66556008)(66476007)(66946007)(38100700002)(8936002)(8676002)(478600001)(6486002)(6666004)(3480700007)(186003)(53546011)(6512007)(6506007)(2616005)(36756003)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azRZcUFpc1F6dnFQbG5wUU1qRUJVRWxKN1RBVnFSUytVb3FhNk1SdHBVQ2ZE?=
 =?utf-8?B?cW4ydDFxL1lBdUtDYjc3bEV0MzA2LzdhSHpxUmQ5RU5TZkhKQVRtRE9IZG5V?=
 =?utf-8?B?Qi9GMzAxMmtQY0tNcjJGOTAwWVBQWlZveEpJeC9nMU1GRmhQUUZ1QlhJbGo5?=
 =?utf-8?B?RG5iOHY4N1hYQ3VUZFZJbEVjQTN0eWcxUmNpWlg5dlBSQXJVYmVVd3VKK1JE?=
 =?utf-8?B?Z05TRWRZREFjeWMzSjlWL3hZakd6QXNWN3hndmU4K3ZjWXByRUlYMXNMMFBk?=
 =?utf-8?B?dkdqWkJqL0Foa3dXYmc2R0ErSjYyN2xURE1lVkxYSmdVOFI2b2lnRXllbk5o?=
 =?utf-8?B?K1ZsOFVFUVVyTll3U0I4U1dhUENzclk0bEd4SjM0VVpraDFhYjNYNERqVGpW?=
 =?utf-8?B?aWhZemhlek00TDhxSUF4ekpsUkxqZ2hodmROTVFJNHNuVjM0OFN5THU4UjVN?=
 =?utf-8?B?TGRiU015SWhSVzhyK0tOTzhTOTVRdlVDVkpWNFFwRWE2Z1hCSkdkQ05kUzBZ?=
 =?utf-8?B?NkYxTXVGdXEzRk5YU0pDT1ZCQ1c5OWQza3NqcUZlTVd0UmE2RHRmMzMrUXQy?=
 =?utf-8?B?ZWRTelBlM0tpRWdyRHg4Z0pJcmpBckN0MVZCd2gzcytVT1V4R0NkK0FQM2x0?=
 =?utf-8?B?SkVUNGlJZlNSYVhCdHBrbjdybytmOEdIeGNwL0ZlVTNTcUMweTI0R2JrVEp5?=
 =?utf-8?B?Q0docHhMVnNjVUd3VmJyUUIrWWVLY3FpWWNZYkhENjllN09GTGVMTFByZmFB?=
 =?utf-8?B?OS8waUZFL0twWXdFNngzcG5pdmF3c3pMc3Rybk5JUFlvcGttclpLeEhEMzZX?=
 =?utf-8?B?a3FLTmw3eTBDcUFaT1UxT3V3eWpkNnBuVzVpajlIaXh3Nm80bFFyd1NhcjZj?=
 =?utf-8?B?aWVHcGdNa0ZuWk1ZYlA2K3p3ZlpHc3dWcDVTK2J1Q25paS9OQStWVXNYTXRl?=
 =?utf-8?B?cHNEQ2M2ZlF1bzluVmVoeE10RUhZQmxtSU13N2l1NGF3VlROQUgvZW50dktm?=
 =?utf-8?B?RVpYd1hiblI5QUdQYzFJUzl3Qkx3RlVzVlVQTktMZDFXM2xyK0ZmWmtPYzFs?=
 =?utf-8?B?REV2SW1sbC95OWdUNkYwSWpjLy9GeEwvM1RkSnVrQkw2Mk1leTF3bEFPZ3dG?=
 =?utf-8?B?djRZNVR6Vm1STWdVWGZPd0RJU0FKcDRVc3dBL25ETzBpUE03NU1NanJWd25K?=
 =?utf-8?B?d1hpVjk0d3g0aTlqUzE1NjFHTjVMUmxCNkxsZkxITTNueXlBUkxLL2ZWUi9t?=
 =?utf-8?B?SnNQcjJRMURwMEdTTVlkNWVFRjI5MnVmNFY5ZkVRVjY0N3hJbVp5M3A1Uk5H?=
 =?utf-8?B?U0JvRkZxZlpMdnBrY2pDR014UFI1ekVLTDE3NnBWQytDa1V6M0dKdFJyS1ln?=
 =?utf-8?B?cmdVdlIrdDUzL29xbWpZcytnZkFBN3JZMzczSU5nWWJoRUJhemlzMWpvWEFE?=
 =?utf-8?B?cDUxb0FrWXViK0o5ZVRtSmlMRjltMXlJSTB0RE1GejFZTktGempsd2RxMnFU?=
 =?utf-8?B?TGY2QmJ1ZllsT1d5V0VzUjZ5S0lwUmlWdnluN1MwUEF1aDU2UlV6bXV4MWZG?=
 =?utf-8?B?U1R3ZGF6eWFJTWc4enBwMnlEcnhBRlpwUlYvMkpwS1psOHRlQjhQc0RicTFO?=
 =?utf-8?B?Y2w1THpsMUxqU3JoL0dBbTR4UkdGblI4WlF3T1FGdzVBNnJ1S2JCS2xUbldB?=
 =?utf-8?B?MFhVbEdPZEprbklickRUVDBzelFDRi93RWFCbzBCREExbnB1bndZSUdlbXEx?=
 =?utf-8?B?S0I0VTdBb0hsL0lid3ptM0tPUXc4NjdRMVA5c2pUU3NtN3BKdUZXQUd3SzZ4?=
 =?utf-8?B?akJPVTZTOTZtS2tJRWJ5UkJLRytJWHpzQUtJZ2VKSi9YTUUwMWszTisyWklR?=
 =?utf-8?B?cFBJb2pFUEpsalVybkJkZkJlMUVtbEdOelRJVjhkenY1aWZMeWhhOXFVL0xR?=
 =?utf-8?B?R1YzQnhDQlFtMHJKem5hT2pGcU9YTk1ES29rUnNMNEh6dTU1MEFhWFNBdSt2?=
 =?utf-8?B?RHp1bTloY0dQMzJpWDRseTVTTHYreTFWYjVnMEtRM2FweEJudHVuendhS3cz?=
 =?utf-8?B?MTJaTldabGpXUnlHekpZZzJZQ3RIRWpua3dhVklFZTFUZWNlVHlUaTJpSXJQ?=
 =?utf-8?B?RUk5eGFidjlDcU9PZjN0TzllTVhWMmxPVW14TzljTzJ5eXZyS3VTai9Vb0Fz?=
 =?utf-8?Q?c5YSjazx6F278Uzx8bhYEClA3ek0kERZWpDb43m2PiIt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e126450-16cd-4f40-782d-08db658c7c59
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 06:17:06.4977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ySxgrSceTKg3zBqReOBUqruLWI3kaTjf86Zll7ljWYrkUbFaCQM9hXyT8a1SgEnyh+SlM4Hgucdyawhhc+ibNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9780
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 01.06.23 19:28, Rainer Kaufmann wrote:
> Dear Oliver,
> 
> thank you very much providing the patch (attached).
> 
> I finally had time to test it and everything works fine!

Hi,

very good. May I include your tested-by tag, including your
mail address, so that it will be recorded that the patch has
been tested?

	Regards
		Oliver

