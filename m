Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F184478F7B
	for <lists+linux-usb@lfdr.de>; Fri, 17 Dec 2021 16:23:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238110AbhLQPXe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Dec 2021 10:23:34 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:43537 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231348AbhLQPXa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Dec 2021 10:23:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1639754610; x=1671290610;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=e/rgwXEOYoqzU8X9KAzjzXgDD96JqJNLwbLamYfThkg=;
  b=MfrP/yGE8i3Fiu0FqVCb70vuR+HSBD2mbqyO/jo3TkX7CmNhbKHWjL6o
   GWYVnez5MOKo32CRC0i8Hp+KqCm0dBmvWLFLPG4Vn4+i9BupbZfP8tgve
   PUipCP9Eju3BG6/b9zHX89IGmXVxfXfeyc85QmXJrE7+1m7hSJ3NwGITw
   8UfWopiKB2zYbHq/fhQtnASH4+i5IdNUOeXhCcpMlM6JMEwYVIwGG5l2p
   /yVuAUvjmBJUHf7RnrYweYH9Nntf7D3HdcBE+ohjAdOUXCCJ++zCao3jc
   mN//11VkHdN88UdIR6mYFjeFoXLckI1+KkNBfwlpybeBfQBvUUxOnoA89
   g==;
IronPort-SDR: XF1epj6/yPxdjX+C0zKB2WXC/qMaoodaZY3nbM4P2j58QCUS8Bf1lQeRzEVyj9sscJJq9lzmtK
 wr8PrC3pCQU/EmUXJmJu9PA3cSc8c0FdRJNwm2cM9H4CHHecrudi72OtqKANoXIE9zt6Ta23aT
 /3UewvSK0u8pu9PKlIxFOKvhYoWlPxUFRTyS1GCO4Y5nP585IqsGeEqA2eCk1qZOPnCT0nuWFF
 oSkKYnfMMVbf6AG0508XDW52LyAj2U9LDlULivdFtu9i8rQYrU69jtiMaoJgzvxVhDQFLtKPDK
 9avzIEGLI1a6k8hOHQwwjRgK
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; 
   d="scan'208";a="155887772"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Dec 2021 08:23:29 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 08:23:17 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 17 Dec 2021 08:23:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iGHAabC29oqjRQ/ojaiWyFby/BkblItwks10wpD/bx3HAMKWMg2WaVnmFPhnX4VG2ggvzwsNYyMIebc84DD6Urw8BlH9h7xQnmJ2k6bibzxKg63cabBVdOJ13SlBu5+oSSqSsRUwtpc74QqSmfWtta5+eGKWy+LTwHAVaSMy6j51KtSYZk3rxVPvbeLPmkGAWfnWxX490MX1pjWTNu6L8qQuY1jgm2xQAk1QpiP6tEpteRSYBO5fEWm2JAHo9aXO9iKBP6juPnF4qHgZa0tHYjtQASgQdqTJ0FUC8gWecVvhdFCe6++3UyKTP5/j0xGJmbS3G/UGcAKAQ2Yrjy8EBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/rgwXEOYoqzU8X9KAzjzXgDD96JqJNLwbLamYfThkg=;
 b=iTdZOYUI7Vp/1hVIY+oyjuIGsuPqWYEv5ChWSID9qs38VWCSAP3BcmN3DII3vC4Aw3a63DAu5Vx64ysmBXvibuN7BxUYCcjvtVoQHYKqkF2FvbLS+sPceZk/YUTFymtkPBmrbNEPqXC6g4+quFwR7qeJhe8kSxKHtet5DI1UnA6vdlZ/1zf05zCFFnjdNHm5np+Sn/XO/827IVHlA/nQNxECZKHhASUUzNC3fUTnPdqJX9sybVTJYNIjP2skFBGg6W19n5CjcuafQutux5NN1mvuO1mbFTo0DFTp9qOrwxR86qkj3vrSCiJzfbVMb2kiPEaGx4fLYKruhvjjytQ4jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/rgwXEOYoqzU8X9KAzjzXgDD96JqJNLwbLamYfThkg=;
 b=DT0dlTZtLCHjq5Ic9h5fjAQKtBtIIs5rXfiWMkZRzjJoy6Zmm2hTfL6OKR/y2+Zn6PIcLK4Oeo4y1vr050YjzrUWrjlDiZToMhv7e8fwjo1p+q/snIe5WqZycoCyPXpZd85hYJ5geKxFFMNsWGWEjl0W7wJzbq5QICYYhdvEKps=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR11MB1998.namprd11.prod.outlook.com (2603:10b6:300:1e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Fri, 17 Dec
 2021 15:23:16 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::a192:c9ae:1f83:797b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::a192:c9ae:1f83:797b%9]) with mapi id 15.20.4801.017; Fri, 17 Dec 2021
 15:23:16 +0000
From:   <Conor.Dooley@microchip.com>
To:     <krzysztof.kozlowski@canonical.com>, <linus.walleij@linaro.org>,
        <bgolaszewski@baylibre.com>, <robh+dt@kernel.org>,
        <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <broonie@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
        <lee.jones@linaro.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
