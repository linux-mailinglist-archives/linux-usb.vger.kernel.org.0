Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65A0056C39E
	for <lists+linux-usb@lfdr.de>; Sat,  9 Jul 2022 01:14:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237665AbiGHXAc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Jul 2022 19:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237827AbiGHXAa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Jul 2022 19:00:30 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BBDB371B5
        for <linux-usb@vger.kernel.org>; Fri,  8 Jul 2022 16:00:29 -0700 (PDT)
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 95C10C0D62;
        Fri,  8 Jul 2022 23:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1657321228; bh=qgzRerEZFzWhwy78XRaL25RK9dKFO9bg9qxj5CtnJt8=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Y4iu3qH4UmPj8veZsBGlcN4QIYT217zb+0eT+i5qf8rH89eyFgULwJn9YkbwrZKGj
         qamZkV1Uaxh+0vhvR1POIXnz6h0YfKXIFjOKpSF63AGlef6k6pdAf4fH92x7LjRGVy
         vTcovFhp7dgzj2W7sDdpgjSGa8hX6SQJLGDt9yCX9gVZFIVyvw9wst9RnMQIDbFnQD
         XMOJfV2IF1pplf6V1FZvMd54tWXw4iiyYWZHdpCYqecOfE5OJFVf3Rtm17eYsOlbkJ
         nf7xyfLTnCYneSU122eOsUjKhCqYa2i/+X4FZRlatN9ux0iT/M0HFAFAA3uiOcsA6x
         cLEhEFvZxAYCQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 09F37A00A0;
        Fri,  8 Jul 2022 23:00:25 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id AFC4F40087;
        Fri,  8 Jul 2022 23:00:24 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="UkrNnhgS";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENVCZdqJPf2OmZxeW/UhJnf1j5vccUr2GBmQO8qJQcWZdD83buWwxf41wPGiKqrqdr4pWFwXCQurPV4+ZdPuGrTi+9WwIBt8wH5JA25HjXJS2gB4IGUrKO2KtSQxNnRk1au0M+X494LH4E2ohjvzR9d77FJLIR8Up3UUmlHBxxaDh5ZWgOyI0yql1s1UIpxy4R5h14abqnQzKrYNqBHWP4YnkkpmV/RcP7Rs7JfUFucuSJ0xkkyiLC+VOWwCnfJdcsH00KKNEaleWWYws4051ATweLROomAm+NYa+rN890OWVBJr5zNYT7M01EjRtfv5OPA/Lw7C9jOY+rionpZlEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgzRerEZFzWhwy78XRaL25RK9dKFO9bg9qxj5CtnJt8=;
 b=L3GClvAr3oX6xjP930dc4UJBVTtUKsTqrdYBb7wnFn8sbm65B5MEJ8Yanediw+IrRgraZLBX/MCXsloJgwRU4WmGhFhlPa5H+eAkKRAYulqGumQJxtUt/3AAxxC8px2q2VJPbJ77OISoXY1EQPKMu550/5ELCPp1b/lQbx9rEN18ybKhWa43l7J0N/+43mK8cfoLIbkxEUYk512JSSAP6GsunTl1ApUz32VnEXgZwSeHSkybX4UbuZsxoRT8rZnnrKCHfTHurhVm9/LTK2L1JDqB2P4AhBye9ybV7WI3EaHDwv+2pdNwywUOHqaBcLtf+VrZaAd5j5ZTPmsYa/psBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgzRerEZFzWhwy78XRaL25RK9dKFO9bg9qxj5CtnJt8=;
 b=UkrNnhgSsRgy+IyDHQBxTr55vmkHdvjaLMfxUOllOvUMbHO5wsLJrfQZ8XiXeqfXWyjmSKgNcl7kaz+XpObhxf65RO3EmX24IDSaYd2oUvH/miK63aEZVzrDcloeo6p/EmGiWZ/U+ldg2Xkd75BVDRC+yLCmXCGYdsV9Ty0gq4g=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DM5PR12MB2437.namprd12.prod.outlook.com (2603:10b6:4:ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 8 Jul
 2022 23:00:22 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::8948:d205:4d47:c54c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::8948:d205:4d47:c54c%7]) with mapi id 15.20.5417.016; Fri, 8 Jul 2022
 23:00:21 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Michael Grzeschik <mgr@pengutronix.de>,
        Greg KH <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: Re: [PATCH v2 2/2] usb: dwc3: gadget: fix high speed multiplier
 setting
