Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D8AE22BC74
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jul 2020 05:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbgGXD3h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 23:29:37 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:57256 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726811AbgGXD3g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jul 2020 23:29:36 -0400
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 13E2BC0641;
        Fri, 24 Jul 2020 03:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595561375; bh=qgSwBm85Tiqdifh4hEQnioZOkmJu9tjZeYo6BAzVels=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=lILD1Q6eF0D3c9CPKNj4CDm4Ygvl3nPvI5YR1alG2Il04Y3uPxDA2VMdLRK76r7bD
         21s7VZOGb6amQkWBmlsFj1WE5esk9OKe5eiN3tnKWKAmukK6g4942NZlQUOILqtNOg
         xwyVVbXMfpHwQ7Vv0Y2APqTG/pu+Ii8G6dkF7S/3EbNwaNJp176hQws7xbKLmX9TFv
         0v2eb6hTRHjeC5Cj2Owzqsjm3yA9GdQlACxqWutn0UjCwdVe76mVhxHRhi1YEi/OBC
         3Vua3xFPWEgrLFEx5Xh28uQEvm7wfMOM8uuDiuxP4BAPKSA87Is3eMV763felfb84L
         uaJXYGR2Gz4eA==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 5B049A0081;
        Fri, 24 Jul 2020 03:29:33 +0000 (UTC)
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (mail-co1nam04lp2058.outbound.protection.outlook.com [104.47.45.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3BA9440050;
        Fri, 24 Jul 2020 03:29:33 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="C4RofLbe";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q0ML2/mXFjBErXP1hqOkDeyJsCVk8gQXcBDVCv9OhSfrY0Ftv2qTEgpk1NYUjdpv9YL+FwMs1ZJW/ISBQ4iDRq1yU+ur9qpnih8prFlvngaGGs+yn/xsCHT2ioULl/hzEGu9a7Fw89xjBwB8JetsiKz8xdAZ6sbiFBGd5qw9vTkBXLKXUVLROb5mmbvIzqQHBq6HdvwRdPODcwYI72TLiN0mhDIZJWkJ6LzupI5Tn8Q8WtIKuZzWT79P0HLXN8KJUZlcV0/PD+QblM2nxTXBA73wrieckkiO4maGBHNdx7teEvr2k5msNtpWeq9wffGRG334p7Uq1280yFRo616aiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgSwBm85Tiqdifh4hEQnioZOkmJu9tjZeYo6BAzVels=;
 b=N7Y1JP/Yt76DTNYZMCPog2/hfpxDviXa519nNKzIX4f6v6UqqX6TdmoKZPUxdaJgJHqaoZUshF8HR9mRfDDTa6rkgvuLpBG3OyyMFkrgEUAKpRvaqtZVZKNEHPBR0LJXyCJHwv1QFy9+3+cyRf3UqOxr079D87hjZF4UA6SB4gqdY+BDrm/bNgwV4OFfVCZb4bXpkorXoNXv2KNf4koxqSeVa9SZZIrE4BydQiOhF1bfU7vtgTnJ+vwA0Zjc1CJGXYusu4d2me9YlX90Hvn0QMuXGgOofNkpJGtq0lWt3Xte9gs2dzWgssNi+yoHnuBltDvP/Wejlkr8sA8UUuN6rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgSwBm85Tiqdifh4hEQnioZOkmJu9tjZeYo6BAzVels=;
 b=C4RofLbe2qOTuMOOAffqsKdF2/GXyhkLU7WnjX4HQnI2dZqfrBnpq+dcL3B9/Qu4UgFRrqm6wZ75EBHY/n19rwFsZ22WIimGl6j4PcpT2JTidbWuqZQIwKtlgAIut7/t1h+klmz4abz9DvdLlQMxr8HqqbZpsJCn0Gsdtqdz19U=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BY5PR12MB4049.namprd12.prod.outlook.com (2603:10b6:a03:201::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Fri, 24 Jul
 2020 03:29:31 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456%5]) with mapi id 15.20.3216.025; Fri, 24 Jul 2020
 03:29:31 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Jun Li <jun.li@nxp.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "balbi@kernel.org" <balbi@kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: debugfs: do not queue work if try to change
 mode on non-drd
Thread-Topic: [PATCH] usb: dwc3: debugfs: do not queue work if try to change
 mode on non-drd
Thread-Index: AQHWYAd0AWhznuHztkGR30E+GUSzFqkUD2eAgAC5coCAAUxhgA==
Date:   Fri, 24 Jul 2020 03:29:31 +0000
Message-ID: <42bc64f1-ede0-75c0-2888-465c7064b0ab@synopsys.com>
References: <1595408575-13150-1-git-send-email-jun.li@nxp.com>
 <7b386b9d-4dd8-5133-5a22-89e3eb86bd6a@synopsys.com>
 <VE1PR04MB6528CD7C8A1BF47451EF175C89760@VE1PR04MB6528.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB6528CD7C8A1BF47451EF175C89760@VE1PR04MB6528.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.7.23]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4df6a52e-d29a-4963-8c23-08d82f81c79f
