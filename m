Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4773872DC97
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jun 2023 10:36:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241393AbjFMIgi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jun 2023 04:36:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241387AbjFMIgZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Jun 2023 04:36:25 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2051.outbound.protection.outlook.com [40.107.22.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CDF11701
        for <linux-usb@vger.kernel.org>; Tue, 13 Jun 2023 01:36:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mHBHO3/ceXtkhLBHjtfmox515Po7evuCs8gLnM0GPI53GeUZPE6xSkB4snZu/0Kc6qup0q4wCyJzWalRmokiAh8gi52xw5xxBJ6YzzQMEPL/RcTcnZ1EwnfouxK9vEZoC/9peg7MhYUox2MlJK2ZiZGwLNpVUf0Z1MTCWbBsR07Z5gsHXAcGobP979bhIppcOvshJp6LX5j3+oDmGy9Tgld6nssdXNxCVY6TteKuCB/KY12smuMADfPNWlLWTMILsUOUvRWprEuSq0AIIx1PGLvmR9O7UWmE3dHIc390qBioZAsf+AWRlrOjc/d9rB8EqbuSnMy5lrPm1cQ7UN58GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZepxi/qihV0EvRMAAUOtyiGQw/vmV3OQjpcuKcpUWU=;
 b=F1RgB2Hs/d6O0hc4EUUznZYun9KDe7HgZnt8Uq/sJIkx+Ulz+1LRdyQVKTNv8QOOZLuFJPPoV1qlrn4/eEMW4LSgf76K+NE5Zc9w/QNHQovl+q1zzW299XlpYS5L3ka4KVqaJ+n8NvD2qE0Jhs+6vcZxhHGYOVWvysQ7wvAjhzDBp0hvFmEEJpNGfwe5ONYiRL8TzAFRQfs9mJWA1Cz1h8j30QcVF9EysYb+rMs7sd5Wmjp5V/7jOiznoxqpZJK3a880kAshpVJ5EfwRb1ygPLso9JGh/0L/dq7UtwwjCiMt1xdMvXlG2mi5CDJxlhMk/nHZ1CnqKYxtDHxExoO3Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZepxi/qihV0EvRMAAUOtyiGQw/vmV3OQjpcuKcpUWU=;
 b=ql7PQw9SWZVaLlCHTEYyK+xpnhck5LUfL4W7yTTCvltaDTM16TNeb/agjo5iZKJnoJLfrlyRzHbFR0QJC6lh+y+F5jVFwnU1wo2XpIOZcvzjf88Q4al6whvNaOV3J9fKTHEU4m4QwPkFMJ8cKXHXTq682iX+quZo4vVPT1akh9Ce0ubp7gl0FYXuEK/HQT04YYlgi1x6Xz6wAoXBZRbFcmrMQTzBO51lh7WX4oV43KEW+PXjDGiXZIqjyKU2EBHC/iYLk8TlAGrXMgYluxJmODA/AJvvXELJxzNr9VoUz00i5ng8wkI2MyhYnlNnnYETO1ZsAeDZRneqAhOWu5G0cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by VI1PR04MB7133.eurprd04.prod.outlook.com (2603:10a6:800:126::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Tue, 13 Jun
 2023 08:36:13 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::a31f:d35c:5ef8:a31b]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::a31f:d35c:5ef8:a31b%6]) with mapi id 15.20.6455.043; Tue, 13 Jun 2023
 08:36:12 +0000
Message-ID: <d970e109-bf6a-badd-2e0f-6eb01015bee6@suse.com>
Date:   Tue, 13 Jun 2023 10:36:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: Cypress CDC ACM serial port not working correctly with
 autosuspend
To:     Warren Togami <wtogami@gmail.com>,
        Oliver Neukum <oneukum@suse.com>,
        =?UTF-8?Q?Michael_La=c3=9f?= <bevan@bi-co.net>,
        linux-usb@vger.kernel.org
References: <8be9b56c6becd0981d1cd9c13742df6ba2975b56.camel@bi-co.net>
 <0db2a0a4-6ed4-fe06-217a-cb564f1d4a8c@suse.com>
 <bde43a1913cf55e580e77ac0e059fff3c26dc093.camel@bi-co.net>
 <2f98290f-995b-89ff-8ba2-1463fcf78297@suse.com>
 <9a1381abe0e2b605786bc9c3b2daa3f7bdc3b64c.camel@bi-co.net>
 <e977c0e1-4604-47cc-9c53-619bc897d418@suse.com>
 <646eb1bb5218b9ce5df21e89081b09b84dbd46fd.camel@bi-co.net>
 <46e50745-63e4-7e97-739c-338f9a6445d2@suse.com>
 <c93512db198b14ff8892102cfecec3bea8688aaf.camel@bi-co.net>
 <9f8df0d2-f2af-8e62-fe34-7d826678ac7e@suse.com>
 <b748359d-b116-6354-036c-94679bc7b306@gmail.com>
 <3d485cd9-e31c-20ac-e595-3000ada983fb@suse.com>
 <76fadf60-86cd-91d7-1594-bbbaf75bc96e@gmail.com>
