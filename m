Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC26D1CF200
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2020 11:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729278AbgELJ6Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 May 2020 05:58:24 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:51079 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbgELJ6X (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 May 2020 05:58:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589277503; x=1620813503;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=qciApqpZ+qyoyo/ey8GQex6wrj7xkMOu2J6u8mOSVlE=;
  b=Zez9lNs6g30o4n7BKEbApQJ0uJwAwkiix/1SqZ665OKZgwU76TID5z/m
   +Q5jmrfuBZsrPHvEeLfZ1zoD+q5arL11pi/fUpKSGbyRjUoG9ZlRBenOS
   aAn9MCFF++JUG1SfooOrm1nqh5w6adpw/ARhwKRtVx3TSu9cIhX2m4fej
   6UxpNbtzZvWx/AbIoffoThLqgXzC39KtbJAjZvQhXx+q7iuxNfC9595MO
   xn2JSsmTkeVzvYtyvSTc6p+QQNKgYBljMjjQhmhlVcPAKw39fnCqASwiT
   3mmAJmbud//rreHGqn0g5Wyc6YILFc84K0dsSNs7cvY+W0Zj0jrTFSOxh
   A==;
IronPort-SDR: ziB7ogrKjd5iOAtsCcEBIPId72vyI99DTXSvJcHsmCKSgbKR2HF0l1T17DxraNXtcmVrd07QtE
 cR1G+NQB+TPFDAsfpLE1kVP8SCRHTwkLekT3sTiq9dV0Z0laneYgf6GMKG/gdtc2XcQvKGKdld
 Zlzal97GinZ4qp6Hkg73wCSnpXtXe9DRxYDaoR6aUeGCzfd9voqJ/ILtxf4riv0X+epbgbBzXW
 TUdlFPykLbWVTyJrprDhCbV7pSEZa7773uD17EUNfvtjr0YDUKEOPLIkT6RQKd6FnqY0PtiIXb
 994=
X-IronPort-AV: E=Sophos;i="5.73,383,1583218800"; 
   d="scan'208";a="73139572"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 May 2020 02:58:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 12 May 2020 02:58:21 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 12 May 2020 02:58:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FfqLRfs8647WRvzB7ZSyq1ZqLdF9M808YJimiKu/9iT4Gu2PZF4+7KKv92pP8h2juAMOrMFEam9kJzPZYIGlr7ry571RPGvNGSem8S1/LapQkLieF2RfCvJvpopgdhOE4hz1DhJiRlHC6Mj4QDl9TfZCW97q2pyPSaL8sZ/LEScD2d5OyNhHwDl3tFTDzH7rRdSsy7Dw21S1jbH1GgteG9I37CiLyJo12fgSzUMZdg06h9GIdFvLM6PfdPyXr0N5BqZTuiTdjK01qUNH3QRxMwp5Kru2puisiYHS3RjevET9Jyg1XYOzC1Ip5cx1kCjR9JAD4AAAui2+6bX5uKY6eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qciApqpZ+qyoyo/ey8GQex6wrj7xkMOu2J6u8mOSVlE=;
 b=UNEXc7o6W0PcR6beIGvzX+j/CPYQF8xP7xNJNtWhFetNSkekYQm67CEIXhVNfvXo9lsDIdiEk2KW/yuldovlOPa+xefCxecfPpcNou0Mghe1svsx1/ti5NzS9huOgolufi85YlmBgbhYa/4JJnXwrClpaVa2KeN76gcVy3M1Syxx/OToeXZKYZIg3JFWXm6ccB4preCKhdV8+YxJjo0kRzKPXNmC8qUWIApe1nuL9v+ZmY40BK8RAwmSH7UAh56PYaeluDPsMeJ+4zH0Xy52+Mq9bB020FTKgqKpt+KHhp1vgypxJkhoBLJcbJq8NePV7HKBxx9I5dWKPTejImXJxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qciApqpZ+qyoyo/ey8GQex6wrj7xkMOu2J6u8mOSVlE=;
 b=NhTjVo5sfhXPf7B6saK/f64EhD0YdrgkjZ/014BwrCMEl9fMGW7sfJYMMtTi+670zumWQTWFlbQKcCKeBDDLI8D+CAgxFUXxpYrn1trE9wTlHPEZ/sh5f/swtPzQ3Dhe5z6Xf3g581mA7s6bZYBjx81ogZYrd6KAPiI2Uh5akpI=
Received: from DM6PR11MB3420.namprd11.prod.outlook.com (2603:10b6:5:69::31) by
 DM6PR11MB3754.namprd11.prod.outlook.com (2603:10b6:5:146::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.33; Tue, 12 May 2020 09:58:19 +0000
Received: from DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::e8fd:29e5:1fa6:c01d]) by DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::e8fd:29e5:1fa6:c01d%5]) with mapi id 15.20.2979.033; Tue, 12 May 2020
 09:58:19 +0000
