Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03F3A75F9E7
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jul 2023 16:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbjGXObR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jul 2023 10:31:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjGXObQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jul 2023 10:31:16 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2085.outbound.protection.outlook.com [40.107.8.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 915A5A4
        for <linux-usb@vger.kernel.org>; Mon, 24 Jul 2023 07:31:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4l4pwDmcyN3hPnkaOYA9kE46osYXbu6sq4ETp13cvINEXWvMdeV/yH2uOPWPtedhfQFophfR37fFXFpm82MoRMzp3VCWPu2rUZs52C9rFY0a6DC88LIxiRafkT0tZLxstRNTSwKArd1UZfN5Vt3ecRTJ0yBXzmw2+cxfvjWTXPNjoAb9SBaOOaMPhR2DqSXKDNLYlMwNyyxF6aO9Bg0zxxMpRL9mfTFwcUDU8BmjtKC4CF/T7hI/X1MdFkcdquufjzLHsFDFGAy4S0bXGu2r/q94BUUf4CBTIecfiTPkWBg5XH+Xdt/zP0yS968eLcSF0X8xczDQnz4sqTl7u/NCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZSX/GBO6IXX1IOCtCxY2aOV8t8yQS8RqmjogT6uixQ4=;
 b=fEEmGJMwsU2IWBh63QfIJYByEij0TdbORMZ5jbS4JMEF3Lc8H3CvbX8Z4GqKMdozB0vjICU/feL9nHpOKqSMtE325nqRy8kfkV4C+gINKToRUR/Qv2P7gsGI8VQskF/TzMVU7iHXNttqzScbZ6p+7NceMG8JNpGyD/I8fjvyHDOaTsOI1W4M8M7GleS3XbIs32YYqKZ11XxVCYuEG42/sR8aoxkb57evGjTiRkZg12uitlfF6+lyk79H9hYFFGA6fN7VFdGPq+UljVUtBTnP8J0K+uL0SF5f8LTmHZbktyytQYZzlE0IWMM9/zLO3zoTtR6HV2rKkQ6++KijB4o7NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSX/GBO6IXX1IOCtCxY2aOV8t8yQS8RqmjogT6uixQ4=;
 b=kabL0m8QCZmv6JIyAJtkIxNq0cSOS2K/8s8o4VgO9n2v8I2psUINdZsFaGxy/9JhxZeo9S0/bYYqgfZc7uP3fFq9LEwRNKmnUAXK5MJ6bRvACZ0XbLxmv8skH+pzvCsC4smIfqzvMHxbaBcWLSvrZcjeP8BIeAcfar5TI0N02UmnBWlSmeXx5KskXHphJZSs+gS2q/YRCdwdTP8oMAgaeGMuVNq39GJ/oyDRIi8tJM/Pn73Zg6Wg6/5drecOLBeMe2ViKI4Tjck6S6ddGr+Jdtf0EwaySw7KFCP4HCohOBgMPidku2ZoNbrOEWkBsZJiEzJ0gQQz55La+NMkSEBatA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by DB9PR04MB9702.eurprd04.prod.outlook.com (2603:10a6:10:301::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Mon, 24 Jul
 2023 14:31:10 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::7ef4:97ef:66d5:f5b3]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::7ef4:97ef:66d5:f5b3%2]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 14:31:10 +0000
Message-ID: <1f4090e2-7658-da50-334a-69e09f635d7e@suse.com>
Date:   Mon, 24 Jul 2023 16:31:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] USB: hub: make sure stale buffers are not enumerated
Content-Language: en-US
To:     Alan Stern <stern@rowland.harvard.edu>,
        Oliver Neukum <oneukum@suse.com>
Cc:     Johan Hovold <johan@kernel.org>, gregkh@linuxfoundation.org,
        liulongfang@huawei.com, linux-usb@vger.kernel.org
References: <20230724124057.12975-1-oneukum@suse.com>
 <ZL6CHnYEmxssGXRG@hovoldconsulting.com>
 <1ae1ad1c-34ad-3a1d-baa7-529832ed42eb@suse.com>
 <1fa217a4-0150-4658-bf13-eaf34d300d65@rowland.harvard.edu>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <1fa217a4-0150-4658-bf13-eaf34d300d65@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::11) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|DB9PR04MB9702:EE_
