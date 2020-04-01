Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E259819B515
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2020 20:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732511AbgDASGt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Apr 2020 14:06:49 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:45536 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732121AbgDASGt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Apr 2020 14:06:49 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DB1D243B8C;
        Wed,  1 Apr 2020 18:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1585764409; bh=QjXpd71x3vA394l4Uu/JGZb7vED9bAxA7dPubk70YMY=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=TTOorpk9Y1W9GKnLef6cVTpFjFxbEgy7EdQmHJ7/8DeHbjb2day/xyuH27cMXazxE
         98MCnNBnP/8XxH5104Ep8Ub+ygCxOkaTvre4GWeD8e/URWRkv+QcB8DGxaCID6Wkr3
         4zepwx4eXGCkB1l5bLeU2OGau+L7fDFeTcw7ZOeG8Yyl/vehy9F9c1INYKsFfcDCzW
         T7vGTQkU0Qxj56KkALLDYMUsSsvXAwsj9ZeEjhWzn15x4dBnEv75NWeq474Ggn18tR
         WcVJIuh+xEhSgOcwUT7UEJdzAq/8eUB3OcBFybqu2MWRUSwZJ6CA726L6elJOzqj23
         nDxb6VZny06Uw==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id D56A2A0070;
        Wed,  1 Apr 2020 18:06:40 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 1 Apr 2020 11:06:04 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 1 Apr 2020 11:06:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n03LgXIycxjY+kYAHk7q4FdpFZkvWV5ZIw1j7YyhOqbs7929WZZlQeIePsCzHG0xJsUkZ9xbciB+KwNUlMeXYt43EW3l9gjPyyQRuG2ERsgtST2NJ2H0rdcktpCAw2DvZkg9aIImXZMboQkwd8P2WBaDgixenR1TilPo6P7x+lO6K7nZTnzIR0bvqd7LhX2Uwxh7TYRV0FYN55dkmMb17FOO2d2GclfBkxDtkx76LOZBDJGz9NygMiyZhxDPVme24xKOIbbkjVY9sZDoTcLQs9VJBVSBCmX8RA9nwmsoqNp2/5qE6eWeTbtt0Er8Mup9XrE4ZfGXTIqpZwHTLGYu1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjXpd71x3vA394l4Uu/JGZb7vED9bAxA7dPubk70YMY=;
 b=Ki+SNymVMatC4KqFSVdkREHBZjtKDhnDkJsczCivq//kFMY85pASreGRwRexoEaVISyUsCyhLodytWpLUwLxgHkhQtcCJXUJaD8UGw8P0mlVBI0e9mOf22ZfcULUMOVIwpfNg113BC9zefBrhNmPSp34Usdf+dZIpMU3SHNgPYe+WXyRPhXgoJepnoSIme7AH5AcaWDI301x8bY07FgjEhECwlDkjl0N0ZdgpG6bEo53+psg/h+bbSApMeTD/HLiHIMUBnBEN6WTSc6B8Pjs6o2SGTrPFHMsDoKIW4rnEruCHluvnFxj2YR3Jh36rKqyd9RUGdtoB5tJrmouBXTdWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjXpd71x3vA394l4Uu/JGZb7vED9bAxA7dPubk70YMY=;
 b=v70x/KpqNZq0ZowLo5GvV94BBEzPnhd0GRxyO7gp2FNKg+vNMaxx0FA7exCcRuNFyoT2gDiYZzyNdLKdA9GrnxamtlfgCHYKj+LPeYmBRGe+LKyofzr4JiJOPoE4+FmQeOO/TIJ7Z5G3Ymw1pCM0o5YX6hcYSH/lctjDTZX5fGI=
Received: from BYAPR12MB2710.namprd12.prod.outlook.com (2603:10b6:a03:68::11)
 by BYAPR12MB2790.namprd12.prod.outlook.com (2603:10b6:a03:69::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Wed, 1 Apr
 2020 18:06:02 +0000
Received: from BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08]) by BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08%7]) with mapi id 15.20.2856.019; Wed, 1 Apr 2020
 18:06:02 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Alan Stern <stern@rowland.harvard.edu>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 0/7] Universal Serial Bus: Removing Acronyms
