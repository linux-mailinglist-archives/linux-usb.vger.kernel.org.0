Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF4E232102
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jul 2020 16:53:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbgG2Oxe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jul 2020 10:53:34 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:38278 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726868AbgG2Oxd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jul 2020 10:53:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1596034413; x=1627570413;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Ih3jT1SRgMIE5v+hPFQ0z1js6Bv6lEfREiyBuJb+xCI=;
  b=XU2rcNxDX/ccpqi77sNFUgIQLesLb3U1/mKKIcPHgbnhjuUtyEjZGRm6
   6PtIritvS9udjPet+XoYZNAXHbvkKMZF+QBmaKVcEf6nD9Nirn3qPoe2m
   MQZGVNSWvosg/DfmO9Ul3foyAXsLJgd5jplE82CLjyjArLVrzNXkrJZ3x
   TpYtS9KvI8SmKSZBz+rmwirm2nrKPhZRCmoiChkF27KOqiFQDpIgdvjuH
   uUNMa08imtMJlyMVzvSeO/4nSRRzmNlepwkaXiNr4dnScUwUUgeFkRFH2
   mvyWgRStNMcOiyKqE4+MfQIOXqUFG7tFd8010+A7JBVbCGXKTbGHYmOY6
   g==;
IronPort-SDR: kI5Z+p8x/xpcqkBbqlGSrfUXW3YUCNnu9/tmaTM+cZrbcJ7PGavl+g8wiS2j64wxmalvJ7sm95
 CAuCsnx1snzldcuc6gz/6/XiNCf+Sqsk33znCV+uWi8yhfBl0gKcyXT/Wgrk+21fd7jihS1R+t
 c4UpQw+S/95CPHBldEWr0GVNihVURC7J8TrjY6d8jxzKoykPfXPkh/JeF1idMzUR65kce09yhP
 UA0M4bFDCiaz+tYjjTvfirA2FFJpWrx52tPTt7Q7CZeBa2whKHpweOxQfA4QuVvRNV0I0X4wfJ
 m+U=
X-IronPort-AV: E=Sophos;i="5.75,410,1589266800"; 
   d="scan'208";a="81644772"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Jul 2020 07:53:32 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 29 Jul 2020 07:53:31 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Wed, 29 Jul 2020 07:52:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LfbDItqveVixq5wXX3CL6fn8oF/4JEHX7KGyW4hhJ/+QYXGf5dYyHS2UkxGLVHN1hA20rsvrbO3U7HDPmVpf3UECux76nttsDrXU0eD8kEE0nlzitzkdKJGCK1LHajvu95vrFnjXh7mFyoZ7UdL4JEH5y0K0z4BelLaYI9d5wy70o/cJcYOz3+G/+dwg5me7Hi1iX+h1dTIrG/zSu+JuJoXckfr+gHSqwE+fJRkfPGUTou53FFL7Helb0JPwjT0tR2S2J2b1CvFFv3TrC3RiPRWNMOjc/3TaGHVO+Om0pR1Szsr66ReLp0vFUUMm4UYyNAlewRlvroKnUxEUb8ee8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ih3jT1SRgMIE5v+hPFQ0z1js6Bv6lEfREiyBuJb+xCI=;
 b=epOzDrLWD5Y86fglg4D6Mx+0vSs8ITUI6uV6vua1OsDSViesTXNVFJkbOwpyhxZvPx/K48m5j/lkdSkdtGZmgPXuM95MkNeizW+Y3Ekox6jWPluBrp0E2OYNyUGX1+MHrIr7NmRLfC67YVEY0hgzpEZq2jLb42Xg6d5XOyFqKc92lk28kWXb4V3egWlODf2eth9Gh5wVVgCkhM/iH/oNG2Znrn0sTrBcwZ3ZfzwSuksYTdOvwBrlGofPtYr/omNfqIYO//dLnWEqY32rWN0NF0l8QFt7rbnTTMVCM89u8Dw1rhyYDwdOxQ9v6yQ/UMLCve6gMsQQdrKYZaUO+3vArw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ih3jT1SRgMIE5v+hPFQ0z1js6Bv6lEfREiyBuJb+xCI=;
 b=Dfh+b0eYIWvSN1+ztEMdZQUC3GqOUC32hT2HbdHOpidiheKFXvb3r/Q921YullTETBlV2vTgtOahfjW5ageh2NnOvL8NrOtHHSrhwh9lU+06YvK8Ig++tq0IAZJbpO+0KDHtdo5AA+s/KEDQxViYGGoLe88KNGM3HySSwCnJQDc=
