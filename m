Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B97303AAF63
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jun 2021 11:14:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231500AbhFQJQt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Jun 2021 05:16:49 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:55988 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231390AbhFQJQs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Jun 2021 05:16:48 -0400
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E8C73C0444;
        Thu, 17 Jun 2021 09:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1623921281; bh=QE5G5kO5HfC1P21sN1sY6g1X1hXu3KxR466pyx87HOg=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Uh4wcLZ7VG0be6YisfMhxsqm7dx4JgZY2/BAGFDYjovL7LPj4DlavT1K6oZWu8NMw
         ELQBfmN3hy69nB9NaEIoY385UIyTZA37GvCog3lBLEFNxxE3v6ghJs5DtHmJm/ervM
         YagSVH/Kv+iG7Yx3Ru31av0W39ugC07uGsc+sZ+9SZTHwnOrGOyxQq7b0sieg0vup8
         220+0VzPxCXhR4EAUg8zbZeegbWTfkghq0Wm4yow1coEb0ZqEgJ/hdeuGkriSIuQDB
         XzlH0p5zpOYHbFQRxqafbDyy1rmK+bUzKCS0qNhPZr9II4tMjBjyC02/anLUV1fXA2
         PFlGTZNa3RWWQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 2C4E1A0067;
        Thu, 17 Jun 2021 09:14:40 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 23FA9400A1;
        Thu, 17 Jun 2021 09:14:38 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="jyY4/RrC";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mM53enIXso9Q836vkLubhQztH9H9Rw1CpWkUGWj4Aj0fETFW380bc2R6gN9cQsmNnUWQauywXDADb/XUol4J/ka756nBqDhKBpZzOGcyilQ9sEx8FEtmYxszeEaMwj53rn2Yh1e5k1mSCaXeZpkOKIGmExy2Qmd9LaF5pl8MjBRUoprJI81FEVlA/DYiNGVwE/LZBZCHb8IMwc8eYj/GzsjJsywTdNc5fNcYs4eHOyzhnh8N/ai84GHFNVs52zfAVq4lY9bTAvxwHOEbstme6B1413XOcyVdraPRxTChZOSDRCqb9e4cYk4ZoxLfbBp6SS4VQeZ/F23nMKNjFPi0fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QE5G5kO5HfC1P21sN1sY6g1X1hXu3KxR466pyx87HOg=;
 b=cg/fL79KE1vLh+6YavNnV1GD8J6mcq1lSi87GIpVUirwiPFW64FRVysY0903pcrdfWJ/lTlEYEcjaCi3+XcDmSx/9ECPn7ssSl1VHql2a6LLJuBiS/0aSVKcULrsP2xFsQEbuyGEp118hHieP12BF1C1pXBBqfhGKESzrJAMPf8j/+uQGSZHG09VIjMf7ohe0tO/lbD1wo4KvDXh24FTcLcyI1OtZPBWDcmp/7cidDG39geEDxoh2Jtr6tlvsHJh7W6x2+4zcGZiSy4cEigKcgXvmn6U6lob2od9wrv3K2sH0U805BelojykDcBn3Q6/KPZYOxW1Fc6G9PYEvwNM5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QE5G5kO5HfC1P21sN1sY6g1X1hXu3KxR466pyx87HOg=;
 b=jyY4/RrCeJmXMBpnRs0T6yOYGMxfI+NWxtIT9B8cG6UIzVVViSqwVMiH0u6c2GOtFfGURxWlIHOUM5+bKhhWWR7ZAQJ9vVPS2QRLWU8kFlULYy3I2qQ2Rl+DtX/PiMq5/Ul2c2sSvShwVuy4aJuNNQA3O77+0hf8QjHQT3TX/0Y=
Received: from DM4PR12MB5390.namprd12.prod.outlook.com (2603:10b6:5:39a::12)
 by DM4PR12MB5293.namprd12.prod.outlook.com (2603:10b6:5:39d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Thu, 17 Jun
 2021 09:14:37 +0000
Received: from DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::b119:cac8:fb05:e0e4]) by DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::b119:cac8:fb05:e0e4%8]) with mapi id 15.20.4219.025; Thu, 17 Jun 2021
 09:14:37 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Jack Pham <jackp@codeaurora.org>,
        Peter Chen <peter.chen@kernel.org>
