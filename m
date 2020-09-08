Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F39B2619C6
	for <lists+linux-usb@lfdr.de>; Tue,  8 Sep 2020 20:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731653AbgIHSTV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Sep 2020 14:19:21 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:49972 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731711AbgIHSRd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Sep 2020 14:17:33 -0400
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 476DF4016B;
        Tue,  8 Sep 2020 18:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1599589053; bh=c9UvMl5NE/r93c0ZdlAL9sfJALoLWopGWfdrxa9Ctio=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Tb+z06cfG/04Ykiaa2h83g8dSoG1H+DUZkJdc02GLJuGFC4o8WMeSTbe2i6se3KJ5
         sIj1beLB86h96kP1Tv1rXxhtveM5nkNro2NsHDx48cYFT1M59YJ5WR9MYGh7tCwigg
         TossN7pqsWtO+62nJSdtQa3ViSiDDnzcx3QhEfYb36EK03SxzHEeK2Lo5CEbL6+0Ru
         nbmlxHTE5cfhDCguFCaxFBBw6HWqlRS/H3hwfdj/7JpxpDeM1nUNyG8rf0YtdfevuO
         Uk+0YAJCMraOppbyhUF4XzLCua7k6aj40RZKTbAAOXoPxbvhwlZLpz4gxLdZmoqpqV
         qeZuSPgHyehYw==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id F403DA005C;
        Tue,  8 Sep 2020 18:17:32 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam08lp2044.outbound.protection.outlook.com [104.47.74.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id B6B44801B4;
        Tue,  8 Sep 2020 18:17:31 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="NIhlaYMy";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ko1gTYjc0hWJxccvJzf0D6VtC+D1rNuJfU8LkPuzieRGAT+yJuvkAUDbykOsUc/O4uVYgqxfwoYsS2WKXPWjaqraxkd5AUWoV8ZB6aEsb0Na/kix78kB7CiRz3QaKnvrEQQX8kOgy4KweAXtcG2Aq4/9jqaK54wCCEe/I3gR56ZKSpZ6b68m64CylNyhbf6885G7ixsPEcg2D6NXJGZN4wnXvi/LjVUoxLne27YXLT3tVmXqWqIg0hWSRYcSqZrMoA5ShZU1+K7WHIB1xaOPDJ0QcrYAu8guKUmPR8TG9A/MBc0ntrYaMYavBe+mtUj9z5KAI0GssocCc9o5gxflGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9UvMl5NE/r93c0ZdlAL9sfJALoLWopGWfdrxa9Ctio=;
 b=Zykd/0qalmhhaW3jZTxGT50RSYAjVUlA8UI/iIpnWjTcZL4Xc1RgwnB6j2dJmwDcauuKQXnLpbF58PwRlHh32F3cw/SGNeUJrWBBf4/uw5gFgvlOtT7JJ5HZFWAeNMTCnSqpuAHrwMtGFhfXu+X52uLyXx/v+ShPOkCd/iSd6AQ4x8vx3lTEQzBgeN56Ivt5u8bIJMhzfjz1nOGrmh0TYZZ0KtohTwF93El8h/vQTuuNMfUvm7P69ZDRjxAm7BBzVB85rnU44tRBsZDbO0ZS5IF5iuWeh/Uug5jBSZ3nS847RCusUd9SW2J3ZJyzQfvwXp5qLyFzvCFsXSAu4tJoiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9UvMl5NE/r93c0ZdlAL9sfJALoLWopGWfdrxa9Ctio=;
 b=NIhlaYMyx5eUF1pqxpPjDZFxBxbXLw/nndVy4m984YyN3IiWl9WcAQOxxnlQPFDlRQOWzZORCypwbjavhE0EAoPZ/TTnrPIxJ/xG17lmLrfq0TKuqOQEsXH6VR90Nr2AL7SYYRFHfpDQUsZGBOEneCYDpdM/INPdCWe0cfhmFfY=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BY5PR12MB4146.namprd12.prod.outlook.com (2603:10b6:a03:20d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Tue, 8 Sep
 2020 18:17:29 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::c98f:a13f:fd88:c209]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::c98f:a13f:fd88:c209%7]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 18:17:29 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v3 1/4] usb: dwc3: gadget: Refactor preparing TRBs
Thread-Topic: [PATCH v3 1/4] usb: dwc3: gadget: Refactor preparing TRBs
Thread-Index: AQHWgZbNTEZOx0iSuEi9Jwc7ud8GZ6lcvAOAgAJZbQA=
Date:   Tue, 8 Sep 2020 18:17:29 +0000
Message-ID: <5be0e8a8-2a32-e160-9b69-04ef791df511@synopsys.com>
References: <cover.1599098161.git.thinhn@synopsys.com>
 <66fa061307b6f4eff00fb279ae5130c3bd8720f7.1599098161.git.thinhn@synopsys.com>
 <87lfhm14ui.fsf@kernel.org>