x-ms-traffictypediagnostic: BY5PR12MB4049:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB404966A7F534C33FA643BEB6AA770@BY5PR12MB4049.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 12m5XzG/41MdSHcrj0S6piXqAEjcKxqTW6ZDpaMK/+5JjGpeOeRSkbp0WbZA+0MozTHuObRIn7DaiZyGc2D9Yx71grYN1DV28VMz7ztkdGUDWbkBZpfKiqE3hkMGtaDAjZ9FAUY0M2vNeL+us/caqi8melSl25NaGPxgLOjss9ZjKUxHzIvdU+LbYoUdVtebBMsyPEHg9WvbfJ9NwVHsQXsnuLNggiIhygAHxWcR5LewCIS7onmcOtiyh9XPj7isoTn5qIFu1V1fxS2CGv/2EZFfQNsBvaJiY3OmjsLDiKvC/17j53f73sEIHff9JRZpTiPSuwR7Ojax7EcjpvX/w6axRPvjAHCeGe8o6zHdG7kaa08xceUVkMH9KTM3Ts8m
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(136003)(396003)(376002)(39860400002)(346002)(71200400001)(6486002)(2906002)(6512007)(8676002)(31686004)(110136005)(54906003)(8936002)(316002)(86362001)(2616005)(31696002)(6506007)(83380400001)(66476007)(64756008)(36756003)(26005)(186003)(478600001)(4326008)(53546011)(66556008)(5660300002)(76116006)(66946007)(66446008)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: WOprEadv6JwI4qbWSGV2k8okGiuCnnFvIP/Im4ze9aaTqlH4eeoFzPuVCHAhftQy5JlJ/qwHO3zznJdjsMp/TooHrgnjawG63uY80NbJF4Aj6vsa8upge2ba1mC9m86EoBprni8JGOvxbURwFTLXEd1datNVhsF7N+fKY4BQJF7y+EGAoMdu4EWOMNki0T7JPEkBRLE5QKJEjnYAuLCy8z1ODzvo3aHvuXedgIYyC5IOxqNou2Uwipd3efSD9T4vUqL6Rw6Lq/idpOIp7El/pSRMmRABJvwbE+NxPB77QJ+qOF3FQlS7mbrIGX/iT81wMiKRkh5D/2xJEOwS951MbqmNCPOnETTExYNwIAIe6nvVtW39f7soB749bjGxHR1xTl569ih41h93b6zCVSqddh/GPhOQfmPjJqX3TD9eijZ3W+WodaWJAzRGyDIsZtXm2VOibpqaV8H4rkc7yXtc+a0RL9YPhqhtBwnuOQbYy5U=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B630485F99EDC64DA8600727A866ABF8@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df6a52e-d29a-4963-8c23-08d82f81c79f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2020 03:29:31.8144
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oy4b2NLuIWJjmQOCqGxBudaKweWAU3ee5n5DN/qmKzTJzVy1m3JNR/nanFZ7gCNH62kv0GU15BIpzOgyUPyD2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4049
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SnVuIExpIHdyb3RlOg0KPg0KPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+IEZyb206
IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCj4+IFNlbnQ6IFRodXJz
ZGF5LCBKdWx5IDIzLCAyMDIwIDQ6MzYgQU0NCj4+IFRvOiBKdW4gTGkgPGp1bi5saUBueHAuY29t
PjsgYmFsYmlAa2VybmVsLm9yZw0KPj4gQ2M6IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnOyBs
aW51eC11c2JAdmdlci5rZXJuZWwub3JnDQo+PiBTdWJqZWN0OiBSZTogW1BBVENIXSB1c2I6IGR3
YzM6IGRlYnVnZnM6IGRvIG5vdCBxdWV1ZSB3b3JrIGlmIHRyeSB0byBjaGFuZ2UgbW9kZQ0KPj4g
b24gbm9uLWRyZA0KPj4NCj4+IEhpLA0KPj4NCj4+IExpIEp1biB3cm90ZToNCj4+PiBEbyBub3Qg
dHJ5IHRvIHF1ZXVlIGEgZHJkIHdvcmsgZm9yIGNoYW5nZSBtb2RlIGlmIHRoZSBwb3J0IGlzIG5v
dCBhDQo+Pj4gZHJkLCB0aGlzIGlzIHRvIGF2b2lkIGJlbG93IGtlcm5lbCBkdW1wOg0KPj4gQXJl
IHlvdSB0YWxraW5nIGFib3V0IE9URyBvciBEUkQ/IFRoaXMgcGF0Y2ggc2VlbXMgdG8gYmUgZm9y
IE9URy4gSWYgeW91IG5lZWQgdG8NCj4+IGRlYnVnIGFuZCBtYW51YWxseSBkbyByb2xlIHN3aXRj
aCBmb3IgRFJEIGZyb20gdXNlcnNwYWNlLCBlbmFibGUgYW5kIHVzZSByb2xlIGNsYXNzDQo+PiBz
eXNmcyBhdHRyaWJ1dGUuDQo+IFRoZXJlIGlzIG5vIHByb2JsZW0gaW4gbm9ybWFsIGNhc2VzLCBJ
IHRyaWdnZXJlZCB0aGlzIHdhcm5pbmcNCj4gd2hlbiB0cnkgdG8gY2hhbmdlIHRoZSByb2xlIGZv
ciBhIHNpbmdsZSByb2xlIHBvcnQgdmlhIHRoaXMgZGVidWdmcw0KPiBmaWxlLCBJIHRoaW5rIG5v
dGhpbmcgc2hvdWxkIHN0b3AgdXNlciB0byB1c2UgdGhpcyBmaWxlIGZvciBkZWJ1Zw0KPiBwdXJw
b3NlLg0KDQpPay4NCg0KPg0KPiBUaGVyZSBpcyBjb25kaXRpb24gY2hlY2sgb2YgVVNCX0RSX01P
REVfT1RHIHdoZW4gaW5pdCBkcmRfd29yaywgYnV0DQo+IG5vIHRoaXMgY2hlY2sgd2hlbiBxdWV1
ZSB3b3JrLCBzbyBtYXliZSBhIGJldHRlciBjaGFuZ2UgaXMgdG8gbW92ZQ0KPiB0aGUgY29uZGl0
aW9uIGNoZWNrIGZyb20gX19kd2MzX3NldF9tb2RlKCkgaW50byBkd2MzX3NldF9tb2RlKCkNCg0K
WWVhaCwgdGhpcyBsb29rcyBiZXR0ZXIuDQoNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNi
L2R3YzMvY29yZS5jIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gaW5kZXggNmFkYWE3ZC4u
MmZhNTBlYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gKysrIGIv
ZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gQEAgLTEyMCw5ICsxMjAsNiBAQCBzdGF0aWMgdm9p
ZCBfX2R3YzNfc2V0X21vZGUoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQ0KPiAgICAgICAgICB1
bnNpZ25lZCBsb25nIGZsYWdzOw0KPiAgICAgICAgICBpbnQgcmV0Ow0KPg0KPiAtICAgICAgIGlm
IChkd2MtPmRyX21vZGUgIT0gVVNCX0RSX01PREVfT1RHKQ0KPiAtICAgICAgICAgICAgICAgcmV0
dXJuOw0KPiAtDQo+ICAgICAgICAgIHBtX3J1bnRpbWVfZ2V0X3N5bmMoZHdjLT5kZXYpOw0KPg0K
PiAgICAgICAgICBpZiAoZHdjLT5jdXJyZW50X2RyX3JvbGUgPT0gRFdDM19HQ1RMX1BSVENBUF9P
VEcpDQo+IEBAIC0yMDUsNiArMjAyLDkgQEAgdm9pZCBkd2MzX3NldF9tb2RlKHN0cnVjdCBkd2Mz
ICpkd2MsIHUzMiBtb2RlKQ0KPiAgIHsNCj4gICAgICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsN
Cj4NCj4gKyAgICAgICBpZiAoZHdjLT5kcl9tb2RlICE9IFVTQl9EUl9NT0RFX09URykNCj4gKyAg
ICAgICAgICAgICAgIHJldHVybjsNCj4gKw0KPiAgICAgICAgICBzcGluX2xvY2tfaXJxc2F2ZSgm
ZHdjLT5sb2NrLCBmbGFncyk7DQo+ICAgICAgICAgIGR3Yy0+ZGVzaXJlZF9kcl9yb2xlID0gbW9k
ZTsNCj4gICAgICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZHdjLT5sb2NrLCBmbGFncyk7
DQo+DQoNCkJSLA0KVGhpbmgNCg==