From:   <Christian.Gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>
Subject: Re: [PATCH RFC] drivers: most: add USB adapter driver
Thread-Topic: [PATCH RFC] drivers: most: add USB adapter driver
Thread-Index: AQHWJ3m/SSj+ohK2lE+ATVgBizbxZKiixN6AgAAyOICAAB3YAIABIscA
Date:   Tue, 12 May 2020 09:58:18 +0000
Message-ID: <0b7b32260012cf6a16d575315b6dd09cf7bdafb9.camel@microchip.com>
References: <1589190675-21145-1-git-send-email-christian.gromm@microchip.com>
         <20200511114713.GA1671075@kroah.com>
         <266714a09283d7b5cc9f0720415db7e86bf18387.camel@microchip.com>
         <20200511163346.GA2236392@kroah.com>
In-Reply-To: <20200511163346.GA2236392@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.5-1.1 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [88.130.69.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49c2576c-e6cc-445a-366e-08d7f65aff8a
x-ms-traffictypediagnostic: DM6PR11MB3754:
x-microsoft-antispam-prvs: <DM6PR11MB37544896D7EA5FEF96D5136DF8BE0@DM6PR11MB3754.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:499;
x-forefront-prvs: 0401647B7F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i7GvgIYIcEkCRopHj9ggRoB2CsP/hnlWj4pDaXIwPg4AHk+nNgXlP75ltpxXPysF4yjb5CoxPItHJneuU2rRq0kB9X4m54ocBkl+pA9g4nY97MTUUtj5/X3f/cozVt64GHPB8wGq2drRs0gke56sgCMFggQ3ikKvGpCVoPtquC5GCwxll4o5O9/N3YOh9XZOfJ/1lPmyViIe4xb7n6IUd/vY+XBQRUlheDF21wrMDOwy9U1j6BxnGGzU8o7e1Eu6Df4u7dY/lflakePI7emwZCQblOE27gBJr6KR73I5vIZXFGOkr7FjjlKTA1Ddu6niRQmmTJA26YvIbI54R4DrKpT38xnWmakp5gnLD0rUk4fBGjC7Uq0q/E3Z4MeH/8sVWOTxBkfPNDz9JSeQTY8p4dJqyym0ebV6accq4CrbxjkzGqV2TiGDSzSBDpAsdbl+bJmoHSYAnIJx9br5JVCK4PM1wAj+nI62U4r7zrIde4+KBsyPkaklS50m/hb037TI2/lfWCcq7ecKY54K3XiWUg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39860400002)(346002)(376002)(366004)(396003)(136003)(33430700001)(2906002)(33440700001)(4326008)(86362001)(66946007)(316002)(2616005)(76116006)(66476007)(91956017)(71200400001)(54906003)(478600001)(5660300002)(66556008)(66446008)(6916009)(64756008)(6512007)(186003)(8676002)(8936002)(26005)(6486002)(6506007)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Pqfp3u39pQqf72F6k+lZj3J5JGR+G1TLi1EOKKCfqbzRhPd+nYl4YyKZ+wzpxkNHUAjkceSQGcWxCouCHlMfhO/5SVUlecErRXNqNpfCtaax/hvAArm+YZUsxPqdkRmUwFFLQJaqhtkam8YTFCAagE9FkMrmeKCV5H7VcdwSS6BPzKD2BLPo3ze98tFND30HmFfvmUjqD9FsYq8UIUpdKEXUXfanmJ8ygezAE55la8PULiD9W3gDcnYCy+xJadFrmcUoPfUfNH6iSJKDCBb5L0UmGuaIYKUvf9uXGjmsRmIhY5gAf9yS8XJReM8wKa0xRMxA9WU8QIDVq+0q50tBV7PdFKF52oxgggcKkd07E5zVjlUtr7EMHuW/KXmMbBN3GtEdu/AgPIe3BABedkoVscOYGKMDj4Nf0SiNRyDuexHXalnqD/dTb+qB6tDKvkCLrLTTOIbhp/sVvpcW5PAffO7XJMISDTDwlDpFxqkdoec=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <8DEBE93DF2434843BE449C814EA84673@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 49c2576c-e6cc-445a-366e-08d7f65aff8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2020 09:58:19.0032
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J9NAmj8j0qcrb58fIYOAGRbKbp1ch2DjAlEvRIo0pVH8nH9LqnvDioEqNTz3WxN55U8plF4Vh3wdLAbtjj0W2ccIwX9RR1qC0Poeejp5Crg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3754
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gTW9uLCAyMDIwLTA1LTExIGF0IDE4OjMzICswMjAwLCBHcmVnIEtIIHdyb3RlOg0KPiBFWFRF
Uk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNz
IHlvdQ0KPiBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIE1vbiwgTWF5IDExLCAy
MDIwIGF0IDAyOjQ2OjU4UE0gKzAwMDAsIA0KPiBDaHJpc3RpYW4uR3JvbW1AbWljcm9jaGlwLmNv
bSB3cm90ZToNCj4gPiBPbiBNb24sIDIwMjAtMDUtMTEgYXQgMTM6NDcgKzAyMDAsIEdyZWcgS0gg
d3JvdGU6DQo+ID4gPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4g
YXR0YWNobWVudHMgdW5sZXNzIHlvdQ0KPiA+ID4ga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+
ID4gPiANCj4gPiA+IE9uIE1vbiwgTWF5IDExLCAyMDIwIGF0IDExOjUxOjE1QU0gKzAyMDAsIENo
cmlzdGlhbiBHcm9tbSB3cm90ZToNCj4gPiA+ID4gVGhpcyBwYXRjaCBhZGRzIHRoZSBNT1NUIFVT
QiBhZGFwdGVyIGRyaXZlciB0byB0aGUgc3RhYmxlDQo+ID4gPiA+IGJyYW5jaC4NCj4gPiA+ID4g
VGhpcyBpcw0KPiA+ID4gPiBhIGZvbGxvdy11cCB0byBjb21taXQgPGIyNzY1Mjc+Lg0KPiA+ID4g
DQo+ID4gPiBJIGRvIG5vdCB1bmRlcnN0YW5kIHRoZSAiYSBmb2xsb3ctdXAuLi4iIHNlbnRhbmNl
LiAgQWx3YXlzIHVzZQ0KPiA+ID4gdGhlDQo+ID4gPiBmb3JtYXQgb2Y6DQo+ID4gPiAgICAgICAg
IGIyNzY1Mjc1MzkxOCAoInN0YWdpbmc6IG1vc3Q6IG1vdmUgY29yZSBmaWxlcyBvdXQgb2YgdGhl
DQo+ID4gPiBzdGFnaW5nIGFyZWEiKQ0KPiA+ID4gd2hlbiB3cml0aW5nIGtlcm5lbCBjb21taXRz
IGluIGNoYW5nZWxvZ3MuDQo+ID4gPiANCj4gPiA+IEFsc28sIHRoYXQgY29tbWl0IGRvZXNuJ3Qg
cmVhbGx5IG1lYW4gYW55dGhpbmcgaGVyZSwgdGhpcyBpcyBhDQo+ID4gPiBzdGFuZC1hbG9uZSBk
cml2ZXIgZm9yIHRoZSBtb3N0IHN1YnN5c3RlbS4gIFRoaXMgY2hhbmdlbG9nIG5lZWRzDQo+ID4g
PiB3b3JrLg0KPiA+IA0KPiA+IFB1cnBvc2Ugd2FzIHNoYXJpbmcgdGhlIGluZm9ybWF0aW9uIHRo
YXQgdGhpcyBpcyBwYXRjaCBpcw0KPiA+IG9ubHkgb25lIHBhcnQgb2YgbW92aW5nIHRoZSBjb21w
bGV0ZSBkcml2ZXIgc3RhY2suIFRoYXQgYQ0KPiA+IGZpcnN0IHN0ZXAgaGFzIGFscmVhZCBiZWVu
IGRvbmUgYW5kIG90aGVycyBhcmUgdG8gZm9sbG93Lg0KPiA+IEJ1dCB5b3UncmUgcHJvYmFibHkg
cmlnaHQgYW5kIG5vYm9keSByZWFseSBuZWVkcyB0byBrbm93Lg0KPiA+IA0KPiA+IEknbGwgc2tp
cCB0aGlzLg0KPiA+IA0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gR3JvbW0gPGNo
cmlzdGlhbi5ncm9tbUBtaWNyb2NoaXAuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gIGRyaXZl
cnMvbW9zdC9LY29uZmlnICAgICAgICAgIHwgICAgNiArDQo+ID4gPiA+ICBkcml2ZXJzL21vc3Qv
TWFrZWZpbGUgICAgICAgICB8ICAgIDIgKw0KPiA+ID4gPiAgZHJpdmVycy9tb3N0L3VzYi9LY29u
ZmlnICAgICAgfCAgIDE0ICsNCj4gPiA+ID4gIGRyaXZlcnMvbW9zdC91c2IvTWFrZWZpbGUgICAg
IHwgICAgNCArDQo+ID4gPiA+ICBkcml2ZXJzL21vc3QvdXNiL3VzYi5jICAgICAgICB8IDEyNjIN
Cj4gPiA+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiA+
IA0KPiA+ID4gV2h5IG5vdCBqdXN0IGNhbGwgdGhpcyBmaWxlIG1vc3QtdXNiLmMgc28geW91IGRv
bid0IGhhdmUgdG8gZG8NCj4gPiA+IHRoZQ0KPiA+ID4gMi1zdGVwIE1ha2VmaWxlIHdvcmsuICBB
bHNvLCB3aHkgYSB3aG9sZSBzdWJkaXIgZm9yIGEgc2luZ2xlIC5jDQo+ID4gPiBmaWxlPw0KPiA+
IA0KPiA+IFRvIGtlZXAgdGhlIHN0YWdpbmcgbGF5b3V0Lg0KPiANCj4gTm8gbmVlZCB0byBkbyB0
aGF0LCB0aGlzIGlzIGEgbmV3IGxheW91dCA6KQ0KPiANCj4gPiA+ID4gKyNkZWZpbmUgcHJfZm10
KGZtdCkgS0JVSUxEX01PRE5BTUUgIjogIiBmbXQNCj4gPiA+IA0KPiA+ID4gWW91IHNob3VsZG4n
dCBuZWVkIGFueSBwcl8qKCkgY2FsbHMgYmVjYXVzZSB0aGlzIGlzIGEgZHJpdmVyIGFuZA0KPiA+
ID4geW91DQo+ID4gPiBhbHdheXMgaGF2ZSBhY2Nlc3MgdG8gdGhlIHN0cnVjdCBkZXZpY2UgKiBp
dCBjb250cm9scy4gIFNvIGRyb3ANCj4gPiA+IHRoaXMNCj4gPiA+IGFuZA0KPiA+ID4gZml4IHVw
IHRoZSByZW1haW5pbmcgcHJfKigpIGNhbGxzIHRvIGJlIGRldl8qKCkgaW5zdGVhZC4NCj4gPiAN
Cj4gPiBUaGVyZSBhcmUgaGVscGVyIGZ1bmN0aW9ucyB0aGF0IGFjdHVhbGx5IGRvbid0IGhhdmUg
YWNjZXNzIHRvIHRoZQ0KPiA+IHN0cnVjdCBkZXZpY2UgYW5kIGl0IGZlbHQgbGlrZSBhbiBvdmVy
aGVhZCB0byBwYXNzIHRoZSBkZXZpY2UNCj4gPiBwb2ludGVyIGp1c3QgZm9yIGxvZ2dpbmcgcHVy
cG9zZXMuDQo+IA0KPiBwcl8qIGNhbGxzIHNob3cgYWxtb3N0IG5vdGhpbmcgd2hlbiBpdCBjb21l
cyB0byB0aGUgYWN0dWFsDQo+IGRldmljZS9kcml2ZXINCj4gYmVpbmcgYWZmZWN0ZWQuICBUaGF0
J3Mgd2h5IHRoZSBkZXZfKigpIGZ1bmN0aW9ucyBhcmUgdGhlcmUsIHBsZWFzZQ0KPiB1c2UNCj4g
dGhlbS4NCj4gDQo+ID4gPiA+ICsvKioNCj4gPiA+ID4gKyAqIHN0cnVjdCBtb3N0X2RjaV9vYmog
LSBEaXJlY3QgQ29tbXVuaWNhdGlvbiBJbnRlcmZhY2UNCj4gPiA+ID4gKyAqIEBrb2JqOnBvc2l0
aW9uIGluIHN5c2ZzDQo+ID4gPiA+ICsgKiBAdXNiX2RldmljZTogcG9pbnRlciB0byB0aGUgdXNi
IGRldmljZQ0KPiA+ID4gPiArICogQHJlZ19hZGRyOiByZWdpc3RlciBhZGRyZXNzIGZvciBhcmJp
dHJhcnkgRENJIGFjY2Vzcw0KPiA+ID4gPiArICovDQo+ID4gPiA+ICtzdHJ1Y3QgbW9zdF9kY2lf
b2JqIHsNCj4gPiA+ID4gKyAgICAgc3RydWN0IGRldmljZSBkZXY7DQo+ID4gPiANCj4gPiA+IFdh
aXQsIHdoeSBpcyBhIFVTQiBkcml2ZXIgY3JlYXRpbmcgc29tZXRoaW5nIHdpdGggYSBzZXBhcmF0
ZQ0KPiA+ID4gc3RydWN0DQo+ID4gPiBkZXZpY2UgZW1iZWRkZWQgaW4gaXQ/ICBTaG91bGRuJ3Qg
dGhlIG1vc3QgY29yZSBoYW5kbGUgc3R1ZmYgbGlrZQ0KPiA+ID4gdGhpcz8NCj4gPiANCj4gPiBU
aGUgZHJpdmVyIGFkZHMgYW4gQUJJIGludGVyZmFjZSB0aGF0IGJlbG9uZ3MgdG8gVVNCIG9ubHku
IFRoaXMNCj4gPiBrZWVwcw0KPiA+IHRoZSBjb3JlIGdlbmVyaWMuDQo+IA0KPiBTbyB0aGlzIHNh
bWUgdHlwZSBvZiB0aGluZyBpcyBhbHNvIG5lZWRlZCBpbiB0aGUgb3RoZXIgYnVzDQo+IGNvbnRy
b2xsZXJzDQo+IChzZXJpYWwsIGkyYywgZXRjLik/DQo+IA0KPiBDcmVhdGluZyBhIG5ldyBkZXZp
Y2UgaW1wbGllcyBpdCBsaXZlcyBvbiBhIGJ1cywgYW5kIGFsbW9zdCBhbHdheXMNCj4gdGhlDQo+
IGJ1cyBjb2RlIGZvciBjcmVhdGluZy9tYW5hZ2luZyB0aGF0IGNvZGUgbGl2ZXMgaW4gYSBzaW5n
bGUgcGxhY2UsIG5vdA0KPiBpbg0KPiB0aGUgaW5kaXZpZHVhbCBkcml2ZXJzLiAgV2h5IGRvZXNu
J3QgdGhlIG1vc3QgY29yZSBoYW5kbGUgdGhpcz8gIFdoYXQNCj4gZG9lcyB0aGUgbW9zdCBjb3Jl
IGRvPyAgOikNCg0KVGhlIGNvcmUgbW9kdWxlIG1hbmFnZXMgdGhlIGJ1ZmZlcnMsIHJvdXRpbmcs
IGNvbmZpZ3VyYXRpb24sDQpzeXNmcy9jb25maWdmcyBhbmQgdXNlciBzcGFjZSBpbnRlcmZhY2Ug
KHZpYSBpdHMgY29tcG9uZW50IG1vZHVsZXMpDQpmb3IgY29tbW9uIGNvbW11bmljYXRpb24gY2hh
bm5lbHMuIFRoZSBEQ0kgaW50ZXJmYWNlIGlzIG9ubHkgYXZhaWxhYmxlDQp3aGVuIHRoZSBoYXJk
d2FyZSBpcyBjb25uZWN0ZWQgdmlhIFVTQi4gT3RoZXIgY29ubmVjdGlvbnMgZG8gbm90DQpwcm92
aWRlIHRoaXMuDQoNClRoYXQncyB3aHkgSSB3YW50IHRoZSBtb2R1bGUgdGhhdCBhY3R1YWxseSBp
bnRyb2R1Y2VzIHN1Y2ggYW4NCmludGVyZmFjZSAoYW5kIGhhcyBhbGwgdGhlIG5lY2Vzc2FyeSBp
bmZvcm1hdGlvbiBhYm91dCBpdCkgdG8gYmUgaW4NCmNoYXJnZS4gVGhpcyBrZWVwcyB0aGUgY29y
ZSBjb2RlIHNpbXBsZXIsIGFzIFVTQiBpc24ndCBhbHdheXMgdXNlZC4NCg0KQWxzbywgYSBuZXcg
ZGV2aWNlIGlzIG5lZWRlZCB0byBjcmVhdGUgdGhlIGRlc2lyZWQgc3lzZnMgbGF5b3V0LA0KaW4g
d2hpY2ggdGhlIGRjaSBpbnRlcmZhY2UgaXMgcmVwcmVzZW50ZWQgd2l0aCBhIG5ldyBzdWIgZGly
ZWN0b3J5Lg0KDQoNCnRoYW5rcywNCkNocmlzDQo=
