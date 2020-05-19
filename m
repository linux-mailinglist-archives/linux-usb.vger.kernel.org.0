Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B1891D9797
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2020 15:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728052AbgESNYW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 May 2020 09:24:22 -0400
Received: from mail-dm6nam12on2068.outbound.protection.outlook.com ([40.107.243.68]:7032
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727057AbgESNYV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 19 May 2020 09:24:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVClmwifnQM0LUUrbYc6u+LdyVCaakTUtNhouBpDvdJ99a6oTbSfVv+bHK1EgowqIYhDCQTH7OEb4EIjuJOwJhnRKR3QMp37CVXhnapT5y0P2r7MSiYZmbc/RnvLpzg46eTRDLGq3f9LXKSmfHPQjuh09ibo6o0NA9DxknZXeYyzYJO6EsUYngDrx+PwgqmYl9o1Ea2Ssmj7fb/kVLaDQC9dK9uPS3wjQenacMV2ysY8MXZ1DMc+IKfLmRZzzOexC78nBkjChIr7Z6OPU15jPY+G3hSTXd8nCAsJ6wrGtn0E7e7RjX7UMjpgZGoo00MHbIr5v//C/cIUI1ipk/Kt4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4s/TJoHE4LumxJelG7IF1sXPNwDAjJwd8IXXkSEZ0Q=;
 b=CpDWw4eUZ5SwVbgGF3+IQarXojJWjlwdqP03Joow65T+n2rbVXuWuXD71hMtMXchfxJDhJBJl80ysRWYGByKQzoAJUkj+8YiMDTmFltdzvt4nNms+OWzGpjw4s2e4dfVmmoP+sKGHp4zGpbaFrDWG8sMKxXrR2HXXNp9z8fD0PpX6N700B3nm388vBjFRm4/IZqybtnyc4+H4Ffzl3rlleIX3Pz4Le3b5itCpGQK/PJ24ubWUTbmuJT7PUApUPUssQ1+Ozhmh1M5k2a8v6xA2tv40Zb039RIJkTMEKgyDDhX4BeEgCJQDeU7gbo+q0ci/X+bOtIu+omzzcyCLX1erw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4s/TJoHE4LumxJelG7IF1sXPNwDAjJwd8IXXkSEZ0Q=;
 b=I6x115OoYhY6pziLr5PHmuhT87exTlYtAAgxHHgj1iAaLRsr9B+Pm86jL8wha6jIFbVXSR/+dXgy9zkhPbioxzOjU1I9K9hkukVhJjqx6+nQrDvq/7H6a9gCJPAOOCHvImNLyhQyi04mgvsD8smfa+Zp/yRkFRVCLjtdXZGGGwA=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (2603:10b6:408:ae::24)
 by BN8PR10MB3138.namprd10.prod.outlook.com (2603:10b6:408:c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Tue, 19 May
 2020 13:24:19 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::c158:d59f:e3bc:1941]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::c158:d59f:e3bc:1941%2]) with mapi id 15.20.3000.034; Tue, 19 May 2020
 13:24:19 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: ttyACM strange chars appearing at connect
Thread-Topic: ttyACM strange chars appearing at connect
Thread-Index: AQHWLdcbNaT93COqRkquqTua8R38BaivXXMAgAAIdwA=
Date:   Tue, 19 May 2020 13:24:19 +0000
Message-ID: <51f1e0138b5ac6dab88f1630f1298d650ad90f13.camel@infinera.com>
References: <52b8c126634058e3a455dc0ab8b0c542916db543.camel@infinera.com>
         <20200519125400.GA410029@kroah.com>