Thread-Topic: [PATCH v2 2/2] usb: dwc3: gadget: fix high speed multiplier
 setting
Thread-Index: AQHYj7Dvh/jCNWZKnUKPjfA+5W9Wxa10cdQAgAABzgCAAKn7gA==
Date:   Fri, 8 Jul 2022 23:00:21 +0000
Message-ID: <e7e28a79-ba36-0dd2-3f97-15213cb39827@synopsys.com>
References: <20220704141812.1532306-1-m.grzeschik@pengutronix.de>
 <20220704141812.1532306-3-m.grzeschik@pengutronix.de>
 <Ysgm6nD02TKEYJeq@kroah.com> <20220708125158.GA8524@pengutronix.de>
In-Reply-To: <20220708125158.GA8524@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b4829aa9-51ed-484b-5905-08da6135a2d0
x-ms-traffictypediagnostic: DM5PR12MB2437:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A7gI+ih9jGLsFBFZaRthAYtjODLSQSknl4s/+C/n7D35BHyEWNkrYJJVLY3tr59qKxANf1t/M+Vd0AL++8CpY6I/70mdlbRmCdJkAmDTLektuH8sd2Tla/SFFcnD+u1jDtMKwVyMLprim7mDN1feFf1MvLWwYQLDCzNyz4/jnNywZvLx42Vm5Q4LiiTOpcpin/4BzvvSbhzh1fdHrfjimLB9afmE5TAwcnc552osy3gdNkfSPey0HMCIN2KvQVo/9uOx1wLIWxONgAgx+5blkQ48pykcP2ZY3AOugSU9yRMvWX/AMWQHvy2DlVQ3DsIKBzCORx7Bakoh/Uo51BWWQlhqIIJjZHxEAEE1wuJkdGJFZFfWzijUEJhlsCINF9gDTXcyCCWOa0BgyStKlepvQDH9JX6oJGknpaIUqgCl7q3xn4EAXO93EeL4flidFjxdHDjjT09Y8iC4fIWtPnBLqlZG1ps3lzpXcTWkKOy/KW3v7C+DzGM+XNtMIguE6pN8y+4vBAY3ZaQyxJf059f+adB4h+uJ4elvv9CFSP/NlZaAdrvoHKcQ7zTNggVR/laSu1QKPiYn+uabaFjmm4FQQWHXA8BfDVoxgoYZ+eF4o2Y3RpKM3Rd3Jw54YLSioze2azrfYi80Fggn+/qCZFweBmsHW4p3AWbDDghKK/wdrZxdEHaAQvDzmBukAr1JLwY3hhyrci3g36rzXBTjA2sdsI6QSdotPIlceBtFl4T5R3vW/wv0woIwoVAjeF3dEuUOAJixdlotn2a3YwUfZy4yVZtEwGZhSYPMVUsw8qiFYRimUCksSPcPeELTlB3N/t4znA23LiuONZSNZ6zrqXnGmGz0DRyFlsU4tVeXo7PT3vNKcSehWCWvOG/kqpZs5Vcy
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(346002)(396003)(366004)(39860400002)(122000001)(38100700002)(54906003)(83380400001)(36756003)(186003)(71200400001)(8676002)(66476007)(66446008)(110136005)(316002)(4326008)(76116006)(66946007)(64756008)(31686004)(66556008)(8936002)(6486002)(86362001)(478600001)(41300700001)(6506007)(26005)(38070700005)(2616005)(31696002)(6512007)(107886003)(2906002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?blZZVWVQWGE1K25UQ2ZkQWZ2UlErRk9iV3ZGKzZvSUkzM1UzaU9HQ0ZpUEp1?=
 =?utf-8?B?T0hxZXkyMzFueHRQaU53L2pRSFpmbHV2dEJGYlUzZlY3V0VlOGIyR0ROZzJT?=
 =?utf-8?B?Sit2QWdsMFE3aTFRZDB4L0ZkZmNiVG1YQm1yTFA2SUJRdWxYWXd2VWhGbVJI?=
 =?utf-8?B?azZZSTJMQUFpZm1EVXBEU1JVSUNCMHpFNldSanc4YkswZTVJKzJTbEg4ZWV2?=
 =?utf-8?B?RDNUMlROWFZ3b2dPTDlhWURSaVl6VGhvQjJRK0NmVjltTEZaNzl1YnZKOE5V?=
 =?utf-8?B?UTdUOEJGREhoVlFIei9hazYwUVlvRXNMWmJZSm5ZRldXWnVzVGdUU05qYVEv?=
 =?utf-8?B?bzBwQzdnZVpZbU5xc1pNWkJyMkc2MmJDVitJbVNkcVJETUx6NVVWdmFrMmI2?=
 =?utf-8?B?VFdQZ3JyUGJvaXpLdDNZQUl1eUlhQnp5UWJta2FIOVhIWTF4czlrUUhHRFNx?=
 =?utf-8?B?QkhHUU4rdXhkTjBKald6QWpLaHQzZ2F2WGVDSXVQZ3JKUjB3KzcvOWJzMWd0?=
 =?utf-8?B?anNPSFlHSTBaREdhem1ZVlRhdk1xbjhqUkhhMkRYRVpuVGFWNzd2T3krcTlI?=
 =?utf-8?B?em9RcVhRT01VZFhkdEhvMXBhYWZ6V0JKSUVlWEJTY2M4MzBtQVVVcS9UODR4?=
 =?utf-8?B?NjFabmNvWUNRM0duMU9tNThvTmtBZTJaMndYL3luOUNZK0thTWZBdkNUNzNE?=
 =?utf-8?B?VVFHbTJQbkRCdDlENW9GREtPbk1JeDBWYWRHeWFDVDltZXFSbFdlYTVTT2Ni?=
 =?utf-8?B?T2VKMmdCZWhlUktCRkdRSEN4T0JrVy9HWXIvR1RGRElVaGJGSWlPWGNMcmJF?=
 =?utf-8?B?VGhrbUVCYkFxdWxZUzcxUFFUekJhU2puWnVNYitOUHBWTlp2eld1RHN2RGtS?=
 =?utf-8?B?VHRCczNJaitoQWRia3hPRkJ0TXlGSFJ4TFpwR29DdzR5VGZCVFFjS25jc0JJ?=
 =?utf-8?B?dE5pa3R5TTYxWGVnSFRLVHFBUitYNjk1K0VtNlg0anVXaEZ2enBUMUJncDZ2?=
 =?utf-8?B?R3hNLzdhRVBtOWtjVGVwem8rVjFMaFNDYzdUNzdBeXgzK3F4S0ZEQW5HTXZD?=
 =?utf-8?B?eVI5MWpQQlJmRkVReENDT3ZocWxrZWF6Z0g5bVd0WWhkWi9ndkUzb3d2SFRH?=
 =?utf-8?B?L3hyTTV0eWpQSGRjdi9PSDU1SFhhZ1A1TTB2WnoyMnNLdjRYY1hJc2VCc3FT?=
 =?utf-8?B?RWZqUjEzUXM5RGZQOVV6WUpTNk4wODhmZng1ZWV6MFhVcUhCNk1NTHlZVUJB?=
 =?utf-8?B?RUNLOGJLaUswVEU4Sjh5Q3FJNVgrRHhuM1VUR3R0cENKUU1kZHd5Tys3U25q?=
 =?utf-8?B?RzRkcmFqVnpjUEZVUlRRMHBGYlo3a3k4anEwUFNMR2Y5NHR6YzA3TCtlU2Ft?=
 =?utf-8?B?TktvN0dSWkUraWc4cnN5djY1YnU4ZXl1ZnVqSGovblp4MzRRTHVmUEZObDdB?=
 =?utf-8?B?YnJDVWNjWHk5R042S251OVB4czlLaHhSYnFvd0dSRWRvQXRtcDkvZ1VBYmlY?=
 =?utf-8?B?N1lHdTQya2MwdE5rUjBndVpnK1Z3QlBpcHY4MWVLZlp1dmsxT1Y5ZW5PaURZ?=
 =?utf-8?B?eFNrY2RFVytDelhzQjRsRVFkZWNjTE5sTDB6WVF1Wlp0cTFHTWdkdHUzMENY?=
 =?utf-8?B?anRPY2dzQXY5RGp4U0dEWmZyNjZEQTNwNWRBeGpKZm9yREw1cXRrM2RpTGh6?=
 =?utf-8?B?MWxsUEluekZqMDVxU3pvVzQxMjRZeGs1TngxNW44SmloOU1KNHVITGU1bW11?=
 =?utf-8?B?RmJCUGZNR2J1dUpObk1lWFZUc0RRczFQRUhLY0NjcmEvamNNbE5WWUk3cjBp?=
 =?utf-8?B?YnV1MkMrTnExQitSOVI4dVhVY3RaUUtoSmZRYUcwbDhMWGZKdGFSbjYxR2xO?=
 =?utf-8?B?SG1uSDFBOWdiWHR2bzRpTDdVcEI1bmRFcHRqdndqYkRObzZHeGpOS3o4REQy?=
 =?utf-8?B?ZjhhQkhycjI3Tlo0WHJpT0dwcjJxM1BjTThmamxxR2YxZXBPeXdwN2IwWW8r?=
 =?utf-8?B?QW9oUWlxNm14MUFSa2J5S3dBVnZ1YlNaRW5RUFYzY3lMRWJEMVltY1FvWTBa?=
 =?utf-8?B?SnVqT1ZzOXhEL0JERmJEL3RnU2xQYmNnZkxqVnpyNnh2Z2tXMEU2K2RVMGcr?=
 =?utf-8?Q?d3rxNJjRbgQntOVDYef9PYbl/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <26CBB6BF409DE8458BB1BADFD0BFB65B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4829aa9-51ed-484b-5905-08da6135a2d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 23:00:21.8758
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2uX3xljgndf/mQwCkxRxZqX2EepYWG9ZNmD5mf8wucO5k7zM1lolCKbu4JE0MxTbDyIrRdrISYKzLYQbDpu1lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2437
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gNy84LzIwMjIsIE1pY2hhZWwgR3J6ZXNjaGlrIHdyb3RlOg0KPiBDYzogVGhpbmguTmd1eWVu
QHN5bm9wc3lzLmNvbQ0KPg0KPiBPbiBGcmksIEp1bCAwOCwgMjAyMiBhdCAwMjo0NTozMFBNICsw
MjAwLCBHcmVnIEtIIHdyb3RlOg0KPj4gT24gTW9uLCBKdWwgMDQsIDIwMjIgYXQgMDQ6MTg6MTJQ
TSArMDIwMCwgTWljaGFlbCBHcnplc2NoaWsgd3JvdGU6DQo+Pj4gRm9yIEhpZ2gtU3BlZWQgVHJh
bnNmZXJzIHRoZSBwcmVwYXJlX29uZV90cmIgZnVuY3Rpb24gaXMgY2FsY3VsYXRpbmcgDQo+Pj4g
dGhlDQo+Pj4gbXVsdGlwbGllciBzZXR0aW5nIGZvciB0aGUgdHJiIGJhc2VkIG9uIHRoZSBsZW5n
dGggcGFyYW1ldGVyIG9mIHRoZSB0cmINCj4+PiBjdXJyZW50bHkgcHJlcGFyZWQuIFRoaXMgYXNz
dW1wdGlvbiBpcyB3cm9uZy4gRm9yIHRyYnMgd2l0aCBhIHNnIGxpc3QsDQo+Pj4gdGhlIGxlbmd0
aCBvZiB0aGUgYWN0dWFsIHJlcXVlc3QgaGFzIHRvIGJlIHRha2VuIGluc3RlYWQuDQo+Pj4NCj4+
PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIEdyemVzY2hpayA8bS5ncnplc2NoaWtAcGVuZ3V0cm9u
aXguZGU+DQo+Pj4gLS0tDQo+Pj4gdjEgLT4gdjI6IC0gYWRkZWQgcmVmYWN0b3IgcGF0Y2ggYmVm
b3JlIHRoaXMgcGF0Y2gNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgLSB1c2luZyByZXEtPnJlcXVl
c3QubGVuZ3RoIGFzIGNvbmRpdGlvbiB2YWx1ZQ0KPj4NCj4+IERvZXMgdGhpcyBuZWVkIHRvIGJl
IGJhY2twb3J0ZWQgdG8gb2xkZXIga2VybmVscyBvciBpcyBpdCBvayBmb3INCj4+IDUuMjAtcmMx
Pw0KPg0KPiBXZSBjYW4gYWRkIHRoaXMgbGluZSB0byB0aGUgcGF0Y2guDQo+DQo+IEZpeGVzOiA0
MGQ4MjlmYjJlYzYgKCJ1c2I6IGR3YzM6IGdhZGdldDogQ29ycmVjdCBJU09DIERBVEEgUElEcyBm
b3IgDQo+IHNob3J0IHBhY2tldHMiKQ0KPg0KPiBJIHdvdWxkIHNheSB0aGlzIGNvdWxkIGJlIGJh
Y2twb3J0ZWQuDQo+DQo+IFRoaW5oPw0KDQpIaSBNaWNoYWVsLA0KDQpTaW5jZSB5b3UgaGF2ZSB0
aGUgcmVmYWN0b3JpbmcgcGF0Y2ggcHJpb3IgdG8gdGhpcywgaXQncyBhIGJpdCBkaWZmaWN1bHQg
DQp0byBiYWNrcG9ydCBjbGVhbmx5IHdpdGhvdXQgcmV3cml0aW5nIHRoZSBwYXRjaC4NCg0KSXQg
d291bGQgYmUgbmljZSB0byBiZSBhYmxlIHRvIGJhY2twb3J0IGZpeGVzLiBCdXQgZm9yIHRoaXMg
cGFydGljdWxhciANCmZpeCwgSSBkb24ndCB0aGluayB3aWxsIGFmZmVjdCB0b28gbWFueSB1c2Vy
cy4gTm90IG1hbnkgYXBwbGljYXRpb24gDQp3b3VsZCB1c2UgU0cgZm9yIHNpbXBseSAzS0Igb3Ig
bGVzcyByZXF1ZXN0cy4gKE5vdGUgdGhhdCBwZXJpb2RpYyBlcCBjYW4gDQpvbmx5IHRyYW5zZmVy
IHVwIHRvIDNLQi9pbnRlcnZhbCBpbiBIUykuIFR5cGljYWxseSBhIHBhZ2Ugc2l6ZSBpcyA0S0Is
IA0KYW5kIEkgZG9uJ3QgdGhpbmsgU0cgaXMgbmVlZGVkLg0KDQpBbnl3YXksIEkgdGhpbmsgR3Jl
ZyBhbHJlYWR5IHBpY2tlZCB1cCB5b3VyIHBhdGNoZXMuIFRoYW5rcyBmb3IgdGhlIGZpeCENCg0K
QlIsDQpUaGluaA0K
