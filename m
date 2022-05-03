Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C76C9517F2B
	for <lists+linux-usb@lfdr.de>; Tue,  3 May 2022 09:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232447AbiECHxQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 May 2022 03:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231856AbiECHxP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 May 2022 03:53:15 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70121.outbound.protection.outlook.com [40.107.7.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8123620F49;
        Tue,  3 May 2022 00:49:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipUqsTECsKZEF0mrJxZw4f5VmA/sF82TvFjnekyQRJRgUDWN/pYMz8K/ECAl3bE3WTU4ecLtuKfv4IogjsJxmYZP6+SawdzWsTRnWmxGiBHDazfoiFW1BsNAPCyNV+Zr5pH8t4jO1Sg2dKsIyrTZ3lNRzBOMjxbDuzxwCbVfs5j77NtO+VhMKZLESpuUKcMlomePjXs9q1LEWq4q/f5+HtbR+uxNm8WcFogVM5v5C42D4DM6xwhshG0k20V6vWUdzdneKcZClKfranHm2k7h1yjX26t3FZiEO9HWT+ypZOZ1FQyMWrfoadtDbKTlt+fWtvHdrIX9rhalQTmhr9ODWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsQLuoiJhxfP5AUar4ml0eYFa5nisU8zchGtN2X83eM=;
 b=N/onsYx1TFLiefPwGNbg/IMXZwwyR/zxA8HanJPJ0djTnTPD2csq03qM4o+WdgIbhm4E0/+KnpnXsSREq+zI2VVcmaDQJXU8ZLTxqb8G8HX+LQzsEfIAJR/ymjsMSbId3DBx2PaIUQLyvCO2ZTrqDhbkoMVYeU9PvMSSSlWjIGNFphKdyYwNVF8mJJKOy4P5+lur59qM4d3aRs+iThBiyQ6MF56y1PvCKwe17chGniGUykxis26cSXRM1zrhopCmQovxftUC713KYpTmi2rXbYxF2SFwrGvHScTitu0fKZ8m9fRD2Plz825pnP/0XppnNfN+0eQPIMYJq8OB2RciEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsQLuoiJhxfP5AUar4ml0eYFa5nisU8zchGtN2X83eM=;
 b=grstJiWQUDyakBmz8t0ruBIqm079rFUMGA2A58WyAYlhAil3uGFzTMEQvMKhrbpaE1BD3H3ffkdwc0zUai6ysOBeXlWaQTmjJV0vi811/b4QiQ7HEh3zGFPtXCt5LeTk4oLH/aF7//VlXgSmBcuIw/51dD/LRawM1OwpY6PGATw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DU0PR02MB8737.eurprd02.prod.outlook.com (2603:10a6:10:3ed::8)
 by VI1PR02MB3968.eurprd02.prod.outlook.com (2603:10a6:803:84::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 07:49:38 +0000
Received: from DU0PR02MB8737.eurprd02.prod.outlook.com
 ([fe80::4d02:9bdf:8002:af7a]) by DU0PR02MB8737.eurprd02.prod.outlook.com
 ([fe80::4d02:9bdf:8002:af7a%6]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 07:49:38 +0000
Subject: Re: [PATCH 1/2] dt-bindings: usb: usb251xb: add documentation for
 reset-delay-us
To:     Rob Herring <robh@kernel.org>
Cc:     richard.leitner@skidata.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220426123329.775-1-du@axentia.se>
 <20220426123329.775-2-du@axentia.se> <YnB1ZQwpOBcT4zct@robh.at.kernel.org>
From:   Daniels Umanovskis <du@axentia.se>
Message-ID: <75ed6e33-0d67-c50f-4d3a-7345d5f058b4@axentia.se>
Date:   Tue, 3 May 2022 09:49:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <YnB1ZQwpOBcT4zct@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: GV3P280CA0084.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::17) To DU0PR02MB8737.eurprd02.prod.outlook.com
 (2603:10a6:10:3ed::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 933778d2-c457-4dfc-e8c7-08da2cd97932
X-MS-TrafficTypeDiagnostic: VI1PR02MB3968:EE_
X-Microsoft-Antispam-PRVS: <VI1PR02MB3968FB74C5F39B7948ED9C5ABDC09@VI1PR02MB3968.eurprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5JQkwVa6Zzd8GI5mFDv7U6XDE7Ko2gBuMf+tNr3ggBJUUvsjV8d7GHeVFoY4xQv2CM+mikNX4xvrFilZmVIgPNm9vIaKehxGtqlEFQf2KPs5+ppdIxGa5h9NfKmQPMYqfJ11CXh2fzaTwwFE27Z6/M8I9SCYASF/ansKatD3y4CfU9cBCqNo418H4hE9KpIRjGuWU0FeQAfe2HKXmwsy3LdF3hIF8BDHrcH69u/izfo4jxTnkPkEKpVlff6EJ7srpH+4bp+Az1e2ZwhMR+lfT7XXHaEn9TcFUDe/VP4vjyI/DKagDOpuevL4ExGh4Xrngv3ESrM/K3srAifeiEc6CCqkWEldgWuoKs2zCx6YQBMVuiph22zR7jRLD1zaJC8n6wcZzMYg68zJMa9K5LxB0qBrOrmAC4w7oTtdijUmHzGsTUUKwfuE/Z1HePtdVkV+MK70U9IYCNER7k2VSHYL0joVuhj7CCpbaKxaDeXkK6Bc8AW1BZLIkPjnkgzLxINRjDBgMM2NdQqVPrUAEbY8Of2uIpNx4uEdb1hKtOPKqwUzqDaYSdgHrjKi9j1xWTxB9KhtCFgMVyvpGEYnN6HLsgxoJ2VqLpOGWtdYL/c9teJKmVeJBBx8viMoMuIGIF7Z+n8d9rq5ryUYMLnzbMg5F5GHC67u60qJDwwKaDlhsHSpY/xnx1l63rLn3VO3S3PuntWVR1lVlaeRLnS625vmNFvoLZqpKlaM8TL1fQX9/XA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8737.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(346002)(376002)(366004)(39840400004)(136003)(396003)(31696002)(6512007)(38100700002)(6506007)(316002)(186003)(31686004)(26005)(4744005)(5660300002)(8676002)(66556008)(4326008)(66476007)(2616005)(8936002)(83380400001)(508600001)(6916009)(53546011)(86362001)(36756003)(2906002)(6486002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3VUVzVlQVREQ09FeFYzakNDL3djNVRmK0NjME9mU05WYTUxSngvb2pzSE1Y?=
 =?utf-8?B?UmhVMmZmL2wwTGFQaldRWVExQTF2b0ZZWW1iajRKT01CSVJtSzAwc0tDcUJn?=
 =?utf-8?B?b2owSU5iYk5aSEE2b1ZXOUd5c09xcFRHOUJsY1JzU3RkVmgwMUthTm9zM3gr?=
 =?utf-8?B?bnNiQTRnaFRPNVhXYkdINXFWUnZucGkxancxaFVGTnNDTzE0ZVgyNms0OWxJ?=
 =?utf-8?B?RmdXYzV5YVB5WEpST1I5djlZS2RwTHZRVmhISlZ4YjkwaEhVQTUyS05VUkk2?=
 =?utf-8?B?c0pzYkQ2bE04NjduekVCYlVhcS9jSkl1blZLdDBwbC9sQm1uQ0FUYzlrdWxD?=
 =?utf-8?B?eFc3WVNzL3EwZE1FR29PUkpwMTEzRnVpbnMrRjFjRDRJNlF5V0ZHSUVhNWUr?=
 =?utf-8?B?bUxhZFZsdjJYTDVCQmY3ZFpkUnRmZXpZRFduWVNVNFJUQnRTWGpNdlVPUWRL?=
 =?utf-8?B?L1ZOQTVpcUJXUE5SV1FpR3dYRnAyVmZzYnowYVl4bndrdGRLTkIyVjRHV2FY?=
 =?utf-8?B?VklZUkV1Z2FIS2xJald4TjU4R3lTZGQ2T0ZMNzB5alBzcEF2WEFiSSt5UmlZ?=
 =?utf-8?B?elJEaHFoaXFvb3lqMEJDOHBPM01PK0ozL2JORG9mTjY0dEZyemNneThBWmRK?=
 =?utf-8?B?dm42cnQxVm9GN01HbVVDdE8zUzI4V2pLYmlNSnFJWE8vZEJSWllFenN3bzY5?=
 =?utf-8?B?Rnl3bjRSMERRL0dJUnIvMGN4WTBGWEh3SGZTNnNyRWl6TmcwejU2OUY0SXZB?=
 =?utf-8?B?UVoyaVJTc1BuTmNFM3BaTTlyRkVxNlVSTHorWVFZVVZEcjJvOTVZMGVKSXdo?=
 =?utf-8?B?NnRrdmJ0Z2k4VkZhYXl6L2V4RnpjSnlScDRkQzdEMUdLUEdSQzI4eTQ3SEcw?=
 =?utf-8?B?YVZQTVdtbENPbExBTWdwWTIvSHJ5ZlZ4WkVLQnlZSXBLb1lKc05mZVFaWVpv?=
 =?utf-8?B?Z0kwSnczakVxVGcrakM5bWtYNmNQblgrWnRLM09VVHh1YlZCeWc2WFdTMVly?=
 =?utf-8?B?dEZxOGVHU3k0b0VPSWxhNUpISDRSdG1LUzRHZ0pYMXVEK0phS2g3elF2L2Vs?=
 =?utf-8?B?UDF3K3hJTVdtcFg5RTY0YzRJQVRhV0xFK2o3ZGZJTGVpL0ExVEpMeERJNFpz?=
 =?utf-8?B?SVJvSlU2cUU1REdyQkpWV3h5YTFBUjBVVjJ0Yjg1UFBON2RpUkdaZC9qa01o?=
 =?utf-8?B?SVZjOVNLS2hUU3RWMUc1am5JeFJCMlVGcVE0VGhHcTZsZWhUTlVZT25QeGVo?=
 =?utf-8?B?aXhhTzdJZXMwdEc1eVBtd0hqWTU5SThpZHFpK3ZURFRYRndFR21tVEEyZjVi?=
 =?utf-8?B?WTFvcm1GeENnWnpPL2FYQ1ZBemR4dHk2K2RKWnRlNUZCMFZxWGg3TTRzUmY1?=
 =?utf-8?B?T29NZXhCa2JjTU5sQ05sZTlzdXJjYkt1MHQ3SkY5bDRyQ25sSjAxdnpVbk9D?=
 =?utf-8?B?dVJlKytoM3ZYVGt5ZnlLU09RR1B1aEg0enk4NWtrcWRBV1RDLzJEZ1hPUy84?=
 =?utf-8?B?VFUrREw3eTZVY1ZMcS9Za0ovWnAzc3pCbEtZS05Za1UrUDIvdHU1aWJzL0Jm?=
 =?utf-8?B?NGx1ZzNyZHF2bEFMbElOaDBDQTFDaGlFNGQzaEFueTZHQkxGZzNpWm1NakRX?=
 =?utf-8?B?UXhCKzRiWWkxRkx4LzA1WXBPdHg1WkdQd21LZ1FxOFB1dS9qYzgxRk01ZUow?=
 =?utf-8?B?aS9ZVFVGVU9aZHdkb1RVVjljYTFIL3hpbUZBaUxNcHNxNkRFTW8wcWNNdGl0?=
 =?utf-8?B?YkRSRXlrY0JHRGo1TnFLTndQdk5nekhUQW9Cb3ZIRkZqazZsK1NXVVp1NEd2?=
 =?utf-8?B?TXhqNTBUcE1McHdJSlRXcEJXUXp4aEoxYksvdCtHYXAvUlIwb2tSWHVqM3JS?=
 =?utf-8?B?a2tIT2d2VEcxcTF5d2VMZUtpditEcGpDbzNMQ0U0NjRtWkFhcTNHMW1UVlNr?=
 =?utf-8?B?eWdYNk5KaUROQklPSFkreFdjV0NlN21BM3NRZ3F3VURtQ25CdGlxY25zWTJG?=
 =?utf-8?B?RFJjT2RScEpKSkZacEUzYnFwZEpxaHQ4QytpU3ZZVk45TWxab2c4TjQ1ZE16?=
 =?utf-8?B?K09jL25vMUs1am9TV3o1M0xpSjBBYVcwd0J2NEh6T1RZdm82bHFIN0VhOG8r?=
 =?utf-8?B?aExpTnVmei8zTUFBamkvM3dhMmphbWNhdG1DeE1RZVpPanBhaG5qWFVRMHhQ?=
 =?utf-8?B?VEdBL1p6VTdrOWlmRkVJOWVwblROVm0vMkpheXc5VDdVNS9uRWdPanR3RERu?=
 =?utf-8?B?ZjBwTWNMYVBpWU9XaktDUkd5SWpVdEtqWGk5akM1ZkxUaTlyb1hJaU5SQWlF?=
 =?utf-8?Q?KSAWchycHd1T7pvjtS?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 933778d2-c457-4dfc-e8c7-08da2cd97932
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8737.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 07:49:38.0344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XTs2vrVhdCKx478k0UFCx8bhvHePxamXy0evQB+I9QXBJ3cwj/o88FrtzHvby23B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB3968
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 5/3/22 2:20 AM, Rob Herring wrote:
> My first question is whether this is board specific? If the default or
> what the reference manual says is 500us, but you have a case needing
> 600us, why not just change the driver. I don't think this really needs
> tuning to each board unless the delay becomes noticeable.

This isn't a board specific issue. I detected the issue on a board we've 
been using for a long time, it's due to a specific batch of USB2512 
hubs. We've had several batches of these hubs that were fine, but more 
recently received a batch produced in late 2021 and the hubs in this 
batch do not become responsive to I2C within the expected 500us.

I arrived at that by using an oscilloscope to observe how soon after 
deasserting the reset signal the USB hub is able to respond to I2C. Most 
of the 2512s we have do that within 500us, the latest batch doesn't.

