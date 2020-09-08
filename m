Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 574B5261997
	for <lists+linux-usb@lfdr.de>; Tue,  8 Sep 2020 20:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732133AbgIHSVn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Sep 2020 14:21:43 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:50144 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731789AbgIHSVX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Sep 2020 14:21:23 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E29C74005F;
        Tue,  8 Sep 2020 18:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1599589283; bh=FTXl5shenJstSA+DR8GATof0cQAOcHIARL2uL9HU1qk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=VNVOdMLDDoRugIkvSYv/LhLl1KWxikikSoxneo1qahMdNeRNSdvz3ltXTBlfzdWLe
         e8qkg6z9f9snBQgWvlhsWzh6F2ibvyaB7fA5A9uA0SXtB5z1fsSThECR3AgkH1avfZ
         CYUndILM4UEnu2SQ7+CzrwMlouAZl4tWsRxwLplsxEf6py58RALi+oczZcQhEDL7GU
         phETc6uuDq8C85Dlljb4aQyAV2E+wxTSscdb6ENo7S5hPh3vivDYCU4jrnb28z6Q3X
         ER+wbG7qo+brc86GhcEHNtsJePekUq9OYMQ1WoVinKQt7eXp9N7yKbR7CGEbPe6xJv
         LepTUxZl9SY8Q==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 7E0DAA007C;
        Tue,  8 Sep 2020 18:21:22 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id D5D9240147;
        Tue,  8 Sep 2020 18:21:21 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="XK61+2gm";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3zLLmVuaxB4VvrcWwIdZeme2EctmjuNXz9t2qAHzsM6E4tQ9wEzBZJp5cEeA15S6jvlVvo3xLnmVCeBlQu+O6WqxQgpzROolOTdZBL05WgNuKwqY8NnGctS4yP60XcWcElCkOApmeRDg3vB10BJlHvfwiCxFKulYTR7QREpJ1ZGNPv30l7ENpFX1MnBTiJhQs5lY5GkZtKhVS3RzhQE94ADEvdO7shfVsQKzbP3r5+EGz222aTVJaeEhg2WcmBl8XkydfjHgFKORhibOAO2tkNJq3ituQg6RZuSWEuDlYUmjdmRL0DT6jcoHR1xp1RUQyL/ZZVkJVX6MXyGgKVxpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTXl5shenJstSA+DR8GATof0cQAOcHIARL2uL9HU1qk=;
 b=mtVXl+3jDgR0dxFQGRpihgsEEY2SkW4HwWLowU1ufFuJOieKraqjvWehTh3XDKwJGrf0kmT+aW8T/+y0XTOIwF4kWRKpkdf459+N81di0oaeLEPYDbAbok+XWeSk/sLwK7Z1YoW6AcCnWAKwikQJgMZ+ZnsAShsPT8FChfxRAxVcfz+Zdf0c2zGp6wy840B63m8jGtEtRzunsx5D4mXcVE+FsGAM8CTJg9vmEpMtA9o+HXiuWfd7CM+zgsjeeRn/ycamk3LytculeIwQgwQMWb2mm4IwfAmyNR0pan21zdrR4o/nQOzU2FSuOPQIi9hm26xKgvrONfChADdIxpbWJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTXl5shenJstSA+DR8GATof0cQAOcHIARL2uL9HU1qk=;
 b=XK61+2gmSG5Os48qvJsZsC047irtdE3Fp0LZuZNEVHj4zlZpPaTcwN6lggEzqipyGPwDO7Ll7F9IjUIY96/evFWR/CLyTQzTdS7uLakdlv34FIbQq0Y035q41lk1SsfNXx2mwrGpeE0n0JaB1FWCUmPNjQj6b02cKYd8+So04r0=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BYAPR12MB3463.namprd12.prod.outlook.com (2603:10b6:a03:ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Tue, 8 Sep
 2020 18:21:20 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::c98f:a13f:fd88:c209]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::c98f:a13f:fd88:c209%7]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 18:21:20 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v3 2/4] usb: dwc3: gadget: Account for extra TRB
Thread-Topic: [PATCH v3 2/4] usb: dwc3: gadget: Account for extra TRB
Thread-Index: AQHWgZbRi70YXSRDW0G6TPFX8IE4G6lcvQEAgAJZg4A=
Date:   Tue, 8 Sep 2020 18:21:20 +0000
Message-ID: <74dae3e1-bc24-8225-78b2-508745426c85@synopsys.com>
References: <cover.1599098161.git.thinhn@synopsys.com>
 <3a914ab743485860aeffeb55d46b312491d7d811.1599098161.git.thinhn@synopsys.com>
 <87imcq14ol.fsf@kernel.org>
