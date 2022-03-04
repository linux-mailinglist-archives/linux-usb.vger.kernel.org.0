Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C3704CE131
	for <lists+linux-usb@lfdr.de>; Sat,  5 Mar 2022 00:48:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbiCDXtS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Mar 2022 18:49:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbiCDXtQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Mar 2022 18:49:16 -0500
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A7F52CCAE
        for <linux-usb@vger.kernel.org>; Fri,  4 Mar 2022 15:48:27 -0800 (PST)
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9E47541F3E;
        Fri,  4 Mar 2022 23:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1646437707; bh=3ltOAdF0xkDv41ZxWqnfQlTLVXdZLRsj4HKxtTGRwlM=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=RnJQzHZXAVAk9IIsKkNT9yBOg2GhTP3b3ffmD/zJLPfAZSRzDhqhkOhB6FObX0Jvy
         HAPSssHvrbLnMYEIsFGAQo6b79BZkdSSPypkcIcSNrKItHs5hxJtKsbdAScn94kgVL
         2CiR3wUlyEiEo4ED9H/a4Wc93IXpE7I5OHkQCV2oWGhQnH/CCVk2l8gfDnGXvHRYZl
         GFDXkfaTuaTXxNX+VLNxaQ3QHT92wE9P0O35rmCC/4OrEGzQo6zjj9UOpyyBJ6lqMC
         8M5Ee0u+6NXLA4GK3rjQaG5+LQaEyu7xojvejk9ECoCbDxM8pt2HwVivDff9IKGpto
         kSjLlRuSMB+Ig==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 9AD25A0063;
        Fri,  4 Mar 2022 23:48:25 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 797B2801D9;
        Fri,  4 Mar 2022 23:48:23 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="DV4Oxmfc";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCTsxEfchYOFhXzUg48bFsYvURkPd9LJzZjRnKi8OQjmE3vDm8OIKDRHUbJqESKOn8sBoDMgs2xnU3ueDQVDQKQGKzQGpXbsVTdW6Hc2D0C3H+IIEtMBxB7138JL4rAjr6SnDvGlROvEb5O6MtO08yvv/pIjXuWUYghOfLUlzbPrS+ZXEnjNziwralDv5VfqO1BibkaxDSxzMtDeZMnZwp0PIK8569RguAledy8Qn12SjXT3+pAVwKu3RouR5kwfoczkssuZgXBUg609wO1TI8fam/Q01EzJrtkEmFEXn0PUv/gcD74suvvRJUKoZHr/jjotnwqpMUtgsPpiVRd3AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ltOAdF0xkDv41ZxWqnfQlTLVXdZLRsj4HKxtTGRwlM=;
 b=XaD47bB9rV5uMT1NwIANwyp5cmWXhZpYmjT1W30HxyiVX3i574uUQSPHJu5LrahuHR43MLvjM9qhYax/123n11G0xpeiAuQ4zSZYl0GI+sidP0GsploR8FF7yy6mpVNMNz9s2RHv/D7JBrbTxtu9kCUZuOR1pWthsg/61+Kflro0hh/HZkGu7THVKxn361Mgxw3PVK9jPYvIcmgXWtlO7N2/a0LhSlE5GCOqi5xh+bL16wxId0xttyQDRxWRulfTKYCWAB4sMtQg/fY4rIoayjzGeYnEDqFW7Sv6QNNt9h9Cj7IKiEXmcWntkt1yjR4uWvMexARsIk59snBeU4wc7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ltOAdF0xkDv41ZxWqnfQlTLVXdZLRsj4HKxtTGRwlM=;
 b=DV4OxmfcDqBv4kS6A5NH3XQQ095JmgCR6/QInSXHpJpMuWZCpkuA+3AoXqpiR5p94vNKpDDqtL/VPpaj1018iDreZ5bxuKCsLuUlkwNEY66bSB7RiDNcjS5UghPJEemH/e+J7xSif79HCMz9LHtEN7nmeK4W4X9Yoba814Uj2sw=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DM6PR12MB2603.namprd12.prod.outlook.com (2603:10b6:5:49::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 23:48:20 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::141:3edf:164a:857b]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::141:3edf:164a:857b%4]) with mapi id 15.20.5038.017; Fri, 4 Mar 2022
 23:48:20 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Michael Grzeschik <mgr@pengutronix.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: DWC3 Isoc Gadget Missed Interrupts on Start Transfer
Thread-Topic: DWC3 Isoc Gadget Missed Interrupts on Start Transfer
Thread-Index: AQHYLkLRQwCpjMRYn0W3qK3i4sHgEKysq5kAgADX2ACAAPJlAIAAZEAAgAEOCoA=
Date:   Fri, 4 Mar 2022 23:48:20 +0000
Message-ID: <feeaff10-9f3f-baad-1a90-18d9340f0dc1@synopsys.com>
References: <20220302143539.GI11577@pengutronix.de>
 <73c5e6b4-8f68-9a6e-33e4-0c49c291ad94@synopsys.com>
 <20220303111526.GJ11577@pengutronix.de>
 <53d6666e-0a1e-08e9-9fe7-d73decf70fd6@synopsys.com>
 <20220304074148.GL11577@pengutronix.de>
