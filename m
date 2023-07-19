Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27FC075936B
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jul 2023 12:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbjGSKvd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jul 2023 06:51:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbjGSKvb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Jul 2023 06:51:31 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on0605.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::605])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54ABFE5
        for <linux-usb@vger.kernel.org>; Wed, 19 Jul 2023 03:51:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IHdNMjZJNbjAzaBUUp8Gf56LpXlTNHge7uDRQPue+xAPs8G0BrucCsIan5U6GfzGenAjKds7V6q0Ys1x/4sfxSncwAy5qT26/rkuH02lytPI6BAJ64l7aoYrwVIE141DuejXcX3RnfoGz8gDCt6KUIHtMtaxzS8wBcPVITzJYsD0lQ9Fml6A11n6ulrYmv+RCA/tr7Gwu1VpHqYFZOXcTMOICx3sF2F6jCnju/hiqva1SEC93Shwq50T0OVwVM+ovkLN3Qud8qY8qn0Wx/o0mRQ5a2NYN+A5xMAYziqX56hzWay88h1JHDfAUGjAddS6misN3WZriv/TvT/nOLMAgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvRrrBybdP6lMqP2FP++GxdZiS88Bo8rBo4XN5bnygA=;
 b=FSsoCszeiBslgxnuK15UStM82qN3eIs+m8V+tvsx+Hvt9m+d7PEWitOSqDPoivazGgMWLJfe9BZAS8PKk3U+ldU3S7WOT2Zkr2qmnwV3lKv+PwI8+CdYLJB+N8dunigIFs5pfyrErKc42QrVfwsqDzBWBDf765g5Pg0FYK9FFZ/pOuZartK9H4eOoXK+6kGJqEZsNid0qlkJkyNgsyeFnLzYft6wpNjz4U5/FEd0TyTucmyWbvskPsLRodtqYC7J/PRDXYY5jubT/uXVQnunxz8orzVegpJWJIcU9vZaClLBc5p2JUbx3MGWdvSNGkZloHKiwxe88c/n5r8/bf60cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CvRrrBybdP6lMqP2FP++GxdZiS88Bo8rBo4XN5bnygA=;
 b=gux0ojTNQKpwQnvYjY/cZDaJlftQn8OZr5b8GjAQSwXyg58Sr0FoFzcinWZVZ/hMJAb3jWs9jt66or/u6XLfvTU9Mrt0t1xlvay1e54d/CVaJSw/SHtuvBLtcLb6ugNZOFCuiDhYQr+PosHzMn1FRXb7FMlEn4vSsLeK2FzlAV/XTxZXHjdGSisM3Jgk11buj/x7uEEyMvfM8axw/vX4MJNH1jK2rYfuZL+vjLCD9iTzLQovRINb2iqEGCdLGwGPxgf6ZDa8R28TyglAbipYX076bzUx6oVdnVWJKg/f4xg8ha3md4aEdGGZl8+zmxCDE2B0m+e4AzC9ZLfN4BhupA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by AM0PR04MB6818.eurprd04.prod.outlook.com (2603:10a6:208:186::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 10:51:26 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::7ef4:97ef:66d5:f5b3]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::7ef4:97ef:66d5:f5b3%2]) with mapi id 15.20.6609.024; Wed, 19 Jul 2023
 10:51:25 +0000
