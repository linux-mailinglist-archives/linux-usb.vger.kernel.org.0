Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8ED977DDD2
	for <lists+linux-usb@lfdr.de>; Wed, 16 Aug 2023 11:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243482AbjHPJu4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Aug 2023 05:50:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243512AbjHPJuZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Aug 2023 05:50:25 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2066.outbound.protection.outlook.com [40.107.21.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A348270C
        for <linux-usb@vger.kernel.org>; Wed, 16 Aug 2023 02:50:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUW816crG4oU7eiR6zxUF/XyqvvMLICIoSpz8nUai/+kAEGa1GCUlMxbqaXBzzSgf6KZlK0sxC8sYYnZEGA81mEtaXoznooi7bSDHXEu5JIBxovYuj5KETPXNtuhXnEcygnRMB/o6jWd3dRRMEFqPj/ohFN91QxuTcM6sWog6eiox7m+GLHN+YT8EHwEU/YhwnQOH6Rsf6nGA+BMca0+jEZjroXU800PEuFWg2RQdPG9cyaezPtLE817PokbP9OLTHwBMcnxmlEDN/GeFe3pG2z3blmDzrDsarZWk1aNH2uPDxzBb14a10Vihc+ZqjSr0NGsmtZ9Ri8YPb4dn+1SHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ykStIzmH+3yaB1NJgwbjHu4TLeL4ethIMxR9J/oCLeA=;
 b=BmMQxmnyhBJSEphksHYK32RnjaROG5zJzvRIX5Rc6oyDLEyj4vM5AXrEySZmJXs0DRhC9C+DA6DYsirqZdn96ln1SZzOuEPfMp4/t4Sgkcgea1El4VzuBVODNghOoToSBwLehOcfAAOixwMJfCnNIiqFN9o9Ghfpr588o0Lm5EpkLSqmKBCmRf4efmfp7idvdHN7wMp8awKD7rWU/c+5b488BqXnZqlWE1zZw3mIldtzBJwSNv88+HOslC6ERNp8lyu/Hju661CNpHu5MT30pCtoaIrenALpstV/G6zhVn+vmWtPEoP8k8JDBnJVWnWIk7aNvuhm9lrEUCcWhTRqmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ykStIzmH+3yaB1NJgwbjHu4TLeL4ethIMxR9J/oCLeA=;
 b=RIIJtdS4K4NlSsBIf1c6e/NZ9TLcwvH1vXnNvAtMDHHk5Xuvhh9o5B7yfFUx50RqynTAGIWQPRELniWuaXmRlLJQf4cBuL4xC/mWjsxdwMjG8HuzSEM1TZVafJ/AmATNDjwa+BrVhU3vx1DVZ1F1BIBRfxDgTvtuJmnYH+8aE4VC27pCjJ+VBtqHoTLzyy7jnHIIMJ7dGJeVASzSXV4hOhjHk5qavZb2p/HZc1XSZTU80jJNeQz2wHtt4fnuauAp/pTLEkH26K4z4azXeVB3+4990Y4Jo+Be/7csNsSxpvtgNHRldqfdY7CWtTaYOwz7utAI6PJaN13R0ZP9qfDl4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by GVXPR04MB9733.eurprd04.prod.outlook.com (2603:10a6:150:119::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 09:50:18 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::51fc:914:29f5:a420]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::51fc:914:29f5:a420%6]) with mapi id 15.20.6678.025; Wed, 16 Aug 2023
 09:50:17 +0000