In-Reply-To: <20220304074148.GL11577@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1cac2dc2-40c6-494a-4af4-08d9fe397665
x-ms-traffictypediagnostic: DM6PR12MB2603:EE_
x-microsoft-antispam-prvs: <DM6PR12MB2603074661ABFDA6031E7A32AA059@DM6PR12MB2603.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +DwN1Kg5dUWe5deGtmLX5NCtNao53Ef34aj+1/ds0qo7zUwWr8eA9bTNMcNMqvpJ40HUZtTnldjrbxKHo7swyWHx8yQKkyMFEmvJPOozNhXsu9GAsv7Udq4i9Ui5XlQ/tEGTjzbzO4EovfiQBJwRbExZS0GFhSBHA44yiCa6O7eMFfAQEXrWLfRS09zin80ADlsrsOrbfLhj2/J9OqBI2H4Xl50YhaGoPPlqKtjmmlBi9ia/MGr10lUEggQV8JllpELzidTUAwCEDF2tAbm0zqYzdhX1ypadg1YSpeWW1adH9p9MUR2t/GpIvTm5+xK1rzQUYpnIbroLAcXFjxW3EwN/ZpKxq8bLzoFI3Iatt+rCLpsMWXwg8ciXJwLBw2nywthHDbjPTntqZdfRtg84xuSL+W5a9Knfv2WFk+oH8C3PcjzrqfYV/ivUZiW64+GT14YLGpdGnXxBoKk16r5xwhCPs7i1N0nWKKVDuEwS3ddBEjiIHilb6p5/OSP1XkOSu4nvpoaNQRAXNQKX424LodKjnoYqTAwZwRZcfn7anxmxbwIkIcwNamdOmp1QA9VRPBy3hjUy+XaW/xMzapQxI07YlDO+jK0yKtNVAoy4XJQRrVl+wYUNsRfzyU8AW9gOvY44Hp6EGLBYcBmasXZmkUZ8AVwTno0dDtAYgRr/55dd/+X+ZKaeSQbxg4/GUZwpTEwnCuMHCAX7JqZAwpRAj4KHziRA1LfDIKvxTVZpw5uEIaCVkSLjE+7UvdgFG1cjNZmuEBbOjF2FiiRwjV2YBA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(83380400001)(4326008)(5660300002)(6486002)(186003)(2616005)(26005)(54906003)(316002)(66446008)(64756008)(66476007)(66556008)(66946007)(8676002)(110136005)(71200400001)(508600001)(76116006)(6512007)(6506007)(38070700005)(38100700002)(36756003)(31686004)(31696002)(86362001)(2906002)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2o5dXRpL04xTzZuL0gyeFVwRytlTmNhTEZxSStYeWtwWVQ3alRZc2doUjVY?=
 =?utf-8?B?M1BSWWtmM29RR2h1M3NaNk5rdGlUTVU0SWs0SDVmYUJoWFBTcVN5dnJWcTR1?=
 =?utf-8?B?Tnp4bi9qRXZHVnJlbnVIRU5YL0ZxaGFVbzZuWkV1eGdzb2RmYXZQdHVuc1oz?=
 =?utf-8?B?VWg1cS9TeUFDNnlKQzcxUm1zdVovN1RxN3BGWWN1dEw2aUxrN1dLRG1HcjJv?=
 =?utf-8?B?MFQ5M1RGVC9sTUwxaHg0TEhtYTJJNnpVcWgxZUMydjRGcUx4WGlJV2YzSERt?=
 =?utf-8?B?VFNoTXlMRStZbmRLeEgzKzF0NHI0VGJDQkJLZjB3TEZRQ20wOUpqcVJHNE1x?=
 =?utf-8?B?a1hxSTJDc1hkdGxlTURFVS9TNnlSL1Z1UVBhWUptbUppMGxiUnZ1MktQYzlJ?=
 =?utf-8?B?NHRBWFpxWDZCYjg2Q3hSVUpHWEprWVdxQkgyRzdReHoxS1RWVHQySlNlU3F6?=
 =?utf-8?B?dmZMdkdxZTFuYkdNTTAwREFZRmJlZnNERDNCckNMQVBOUU10cWNON0wrYUNi?=
 =?utf-8?B?ckNscWxNUmFrTHA0cWlkYldVdUFJRUxQMUpDUS9saUFGWTNXcDVJUnJPVEtz?=
 =?utf-8?B?U1VTVDZ0ZnByQWhEb1BvcTJPUEg5bFRWc1FBRGFSYmhPQmhPSHo2RDV0QVFm?=
 =?utf-8?B?b0tnaEc5WFpyTjR1ZGw2eVVFL0Fna2dZTG5HWi8vWTZ0L0lpWS9zZE1Ycjlq?=
 =?utf-8?B?YXNIc3l4SkxCQyt1R1FkZk1NRWVNaEJia2FOYlZZclpUakpnT2dDMGxVODdG?=
 =?utf-8?B?WVA4bE1IY1B4RmFVMkJ1d2I2V3o2ZDU1V0Q5YTJFWW9ZY1ZrM0lJdE1CbWww?=
 =?utf-8?B?aEVFZW1KUG1xRE80RUVNWjRhOVdKSUtMME9xbkpQanpJTUpTMEpQZnd4WTIy?=
 =?utf-8?B?UURXcWpJc0R4bXVLc01tSU12N0ZmUGJzR2c0bk9UZFhPcGdXWC84bzNTMlQr?=
 =?utf-8?B?aFQ3SHpmbTV6MDd5SDUvcXUvd0RlM1lvKzRSdCtmL1d0cUhuTnJEUUlKeXhK?=
 =?utf-8?B?cHJnQkcydEw4MjdDKzhqRUY0TlhVWFNHdGFJditiNkRvNVNWK20wUGxWRnk2?=
 =?utf-8?B?MEY3NTM0N1FJM1RPbGpaTXVSVHNDUU8wZWhteVVjM3hqbzhnak51LzRIR1pD?=
 =?utf-8?B?ekkydC9CR3NRdm03NEVIT0RWTXpMMDY2V094eGs4UVZrd2FZL2RIR3dZVXhk?=
 =?utf-8?B?SU9kcStjZXRvRzNSZDVlaE05UE9LdkFGZUhSTXl2eHR3SjdUY2FuL2xPazdH?=
 =?utf-8?B?WGpTdmlPOWQ2NDNQUWFhK2xKRzBRWk42dW5haHJlT3g4REE0YklZNXc2UkhH?=
 =?utf-8?B?VHA4bW1mTko3ZnJKNTVzV0hNQnY4QWdPSWxHUUJUMEhGaXZHSkRoL1d5Unpm?=
 =?utf-8?B?L1EraFY3ZVdVbmNGaThtTDJFVVJ1aG9saUtCZGFvendUQkl0a3dBaEFUNmF0?=
 =?utf-8?B?cHFsWDZ6M2RSelRFOUxJaDBmUDZJMFhHMWdBTURBcVZYVklVWDJPbXgzZXQr?=
 =?utf-8?B?ZC96V3ZYN3hMRUVLRmdHb2UrQ01uTmpReFhGN1dwRisrd25pR0pvRlMvbUJM?=
 =?utf-8?B?UTZra2NUQjlHTEtTd3A3U2d3ZFprMHZNU0ZmRTZ0dk9jWVppMFp0WUFhbkg4?=
 =?utf-8?B?d0EvbW1yYUNMb1FUUVFiWjJDS3l1a2ZGVzViQ1FYUHZZNWY5elV5SFN6UlBm?=
 =?utf-8?B?ZjNmbXF3azBDa0dRa09FL3BxOVhDYWNrRjJlR3JOUjhVMyszckl1cFVINWFL?=
 =?utf-8?B?YzkzK3lrWEhVOTNjRzFWMkJvU29mbS94OWJnRDhxVENCS2N1a08rbUNYZVNj?=
 =?utf-8?B?V3g0Z295VW5zTTVnWUJ0RGw3ZlczQ2h3cWhnK1ZDd1VReWxkVmkwVHVtb3Rj?=
 =?utf-8?B?eU82Mzk0Tzkwc1p0YTUrdWczOXlxUER0cE1xK0lLRTBvVEJvRGh1UGxucEJv?=
 =?utf-8?B?T2tYZTNrQ2VpUkJRL2c1Zm4zbC9LbTBCeUkrRDJrSUc2bnF6eThNNE9Bai9r?=
 =?utf-8?B?MHZoQ1I0cmtEVS9CWWNRUTZPOGxDQ0ZOSDlBTWI0TjFNMTJYVno5L0RrUlJ3?=
 =?utf-8?B?blBBVjlTSXBmbWNCYmY2VXZ3WmFFVHU3WXZodDQ5eHJyd203RmxGMElPMkd5?=
 =?utf-8?B?RzRXVkxsc0VFclRpb3RKUEtvTFBwMm5EREZOY3NkS0U4UTFjK1VSN1hqOHFa?=
 =?utf-8?B?RHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D513258CC54ED4FB136A08F6C267E03@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cac2dc2-40c6-494a-4af4-08d9fe397665
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2022 23:48:20.1483
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pv4jRnwzwXsblpwUIm/TDPwVEB4HA43QDam4CSAGoaMoN0D70DpBBczOV/E90HKmm8U033Z/7vErkbt9nxqnjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2603
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