Thread-Topic: [PATCH 0/7] Universal Serial Bus: Removing Acronyms
Thread-Index: AQHWB/gew0PpOswF+EKIHzX05MERgahkkHuA
Date:   Wed, 1 Apr 2020 18:06:01 +0000
Message-ID: <5d466907-cba0-59d1-6553-438bcbc779d8@synopsys.com>
References: <20200401073249.340400-1-balbi@kernel.org>
In-Reply-To: <20200401073249.340400-1-balbi@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [149.117.75.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac618eea-a277-4bcc-0124-08d7d66756c5
x-ms-traffictypediagnostic: BYAPR12MB2790:
x-microsoft-antispam-prvs: <BYAPR12MB27900314AF7CE054CEDDC710AAC90@BYAPR12MB2790.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 03607C04F0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2710.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(366004)(376002)(39860400002)(346002)(136003)(396003)(66946007)(86362001)(31696002)(6506007)(186003)(26005)(110136005)(36756003)(316002)(8936002)(478600001)(8676002)(4326008)(2616005)(76116006)(64756008)(81156014)(2906002)(6486002)(66446008)(66476007)(66556008)(5660300002)(31686004)(71200400001)(6512007)(81166006);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qa+ESU+dSwwUFIxdGmHHw25uqCquhhKBTl77pvHCPfL0Wir6e7wG2usVG5njik4+yPgojcBveIuYxJkpMvic0e549xrYOEIBClxh/Nf6TZ1T8sYT5AaNttreyhrtu7jrwkz6rlAndVUfjtC0TOqfW2KauCX2IfNsJbyMV+Qal4DMfwHPl2HDNZIqJ46erAeP+8ry0ROamwKJ6dF2tAsH4sn+LPRGO7jT0tM7ESJn8JHgp+nCAqrOeJX+ISG3wu+fssIdIcVSjpdeccpw/bFtzvJHwmyBWDcUGqK1i/L+FoBZ10h2TygEc1XqkpTRwLgHshgVXe4A27G8/i+InOmef45SazrV9mygnBMhuOo8hiiqasLQMF2o4lnwnbDVTvFHOGUO1aBoJ+20cJrtq5IMke0tYRNNVe5hLMh5CJ4OMecPALWH7cXTHGOF2lPsF9hH
x-ms-exchange-antispam-messagedata: WANIOn6TDlU1iTLTasHZElE34KJeXeZ6AQhOjunpaF8VxzyRi8iXfr9PJVVzX4g2CU5FmBi10DhNkjX0z+RuYGNCYKPn9E3ljbn7ScMOsXemeqIOgn9ClIYVW8Z6cytEUAn+JN2otzl/Le0CEzWNgQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <806E443537AA7848B57B0823176FF749@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ac618eea-a277-4bcc-0124-08d7d66756c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2020 18:06:02.0092
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WuB8VVQYq178PvE/NnV0AMqrssp2Eut5JMqtmvLHLo+oWeiS25Dxj8CN8i+ELWe7IeVRlrt/JmFD3r/dskrXbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2790
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCkZlbGlwZSBCYWxiaSB3cm90ZToNCj4gSGkgZ3V5cywNCj4NCj4gaW4gb3JkZXIgdG8g
bWFrZSBvdXIgVW5pdmVyc2FsIFNlcmlhbCBDb21tdW5pdHkgbW9yZSB3ZWxjb21pbmcsIHdlIGhh
dmUNCj4gZGVjaWRlZCB0byByZW1vdmUgdW5uZWNlc3NhcnkgYWNyb255bXMgZnJvbSB0aGUgY29k
ZS4gVGhpcyB3aWxsIGJlIHZlcnkNCj4gdXNlZnVsIGZvciBuZXdjb21lcnMgYXMgdGhleSB3b24n
dCBoYXZlIHRvIGd1ZXNzIHdoYXQgVVNCIG9yIFhIQ0kgbWVhbnMNCj4gYW5kLCBpbnN0ZWFkLCBo
YXZlIGl0ICphbHdheXMqIHNwZWxsZWQgb3V0Lg0KDQpIb3cgZGlkIHRoaXMgZGVjaXNpb24gY29t
ZSBhYm91dD8gSWYgdGhlIGdvYWwgaXMgdG8gYXR0cmFjdCBuZXdjb21lcnMsIEkgDQpkb3VidCBt
b3JlIHBlb3BsZSByZWNvZ25pemUgInVuaXZlcnNhbCBzZXJpYWwgYnVzIiB2cyAidXNiIi4NCg0K
PiBJJ20gc3VyZSBtb3N0IG9mIHVzIGhlcmUgaGF2ZSBzdWZmZXJlZCBiZWZvcmUgdHJ5aW5nIHRv
IGZpZ3VyZSBvdXQgd2hhdA0KPiBhbiBhY3JvbnltIG1lYW5zIGFuZCB3ZSBhbGwga25vdyBob3cg
bXVjaCB0aGF0IGhpbmRlcnMgb3VyIGhhYmlsaXR5IHRvDQo+IGZvY3VzIG9uIGVuZ2luZWVyaW5n
LiBMZXQgdXMgYWxsIGNvbWUgdG9nZXRoZXIgdW5kZXIgYW4gYWNyb255bS1mcmVlDQo+IGRyaXZl
cnMvdW5pdmVyc2FsX3NlcmlhbF9idXMgKG5vdGUgdGhhdCByZW5hbWluZyBvZiBkaXJlY3Rvcnkg
d2lsbA0KPiBoYXBwZW4gaW4gZnV0dXJlIGNvbW1pdHMgYWZ0ZXIgdGhlIGNvZGUgaXMgY29tcGxl
dGVseSBjbGVhbmVkIHVwIGZyb20NCj4gYWNyb255bXMpLg0KDQpXaGlsZSBJIGFncmVlIHRoYXQs
IGZvciBzb21lLCBzcGVsbGluZyBvdXQgdGhlIGFjcm9ueW0gbWF5IGhlbHAsIGJ1dCBJIA0KZG9u
J3QgdGhpbmsgdGhpcyBpcyB0aGUgcmlnaHQgZGlyZWN0aW9uIHdlIHNob3VsZCBiZSBoZWFkaW5n
Lg0KDQpJIGNhbiBzZWUgYSBmZXcgaXNzdWVzIHdpdGggdGhpcyBhcHByb2FjaC4gVG8gbGlzdCBh
IGZldzoNCg0KMSkgQ2FuIHlvdSBpbW1lZGlhdGVseSByZWFkIGFuZCByZWNvZ25pemUgdGhpcz8g
TXkgYnJhaW4gaGFzIHRvIHdvcmsgDQpleHRyYSBoYXJkIGZvciB0aGlzOg0KDQogICAgVU5JVkVS
U0FMX1NFUklBTF9CVVNfVU5JVkVSU0FMX0hPU1RfQ09OVFJPTExFUl9JTlRFUkZBQ0VfQklHX0VO
RElBTl9ERVNDDQogICAgdnMNCiAgICBVU0JfVUhDSV9CSUdfRU5ESUFOX0RFU0MNCg0KDQoyKSBC
YWNrcG9ydGluZyBmaXggd2lsbCBiZSBhIHBhaW4NCg0KMykgR3JlcCB3b24ndCBiZSBlYXN5DQoN
CjQpIExpbmVzIG92ZXIgODAgY2hhcmFjdGVycyAoSSBtZWFuIG5vdCBqdXN0IGJlY2F1c2Ugb2Yg
dGhlIHNjcmVlbiBzaXplLCANCmJ1dCBJIHRoaW5rIHRoaXMgaXMgYSBnb29kIGd1aWRlbGluZSB0
byBoZWxwIHdpdGggcmVhZGFiaWxpdHkpDQoNCg0KSU1ITywgc3BlbGxpbmcgb3V0IGFjcm9ueW0g
c2hvdWxkIGJlIGluIHRoZSBkb2N1bWVudGF0aW9uLiBTb21laG93LCBJIA0KZG91YnQgdGhhdCBu
ZXdjb21lcnMgcmVhZGluZyB0aGlzIGNvZGUgd2lsbCBub3cgaGF2ZSBhbiAiQWhhISIgbW9tZW50
IA0KYW5kIHN0YXJ0IHRvIGxlYXJuL2NvbnRyaWJ1dGUuDQoNCkRpZCB3ZSBleHBsb3JlIG90aGVy
IHdheXMgdG8gYXBwcm9hY2ggdGhpcz8gKHN1Y2ggYXMgYWRkaW5nIG1vcmUgDQpkb2N1bWVudGF0
aW9ucyB3aGVyZSBuZWVkZWQsIGFuZCBtb3JlIHNhbXBsZSBjb2Rlcz8pDQoNCg0KPg0KPiBHcmFu
dGVkLCB0aGUgcGF0Y2hlcyBhcmUgYSBsaXR0bGUgYmlnLCBidXQgSSB0aGluayB0aGV5IGNhbiBz
dGlsbCBiZQ0KPiBzcXVlZXplZCBkdXJpbmcgdGhlIG1lcmdlIHdpbmRvdyBzaW5jZSB0aGVyZSBh
cmUgbm8gZnVuY3Rpb25hbCBjaGFuZ2VzLg0KPg0KPiBGZWxpcGUgQmFsYmkgKDcpOg0KPiAgICB1
bml2ZXJzYWwgc2VyaWFsIGJ1czogcmVtb3ZlIGFjcm9ueW1zDQo+ICAgIG9wZW4gaG9zdCBjb250
cm9sbGVyIGludGVyZmFjZTogcmVtb3ZlIGFjcm9ueW1zDQo+ICAgIHVuaXZlcnNhbCBob3N0IGNv
bnRyb2xsZXIgaW50ZXJmYWNlOiByZW1vdmUgYWNyb255bXMNCj4gICAgZW5oYW5jZWQgaG9zdCBj
b250cm9sbGVyIGludGVyZmFjZTogcmVtb3ZlIGFjcm9ueW1zDQo+ICAgIGV4dGVuc2libGUgaG9z
dCBjb250cm9sbGVyIGludGVyZmFjZTogcmVtb3ZlIGFjcm9ueW1zDQo+ICAgIGRlc2lnbndhcmUg
Y29yZXMgdW5pdmVyc2FsIHNlcmlhbCBidXMzOiByZW1vdmUgYWNyb255bXMNCj4gICAgZGVzaWdu
d2FyZSBjb3JlcyB1bml2ZXJzYWwgc2VyaWFsIGJ1czI6IHJlbW92ZSBhY3Jvbnltcw0KPg0KPiAg
IA0KDQpCUiwNClRoaW5oDQo=
