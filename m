Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C51A542A2B
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jun 2022 11:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232839AbiFHJAo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jun 2022 05:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232844AbiFHJAB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jun 2022 05:00:01 -0400
Received: from de-smtp-delivery-102.mimecast.com (de-smtp-delivery-102.mimecast.com [194.104.111.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58AC63F62CF
        for <linux-usb@vger.kernel.org>; Wed,  8 Jun 2022 01:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1654676364;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+TaML9vkgCHy1EYPcbgSv6YTZFaGGZzKsm2mEoaMk1E=;
        b=PZC6erqVPmWm+1H8wRjAsNi0tbNizGWlMEX5fe4jScXtKLNchMTjwwP+8r5cd9Paibas8J
        FIj6AMd7bbQwJpmWHaXNjBPKRjf3M+9VZsP3miGoINpPmaqINO28infpAYUH7xCpPKrD0x
        +fE2f8yiQN0AXL/kJMiuE/5KD3yb8lM=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-_goyGLNUM-6Qv5LN0K83_g-1; Wed, 08 Jun 2022 10:19:20 +0200
X-MC-Unique: _goyGLNUM-6Qv5LN0K83_g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fm/RCvJJTviMR4NFcCpQf1Kc15I15i25D9DDnPyfD9AF0fQx9J+LA5adHQ4rNQJhds7auJVhvEYyZwLe7hF8XmiCDgteShTpY760qkqVJy+pORXdVIrg2eP/r33JGseF6f7JC8eixot2kqSbICCSJ0OH9ni5bUkJlhriOQHYTnHXIgJGekZanCsf1qVLm/l7Td6e8nPhrlNI8XSEsJM4SNo2fD7dzk/AFJ/mYWPIped4yds4sADebcwE2k6/aO1j2MXCcR00AnzoN1Gdwh1mj4PPGDFO23q92+vN+6jYN6n3sKc2pN5F4VATgEkGv+JliWl3i5dSfct+fdf/vAy1Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TaML9vkgCHy1EYPcbgSv6YTZFaGGZzKsm2mEoaMk1E=;
 b=oEGWiQxrHehXMLVOR6pNzSar8ODMUqy1YCHH7cC5/vI+NYLtNnqwJokp76P2xU6MlmIEbLCgos8m+9UKz6CJ0IqH24Vv+GkX/9QVMnQwZlF3bOWUpkWwOGC3e4c4H0RHJtBwcAHcqO5fVsFqqO6u4W/NjcbyPIgFy6ex0+q4KNMnIwg4fDBDi/zeH/AkPwM5GQrspZzA4sO5iGbtm9P+UmhDhOXLTeqrOsD+gHgNM9ReYfDmTlFm+9VaVapQGF242bcGuLiAxjtCCFedAXUtBB6vjQP2x1bSvhyD9yLX/reOZS4K4RUvIlxv4FxQOuZmMPSvUxM9E6+Q5IhpdXvSpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TaML9vkgCHy1EYPcbgSv6YTZFaGGZzKsm2mEoaMk1E=;
 b=InJ4ukSL+yxdWVe5jvfTNDErT+iJu9M9zbYjZ/tv0dfA3H9yVBK+gez9nM5eLTO2q0X1WVuaIzrNZDrGWdXH9mc2QtvN/39sj+MTfDaSKWzv62/W2ciNf1KodjgEsWaj5oUuJwqLBb9TXotZ9GNsgcGP3KeScnKlRKB9tDHs64soBhmXVyIUZn3G3FOJtrsM1Kz5zLS5SvRYP/iuql+Iykf2K/xWe5bk4WWZL4Lev/6SJIoJGkHq+5fsfb8R8UcprnJ1FJP7n6qC48J7jioB2BMIt9rzF432e2wuHAp1kGCObB3+acGW3Kj6UHde88pxbnwY233QaOe/cobS+5xKJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16) by VI1PR04MB2990.eurprd04.prod.outlook.com
 (2603:10a6:802:6::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Wed, 8 Jun
 2022 08:19:19 +0000
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::19e2:fafb:553f:d8c]) by VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::19e2:fafb:553f:d8c%11]) with mapi id 15.20.5332.012; Wed, 8 Jun 2022
 08:19:19 +0000
