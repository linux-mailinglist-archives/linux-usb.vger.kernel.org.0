Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD855EBBAB
	for <lists+linux-usb@lfdr.de>; Tue, 27 Sep 2022 09:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbiI0HhX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Sep 2022 03:37:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230452AbiI0Hg7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Sep 2022 03:36:59 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2087.outbound.protection.outlook.com [40.107.22.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFBA980515
        for <linux-usb@vger.kernel.org>; Tue, 27 Sep 2022 00:36:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jCnRBlcYETsJYFyX12I042+dBxIzOrW4EdCjeknaSGD2n0nk5BEYJhJT63ykJqvxcl5CcE198KVAMDHsFYTeTZue7PsHGtSE2anQcfQV0DWMmOmhNy3SRLyjaFo/Tm4FD6CYAR4l64GOvfNn5kmFXZKWXxeeK5Qrkc+7H8flmvvxqAAtzIn0rCGimTZ8p9gHW1j+MHVEslLZnSkRnRYpZ0Zb+DL9G38v54Up7kmfCtol6qGmtSo56JNcyEYHbQTFfAPZbuJWoNUGgWAAZZJD3P1/1z/50LVXxIjGYAuUBPkCFhsCREqQAXJabybX0kFoLnGvBhfuhQAoOAuVheS4iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4ojnzhQYAWpAeA/UYx/auSGAFSIa2ASqCXefwXH3Wc=;
 b=Ht/+1SVWjF0X9vyzr/kkUl/xE8KsHQi1pXcKEI4f8ilAaEGBS7fHkrZc/VazTv94VzQVHCUtpXw+biPTBnGqf/Oj5PbvlggnASlmMNnTdnzOG6RMb+gZxLeKLTL+g+2Cir/o66b/GH05z1G8h1jhZRm0V6/gNfS01j+OMjbL05GTGs9Difu84rAloCWiz3cUTiMWUi52RE1Wek411pdQE9CKnB0rGANHsHp1AEs/91qw2BOaWogwRrABm9DLRP2EUvoiBWBZx/RQr8Nzuju4CkuUUW7YhQdaROjLvt7bQlvfpQEmibsksf2SCA880bNofzDDHBG4EOraKNCNgaDCnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4ojnzhQYAWpAeA/UYx/auSGAFSIa2ASqCXefwXH3Wc=;
 b=hp93Qvhts0mrBpe2AfLZhew1+yhZLazR4jSBCYR8xyw+05cFpgoYZRvWPAtqAVNXQ1Qb2NAqNvLxdU41zQFP4CED8RBHq07KTOIKY/Ds7e7m7TZUvg4aehON0N4WjhZy2rCro3aYHKTQHbygjpr5n3cFDaArjEzl1SL/rPTGtqNR1R9GMHbg0lDc+Ned+Rz4z4OG5WIkNz+nqfzqnhdQ9bOQ12jyK2eZX+BHTIs5W7AT03vCwg6ZqenLUjThFj7KiG3eEHOigfkHmueLEAY0lwB2ucF5BJD/inV9zmL7IUz4AYGmUoTjRHfDmi0CZrOZVf1mOt4GQw/X7IaFKOKOdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by PAXPR04MB8144.eurprd04.prod.outlook.com (2603:10a6:102:1cc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 07:36:54 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::584:c4ea:a4f7:af1b]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::584:c4ea:a4f7:af1b%6]) with mapi id 15.20.5654.025; Tue, 27 Sep 2022
 07:36:54 +0000
Message-ID: <3381f598-0e70-4a71-b3fe-8be20fca0493@suse.com>
Date:   Tue, 27 Sep 2022 09:36:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH -next] usb: cdc-wdm: Use skb_put_data() instead of
 skb_put/memcpy pair
To:     Shang XiaoJing <shangxiaojing@huawei.com>,
        gregkh@linuxfoundation.org, oneukum@suse.com,
        rikard.falkeborn@gmail.com, ryazanov.s.a@gmail.com,
        linux-usb@vger.kernel.org
