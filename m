Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AFBC4C9A57
	for <lists+linux-usb@lfdr.de>; Wed,  2 Mar 2022 02:22:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238422AbiCBBXj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Mar 2022 20:23:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbiCBBXi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Mar 2022 20:23:38 -0500
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15A49488A1
        for <linux-usb@vger.kernel.org>; Tue,  1 Mar 2022 17:22:56 -0800 (PST)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0893640616;
        Wed,  2 Mar 2022 01:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1646184175; bh=Vu66+NIgRap+6uGSm6hIdOf1xCNaXfzp+kOUQGhUxzc=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Ob0/zdTbUk1l5rpADAJWn1gjI0TI1VumQtzkBO8LPhjznv4v7qL4rf8eNxy3GLpB7
         cbLrHUU2WFKqMtWekLDGJ5Pi3e2jCUgFEh9TDYWcNVHIwyvRVYXOOCoB5aB79WO7zp
         60T4kq9mTfSfUfedbp7X8TZ7cUL54vbLzSYhrDIYg4VwtxTsQvYa3FHdJeoOBLESwl
         0qkU0BDqUxYpzZm6EByRhNk+8gFatfoLJruk+MeP+qf/71qQn3aPTj9nfiZjeS75Ad
         Rer4jsLky8qh88585xhLzqVATRR6Zkcx5EDG61cz0yq8K9rFzL+M+zsGoT21KwcNuR
         dVG9VfBFiAEaA==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 293D6A0071;
        Wed,  2 Mar 2022 01:22:53 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2044.outbound.protection.outlook.com [104.47.57.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 54D8180078;
        Wed,  2 Mar 2022 01:22:51 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="dwFiM6Nr";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jO0X3CjhF8Bx7bEYwSmthRVm9jXkGANtNVHkamt2dbO/zZlzrD+cMSaWYY6+Cpw8vGTRYAaEcbWh/ZweIe0QI9X8Tkj0dD/qUerIUhdaCqefQ6NxGL79fHc+U55blNF5bWU1OWp9v4yPztOFg1nNdhfCsMYwSorAAWk1fo7/gKcHogYHKGnHVSbxfGdx+rGlzoQd9MorN7eMQs+FyAJ+YJcaCf3VXJ1aokcvK6My7KA5KFjvJ/I7B/OF5k+OV+mKxE0e7DZEJP5EknrsqN4s8KecCWYUP04YrFu0ZjVysGcRZX9Gqoq8i1h3yivHCYJa8dt4gLpys/EQRcf1UwqaeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vu66+NIgRap+6uGSm6hIdOf1xCNaXfzp+kOUQGhUxzc=;
 b=OSYIywiUgrChO8TaVuncN8C3SCwdNy7eMTjWZflU2zHoyauGM8szlE22dHA7JxWJ7+WhkwshF4r1yAcg9IKtltuBnlRxSSwiCL/5rwFGhhrcESUa3AyOofFdD9mfS5AstGZxaPsTa3NeOkDVxf/A7spM9a9z4twr2coMN5qFJmK5mWEXHn05t0XRQLKgKYurnkD6fm4iHKcchFbZ5WmRTiYyRoR+HzAeGNU9mPQzm0Wt0qeaRxK+/Vam5koSya1DqzdWqAEHV4iuBsvkt1dx+yEAZDlBX/z75YSwlcOiqzG12lS6NfnKDos99u3xFQdSCXaIIDkSI1FNgTQgsJxFew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vu66+NIgRap+6uGSm6hIdOf1xCNaXfzp+kOUQGhUxzc=;
 b=dwFiM6NrySQ0NunCnwe2LC28ROwtikPeZl9MhWxAvOYubyuWkrZ4jfehM767q5iE+Dr8TLl9GKxB+ZNqpTMQLSkZvmSFMDi9wRJeoS1AVEDePL9oywyR7F2kOdYZbcDXSUgWEuBqIDLYpDJ8E8b9Y8eTmPz/90A93tlfOWbF50Q=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BN6PR1201MB0211.namprd12.prod.outlook.com (2603:10b6:405:55::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Wed, 2 Mar
 2022 01:22:49 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::141:3edf:164a:857b]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::141:3edf:164a:857b%4]) with mapi id 15.20.5017.027; Wed, 2 Mar 2022
 01:22:49 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 2/3] usb: dwc3: gadget: move cmd_endtransfer to extra
 function