CC:     <geert@linux-m68k.org>, <bin.meng@windriver.com>,
        <heiko@sntech.de>, <Lewis.Hanly@microchip.com>,
        <Daire.McNamara@microchip.com>, <Ivan.Griffin@microchip.com>,
        <atish.patra@wdc.com>
Subject: Re: [PATCH v2 15/17] riscv: dts: microchip: refactor icicle kit
 device tree
Thread-Topic: [PATCH v2 15/17] riscv: dts: microchip: refactor icicle kit
 device tree
Thread-Index: AQHX8ylEKKNUHVy5IkWjmg6nu466E6w2yFYAgAAF4wA=
Date:   Fri, 17 Dec 2021 15:23:15 +0000
Message-ID: <429325fb-9190-0c65-7c54-fb6b1c8e847e@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-16-conor.dooley@microchip.com>
 <0b7344d2-629f-7f78-b0e8-f6c70fbe9f37@canonical.com>
In-Reply-To: <0b7344d2-629f-7f78-b0e8-f6c70fbe9f37@canonical.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d88c6321-d680-4d96-84f5-08d9c17125e5
x-ms-traffictypediagnostic: MWHPR11MB1998:EE_
x-microsoft-antispam-prvs: <MWHPR11MB1998AA573EFF3F90BCFC533B98789@MWHPR11MB1998.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qfzRoKjfznRzhxbEOInRp828FPTSeM3o5vbljg2TdI5YvtMXiCuwjOMPawGNbSwIrrA2+6gbFsESGK9kLxGr5+EAi2h9eLvKV6yZNSyoNUOTz5iv0Qz3d92XUe+6s3B8y5GBye32Z3k82Ym6ykHXxFIMvwwZmXegNOYHIjVSq3cpyA+OUZnhtk9raa5TZkhXHpr5O2WN8RRexuMOP6lRQSALiO5xSmpp/TIU3Jxu4NiaHEwWkgcYaMe/9N1XX6+wgwTcaeQsjuVQQqTXbDiPwQ2eGkhUt6OwC/FCpFMvEOp3NknWcSKL0ZzrhERpNcotnX7e9X2dtsZ1FsOh3Jf1guDDzzEImtuQVZ9zoxGnQcanJXuNOReAMGiCiewUnVpp6kOWg3Yo/w/O4gI0cvJlBg4fuTIRbyY2do/CvlQ1RA41GmYzyUe/Vh/ncq0fKpfq0Flkd+JgmswcZPi2g5NM/nHu4f0MpjzNF3llgCkMV0qOXdBt+Nr6qwFV8crF/DrGN3rCY/McbGS0HQ7J1bmY0wrUQVS+dEh/3/xH2Q0kBwcenfTcTFha6Y7cya/BnxoNqtmAtunnFcsVHgpcovW7XrGWIdjIoA8XSCGt0rm3vbpF7hhL/tNjtKm+BZegHiB8FU52zjuRaXxW1WgA6Vc+jFCtDa+p7A19G6hY7YAnRfYBJ5J1qyvmhbvI+ucd3zmhxZ7bzBrFklFuJlRvsKlFzHHUySXK0BJnCcDqN1RsLitNvZTOy/vjEQrxCNHYfNTSJBBzdoKriWcShU8vjC3AbEtNERdiICi09lia6+Fm9KY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6512007)(6486002)(316002)(83380400001)(110136005)(54906003)(122000001)(38100700002)(38070700005)(6506007)(91956017)(71200400001)(5660300002)(4326008)(508600001)(2906002)(76116006)(64756008)(66556008)(66476007)(66446008)(66946007)(53546011)(36756003)(26005)(2616005)(186003)(8936002)(7416002)(31696002)(86362001)(8676002)(921005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDNFMXAvM0J0TE9SZWFLcHQzdVVvUC9NY2hMMjVEOS94WnhrQVZ1T0RsdVNB?=
 =?utf-8?B?eTNEWVE2a2k1TFZWVnpLc1c5WTJQOXdoemZCNWRLZ2RnNDY1NXhWRElGM0Jq?=
 =?utf-8?B?WTNGWE1SdUdINzhPR1FSZlhEWXRHU3Y0U1hBTjQyZUdxcnlYT2JvbHFaWkh3?=
 =?utf-8?B?TGtJOHVVWmVQZDMyVnd2d2k4eC9QdUZvVWRVYXZEY3VrRHEwK1NLQjlDRURv?=
 =?utf-8?B?VVhGcXZXT2J6VjZqUkpGdWczQ2ZRSlJhR3dXOVVhVUs2U0tZVzJJT0tKQlVV?=
 =?utf-8?B?NXEyR1BJM1lYM3VqaFJqSGpLREhKRXpnd0sxczJ6RWJMcllPUG5FT0hmN1M3?=
 =?utf-8?B?WnZDbTJvUHRMWGQ0QjVBRDNyaGVhajJJem1HOThNRW9RN01TZm9jelZuLzJ1?=
 =?utf-8?B?bXRuTmViVkR5eHBDKzJPRHphcWJPWVBicjkvU3hyaXpKdndxcU9tZ1ZWbDRP?=
 =?utf-8?B?UGIrRTEzYmxQdDN4OGIzdUU5eFVKVG5JRlk3MzJYRDNSVG9lWHZvaHhIZUor?=
 =?utf-8?B?YTBHUnpmVXNzWFBmc1RwSWZmUnlZRENLSjJ5dHFtU0JVRi9ZV1lPZU5mcW00?=
 =?utf-8?B?T3ZJODFFWEgwZStIenlQQUE0bVpjOHRQUXM5RENtY1ArSWFNcHhOWGFzR0tW?=
 =?utf-8?B?eWRObjhTTC9WRHBFWVVPd1ArNDdxWm5pSXdIV25zM2dGSktQMTVLVVhOYzVF?=
 =?utf-8?B?WEZYRmNIT1YxeE1URGR4dzJMd1NlTHlYWVVDYmV4dm5vdVNuVXZRbmtiMGdP?=
 =?utf-8?B?ak9aVGV0QTJHeCtUVzZsajVFT2ttMGZDSWhWRFJzcHJHWUt3NGxqR2hOTFpt?=
 =?utf-8?B?T3RVd1dBQTJ0UjFYTVhob1V3TEczem5IbnE3Rkx4R2tTRlhxRHhEQmlBaE1E?=
 =?utf-8?B?TWJlZFZ1T0k2aHQ1UkdiTGdZY3VXOFlyZ3dNNldXcy9wZ3VlWEZtVHFmT05x?=
 =?utf-8?B?U1BZTVJPTVNwSDg4SmVIUC9WRjd4bzU5bU42ZDlSOEU4R0lUdVlHamRna2RY?=
 =?utf-8?B?dnEyemh0L2RnWi9ZV2NzbUZabVdJY0pVMTB4OWJnSW1SRGF5TzZDOE1scXV4?=
 =?utf-8?B?WUhrUnZoNDk5NGpTSUovWHdZcWxqWTN4U0J6WWVUVENKS3BsNXlFa0RIeDhP?=
 =?utf-8?B?NjRka3ZxYy91V2lITDU2SVkwOVAyTTYrMWJzRTYzTjh4NEMxbER4c3N2VGtq?=
 =?utf-8?B?dEJoR2lEMjc4THJuWGNjdHZEeWRSRGlYNTI4dWJBYm1hVUd4Q1pINDZHazRr?=
 =?utf-8?B?R2cwa1oxSVp3K3ZXTlNxNTF2aitXR2JHdm5qVzlod05OZHg3Z2NqUnhzaXNT?=
 =?utf-8?B?UG5tb056QXlDYUpzWnJWeG40cVFmbVF6d2Q5bU5GZnRaOEc4bHMxTndheHB3?=
 =?utf-8?B?Sks0UlVURFdxQ2xOOVN6cytUandQd0FZVnZyZXphMzBIZUROdmRRVjM2Rnl0?=
 =?utf-8?B?WmZoREdNUlg1ditUdGZTcDRPMGhoSXdxTVJJMGdCaHpFbFQrUDQ2THdPRTlJ?=
 =?utf-8?B?TzNkaFlrOTZOY3ZOMXU1SnZCSUtGRDJ2WEFkSzlqYlJ3MjM1TFROcHpPbExl?=
 =?utf-8?B?R0R4ZU5QaDV0M2xSUnB0d3ZOZWY2SXlQOE1leFJFTEdTd3FFNlFUakF2Vjdj?=
 =?utf-8?B?SGN2SkU2OG1PNXU0STU3MlVrL1ViZUZGcXpzQ1JXZWowbzRsaUZTQ2pNSjZE?=
 =?utf-8?B?YytWZi9NN2pPeDg5VjhiVVN2bUFlYTlCUVpGTVcwaUNNeWpyWVUraUNFTU9S?=
 =?utf-8?B?c2paYjBoejY3LzhVSDRjamx1MFVacnBWd2F1Wm9pMW42aXVDZ1VkSjIxTDQ1?=
 =?utf-8?B?NkFINnFsWWdNUVBLdVQxdk40ck1pbkZjYnRBUlIwcXpoOGVIdVNwdERUVVM1?=
 =?utf-8?B?WCtpT05SNllVamtielZkdUdtTlYyaDBEZ0x4R2JPUDRlMkFPd2ZoYmYrTHN0?=
 =?utf-8?B?SkJudG9Zc21pZTJDQzlveGJBVEFGZWRWVDVHOHhmbkd6TmFJSmYxem4yVUtU?=
 =?utf-8?B?Q1BaVCs1MUNpakJSd0w3Wm5VLzJhTXBnMFdheWZwR3NwSWJvbUZUcDlQdVRz?=
 =?utf-8?B?TDc0QUZQNEJCMVc0cnUzWTBpcjJqRHVoZ3BobFBJT1FSSmoxNFFpRTJUMlo1?=
 =?utf-8?B?bVU2TjZaUmxuODFjaGJTVGRaeERaMnFBVFBMN09VZ2pRTjJTMGpXaHRqZEN1?=
 =?utf-8?B?Z2pCbjJ3RnBjSTNrWmYyWC8wejRrbmNGTDRybnVWWmhNWjY4ZHJzNmlHVld6?=
 =?utf-8?B?aWlZWUg0Q3N4Q0Nyd0V2a2VwM1VnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <96F393AC1001374D9C8DD6DA4D04A552@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d88c6321-d680-4d96-84f5-08d9c17125e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 15:23:15.9181
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RxYBXG0pYblRbJa25f9SPtVc0RM7Vw5HECI9a6jwgzDLJKi1T2ZGnlUyBqps8gAdA8NK36YwBnt95rVo/hgyq5ry937tLHAkHQhxptqWG6c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1998
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gMTcvMTIvMjAyMSAxNTowNCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiAxNy8xMi8yMDIxIDEwOjMzLCBj
b25vci5kb29sZXlAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+IEZyb206IENvbm9yIERvb2xleSA8
Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+Pg0KPj4gQXNzb3J0ZWQgbWlub3IgY2hhbmdl
cyB0byB0aGUgTVBGUy9JY2ljbGUga2l0IGRldmljZSB0cmVlOg0KPj4NCj4+IC0gcmVuYW1lIHNl
cmlhbCB0byBtbXVhcnQgdG8gbWF0Y2ggbWljcm9jaGlwIGRvY3VtZW50YXRpb24NCj4+IC0gZW5h
YmxlIG1tdWFydDQgaW5zdGVhZCBvZiBtbXVhcnQwDQo+IA0KPiBUaGlzIGlzIG5vdCByZWZhY3Rv
cmluZy4gUmVmYWN0b3JpbmcgY291bGQgaW5jbHVkZSByZW5hbWVzLA0KPiBoaWVyYXJjaHkvbGF5
b3V0IGRpZmZlcmVuY2VzLCBuYW1pbmcsIGNvZGluZyBjb252ZW50aW9uLiBZb3UgYXJlDQo+IGNo
YW5naW5nIGZlYXR1cmVzLCBlLmcuIHVzaW5nIGRpZmZlcmVudCBVQVJULiBQbGVhc2Ugc3BsaXQg
dGhlIGNoYW5nZXMuDQp3aWxsIGRvIDopDQo+IA0KPj4gLSBtb3ZlIHN0ZG91dCBwYXRoIHRvIHNl
cmlhbDEgdG8gYXZvaWQgY29sbGlzaW9uIHdpdGgNCj4+ICAgICAgICBib290bG9hZGVyIHJ1bm5p
bmcgb24gdGhlIGU1MQ0KPj4gLSBzcGxpdCBtZW1vcnkgbm9kZSB0byBtYXRjaCB1cGRhdGVkIGZw
Z2EgZGVzaWduDQo+PiAtIG1vdmUgcGh5MCBpbnNpZGUgbWFjMSBub2RlIHRvIG1hdGNoIHBoeSBj
b25maWd1cmF0aW9uDQo+PiAtIGFkZCBsYWJlbHMgd2hlcmUgbWlzc2luZyAoY3B1cywgY2FjaGUg
Y29udHJvbGxlcikNCj4+IC0gYWRkIG1pc3NpbmcgYWRkcmVzcyBjZWxscyAmIGludGVycnVwdHMg
dG8gTUFDcw0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5
QG1pY3JvY2hpcC5jb20+DQo+PiAtLS0NCj4+ICAgLi4uL21pY3JvY2hpcC9taWNyb2NoaXAtbXBm
cy1pY2ljbGUta2l0LmR0cyAgIHwgNTIgKysrKysrKystLS0tLS0NCj4+ICAgLi4uL2Jvb3QvZHRz
L21pY3JvY2hpcC9taWNyb2NoaXAtbXBmcy5kdHNpICAgIHwgNzAgKysrKysrKysrKy0tLS0tLS0t
LQ0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKyksIDU0IGRlbGV0aW9ucygt
KQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL21pY3JvY2hpcC9taWNy
b2NoaXAtbXBmcy1pY2ljbGUta2l0LmR0cyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvbWljcm9jaGlw
L21pY3JvY2hpcC1tcGZzLWljaWNsZS1raXQuZHRzDQo+PiBpbmRleCAxNzRmOTc3YzE2NGIuLmY2
NTQyZWY3NjA0NiAxMDA2NDQNCj4+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvbWljcm9jaGlw
L21pY3JvY2hpcC1tcGZzLWljaWNsZS1raXQuZHRzDQo+PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL21pY3JvY2hpcC9taWNyb2NoaXAtbXBmcy1pY2ljbGUta2l0LmR0cw0KPj4gQEAgLTEsNSAr
MSw1IEBADQo+PiAgIC8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBNSVQp
DQo+PiAtLyogQ29weXJpZ2h0IChjKSAyMDIwIE1pY3JvY2hpcCBUZWNobm9sb2d5IEluYyAqLw0K
Pj4gKy8qIENvcHlyaWdodCAoYykgMjAyMC0yMDIxIE1pY3JvY2hpcCBUZWNobm9sb2d5IEluYyAq
Lw0KPj4NCj4+ICAgL2R0cy12MS87DQo+Pg0KPj4gQEAgLTEzLDI1ICsxMywzNCBAQCAvIHsNCj4+
ICAgICAgICBjb21wYXRpYmxlID0gIm1pY3JvY2hpcCxtcGZzLWljaWNsZS1raXQiLCAibWljcm9j
aGlwLG1wZnMiOw0KPj4NCj4+ICAgICAgICBhbGlhc2VzIHsNCj4+IC0gICAgICAgICAgICAgZXRo
ZXJuZXQwID0gJmVtYWMxOw0KPj4gLSAgICAgICAgICAgICBzZXJpYWwwID0gJnNlcmlhbDA7DQo+
PiAtICAgICAgICAgICAgIHNlcmlhbDEgPSAmc2VyaWFsMTsNCj4+IC0gICAgICAgICAgICAgc2Vy
aWFsMiA9ICZzZXJpYWwyOw0KPj4gLSAgICAgICAgICAgICBzZXJpYWwzID0gJnNlcmlhbDM7DQo+
PiArICAgICAgICAgICAgIGV0aGVybmV0MCA9ICZtYWMxOw0KPj4gKyAgICAgICAgICAgICBzZXJp
YWwwID0gJm1tdWFydDA7DQo+PiArICAgICAgICAgICAgIHNlcmlhbDEgPSAmbW11YXJ0MTsNCj4+
ICsgICAgICAgICAgICAgc2VyaWFsMiA9ICZtbXVhcnQyOw0KPj4gKyAgICAgICAgICAgICBzZXJp
YWwzID0gJm1tdWFydDM7DQo+PiArICAgICAgICAgICAgIHNlcmlhbDQgPSAmbW11YXJ0NDsNCj4+
ICAgICAgICB9Ow0KPj4NCj4+ICAgICAgICBjaG9zZW4gew0KPj4gLSAgICAgICAgICAgICBzdGRv
dXQtcGF0aCA9ICJzZXJpYWwwOjExNTIwMG44IjsNCj4+ICsgICAgICAgICAgICAgc3Rkb3V0LXBh
dGggPSAic2VyaWFsMToxMTUyMDBuOCI7DQo+PiAgICAgICAgfTsNCj4+DQo+PiAgICAgICAgY3B1
cyB7DQo+PiAgICAgICAgICAgICAgICB0aW1lYmFzZS1mcmVxdWVuY3kgPSA8UlRDQ0xLX0ZSRVE+
Ow0KPj4gICAgICAgIH07DQo+Pg0KPj4gLSAgICAgbWVtb3J5QDgwMDAwMDAwIHsNCj4+ICsgICAg
IGRkcmNfY2FjaGVfbG86IG1lbW9yeUA4MDAwMDAwMCB7DQo+PiAgICAgICAgICAgICAgICBkZXZp
Y2VfdHlwZSA9ICJtZW1vcnkiOw0KPj4gLSAgICAgICAgICAgICByZWcgPSA8MHgwIDB4ODAwMDAw
MDAgMHgwIDB4NDAwMDAwMDA+Ow0KPj4gKyAgICAgICAgICAgICByZWcgPSA8MHgwIDB4ODAwMDAw
MDAgMHgwIDB4MmUwMDAwMDA+Ow0KPj4gICAgICAgICAgICAgICAgY2xvY2tzID0gPCZjbGtjZmcg
Q0xLX0REUkM+Ow0KPj4gKyAgICAgICAgICAgICBzdGF0dXMgPSAib2theSI7DQo+PiArICAgICB9
Ow0KPj4gKw0KPj4gKyAgICAgZGRyY19jYWNoZV9oaTogbWVtb3J5QDEwMDAwMDAwMDAgew0KPiAN
Cj4gVGhpcyBsb29rcyB1bnJlbGF0ZWQgdG8gcmVmYWN0b3JpbmcgLSBzcGxpdCBvZiBtZW1vcnkg
LSBhbmQgbmVlZHMNCj4gc2VwYXJhdGUgY2hhbmdlLg0KPiANCj4+ICsgICAgICAgICAgICAgZGV2
aWNlX3R5cGUgPSAibWVtb3J5IjsNCj4+ICsgICAgICAgICAgICAgcmVnID0gPDB4MTAgMHgwIDB4
MCAweDQwMDAwMDAwPjsNCj4+ICsgICAgICAgICAgICAgY2xvY2tzID0gPCZjbGtjZmcgQ0xLX0RE
UkM+Ow0KPj4gKyAgICAgICAgICAgICBzdGF0dXMgPSAib2theSI7DQo+PiAgICAgICAgfTsNCj4+
ICAgfTsNCj4+DQo+PiBAQCAtMzksMTkgKzQ4LDE5IEBAICZyZWZjbGsgew0KPj4gICAgICAgIGNs
b2NrLWZyZXF1ZW5jeSA9IDw2MDAwMDAwMDA+Ow0KPj4gICB9Ow0KPj4NCj4+IC0mc2VyaWFsMCB7
DQo+PiArJm1tdWFydDEgew0KPj4gICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4+ICAgfTsNCj4+
DQo+PiAtJnNlcmlhbDEgew0KPj4gKyZtbXVhcnQyIHsNCj4+ICAgICAgICBzdGF0dXMgPSAib2th
eSI7DQo+PiAgIH07DQo+Pg0KPj4gLSZzZXJpYWwyIHsNCj4+ICsmbW11YXJ0MyB7DQo+PiAgICAg
ICAgc3RhdHVzID0gIm9rYXkiOw0KPj4gICB9Ow0KPj4NCj4+IC0mc2VyaWFsMyB7DQo+PiArJm1t
dWFydDQgew0KPj4gICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4+ICAgfTsNCj4+DQo+PiBAQCAt
NjEsMjkgKzcwLDMyIEBAICZtbWMgew0KPj4gICAgICAgIGJ1cy13aWR0aCA9IDw0PjsNCj4+ICAg
ICAgICBkaXNhYmxlLXdwOw0KPj4gICAgICAgIGNhcC1zZC1oaWdoc3BlZWQ7DQo+PiArICAgICBj
YXAtbW1jLWhpZ2hzcGVlZDsNCj4+ICAgICAgICBjYXJkLWRldGVjdC1kZWxheSA9IDwyMDA+Ow0K
Pj4gKyAgICAgbW1jLWRkci0xXzh2Ow0KPj4gKyAgICAgbW1jLWhzMjAwLTFfOHY7DQo+IA0KPiBU
aGlzIGxvb2tzIHVucmVsYXRlZCB0byByZWZhY3RvcmluZyAtIG5ldyBtb2RlcyBmb3IgTU1DIC0g
YW5kIG5lZWRzDQo+IHNlcGFyYXRlIGNoYW5nZS4NCj4gDQo+PiAgICAgICAgc2QtdWhzLXNkcjEy
Ow0KPj4gICAgICAgIHNkLXVocy1zZHIyNTsNCj4+ICAgICAgICBzZC11aHMtc2RyNTA7DQo+PiAg
ICAgICAgc2QtdWhzLXNkcjEwNDsNCj4+ICAgfTsNCj4+DQo+PiAtJmVtYWMwIHsNCj4+ICsmbWFj
MCB7DQo+PiAgICAgICAgcGh5LW1vZGUgPSAic2dtaWkiOw0KPj4gICAgICAgIHBoeS1oYW5kbGUg
PSA8JnBoeTA+Ow0KPj4gLSAgICAgcGh5MDogZXRoZXJuZXQtcGh5QDggew0KPj4gLSAgICAgICAg
ICAgICByZWcgPSA8OD47DQo+PiAtICAgICAgICAgICAgIHRpLGZpZm8tZGVwdGggPSA8MHgwMT47
DQo+PiAtICAgICB9Ow0KPj4gICB9Ow0KPj4NCj4+IC0mZW1hYzEgew0KPj4gKyZtYWMxIHsNCj4+
ICAgICAgICBzdGF0dXMgPSAib2theSI7DQo+PiAgICAgICAgcGh5LW1vZGUgPSAic2dtaWkiOw0K
Pj4gICAgICAgIHBoeS1oYW5kbGUgPSA8JnBoeTE+Ow0KPj4gICAgICAgIHBoeTE6IGV0aGVybmV0
LXBoeUA5IHsNCj4+ICAgICAgICAgICAgICAgIHJlZyA9IDw5PjsNCj4+IC0gICAgICAgICAgICAg
dGksZmlmby1kZXB0aCA9IDwweDAxPjsNCj4+ICsgICAgICAgICAgICAgdGksZmlmby1kZXB0aCA9
IDwweDE+Ow0KPj4gKyAgICAgfTsNCj4+ICsgICAgIHBoeTA6IGV0aGVybmV0LXBoeUA4IHsNCj4+
ICsgICAgICAgICAgICAgcmVnID0gPDg+Ow0KPj4gKyAgICAgICAgICAgICB0aSxmaWZvLWRlcHRo
ID0gPDB4MT47DQo+PiAgICAgICAgfTsNCj4+ICAgfTsNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9ib290L2R0cy9taWNyb2NoaXAvbWljcm9jaGlwLW1wZnMuZHRzaSBiL2FyY2gvcmlz
Y3YvYm9vdC9kdHMvbWljcm9jaGlwL21pY3JvY2hpcC1tcGZzLmR0c2kNCj4+IGluZGV4IDgwODUw
MGJlMjZjMy4uZDMxMWM1ZWEyN2M5IDEwMDY0NA0KPj4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0
cy9taWNyb2NoaXAvbWljcm9jaGlwLW1wZnMuZHRzaQ0KPj4gKysrIGIvYXJjaC9yaXNjdi9ib290
L2R0cy9taWNyb2NoaXAvbWljcm9jaGlwLW1wZnMuZHRzaQ0KPj4gQEAgLTEsNSArMSw1IEBADQo+
PiAgIC8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBNSVQpDQo+PiAtLyog
Q29weXJpZ2h0IChjKSAyMDIwIE1pY3JvY2hpcCBUZWNobm9sb2d5IEluYyAqLw0KPj4gKy8qIENv
cHlyaWdodCAoYykgMjAyMC0yMDIxIE1pY3JvY2hpcCBUZWNobm9sb2d5IEluYyAqLw0KPj4NCj4+
ICAgL2R0cy12MS87DQo+PiAgICNpbmNsdWRlICJkdC1iaW5kaW5ncy9jbG9jay9taWNyb2NoaXAs
bXBmcy1jbG9jay5oIg0KPj4gQEAgLTE2LDcgKzE2LDcgQEAgY3B1cyB7DQo+PiAgICAgICAgICAg
ICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4+ICAgICAgICAgICAgICAgICNzaXplLWNlbGxz
ID0gPDA+Ow0KPj4NCj4+IC0gICAgICAgICAgICAgY3B1QDAgew0KPj4gKyAgICAgICAgICAgICBj
cHUwOiBjcHVAMCB7DQo+PiAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic2lm
aXZlLGU1MSIsICJzaWZpdmUscm9ja2V0MCIsICJyaXNjdiI7DQo+PiAgICAgICAgICAgICAgICAg
ICAgICAgIGRldmljZV90eXBlID0gImNwdSI7DQo+PiAgICAgICAgICAgICAgICAgICAgICAgIGkt
Y2FjaGUtYmxvY2stc2l6ZSA9IDw2ND47DQo+PiBAQCAtMzQsNyArMzQsNyBAQCBjcHUwX2ludGM6
IGludGVycnVwdC1jb250cm9sbGVyIHsNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgfTsNCj4+
ICAgICAgICAgICAgICAgIH07DQo+Pg0KPj4gLSAgICAgICAgICAgICBjcHVAMSB7DQo+PiArICAg
ICAgICAgICAgIGNwdTE6IGNwdUAxIHsNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJzaWZpdmUsdTU0LW1jIiwgInNpZml2ZSxyb2NrZXQwIiwgInJpc2N2IjsNCj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgZC1jYWNoZS1ibG9jay1zaXplID0gPDY0PjsNCj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgZC1jYWNoZS1zZXRzID0gPDY0PjsNCj4+IEBAIC02MSw3ICs2MSw3
IEBAIGNwdTFfaW50YzogaW50ZXJydXB0LWNvbnRyb2xsZXIgew0KPj4gICAgICAgICAgICAgICAg
ICAgICAgICB9Ow0KPj4gICAgICAgICAgICAgICAgfTsNCj4+DQo+PiAtICAgICAgICAgICAgIGNw
dUAyIHsNCj4+ICsgICAgICAgICAgICAgY3B1MjogY3B1QDIgew0KPj4gICAgICAgICAgICAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gInNpZml2ZSx1NTQtbWMiLCAic2lmaXZlLHJvY2tldDAiLCAi
cmlzY3YiOw0KPj4gICAgICAgICAgICAgICAgICAgICAgICBkLWNhY2hlLWJsb2NrLXNpemUgPSA8
NjQ+Ow0KPj4gICAgICAgICAgICAgICAgICAgICAgICBkLWNhY2hlLXNldHMgPSA8NjQ+Ow0KPj4g
QEAgLTg4LDcgKzg4LDcgQEAgY3B1Ml9pbnRjOiBpbnRlcnJ1cHQtY29udHJvbGxlciB7DQo+PiAg
ICAgICAgICAgICAgICAgICAgICAgIH07DQo+PiAgICAgICAgICAgICAgICB9Ow0KPj4NCj4+IC0g
ICAgICAgICAgICAgY3B1QDMgew0KPj4gKyAgICAgICAgICAgICBjcHUzOiBjcHVAMyB7DQo+PiAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic2lmaXZlLHU1NC1tYyIsICJzaWZp
dmUscm9ja2V0MCIsICJyaXNjdiI7DQo+PiAgICAgICAgICAgICAgICAgICAgICAgIGQtY2FjaGUt
YmxvY2stc2l6ZSA9IDw2ND47DQo+PiAgICAgICAgICAgICAgICAgICAgICAgIGQtY2FjaGUtc2V0
cyA9IDw2ND47DQo+PiBAQCAtMTE1LDcgKzExNSw3IEBAIGNwdTNfaW50YzogaW50ZXJydXB0LWNv
bnRyb2xsZXIgew0KPj4gICAgICAgICAgICAgICAgICAgICAgICB9Ow0KPj4gICAgICAgICAgICAg
ICAgfTsNCj4+DQo+PiAtICAgICAgICAgICAgIGNwdUA0IHsNCj4+ICsgICAgICAgICAgICAgY3B1
NDogY3B1QDQgew0KPj4gICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInNpZml2
ZSx1NTQtbWMiLCAic2lmaXZlLHJvY2tldDAiLCAicmlzY3YiOw0KPj4gICAgICAgICAgICAgICAg
ICAgICAgICBkLWNhY2hlLWJsb2NrLXNpemUgPSA8NjQ+Ow0KPj4gICAgICAgICAgICAgICAgICAg
ICAgICBkLWNhY2hlLXNldHMgPSA8NjQ+Ow0KPj4gQEAgLTE1Myw4ICsxNTMsOSBAQCBzb2Mgew0K
Pj4gICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzaW1wbGUtYnVzIjsNCj4+ICAgICAgICAg
ICAgICAgIHJhbmdlczsNCj4+DQo+PiAtICAgICAgICAgICAgIGNhY2hlLWNvbnRyb2xsZXJAMjAx
MDAwMCB7DQo+PiArICAgICAgICAgICAgIGNjdHJsbHI6IGNhY2hlLWNvbnRyb2xsZXJAMjAxMDAw
MCB7DQo+PiAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic2lmaXZlLGZ1NTQw
LWMwMDAtY2NhY2hlIiwgImNhY2hlIjsNCj4+ICsgICAgICAgICAgICAgICAgICAgICByZWcgPSA8
MHgwIDB4MjAxMDAwMCAweDAgMHgxMDAwPjsNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgY2Fj
aGUtYmxvY2stc2l6ZSA9IDw2ND47DQo+PiAgICAgICAgICAgICAgICAgICAgICAgIGNhY2hlLWxl
dmVsID0gPDI+Ow0KPj4gICAgICAgICAgICAgICAgICAgICAgICBjYWNoZS1zZXRzID0gPDEwMjQ+
Ow0KPj4gQEAgLTE2MiwxMCArMTYzLDkgQEAgY2FjaGUtY29udHJvbGxlckAyMDEwMDAwIHsNCj4+
ICAgICAgICAgICAgICAgICAgICAgICAgY2FjaGUtdW5pZmllZDsNCj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgaW50ZXJydXB0LXBhcmVudCA9IDwmcGxpYz47DQo+PiAgICAgICAgICAgICAgICAg
ICAgICAgIGludGVycnVwdHMgPSA8MT4sIDwyPiwgPDM+Ow0KPj4gLSAgICAgICAgICAgICAgICAg
ICAgIHJlZyA9IDwweDAgMHgyMDEwMDAwIDB4MCAweDEwMDA+Ow0KPj4gICAgICAgICAgICAgICAg
fTsNCj4+DQo+PiAtICAgICAgICAgICAgIGNsaW50QDIwMDAwMDAgew0KPj4gKyAgICAgICAgICAg
ICBjbGludDogY2xpbnRAMjAwMDAwMCB7DQo+PiAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAic2lmaXZlLGZ1NTQwLWMwMDAtY2xpbnQiLCAic2lmaXZlLGNsaW50MCI7DQo+PiAg
ICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHgyMDAwMDAwIDB4MCAweEMwMDA+Ow0K
Pj4gICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzLWV4dGVuZGVkID0gPCZjcHUwX2lu
dGMgSEFSVF9JTlRfTV9TT0ZUPiwNCj4+IEBAIC0xOTgsMTUgKzE5OCw2IEBAIHBsaWM6IGludGVy
cnVwdC1jb250cm9sbGVyQGMwMDAwMDAgew0KPj4gICAgICAgICAgICAgICAgICAgICAgICByaXNj
dixuZGV2ID0gPDE4Nj47DQo+PiAgICAgICAgICAgICAgICB9Ow0KPj4NCj4+IC0gICAgICAgICAg
ICAgZG1hQDMwMDAwMDAgew0KPj4gLSAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAi
c2lmaXZlLGZ1NTQwLWMwMDAtcGRtYSI7DQo+IA0KPiBSZW1vdmFsIG9mIG5vZGVzIGRvZXMgbm90
IGxvb2sgbGlrZSByZWZhY3RvcmluZy4NCj4gDQo+PiAtICAgICAgICAgICAgICAgICAgICAgcmVn
ID0gPDB4MCAweDMwMDAwMDAgMHgwIDB4ODAwMD47DQo+PiAtICAgICAgICAgICAgICAgICAgICAg
aW50ZXJydXB0LXBhcmVudCA9IDwmcGxpYz47DQo+PiAtICAgICAgICAgICAgICAgICAgICAgaW50
ZXJydXB0cyA9IDwyMz4sIDwyND4sIDwyNT4sIDwyNj4sIDwyNz4sIDwyOD4sIDwyOT4sDQo+PiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwzMD47DQo+PiAtICAgICAgICAgICAg
ICAgICAgICAgI2RtYS1jZWxscyA9IDwxPjsNCj4+IC0gICAgICAgICAgICAgfTsNCj4+IC0NCj4g
DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPiANCg0K