Message-ID: <cf57f9ef-90f4-7ef5-405e-78f79007f7bc@suse.com>
Date:   Wed, 16 Aug 2023 11:50:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] usb: cdc-acm: add PPS support
To:     dan-netdev@drown.org, Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
References: <2e5758f57081786db37482a50bc0e58b@f9ae53fa8754>
Content-Language: en-US
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <2e5758f57081786db37482a50bc0e58b@f9ae53fa8754>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::18) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|GVXPR04MB9733:EE_
X-MS-Office365-Filtering-Correlation-Id: 90f908e1-7ab5-4e5a-62f3-08db9e3e3275
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /cUMwrki+tZlTm4cYOzwWx6WCKyg+wBClMsuCIF81HD7vwKxzJmqhfQEsk8hLkk+Ktw/BHgnN70uDiTxrKmW4KH4Ri2Vg67nYKNECcy2NF18sysBHS88ryKdvE7CRnX+vCZFjPxQuzHyGD8d/pmLKfg/YXKtttK6WXyAwGDMC2nRLEIQbfOFRUjfqp9Ry7QlgABD1AcTvwEZzcRzW6xl4qq9QJ/lkU/Pubnns85rt98/UH7STSX6P3zJOV7BSgEA8bnhWTRnKS2wn0Ad40g8En/5qQ97f4l2CYPcxgec17GrzEldVXwHLoB6bLAHrxAqnrPpHtGUHnmPkvgWiZfECp55rAjYRTbh5DFPXPRO+arP0bYMjk8U7Zg+sb1swRbn4XmEgB+jPJ2wxyy/wVt+PLF9oIGFc0ms+xIWXvI3RHjGj9w4UG88+l7b1xF6sS7UilssNzxesjo2JSTsJv80gnb6e93alwqc4nwEmPycoy6Twb4b909JunEjcLOZLbaQbwlgoHIPTeBKlndGZd75o7J3yHZFnjZsqlK3f4M5e0J353OY9TWEe77Yxow2edcOyGdclalujyUFguoCRTyFrJ7/CM1Cyv+Vmxp0nEXghPmIg19UU/tFFXntOpgNZJmMUGhXAZzMiZsAaU04lyk2Qg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(366004)(346002)(376002)(1800799009)(451199024)(186009)(316002)(66946007)(66476007)(66556008)(37006003)(41300700001)(5660300002)(38100700002)(8936002)(6862004)(4326008)(8676002)(31686004)(2906002)(4744005)(83380400001)(478600001)(86362001)(6512007)(53546011)(6200100001)(31696002)(6506007)(36756003)(6486002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHR3bFg0enRhdzRNajZRV0xxcWg1LzFEMHZGWU41MEpTaWR5WkVQTUgyWUtG?=
 =?utf-8?B?MDdtbzl4UHVvN3ZiUEk1YUc1cGM5Y0pMek16UHlUcVd0RkR5QkRDRzc4bm9S?=
 =?utf-8?B?R3hPMDBpRHlpTTB3Vld0QkpZakZhZW9veHlucXlyMVNaUFRtWEw1ZklIV0ZW?=
 =?utf-8?B?SzlUWUJGai9SOUd1M29VT3JJbTY3K2FEajhaaGlJeFVvcGdNeDNTNmcrT1J0?=
 =?utf-8?B?UTJzZThNNXdJM0tXUERNVFpRR3I1VUVGcG8rL3lrcDV5cDljblYvNmM3NTZv?=
 =?utf-8?B?QWJ4VFV0WkxQR09OdlBXUURNUTBBTGIyY2ExY0xlUmlQeVZjdUNVUmZjV2kv?=
 =?utf-8?B?TXlrOEp0WThua2tYaU9OT3pjRmJRNkZDNGxDMW9PRUlmU1lMa0h3S1lGcE9B?=
 =?utf-8?B?MVdsU2tZdldFcWFaOUs0dndKdk1BZXNsclJBcjY3L0N3dHRhdkQ2aFlwQWJx?=
 =?utf-8?B?Q1NRWW5iVnhPbGxxS2xMVks0WEZ0Zy9YYnpsbmhEQlFKSTJGNzB6N1F0Vk4r?=
 =?utf-8?B?QitERW5MOTdkdUlMeDhXejArRDNKZzFVYVBSNHpLNm1HaUtwWVZjR3hycjM1?=
 =?utf-8?B?ai9DNkx4YkE5bVVGMm9CQnY2L2pnUDhYQ3JsbWlKK3hTYStlOTE5a0t1UHdW?=
 =?utf-8?B?QUU5cU9wVnliUWRYb3pkQmxQalRJTjk3UzhMQUNWd0xNMmFuTksrQm1sczZo?=
 =?utf-8?B?dnUzdGRSNEhrRWFkbXo0VkkyREtCYm9EYk1UdHA1UWpZaFpFdWk3RHNLR2dm?=
 =?utf-8?B?YlFTN2p0Q3VmREdYVnppZ3FjZ0N0UHVLamdqVzdXL3dVbGN2T1FLMEZ4bU1S?=
 =?utf-8?B?NlZpL1gzd3ZnSXBBT04rU2lEMFkzK1kxMWViT0grK1kvM0RQU0FOR1pKRnk2?=
 =?utf-8?B?NmNFQ3B5amg1M2EySnVrRXFhR2ZDcVBmZkVUZ0RVcmtwZ1Zrb1NkUXdzYjJa?=
 =?utf-8?B?bEp1QUFQa2tJd2FmK1RKSmkvQzRLVnpmSDRCd3JrS244OUZwQUlJRXgwTVFD?=
 =?utf-8?B?ZDdKeFNqeEYvcllEOWtlaS9lZktQNUtrdE9iV3lFUmc0UGdFQkRxbXl6ZXJi?=
 =?utf-8?B?QnN0eEN3OHpWN2dXSmFXc1BpNEVudkNsckM4VVJlMFFreFdHNWM2MHQ1R0xw?=
 =?utf-8?B?L2ZSZDhDM25IU1hDZ2J0YkcrMitBSlRRODJjM1FZSnpIR1R1UkV1cGVDS0kz?=
 =?utf-8?B?dzZPSTdkZ0tlWVZhbTR0bm1NT1hkK2hVNkdmc2JtUkxNQ3JtZDIrREtuK0s0?=
 =?utf-8?B?bHhBRWxFQXhnellwTUtkQ0Rabk5TTHpSOTBMdWw0QTV6V1djbnprdW03RnN4?=
 =?utf-8?B?a2pNMlhGWFcwTmlmRURZeEovbmpjMkwrRlJ0QVVjM2FjVUwyYnVOemViaExs?=
 =?utf-8?B?YVd4UjhoeTRPNnZjNDdrdUF4cGhER0xNT2FrcU9MblZOYzB6L0JjRlpVbXlW?=
 =?utf-8?B?UXE4Z09wQVRrVW5CN2lRM09pTTF3Tzd4dTMxL3h4Q0pFSEtaU0U3dml6cDVF?=
 =?utf-8?B?NzYwVmVzZVdLNjZvcXhUeTR4NkZ2L0ZMUE4vcGtXbUUyMUFCVzVad3JLYzds?=
 =?utf-8?B?WGIwWHFWLzZoTDJrR3l3RnA4aDRZN1YzbnAwVnlqaHdubU8zWWZOd1BBQUpG?=
 =?utf-8?B?SldZczZQMG9US28rUFQ5Y3g3WHZ4VDVIZVh3UVUvS3BreGRidEo0LzhFYzk4?=
 =?utf-8?B?Snc2NDNpTFZ6cVZQK3U3MDh1MUo5aXhZdjZZeWJHYVBxNGt4dHJjbE9yWGNI?=
 =?utf-8?B?aEk2Uys3UE9XUWxVWkhLa21ERW4vRzgvZnYwamtIS0VhUFBVeEZQOEVhOEJ2?=
 =?utf-8?B?M1RFOEF4OWtxT1lEcmJZVUZaYWJIQXRRVjZNSGNXdHJtUlBrU1hvdTBBWVdU?=
 =?utf-8?B?ZlkySVc5OUZKY21aU0dLWWRjR2JjbFRpSjFFYnZjNFBPYXd6ekhRRUVXayta?=
 =?utf-8?B?cUxTSkNCSDRCNytwT3FncHliVW14QTcwWjV4dDdkY01McEVHOVZiQUdZdGd5?=
 =?utf-8?B?b3ZtNUZSWHlwa0VRK0tNbXNRYjRHSVVKTHlnQ1Y1NE8ycTJWS2hVb05NUXND?=
 =?utf-8?B?OTl6NDZKNW85dllBVTdqakVEcjdLUmRIbUt1ckk0MW0vWVZFa3lpMVcwc1o0?=
 =?utf-8?B?c1daTXB4MC9PT01OOTdRWWFMLzY1dkV1eURaM1JPRFdjOXd0K1g4UFgxVUJI?=
 =?utf-8?Q?7mIh2KcW5HJ0HHI1FoIUKvd6yaoXAEDpQKWmgVXqzO7k?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f908e1-7ab5-4e5a-62f3-08db9e3e3275
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 09:50:17.6650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wPM26jfEG2qNbihhiZKr7Sn+HjGYurwfvEXoODNDFvaDmyYeXpPYEpDLIvfoa0O9w55FUuPkTmSDnx3mNGsKlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9733
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 15.08.23 03:02, Dan Drown wrote:
> On Mon, 14 Aug 2023 14:32:57 +0200 Oliver Neukum oneukum@suse.com said
>> On 06.08.23 04:26, Dan Drown wrote:
>> > This patch adds support for PPS to CDC devices. Changes to the DCD pin
>> > are monitored and passed to the ldisc system, which is used by
>> > pps-ldisc.
>>
>> do we really want to do this with acm>read_lock held?
> 
> Looks like it was put there to protect the iocount changes in the surrounding code. Are your concerns around performance or deadlocks?

Hi,

the lock is there for that and so that wait_serial_change()
will read consistent counts.

The latter concerns me. We are calling potentially arbitrary code. That
you intend it for PPS doesn't change that we'll call it for
every line discipline that supports that callback.
Line disciplines are supposed to do something with tty devices,
aren't they? So what methods could they call in turn?
Something that can end in wait_serial_change()?

	Regards
		Oliver