Subject: Re: [PATCH] usb: dwc3: Fix debugfs creation flow
Thread-Topic: [PATCH] usb: dwc3: Fix debugfs creation flow
Thread-Index: AQHXYz17L6V8B4/QQE2zZ/GAn5jucqsXuI6AgAAQ9wCAAAY5gIAAHCkA
Date:   Thu, 17 Jun 2021 09:14:37 +0000
Message-ID: <0ba79afb-2b34-6e01-9ec3-622a3591ba5b@synopsys.com>
References: <7f5167c67cd95102b2acab967d19af7962415a66.1623906350.git.Minas.Harutyunyan@synopsys.com>
 <YMrnaS0EcVQpNpXH@kroah.com>
 <e68070dd-84b0-efdc-78dd-9035b7e911c8@synopsys.com>
 <YMr63WwtOJkc5YhH@kroah.com>
In-Reply-To: <YMr63WwtOJkc5YhH@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [37.252.93.215]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a289c64f-5dc8-405c-f579-08d93170549b
x-ms-traffictypediagnostic: DM4PR12MB5293:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR12MB5293EDB5781E733C1D8C113DA70E9@DM4PR12MB5293.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:586;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IbOtBPg1g+js6L6NWOYQkarWf1qeNmnffRr4OXRXdNllixwz4yL+bRvr64LwCTd90coTDmv/bICA0dzzDBYtd61rzpNMFC5GXVcJWYhXPfCxhMJG/coFvoQFLMbxQ95oea/eyiyTdmjOTiztDWmbMYucx49h+j2TrAGGTVLfLNz5vXISqNxTSuqKT3qNw1XD1bIC4uHkTDcqMnLD7XyrjjLxmVTB+SixlJS+mnPp9/MtmF2epfLukSWQ/wOyXwKMz9zxvxjKJ8mXI9mw++bkzu0od8p2PQfakDEUNMD4xDo5dQO21C2bPwDuvbyf8bNXFgTfhywv6ty0e/hBYmJSZHdgiznpLQ1pnGm8zOV2ha4MWm7R63wNMSxZiBoc2nBZeFia+XSRxesFHjhTlw3h3Pjb0kzqOr7cQS4AQ4Pzj63jwfQtINwgert7pV5LmfkOCYzOnZHO/CJe229OtgDq8YSpTlVQPYUpstUFOGJSruZBMMSsxs3j2FR078NmnQEp+Dd5z49R5LznNsxKhQTL5ZIRZ2SwATBivZooJGfMkn126f9aeMUF7Fedck0Nx/a6iAuzTBkWhQpkhjHLFP4SsB8XJxnqtXDZRglK6diVKdFpm6JRgasNNmdPsjHslcMyVY/h/Rr4oJQEkQnstEqttDQTGkaA30hv0x0w6SV+wy5amdzGKE9ePD8NrLoN0Y0FDqG039H838azOEY05O/VCcSh446yhFiVLNoJYNcDRHVhFi0pUIQe9r51hCpiymOmH3MIc4dyPlyDDbdeBkv/0XWPRBblTHFDqMApP4scbe3WuuOKCv9rBADDfnFdeRmv
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(366004)(136003)(346002)(376002)(2616005)(66476007)(54906003)(31686004)(76116006)(6512007)(26005)(966005)(478600001)(110136005)(66556008)(6506007)(186003)(66446008)(66946007)(53546011)(91956017)(64756008)(71200400001)(122000001)(4326008)(5660300002)(83380400001)(6486002)(316002)(8936002)(38100700002)(2906002)(8676002)(36756003)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: QbqM5AQyktqAcVnwUxSR92VIIGsgcwVyIF2hrN4uB7nnobLnRrcgiMeTHltNrMkOd0U7+8eV94OYZOcaM0ijIt7BBayu/7rsEaZCqyxOTntVIuDYdGWJaM8zCigGkaVkdFu/SWpF0625J7OZAo7wjLXHwS94JmK+mQsE8aYZ0ytqJmGsY0FYDeoN4DUK5nDQ1CQnAui/5lJawy3wzdo8DNWuaog65d4z63Kb6IU/buo8tw19l9xL9w2dTq6h1QgMEpkfNbS6CqfWrlf3T/NWDSIhmMx4BtopmW1z6DlYD4hWqRrzTtIKVt9fTL3sqMmMGpoEYgzy+EspprSC6HDeXWZXiC2sQVR2bN+NTwAf2cMLEoEZWJSaEucfz+3uumYawg8rR2YogA1l/kSwDuWnku6vH/5TGN0rpq8WEnijx0KQWjBh0/ARy5JFksUkZWJrSP7IGuzyCHi0+s4mQFZI9PveIv/H0PfU1oYa4irC/btuAhCVQritdJqgxYTmGIF2BDl88erlzOEx7iBPQZbfWMSjeWqGMKVaIMTw+vJwtOh4E/VLT0GNdB+1f2Ngamg8EK7QzjrkKP8sLSADMsCKdsuyUkBf9NIfOhRTJdMrgmtkbzU7aPlzRdRa6LJh0Dt9j2K840HJQzN4l41WhtqeaOWxXSOu2qSHqGuQV/vcRo8nffbX8pkjpuaClHAkkbgvWmxh/Dmz03afEzERIicv//Q/PL85/v2TfE9sJFEulm8=
Content-Type: text/plain; charset="utf-8"
Content-ID: <25AE796CA5645748B6AAB8AB15344FF3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a289c64f-5dc8-405c-f579-08d93170549b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2021 09:14:37.3668
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dccAj7JGKj1vOPyyVxoE47MzuaEP7/9+aqpdn6Mz0olv1pLZxKQFjvLjHoJ6clsF/ZyzH9hp+Y1sVzN5mfSIWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5293
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgR3JlZywNCg0KT24gNi8xNy8yMDIxIDExOjMzIEFNLCBHcmVnIEtyb2FoLUhhcnRtYW4gd3Jv
dGU6DQo+IE9uIFRodSwgSnVuIDE3LCAyMDIxIGF0IDA3OjExOjMzQU0gKzAwMDAsIE1pbmFzIEhh
cnV0eXVueWFuIHdyb3RlOg0KPj4gSGkgR3JlZywNCj4+DQo+PiBPbiA2LzE3LzIwMjEgMTA6MTAg
QU0sIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToNCj4+PiBPbiBXZWQsIEp1biAxNiwgMjAyMSBh
dCAxMDo1NjowMlBNIC0wNzAwLCBNaW5hcyBIYXJ1dHl1bnlhbiB3cm90ZToNCj4+Pj4gQ3JlYXRp
b24gRVAncyBkZWJ1Z2ZzIGNhbGxlZCBlYXJsaWVyIHRoYW4gZGVidWdmcyBmb2xkZXIgZm9yIGR3
YzMNCj4+Pj4gZGV2aWNlIGNyZWF0ZWQuIEFzIHJlc3VsdCBFUCdzIGRlYnVnZnMgYXJlIGNyZWF0
ZWQgaW4gJy9zeXMva2VybmVsL2RlYnVnJw0KPj4+PiBpbnN0ZWFkIG9mICcvc3lzL2tlcm5lbC9k
ZWJ1Zy91c2IvZHdjMy4xLmF1dG8nLg0KPj4+Pg0KPj4+PiBNb3ZlZCBkd2MzX2RlYnVnZnNfaW5p
dCgpIGZ1bmN0aW9uIGNhbGwgYmVmb3JlIGNhbGxpbmcNCj4+Pj4gZHdjM19jb3JlX2luaXRfbW9k
ZSgpIHRvIGFsbG93IGNyZWF0ZSBkd2MzIGRlYnVnZnMgcGFyZW50IGJlZm9yZQ0KPj4+PiBjcmVh
dGluZyBFUCdzIGRlYnVnZnMncy4NCj4+Pj4NCj4+Pj4gRml4ZXM6IDg1NjJkNWJmYzBmYyAoIlVT
QjogZHdjMzogcmVtb3ZlIGRlYnVnZnMgcm9vdCBkZW50cnkgc3RvcmFnZSIpDQo+Pj4+IFNpZ25l
ZC1vZmYtYnk6IE1pbmFzIEhhcnV0eXVueWFuIDxobWluYXNAc3lub3BzeXMuY29tPg0KPj4+PiAt
LS0NCj4+Pj4gICAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgfCAzICsrLQ0KPj4+PiAgICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4+DQo+Pj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyBiL2RyaXZlcnMvdXNiL2R3YzMvY29y
ZS5jDQo+Pj4+IGluZGV4IGUwYThlNzk2YzE1OC4uYmE3NGFkN2Y2OTk1IDEwMDY0NA0KPj4+PiAt
LS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPj4+PiArKysgYi9kcml2ZXJzL3VzYi9kd2Mz
L2NvcmUuYw0KPj4+PiBAQCAtMTYyMCwxNyArMTYyMCwxOCBAQCBzdGF0aWMgaW50IGR3YzNfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4+Pj4gICAgCX0NCj4+Pj4gICAgDQo+
Pj4+ICAgIAlkd2MzX2NoZWNrX3BhcmFtcyhkd2MpOw0KPj4+PiArCWR3YzNfZGVidWdmc19pbml0
KGR3Yyk7DQo+Pj4+ICAgIA0KPj4+PiAgICAJcmV0ID0gZHdjM19jb3JlX2luaXRfbW9kZShkd2Mp
Ow0KPj4+PiAgICAJaWYgKHJldCkNCj4+Pj4gICAgCQlnb3RvIGVycjU7DQo+Pj4+ICAgIA0KPj4+
PiAtCWR3YzNfZGVidWdmc19pbml0KGR3Yyk7DQo+Pj4+ICAgIAlwbV9ydW50aW1lX3B1dChkZXYp
Ow0KPj4+PiAgICANCj4+Pj4gICAgCXJldHVybiAwOw0KPj4+PiAgICANCj4+Pj4gICAgZXJyNToN
Cj4+Pj4gKwlkd2MzX2RlYnVnZnNfZXhpdChkd2MpOw0KPj4+PiAgICAJZHdjM19ldmVudF9idWZm
ZXJzX2NsZWFudXAoZHdjKTsNCj4+Pj4gICAgDQo+Pj4+ICAgIAl1c2JfcGh5X3NodXRkb3duKGR3
Yy0+dXNiMl9waHkpOw0KPj4+Pg0KPj4+PiBiYXNlLWNvbW1pdDogMWRhODExNmViMGM1ZGZjMDVj
ZmI4OTg5NjIzOWJhZGIxOGM0ZGFmMw0KPj4+DQo+Pj4gSSB0aG91Z2h0IHdlIGZpeGVkIHRoaXMg
YWxyZWFkeSBpbiB1c2ItbmV4dCBhbmQgdXNiLWxpbnVzLCByaWdodD8gIFdoZXJlDQo+Pj4gYXJl
IHlvdSBzZWVpbmcgdGhpcyBwcm9ibGVtIGhhcHBlbmluZz8NCj4+DQo+PiBJIGZhY2VkIHRoaXMg
aXNzdWUgb24gNS4xMy4wLXJjNi4gUGF0Y2ggIlVTQjogZHdjMzogcmVtb3ZlIGRlYnVnZnMgcm9v
dA0KPj4gZGVudHJ5IHN0b3JhZ2UiIGludHJvZHVjZWQgdGhpcyBpc3N1ZSwgYmVjYXVzZSBvZiBk
ZWJ1Z2ZzX2xvb2t1cCgpDQo+PiBmdW5jdGlvbi4gSSBkb24ndCBzZWUgYW55IGZpeCBpbiB1c2It
bmV4dC4NCj4gDQo+IDRiZjU4NGEwM2VlYyAoInVzYjogZHdjMzogY29yZTogZml4IGtlcm5lbCBw
YW5pYyB3aGVuIGRvIHJlYm9vdCIpIGluDQo+IGxpbnV4LW5leHQgInNob3VsZCIgc29sdmUgdGhp
cyBpc3N1ZS4gIE9yIGl0IHdhcyBzdXBwb3NlZCB0by4gIEkNCj4gdGhvdWdodC4gIEknbSBnZXR0
aW5nIGNvbmZ1c2VkIGFib3V0IHRoaXMgcHJvYmxlbSB0aGVzZSBkYXlzLi4uDQoNCk5vLCA0YmY1
ODRhMDNlZWMgKCJ1c2I6IGR3YzM6IGNvcmU6IGZpeCBrZXJuZWwgcGFuaWMgd2hlbiBkbyByZWJv
b3QiKSANCmZpeCBhbm90aGVyIHRoaW5nLg0KPiANCj4gVGhlIGNvbW1pdCB5b3UgcmVmZXJlbmNl
IGFib3ZlIGluIHRoZSBmaXhlcyBsaW5lIGlzIE5PVCBpbiA1LjEzLXJjNiwgc28NCj4gaG93IGNh
biB0aGlzIGNvbW1pdCBmaXggYSBwcm9ibGVtIGluIDUuMTMtcmM2Pw0KDQpJIHNlZSB0aGF0IGNv
bW1pdCBpbiB5b3VyICJ1c2ItbmV4dCIgYmVsb3cgIk1lcmdlIHRhZyAndjUuMTMtcmM2JyI6DQoN
Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2dyZWdraC91
c2IuZ2l0L2xvZy8/cXQ9Z3JlcCZxPSZoPXVzYi1uZXh0DQoNClRoYW5rcywNCk1pbmFzDQoNCg0K
PiANCj4gc3RpbGwgY29uZnVzZWQsDQo+IA0KPiBncmVnIGstaA0KPiANCg0K