Message-ID: <241c5df6-6888-0d6d-dbf7-900cfcc6b115@suse.com>
Date:   Wed, 19 Jul 2023 12:51:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To:     USB list <linux-usb@vger.kernel.org>
From:   Oliver Neukum <oneukum@suse.com>
Subject: question on sturuct xhci_hcd::priv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::19) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|AM0PR04MB6818:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dd757b3-7b9e-4217-bcb8-08db88461902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uGTvD5DG8HCpjMfkQRJMOuNKZLxbla+o+YseEIy6bBankuSKCbtYAhoOQe54MVvnvVR0eoz2pPzaTnCeWbexnOcOMvoSHTaAjUvD+hDTNFNj+99pWjCPnsjdeITaEuM3btnzRWfk8wOi/fsfAgE85TLR1dhn41gqQRuoA47DByG9+bZrwhPktp/WakZR4DqMeE/8CjA8gN0VVWxh/MTyxQKiIVetrilITcIaWX1UcRedMne/siVOU9cEvtt/wCJChWaU5mQEHGYjJlECX6GR8kGKcUyKqzLzS0i165sf6EjmRRlXGa4YenClvzYd0ZK/rJ9677TWxHvyVB+v+kEU/jKDRPKQ3772Dr15DZqY0kOkRw+sXEJD97rd5XalPMdIICWS7ggxPEoKPQlrVIoPmrzigwdGJunx6HJqTfj+k+0t0vue84mBo3UX2MVbvwPRZS4xpkC3hYJLHkd7JlZXynpoy4HJdEPwZWJ31JIMv6wuoe7mBYmg6X87bdNqcfUUE5kVyNJXjTXgopljkcX8YqRMUQekimJL+bDChjJVikmM96ufhchQa01vGLk4gn0++tEEdN1TVQ7/981KQKgK39JQ/B/nreKY3IfDf4hcSXeugyCjP+NAa7jDKO4bCaw7ss61LwCjVc14DDRAxglRLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199021)(6486002)(6666004)(478600001)(6506007)(186003)(6512007)(2906002)(5660300002)(66946007)(6916009)(66556008)(66476007)(316002)(8936002)(8676002)(38100700002)(31696002)(86362001)(36756003)(558084003)(2616005)(31686004)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHQvbXRaMFVSUUlwUmt2ZlBBU213Ly9OVGtnVk5BTS8vQnJkQmY3dEpBQllR?=
 =?utf-8?B?RUE5U2t6L3BmZlFnWnMzWlpCV2NucFY1ZzNmRjVVelB1SHdWNTlkdmZOT1Zl?=
 =?utf-8?B?czZXOXUzYUVTbzRxVzUzKy9PSStqbEIzSzJLZURGcWZTTGdNcUs0YlY4blY2?=
 =?utf-8?B?aEtmNHQ3cStDT0RYa2dsYWRhdDZEdVNmREdjQVpIMGtaU1Z6UG1MOGV5ZlJW?=
 =?utf-8?B?Q21OQ21HUjEyVVYycWFzUTlKUy9UQlJxSzVPa29qYlU0aUVrL3dOMW1aeW8z?=
 =?utf-8?B?OENudlErWExYK2htQjc2alBlcFRuODJvSGdleFNWdEt2Q1RvUCtqTWJ6dCtl?=
 =?utf-8?B?UWpLTFpVUnZDeWN2MFBTcUJ5Zit1alZBUktjcGZxNEJZOXNRaUFIOTBJL2ZH?=
 =?utf-8?B?OXVNWlRGQ0Z5VjV6bUdid1ZWWDNpNW16MS9TaXkvZ2hSaU9mZW9PRDYydkpk?=
 =?utf-8?B?cXlyVTVKUGpHZzJKdmFRdC9vTGRtczFCV3pzVnRVUXlkRWdvNlR3QVNWUmtl?=
 =?utf-8?B?NnVySHU1UEQ1YkpIeTA4ZUFVb2gzbEtRMVFXOUhQMG85enFTOWs0eUVNTHI0?=
 =?utf-8?B?QnVrS2gxQWZhalVOZFBvU3BZQzI5ZkVFVmRXYjRYK2VURHFEWFhoTTN0WElY?=
 =?utf-8?B?WDlmeFZwR2M5NkVmUndlMnIwMjhFQjhnUC9LdWJ3ZUhaSHFWanFuV3RJV3Uz?=
 =?utf-8?B?VDNmUmtwNW5UcTFSQjFjUElxbEtuZXRkazV5MGJDL0hQcmxTQmhNMlJObk5r?=
 =?utf-8?B?M0ZSSTdaK2ZHRm4rL0JwNGZvb09XVWFBd1UrZStPQk45ZFR2MkpPZjVGN1Rt?=
 =?utf-8?B?WWZ1NHlhcU93NUlPY3E4YWdUZFU4UmpjakdKR2VLTXR6OW4rb2dFSE1YMHRu?=
 =?utf-8?B?WEFiczJJc3c1NTB5THpLK0tUWkVvZ0ZOQnVJQUhYNXJmczV0TEdTV3ZTU3Yv?=
 =?utf-8?B?bVBvdGhwT1EwZkxVWThhZEtPa09QTjl5VGpTa3RUSjhDcDZHalorampkMEJs?=
 =?utf-8?B?RUNJUE9rR3JCbjdEa28yRE55YkxpS3NTYmNmNTRra3l3aVA5UGg0RnRzdWpO?=
 =?utf-8?B?YXRKeUV2RVVYNVlpV09kejZSNmJTNG1CMDBJbUhzdTZSOUw1cXBnZkVqRm1n?=
 =?utf-8?B?dDg3d25Cd3cweHY2eXNhZHhuSjBmUlpobVkwUGFpZWpZNzhmeFNyV296SVpq?=
 =?utf-8?B?Kyt0MGdibGtTdTlHZHY1VGFMUVNUblB5M3lScmdTSTdORGpFUWpJL0hBZXV1?=
 =?utf-8?B?MXE0eWpGRVYzdDBpdjlQNFpiRFArbWwrVmJPYTh6cG1WR1pWd2MrQkZCUEpS?=
 =?utf-8?B?SzN0cmRkMXB4bVYrTXRzbmVNejlMNmplVlpkaTdLd2lxdmsxZ3BScDdqd0tV?=
 =?utf-8?B?ZTVQSzlNYi9EVk9ZbjNTb2MrWnRPVldubmFPTHdZQ1p3ODByYk51K2lCOFFm?=
 =?utf-8?B?Y2t3T0JwTnJ6NldTbkZQRzlvcEM1V3BmTkJvTVpKWjU2Vmt5VTBvbis3QUly?=
 =?utf-8?B?Q3VXUWpMYk1INS9GK3MyS25WbnRzSXk1UlEyRUhYcDVyeFB3QWcrb1c1VnY5?=
 =?utf-8?B?aVJYWUg4N0lhalhoTTFBV0JJcUdnMy9qWHREbi91TlFqUzYwMFh0VmNCS3VM?=
 =?utf-8?B?NnBtV0V6ZHdvZk1jT3FBd2licmNtcktpcTllblRxWlgyWGNJa0g3SWh6cm0x?=
 =?utf-8?B?RDNDejYvUzlQeFgvVWhRNktrSVNkM3VoaExlcGxXTTYyM3RHU1hpR1FvblVi?=
 =?utf-8?B?UEo5MHVWaFVINE1tdWFHR00za1BpaDVIWnVDUjUwWUI1Ty9aT3IyaEFZWEFB?=
 =?utf-8?B?MlhLQkZaUlZHR2FCUmM4eGNsRGIrSFk2a2VETGc4b3N2N0hEVlJyUU5MM3No?=
 =?utf-8?B?aGpwSERvQXJaSFNDSEZOMm96L3pQbmR2ZWY5RmxFWllUS09RTEZRdW0zRytL?=
 =?utf-8?B?THF1VHJITTVKM2N3K21JSkVhSTh5SENnNzYyMnlSYjcyMHR3UnRTdDlaSTVh?=
 =?utf-8?B?SWpVWTZJemp6bE1IbVk5bHhIYURyQ05RRmVlMWtBeUhUUXdNdlNiaGllUlhs?=
 =?utf-8?B?dXgxNkFIWmNpaHo1c0hISW9jSWtGeGtiM2NJL0VQalZ3aWM5OGZwd2xnS3Ix?=
 =?utf-8?B?a0N6c3hDa1VNelVCZHcxTmVJWlBwQkpJTFBmTU5rNFNxVnhVczZJL2RQc0hj?=
 =?utf-8?Q?D8jO6EGBm139Hty1Chxrz7g=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd757b3-7b9e-4217-bcb8-08db88461902
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 10:51:25.5760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: osOw92dteBMxlccN0r29JPVpbQbLF8zTrpIFwcaRhyiv8alKobkm1YvIle3+CZ0rEuXepl+WZP2eR4ghDz5l9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6818
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

it looks to me like the priv member of struct xhci_hcd
is used only to hold struct xhci_plat_priv. Is that sensible?
Should struct xhci_plat_priv be integrated into struct xhci_hcd?

	Regards
		Oliver