Received: from DM6PR11MB3420.namprd11.prod.outlook.com (2603:10b6:5:69::31) by
 DM5PR1101MB2266.namprd11.prod.outlook.com (2603:10b6:4:57::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.26; Wed, 29 Jul 2020 14:53:29 +0000
Received: from DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::e8b2:1d82:49d9:f4b]) by DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::e8b2:1d82:49d9:f4b%6]) with mapi id 15.20.3216.033; Wed, 29 Jul 2020
 14:53:29 +0000
From:   <Christian.Gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>
Subject: Re: [RESEND PATCH v5] drivers: most: add USB adapter driver
Thread-Topic: [RESEND PATCH v5] drivers: most: add USB adapter driver
Thread-Index: AQHWY/BDxH5Yo94YUUW0M5xBKSbJ9qkeoNWAgAAHQYA=
Date:   Wed, 29 Jul 2020 14:53:29 +0000
Message-ID: <799deccc9cd874a2f36bbe93f9b880eea018197f.camel@microchip.com>
References: <1595838646-12674-1-git-send-email-christian.gromm@microchip.com>
         <20200729142715.GA3343116@kroah.com>
In-Reply-To: <20200729142715.GA3343116@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [62.154.213.229]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d133b217-143b-42f0-0c36-08d833cf2834
x-ms-traffictypediagnostic: DM5PR1101MB2266:
x-microsoft-antispam-prvs: <DM5PR1101MB2266AD93E41906AAA32F9B3CF8700@DM5PR1101MB2266.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EvNvG80V9wzIS0abEHXWuynU5dIfvdpKf6tpFQ6FHZXsPKGPbpKp6/c/AZcthx4XsCtqowa9od8uR2Iq2wPw+oTkQuQ4gx+7lnnQxolDSRhULqFZ6Ck4bLSq4mGysVp+I0x/D+W2kIN7EMfBvxG3kyCBO19FScaLz+b2jm5WwdlfMVPfQg/Xk//DfaIaj412R+hm6EXeJwhhb/PRDwMX9L+DWRSlc6GVANdUSbUZUDVxFE2JL4NTJzd+gFp//vTPc9/3dUNB89PjbCvoVXL67OeitpVVKgUPBhTA5ZaV5lsHzRLcgfhDf9jqu3wy+6KTQ7adh3t7ah44VnI882EJGg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39860400002)(136003)(346002)(376002)(366004)(396003)(86362001)(8936002)(4326008)(2906002)(36756003)(71200400001)(8676002)(316002)(54906003)(478600001)(6916009)(26005)(64756008)(66556008)(66946007)(66476007)(6486002)(5660300002)(186003)(6512007)(6506007)(91956017)(66446008)(2616005)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: uZK1wSG9aNfzIr/jD5IXsKaEgRKh9yhbR3/WrEhL9AcPZsKdlyOrTwcGgvtgcig2YbpUtc86DzBJs3+K9aJZLyqrPTMk/03sGb+gEXyBAKBxWFEw2QZ0WdYpAA1OArSb7qMnd1mFuvroeU9HvkuI5X7mezhcQWWVL1pGt8oO9YrisFVgxIwftmNw+1glf2iUxnyXBmhaAfQwgk2tfiOdwXAbSA435ZUgdtEvZoCJ++n6YgAA5Pj7La1trdrEu9zcHl241LUOBt2kVoiI0JMgzi9jhRzVaaJMl06ifetCeF1EuSDPPqzzC/8FInNBrsQ5mzTg3FuYhrr8WPVgY22RSq3qaMWOfgvIG3EH+XjaYUDdtKCNVv96rs1cvNG+7cu4qSb+uYpy+T3gSTZ9aO0B+ZB/Cw1pX60rClBFnjuqpFhjKI/5Q70sGuel8QNp3f5bXw5t3FNZAMe7Dvf6W1JvSTZZuFJKu7Abr9jLlEUBIIBqtb0yeT4bZPmh+V/gCUwV
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <5C633C0947D22240B82036E3E11809DF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3420.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d133b217-143b-42f0-0c36-08d833cf2834
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2020 14:53:29.8341
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FOx6r8gIlsKRL2dJ7B/TWTTKGj43xVMaToflJ45vlJ2w4IoameiM47Xyb0ekqc9nagHx7A3ag0QCNUR5DrVYjsHrQyUWqbWKZ/X5c9MsmlE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2266
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gV2VkLCAyMDIwLTA3LTI5IGF0IDE2OjI3ICswMjAwLCBHcmVnIEtIIHdyb3RlOg0KPiBFWFRF
Uk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNz
IHlvdQ0KPiBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIE1vbiwgSnVsIDI3LCAy
MDIwIGF0IDEwOjMwOjQ2QU0gKzAyMDAsIENocmlzdGlhbiBHcm9tbSB3cm90ZToNCj4gPiBUaGlz
IHBhdGNoIGFkZHMgdGhlIHVzYiBkcml2ZXIgc291cmNlIGZpbGUgbW9zdF91c2IuYyBhbmQNCj4g
PiBtb2RpZmllcyB0aGUgTWFrZWZpbGUgYW5kIEtjb25maWcgYWNjb3JkaW5nbHkuDQo+ID4gDQo+
ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEdyb21tIDxjaHJpc3RpYW4uZ3JvbW1AbWljcm9j
aGlwLmNvbT4NCj4gDQo+IFNvcnJ5IGZvciB0aGUgbG9uZyBkZWxheSBpbiBnZXR0aW5nIHRvIHRo
aXMuDQo+IA0KPiBUaGlzIGxvb2tzIGdvb2QgdG8gbWUsIGJ1dCBJIHRyaWVkIHRvIGFwcGx5IGl0
IHRvIG15IHVzYiB0cmVlLCBhbmQgb2YNCj4gY291cnNlIEkgZ2V0IHRoZSBmb2xsb3dpbmcgYnVp
bGQgZXJyb3I6DQo+ICAgICAgICAgZXJyb3I6IHRoZSBmb2xsb3dpbmcgd291bGQgY2F1c2UgbW9k
dWxlIG5hbWUgY29uZmxpY3Q6DQo+ICAgICAgICAgICBkcml2ZXJzL3N0YWdpbmcvbW9zdC91c2Iv
bW9zdF91c2Iua28NCj4gICAgICAgICAgIGRyaXZlcnMvbW9zdC9tb3N0X3VzYi5rbw0KPiANCj4g
U28sIGNhbiB5b3UganVzdCBzZW5kIGEgInJlbmFtZSB0aGUgZmlsZSIgcGF0Y2ggdGhhdCBJIGNh
biBhcHBseQ0KPiBhZ2FpbnN0DQo+IG15IHN0YWdpbmctbmV4dCBicmFuY2ggYW5kIEkgd2lsbCB0
YWtlIGl0IHRocm91Z2ggdGhlcmUgc28gdGhhdCB0aGVyZQ0KPiBhcmUgbm8gY29uZmxpY3RzIGxp
a2UgdGhpcz8NCg0KQXJlIHlvdSB0YWxraW5nIGFib3V0ICgxKSBhIHBhdGNoIHRoYXQganVzdCBy
ZW5hbWVzIHRoZSBtb3N0X3VzYi5rbw0KZmlsZSBsb2NhdGVkIGF0IGRyaXZlcnMvc3RhZ2luZy9t
b3N0L3VzYi8gb3IgKDIpIGEgcGF0Y2ggZm9yIHRoZQ0KTWFrZWZpbGUgaW4gdGhlIHN0YWdpbmcg
dHJlZSwgc28gdGhlIEtidWlsZCBzeXN0ZW0gY3JlYXRlcyBhIG5ldw0Ka2VybmVsIG9iamVjdCBp
biB0aGlzIGJyYW5jaCB3aXRoIGEgZGlmZmVyZW50IG5hbWU/DQoNCnRoYW5rLA0KQ2hyaXMNCg0K