Thread-Topic: [PATCH 2/3] usb: dwc3: gadget: move cmd_endtransfer to extra
 function
Thread-Index: AQHYLLUgKGxQJp0StkeIDCTC932IX6yrTqSA
Date:   Wed, 2 Mar 2022 01:22:49 +0000
Message-ID: <85e85927-82cc-fa8f-86a1-d9a5205bb7cc@synopsys.com>
References: <20220228150843.870809-1-m.grzeschik@pengutronix.de>
 <20220228150843.870809-3-m.grzeschik@pengutronix.de>
In-Reply-To: <20220228150843.870809-3-m.grzeschik@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e4c729f1-68cd-4aa3-9509-08d9fbeb2a63
x-ms-traffictypediagnostic: BN6PR1201MB0211:EE_
x-microsoft-antispam-prvs: <BN6PR1201MB0211ABA1CD0270985B0EF3DCAA039@BN6PR1201MB0211.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cApeBA038dfdBqTtWm1bGHKamm+EyyNYC4BB3UvwSiXENnJRbQBWHme806EpM0ivedh+2FkkThIKozU1eBM3MT6P+7zUzWKI+dKJuAuKVITGgzlhLj/08gSgCXKcyWxTMCyP5Tdj8ihjPeQLQGJGOrpqjs66Me+KLLccPs3lKcqd6xIfZcq7k4P0107xnya14FkEj05gH+tyKy+ItqER2pSO4sk50QIVebRfgxIKdbz59zSnRyKCYKhjQBOn0uo48+Rf2dnWqNdhqnfpsdEIh1uGEdP0QwD+B6Dw0uRny/GJ7VSCl0SQ9J/M02tWJhZtahdDV0WZAmrORnyBnUnQVHyHauD1bVprKrLbIm+aqg8F1VtTtOe73eC5WSuCkM4hh3uC7DQminzxK2aBzn9KrEPpcVk1sW7MdU8SDYjr12hEsrXeHY5/HC7To+2Yp7WYRYxj+CbY/c/OjBzH5Cm/sVTKg52WrXya4zVjnbE+FgBW0zPT32s2Pofi6dWXmrU6uHQwMKOFVkKsQAjRewUZNrWQbXakAMK0V+dB7A0eXXoX8XZX2Z9BpBOnfSHYn9anHEHQ8XI0FFAP7N8g4RqF56INdRbDvnIbX8qpnspip8iqDPwiXJVSSO5oU0Jl0Dy37ya751g4oEP+wfKgkyZ2sApkdqUEwBWkTHeSJHtfVRW6jS2RK7ymVJZps0G/19hL5MdaqwuzQ4X9vDp6RIMB988mhqej/PeLz0i1fhFB4Xr38wdno8oGI3xe/hst6KHTJsGYUVWsQyNxp1/8TAxU9g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(54906003)(2616005)(71200400001)(6486002)(6506007)(110136005)(8676002)(66556008)(66446008)(66476007)(64756008)(86362001)(66946007)(4326008)(186003)(8936002)(2906002)(5660300002)(26005)(76116006)(83380400001)(31686004)(38100700002)(122000001)(36756003)(6512007)(316002)(38070700005)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dEkzQW0wS09LM2tPUVgyRXZKanlmakw2NHE3bUZZamI2STRZRm9pZmdQQ1hP?=
 =?utf-8?B?bi9QRkV5RXFTYWp3MjlhaEg2TFJuTzhnam9hZGcxd3B1M20rTlF3N3BHck5M?=
 =?utf-8?B?VEVweFZZYVdOR2M0d3NIcFBxMHl0ajBKSW1JRDI5bXNlTFhNZk91cS8yMXc4?=
 =?utf-8?B?WGZXdGtLYU1vM09KbFFVRkRST0tQZHlUUi9KREw5ZldaV0FiVEpZK3RJWXZ0?=
 =?utf-8?B?bHlRdzJKWU1vWUU3b28vY1VTdzFiejdZMXZGWDdzSWRXQ1A2eVdib0kwckVl?=
 =?utf-8?B?SkY0NW56VTlTRExnWFo2TVhINU03eGViTTZ4RVQxSVNyaHBOUWRSdTN1S3hn?=
 =?utf-8?B?c0lEYkszTk9ldHdxeE9xa1RKTXB5UmMzWGFSbFNIcVgySGlKSFlBWXlXTy9w?=
 =?utf-8?B?THRiT0llNFlDcWFzeEZadlE5amZRZ0lncWtZWFQ4NitkUW8wQ0VTVWt0NXV0?=
 =?utf-8?B?dEIzTVZvOW5FbGZRWHk2bFVGMytKUmZjRGY5cTFPVkcvWCt6d1pvTU9NY3Bw?=
 =?utf-8?B?OUpSNjk4aWJpOWNTL2wzaVlsOVVENFZKVDJRTTdqUHhCeS9qUXVqd285Nm05?=
 =?utf-8?B?NmlGbjErNXQvOXVLaFh1dVRQZW05VDNwMGFNTDlnRDBlVGpUU3ZCN1kwb3ZK?=
 =?utf-8?B?MWNVWC9VTjRjdk1rUlZadzJnUE81c2VmVmVxYVpHNEZsLzRNOWpqQU4ralpO?=
 =?utf-8?B?Y2E3S1JTMzgzV1BwV2NwWS9BZ1pTTHRLZnNEUEFTckkzcE1UZmN5WDhQQzR2?=
 =?utf-8?B?RlFKQTVjUjhERnpNeVNTbjBkaUxENGFrT1pDc3JUam41Wm9INkZrU1dBUlhM?=
 =?utf-8?B?K2ZZK2hNYTQvdWxBanJrU3pOUENRSTR2UGw0cUgrM3UzODBpMDB4RFR0YWty?=
 =?utf-8?B?R0dwUmFLWUlyUEhvYWlkenlabjBLVkxHYkdaWVRZWUsxeUJOVmY1SWJuZUpz?=
 =?utf-8?B?c3pLTzVUTWdzQzViNGdkTnBtYitueGZiZWZwRlZ5Uy92RUtxeExORmZUVWxz?=
 =?utf-8?B?OW1Pazl2dzdtdUl0UElnVGtxbHpLMjB2TkVrVDNUL1NoZmt0RG85RHVGYkxr?=
 =?utf-8?B?N1NjVjdZQkx4eWNtd20zRmIxbHJoU0ZlU0tHT2ZROEJheFc3a2JJMG1qRkFM?=
 =?utf-8?B?ZTJlVGI3cGl3Q0RjMjVCZStNOHJjdmZQV0hiaUs4V0N0aklLY3lnSFpsZmVq?=
 =?utf-8?B?SDJvMFFHVkFrOGE1ZUJpSnVGZFdoUUNKYk10bkp6M3VDTkdVZU9FVXk1eTU5?=
 =?utf-8?B?aURobktrU1gwTjE2S0ovUHFtNEYyRVBXZ04xV2RGc0g2d01DMGtwdVdPYWVl?=
 =?utf-8?B?OVZkUGg5TzNGK2FMQkZoWHRaOGtucng3RkdQYlJ1dXU3c21tSzBPdnJRNU5Y?=
 =?utf-8?B?SFlPM2l3Sm84YzJPVG81WkxIQ3BzUURTdndEOFRidEppUkxyZHNHODlRU0Q3?=
 =?utf-8?B?RUtyd2dCVVlmN3k5S1gyZWlTeXVxd3J5QzZFR3RCYktCSmc4ODBLdHg4VW5U?=
 =?utf-8?B?WmJHNlJuSmpieGx4RzdnZWVMZ2krRGNqL25hTXhsY2o2dEhyZS9BWllSTG9P?=
 =?utf-8?B?eUpLNjB4WTdXRWdRckliVWJlcUE2cDcvbk9UejJVMzRhMGF0bVNtRnF4SmIw?=
 =?utf-8?B?dmczeGN3eGNmQVJTZk45eDhWNUxqNGdYNHlOY0dZbHJkTDU5N0pKTHdWMG8z?=
 =?utf-8?B?N1V2b2FsSUtuQXBjR1YydkZSUXBGeTc2VkR1RDY3Z1pnVFcvNUs3MW9wWm1l?=
 =?utf-8?B?VVdEbjFmT2xKTnpPbEZob3RDaENocHBGZ0w4NEJOZHZ0K3JuL3lWazNIZXFw?=
 =?utf-8?B?MjM0dUE2TEY0VXNsbDFlZi9HS2Q1SVMvVkk0d0x3L053YXBtb09rN1dEQXdT?=
 =?utf-8?B?aGJ0VHpLbGt1b2dHNjVQK1ZXZS96ZVoxZkJEMkxQSnByRkRtdWRLRkxPZlE2?=
 =?utf-8?B?U0t2NzRjVnVDd2QyM21zOHFyNXF3TnB6Qy94bktaZUowQ0ZrMHJPZ3FZSTRi?=
 =?utf-8?B?SmZJOC9keWg4TFlJL2tudytZVjBNSDdkM01UZk5QSWdOem1vbWxqa0RRdDNn?=
 =?utf-8?B?bU9rTnovcWx4dnkrQ1FDWFV3UVY1c0gwZEV3ZUFjK2R4cVNKdEw3azhYeUhj?=
 =?utf-8?B?WGt2SU1ubkQxQ2pHRmlxM1NDSE9KL1poSExCOFVMZldxc2x3YnhLZ2d0ZnQx?=
 =?utf-8?B?cnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <005FC3D35C6CE8469B994DE0EA147E45@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c729f1-68cd-4aa3-9509-08d9fbeb2a63
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2022 01:22:49.6378
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1LMdQKECoRHVySgjkaf5A0GUl57HtJB0ZQxCTy/CrhAOXZo7MtKDQwzvAnFCpoFIYdA4uwmOGdhyH1EEOVwg3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0211
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCk1pY2hhZWwgR3J6ZXNjaGlrIHdyb3RlOg0KPiBUaGlzIHBhdGNoIGFkZHMgdGhlIGV4
dHJhIGZ1bmN0aW9uIGR3YzNfZW5kX3RyYW5zZmVyIHRvIGNvbnNvbGlkYXRlIHRoZQ0KPiBzYW1l
IGNvZGVwYXRoLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBHcnplc2NoaWsgPG0uZ3J6
ZXNjaGlrQHBlbmd1dHJvbml4LmRlPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0
LmMgfCA1NiArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gIDEgZmls
ZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAzMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIGIvZHJpdmVycy91c2IvZHdjMy9nYWRn
ZXQuYw0KPiBpbmRleCAwZWQ4MzczMjNmNmJkMy4uYjg5ZGFkYWVmNGRiOWQgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9n
YWRnZXQuYw0KPiBAQCAtMTc4OCw2ICsxNzg4LDI3IEBAIHN0YXRpYyBpbnQgZHdjM19nYWRnZXRf
c3RhcnRfaXNvY19xdWlyayhzdHJ1Y3QgZHdjM19lcCAqZGVwKQ0KPiAgCXJldHVybiBfX2R3YzNf
Z2FkZ2V0X2tpY2tfdHJhbnNmZXIoZGVwKTsNCj4gIH0NCj4gIA0KPiArc3RhdGljIHZvaWQgZHdj
M19lbmRfdHJhbnNmZXIoc3RydWN0IGR3YzNfZXAgKmRlcCwgYm9vbCBmb3JjZSwgYm9vbCBpbnRl
cnJ1cHQpDQoNCk1heWJlIHdlIGNhbiBuYW1lIHRoaXMgYXMgX19kd2MzX3N0b3BfYWN0aXZlX3Ry
YW5zZmVyKCkgdG8gYmUgYSBiaXQgbW9yZQ0KY29uc2lzdGVudCBpbiBvdGhlciBwbGFjZXMgb2Yg
dGhpcyBkcml2ZXI/DQoNClBsYWNlIHRoaXMgZnVuY3Rpb24gYWJvdmUgZHdjM19nYWRnZXRfc3Rh
cnRfaXNvY19xdWlyaygpLiBBbHNvLCBjYW4gd2UNCndyaXRlIGEgYnJpZWYgZG9jIGRlc2NyaWJp
bmcgdGhpcyBmdW5jdGlvbiBoZXJlIGFzIHdlbGw/IEkgZ290IGEgZmVlbGluZw0KdGhhdCBub3Qg
bWFueSBrbm93IHdoYXQgc2V0dGluZyAiZm9yY2UiIG1lYW4gdG8gdGhlIGNvbnRyb2xsZXIuIElm
DQpGb3JjZVJNIGlzIHNldCwgdGhlbiB0aGUgY29udHJvbGxlciB3b24ndCB1cGRhdGUgdGhlIFRS
QiBwcm9ncmVzcyBvbg0KY29tbWFuZCBjb21wbGV0aW9uIG9yIGNsZWFyaW5nIEhXTyBiaXQuIEl0
IGRvZXNuJ3QgbWVhbiB0aGF0IHRoZSBjb21tYW5kDQp3aWxsIGNvbXBsZXRlIGltbWVkaWF0ZWx5
Lg0KDQpUaGFua3MsDQpUaGluaA0KDQo+ICt7DQo+ICsJc3RydWN0IGR3YzNfZ2FkZ2V0X2VwX2Nt
ZF9wYXJhbXMgcGFyYW1zOw0KPiArCXUzMiBjbWQ7DQo+ICsJaW50IHJldDsNCj4gKw0KPiArCWNt
ZCA9IERXQzNfREVQQ01EX0VORFRSQU5TRkVSOw0KPiArCWNtZCB8PSBmb3JjZSA/IERXQzNfREVQ
Q01EX0hJUFJJX0ZPUkNFUk0gOiAwOw0KPiArCWNtZCB8PSBpbnRlcnJ1cHQgPyBEV0MzX0RFUENN
RF9DTURJT0MgOiAwOw0KPiArCWNtZCB8PSBEV0MzX0RFUENNRF9QQVJBTShkZXAtPnJlc291cmNl
X2luZGV4KTsNCj4gKwltZW1zZXQoJnBhcmFtcywgMCwgc2l6ZW9mKHBhcmFtcykpOw0KPiArCXJl
dCA9IGR3YzNfc2VuZF9nYWRnZXRfZXBfY21kKGRlcCwgY21kLCAmcGFyYW1zKTsNCj4gKwlXQVJO
X09OX09OQ0UocmV0KTsNCj4gKwlkZXAtPnJlc291cmNlX2luZGV4ID0gMDsNCj4gKw0KPiArCWlm
ICghaW50ZXJydXB0KQ0KPiArCQlkZXAtPmZsYWdzICY9IH5EV0MzX0VQX1RSQU5TRkVSX1NUQVJU
RUQ7DQo+ICsJZWxzZSBpZiAoIXJldCkNCj4gKwkJZGVwLT5mbGFncyB8PSBEV0MzX0VQX0VORF9U
UkFOU0ZFUl9QRU5ESU5HOw0KPiArfQ0KPiArDQo+ICBzdGF0aWMgaW50IF9fZHdjM19nYWRnZXRf
c3RhcnRfaXNvYyhzdHJ1Y3QgZHdjM19lcCAqZGVwKQ0KPiAgew0KPiAgCWNvbnN0IHN0cnVjdCB1
c2JfZW5kcG9pbnRfZGVzY3JpcHRvciAqZGVzYyA9IGRlcC0+ZW5kcG9pbnQuZGVzYzsNCj4gQEAg
LTE4NDIsMjEgKzE4NjMsOCBAQCBzdGF0aWMgaW50IF9fZHdjM19nYWRnZXRfc3RhcnRfaXNvYyhz
dHJ1Y3QgZHdjM19lcCAqZGVwKQ0KPiAgCSAqIHN0YXR1cywgaXNzdWUgRU5EX1RSQU5TRkVSIGNv
bW1hbmQgYW5kIHJldHJ5IG9uIHRoZSBuZXh0IFhmZXJOb3RSZWFkeQ0KPiAgCSAqIGV2ZW50Lg0K
PiAgCSAqLw0KPiAtCWlmIChyZXQgPT0gLUVBR0FJTikgew0KPiAtCQlzdHJ1Y3QgZHdjM19nYWRn
ZXRfZXBfY21kX3BhcmFtcyBwYXJhbXM7DQo+IC0JCXUzMiBjbWQ7DQo+IC0NCj4gLQkJY21kID0g
RFdDM19ERVBDTURfRU5EVFJBTlNGRVIgfA0KPiAtCQkJRFdDM19ERVBDTURfQ01ESU9DIHwNCj4g
LQkJCURXQzNfREVQQ01EX1BBUkFNKGRlcC0+cmVzb3VyY2VfaW5kZXgpOw0KPiAtDQo+IC0JCWRl
cC0+cmVzb3VyY2VfaW5kZXggPSAwOw0KPiAtCQltZW1zZXQoJnBhcmFtcywgMCwgc2l6ZW9mKHBh
cmFtcykpOw0KPiAtDQo+IC0JCXJldCA9IGR3YzNfc2VuZF9nYWRnZXRfZXBfY21kKGRlcCwgY21k
LCAmcGFyYW1zKTsNCj4gLQkJaWYgKCFyZXQpDQo+IC0JCQlkZXAtPmZsYWdzIHw9IERXQzNfRVBf
RU5EX1RSQU5TRkVSX1BFTkRJTkc7DQo+IC0JfQ0KPiArCWlmIChyZXQgPT0gLUVBR0FJTikNCj4g
KwkJZHdjM19lbmRfdHJhbnNmZXIoZGVwLCBmYWxzZSwgdHJ1ZSk7DQo+ICANCj4gIAlyZXR1cm4g
cmV0Ow0KPiAgfQ0KPiBAQCAtMzU5NywxMCArMzYwNSw2IEBAIHN0YXRpYyB2b2lkIGR3YzNfcmVz
ZXRfZ2FkZ2V0KHN0cnVjdCBkd2MzICpkd2MpDQo+ICBzdGF0aWMgdm9pZCBkd2MzX3N0b3BfYWN0
aXZlX3RyYW5zZmVyKHN0cnVjdCBkd2MzX2VwICpkZXAsIGJvb2wgZm9yY2UsDQo+ICAJYm9vbCBp
bnRlcnJ1cHQpDQo+ICB7DQo+IC0Jc3RydWN0IGR3YzNfZ2FkZ2V0X2VwX2NtZF9wYXJhbXMgcGFy
YW1zOw0KPiAtCXUzMiBjbWQ7DQo+IC0JaW50IHJldDsNCj4gLQ0KPiAgCWlmICghKGRlcC0+Zmxh
Z3MgJiBEV0MzX0VQX1RSQU5TRkVSX1NUQVJURUQpIHx8DQo+ICAJICAgIChkZXAtPmZsYWdzICYg
RFdDM19FUF9FTkRfVFJBTlNGRVJfUEVORElORykpDQo+ICAJCXJldHVybjsNCj4gQEAgLTM2MzIs
MTkgKzM2MzYsNyBAQCBzdGF0aWMgdm9pZCBkd2MzX3N0b3BfYWN0aXZlX3RyYW5zZmVyKHN0cnVj
dCBkd2MzX2VwICpkZXAsIGJvb2wgZm9yY2UsDQo+ICAJICogVGhpcyBtb2RlIGlzIE5PVCBhdmFp
bGFibGUgb24gdGhlIERXQ191c2IzMSBJUC4NCj4gIAkgKi8NCj4gIA0KPiAtCWNtZCA9IERXQzNf
REVQQ01EX0VORFRSQU5TRkVSOw0KPiAtCWNtZCB8PSBmb3JjZSA/IERXQzNfREVQQ01EX0hJUFJJ
X0ZPUkNFUk0gOiAwOw0KPiAtCWNtZCB8PSBpbnRlcnJ1cHQgPyBEV0MzX0RFUENNRF9DTURJT0Mg
OiAwOw0KPiAtCWNtZCB8PSBEV0MzX0RFUENNRF9QQVJBTShkZXAtPnJlc291cmNlX2luZGV4KTsN
Cj4gLQltZW1zZXQoJnBhcmFtcywgMCwgc2l6ZW9mKHBhcmFtcykpOw0KPiAtCXJldCA9IGR3YzNf
c2VuZF9nYWRnZXRfZXBfY21kKGRlcCwgY21kLCAmcGFyYW1zKTsNCj4gLQlXQVJOX09OX09OQ0Uo
cmV0KTsNCj4gLQlkZXAtPnJlc291cmNlX2luZGV4ID0gMDsNCj4gLQ0KPiAtCWlmICghaW50ZXJy
dXB0KQ0KPiAtCQlkZXAtPmZsYWdzICY9IH5EV0MzX0VQX1RSQU5TRkVSX1NUQVJURUQ7DQo+IC0J
ZWxzZQ0KPiAtCQlkZXAtPmZsYWdzIHw9IERXQzNfRVBfRU5EX1RSQU5TRkVSX1BFTkRJTkc7DQo+
ICsJZHdjM19lbmRfdHJhbnNmZXIoZGVwLCBmb3JjZSwgaW50ZXJydXB0KTsNCj4gIH0NCj4gIA0K
PiAgc3RhdGljIHZvaWQgZHdjM19jbGVhcl9zdGFsbF9hbGxfZXAoc3RydWN0IGR3YzMgKmR3YykN
Cg0K
