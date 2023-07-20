Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 584D375AEA6
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jul 2023 14:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbjGTMm7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jul 2023 08:42:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231462AbjGTMm4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jul 2023 08:42:56 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2057.outbound.protection.outlook.com [40.107.8.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B10632135
        for <linux-usb@vger.kernel.org>; Thu, 20 Jul 2023 05:42:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F615djUjP3vppUeXvqgQPCkpkdNh+PW/tLlamEV+tuXgRh3DkjOoXCT0txFt8a5edP8oGOg8Mk1s6qzuUM7eZR6rZxCcNQnhITFTPA6bl6Yq8VjYQPznAtHdRGD1gjURDfqtoAcFIFybl3Jv/LJBACewmBFd3vqg2JOkO/RQTeAxT+hFOv9iJgduLoUwsYi8ZtCYwEPksgFivfihGIPl3zekHDzH44oReWkFHN1eu08X1hxEThHJgPm7BwqD7Pd450SNX37dbkZiBAlgJ+111xKTtd10l4vwzmjqQrNJip+Az1XcMAWxOcuPIP2aKkbjEqxdYbjNgRT3DEBysTXlpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+SmsA8ctax0lJ3fUFjtrqMvJ1IVmgvaPvDxge149wI=;
 b=lOkq+rAwR3X8rEN/eZOuEt72yPoLdwgYPXsaKdhXJWKMfI0uH9YSSIKtIgCjZAziV7csGfXcqjNG9fvZIRxJQr3KlCmPUmNUcbNIamH5V0iEQKC2pvK0kla/HA4iKUzgsr0WmQQDS74FHf2uvMZqX1creKseNC2FzLWFdcIIa7XNa2JKj0p80s62Pw7Fko1VG78Zti+uY4mp43cRwnnb6BPYwXIggTyDxHKmdjXCqROJhsM/m0y73MMPBWM7wU2J8CzDnlcbHrxCH91BVmVYPn7fAXsHREWzFBq+9bQd3qjopri1CZBbIYBajDufJZmkXh6PmPh0hOHU/BIjo8z8Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+SmsA8ctax0lJ3fUFjtrqMvJ1IVmgvaPvDxge149wI=;
 b=xy0mdnqZhLdfA8PdBDyitRKwgGqo9XMD8zgJH58csBHki1Lh+xPxq+om5EC+WafhJRpDUHHiaDX1MVDxHwjjWb6RxZnbRYLlp5cV1R8JC7rIEODR+Wjao3vHOWnTP+TFVMJzan2Q9hZ7ZRlC2bvQ7MhzMPT++uQQUjUz4nGldLwwXJKYOpiyC20cg6YXIlCAAWqbX4qXPFO55OcZbm3Ai/wl8FUQz1o0cpyfvC0iu9XHitUSc/JM9XBWDE0iGEE2mxpPGzNgFkkYrGOp7pliHF0iw7aKBQpbibTiXeyAYrOK+Wbg9usgo2ant/h4Yboxuq6Ve3w/+GvX+tmn43iOqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by AS1PR04MB9285.eurprd04.prod.outlook.com (2603:10a6:20b:4df::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Thu, 20 Jul
 2023 12:42:52 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::7ef4:97ef:66d5:f5b3]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::7ef4:97ef:66d5:f5b3%2]) with mapi id 15.20.6609.024; Thu, 20 Jul 2023
 12:42:51 +0000
Message-ID: <095626a6-9442-97d8-8b44-dfcef8b47e51@suse.com>
Date:   Thu, 20 Jul 2023 14:42:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] USB: serial: simple-serial: spell out the ordering
To:     Johan Hovold <johan@kernel.org>, Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
References: <20230720114406.14587-1-oneukum@suse.com>
 <ZLkiITEahEbu3XbJ@hovoldconsulting.com>