X-MS-Office365-Filtering-Correlation-Id: 605d8290-af3e-4fff-79e1-08db8c52a002
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0QJQ4qiVS0F4h77Fft47/LtTxzAsP6y9GRsodxt8DvaFyYv6L5xMu/aWvGW2SemYmT7PNEfOb6twonuAyFQzdzlZ+BP248o8R6X2ZNlr9ep9wWwUagOATnFfWKHg8DMP7VzouQIV/igOiIATw+psNEpLPkd7/YUt216vnGp0MqODNvdEK2NCTtWvBfK38IPccRLHbuIKGcgKkDr8U/+nlZVeCfl27TpaSPefcxtRlKEWnvKfG9fp790lB7hKn/2vfk9oY6BGI2xlXPCVOm0248IG8UGiyaLPRO1dJsVPp1vKl41yuHMckNiipaxjWjY4FC0IbPEAob0irUXKEiQAzSnaeFS1ifpS4IIDv2tpWmXxLLpS2pq4or8fypWOCPPiXYZzA3mjSSXh04Kp/HMs739AaqWh/Rq9JDpMchV7/i5hfx+aZQEH03UHi457zvttQYrBpAEkSqkNjHS8GDgtS8gkNoq68JhcS2BZYy8vF3lf0k/XE03s4E4Thf9aIo2ZwYPIk5ZK3+P8EqiwRf1qO5yoxOqxW3GTZXixePy62CmFA4l7a3LZ8+nOlTD8DdsoxHg1/WzqqRx4H/veW67iFHIKqRDUerDJi2ZHAVnQ1oscVr//XV9YBuqgq9TmsuzNKL3IZ61JsWtU6v5L2XaL3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(39860400002)(366004)(136003)(376002)(451199021)(31686004)(31696002)(86362001)(38100700002)(83380400001)(36756003)(2906002)(4744005)(8936002)(8676002)(478600001)(2616005)(5660300002)(6486002)(6512007)(6506007)(186003)(53546011)(316002)(4326008)(110136005)(41300700001)(66476007)(66556008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEIyUlFXMCtaRzU4bzZOZVFobEZBSUExWVpTemJ3bUhJcWxvSmtBVjdmYmYx?=
 =?utf-8?B?UEI3MVUxV1JaN3VOMUo3ZXN3YXpOYU5sYWNKQ2s1L2ZTMVhPOFpyN2svQlg0?=
 =?utf-8?B?YXJyK2xHNk9GbEVrTHZvamxBUElCdWNGTms5bjcrMjEvQmV4eW1ZSFJYRmQ2?=
 =?utf-8?B?Tys4NHZKNHRsaFBwUTJlZDh3SGNKSkxHWGdBQXBoaVQzNXc2T29NOHpjalJ4?=
 =?utf-8?B?WDMxQVcwSDZrN2FWclNjT1QrR0VCblA3TVJ4UFdsNm1qTExRQkk4eDVndGFo?=
 =?utf-8?B?a01nQUIzaHdnaWhnQTlBQTBoa0ZXZTlWa2hmcm5yQnhyU0M1cHNxUmtGODVr?=
 =?utf-8?B?eXF2UGVIL3pqVjNMSEh4aFFldTdwa0w5VkxuZDdrUmRaU28xQ2phdjhYQ01y?=
 =?utf-8?B?bEZBdnpKSFZidFF2WVlhSnFPTzIwTkhjN21UM0M5eDZpUGhqLzNTbVVheW5k?=
 =?utf-8?B?dmNqMGVidVlNcGJ6dDVHRzhsLy9KaVdPS3BvQVhHWVBoTHRZZjlNaXdKeWtn?=
 =?utf-8?B?TUZWRVE0MEpFZ2p2UmVrUnNjTExWTlRLK3FIQ2pJZllhNUJnTEtrbXhlL1Nx?=
 =?utf-8?B?cFJoWXVpS3YyMmQycWR6eFdzQ0xVRnBmQTU4RkdrWE8vVFh4SVpDRjdiYnNV?=
 =?utf-8?B?L0ZHSE8zZk9UTlNRZVpFU0RVbFRYZXU1T0Vpb2ZtMHNHTmZlb2JJc2wrN1FN?=
 =?utf-8?B?V1BNUDE0MzhoV0VHU241cjFSOFlYVE1xRWlXT2d2aGkyMXBHTElwQUVEclVM?=
 =?utf-8?B?RHNpYzZzeU80NXBLRGtUVjBoRzVDa3kxeDROWXZoV1RCUHBKOXQ1K2J2UHFM?=
 =?utf-8?B?aWNvYXBOTUZlOVM2Ym9DaDNEd0puMG5kbmZ1VHVhUFEvOGlFZnBOWlVRSkZs?=
 =?utf-8?B?MnZMM09CcGUxU1Z6WkpUNFI4Tm5jVnpUZkdlSk5zbDh3NUJsdEhaY09kbWdG?=
 =?utf-8?B?a3dZQURSbGYvMGc2aUY2bUdWT3U3OGxjaFV1TG1hOEZha1drTnF6V2JrWWw0?=
 =?utf-8?B?SC9SUy9JNjg2TWJyd0lvZzdTeVZpbktZY1NieDdpdFc0SGY2bDNuUjlJWFli?=
 =?utf-8?B?VUh4WUMrWFZCQm9najQrL2RpdUIxcklqTmdLMm9wY0lxQ015NXZxbHhYVlVs?=
 =?utf-8?B?NXNYczBRL3ZhSCtXYytlT2lRMWZyZmljdm9ZU2czTXVhYWZCWFdNOXNleHI0?=
 =?utf-8?B?OEJvY3Z4ZTc1aEMyYkRoTUpQQkFlNDV5YmRvK2k2UG55eWY3TDAraDBxRGNk?=
 =?utf-8?B?Q1lSWGY0Q1RCazdDVFVKZXhhbUVxS21OUVI0ZXFrSi9lV1RBWGVRYjByWGRF?=
 =?utf-8?B?dGdQbURoZkR2dHp6V25KMzgxendjazk1MHM4NVp6a0U3Wi9BUTNMSXZHTW5l?=
 =?utf-8?B?TEg0ZCtWVXg5VDN1YmNwd3doUVZ0OGQ4dzVqUHp5bXBVRitLWEhweDk2SkV6?=
 =?utf-8?B?MXNMRC9HYWJzYUszVmFCZHFOZldQcCtCWUFLUkM2V3oxSE9Sb3B1RGZRSnJq?=
 =?utf-8?B?bnliTmNXTHg2c1AwUVpZWVNPejJHMjdlMWdMYWo1RThKcWIwU0g5MXlQMUth?=
 =?utf-8?B?YlJDcUwvUnl5Qk9rNms5ckJCY0ZGTlRrVGxmMDhtMEtHZDJkMGdGcmcwMktF?=
 =?utf-8?B?V3JzL1JkdytCUWhVSjArOVQveFBVRGFzV2QyMTZoTEgrNEcwS3hjd1FCVmRZ?=
 =?utf-8?B?SGhvbVY3SGNERFRWbGRHcGZXZ3ZRWnBvNzVRYzlhQlY5K1dhVmRjUGtBbEhv?=
 =?utf-8?B?dlozWGFHVDY0T1hiREFUdDlESXVkUUpDN25qY3pRekUvbktsNTExbGVNQ1pi?=
 =?utf-8?B?SmtiZWVvdTBJZUdVZXhQU0puTnpLaWpxVWw5OFlWaUowVVdMMWJsM1kxZWoy?=
 =?utf-8?B?NlV1SkRhb1JiNm9VWGN5YzFFTm52RjN5KzFtdXlveVJsdTJCOG9xRVkyaVNj?=
 =?utf-8?B?VzFUTXYyclAwWTFRcFdTYWhaczcwNnVXdGlvellSay9Ta3QxaFhmZkVRZjAx?=
 =?utf-8?B?UjkrK3oxaE1KMlVEY3h6RUM4U0RsdnRmK2xqN05wSXRYb2hCSXNYK3FJTWJh?=
 =?utf-8?B?Yy9MNmQ4Zzc0R3FOQS9tcWZNTTl3RjIvS2crL1hkaHVGejFUY0tDK1RCbGEx?=
 =?utf-8?B?VlI5SklxRDNlRVB6S3ZZd1hvOW5PZTVGUXgvYmdLbTBtY2VTWHdVVWQxaGxG?=
 =?utf-8?Q?wS5CHjNuWwk+MrI6ZpDumijPBtT9z+oH6YWrpGmst/Zj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 605d8290-af3e-4fff-79e1-08db8c52a002
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 14:31:10.4361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m2ccePDnP9VE+NnAVRwVtkyH3G7h9oOGdatzoku8f6J1E0eHZN6u1k1vxBigf2CO4ARd+sO/1jMpW1oAHGnVyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9702
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 24.07.23 16:29, Alan Stern wrote:
  
> How can it?  bDescriptorType is at the start of the device descriptor,
> whereas bMaxPacketSize0 is more towards the end.  If the later part get
> transferred from the device, the earlier part must have been transferred
> as well.  Even if the transfer was short.

Do we really guarantee that in an error case the buffer is filled from front
to back?

	Regards
		Oliver