Content-Language: en-US
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <76fadf60-86cd-91d7-1594-bbbaf75bc96e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::14) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|VI1PR04MB7133:EE_
X-MS-Office365-Filtering-Correlation-Id: 194e3dec-58a2-4a8a-79dd-08db6be93e88
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a9sO1vT/wNCvlj9nBvdJgnaJJJOdP6tngGPoIKg5Oq4rz20+uIGxc3c1I2MseVKTRqNuc4CnU2YAhlJelE8BHHJnirGxcWdpo24HFpt6Hj299M2SfI+JvwZJL34sArBBwNvmtAI8G2h2SOP813dRGwAZ8Gm8JB63bLzkIgWOfjf3ywuirp//gP4f/RVeoY8z5LNhHnqzIJQFGcTibe28aPoFEUN1bs8sXXg02P90bz3xdbFdY/7qEW3W6BHx1hHO6IwjPtSbcOZHvCV8lLSyvxRmEII1qrNkxrGurNOwuaGLImQkaY93Nlh9zSO98+mh1So4HZzGQoEaARelJ0lXW2Ub+zx64vKCgiPux0PcMvLkAGMPbPmsdvgy1lR2NdbsG+pH4CcWq17uaJRs3UMRZ7yft4RqolBU70IjKJKqYpyxNUWGneDfFfU2yr+YOf3xj8YnTrUOEksHVbR/jg5AjMq3cdhF9rOfw9lveZd6vJmUFzgG3r89sVqAONTObrjKIj2vtkwRVV/av3DLWMCxarReSVQ38X4rSXUQAOwOlBKK8rjcLVvsAEHFqBf+BmTuzZ2DxeOgShLEJws+vnXNJg1L8m1GxjOi6Ceutf4dLU4J0g4CNIELnHm5Yu9OkdWzFCgZISnBYjt4pOjwKxS/4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(136003)(396003)(39860400002)(376002)(451199021)(86362001)(31696002)(6486002)(316002)(8676002)(41300700001)(5660300002)(83380400001)(6512007)(38100700002)(53546011)(6506007)(8936002)(66476007)(36756003)(66556008)(66946007)(478600001)(186003)(31686004)(2906002)(2616005)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmQ0bnhIa0JJREVLeWpRcmFaaWpoT3RJVU8zenJRZkFiYnJKeU8weDV5L1lX?=
 =?utf-8?B?ZnlqdHUrVlVmcUk2WDBuNXdDditxdldpcThPOGJqaXJ4MFROWWVhWWpzZlBt?=
 =?utf-8?B?REEzK2c2ano0eTVrQkxoQUlmbzF2WWxVQUdJSTNKNFNkNVRwMVJEdVMxdUFi?=
 =?utf-8?B?bkJNN1BrZUN3N0FmNTRaOGVocjRFRDlGMFI5eFIyb0Z4THdyUzRQVjJlSFho?=
 =?utf-8?B?elNVcTFiQVpTN0d5R1cvaUlXdXVGQjhIT2ROeVlFakdWLy9ESHo3bmpuWTJ4?=
 =?utf-8?B?NFpLK1VuSWFURVoxckRWZTMwRjc0WjA3QWdUaWFQTEowYnYrWFQ5Nlp1aXpY?=
 =?utf-8?B?eEgyV2ZrWDljTTRudlVyQ2w4RnFOTlBUSFlaZEtCTDlYaEc0enpjdFptRHRh?=
 =?utf-8?B?YjYyMHhkcHd6TndOdWJFWklTZmhMc1V5bXVVU05VS2hnd0Nad0RzaC85WjJF?=
 =?utf-8?B?b1hvUjNid1huUlNhWG1GWkgyNVZGR1JnMm1vUFpyNk9FSG83cVdpWXZEcGpK?=
 =?utf-8?B?NE5OZlM3UjdtUEhmV0hVOFJ1eTA5OHByek9hNFZKU2xyOUxqTVI0Y2o5Zjd5?=
 =?utf-8?B?d1RmNWZvYlNOSGFmYzRGdjB5RzJ2RzE0THVFSmcwbUkySTl6R0R3RjByUFpj?=
 =?utf-8?B?VzM2U0pNOVBHSFpYNDNQVTVmNzd0UTU4VTA0cC8xam5HejNMcm9TUlowaWkw?=
 =?utf-8?B?NkMzbFlYeXFlUVYvOUJtSHFicTdGY2xFTXZiQjFCbVFIN2pPSW5GeGtFNmJ6?=
 =?utf-8?B?cGNRaXU2RDNJaEVYWEM0V1pDR0sxVzhTTnhjcmhHNXA2VEdSSUxyVElRWXBZ?=
 =?utf-8?B?NHdOcCtmMWxXUWNWZ2dOMnN4bzFkczNPWHVBWUl2S0JRWmRoY205ZmNZU0ZE?=
 =?utf-8?B?T29QUGN3ejlrZEM1QzNmVlFuU0Q1QXFQdjFCQmZTVUpEY2tSRERwZDR2Nm1i?=
 =?utf-8?B?cDRMT1d6QmFoeTYwNlVCT1VXOHp0d0FJM25qRnIzU3Z2QUIzT2N3QVRwL3Ny?=
 =?utf-8?B?U3diUldCdHUxbFd0RGcrRUczWlBoUGIrZUFYaS9mSXRqTGp1YllOZTh2K2Mv?=
 =?utf-8?B?T0VsMnZ6ZmxkQngxQTJZYmNaTDZqMVZBallLV0FRT0Nzb093NGlRS0piQ1hD?=
 =?utf-8?B?Yk54T0FDVUZaVUxLWEdaeENxSHZUR2xRMHdWTHRtaVpMb1RxcWlrOVp2eTNo?=
 =?utf-8?B?b3NKUVZ3Qk43UWUxNHZxb0JWSHVyYVBqTmFBalY2eUpIVU9zbnJ4Yk52S1hW?=
 =?utf-8?B?RTgvVHBBQkZ0NVB2dGFPNDJMbXdHKzJOd1RJd3ErcFY4RnNzcWJaUHR2UnZJ?=
 =?utf-8?B?R3JFaVlkcDRNdkJaL051SGJ0SU1xZVpab0lLTFhuVE1wNDF1UldKZlNLYlVq?=
 =?utf-8?B?UllpYjVYNlRVNWhFTWkwWTRVcXZlS1hGUUU3WXpNM1p6NHZ2UzZqM3FYSUNN?=
 =?utf-8?B?eVNuamdaWXVvR1gzTEVEeTJxczBFaDVUZCt1b2Z5MFFJRGZ0Tm0vNW42bWVF?=
 =?utf-8?B?SGRHNnk5RS9DYmxGMGFaa1Fzd0NsU2FXcEh0VHVVSDdpajRqa3hlZDdMYmdt?=
 =?utf-8?B?ekNwem9QUFUvb1owS243Nm5PQ2JicXNjQTV0Z3Z2cjdrMUtkU1ljSVFtQk5r?=
 =?utf-8?B?M3ZkMDVNZGNwV3pERGxRbTBmcnVSQXFWWmhMbjBaTTRuT0tMTVhHYlY3SDJW?=
 =?utf-8?B?VFc2a3JFU01nOEk4S2NabjdOVEpkeE4xL25TeGR6UWVnTnZpM2YrYTJDVTkw?=
 =?utf-8?B?ZElnTkMwaUx6Zzg1SGZnNWttRTE4QjQzekRYV3o4cVN1cEdHUDdqYTJlMUR5?=
 =?utf-8?B?TkQ4OU1pMmhFYXkvWVVNQnJQUExnNTBXbSs3TW9Ed2dwWEloRUV2V1hXa2s0?=
 =?utf-8?B?OHBlWDNLaVRaUE9kb3F4WmgwYTVpM1VPbk9EUXhmVzFmRStmajlieVN0ZzhG?=
 =?utf-8?B?YTJrUVl0K0NpRFE3ZVU1cDBGazFsNUs5VGRHYkxoS2FmZEg5UVVaQ3pERzYr?=
 =?utf-8?B?T3JuOUFyVWJMTE5OTGY3Y3RWTmZiMzVWTVpqQnVUR1Q1RFJaQ29sMzlaV3Jp?=
 =?utf-8?B?WTk2Q3BFVWpHYnF5a1VtT2lLVmZYc2lNLzdXQjJ3cVhQd2pzQWwzQktmb1lv?=
 =?utf-8?B?YzhaWEdBVEcwaHBoN1BxcVVJNG5HMXpjUlY4c1Q0S1hhNmgydnFaSDdTYlVy?=
 =?utf-8?Q?3ffegMg2T7XbPLTXLVroKcM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 194e3dec-58a2-4a8a-79dd-08db6be93e88
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 08:36:12.6299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4G6eHKJFIoNt6nTpW9wTaf7EGiS9WmK1jpTWQe9FzrYR5qRL+nuEA4NzVaDClUKzdz1zj4tvhbZ7Oy/bH96Q9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7133
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 08.06.23 02:48, Warren Togami wrote:

> Thanks! Tested your patch against 6.4.0-rc5. Both usbcore.quirks=1a86:55d4:b and usbcore.quirks=1a86:55d4:p allow the device to be fully functional. It even works through suspend+resume of the host. Without the quirk the only other way for this device to function at all is to turn off autosuspend.
> 
> How should we proceed? "p" would be the narrower quirk.  Would this be appropriate for drivers/usb/core/quirks.c?

Hi,

having established that both work, it will be necessary to determine
which is better.

The reason I am not happy with the existing quirk is that it
does unnecessary resets and I don't think that they are harmless,
as they ought to reset values to their default.

Could you devise a test that basically looks like

echo "command that changes a setting the next command depends on" > /to/the/device
[wait 5 seconds - autosuspend will kick in]
echo "the next command that depends on the setting changed" > /to/the/device

Neither quirk disables autosuspend completely. They limit it to the
cases remote wakeup is not required. That fits the times while the device
not is not opened.

With 'b' (RESET_RESUME) the sequence would be:

open
write
close
suspend
resume
reset
open
write
close

I would like to check whether the reset, which 'p' omits, changes the outcome.

	Regards
		Oliver