Content-Language: en-US
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <ZLkiITEahEbu3XbJ@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::13) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|AS1PR04MB9285:EE_
X-MS-Office365-Filtering-Correlation-Id: c7fc8b54-9ae8-41d0-badc-08db891ed4a5
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WAKbdaCuPBHuKVJEh2NDEz1Lnvp3gv9nNoZ9AEeMuZu+EvpIFx6RafxruSXXPpJaruVSJ3MC1WZs/nohI9ix/ahdtmXUz6pofRKa1t5cp75OjxGdu38/QLfuu2BlElhey69PU8Li/gyMhM8RNRmVCEvZBlbSXxsgKjzjrUirFewOvUUBbLLitoUGLVOws6VyVlKEsMIMM58OD4HTbn1qtlRboNq//El3bu/OG9rqz5ZFIWi4I6Oqg2TgrDlwt0urjyb0XMVsFyOFN9LtmD7kM4aTc7lGc6afKGT/r1J+a+CED2WpRF2uX6r2y6XyE1xN/Rc0FPe2VYCZFUgyOtH30NwotiPZkh4aybHCQqxIfc55mrtG3HduRMePuCRtwbOS7uJgiZ5VTlNNkL9JszFpxZFzKHAzSLM84XExnjitsefodmDZkM4Spb8jOes/qr2nTBV0j59QhP/J/m0+XSYUpA/uqLahqe7BaFR1Ux5g5EnpJpy8KvHLw5JOLQ0bPvqjCbkZ9/iGAtIKJamENxIElEJfzFc5cwMXBfrKCZtSIwD9TJpeV7G/zN1M+hZCyjc1wAGLHzAwu+9zZMtcimvniS8ghifTm5uvnv2x277/X0ZN4nshwEauWccD0fLmvjQ8MpMp3U+669uD8gDxbZEp/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(136003)(376002)(396003)(39860400002)(451199021)(110136005)(478600001)(6486002)(83380400001)(6506007)(4744005)(53546011)(6512007)(186003)(2906002)(8676002)(5660300002)(8936002)(41300700001)(38100700002)(66556008)(66946007)(316002)(66476007)(4326008)(36756003)(86362001)(31696002)(2616005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFVDdE9BcktOZXJDWG5XTzdXcjkwamxjcEJFVm9pbUhITmJYY051b3d3TlhG?=
 =?utf-8?B?QWJNaGJqT1pDRFNsc0xHQnRES3FqRVdNM2N3YmRBd2kwMlhndW5LSXJoR3hs?=
 =?utf-8?B?MzJkWWhSeHlJNTNITW5zc1l4TzU5UHNCcHZFNkMxNmlIdWxkc3hCNkJ1MTA0?=
 =?utf-8?B?anlxTy9kcnpRZmc5UG5QMjFMN1R2Y0RSSk15NXUxVUd5UmhjNU10TnBrNFNE?=
 =?utf-8?B?Q2FpVkQvM2JlcUVRbC9OeDdPalIwcWR5Ym1wM1JuTUpiMzBlb2lwQTZiMGhq?=
 =?utf-8?B?OUY3S2ErWCt0VjJWVmRVNWRoczNnVjFrWmN3eVhQdnNyN09VUGZWd0tCcEgw?=
 =?utf-8?B?YnZMZVEzdnQ1MUlFSzVDWWlMeGk1RnlBLy9vV3BWeUIwTDN0dFlxa0ZIUmN4?=
 =?utf-8?B?NEJaWnlGTjNaRU5vV2J1Y3QvbnErQ3hGNHVEcjROWk03WUdpQlI1bmw4NHdO?=
 =?utf-8?B?T1BVOW50b3BOU3R1bmcvNVJqTWhPVk9JZFFCQ29xUytDa29DY3lVclMzY09Y?=
 =?utf-8?B?RlA5b1FUaGlIVmsrNzBzdmNjcWhVNTFKQVBqR1hPakZmUU5xZDBkOEwwWlJJ?=
 =?utf-8?B?dnRWdkRLMnlkaDlEMFB6eGU0NUpRN1RUdjJUdFBxRU1PZ1crQ01QS0Q1K0dw?=
 =?utf-8?B?OGFOU2w0Z2RmRE8rM3FWMFM4TE52aHdrWExsK0RkREVWL0hUT01vM1c4am94?=
 =?utf-8?B?WUxIanE4ZWpDTTQyMmZCUDc3eGxGbVNZaHNhWCs1MWpBT0l0Yk8xQ1RSM05o?=
 =?utf-8?B?TkZISGhtZk85Vnd0WndLeDNIM3JqV09IOEh0V1RVN3VOOHp4WHY5TTVwYjR2?=
 =?utf-8?B?c3paT2o2S3BmR0RockFMSURkd2E3SnNpK3EwYTVNMmtyNW5ma0RDdE9ScU52?=
 =?utf-8?B?eGpKays3eTNlaG01UmNWK29LaVE4MG1WbThSZjFiNEVXUVQ2aVFXM1JQRE5G?=
 =?utf-8?B?V2h2aUJtUTdLRDdudHAyMnpMdjg1ZnZpUitIQ1ZiaDlDMjRLMldwZmI3V3Iz?=
 =?utf-8?B?N044QVlURUxNNHlwVFA4cjFUcXNybThxMkRFRUVkTXAyenl1YkN2S05RT01m?=
 =?utf-8?B?K21lVHQyL3lXT0I1QkRIUnkzZXBlSk5IWTFMbWw4RDRHQll0QnNUNmpzWUNG?=
 =?utf-8?B?SFFPSTk5MUE5Wm5kaW45REEvU1FYMUZ3UjNraURaQWlaVzYzMkJoZlNUdHZy?=
 =?utf-8?B?T3NJR0VWZzZaUnZ3YlhLQ1pJeURwQU1EN3crZHkrVFRmVEVkcjQxMXB1VE9o?=
 =?utf-8?B?VGNqQmE4N1NGUzMyMWtqdHIyNnNib2RIcUd0bGNSRGdLWkdpZWF6UisxU1FE?=
 =?utf-8?B?dWFDcE9oMWNXN2g0QUI2cWFZWmJoaXN1bzM1clFqUHJaZHF1TjcwaG0razFa?=
 =?utf-8?B?Q2ZxdVViZ240QlF1MkJyemZkTnNPVXY0WHcyMkFGQXVKSHVaUmx6V0Y0djQr?=
 =?utf-8?B?Q2hodW85MldzNWVtdkVpRFp0L3pkMlZuWThMUGhPQnlvN2R4VXBQbnZFOUhk?=
 =?utf-8?B?ZXVXYnA1bmE5UGJ0YUN2Vm9BSGdsajVGcTVhdVZPaEdlcEFYNGxxMDNOMHR4?=
 =?utf-8?B?b0FTeWdvem9NWFlVbGFTTDN6U0RjdTloS2RlUHhad0YzRnVnYUlITzIwVE0w?=
 =?utf-8?B?RHA1T1hWWTc1UjZpb25TME5Pc2Y4YndUS1R2UXRLRVBTa1NydzR1MU1YR1Ex?=
 =?utf-8?B?QTUxckFCVUdqVWRXbG80Z3NUbVl0cGV3akk2cDkwM1dLZmNpMEFyTVBWY2ZX?=
 =?utf-8?B?anFLbnRHSXRqeWVjdkxqTGRpWTNoTG9jV2paOXIrUUlnUEJYSmVSaEdMOXF5?=
 =?utf-8?B?WWM4QnJ3MDQ5OG9CeFU2STduejZ3V0xvY1JnNm83VFVaQlFkNU9EQlBiZzJF?=
 =?utf-8?B?SVZkNklIM1FweEViQWw4MUtQNzZ3elhubjZ5TDJEVkFPVkJTV3FtcEtNeTJF?=
 =?utf-8?B?R1VwYThweno3OGNLUUNKVGowLzRnbERCaU5lbnlYYVNFT1ZmaWlXZnQ3eXpD?=
 =?utf-8?B?NjNvK20weEhUbzRWWXJUdVJFb3VLaE1vQUFXUC9Lc2EwS3FZazFmM2JWNmM5?=
 =?utf-8?B?QWNpZnNRRVl4aE1Sd01yK2dzOXFmRkp4TE9jQzJ4ODdEdU5BbWlpV1paVzNx?=
 =?utf-8?B?dnlVbjN5R0p0VDRpQlVScVRIVEJMbHdad3VkK2hheWFoTldWVkNud0pHc2hE?=
 =?utf-8?Q?nadGKHx/XcNUx+D5SfJkfAY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7fc8b54-9ae8-41d0-badc-08db891ed4a5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 12:42:51.4619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0S/TQolC59lM25sLICEEhecDp3SA2w3yZJdaYRSetYhzL+umYNFA7zZR98YWY7uGgZvXAgR6gJ84sTQkK7DqRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9285
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20.07.23 14:01, Johan Hovold wrote:
> On Thu, Jul 20, 2023 at 01:44:06PM +0200, Oliver Neukum wrote:

>> + * These tables are NOT in order of device id by intention
>> + *
>> + * Keep them and add new entries sorted by
>> + *
>> + * 1. Alphabetical order of the vendor name
>> + * 2. Alphabetical order of the product name
>> + *
>> + */
> 
> No, this is not correct. The tables are sorted alphabetically based on
> the symbol names, but the entries in each table is sorted by VID/PID as
> usual.

OK, I stand corrected. You do understand that this ordering is
extremely peculiar? I am sorry, but deducing that from the example,
which the current order is, will just not work. Nobody gets that
without a clear and present explanation.

This just needs a comment in the text.

	Regards
		Oliver