Message-ID: <400be833-468c-be0d-c80a-f3617800750d@suse.com>
Date:   Wed, 8 Jun 2022 10:19:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC PATCH 0/1] hibernate and roothub port power
Content-Language: en-US
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        linux-usb@vger.kernel.org, stern@rowland.harvard.edu
Cc:     evgreen@google.com, shobhit.srivastava@intel.com
References: <20220607135836.627711-1-mathias.nyman@linux.intel.com>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20220607135836.627711-1-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0024.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::31) To VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 987fffcb-df65-47d8-b795-08da492795d4
X-MS-TrafficTypeDiagnostic: VI1PR04MB2990:EE_
X-Microsoft-Antispam-PRVS: <VI1PR04MB2990EDE6A2E34A39E5E6E346C7A49@VI1PR04MB2990.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OwgY/8NXgFc3ASH95VMg/GEI8X4X8/IkJaP3DvoWV5eiGbUjjo7Jp+1grUPiQX24mwnypY7N+EDCsBM49aprvBaJ0pyEdha5P0SXUcvGyM37HV/ZxFylE347CWOWLhylAVBJSspN1IP1L0g4Rhi8hNNZccRxpYxs1Rmzz0uINRuOXNhqDXkORF7jouQH5IVCFVMQJp+uhGi0bJlShm6gFXSj/mtRc/Qi8Rp4vd1QOdUTht4XQz/FN7P/pwWgzeiyAdk+m5pYOqYSl3Y78G2GoBXX2+6ySCK3tHiETD1KMboUgVWxxqvCVuNJeXTu4LDZ0LoMCMv38xeKoRfGeH5ZLj71laYyYGaNqttiYtxfjnIcakqI/aXJcMr1VMe5P8JLmeicyYuBSf/ODvSYVBsWsyhEbMKjxBghiheCzlFq7+tEtDj8QRBoASNyhO+rs76fDKg1aBl0QCbv9C+GecKq+QyMGjHBIML4geQNlKOatfce3l3BqP82NA3B8znvu+gbUK53WqSrXG4PQ25CuMdhY/TrMuGRC4SnqEc8vqDLjHk+GNtJb679la7ETpRDJZtpngGegTYjoa6nlbg31GgKsRQJXwVpClg0FGJzfiOTzZhkl77QHDsXf3Ro0gsyRziXtX88IDRcqsr8+m71foB7MvXFbE6W/TouaN3O71TbfurskdL4Fu/OACbG/Retfx92vII18/Jc0auR38qZf+qkkL66F2KIW0PL+kdecgYHYOk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2526.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(4744005)(38100700002)(186003)(6506007)(8936002)(86362001)(316002)(66556008)(66476007)(66946007)(4326008)(2906002)(508600001)(36756003)(6512007)(31686004)(5660300002)(6486002)(31696002)(2616005)(8676002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WU9xL2tXdy9ZLzV5NnhBZzNUVWdvV3c2blRwY0xLVGVDaW4rdFFpWTMyNkd0?=
 =?utf-8?B?VEloRXhEZHo3L0tNQVRnWnRSaDROb3dtTmt5VUtVWWk1NUlncmdqOTVwZk9k?=
 =?utf-8?B?VGxTTFFoaU0xVCttRGtvVm1rbHIwcHdYL1dwS2Z3OVBkVUIyTGRpTnZRaGFs?=
 =?utf-8?B?OEN0OUwySGgwSXJRdVRwWVRNT0Ztb3FGZkdTZytacCtrcVIvSnJCd3NCeVZL?=
 =?utf-8?B?cGF0WlJSdzFOZ0xXMEVkOFE1WU91bUkwSXBwR2JocFBCaXN5ajRYc3Jmb2E0?=
 =?utf-8?B?aUdzRWhuOXFySjZ3Wk1aU0ZJWWVIUVlRdlB4bml1M1BYWndSZlUrbS9wcnow?=
 =?utf-8?B?MjdCU2xNVUZGVlZheFcxWjQ0ckZUWFVpL3RvU2hEeHpXRlg3KytjVzUvM1JY?=
 =?utf-8?B?SUl4a2dpMzZqSkVSdTdzNDlSYmtGb0tZbGlQekJsalNVd1BBM25QeXZ0MXRW?=
 =?utf-8?B?VGlGT0h5aW9naENab29Nc2syM0o1ZnhmWnRPVXMveWZhTHBkOWEzbklDRlZs?=
 =?utf-8?B?WlpJYU5UZ1NsTDlHOFNwMVJnMnp6dXZQTGZkbExEVnZqb2UxZ2taMjN0SEJt?=
 =?utf-8?B?dm5TUjlSeGtqMmVEdUluWXltMXdIZUkyVjZHNWtYeVJlVWtrV005Rk1Sb0o1?=
 =?utf-8?B?UStpbVNFRG5tRWZqQ20rQmp1RnVyVllKYTlRQ2pWWi9raExIaDRFVFZ6S1hJ?=
 =?utf-8?B?L2RQOU9ySTRhMjNESFljTFExQjJ0MmRUWU1ObDFqc1Bjc2trWVJlMVBDYmVs?=
 =?utf-8?B?SktqK0FETHFPVGtGMldzdTQyQTdvZXBLWlYvdjJVbmc2SmxMNENHSkt0QXVn?=
 =?utf-8?B?Rjd4NlZ4bUpEUEpKMXBZSlo3NzEwcWVGWmFQK1RSckE0VXNqR0d1QUNBSDJ1?=
 =?utf-8?B?cUFjY1RKUUxiWllubk9ZekpMYzZ6Ly9kb091NzQ2Y3c1a2ZKNlF0MndRWitH?=
 =?utf-8?B?VHMrWExiNkR3RDFCdGxGZUJRMk1kcUNTZVhhOHY1NUM3Yk0waWNEMlU2OWlG?=
 =?utf-8?B?RnpuYVFVWS9aZUJOdDh6eDZ3OXdVZm5WbDVaTlJnNmFCUXVGZDltcTlSbjdL?=
 =?utf-8?B?VXBGSER4NnBlaDliUFZxTkpvODJscXdWeERrTHlZT0swd2x0YjA4MWxFMUho?=
 =?utf-8?B?R0pkTTBSTzJheHAwMHhzdndoT0FEVVdYM3A3RHl4UFhZT0xiUzZjVXVRbTBV?=
 =?utf-8?B?RUVlelFnendmVVpDbGhwQkF0azBXMFRxRjBzakEvL2owWHlkUHhUQWNOYVFr?=
 =?utf-8?B?a2RwWkpVZ1lBbHlmQ090cTZQVm9TR0ZSdGxqLzQ0NXdwOWVySXVlZjRQWmR2?=
 =?utf-8?B?WjlCQklic1Bob1d6djJMVnFhQjNEMGhpa3B3NlJSQmk1UjdJMmlIeWFubGsy?=
 =?utf-8?B?VEpRMmRYZVVOSXR0TEVweTBwQkhMblBkRm9nM2F3R1l2RDB4Y05yN3QrVGF1?=
 =?utf-8?B?dWU3TTRSQ3BLdFJwckQyTnVJMTFMdUgyNTl6cksvbk5lRWs0S0lNRkJ3OGdJ?=
 =?utf-8?B?TGFNd2RseEZ5SDBTWXZ6UFY3WGdkVWdtTnBac01oVnVrdEtRRzFXNTRHQ2p6?=
 =?utf-8?B?OVVOMUw4YnVlbWpwOUVSeUYrb1FXdm54Z0dOak9LazhqdGtxZENDL1JIRlNy?=
 =?utf-8?B?YVJFUGlUNEdCNWpMN2srUW9QWnVVeFNISjRtVXIvc0JNSkl6cklVTmJnYVdl?=
 =?utf-8?B?NFE2RUVqeUxveGNVT016TGNXTzJzYmRMNjFmWEk4cFZzM09IQnBBdWRjaFNG?=
 =?utf-8?B?cURFM045R2piWXJGSXdRS3Y1dWhHdHg0L3dPRDRYcENlK2pnZ1p1OEcwbW9j?=
 =?utf-8?B?aERodmNQdlZxWDlPdnZjM3hvZkVya3huUHFmL0grWTNCTkhrOHA0QzVpb3JY?=
 =?utf-8?B?a295TFBNTUQ4V1dTOUszaDJvczQ3dHNEdmF3VENJZjFMbnFXMzRsMDNWT3Rs?=
 =?utf-8?B?WmIvazgyaVpXRGFEY1Y3QVJjQytGWURGUmxSNS9rcWowNVVnR295OWNjcDRQ?=
 =?utf-8?B?TTIydHJCSEJaenYxVU5NR0hQUFExd1B0ZVZtVms2aUlva040MkcyZWlaTk8x?=
 =?utf-8?B?YlF3S21wWkw1aGdEdnhBZFA0b0VEOFp5SjRkamQrdUhnSkZFVnZ2TWlUbExO?=
 =?utf-8?B?M1FkQWhuWGtyRDI1Z2JTTWs3ZHIwcmE4Z2gwM3ZwMVdORUdYcFdLck42MUpv?=
 =?utf-8?B?SEdma1dTTW5aQjhaa1JjSW85TUtMc1dkUlFydUNtVU5aTmQ0eWwzbXBWSXVa?=
 =?utf-8?B?TzEzbzArTnFuaG9HeldINXQ3OGtZcTRxY095KyswcFVlTzZrNVBvV0puWW4v?=
 =?utf-8?B?ZGdhaDViOHo1Um5jbUdNcEcwVVAwRHlvcjVKNmtTMjBTMEowZWFvK2VBdDZ4?=
 =?utf-8?Q?+R4ryV+FZekTDCDUGvd3UrkcCrHcW8U4kcOM57S3KHhnd?=
X-MS-Exchange-AntiSpam-MessageData-1: ntt/wHWfXWEMxg==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 987fffcb-df65-47d8-b795-08da492795d4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2526.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2022 08:19:19.4988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vcqbLfoS41i794Y1efL5G5xr1DyxoSUJgHzR/DtN2Rg0sFFnmNkF2YIjbQP1nJ0rpL4nZms1jvtWRrrtviI9PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2990
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 07.06.22 15:58, Mathias Nyman wrote:

Hi,

> In shutdown (S5), with xHCI as host, this can be solved fairly easily
> by turning off roothub port power in the .shutdown path.

That would suck for the people who charge their phone from their
computer.

> This is discussed in xhci spec 4.19.4 for driver unload:
> "Before the xHC driver is unloaded, the driver should clear the
> Port Power (PP) flag of all Root Hub ports to place them into
> the Disabled state and reduce port power consumption."

Yes, you could say that the standard calls for this.

> But I can't come up with a better solution, so this RFC patch
> does exactly that. It turns off port power for xHC roothub ports
> in the hibernate poweroff_late stage, but only if the host isn't set
> to wake up the system from S4.

In general this looks like the sane strategy.
However, what will this do if the port is in an alternate mode
or if this is the port the system's battery is to be charged through?

	Regards
		Oliver

