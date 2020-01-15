Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1796313BC67
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 10:25:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729346AbgAOJZl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 04:25:41 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:51152 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729143AbgAOJZl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 04:25:41 -0500
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C68CD406F2;
        Wed, 15 Jan 2020 09:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1579080340; bh=xMgLLAYPEwynsQtd0N0XVw+fIet1DocYbS1u7jrvl9Q=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Nhs6X/z6/Nb2/cz2O/0H3evv5WOqQfDoIzfaZOoyXboRUyBrQhwyigqa6yTso3fq0
         P8UjXLz8tl2F+Q5AyXGn8LaLNq/kYnxYZAzZJhhbNWhRZT6EUPewdw42EieDa4qCBn
         Mf/JX2Lg1cbuuuMrA9KUHz8AGMRfRYnJdglTAi5Rp/NWloWS7cytxIGa07hHNTix9I
         hS+nbXW48X3n3KTkWF/ueANvUaVLnhK+qZ9fJoMbQYesnHY4PRYLHNhrEF2rd26uf3
         /rzOiB1+Om+vl1+WvO3/0QgEi1qrPPmXHyK1wkRDRC71DJ+c5jJ1M6ZMB6rP4GqNn0
         MS2qTyoSPWNEA==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id DE315A0069;
        Wed, 15 Jan 2020 09:25:38 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 15 Jan 2020 01:25:32 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 15 Jan 2020 01:25:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AyD+eaOMsV0WmBj3JSuQjXlmlfFVhHTBlBt+/MxuRUsTWbgSiOa1vATkryj826uPJHZnCzfOUHNRRj5bfKU9cXI/h9MYIf7iXSGTeQB0ZAy8JUaFG44GypKxJDALQkyppeuQlBg14KUzAz9KAjL7GZZWpByW9T9j35Ss37CxS6aqslumWQJU55QqAXZyZc/4/Aqu2tkDHXSx5k2xLXi/XJ3dNeJUa10bJbZeqIZAebZ4A9EXauO+qn2e2oCcOlQc6abg9YGRCRipphTAxrYTtwPmaoq5uO3135hhVeinDBFiit2iPA6aBAR63xT0sJC+lfpAJaJi2OSH9ocVoZFoYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMgLLAYPEwynsQtd0N0XVw+fIet1DocYbS1u7jrvl9Q=;
 b=Uxh92blymVhxEwOA6mgRZO8TlIlle30CnQwgRuPaZ8w1GtB2TrBUBNIsdkEJsIF6rp4bN2ZGSYsBdTkPon62tMXbUF88xaHyBSeEVdvG7Lwnvs4EmJOgliQvz+vryBu5uU+rnUbY2kzBBeEXPFkzmtUgGp1Uyt/yj6Ft3cxt1e4ZCmHG84BYfi3KbGJQgzHORPMQUlj7qqknFWNOdPHbzXt/d7NMamYHhrvpJRCtmAz9cF7CQB4qjqCWsHEO9V31k6ZqnNGpGhyf0VrDgWsbxSWZ2VKJJM8+dvkrM0FPmE9pMzRuehsZzDJm2oL66UZ3WKbW+0dzH1Lk5CfYjt8GzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMgLLAYPEwynsQtd0N0XVw+fIet1DocYbS1u7jrvl9Q=;
 b=H8GkJzrRH0KT14XzQd7jFjgpIl4Ca/fMPhpSNc298b8Pd/W+eGTBShCTT5Uz9dOxGpp0HrEKjBlwUwIKgWrmY5UY1rzLBJSABdOu9gdagX3lHwLZmuFPiJdkvWn/zdFJUPaxQ7SSNQ7EABO3vWf8wFy/QAOK+PGW1HeoYh53VTs=
Received: from MN2PR12MB4093.namprd12.prod.outlook.com (52.135.51.203) by
 MN2PR12MB2973.namprd12.prod.outlook.com (20.178.243.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.18; Wed, 15 Jan 2020 09:25:30 +0000
Received: from MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::35cf:644a:cfa6:72f8]) by MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::35cf:644a:cfa6:72f8%7]) with mapi id 15.20.2644.015; Wed, 15 Jan 2020
 09:25:30 +0000
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>, Lukas Wunner <lukas@wunner.de>,
        "Felipe Balbi" <felipe.balbi@linux.intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc2: Drop unlock/lock upon queueing a work item