References: <20220927024344.14352-1-shangxiaojing@huawei.com>
Content-Language: en-US
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20220927024344.14352-1-shangxiaojing@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::18) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|PAXPR04MB8144:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ab4f261-0033-41e3-8fb1-08daa05b0c77
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zx3/g0v7YR3LLNbv1uPLH4H5jMvBg83TwOYGKE5zJXntUOqsKEXah0NwBgGe7Fj3K3msoq4/E6FA6FnhxXltOyRGaeZBqYneBPiEoOxJUTeh8sxO7mqIpzZhsA5r5n45X1tYKABGxRdyez4FMsqpgmNRZl4kN0eX/12b7Vk5fLa9NoPKWU0o/mx+R8ZirGw6lPpkT1JxfPIbgxANMryWuvJqBXmQgNAlbkAmnIoi4e62JHPcBcW3oq2xuLaYOzz7zuL36op23e3aiaSKPJz7TI+QEq059RjQ5V7985GlIYIsCAEhXGW0k5fxYqRV/XDBRnWzYxXoGKrqbToK/QdsgCCHi4WmprDX6IpPCnkihczvn5MvCpPRcj3RjVnuDMGXWz5ua/4WzaWQCxUn9bgIsPaYoGF4B91FZadoxjdtU1sF8HoFyd20rMRK5Xb8wx3K/lLH4PX6gzqA9EyHPMxJ/T0gDt9IwIj3Zi336bAkeiz944zaVOcV2JiBmlZMPtyPCgmvPnTajFhubyYYm/DorwzEHy55IXHadEhpJiSYGPJXtMLmNtIROAj6h0vXCN9eGNc61QUh6yOa+l1fCIInaTOwxEEvauTQwG14vwSzlzO/DEcej+j2K5/8EhH+xPyyT2LMYELZg1yVOKrI9qMsofDBHV5GCklhPvh4LfJP2hlOH4iu8zHpvToCD7/83t4wfv3763qp/u5nzNYiuhTVyNvmn7Sl3xBdSX0z3ztHCPC99NzdPdESM2BbXANT2t8intzeMWBJIUGI8jrnIyPy9Niw73itO0afwdBHjSQev/g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(366004)(346002)(136003)(39860400002)(451199015)(6486002)(38100700002)(31696002)(66946007)(8676002)(86362001)(2616005)(41300700001)(66476007)(66556008)(186003)(316002)(6512007)(478600001)(6506007)(2906002)(53546011)(8936002)(5660300002)(31686004)(558084003)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjBjREhTb25vYTdLQlJYeUU5WkI3Szd3TG5YNzBqc2pxQ2Y0cUhVbE9OMy9s?=
 =?utf-8?B?QllLbkVDUCt0RWlrN0t4ZnpMdEVycGtsZkhXd01wTDhyYUhhTUlBcExicHo1?=
 =?utf-8?B?WDF6dDBUMUNudXJvVWliSDc0b2VJcXpPTTZwdG1udjhRRWI2NmdSRXUxZHFl?=
 =?utf-8?B?bDR6cnZ2KzlLbWtheCs3Uk9MOWtxM0RycGxXem94WWwwQTJRWDRWeGYyUjV4?=
 =?utf-8?B?UGRzc1gzNWtPYndic2tqVUZjYVVEOHYvTGNtY2F4bUh1djVHbUpyNldMRTB2?=
 =?utf-8?B?MVVuSThMZy9HOUtsYjhTbis0ZUpSb2c3b1FlRFhlUG1DbDlvem02bDNFWXBN?=
 =?utf-8?B?N1Q1WFRPSW9vdFl3eGU3MkRNNndLZWgwVis0aDFQMHg2TzBSZEpVNjg3MWRh?=
 =?utf-8?B?TmpRYzlGRUhEVHdsMGdyN0lKOWk2aXpaTkoyWXA5QXgxTFI1UGRTSk5lcHpq?=
 =?utf-8?B?SER3U1FIanpNVW1CcXZTc2d4emdGR241ekoyRG92OFB0VldMOUVuVTZmMkpP?=
 =?utf-8?B?UW5odCt6aXBJY0FZbU1BMFhWVlN4U1RWWHc3dVd1SjFNdGJpUmpaQUxCcS8w?=
 =?utf-8?B?MGNwZTBBNGdjTVFBY3JyeW9NVGdFSTB1Z1BEWW9CaEJWOHpmTXV4NXdZeEIv?=
 =?utf-8?B?ZlU1V2U2YnUxUXc2WWNEbkxEUzdNRkNMci9nZHV1WXVVQlJML042U0pOV0I3?=
 =?utf-8?B?dEdpL3Urb0pteVl2WTc5TTY1ZThteVNJV0xBOFhNVUNBTXRCaWVaSU9TbVor?=
 =?utf-8?B?K3p1cTBINFRERDNOcE1ZNUZiSmhoZ2c3ckV1ajZ4ZFg2K0xDdU15bUQxZ3Bs?=
 =?utf-8?B?UjY0cHdrN05PeFRQcW5reFBYUjRFUXZHQ3ZkaTVEU3VML0RZTVJYMEE3aDJ5?=
 =?utf-8?B?Q1ZwUms0ZStGRldVU2JXcmpESFJGZk1CRjkvQlRSNmtGVmNwQ3pnRHJLWFpS?=
 =?utf-8?B?NEpvUFpDMjJFZEs5RFY4WnV5ZUd3TTFSNXRHaThIV0lzRGlZRUtXTFVCWlV2?=
 =?utf-8?B?TWxSS1lSWEVMdGVENXNjUmEySFBQd3p2aS9NS2Z6b1FBcmZoVW9GNVVsVnNh?=
 =?utf-8?B?YU8wWUZkUWgvb2I2Vjg2cGNGVEhlZXdIaW0wZ2J4QWF2cjFGYVRFY25kSUVE?=
 =?utf-8?B?cjdLaC9RaVNHZVBady9DYzlpc2VrQXdacEVyUHF3SkxwK3pzcFZib1MvRE5U?=
 =?utf-8?B?WWVtK055WkVod0dWMTBkZzhRM3FBTGx5N1ZCemFZUEp0UWtwSFQrT2NWQ1Yw?=
 =?utf-8?B?Y2c0UG45Z3RVZ0J4Z2RmUVRHNGpZbXRiVE1RQUoyZ1BCSGo3eTVXQjI1R3F4?=
 =?utf-8?B?QXArVHJ3b3BnWUg1aTZPaXpmRXg1WjhVc1dxRU1taDN2VFZTUGRQUGV6Tk9a?=
 =?utf-8?B?UDdrMFFpR0k5aGRSOVpuc3pTYzg1OVVSSExibmNtODBkaFk5UEtLYURHRFFh?=
 =?utf-8?B?eHNkWHZ6V3hZMGk2anQvQjF4bUdsU2VaRWsvWjlOTFhKeHZxRGg5cEZOTCtJ?=
 =?utf-8?B?MWRzZWdvUGcvVnJKUkNaU3liS0dvZVVGZnJBNkNadjNZandaTkFHdzdVSUZG?=
 =?utf-8?B?dUxWVU1PODhvcUVtMWdjWGFwM3ZIcXladTRyOFRlY280OVFxdDhZUDRwalVm?=
 =?utf-8?B?L04wUVphODEwVDAxdmE0N0ZHQTFNVW1tSzRWS2VST1I1WmhSZmc4R2wxNkNU?=
 =?utf-8?B?dCtVeDlJWDh1N3MreTZrYVdUTmlRMVJTK0E4MW9CaDRmRk1kcUF1VlRrcTRI?=
 =?utf-8?B?YWxORlR5VEdqenBubjB3YVdmclJBQVVWcVo0ejIvN2pkTnBPMURmN2lReCtD?=
 =?utf-8?B?V3BVaUFjbktJSisxVmc2RkgxcjJ1MUlJb0ZkdDVsWHZYZHIzRjBKczBPSXhT?=
 =?utf-8?B?eWJhVDMvN2RGV0x1bnl5OG0vZVdYMnVjWm80VExNOUk5bm92eHhicE9LT05o?=
 =?utf-8?B?a1BVbzhIbDF1NjB3ZXJjelk1bTR6MExCMWRGZzQyUDI2aU5SNzhUK3VlZkM5?=
 =?utf-8?B?WUkzRWgvSyszVzlNR1U0bWlTcFN4WjN2U0ZwTHlNUDN5NndYTXRJNlkrZWJB?=
 =?utf-8?B?ZndSb3gxenlRWTdaK1hjWFJPd1BONkdONzJSQlIwNXpZR2FTRHdnRWVKYzYx?=
 =?utf-8?B?azJPTFlhVE54b0NCMDJYUTlzbXU4ZlZkSTVHeGo1ZkJZY2hjYXRySUgvT3gy?=
 =?utf-8?Q?8aqS6whzFPJpkBQDx+J5C4YJVeDOCaEOE3OLwDHRxK5j?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ab4f261-0033-41e3-8fb1-08daa05b0c77
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 07:36:54.0488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Vrt+rBcmBPiwefu2jbPKwK3JwltfGiKpdhnDU5xyx5MubTwNTc1mHEcQ+34NF/71ZmwwDtBpACHV4Nr+qdsSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8144
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 27.09.22 04:43, Shang XiaoJing wrote:
> Use skb_put_data() instead of skb_put() and memcpy(), which is clear.
> 
> Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
Acked-by: Oliver Neukum <oneukum@suse.com>