In-Reply-To: <87imcq14ol.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63c81f4b-984a-435d-33fc-08d85423fc0b
x-ms-traffictypediagnostic: BYAPR12MB3463:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3463A21ABAA549B673928B35AA290@BYAPR12MB3463.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mvr2EGge1Vl8zcbkCqLDBBGkrrfTcFjDEGcoKz3BY3k9xSdpa9ONemgyJrWgzuUZt2VHxXpqbXi2NcQgUOGcE/r0pFct9RsEs91AKJSCbBisIpkhL2DMafvML9J3TMJSYUoPHVC+k0WaVcsDaS6a/Pykfpgcw6KBDMiQV5Wet/GhfcL939JrqiMuJ/JbBfpxobdYLNuZwpf2+zeg6rRDByqKT+BkvllQuiV38b1dPN1JyNzyLWi0lpPzyrYbXfQ7pUiyy2Wlfph6hVG+FKOHLG/2PoUpSdlsW6gAwXCvKy2kqtuXbb5zArvTDw4EhXJAoJYUnfKiJ2faYYdYMKlqPgdG60OSKZWofVO1G783ZyZSZiTDov5WKdpTb6BdzAVw
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(39860400002)(396003)(366004)(346002)(71200400001)(36756003)(5660300002)(26005)(6506007)(8676002)(6512007)(2616005)(478600001)(31696002)(86362001)(186003)(316002)(4744005)(66556008)(66476007)(66946007)(66446008)(64756008)(76116006)(2906002)(15650500001)(31686004)(110136005)(4326008)(107886003)(83380400001)(6486002)(8936002)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: FSo3mqQJRDNhLTX/LLF4DA48pldJXNQt71mEf3cyYN94bEKR4TAZMxIow5K7EIpfaTX6RAeEAYeKNVPq5d1fKHnWGjFOSBkaMKAt6aNJYb5oQ2x3DuuVy/c0yiz409k7+dX9zzynzso12bOm2tobp6a5XMlpPDdNp2mPiYW/+H/gI7f0CYGGrAMI7Xn5DNsiz2sSALzIfP+y7xrGT4sH+A1kzLq3uJCdXkFCw6B36IJkPUsc5ktwYioRSDHU3QPbyWhykst1JRt6HaXNXbkBppg3G+MoMzDsd4PY6e1YgAnwa5GmVFl8lxtM2x9CUTjc0NPzkaVYnUeyO+XHVz04YDilGaZgLMxWe3RkkhPZ27IK2fcWiy5NW53R0vNiPZiN1Ew/S8HyN/pqbVW/kjBigI/KU932N84c+olUlFu+8beVC+BQK54Nl/ZSRLOkBlAVLD53jOYW8ZSmqojwRmi78QYCsUixhlBlU+VTMux/jGek6K25m3pvE8K4cNg++RIbhIxZnanyG5v9+xPYKxv+/OTUs1ArYsOM8hphH4wlTEc5MSnXxm+AO7sxjnHJLUPrCWILlQovzheESiEVMpG+TBGHHU7CkA2FlYovEC0hSghwtzfC/q3/QgIy0yxgA7QmtZ1LyYCQnrBaHP9lvUqvgw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <E31249E27479874E94AFCFBB1D758D15@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c81f4b-984a-435d-33fc-08d85423fc0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2020 18:21:20.1766
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OZMavHPrySv0autI4gpbYla4ssRQdt9mZYJN3HCbocgR3jGgh6qExtv/FJ8m8h4W1NaR7AuRgcW0aCprP1OHRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3463
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RmVsaXBlIEJhbGJpIHdyb3RlOg0KPiBIaSwNCj4NCj4gVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5
ZW5Ac3lub3BzeXMuY29tPiB3cml0ZXM6DQo+PiBXaGVuIGNoZWNraW5nIGZvciBob3cgbWFueSBU
UkIgcmVtYWluaW5nLCBtYWtlIHN1cmUgdG8gYWNjb3VudCBmb3IgZXh0cmENCj4+IFRSQnMgZm9y
IFpMUCBvciBNUFMgYWxpZ25tZW50IHRyYW5zZmVycy4gU2luY2UgdGhlIGR3YzNfcHJlcGFyZV90
cmIqDQo+PiBmdW5jdGlvbnMgc2hvdWxkIGtub3cgaWYgd2UgbmVlZCB0aGUgZXh0cmEgVFJCcywg
bWFrZSB0aG9zZSBmdW5jdGlvbnMNCj4+IHJldHVybiBhIHN0YXR1cyBjb2RlIC1FQUdBSU4gaWYg
dGhlcmUgaXNuJ3QgZW5vdWdoIFRSQi4gQ2hlY2sgYWdhaW5zdA0KPj4gdGhvc2Ugc3RhdHVzIHdo
ZW4gcHJlcGFyaW5nIFRSQiBpbnN0ZWFkLg0KPj4NCj4+IEZpeGVzOiBjNjI2N2E1MTYzOWIgKCJ1
c2I6IGR3YzM6IGdhZGdldDogYWxpZ24gdHJhbnNmZXJzIHRvIHdNYXhQYWNrZXRTaXplIikNCj4+
IFNpZ25lZC1vZmYtYnk6IFRoaW5oIE5ndXllbiA8dGhpbmhuQHN5bm9wc3lzLmNvbT4NCj4gdGhp
cyBpcyBxdWl0ZSBleHRlbnNpdmUgZm9yIGEgZml4IGFuZCBpdCBhbHNvIGRlcGVuZHMgb24gdGhl
IHByZXZpb3VzDQo+IHJlZmFjdG9yaW5nIGZyb20gd2hhdCBJIGNhbiB0ZWxsLiBJbiB0aGF0IGNh
c2UsIHlvdSBjYW4gYnJlYWsgdGhpcyBkb3duDQo+IGludG8gc21hbGxlciBwYXRjaGVzLg0KPg0K
DQpTdXJlLiBJJ2xsIGJyZWFrIGl0IGRvd24gbW9yZSBhbmQgcmV2aXNlIGl0IHNvIHRoZXJlJ3Mg
bm8gZGVwZW5kZW5jeSBvbg0KdGhlIHByZXZpb3VzIGNsZWFudXAgcGF0Y2guDQoNClRoYW5rcywN
ClRoaW5oDQo=
