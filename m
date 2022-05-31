Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEEC6539516
	for <lists+linux-usb@lfdr.de>; Tue, 31 May 2022 18:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346237AbiEaQr7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 May 2022 12:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346230AbiEaQr6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 May 2022 12:47:58 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 104E550476
        for <linux-usb@vger.kernel.org>; Tue, 31 May 2022 09:47:56 -0700 (PDT)
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8494F407EE;
        Tue, 31 May 2022 16:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1654015676; bh=Ee2R8Blsax9slEeES2tv7M9W/7ScKqtXDeccBz3pW+I=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=KQJ/0rTAGvXrRsiO42CsyIC9G3+wiiHg0ZBACpkEJ0qiVLsVWfWSHb3wR9KHjomvn
         xeq8UEgF+lZdu7pRgKVEUM4g1SWPpAMbAMi5eOFO6GOXdcP++F+Ad9EiM4zrly6xpo
         /fnI/ob5g2sUcgQ1y+EDS6qO4bwj7lnkvA891yYCr4/iV/RTv4qD3g2VSsfz2aJSYV
         U9TFTKZxlIWTwryJwdj3sPNQhz0Z63d4gNeakLZHGDI1eorzTmSDQN8gmV0ak4ANWO
         4pO9rcxyekn/Xh7L0i8qCnJTemMbgtpf+a59lgQCwsGtHUcP6X9DtlBM0Xnv9pqpgm
         p3Vk+dmXcZJVg==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 94FDEA0063;
        Tue, 31 May 2022 16:47:55 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1F355800CA;
        Tue, 31 May 2022 16:47:54 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="dQYJLqmL";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7fdFckdpl8n6KNOnFDqTGXJpoTPn2q7g9QtQWgWARdyffoX01pyAylUs6dCoR82URyLjsDiMWLOiHpEjZB/6eCLXfKQCu1O0IQ4u2F8Yh3Q9mOfDXNeK1veiDtVWiTCjZKLNL5151MHxEP8ZCMpEUQPpasa2mYHyqWzoi6grGfadbYcGcH5ixLaL7V6YsNX2b3p4NpuLusJcOQ3R3KxNTdQ4mHKafeHAl8yhayPADB5WuSs6wLDHiGwW0jikSC4VNTxDWNvjBonfssCDrD3pEeRUEN3XVUvxbWWZOnwAnJLu7QZZPAMwlsxws470YwSRxXONad/YeDsRPIP6Ob+dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ee2R8Blsax9slEeES2tv7M9W/7ScKqtXDeccBz3pW+I=;
 b=lp7dDS9txYT5fdmqyDkqMHA9wj+S1QglG9N7XHH9Tj6cA9BExVKkUo2/lIONqqhE/CuNm8naQDthcvJliSXUjVnNYgwK6VZ51NapfzVNBU9jumjzlG24ZbhkDQe14pABiA0pX4oHWHuH0BSMI5vgw79KLQyUdiTZvpnLABzyLjVqQuHhkWuvpwzhEX/JlPIu/a+Z0SDFJmdt4T91QRGq9rR1hhQh9bozX9Alpr1ek/Y0FYHoyyqpF3BPQ3G5mZGR6R/Q1xg+MLK+y1gzPV6PqYX9gP3wozy6xQKtFEzJBPva05Lwm1R5koN9vd98LN9TlvrhIlHRvClxeWIOOZGDrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ee2R8Blsax9slEeES2tv7M9W/7ScKqtXDeccBz3pW+I=;
 b=dQYJLqmLJVq67g7ElxjK6ggKVhJCpPvllqpsbo/B7239rp9Kd0yZ6UF6MnMekXdvxshELLxuKDZD5HmW8EmaOakyFJ4SgySI+zijvdNNCsEyc9EMxAg26Z0JecgppO9wWQrWG6WHbcA2LnzhnEusUyc3AoMuQ8ry9UJJtzlWZos=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BL0PR12MB2532.namprd12.prod.outlook.com (2603:10b6:207:4a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.16; Tue, 31 May
 2022 16:47:50 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::91c7:7e6b:d663:a349]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::91c7:7e6b:d663:a349%7]) with mapi id 15.20.5314.012; Tue, 31 May 2022
 16:47:50 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     "Jun Li (OSS)" <jun.li@oss.nxp.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "J.D. Yue" <jindong.yue@nxp.com>