In-Reply-To: <20200519125400.GA410029@kroah.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5803633f-861b-41fc-5307-08d7fbf7efe9
x-ms-traffictypediagnostic: BN8PR10MB3138:
x-microsoft-antispam-prvs: <BN8PR10MB313870A60BAB0B4D21116DF8F4B90@BN8PR10MB3138.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 040866B734
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FkrqPDnlk9ccU8BcVOuPdsx10creE+Jlvm/JhJ5x0nfb8pYuiVs0bhXX73d1NlZN8u5Yy+N49Km/UDez4zAJ53QD4Wpd15aNj6ey9v5QXsIg9NsN8bGw5DJXP7gt0Jf3aF7GjT+N2sZ3PX11uK7uhnBD5BL6zpgzXZTS74H5PNj46Coy21PCUADbLKT1ZovqEs6YgXnM6jjPatnSghNZYPDHrQGbQkZFYwDYFrFlD/smryaqNK1Z4/XOsW9DL9AZ5Vyv1wmyspnSZ+h8j8SUC6W1ULYGMzoXeSo6WEFDLg8VI5zE3cCuVz5lml8RxD5AiyiNnBnODjLmg0L5K9MsIUHOiq3OBnhgNlCikDUW0LRfpvXvxGseyPvcRlzY9LgbjK2uB13kFpKGZBVIS3IcISOYtfHBdCo0kqGlv/iXsHRtmk0WiBnfnjZ6ULChl0el
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR10MB3540.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(396003)(366004)(136003)(39860400002)(346002)(66556008)(64756008)(66446008)(66476007)(76116006)(6916009)(478600001)(91956017)(5660300002)(4744005)(2616005)(86362001)(26005)(6486002)(8676002)(6506007)(71200400001)(66946007)(8936002)(4326008)(36756003)(186003)(6512007)(2906002)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: VQxeBZADF6cwqUqFHzp0FNbDuwwIw7AooYBEOVJCy5udYPFT61ZJvnbL02tjeNnVVLyS/Us1poeL6RqKXyV8a6PD30x2UMuRf51DK4gsS0IAzhSevCb9pJNNQ8tu1jFey391kur9dgDL0JM7rpq7BEyt2u2P3jy8xNEpxRcQaIMDW7BKgbrzdLfK0aucnFEcUGmge/VQhGI0Eg0t986/cGfwiByi9aUtXTnvtOVG4USXrRI5LYuWlsG4lczC21ds3Y+p3vy6oo35niDl4MC+3EK+CRmAlElvcnX2J2qcOU0HTYrjlxLiecfyHtYj8OCxKen9eXPAWeIeuU91IiZ6hASN2EWOXe8JiP5iOj7vrAHWzaqxDllIfNlzBqdxy2zwJiUlNI4KRWwOy+oFbMD7OG6wBxLud7UUt0aBjHrtaX1heJnBbwfi4fIXPvlN7U4+tGxmiJu3xd8rZkO80e1g8GfIicbQ1DUJYKvFwzQ1apw=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C71A84D95C83A24B8FE584A0B5BB8C87@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5803633f-861b-41fc-5307-08d7fbf7efe9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2020 13:24:19.4965
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JDyaiQiHuaJ62sUQrWNkR2T/lZ09B5WogoavP3/Lr+TGgFgXPimcpaOChSbQJD7EA1pTWqMHqUjCFslpHUdgEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3138
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVHVlLCAyMDIwLTA1LTE5IGF0IDE0OjU0ICswMjAwLCBHcmVnIEtIIHdyb3RlOg0KPiBDQVVU
SU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRp
b24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVj
b2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+IA0K
PiBPbiBUdWUsIE1heSAxOSwgMjAyMCBhdCAxMjoxNDo1NVBNICswMDAwLCBKb2FraW0gVGplcm5s
dW5kIHdyb3RlOg0KPiA+IFdoZW5ldmVyIHdlIGNvbm5lY3QgYSBMaW51eCBsYXB0b3AoNC4xOS4x
MTgpIHRvIG91ciB0dHlBQ00gc2VyaWFsIGdhZGdldCB3ZSBjYW4gc2VlIHNvbSBzdHJhbmdlDQo+
ID4gY2hhcnMgYXBwZWFyaW5nIGluIG91ciBnYWRnZXQ6DQo+ID4gMDPvv71gM++/vTAz77+9eO+/
vXgoaW4gaGV4OiAzMDMzIGVmYmYgYmQ2MCAzM2VmIGJmYmQgMzAzMyBlZmJmIGJkNzggZWZiZiBi
ZDc4KQ0KPiA+IFRoZXkgYXBwZWFyIHdpdGNoIGMuYSAxIHNlYyBpbiBiZXR3ZWVuLg0KPiA+IEkg
YXNzdW1lIGl0IGlzIHRoZSBsYXB0b3BzIEFDTSBkcml2ZXIgZW1pdHRpbmcgdGhvc2UsIGJ1dCB3
aHk/IENhbiB0aGVzZSBjaGFycyBiZSB0dXJuZWQgb2ZmPw0KPiANCj4gSXQncyBhIHByb2dyYW0g
b24geW91ciBsYXB0b3AgcHJvYmluZyB0aGUgZGV2aWNlLiAgVXN1YWxseSBtb2RlbW1hbmFnZXIN
Cj4gb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCg0KQWhoLCBtYWtlcyBzZW5zZS4gTm93IEkgbmVl
ZCB0byBzZWUgaG93IHRvIHR1cm4gaXQgb2ZmKE5ldHdvck1hbmFnZXIgcHVsbHMgaXQgaW4pIC4u
Lg0KDQogSm9ja2UNCg==
