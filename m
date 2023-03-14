Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19F2D6B95F5
	for <lists+linux-usb@lfdr.de>; Tue, 14 Mar 2023 14:20:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231374AbjCNNUz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Mar 2023 09:20:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231627AbjCNNU1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Mar 2023 09:20:27 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2089.outbound.protection.outlook.com [40.107.7.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF84BA7682
        for <linux-usb@vger.kernel.org>; Tue, 14 Mar 2023 06:16:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J8arPkKEEacbZKde8sN64WKU5ec+wN+EZGNF/8h33Yai0GmgSASrQywPZfaND2MI1GBK5SIZWKiFBB7l17zBQrQSe41q2s1Jz84lU9VgyfiE2FLid0bJ2l8cXN21xVLvrza3WsskuvPAOebEqhTFRBAL/YU08sjt7esjODi/mS4EgyAzgnWZZsOUoWzLKMNdO5XHuzLsAeiwsLktWNU1zRCvYQHOeRBxJZ7SZzj4DFJhp1MwLgJ8QijWzJuw8tKFMS2aJg3TTlWdz5rXLNoXhcGoAOAYrWBGNog3xIjxP71A59OtXx91LErgcSejaWitkfcd4HSVGSn/5i1f5fSGDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzcsN0Bvbvi5LQP14p45u3HbT1QOTdXtVw+oL9UCsno=;
 b=FEkw4A0aV6kHj+FxMneC9jeSbEQ7dMc01l5xOJ/pGA4kWLnD71wj3rCmJBiAC9waxvGOL7IKvaBT92pSWmYc+c0M4ZJ3sR9y+XSIZFHtPlSVn9o1T9EyfwNJ7GY9maUhr4cIisXRGJnOVGuiaWSRUvLQGIkVNs9D1GrbRJLJ94e6OkHCWHpD8hPXZXo8VqnQNJACAilik31PSPwEO4Sa8/jvADlltopgi9diNRjQeAs4bvKVJhQDTK/lmIL2MfCfMl8MKUSBslfqO3My8yLXoBk60kurKc5cZREDB+k+qwxGV8pqiQidosrTRlbNgxXLmyA4YuQhz3myLsFT1JOvsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzcsN0Bvbvi5LQP14p45u3HbT1QOTdXtVw+oL9UCsno=;
 b=1DQAvRzHAD69pY0M2Eyv1E6gRLoWN/Vmr11wCr+XTigkiYBirBMa68HRqWvcZH5XptsvlcipmGS2NqV4m6gxqi9MOaHBqk3JMkGF5DYHIN3sCeGQSDQDppv8D4X4+M/w/g+dXdG48wv/UGsQLnT3Sy4htojr/4w2821k9qCzU4q3wyXci/D8WK7gKQAGqrlRWd/zJt6Y7XRmuEnZCL1ou9dD9PJeOWIv3zEaKWIuB5PR3FJ3Auj5DckVHM5MBP9ta0XN9UQXLrJVs1zzqAJTup+ZWRI+QzEJXcRqHcKlVpG4CgXHvNHL8pcEPddWFpHmigfeiHzymLsN2ge5ySC2rA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by AM8PR04MB7236.eurprd04.prod.outlook.com (2603:10a6:20b:1d9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 13:16:50 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com ([fe80::2ea:4a86:9ab7])
 by VI1PR04MB7104.eurprd04.prod.outlook.com ([fe80::2ea:4a86:9ab7%3]) with
 mapi id 15.20.6178.026; Tue, 14 Mar 2023 13:16:50 +0000
Message-ID: <2f98290f-995b-89ff-8ba2-1463fcf78297@suse.com>
Date:   Tue, 14 Mar 2023 14:16:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Cypress CDC ACM serial port not working correctly with
 autosuspend
To:     =?UTF-8?Q?Michael_La=c3=9f?= <bevan@bi-co.net>,
        Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
References: <8be9b56c6becd0981d1cd9c13742df6ba2975b56.camel@bi-co.net>
 <0db2a0a4-6ed4-fe06-217a-cb564f1d4a8c@suse.com>
 <bde43a1913cf55e580e77ac0e059fff3c26dc093.camel@bi-co.net>
Content-Language: en-US
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <bde43a1913cf55e580e77ac0e059fff3c26dc093.camel@bi-co.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::14) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|AM8PR04MB7236:EE_
X-MS-Office365-Filtering-Correlation-Id: 07f09540-2cc1-4c27-155e-08db248e5eae
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TvC7kTT/8FyJSmfkXUKDzjnf4GrHJboqFcSmVFp8RmCSVfNKDcfaxCU33uJXS5d+PWfxIljulvB8Pd6PlAUQFcweKnvdocExnjf5xELwYXWa119KKpctJ4WCTiJ/65i4+Z5LjW4Fmr6p71etj22OmxIs7KmgyJTOGHOP7qg2H83rClgp2kAGiyCDVfOFCyu4/lBYxuLN6h2T7YsvIFea7AkDW9s3rPdwPgxq3byu9GpaCyP69EYlvkM/ORQfY/Nbe1TP2Bt2stVLGYiprbRMdkhigzyhBJMPP4vG1V48O+2ucylD/rFVeTnjXGK5UwDW2McnP5YU7K9MU4k9DEOuLmaOTE+yxY2WcS1417wRr/HjXa4bQDzygLbDa251I4L8+IKBJX1Ao0YSorRqL1rSgBZCXZKwPrfYHLp36iAAMEkoK96tMIpx+HEqBSIxaFDTtGbf5scnxLZd4gyR5WpWeGizO6qjJMZXniUtkDIF8HpviHhhJKWtyAwUM/7ibRO0K3PHiHJ0wbju1s265WdfU3F3HEv8e57umEuud+JuWUDt+hPpticr6M/zrbq7fLmrG7JfQ+bG7KmM7wuZN7YhftoKH6raDtDso4kLh2V+v/A5ImDj+Js1ptul5FXuzQvfQW9+NidyVNLW3fhgbZfSMgBFiSzF0R8dSpam4SxUqpr0XvdG3ZARxS/zICk4830kBIy7hKsnWr6UIYzGhC6wIgV9k+ZgYSDCOchKeC8WVxM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(376002)(346002)(136003)(39860400002)(451199018)(31686004)(110136005)(316002)(36756003)(8676002)(66946007)(38100700002)(478600001)(6512007)(53546011)(186003)(8936002)(6666004)(6506007)(2906002)(6486002)(31696002)(4744005)(66476007)(66556008)(86362001)(5660300002)(2616005)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjhrMzdhOXV4bDV3VjRucmFYbnFyYStBOE8wYkhGamhIdmlKVXh2RDBjTFV5?=
 =?utf-8?B?SWxLTnh4eTQ5SHhpR3FhQktMQ2FKdFJubTB4UkczT2gxQUNieHlvL3BOeE9z?=
 =?utf-8?B?T0FkdEtrZ1hEYk1zck82Nnc2bkkyeEp5WU93OEE3VStIbGpEKzhGNXl1OGFk?=
 =?utf-8?B?a2ZvOEVJREwyZ1VkczR5dDlKd3pSbzIxYnhwaDE5VmdoWnB4Y1J6K0VwQXpB?=
 =?utf-8?B?WTNXZHcyZkY4RVVJOTN0bUMwNlFQSDcxWGtvOGhVcldjTmlyc2o5amZHNXFt?=
 =?utf-8?B?a09CRTMxc2pySTRVQmpSbUUxdVhjbTFDZEdTRDVCQkdvYW1VQWV4RVlvQnhh?=
 =?utf-8?B?T3VDMEo4U2JTWkxOdjlMT3kvTUZOK0dNT0x1MFE0QStmWHRkaDREWmRnWWJq?=
 =?utf-8?B?Q1hsckV2YXBHY0xUbDBJajNqR0RsaUZSNDNMdC9Yc29nM09HUXBDVnZhanJS?=
 =?utf-8?B?anJ6c21TbkRMclZZR0ZLdTZxQWQ1Um1lVXZrTDMwQzk2TkcvOFRUdVdmVXJW?=
 =?utf-8?B?YzBRTnpXcEo4bHBvdlQyVDA1eDJEcDZObkp2dUROL0JnNnhPbzNlaFQxVzEw?=
 =?utf-8?B?N0xDZXgvTTRmNzR5UWs3bUNCbzg5eTFrMTBOVzdycll1Qlg2b1ZNaGpZbFhT?=
 =?utf-8?B?eGtrbUtYQUgzYTA5dXhrVEVYdmYxbjBKOW9vRi9mQ1NmcFJCbE9MZDhFSjlS?=
 =?utf-8?B?YVJycytsTEc4VXgzRmJqRkx6TnplMWc2REt2b1Y0WVlSVHJNUkdEMWZ0blBt?=
 =?utf-8?B?S29LanhOcFYzd3FzSWFLQTZaemdMaE9SRW5RSXRhODlEVWVac1lSOEg2L0d0?=
 =?utf-8?B?RVh3WCt6b2VLa09wR0YzejRtcFBlMDU2RHo3TnQyVEgvVTN0RkRsMWJOYkR1?=
 =?utf-8?B?U2xoaEtPWHlLK0NoOWtnWkdLQjdEOGNUbWdSaTVJcXBuT1dXaXV6WWhMeFF3?=
 =?utf-8?B?eUhVcUNMNGpmS1dVNk5RL3BYdHhRbkwyMFpCMkg4MmRHSmdXWDZhQ1BUOEY2?=
 =?utf-8?B?TlduZ253Vk9VbEM1Y1ZYVFhTbG5kdGNLODJJK2cwcUpML3B6ZzcyWElDZUgv?=
 =?utf-8?B?dWVtbmZ3MDNFQitzN1IrQUJ2RTJBTXMyNVhxUTJQNUJyN1NyR0tabDVVSysw?=
 =?utf-8?B?cjlpSVZ0WW9BSmV6UDcwZUUwUStMdStLTjRVaWs5emkxdWxBQWhwTW91aEp5?=
 =?utf-8?B?UDE2ZE8xYU9GN2pGbDBuc0VmVS8vNmlnUFFNaGtIVHdwSVhEaUo3VTNBQnk0?=
 =?utf-8?B?aDZEdG4vczNaTW0zV21rUE0zSlVLWUgrMGNkTXFTRXZsOXY0OEdici9Eb2Jj?=
 =?utf-8?B?a3haT09xTTdjTmdGWjgvei92MXkvL09UdFJraW5oaWw1WitaY3hlMk9mOVBT?=
 =?utf-8?B?YTllV2lkOGdieUM5eUNjZ2VIUFBUdUVQVVZKaGU2SVhHSkFVOVN2VU91SGdX?=
 =?utf-8?B?MXhtbG5OYnZEMzg3bEg2UjF0OFB2b0IyM0NxOEx5VkFXL2ppbEI5ZFJnNWFz?=
 =?utf-8?B?ZnA4WTQ1bXdvWU1WZlF1YzdxUVVldGp4SGNZZkFHckhYR1JZUkNVUWl4VjhC?=
 =?utf-8?B?NU1GL0lXNSs4QTUweThYTmVyREEyQnRaY2ZNclNEZkFPZDA5eW82NGFKeTQy?=
 =?utf-8?B?bXRnSjFIcGJ2VFBMeEF1UHZBNVZXZDd0UHBCMkdEV2R3WXVwcTYraG50SExC?=
 =?utf-8?B?NTFIK25xcFpVS0pLbmtFaDZlVUswU24vOHVidERKaHUyWlFnVmR6dk4zNzZv?=
 =?utf-8?B?M1RHWmU1V09EN3BycjQ5TUxva1RUek9ESktzaDZBUnpQYTEwS1RnUFAwMlFz?=
 =?utf-8?B?YThxbnlaSFB2WElQNXczSFl0Q3pzLy9ld2pWeGYva3NGbEdSdzRSc21QOGtn?=
 =?utf-8?B?SkFSM1hlK1Z0ZGt3bzJoQXZBZmIxK2MwNVFpNDh6ZlpBTDdOWUlnN3R2NlJK?=
 =?utf-8?B?MTFpN0tuc2ZaNmoyVGVMVzBTbTB0dFJ4MkdleG5jbmxPSFJyNjNyNVNlbHZE?=
 =?utf-8?B?eWxCRXRVWGp0THUwaXNMY241SFBYczVtWWE3eE9YdjN4SXRoRDc2dGhKRmpM?=
 =?utf-8?B?UjJSbFVEZWhhR1V2N3JGUmNvaVA1cGFNbDJkbDdaV1VBZGdjNEVYYlk3VEFR?=
 =?utf-8?B?SXlCdFRaNEorK2lFNEQyNnFIeEMvRHVpNUhHaldLSlRWeFhzOGdOSFhsU3Ju?=
 =?utf-8?Q?DggmSKOXyZj2vuec9LX+kJK45irw4s58TgAGT56sRyZ5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07f09540-2cc1-4c27-155e-08db248e5eae
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 13:16:49.8617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +LEvAnvHPuWO9rFDAqza/UneH49e3BnrlfbT1vCxTu4qfd+zm8IvP9R0hpqOQJC4U1WqKqoWRvTNqFmuBQ8mVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7236
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 30.01.23 16:44, Michael Laß wrote:

> 
> What I did during the trace:
> - Use the serial connection to launch
>       while true; do date; sleep 3; done
>    on the remote device.
> - I received the output of the very first `date` but not the upcoming
>    ones.
> - After 10 seconds or so I sent a couple of characters and afterwards
>    received another `date` output.

Hi,

I haven't forgotten you. Sorry for the delay.
Yet for soem reason I cannot get Wireshark to read your logs.
Would it be too much to ask you to recapture with Wireshark
and save in the native format? 103K is too large to look through.

	Regards
		Oliver