Thread-Topic: [PATCH] usb: dwc2: Drop unlock/lock upon queueing a work item
Thread-Index: AQHVn4uRIRY3I3zRxEWS1SsbsjEXaqfik6+AgAkxZ4CAAAdGgA==
Date:   Wed, 15 Jan 2020 09:25:30 +0000
Message-ID: <788fc4ab-28f4-f4de-66b3-8c39ab841c3e@synopsys.com>
References: <77c07f00a6a9d94323c4a060a3c72817b0703b97.1574244795.git.lukas@wunner.de>
 <20200109123617.5ovxwkfnmf7ou4z4@wunner.de> <87h80x6qog.fsf@kernel.org>
In-Reply-To: <87h80x6qog.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hminas@synopsys.com; 
x-originating-ip: [46.162.196.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50df2118-b689-46ae-69af-08d7999cdd82
x-ms-traffictypediagnostic: MN2PR12MB2973:
x-microsoft-antispam-prvs: <MN2PR12MB2973F5787435ABB35C51D834A7370@MN2PR12MB2973.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02830F0362
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(396003)(39860400002)(376002)(346002)(366004)(189003)(199004)(2906002)(5660300002)(4744005)(81166006)(8676002)(26005)(81156014)(53546011)(6506007)(2616005)(71200400001)(8936002)(36756003)(186003)(31686004)(4326008)(110136005)(6512007)(64756008)(66556008)(66446008)(66476007)(6486002)(31696002)(66946007)(316002)(76116006)(478600001)(91956017)(86362001);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR12MB2973;H:MN2PR12MB4093.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fiu6Iwd6/ZLTq5hqJx9qRMncJZ86XliV739Fp2DJDlHda39Acv0YT1UuLOWWYnJ4pSDzBSEbVRgKf/ks+yAIXUfjmKN1ErSiA3vwo4qCq//BjrUpoOZTacA30JN8iuu6EWpClhlc1XkSGXPuHcrpLnj5PiwszJZP8o/lm8LeqW8lR/3BMa6YsbEe9UCoYen/jgsGnyi19djWKLLtZfY+R7RqkrSzR5LQ+H5AHbCMlGIHREE3EpB/SgsEpKppqcpQ3LtMuwOcKgSMdtFqWQ7XEJ8AHjLJd6zaGfSUDlIBt0aWi/96jUe3voB6v1lvQ21MGOw/DjKNy91nt0YljRErV7+rI+QJ9vgVp0f1262swH6rVAqhySoVTlXjbB/l96qzAxzpEWN6qe9CRB2VeipSmhw3z2zGJdCHJWZXOPFp6LezYGWv/LdP6TyErcNitIZZ
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB7E4B5300D16140BE164BB418589E2B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 50df2118-b689-46ae-69af-08d7999cdd82
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2020 09:25:30.5070
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JPeIvSOA0WBiZrQJ8aOodWChGYY5putckpdjGxB27O3WwD0nNMSG6uJRZaKZtx/6ALwGg6y+Rn1Kjyy5rqxscw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2973
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCk9uIDEvMTUvMjAyMCAxMjo1OSBQTSwgRmVsaXBlIEJhbGJpIHdyb3RlOg0KPiANCj4g
SGksDQo+IA0KPiBMdWthcyBXdW5uZXIgPGx1a2FzQHd1bm5lci5kZT4gd3JpdGVzOg0KPj4gSGkg
RmVsaXBlLA0KPj4NCj4+IGp1c3QgYSBnZW50bGUgcGluZzogIFRoZSBiZWxvdyBwYXRjaCB3YXMg
c3VibWl0dGVkIG1vcmUgdGhhbiA4IHdlZWtzIGFnbw0KPj4gYW5kIEknbSBuZWl0aGVyIHNlZWlu
ZyBpdCBvbiBvbmUgb2YgeW91ciBicmFuY2hlcyBub3IgaGF2ZSB0aGVyZSBiZWVuDQo+PiBhbnkg
Y29tbWVudHMgb24gdGhlIGxpc3QuICBBcmUgdGhlcmUgb2JqZWN0aW9ucyB0byB0aGlzIHBhdGNo
Pw0KPiANCj4gSSBkb24ndCBzZWUgYW4gQWNrZWQtYnkgTWluYXMsIHNvIEkgY2FuJ3QgdGFrZSB0
aGUgcGF0Y2gsIHNvcnJ5Lg0KPiANCg0KQnV0IEkgZGlkbid0IGZpbmQgb3JpZ2luYWwgcGF0Y2gg
ZW1haWwgaW4gbXkgaW5ib3guIEkganVzdCBnb3QgdGhpcyBwaW5nLg0KDQpUaGFua3MsDQpNaW5h
cw0K