Subject: Re: [PATCH] usb: dwc3: add power down scale setting
Thread-Topic: [PATCH] usb: dwc3: add power down scale setting
Thread-Index: AQHYcapxfZzJHZZbuU6v/rtjLbC2Sq0zetYAgAALLICAA6oqAIACCNIA
Date:   Tue, 31 May 2022 16:47:50 +0000
Message-ID: <f935ca2a-9b24-99d7-106e-77b95abeeefc@synopsys.com>
References: <1653642195-23889-1-git-send-email-jun.li@nxp.com>
 <7d4ad852-3781-2fde-1496-b80813fe505f@synopsys.com>
 <a0573de8-fb99-797d-bd49-e1aab7223c12@synopsys.com>
 <PA4PR04MB964065D4D3ED6DF8009A4EDB89DD9@PA4PR04MB9640.eurprd04.prod.outlook.com>
In-Reply-To: <PA4PR04MB964065D4D3ED6DF8009A4EDB89DD9@PA4PR04MB9640.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87c5003e-05d5-478b-bbe3-08da43254cae
x-ms-traffictypediagnostic: BL0PR12MB2532:EE_
x-microsoft-antispam-prvs: <BL0PR12MB2532D3C9DA4F521850460636AADC9@BL0PR12MB2532.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IgVdQQQeojC/JvX7NygdHjUD1GYylvxCKFZXO/1/lw8RYe0NvqL6a2X5bMLRBAmRnGQ9Rel1lwjVet2SaddRlYzsdYmwsAbYD1DcAv61x6tq3147vMRdtQcEVOErklCby5CaBEoM/+lGG35PyPrrs64e/kHmHV10G4xSHJ/ObdKSXnblMO6DsWpsW5DkChmcHFsCEhmMMYDppAD/w1IYFf+IysVM8jeojY8Z1YbsLHtt8r46gGRESUt1zfggox2yTjXVc5zGBPCUP/OIuNMq1g/fXCi3VmbiQHgHc6im52jAxZB9nR1ajjikIaOynUq0Cl2xl/cqffbodRG0ZjUpVMZVxQpE5nyY8LZfFCFtd0NoNtW02/vTumFX5zR+wLKiGVFjwUp7p6xseFx8xnkZNME0tlJMK45hkBjVt69SndBmlwMMiRhmper7zp4TPJZ9nVU4/CTPQUURZ66b79D3aUp3czHJLMrg0THfzfuQBHvQkd5iJdCOespxz2zNdswtXXJwjDjvmFrdKoCpEjTaT9vvZIoJmfFbdZc/UXPVz2PC2uui/V+QtoF04F9Lgpp0/kST7Up42YxcQ9heNsACjMVfJUB80nE/duAr7neFOsCg/Gi8Bg8nWxho4u1PXnrMWvYRrDE/fSTUuJwVneaJXdhYlgWayzZKwXwVyE0e2W9NphH82MTKl4xPwhQ1270OREF9uKR3OoKf0r1YUtxbLKaq36nweqYmii3UbiQfT5207q5kzaEXKONN4EZ/fXKJYSt2Pzvg0M6T1XLl3FohJg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(31686004)(31696002)(110136005)(54906003)(316002)(66476007)(66446008)(64756008)(71200400001)(66556008)(83380400001)(38100700002)(8676002)(76116006)(66946007)(4326008)(2616005)(508600001)(53546011)(186003)(6486002)(86362001)(8936002)(6512007)(5660300002)(38070700005)(26005)(122000001)(2906002)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VmU0SVlLU0hHRUhOeDc2a0tSMFBPZExOZ2JvSW5ES2JROExKcWxFMGZwaGd4?=
 =?utf-8?B?aW0rZkxXUzJHNFhjazJtK3U2aGk3UFhqMWcxSGwxcGRQTGdTbEl1aHoyRWhu?=
 =?utf-8?B?QUJURkxCbUs4SlFOUHhBQUQ3eFI4Z3NhbUVUWllIcHlWRkh5STFKZGlPVEJY?=
 =?utf-8?B?TytQTXRscjBjdUl1N2IybjAvUWl5MXVCb3hHWnJGdHAwNkdTQ20zYzVpWTZ3?=
 =?utf-8?B?b05uSFBKQVcvN25FTUF0N0h2MkVjRDV6UU5vU3FsOU1ROUxnemJCS1BsaUor?=
 =?utf-8?B?ZEQ2M0h4Y3VGMkdFc0QwcW9LTTJ3T3NUaGs5dzc0RXNUc3JLK2c2ZDZubDBm?=
 =?utf-8?B?bmJ5ODh3TkI4d0lqTnRwOVhtSm1mZlV3UmpBTzNyNTBlT0s0dXljUm9sT1g4?=
 =?utf-8?B?Sm1KNUdhY1Y5NTNwSWlOOFdaeWJhY0ZMSXB4U3Z1R0NSeWtRdFJ6cjRSSndY?=
 =?utf-8?B?emlvM2dzNXlxN0Ywa1FPZ2lUOTlGa1lMN1h2d1dhY3FBNVh0aS9yZ2psYk1J?=
 =?utf-8?B?Q045R0MyWlZTOXRXbmZXNW1VMGRSazZaS1lDb2x4VzQ3clUvNHhsbkhaUlpB?=
 =?utf-8?B?bVFlQ2pDL3Vpa1RZNEgxY0N6ZXNjNnZERWxJWVJqN1J1dTlsQmdnWklJRFdN?=
 =?utf-8?B?cm5NckF6NENKVmV2b3FZeXk1dVlWWXRCSXhja0hwdGQyVzRZK0hvbkc4ZW5E?=
 =?utf-8?B?eUxEN2hOWGh4LzFWME9PR2QzcW1SVVViazQ4clYwNHFOTnNoRldqNlpiOVNX?=
 =?utf-8?B?TGVpQTRkbDJLUy9WdERnRkxvWGFtYzdRN3dLQi9Xci92L3hNdDlYZkJ0ZmI3?=
 =?utf-8?B?ekpUUHpXbXZpQWthR3FneVFyU0JhdUM2M1pvWGtlZy9iaWphSjc5dUg1S0Jl?=
 =?utf-8?B?N0lZRGNzS2dYRVRPVDRpSDVyQnhselltdC9vdU5GMkF0OThaMmZSeDRDclUx?=
 =?utf-8?B?eUdSUlNjck5oNFNLWml0WVRvamtzYzdOVmhPa3Vra09oMjB6d3Z6Qk1VbmZj?=
 =?utf-8?B?MU5NUm1FMGdSUGlGZlNseFlIT2c4bEJKOHNNMXlTR2ZNOWlLM1dhTzlPa09M?=
 =?utf-8?B?QndTTGUvaWExY0djWENZQy9HRVpPK0xNUEM4cEY2U1U3S1A5Y2lWQXpSazNm?=
 =?utf-8?B?NmVEQk9UZExteis1WUtqa2dReUhJTnhMNHVEWTZ2bGxqR3dtNExIQjQ5ZlFx?=
 =?utf-8?B?QnBwbm10dmo4SU9LUC9XYXpPRWV2RXRmUUcrTDRGOGRqRkxRMzVHSVlXMEdU?=
 =?utf-8?B?VXRRS1VzQ1NENWMrQkhzblJ3QzdVWmpJcmQwekhneHBjWFJGdFNRWDlhd2ZN?=
 =?utf-8?B?aTFoYUtYbm9vYy9XTGgwMGU0UnZ6OWMvQW5qU0dUNUFKY2IwcmpXNEt6ZVVz?=
 =?utf-8?B?ZWpHL0Q1WkFtZitSczA4UG5vTlNIMXJYU0tVQlZGMVRoLzFEMGw5aFNZdUVL?=
 =?utf-8?B?RVJBa2ljUU1EMUUzOWlWV2dHbndLZ3FBL0FlR0RVeEtSYnBWdGszN1FkWjJT?=
 =?utf-8?B?RGtEbUt1N1FMeW43MTd6bUxiWkhtK3hRQlkyVTNpcWtsWXliN1FOT1NwUUxO?=
 =?utf-8?B?TnAvbWRwMTloNEF3OXMrUXFrYWVkd0M5c3VxbXZxUCsrQVYveE5FeHZPMkxG?=
 =?utf-8?B?VTk5QXUrOGZFTkJrNkQxb3dCbDR1UGh3ZzI2Sk1sLzhRT1d2ZDMvanhteUsx?=
 =?utf-8?B?N09CS2JGdWJOL29EOUkzMFlpMGNUcU1sM09CNU1yT2RHSVUrSjZtdnU0S2Jo?=
 =?utf-8?B?Rjl1VFFRYXF4cHl6MU5rSGVNWjhDd016OUw2cGIrK3NnVyttR1VTenpqWStZ?=
 =?utf-8?B?WGdmSnZCRnp2SFRzUGZRdXY5QStmSHVqR2NCWDFobDBzdnRVZUQ3Wm9VU1pP?=
 =?utf-8?B?YWpXbTd6L2ZhcEdVNS9VK2FPUkJReVZScmRIaDNEYzFvOExobXMwOHBhaW9z?=
 =?utf-8?B?SHZOK3ZUMEJqRHlmYTBMUmwxUW1KN0JTSVlDZUwySG90V2swb2gxQnljbjc2?=
 =?utf-8?B?M3BLNE1JVkw0VVQwcU0zUFlJNXIvcEo1NStiVEY3TXg5QVZXWnUycmJOUVJ3?=
 =?utf-8?B?VGhQN0FseHcxK2doRWF4TWVNUHhxdE1lYzBPaXg5eVhPZUw5RkVLQVV2bzRN?=
 =?utf-8?B?NXphcnJoTS83TktsZ0hOdmt1amFXdThxcWRickJBUU5MSWdYOTk5M1V3MGNu?=
 =?utf-8?B?cEdaSDhXOHRCKzdLTU5RaGo0MkdKM0V6ZzNRN2ljVTBFSXNvc29na0d0eTgx?=
 =?utf-8?B?UmUxYXF1OE5TSjJaTURZUk44b2Q0NTgyN1pjc2p4ZDdSNFRYWXJzeWtEbFlx?=
 =?utf-8?B?UmVsQmJENkYvRzJjWDQ4UzR4UHloUkxSSHNNblI1bE1OYys4a1NkQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <46C7B6416BD1EB4BA65E3FE7FC30134B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87c5003e-05d5-478b-bbe3-08da43254cae
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2022 16:47:50.5404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +kOJ6mWw4N3Sn7/qx3Ohpw5M4YrXUj9xa/sULQkyaouOfHf9i3vf8f4eJH6UTDxf+nmXCiwnL8IfAXXfKJQe6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2532
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SnVuIExpIChPU1MpIHdyb3RlOg0KPiANCj4gDQo+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPj4gRnJvbTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KPj4g
U2VudDogU2F0dXJkYXksIE1heSAyOCwgMjAyMiA5OjQ2IEFNDQo+PiBUbzogSnVuIExpIDxqdW4u
bGlAbnhwLmNvbT47IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnOyBiYWxiaUBrZXJuZWwub3Jn
DQo+PiBDYzogbGludXgtdXNiQHZnZXIua2VybmVsLm9yZzsgSi5ELiBZdWUgPGppbmRvbmcueXVl
QG54cC5jb20+DQo+PiBTdWJqZWN0OiBSZTogW1BBVENIXSB1c2I6IGR3YzM6IGFkZCBwb3dlciBk
b3duIHNjYWxlIHNldHRpbmcNCj4+DQo+PiBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+Pj4gTGkgSnVu
IHdyb3RlOg0KPj4+PiBTb21lIFNvQyhlLmcgTlhQIGlteDhNUSkgbWF5IGhhdmUgYSB3cm9uZyBk
ZWZhdWx0IHBvd2VyIGRvd24gc2NhbGUNCj4+Pj4gc2V0dGluZyBzbyBuZWVkIGluaXQgaXQgdG8g
YmUgdGhlIGNvcnJlY3QgdmFsdWUsIHRoZSBwb3dlciBkb3duDQo+Pj4+IHNjYWxlIHNldHRpbmcg
ZGVzY3JpcHRpb24gaW4gRFdDMyBkYXRhYm9vazoNCj4+Pj4NCj4+Pj4gUG93ZXIgRG93biBTY2Fs
ZSAoUHdyRG5TY2FsZSkNCj4+Pj4gVGhlIFVTQjMgc3VzcGVuZF9jbGsgaW5wdXQgcmVwbGFjZXMg
cGlwZTNfcnhfcGNsayBhcyBhIGNsb2NrIHNvdXJjZSB0bw0KPj4+PiBhIHNtYWxsIHBhcnQgb2Yg
dGhlIFVTQjMgY29yZSB0aGF0IG9wZXJhdGVzIHdoZW4gdGhlIFNTIFBIWSBpcyBpbiBpdHMNCj4+
Pj4gbG93ZXN0IHBvd2VyIChQMykgc3RhdGUsIGFuZCB0aGVyZWZvcmUgZG9lcyBub3QgcHJvdmlk
ZSBhIGNsb2NrLg0KPj4+PiBUaGUgUG93ZXIgRG93biBTY2FsZSBmaWVsZCBzcGVjaWZpZXMgaG93
IG1hbnkgc3VzcGVuZF9jbGsgcGVyaW9kcyBmaXQNCj4+Pj4gaW50byBhIDE2IGtIeiBjbG9jayBw
ZXJpb2QuIFdoZW4gcGVyZm9ybWluZyB0aGUgZGl2aXNpb24sIHJvdW5kIHVwIHRoZQ0KPj4+PiBy
ZW1haW5kZXIuDQo+Pj4+IEZvciBleGFtcGxlLCB3aGVuIHVzaW5nIGFuIDgtYml0LzE2LWJpdC8z
Mi1iaXQgUEhZIGFuZCAyNS1NSHogU3VzcGVuZA0KPj4+PiBjbG9jaywNCj4+Pj4gUG93ZXIgRG93
biBTY2FsZSA9IDI1MDAwIGtIei8xNiBrSHogPSAxMydkMTU2MyAocm91bmRlciB1cCkNCj4+Pj4N
Cj4+Pj4gU28gdXNlIHRoZSBzdXNwZW5kIGNsb2NrIHJhdGUgdG8gY2FsY3VsYXRlIGl0Lg0KPj4N
Cj4+IEFsc28sIHNob3VsZG4ndCB0aGUgdmFsdWUgc2VsZWN0ZWQgYmUgdGhlIG1heF9yYXRlIG9m
IHRoZSBzdXNwZW5kIGNsb2NrDQo+PiBhbmQgbm90IGp1c3QgdGhlIHZhbHVlIGZyb20gY2xrX2dl
dF9yYXRlKCk/DQo+IA0KPiBJbiBteSBjYXNlLCB0aGUgc3VzcGVuZF9jbGsgaXMgZml4ZWQsIHNl
ZW1zIG1heCByYXRlIGlzIG9ubHkNCj4gVXNlZCBieSBjbG9jayBwcm92aWRlciBhbmQgdGhlcmUg
aXMgbm8gQVBJIHRvIGdldCBtYXhfcmF0ZSBmb3INCj4gY2xvY2sgdXNlcnMuDQo+IA0KDQpTZWVt
cyBsaWtlIG9ubHkgdGhlIHVzZXIvZGVzaWduZXIgb2YgdGhlIGRldmljZSBrbm93cyB0aGUgbWF4
IHJhdGUgZm9yDQp0aGUgc3VzcGVuZF9jbGsgaWYgdGhlIGNsb2NrIGZyZXF1ZW5jeSB2YXJpZXMu
IFdlIG1heSBub3Qgd2FudCB0bw0KaW5hZHZlcnRlbnRseSBvdmVyd3JpdGUgdGhlIGNvcnJlY3Qv
dGVzdGVkIGRlZmF1bHQgdmFsdWUgZm9yIGFsbA0KZGV2aWNlcy4gTWF5YmUgd2UgYWxzbyBuZWVk
IGEgbmV3IGRldmljZSBwcm9wZXJ0eSB0byBpbmZvcm0gdGhlDQpjb250cm9sbGVyIG9mIHRoZSBw
b3dlciBkb3duIHNjYWxlIHZhbHVlIGFuZCBnaXZlIHRoZSB1c2VyIGFuIG9wdGlvbiB0bw0Kb3Zl
cnJpZGUgdGhlIGNhbGN1bGF0ZWQgdmFsdWUgaGVyZS4NCg0KVGhhbmtzLA0KVGhpbmgNCg==
