Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7027278AF53
	for <lists+linux-usb@lfdr.de>; Mon, 28 Aug 2023 13:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbjH1Lxu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Aug 2023 07:53:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230294AbjH1Lx2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Aug 2023 07:53:28 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2070.outbound.protection.outlook.com [40.107.14.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C761811A
        for <linux-usb@vger.kernel.org>; Mon, 28 Aug 2023 04:53:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eDZCtjDq77HvXG9KvrwlSTqZnzlUVOUj359FSqny/ShWTIxw8Zias/HR1MwliMWBnv7Bu5lnj4PC/MyVDZao9YsgUipU1DUos4Cjx4QzzukY08L2+z/9hmKe/ZQC+mpUE4YUFp43SfrhV8qTKejfKjlrVRepKYmZjzqfAcJdIUkQ54C4bZaQEVDQqUgTklibV54ZzuPr+3br38jrVGnsuOaWjHKwV2rBjxYrDiGzdMPzE0qFNR7Ky5Us9ZNBT9ju1vx3au92kIeLCrJT6bea8huUdT2N//cXIn182C2rcoqXGirrKEDiZ7v6SxKjq43v7dnICUgylkRyNiV9UqJAFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9o0/EyTuD00FyCjBQHBaG2pAXD5UzNP2YZU+bwrb33U=;
 b=MT+MAaBi9DmGI/pJ4J7idMDEEwgV2vB82ua77qrRA/Bk7y/2hBPTUo4eZAOymswb1+1ZeaF0e7vcQQ6IUjtwr5Ansedy8vARhrsmR6sqjMWOMVgcAIdZjOE+4VWLJC5FwvBLZCKptIXFX634slueWrtOyWUHv1Nf/gRDEm/3irneSZrBu6ln67E7AZCFfHL/+xvra2FkOxwXmzcR3w3dTG0fAdod4pG3mPJec19PRpRZ3zy8fA8uXCQIHyExClVZxfYx+DF/rz7t5KwngSa3uUJG+tvOBxZS6VImlHQvcpc8BTXjkewEe5sEYiGzaor+34YHOmxWBkS17wbh15CRKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9o0/EyTuD00FyCjBQHBaG2pAXD5UzNP2YZU+bwrb33U=;
 b=mul2S5G+ACTdUkVWdG0tc+6G7o8m2yF2L7QIezSdqhgPRhliRuUaPswY6uMTI3Tnz7TU8bNDLNbOcSXMosVsExXnqOdxTx6LXlFm+r+eryyQJlrcd/neWuz6q/pMzwYdBVxbERAbCI92U20Oz1k3oLYE4mwRFGwb4hvvn0WJxSBEUStMAWxaMM+uTqY6/cbtmsjokGimxzu3LJpo93RXRe1HgnUoA4XgrMzYdE6VflBBXcrbsNv/kvah7xEknabsGTvHad/BLKZLSSCPUikNiqg00/afP2jFgdjwPMbKPjrT2suvcjaT5HW5CHkz5KNyNomZI2B0EvBgiPlzadb7XQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by PAWPR04MB9910.eurprd04.prod.outlook.com (2603:10a6:102:380::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 11:53:20 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::51fc:914:29f5:a420]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::51fc:914:29f5:a420%6]) with mapi id 15.20.6699.027; Mon, 28 Aug 2023
 11:53:20 +0000
Message-ID: <91080e7d-32be-d90e-d428-178b1c723ca4@suse.com>
Date:   Mon, 28 Aug 2023 13:53:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] USB: dwc2: hande irq on dead controller correctly
Content-Language: en-US
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Oliver Neukum <oneukum@suse.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <20230822112455.18957-1-oneukum@suse.com>
 <af261002-dcec-cd80-ef5f-4acf8b87f565@synopsys.com>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <af261002-dcec-cd80-ef5f-4acf8b87f565@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:66::7) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|PAWPR04MB9910:EE_
