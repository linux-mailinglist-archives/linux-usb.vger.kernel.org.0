Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1816D5FEF
	for <lists+linux-usb@lfdr.de>; Tue,  4 Apr 2023 14:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234805AbjDDMMV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Apr 2023 08:12:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234817AbjDDMKT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Apr 2023 08:10:19 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2077.outbound.protection.outlook.com [40.107.21.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C18331FF6
        for <linux-usb@vger.kernel.org>; Tue,  4 Apr 2023 05:07:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hqbSf07srRFV1WSBarx9t6vgn5zA702BI6ltMOvQ11aedsmJ8szwg0kz/IYkWyKUy1RAbaH3Ok0LoPurW5fdWFHZaG3U5ZKb7hegmzNJwPRbtDmHBuJmh0eij7mYI5i4AXtr8YgMpNrx4vWbF6M34vimEQXcxGQLGV9B64avnDmUX5FJsr+Cnjx5nguOs+3XRrhr51QfKDPrKM7RxaUIMmvJYHSbqcqXfekBJtOR99FtyLudyhdpN0nN4MYjhRIdoAJw5mcwLQW3tbqyWuPQV1RsIaJDKzB+wGurz+G8/+1LlZLxywChnMH9sEr4NxMkrRSCFp0/LyfJzpN4OL2R9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+9ADwXadNz49ycgGv286diLumUsI0GVI5Ba1CPE69A=;
 b=hQhyq7xisi9D5izhBCPxfm01ICvaWzhS+DUwHgUeup1mAnOt7+s4Tm9xghy18J3186xgTuyY81qtDmudRPYNjQI2VW8qccBqKnR/nciP+l3DPSLc4j5MaUjm87aJEh41QOaf33RR47hdVQUUfhNx963ngAVnZoLK6ymIePYFbAYsXYTEdlWaIn3I/Y6VyyGlX/RJioPcfOVpVyeUsfK8HNixGMaDhjG505CuW9fWk5tvN+Hj3tYYRQTOvL7TiudrTN3rWcY6NEF/wGHGEe6chHlLV+lisNiW0oLdUM+T9uQRHvxRP/Fa38yRreuBf6iWqyILYcxa2y/nehGC5lUv0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+9ADwXadNz49ycgGv286diLumUsI0GVI5Ba1CPE69A=;
 b=2cT5RsPMuBAewtIidpoysSoaQm1sfMRN6oGtfAsiv9eqw83xa3LV9iP4CDsH35lWNjr6hFraPE2j7axOuiDFF7gtnS52qA7LssJI7QJwh5nCIVawPLTDPpbru2KO6iTj7syj5o7aHuPZZLmuMyC76N4aXrdovps2EWJxUp/Xq50NAa9SSH9VvBXA7U8gKlSgCSR2rogSX1oW/yiPA6HHnFeiFMLPMDCUt1GCVL/Lt+nm4PPYkICxsC8JvebTyXyhxJBX5hsrGo3jbBo32NFU8rxd3Go2qemSDdXZpO7h6C7elgBFMgNkJ8r7Dpqp5zpYvy/YJLaXACavWBN40z69rQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by PAXPR04MB8349.eurprd04.prod.outlook.com (2603:10a6:102:1bd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 12:07:25 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::74bd:991c:527d:aa61]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::74bd:991c:527d:aa61%9]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 12:07:25 +0000
Message-ID: <58eaa062-4857-4704-5d5d-ff6ea069e899@suse.com>
Date:   Tue, 4 Apr 2023 14:07:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4] usb: dwc3: debugfs: Prevent any register access when
 devices