In-Reply-To: <87lfhm14ui.fsf@kernel.org>
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
x-ms-office365-filtering-correlation-id: 571d88c7-f09a-438b-6d3f-08d854237263
x-ms-traffictypediagnostic: BY5PR12MB4146:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB4146225E7A0CC5F38A9C2672AA290@BY5PR12MB4146.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xPc7gDGsyg+cshR8ILtrsAi4SEUhrFU2SiPfI2H9B9/l7mAHBobI4DrMmoM+NGsOo1cb6xk5X1ak0oBCKtgln+g5nsTqMzQCB3ETl4xpQqi2FoRPqQTPq9eoa8iVvW2VIvUm/zVO5SFKKWi+8csFAmta4O/T/w1frcY7XL8fR3L8zEGpvhZBF9ReumDn6kQykat6jZlVcZHQ14efOZLZBiR0XXqYtc1jWGdzPVzVxqg/2GGInFgoFHoH95PydcMPpsEAXePvTZVCCRHIpy2vvVW1RDDduor7JKN6j7u9zPw/d/znZVPstv59TGY/I3JTnAuDf0XUPAf+7OOxmTPp6ZvmcrraoPIjVgxRJnWUKvSpyjf1gLAJLCgdrFD5QdjX
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(366004)(346002)(136003)(396003)(66476007)(66946007)(8676002)(6512007)(478600001)(76116006)(64756008)(2906002)(316002)(26005)(66446008)(186003)(110136005)(2616005)(71200400001)(6486002)(31696002)(4326008)(8936002)(66556008)(31686004)(107886003)(86362001)(6506007)(36756003)(83380400001)(5660300002)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: NKpmslGNadTakQlax9n+ZCmpkmMXVlUYqm+Y6dJJauF0bB9SjkCOSibktQPavHYlqTiobTC3MBGZG6YgR+Cdv8u9C/OaKfcJhxmUKhvD+W2h7k3RacLx1nHQJWS+mm06rk5uw9oIED8frCUNjCqAVWn27byYP2sBio4oUJMdwDB4Copd8mB56TxPf7dLYnzYjQYFiq9bmiwqMJHRTYySFTU9nibH4vYLagL+zSyucTw5GfDnjr+tgv1z+R3Psc+ZjMuCUUfeBWOSd7YTdvEOb6BAn0N3xlOCIN+AVZF7ZZQFj3MA/sBUG+w+IQ/kb01/dzS+DgP+anoYIJfqPan8HNClh+R4cabzsmkJNbZ/SOsF324dtWp/eZRRMYgvWibc6XfUadA8QSZ9W59BmbwTqXFX8WPD4ycULfc+jpLD6cR0Wcp9frAjoUlK2SjPwMVrGwoAag8q2axvJwORK7UfC5stAz1Pgdhnc0CCA1kXDcW0jdohgdDymXtukRiAzIk7049Vkv0YxM30Qn+rKMibzxjp+KetfGdnHVAMpB/k2/1rRCQ1vvXHDfOAtnEOFi2Bfvcj7LKCvNGHVTw7OxvO3lZmTIDpZVe+Su0eqKEPh5jzC7S4w4cJV8WXPzXiGbM1vJ8aSIkyR4MH8bbOo6ww7Q==
Content-Type: text/plain; charset="utf-8"
Content-ID: <9CA97A6EDEDEB445ABC8D08FADBC4F84@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 571d88c7-f09a-438b-6d3f-08d854237263
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2020 18:17:29.2132
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dL2bdsgpBKcsGVx52gmlQYG5m6pZUik//Ke5gkWjdZBLD1N5MzRwzM9T+UKOToy6x/s30kyS6s7Ll+SFRmFy8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4146
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RmVsaXBlIEJhbGJpIHdyb3RlOg0KPiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5
cy5jb20+IHdyaXRlczoNCj4NCj4+IFRoZXJlIGFyZSBhIGxvdCBvZiBjb21tb24gY29kZXMgZm9y
IHByZXBhcmluZyBTRyBhbmQgbGluZWFyIFRSQnMuIExldCdzDQo+PiByZWZhY3RvciB0aGVtIGZv
ciBlYXNpZXIgcmVhZC4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaGVyZS4NCj4+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBUaGluaCBOZ3V5ZW4gPHRoaW5obkBzeW5vcHN5cy5jb20+DQo+IGVtYWlsIGhlcmUg
ZG9lc24ndCBtYXRjaCBhdXRob3IncyA7LSkNCg0KV2hlbmV2ZXIgSSBzZW5kIGVtYWlsIG91dHNp
ZGUgb2Ygb3VyIG9yZ2FuaXphdGlvbiwgdGhlICJGcm9tIiBoZWFkZXINCndpbGwgYmUgbW9kaWZp
ZWQgdG8gYW4gYWxpYXMgZW1haWwgYWRkcmVzcy4gSSdtIHdvcmtpbmcgd2l0aCBvdXIgSVQgdG8N
CnNlZSBpZiB3ZSBjYW4gZG8gc29tZXRoaW5nIGFib3V0IGl0LiBUaGlzIG1heSB0YWtlIHNvbWUg
dGltZS4gSSBob3BlDQp0aGF0IHRoaXMgZG9lc24ndCBjYXVzZSB0b28gbXVjaCBpc3N1ZSBhY2Nl
cHRpbmcgbXkgcGF0Y2hlcyBpbiB0aGUNCm1lYW53aGlsZS4NCg0KPg0KPj4gQEAgLTEwOTEsNiAr
MTA5MSw2NSBAQCBzdGF0aWMgdm9pZCBkd2MzX3ByZXBhcmVfb25lX3RyYihzdHJ1Y3QgZHdjM19l
cCAqZGVwLA0KPj4gIAkJCXN0cmVhbV9pZCwgc2hvcnRfbm90X29rLCBub19pbnRlcnJ1cHQsIGlz
X2xhc3QpOw0KPj4gIH0NCj4+ICANCj4+ICsvKioNCj4+ICsgKiBkd2MzX3ByZXBhcmVfbGFzdF9z
ZyAtIHByZXBhcmUgVFJCcyBmb3IgdGhlIGxhc3QgU0cgZW50cnkNCj4+ICsgKiBAZGVwOiBUaGUg
ZW5kcG9pbnQgdGhhdCB0aGUgcmVxdWVzdCBiZWxvbmdzIHRvDQo+PiArICogQHJlcTogVGhlIHJl
cXVlc3QgdG8gcHJlcGFyZQ0KPj4gKyAqIEBlbnRyeV9sZW5ndGg6IFRoZSBsYXN0IFNHIGVudHJ5
IHNpemUNCj4+ICsgKiBAbm9kZTogSW5kaWNhdGVzIHdoZXRoZXIgdGhpcyBpcyBub3QgdGhlIGZp
cnN0IGVudHJ5IChmb3IgaXNvYyBvbmx5KQ0KPj4gKyAqLw0KPj4gK3N0YXRpYyB2b2lkIGR3YzNf
cHJlcGFyZV9sYXN0X3NnKHN0cnVjdCBkd2MzX2VwICpkZXAsDQo+PiArCQkJCSBzdHJ1Y3QgZHdj
M19yZXF1ZXN0ICpyZXEsDQo+PiArCQkJCSB1bnNpZ25lZCBpbnQgZW50cnlfbGVuZ3RoLA0KPj4g
KwkJCQkgdW5zaWduZWQgaW50IG5vZGUpDQo+IEkgdGhpbmsgc29tZSBvZiB0aGVzZSBjYW4gYmUg
Y29tYmluZWQgaW50byBhIHNpbmdsZSBsaW5lLiBBbHNvLCB3aHkgc28NCj4gZmFyIHRvIHRoZSBy
aWdodCBvbiB0aGUgbGluZSBicmVha3M/IENvdWxkIHlvdSBrZWVwIHRoZSBleGlzdGluZyBzdHls
ZT8NCg0KDQpJdCdzIGJlY2F1c2Ugb2Ygb3BlbiBwYXJlbnRoZXNpcyBkZXNjZW5kYW50IGFsaWdu
bWVudCBzdHlsZS4gSSdsbCBjaGFuZ2UNCnRvIG5vdCBkbyB0aGF0Lg0KDQo+PiArew0KPj4gKwl1
bnNpZ25lZCBpbnQgbWF4cCA9IHVzYl9lbmRwb2ludF9tYXhwKGRlcC0+ZW5kcG9pbnQuZGVzYyk7
DQo+PiArCXVuc2lnbmVkIGludCByZW0gPSByZXEtPnJlcXVlc3QubGVuZ3RoICUgbWF4cDsNCj4+
ICsJdW5zaWduZWQgaW50IG51bV9leHRyYV90cmJzID0gMDsNCj4+ICsJdW5zaWduZWQgaW50IGk7
DQo+PiArCWJvb2wgZG9femxwID0gZmFsc2U7DQo+PiArDQo+PiArCWlmICghdXNiX2VuZHBvaW50
X3hmZXJfaXNvYyhkZXAtPmVuZHBvaW50LmRlc2MpICYmDQo+PiArCSAgICByZXEtPnJlcXVlc3Qu
emVybyAmJiByZXEtPnJlcXVlc3QubGVuZ3RoICYmICFyZW0pIHsNCj4gc3BhY2VzIGZvciBpbmRl
bnRhdGlvbj8NCj4NCg0KU2FtZSBjb21tZW50IGFzIGFib3ZlLg0KDQpUaGFua3MsDQpUaGluaA0K