X-MS-Office365-Filtering-Correlation-Id: caa2da61-3863-4bb8-e28c-08dba7bd5fe5
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: USqSGiew2noniEvEmQj/LG26TswEwmEm+CssxNh/3/887jBialmVUKeAe9QV3Cs8i7+RGWkBj9oCQ72KrBEp2EBorTOEUyXNhbtGKwOOKmjZKwOiVRO18mOMNTTqCZrPLUErgkAWbKIpGes2owSVHMPfo+WxBLc+64r1C/V2UtcEjdntlDGcctBzgQT93HFS1liw7o0azN6T8Hq94txxHhwrczvBKkYE1jzjz8OCz2IIyFF0sBPrajEtwze/CXss3FqjkdEEUDlSR47Iz015elQZHCxn8EnTxkqiXEUzmKfxskRAsyEWziqj7CKtNb4b95OTF+ZiR546iZ09CXMLUjp54n1+GuYtteiPsq6/FzM/QDSiHgAKFodhIOhu+eRoUS/OLzGnLjap0Fthk6jEBm6DzBOaxzkgdsXz4Yk99eqWGX3vRxHZn0aFCTI7PfBiY7Y4ARgb9Ru9TpD4Bp6yQhpMpiFoM2t+wtn/sl9NI9/FtVBS/l4jm01wKMC4foW8LaeZo8GsLkkVZ44XOoZkAp8yFBKDIqslOajVH+ZH4DlEzJuECe5r2Gr4eIrRoyCkC8+wF1d6UJmQCPd0EKguxKu72EaRS0xgpmXYKtwTxenhAcWiZfk4Aa7ui9ua4X99uK7NWnDadUgho7ZGb0mb/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(396003)(39860400002)(346002)(451199024)(1800799009)(186009)(31686004)(6506007)(6666004)(6486002)(6512007)(36756003)(86362001)(31696002)(38100700002)(2616005)(4744005)(2906002)(53546011)(478600001)(110136005)(66476007)(66556008)(66946007)(41300700001)(8676002)(8936002)(5660300002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tzk5RldlcHRRU01sOXFTSGRjTmxEZzRMemJDQ1VIZmJqVVpxdWlZdW9wVElZ?=
 =?utf-8?B?cDQzckRGdFZVeTlmYWZTU09YZS9PYUFiNzBuZ0lTd3ZibXlLcythUU1USndG?=
 =?utf-8?B?OGtqWG9ZNGJkM3B3VzNTRjRkSUNvWWJmUS96aS92NUwrcTdpRW1wdDl0dmRi?=
 =?utf-8?B?T3BKRG5kY0hlSXpDYkV2V2NKbWx1UGlRcXBDNkExSkZWSW9iYTI4NzRXWklY?=
 =?utf-8?B?bmpwc0htZjB1eWdiRFNwS0VJQ1Z4Y2U0a1IxWHRPYU1DWEVQengwMW9ZNGRH?=
 =?utf-8?B?Z0NVYjBlY1MrYjFRd0xtbk40ZXdtZHNEanJFQnlJMmMzQWxpNUxhZFhZQXNz?=
 =?utf-8?B?YlBURFlZaXEwbEc3Y09pSDRjRE1vek8vb0x2Tjk3OUl3OTh0QTdONDdiODFI?=
 =?utf-8?B?RnpJYVRyMStXVm1uQ0JRUUNSK2I5S1d5QktjY2NRTENpU2hjYURhVVBxT2ov?=
 =?utf-8?B?QzlFTi9HS3RkdVY0aklKdytJWnNiZ1Z1TmZ5ZnR1SzJWRFhMY1A5ZTdkVWpG?=
 =?utf-8?B?aWZEejE1elQrR0U0UHhKc01lY3FzejZyejFBREtOejBCS1RwNFlZMERXZ3du?=
 =?utf-8?B?MWprVkZ5QWVBRVJxVi9BUXNyTXg5MUs5QlM5UFJndm5JTGtmOWFKejFXdFdY?=
 =?utf-8?B?YTcvYUVBMjU3MWxlNmtVYXUrbGJ1d2RWWC9vZ281dzRoeGVBbkhKQTZPUjB0?=
 =?utf-8?B?eXRGWk5Ha1lnb1ZyMVVSbmI2L3M1U0NnYzV6ODZLSmdzRkQ4UTRLNEkxNEtI?=
 =?utf-8?B?a0g2Z3VycDFNYWZhbit2U1JxdjVod3ppM3hxUnNreFlXQzRKTkljSWJOZERZ?=
 =?utf-8?B?dms4dnljVERNc2E0dnhhQTNTeGtmWlRJY3BQWUpQYmJCVm00aHlUNVA2VVZV?=
 =?utf-8?B?VmxEVk5ib0ZLUFVUenRnZ0RRVFdVV1MrdmtXQ281MkREclo0UzRleCtyQmpG?=
 =?utf-8?B?RlJ0THQ0aHd0N1V1MXBKaHFWYXdMWkk0aUFNVE5WV2E4M3V3cDc5ZkxXK3E5?=
 =?utf-8?B?SDNvckd1aW9CVEhabVdoeWtHRDgvSzE0VnpuU21FTXZRNjZHSUEvWTM2N0pk?=
 =?utf-8?B?bHl5OWlNODJ3aVAvNXg1aHE5WXpTblE4SCtTb21XYkE0dCtqZGlmVlJxSU9F?=
 =?utf-8?B?cVo1eVhkcGEwczhKbVFBZUNzUWdJVVdLZWpDN0R6MmpNMXFhSlhyUG5hMVRa?=
 =?utf-8?B?M0diS01mVGlYUk5uSFZMMjF3clNoTndMK3FrQm8yeVhJd3pUUUVsZ0RJbExY?=
 =?utf-8?B?TE9iODJTc0lGZmo5S3c0OGFvQ1lXS2phMTVvV3cwVE9VQUFKZFlxMWh3SjdK?=
 =?utf-8?B?NFpPUXlOc2QrdGRuQ3FyYnZiNFNPbUdtdnh5dmNuaHlLZmJScm5XSnhla25s?=
 =?utf-8?B?TGQxTVNXNWxTV2xWRzdTQUpOQWNSdmJWcEJHTUdNU3BDZ0tkWndheEtZSW43?=
 =?utf-8?B?VUFXdTJuOTBXejNraEZhcnQ0aGs0cjVKU3NuZEtSZHk3VnRrQzgybmR2SFhH?=
 =?utf-8?B?T0l4NHlGbDhIaHpCM240VTJNQlpXZkRIUEduRE1SbXE5S3gzSUdJQWhRbmQ4?=
 =?utf-8?B?SW00aUZBQnp1SGJvaUp0TW80MWc0YllPaTZFemkvb3M0Nkt2czZTak52VkEx?=
 =?utf-8?B?RzY0VWNzbmx5MmlzcGR5cVptQzZxWWUzSmVTQlpLYThMRmRkT2poUkNOeitT?=
 =?utf-8?B?NXVIMURmMjdIbmx5YlNZc21WMEc1dXBjVEhLMkZqZ0c0T0k5TWJpNUZWOTU5?=
 =?utf-8?B?R25XOHc2N0p0aFg5ZWNzM25sMDNaY2I0bGN4cE1mcklWeWlUZ1l6RU03YjB3?=
 =?utf-8?B?SzVRT0ZmNEl6TTRBaHRkemJKUHpDVDlRcDUxYmNLTXVMd0g3ZzEyeXhTcG4y?=
 =?utf-8?B?TUp2NUJ5VHdhOGRQRko1L3Q1TXV0dWtkVnFJME82N3FJVnRZTkVIRzhhNkd6?=
 =?utf-8?B?cEVDYVo5UHFPQnc3d1dnbUIxYVZ6V09panVzT3VLQkYyTU5hY2g2WWdIdU5B?=
 =?utf-8?B?UkZsU2VEc3VraHdpQ01hdTE5c0lrMWRVcFdrYWFJTVVsQ3JsYWtSY002MWhh?=
 =?utf-8?B?QmJGM25Nb3hnZWJhK1JQaHRZd3A2L0ora3ByUkhldjdUYy9UekllNzBtZWlH?=
 =?utf-8?B?NjhDc1Fpd3BSbndWa1cybkZUaXVFZUJLQ2tpcVRsL0k4M1dDaGVHUjhqWmsv?=
 =?utf-8?Q?gVM44vPaejSxnpUOWvXWiLKbkXAVUnSo0NPG1B+ieOE1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caa2da61-3863-4bb8-e28c-08dba7bd5fe5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 11:53:20.4415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TArx0FypSukiO9WbeifsMeKh04/QU8kC44UL2Il0R7INWaUqJ+rJc/m44u3sP5Fw9iTzZEGAp5kJcbHAL42r5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9910
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 28.08.23 12:52, Minas Harutyunyan wrote:

Hi,
  
> If core is dead then it can not assert interrupt, it's more possible

No, but it may have asserted the interrupt and then died.

> that it's spurious interrupt or interrupt from other device (IRQ is
> shared) and nothing should be handled. In this case reply by IRQ_HANDLED
> is incorrect because nothing is handled.

In this case we cannot be sure if it was our interrupt.
IRQ_NONE however means that we are sure. Likelihood is not
a relevant question here. We must know for sure if we claim
IRQ_NONE, because IRQ_NONE has consequences.

	Regards
		Oliver