TWljaGFlbCBHcnplc2NoaWsgd3JvdGU6DQo+IE9uIEZyaSwgTWFyIDA0LCAyMDIyIGF0IDAxOjQz
OjAwQU0gKzAwMDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4+IE1pY2hhZWwgR3J6ZXNjaGlrIHdy
b3RlOg0KPj4+IE9uIFdlZCwgTWFyIDAyLCAyMDIyIGF0IDEwOjIyOjU1UE0gKzAwMDAsIFRoaW5o
IE5ndXllbiB3cm90ZToNCj4+Pj4gTWljaGFlbCBHcnplc2NoaWsgd3JvdGU6DQo+Pj4+PiBJIGFt
IGN1cnJlbnRseSBkZWJ1Z2dpbmcgYSBzdHJhbmdlIGVycm9yIHdpdGggdHJhbnNmZXJyaW5nIGlz
b2MNCj4+Pj4+IHJlcXVlc3RzDQo+Pj4+PiB3aXRoDQo+Pj4+PiB0aGUgY3VycmVudCBtYWlubGlu
ZSBkcml2ZXIuDQo+Pj4+Pg0KPj4+Pj4gV2hlbiB0aGUgcGVuZGluZyBhbmQgc3RhcnRlZCBsaXN0
IGlzIGVtcHR5IHRoZSBjb21wbGV0ZSBpbnRlcnJ1cHQNCj4+Pj4+IGhhbmRsZXIgaXMNCj4+Pj4+
IHNlbmRpbmcgYW4gRW5kIFRyYW5zZmVyIHRvIHRoZSBjb250cm9sbGVyLiBUaGlzIEVuZCBUcmFu
c2ZlciB3aWxsDQo+Pj4+PiB0aGVuIGdldA0KPj4+Pj4gc3VjY2Vzc2Z1bGx5IGNvbXBsZXRlZC4N
Cj4+Pj4+DQo+Pj4+PiDCoMKgwqAgaXJxLzUwLWR3YzMtMzA1wqDCoMKgwqAgWzAwMF0gZC4uMS7C
oMKgIDE2Ni42NjE4NDU6IGR3YzNfZ2FkZ2V0X2VwX2NtZDoNCj4+Pj4+IGVwNWluOiBjbWQgJ0Vu
ZCBUcmFuc2ZlcicgW2IwZDA4XSBwYXJhbXMgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDANCj4+
Pj4+IC0tPg0KPj4+Pj4gc3RhdHVzOiBTdWNjZXNzZnVsDQo+Pj4+PiDCoMKgwqAgaXJxLzUwLWR3
YzMtMzA1wqDCoMKgwqAgWzAwMF0gZC4uMS7CoMKgIDE2Ni42NjE4Nzc6IGR3YzNfZXZlbnQ6IGV2
ZW50DQo+Pj4+PiAoMDgwYjAxZDYpOiBlcDVpbjogRW5kcG9pbnQgQ29tbWFuZCBDb21wbGV0ZQ0K
Pj4+Pj4gwqDCoMKgIGlycS81MC1kd2MzLTMwNcKgwqDCoMKgIFswMDBdIGQuLjEuwqDCoCAxNjYu
NjYxOTc5OiBkd2MzX2V2ZW50OiBldmVudA0KPj4+Pj4gKDQ4MmExMGQ2KTogZXA1aW46IFRyYW5z
ZmVyIE5vdCBSZWFkeSBbMDAwMDQ4MmFdIChOb3QgQWN0aXZlKQ0KPj4+Pj4NCj4+Pj4+DQo+Pj4+
PiBBZnRlciB0aGlzIHRoZSBUcmFuc2ZlciBuZWVkcyB0byBzdGFydCBhZ2Fpbi4gQnV0IHVuZm9y
dHVuYXRlbHkgdGhpcw0KPj4+Pj4gc29tZXRpbWVzDQo+Pj4+PiBkb2VzIG5vdCBzdWNjZWVkLiBZ
b3Ugc2VlIGluIHRoZSBmb2xsb3dpbmcgdHJhY2UgdGhhdCB0aGUgU3RhcnQgb2YNCj4+Pj4+IHRo
ZSBqdXN0DQo+Pj4+PiBwcmVwYXJlZCB0cmJzIGRpZCBjb21wbGV0ZSB3aXRoIGFuIC0xOC4NCj4+
Pj4+DQo+Pj4+PiDCoMKgIGt3b3JrZXIvdTU6Mi0zNDfCoMKgwqDCoCBbMDAxXSBkLi4yLsKgwqAg
MTY2LjY5MTI4ODogZHdjM19wcmVwYXJlX3RyYjoNCj4+Pj4+IGVwNWluOiB0cmIgMDAwMDAwMDA3
ZmY5NWExMiAoRTIzMzpEMjMyKSBidWYgMDAwMGZmZmZmZmIxYzJhOCBzaXplDQo+Pj4+PiAxeCAx
Mg0KPj4+Pj4gY3RybCAwMDAwMDQ2NTowMDAwMDAwMCAoSGxDczpTYzppc29jLWZpcnN0KQ0KPj4+
Pj4gwqDCoCBrd29ya2VyL3U1OjItMzQ3wqDCoMKgwqAgWzAwMV0gZC4uMi7CoMKgIDE2Ni42OTEy
OTM6IGR3YzNfcHJlcGFyZV90cmI6DQo+Pj4+PiBlcDVpbjogdHJiIDAwMDAwMDAwZjljZDE3NWUg
KEUyMzQ6RDIzMikgYnVmIDAwMDBmZmZmZmZiMWQwMDAgc2l6ZSAxeA0KPj4+Pj4gNzE1NiBjdHJs
IDAwMDAwNDcxOjAwMDAwMDAwIChIbGNzOlNjOmlzb2MpDQo+Pj4NCj4+PiBbc25pcF0NCj4+Pg0K
Pj4+Pj4NCj4+Pj4+IFRoZSBpbnRlcm1lZGlhdGUgQnVzIEV4cGlyeSBpcyBub3QgYWx3YXlzIHBy
ZXNlbnQgaW4gdGhhdCBjYXNlLCBidXQNCj4+Pj4+IGFsc28NCj4+Pj4+IGNvbXBsZXRlbHkgYWNj
ZXB0YWJsZSBhcyB3ZSBsb29wDQo+Pj4+PiBvdmVyIHRoZSBTdGFydCBUcmFuc2ZlciB1bnRpbCB0
aGlzIHN1Y2NlZWRzLg0KPj4+Pj4NCj4+Pj4+IERvIHlvdSBoYXZlIGFueSBJZGVhIHdoeSB0aGlz
IHN1Y2NlZWRlZCBTdGFydCBTdHJlYW1pbmcgZG9lcyBjb21lIGJhY2sNCj4+Pj4+IHdpdGggYW4N
Cj4+Pj4+IE1pc3NlZCBUcmFuc2ZlciBvbiB0aGUgZmlyc3QgdHJiPw0KPj4+Pj4NCj4+Pj4NCj4+
Pj4gSGkgTWljaGFlbCwNCj4+Pj4NCj4+Pj4gV2hlbiBzZW5kaW5nIHRoZSB0cmFjZSwgcGxlYXNl
IGxlYXZlIGl0IHVuZmlsdGVyZWQuIEl0J3MgbWlzc2luZyBzb21lDQo+Pj4+IHRyYWNlIGV2ZW50
cyB0aGF0IEkgd2FudCB0byBjaGVjay4NCj4+Pg0KPj4+IFJpZ2h0LCBpdCB3YXMgYSBtaXggb2Yg
dHJhY2VfZXZlbnQ6ZHdjMzoqIGFuZCBmdHJhY2VfZmlsdGVyPWR3YyouIFNvIEkNCj4+PiBraW5k
IG9mIGZlbHQgZmlsdGVyaW5nIG91dCB0aGUgaW50ZXJlc3RpbmcgcGFydCB3b3VsZCBoZWxwLg0K
Pj4+DQo+Pj4gQW55d2F5LiBIZXJlIGlzIHRoZSBzYW1lIHNpdHVhdGlvbiBpbiBhbm90aGVyIHRy
YWNlLCB3aXRoIGFsbA0KPj4+IHRyYWNlX2V2ZW50cyBmcm9tIGR3YzM6DQo+Pj4NCj4+DQo+PiA8
c25pcD4NCj4+DQo+Pj4NCj4+Pj4gUGxlYXNlIGNoZWNrIGlmIHRoZSBob3N0IGlzIGFjdHVhbGx5
IHBvbGxpbmcgZm9yIGRhdGEgYXQgdGhhdCB1ZnJhbWUuDQo+Pj4+IEVhY2ggVFJCIGlzIHNjaGVk
dWxlZCBmb3IgYSBwYXJ0aWN1bGFyIGludGVydmFsLiBJZiB0aGUgaG9zdCBkb2Vzbid0DQo+Pj4+
IHJlcXVlc3QgZm9yIGRhdGEgYXQgdGhhdCBwYXJ0aWN1bGFyIGludGVydmFsLCB0aGVuIGl0J3Mg
YSBtaXNzZWQgaXNvYw0KPj4+PiBhbHNvIChlcnIgLTE4KS4gU28sIGlmIHlvdSBoYXZlIGEgdXNi
IHRyYWZmaWMgYW5hbHl6ZXIsIHBsZWFzZSB2ZXJpZnkNCj4+Pj4gdGhpcy4gQWxzbywgbWF5YmUg
dHJ5IHdpdGggYSBkaWZmZXJlbnQgaG9zdCB2ZW5kb3IgdG8gc2VlIGlmIHRoZQ0KPj4+PiBiZWhh
dmlvciBpcyB0aGUgc2FtZS4NCj4+Pg0KPj4+IFRoZSBiZWhhdmlvciBzZWVtcyB0byBkaWZmZXIg
aWYgSSBhdHRhY2ggZGlmZmVyZW50IGhvc3RzLiBJIGhhdmUgbm8NCj4+PiB0cmFmZmljIGFuYWx5
emVyLiBXb3VsZCB1c2Jtb24gdW5kZXIgbGludXggaG9zdCB3b3JrIGZvciB0aGF0PyBIb3cgd291
bGQNCj4+DQo+PiB1c2Jtb24gZG9lc24ndCBzZWUgdXNiIHBhY2tldCBsZXZlbC4gU28gbm8sIHVz
Ym1vbiBkb2Vzbid0IHdvcmsuDQo+Pg0KPj4+IEkgc3luY2hyb25pemUgdGhlIGdhZGdldCByZXF1
ZXN0IGFuZCBob3N0IHVyYnMgdG8ga25vdyB3aGljaCBmcmFtZQ0KPj4+IGludGVydmFsIHdvdWxk
IGhhdmUgYmVlbiB0aGUgb25lIHRoYXQgd2FzIG1pc3NlZCBpbiBteSBsb2dzPw0KPj4NCj4+IEl0
IHdpbGwgYmUgZGlmZmljdWx0LiBZb3UnZCBoYXZlIHRvIGNoZWNrIHRoZSBleHBlY3RlZCBpbnRl
cnZhbCB0aGUgdXJiDQo+PiB3YXMgc2NoZWR1bGVkIGZvciBmcm9tIHhoY2kgZHJpdmVyLCBhbmQg
eW91IG1heSBoYXZlIHRvIGNoZWNrIHRoZQ0KPj4gTUZJTkRFWC4gWW91J2QgYWxzbyBuZWVkIHRv
IGRldGVybWluZSBhIHBvaW50IG9mIHJlZmVyZW5jZSB0aGF0IHRoZSBkYXRhDQo+PiByZWNlaXZl
ZCBmcm9tIGRldmljZSBpcyBmb3IgYSBwYXJ0aWN1bGFyIGludGVydmFsLiBFdmVuIGlmIHlvdSBo
YXZlIGFsbA0KPj4gdGhpcyBpbmZvLCB5b3UnZCBoYXZlIHRvIGFzc3VtZSBldmVyeXRoaW5nIHRo
ZSBob3N0IGNvbnRyb2xsZXIgcmVwb3J0ZWQNCj4+IGlzIGFjY3VyYXRlIGFuZCBub3QgbWlzc2lu
ZyBhbnl0aGluZy4NCj4gDQo+IFJpZ2h0LiBCdXQgYXMgSSBoYXZlIG5vIGFuYWx5emVyLCB0aGlz
IG9wdGlvbiBpcyBvdXQgb2Ygc2NvcGUgZm9yIG5vdy4NCj4gQW5kIGFzIHlvdSBmdXJ0aGVyIGRl
c2NyaWJlIHRoZSBsaWtlbGlob29kIGZvciB0aGUgaG9zdCBiZWluZyB0aGUgY2F1c2UNCj4gaXMg
YWxzbyB2ZXJ5IGxvdy4NCj4gDQo+IEkgYWxzbyB3YXMgbG9va2luZyBpbnRvIGFub3RoZXIgZGly
ZWN0aW9uIGFuZCB3YXMgc3VzcGVjdGluZyB0aGUNCj4gZnJhbWVfbGVuZ3RoIG5vdCBiZWluZyBw
cm9wZXJseSBjb25maWd1cmVkLg0KPiANCj4gSW4gbXkgc3lzdGVtIHRoZSByZWZfY2xrIGlzIDEw
ME1IeiBzbyB0aGUgcGVyaW9kIGlzIDEwbnMuIFRoYXQgaXMNCj4gYWxzbyB3aGF0IGlzIGNvbmZp
Z3VyZWQgaW4gZHRzIHdpdGggc25wcyxyZWYtY2xvY2stcGVyaW9kLW5zID0gPDEwPjsNCj4gDQo+
IFRoZSBkZWZhdWx0IGZvciB4aWxpbnggaXMgPDUwPiBzbyAyNU1Iei4gSXQgc2VlbWVkIHRoYXQg
Y2hhbmdpbmcgdGhpcw0KPiBoYWQgY29tcGxldGVseSBubyBlZmZlY3Qgb24gdGhlIHRyYW5zZmVy
cy4gSSBoYWQgZXhwZWN0ZWQgdGhhdCB0aGlzDQo+IHdvdWxkIGNoYW5nZSBhdCBsZWFzdCB0aGUg
c3RhYmlsaXR5Lg0KPiANCj4gVGhlIGZsYWRqIGlzIGFsc28gMCBpbiBhbGwgY2FzZXMuIERvIEkg
bWlzcyBzb21ldGhpbmcgaGVyZT8NCg0KVGhlIGNvbnRyb2xsZXIgdHVybnMgb2ZmIHNvbWUgY2xv
Y2tzIGFuZCB1c2VzIHJlZl9jbGsgdG8gdHJhY2sgdGhlIGN1cnJlbnQNCnVmcmFtZSB3aGVuIGl0
J3MgaW4gbG93IHBvd2VyLiBJZiB0aGUgZGV2aWNlIGlzIG5vdCBpbiBsb3cgcG93ZXIsIHRoZW4g
dGhlcmUncw0Kbm8gbmVlZCBmb3IgaXQgdG8gdXNlIHRoZSByZWZfY2xrIHRvIHRyYWNrIHVmcmFt
ZS4gVGhlIFVWQyBpcyBydW5uaW5nIGlzb2MgYXQNCjEgdWZyYW1lIGludGVydmFsLCB0aGUgZGV2
aWNlIGRlZmluaXRlbHkgd29uJ3QgZ28gaW4gbG93IHBvd2VyIGF0IHRoaXMgcmF0ZS4NCg0KQWxz
bywgSSdtIG5vdCBzdXJlIGlmIHlvdXIgc2V0dXAgaXMgY29uZmlndXJlZCB0byB0YWtlIGFkdmFu
dGFnZSBvZiB0aGF0IGZlYXR1cmUNCmVpdGhlci4NCg0KPiANCj4+PiBJcyB0aGVyZSBhbnkgd2F5
IHRoZSBnYWRnZXQgZHJpdmVyIGNvdWxkIHNlZSBpZiBmb3IgdGhhdCBpbnRlcnZhbCB0aGUNCj4+
PiBob3N0IGRpZCBub3QgcG9sbCBmb3IgZGF0YT8gT1IgYXJlIHRoZXJlIGJpdHMgdG8gZ2V0IHRo
aXMgYmVoYXZpb3VyDQo+Pj4gcHJlZGljdGFibGUgYW5kIHRoZSBkcml2ZXIgdG8gcmVhY3Qgb24/
DQo+Pj4NCj4+DQo+PiBZb3UgY2FuIGNoZWNrIGlmIHRoZXJlIGFueSAibWlzc2VkIHNlcnZpY2Ug
ZXJyb3IiIGZyb20gaG9zdCwgaXQgbWF5IGdpdmUNCj4+IHNvbWUgY2x1ZXMsIGJ1dCBub3QgdGhl
IHdob2xlIHBpY3R1cmUuDQo+IA0KPiBBbHJpZ2h0LCBJIHdpbGwgY2hlY2sgZm9yIHRoYXQgb3B0
aW9uLg0KPiANCj4+PiBPdGhlcndpc2UsIHdoeSBzaG91bGQgb24gYW4gb25nb2luZyBzdHJlYW0g
dGhlIGhvc3Qgbm90IHBvbGwNCj4+PiBmb3IgZGF0YSBpbiBhbnkgaW50ZXJ2YWwuIFdoYXQgd291
bGQgYmUgdGhlIGNvbnN0cmFpbnRzIHRvDQo+Pj4gaWdub3JlIG9uZSBpbnRlcnZhbC4NCj4+DQo+
PiBUaGUgaG9zdCBkcml2ZXIgbWF5IG5vdCBpbnRlbnRpb25hbGx5IGRvZXMgaXQuIFRoZXJlIGFy
ZSBtYW55IHJlYXNvbnMNCj4+IHdoZXJlIHRoZSBob3N0IGNvbnRyb2xsZXIgbm90IHBvbGwgZm9y
IGRhdGEsIGFuZCBJJ3ZlIHNlZW4gaXQgb2Z0ZW4uIEl0DQo+PiBjYW4gYmUgYmVjYXVzZSBvZiB0
aGUgZHJpdmVyIGhhbmRsaW5nIGludGVycnVwdCBsYXRlbmN5L2RlbGF5IHRoYXQNCj4+IHByZXZl
bnRzIHRoZSBkcml2ZXIgZnJvbSBmZWVkaW5nIGlzb2MgVEQvVFJCcyB0byB0aGUgY29udHJvbGxl
ciBpbiB0aW1lLA0KPj4gY2F1c2luZyB1bmRlcmZsb3cgYW5kIHN0YXJ2ZSB0aGUgY29udHJvbGxl
ci4gU29tZSBvdGhlciB0aW1lIGl0J3MgdGhlDQo+PiBjb250cm9sbGVyIHRoYXQgZGVjaWRlZCB0
aGUgYmFuZHdpZHRoIGlzIG5vdCBzdWZmaWNpZW50IGZvciBpc29jDQo+PiB0cmFuc2ZlciBvciBw
aHkgc2lnbmFsIGluc3RhYmlsaXR5IGFuZCBjYXVzZSBhIG1pc3NlZCBzZXJ2aWNlIGVycm9yIGV0
Yy4NCj4gDQo+IEkgYWxzbyB0aGluayBsYXRlbmN5IGlzIHRoZSBwb2ludCBoZXJlLiBJIGhhZCBh
IHBhdGNoIGxheWluZyBhcm91bmQgdGhhdA0KPiB3YXMgY291bnRpbmcgdGhlIHF1ZXVlZCByZXF1
ZXN0cyBidXQgb25seSBraWNrZWQgdGhlIHN0YXJ0IHRyYW5zZmVyDQo+IGFmdGVyIG9uZSBkZWZp
bmVkIHRocmVzaG9sZCB3YXMgcmVhY2hlZC4gVGhpcyBzZWVtZWQgdG8gaGVscCB3aXRoIHRoZQ0K
PiBtaXNzZWQgaW50ZXJydXB0cy4gQnV0IHVuZm9ydHVuYXRlbHkgdGhpcyBhcHByb2FjaCBpbnRy
b2R1Y2VkIG90aGVyDQo+IGlzc3Vlcy4gRm9yIGJlaW5nIGFic29sdXRlIHNhdmUgSSBoYWQgdG8g
cHV0IHRoaXMgdGhyZXNob2xkIHZlcnkgaGlnaC4NCj4gQnV0IHdoZW4gaW4gcmFyZSBjYXNlcyB0
aGUgRnJhbWUgdGhhdCB3YXMgbWVudCB0byBiZSBlbnF1ZXVlZCB3YXMgdmVyeQ0KPiBzbWFsbCB0
aGUgZnVsbCBhbW91bnQgb2YgZGF0YSBjb3VsZCByZWFjaCB1bmRlciB0aGF0IHRocmVzaG9sZCBh
bmQNCj4gc3RhbGwgdGhlIHdob2xlIHBpcGVsaW5lLCBzaW5jZSB0aGlzIGZyYW1lIHdhcyB0aGVu
IG5ldmVyIGtpY2tlZC4gSQ0KPiBjb3VsZCBzcHJpbmtsZSBzb21lIHRpbWVvdXQgaGFuZGxpbmcg
YXJvdW5kIGl0LiBUbyBlbnN1cmUgdGhhdCBhZnRlciBhDQo+IG1pbmltdW0gdGltZSB0aGUgbGFz
dCBxdWV1ZSB3aWxsIGRlZmluaXRlbHkgc3RhcnQuIEJ1dCB0aGlzIHNlZW1lZCB0byBiZQ0KPiBh
IHZlcnkgaGFja3kgYXBwcm9hY2guDQoNClllYWgsIHRoYXQgZG9lc24ndCBzb3VuZCByaWdodC4N
Cg0KPiANCj4+IEFueXdheSwgaW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UsIGZyb20gbXkgZXhwZXJp
ZW5jZSwgSSBkb24ndCB0aGluayBpdCdzDQo+PiB0aGUgaG9zdCB0aGF0J3MgbWlzc2luZyBhIHBv
bGwuIEl0J3MgcHJvYmFibHkgYmVjYXVzZSB0aGUgZGV2aWNlDQo+PiBzY2hlZHVsaW5nIGl0IHRv
byBhZ2dyZXNzaXZlbHkgZWFybHkuIENhbiB5b3UgdHJ5IHRvIHNjaGVkdWxlIG9uIHRoZSAybmQN
Cj4+IGludGVydmFsIGluc3RlYWQgYW5kIHNlZSBpZiBpdCBoZWxwcyBpbiB5b3VyIGNhc2UuDQo+
Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgYi9kcml2ZXJzL3Vz
Yi9kd2MzL2dhZGdldC5jDQo+PiBpbmRleCAzZTc1ZWFhMTNhYmMuLmI5ZWM3NjI2YjA4MCAxMDA2
NDQNCj4+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4+ICsrKyBiL2RyaXZlcnMv
dXNiL2R3YzMvZ2FkZ2V0LmMNCj4+IEBAIC0yMTA0LDcgKzIxMDQsNyBAQCBzdGF0aWMgaW50IF9f
ZHdjM19nYWRnZXRfc3RhcnRfaXNvYyhzdHJ1Y3QgZHdjM19lcA0KPj4gKmRlcCkNCj4+IMKgwqDC
oMKgwqDCoCB9DQo+Pg0KPj4gwqDCoMKgwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBEV0MzX0lTT0Nf
TUFYX1JFVFJJRVM7IGkrKykgew0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVw
LT5mcmFtZV9udW1iZXIgPSBEV0MzX0FMSUdOX0ZSQU1FKGRlcCwgaSArIDEpOw0KPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVwLT5mcmFtZV9udW1iZXIgPSBEV0MzX0FMSUdOX0ZS
QU1FKGRlcCwgaSArIDIpOw0KPj4NCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
ID0gX19kd2MzX2dhZGdldF9raWNrX3RyYW5zZmVyKGRlcCk7DQo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGlmIChyZXQgIT0gLUVBR0FJTikNCj4gDQo+IEkgYWxzbyBoYWQgdGhpcyBw
YXRjaCBhcHBsaWVkLiBJIGp1c3QgdGVzdGVkIGl0IGpldCB3aXRoICsgMyBpbnN0ZWFkDQo+IGFu
ZCBpdCBkaWQgc3RvcCBzaG93aW5nIHRoZSBtaXNzZWQgaW50ZXJydXB0cy4gSXMgdGhpcyBhIHZh
bGlkIHBhdGNoDQo+IGZvciBtYWlubGluZT8gSSBoYWQgbXkgZG91YnRzLCBzbyBtaXNzZWQgdG8g
c2VuZCBpdCB5ZXQuDQo+IA0KDQpOb3QgYnkgaXRzZWxmIGxpa2UgdGhpcy4gSSBqdXN0IHdhbnRl
ZCB0byB0ZXN0IHRoaXMgYW5kIGNvbmZpcm0gbXkNCnN1c3BpY2lvbiwgd2hpY2ggaXQgZGlkLg0K
DQpGb3IgYSByZWFsIHBhdGNoLCBpdCBzaG91bGQgbG9vayBzb21ldGhpbmcgbGlrZSB0aGlzOg0K
DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyBiL2RyaXZlcnMvdXNiL2R3
YzMvZ2FkZ2V0LmMNCmluZGV4IDNlNzVlYWExM2FiYy4uZmIwNzBhMzIzN2E4IDEwMDY0NA0KLS0t
IGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KKysrIGIvZHJpdmVycy91c2IvZHdjMy9nYWRn
ZXQuYw0KQEAgLTIxMDQsNyArMjEwNCwxMyBAQCBzdGF0aWMgaW50IF9fZHdjM19nYWRnZXRfc3Rh
cnRfaXNvYyhzdHJ1Y3QgZHdjM19lcCAqZGVwKQ0KICAgICAgICB9DQogDQogICAgICAgIGZvciAo
aSA9IDA7IGkgPCBEV0MzX0lTT0NfTUFYX1JFVFJJRVM7IGkrKykgew0KLSAgICAgICAgICAgICAg
IGRlcC0+ZnJhbWVfbnVtYmVyID0gRFdDM19BTElHTl9GUkFNRShkZXAsIGkgKyAxKTsNCisgICAg
ICAgICAgICAgICBpbnQgZnV0dXJlX2ludGVydmFsID0gaSArIDE7DQorDQorICAgICAgICAgICAg
ICAgLyogR2l2ZSB0aGUgY29udHJvbGxlciBhdCBsZWFzdCA1MDB1cyB0byBzY2hlZHVsZSB0cmFu
c2ZlciAqLw0KKyAgICAgICAgICAgICAgIGlmIChkZXNjLT5iSW50ZXJ2YWwgPCAzKQ0KKyAgICAg
ICAgICAgICAgICAgICAgICAgZnV0dXJlX2ludGVydmFsICs9IDMgLSBkZXNjLT5iSW50ZXJ2YWw7
DQorDQorICAgICAgICAgICAgICAgZGVwLT5mcmFtZV9udW1iZXIgPSBEV0MzX0FMSUdOX0ZSQU1F
KGRlcCwgZnV0dXJlX2ludGVydmFsKTsNCiANCiAgICAgICAgICAgICAgICByZXQgPSBfX2R3YzNf
Z2FkZ2V0X2tpY2tfdHJhbnNmZXIoZGVwKTsNCiAgICAgICAgICAgICAgICBpZiAocmV0ICE9IC1F
QUdBSU4pDQoNCg0KPj4gQWxzbywgdGhlcmUncyBhbm90aGVyIGlzc3VlIGluIHRoZSBkd2MzIGRy
aXZlci4gQ3VycmVudGx5IGl0IGNoZWNrcyB0aGUNCj4+IGV2ZW50IHN0YXR1cyBhbmQgcmVwb3J0
ZWQgaXQgdG8gYWxsIHRoZSByZXF1ZXN0cy4gSSBub3RpY2UgdGhhdCB5b3UgKG9yDQo+PiB0aGUg
ZGV2aWNlIFVWQykgZG9uJ3Qgc2V0IGludGVycnVwdCBmb3IgZXZlcnkgcmVxdWVzdCBidXQgYWJv
dXQgZXZlcnkNCj4+IDEwdGggcmVxdWVzdD8gTm90IGFsbCBvZiB0aGUgY29tcGxldGVkIHJlcXVl
c3RzIGZhaWxlZCB3aXRoIG1pc3NlZCBpc29jLA0KPj4gYnV0IHRoZSBpbnRlcnJ1cHQgZXZlbnQg
c3RhdHVzIGluY29ycmVjdGx5IHNldCAtMTggZm9yIGFsbCBvZiB0aGVtLiBUaGUNCj4+IGR3YzMg
ZHJpdmVyIHNob3VsZCBjaGVjayB0aGUgVFJCIHN0YXR1cyBmb3IgZWFjaCBpbmRpdmlkdWFsIFRS
QiBhbmQNCj4+IHJldHVybiB0aGUgcHJvcGVyIHN0YXR1cyB0byB0aGUgYXNzb2NpYXRlZCByZXF1
ZXN0Lg0KPiANCj4gT2ghIFRoaXMgaXMgd2hlcmUgdGhlIG11bHRpcGxlIC0xOCBhcmUgY29taW5n
IGZyb20uIEkgZGlkIG5vdCBoYXZlIHRpbWUNCj4gdG8gbG9vayBmb3IgdGhhdC4gQnV0IGl0IHRv
dGFsbHkgbWFrZXMgc2Vuc2UuDQo+IA0KDQpJZiB5b3UncmUgdXAgdG8gY3JlYXRpbmcgYSBwYXRj
aCB0byBmaXggaXQsIEknbGwgYmUgZ2xhZCB0byByZXZpZXcgaXQuDQpJZiBub3QsIGl0J2xsIGJl
IG9uIG15IHRvLWRvIGxpc3QgKHdoaWNoIG1heSB0YWtlIGF3aGlsZSkuDQoNClRoYW5rcywNClRo
aW5oDQo=