Content-Language: en-US
To:     Johan Hovold <johan@kernel.org>, Oliver Neukum <oneukum@suse.com>
Cc:     Udipto Goswami <quic_ugoswami@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>, linux-usb@vger.kernel.org
References: <20230404100055.28100-1-quic_ugoswami@quicinc.com>
 <ZCwEeFzSFVRmB/yI@hovoldconsulting.com>
 <9f8277ce-7888-46b7-fe82-90fe4b775762@suse.com>
 <ZCwNYU3kR1Lb2kt5@hovoldconsulting.com>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <ZCwNYU3kR1Lb2kt5@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::6) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|PAXPR04MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dc3104c-af6b-4a2c-256c-08db35052717
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fc7gYEIaunZVI2V+StDqAKIdip1DM/xk0W9H+mJW79eGmg0oe5G0zLUsW51aX7OcrCLB6bzsYknE8N/6Bvqqei0CylOFNHssUorUrlLSAWiBbT8TJUCNDoEtp009HiBBNCXMtUlEYT/UXiNsGyGeqRRUONuanPyHgRXaem8tJ41o3lFXfv322+Gxt5kl7RNtngdXyOH2bNlXK4BrqOIfXFe5mSaBfPrIrZp6p+MLhjiiCi1cgj0RDhO1GvpuGauOejznSf0tU7xma8vii4hHWvzyM8G4Fqter5iKduwFc3C9eGUZSBc6NY2mBsUf2AqdFsJH/GIIVesM3WEscagBjfDdgTaATpDi5kbdzxxOlv7xeIBxijOXhSs2xhUKD5IbtIqRCQ3Av2bdBjkk2dC8h92rTofEsHcpm5zHF0tnNjOHl2kow2wQcKVaL6da2JL6xJOoh3L3F6IYxtGj+CtZtymHCn6oqjNvWSimTPL6P/+ZlCp8eyPmDNyipVKZYoTfKb6/Ci8oHhYbKjs8jZAy7QaLfE/tk70oLFrKARL5ZzSpQ7sn96CVWMIG7g2m7V/wgR7KhmWiRZhSJM0fBj6blD4taRrnKyg8IanoU+pTHIpLqjHrDsUOdSASfksapYXSOqpV5oHGKsKpXD01JPT8yg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(346002)(39860400002)(396003)(376002)(451199021)(6486002)(6512007)(53546011)(38100700002)(6506007)(2616005)(6666004)(186003)(4744005)(2906002)(8936002)(5660300002)(36756003)(478600001)(31696002)(66476007)(66556008)(66946007)(54906003)(4326008)(110136005)(8676002)(41300700001)(316002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGp5SVNibExrWWhYUXA5a2pER0hJZjNHdGo2SUdodFFyZkV1R3RkaTl1OUtG?=
 =?utf-8?B?bS9jQ2xFVDFwZTRDdmdYbGhmTzBCdVpZeDVGSnV4dWRiaWorVUpsWkFJNVlR?=
 =?utf-8?B?cDk2ZlZRSEFvcXUvSG1KMm8zcXJrc1V6SkdENVJ0NmZPa2RDejQ0QnVEdGJO?=
 =?utf-8?B?RXJsLy85MzY4Wm0yYVNNSlJETEo3ckE4ZUFmUnB3ZDNVTnZQc053OGRsWThX?=
 =?utf-8?B?SU1CVUdTejlLMUkxbDRqamNnZStoRkJCWkwwT09qUjBKZmR5UjF1MHRlM05I?=
 =?utf-8?B?eXdPWDN3KzcyMW5aK3d6Vlo2aUE2UTVuL243RTJLeE56ZXlmazdRditZWEVt?=
 =?utf-8?B?WXRJUVIzL2NaSXl5UDZyV1BtN2Q4SjhZWDBMblBERnBUanladUJEQlFtQmp3?=
 =?utf-8?B?N2VVQm1Lelo3d2JBRDJXYm9VQ293NDlDTkpKWk9YNjgrclA5SmJEU3oyUkNt?=
 =?utf-8?B?cldTRjBOY2RjQi9LakhBTGlFd3FxUUJLek0wZnNVRzB2YlovTCtNRzBRUnl1?=
 =?utf-8?B?dXB0WDZSOUhRQmtxQmpLSCthTkpyOURYblNZREk5RHhwTzZHME9ndURUeDYx?=
 =?utf-8?B?L25LTTJQU3RnV2M4VTJzQ3Y4Wkkyc3NtUktXM2dabGQ1Q2Q5THlnQUhUMDhw?=
 =?utf-8?B?Rkh3c0x5KzR2MndyUUhsc1Q1VkNnU2dKTFZaS092TS9UdUpHNjhLbStHNE13?=
 =?utf-8?B?cmIyNGZ1Rjl1eEV6elAxczJvSVF4bENxOUJLVnhCSGo3cG1mS1N2SE5IeHov?=
 =?utf-8?B?OW55V0UzRERCa2Q5T24zbTN5MkExQzhWdVd4Q2FTVzJzQlZVMXdpeUN6UGRB?=
 =?utf-8?B?YkMxZk1ZaXcwTkx0TCtZZE9weEVxWktvV1ZTZWsxUmM2VllpenQ0V0lNVWxo?=
 =?utf-8?B?QlZLdjE1dnVGSFk2b0lVZCs1cUNLbkljT1RoZWxIT0ZyVmJXL3JIbUV1T21C?=
 =?utf-8?B?dmlsQm1aRzAyRFZlTThsVmRGOU9EUm9yM1g4a3dvcTFjMFhuWmpESU5mTWlN?=
 =?utf-8?B?VjFtK29STnZ3MEo4bi9xQ2hwNnVvY1VaMUZLYVR0cnljSkJGaTRTd3VEQmRV?=
 =?utf-8?B?c3ZoWnYrSFhNQ2YrMER1SnVrdW8wbG54ZmFHdFNxVUVvQ3BYdzNZd1lYd1oz?=
 =?utf-8?B?TVFXRFZpVXVGR0xKZFQyNFZMYWlqVG9RRkh5cFNqeDhyUGYreXNqdVkxVzIr?=
 =?utf-8?B?UWpwVHdNeWVVRGxyMlA3dWNZc283YktwcjdZWjgxeEN1RUR3dlVwM3ZYYXBa?=
 =?utf-8?B?ZTE2emhpNEUvWkhRaWlnNGtTcjF2WGdvVmVNaFJVdU5RQUtuekM5dEpOeDU5?=
 =?utf-8?B?OTc0YVc3clRxVG1oNHZEdXc1c25TRERkcXBhei9LdG9Pa01uU01aZkZyaUIv?=
 =?utf-8?B?WExWZjNzbkdsbXQ0VEwreStnT3l2RFdiOVByQXlWZy9Fa3NRQ28zSDRFSXo2?=
 =?utf-8?B?d3dzVEJSM2JiZ25JNFpzUWlrVm1CdlEzLzg3c3cwT2pYSW5aakZrcURxTkFt?=
 =?utf-8?B?TDM2cy80WlQ0R3E4OXdib0srY2JDN3NCeFRjc2gxcEFtanVtUnJ2VUpMMGlu?=
 =?utf-8?B?bEc4Q29ybmhqVGtLdmQyQTgrVWFkNUtwUnhyQ3Z0bVVzdnBnZ3NRSnd6dmZB?=
 =?utf-8?B?bjloMDl6R3lQNG10YStjaXJhNjVYTzJRRGhBTE9FTkJ3ZHExM1Uxc1E3aGRl?=
 =?utf-8?B?R0x3bXU5TTdsTzQxVnFBMk96dGVUS3c2WE1MckcvUkY0RGdXZGJ2NWNUd09J?=
 =?utf-8?B?S29KY0RzdkJucVB5RlYzUEZFMW51dFIwQ0traFBxU2xrVGhCcVZTWk5YS1hK?=
 =?utf-8?B?YVVuK1JJVytHTytOTHJXczF1TG9kWmtuVzFFT1RFd2haMG5kM3FHQ3BtMjdN?=
 =?utf-8?B?ZDJ2cUo4bFhrdHo2Y29ZTnR6Q3M5UXdSSXRIV3g0STV3cG5NSWpZK0FZY0xT?=
 =?utf-8?B?UTdKTGFWTEd1UWRibC9lMXJhME5FTXQ0QnU2N25LWVNBWkF4VEtFRnBzQlo0?=
 =?utf-8?B?QnJ3bGFCRmpzSGVncUdXS3FqeFdiYzRkdHNzZmJBQ0RnTkNVRy9rNzNtcUNI?=
 =?utf-8?B?dDdMQ0JvL0xldjRGZC9PY2lndTY5Wi9QOXZYWGVTbk4xeFpIRWI5MVByRUNx?=
 =?utf-8?B?RFB2UThWTkVISm9xckRuMm9FK3Q3Rks0b2dSSmZzUU1UdEVNY1RXNlJ1UVA4?=
 =?utf-8?Q?JAjGMmFqi/ENqHDE7vM7kNLjrC/uqH0Fzwv2jzfrwoRO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dc3104c-af6b-4a2c-256c-08db35052717
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 12:07:25.1550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BFHjFE5j/SoHIjzF5Pa6NHOYLREWpIwX0u7ntDLfHynVDVM744/kUs0MipE9ZE0k2jbICWU2fH2pom1J2rTE/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8349
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 04.04.23 13:43, Johan Hovold wrote:

> The device is being used; by the driver and ultimately by a user telling

I am afraid that is just an assumption we cannot make. The user may just as
well be reading a device state before a device is being used as that may matter.

> the driver to do something on their behalf. The fact that the user is
> initiating an action through an interface which intended for debugging
> should not matter (and the user always has the option to check the
> runtime pm state before initiating the action if that matters at all).

1. That is a race condition.
2. Quite a lot of bugs we are looking at involve power transitions.
You just cannot assume that a device will react the same way if it was
waken up between events.

	Regards
		Oliver

