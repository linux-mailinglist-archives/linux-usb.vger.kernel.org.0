Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B144A1D3710
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 18:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbgENQ4K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 12:56:10 -0400
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:16768 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbgENQ4J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 12:56:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589475368; x=1621011368;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=u/VF/DB5xdlkFqlR9pRWeHKoPoRyOceF987pS97xGZY=;
  b=y6SZrnCDzYZ0YFC5TbVUy8d8pa/F9ABPhUdnAVOC1RrCrs/eL5ntk/Nj
   /Pth+vr7SDCZWGQ+1aBYDBKDEAN/AFZQNTcTYT9eWcpGpu5jJsJL0dFrr
   rqmKuMZCPgvStgSG6IsxsR/S/3lfkm6BNFhG89mEiLCvgXYr/yTdC5ue6
   enUnrQ2EO80qJRCtO52xfCNIiA8MBnQFnKmUDf5zsaGZBoeBh67o3LWr9
   M/bKvJLvsIn6n/CVBSkuVp9u6lRmhhnxKUboyzuZp0CDtOfvdqgTvwz+n
   l0pY/a6/I6jn2cz4t7nwXOcLQtodCpsrSW26GtGjgFFR7Bq9GBLOguw11
   w==;
IronPort-SDR: 7Y3wz+qRQUPEjyxrbVSQyaxpvCCx/8EZsbNveWCzslqBhPyWDtG4eoMoyDvyKT1Glm7/lUi5va
 oqLyydM33jzAGMcQ8c0Q3HhYVCArSz7cX0PqkRjCUdRjlfzIxAOmRuuO9TUracvLNB6BbUqde9
 0BVCvpWMGRIqOjCYJhFuo6UqK3ZsKHgByFiypAGnMM3iFuN9Pg4upWhg4K0WKL6T5v6vXmKDNk
 rF9sILnYkqlAIQHJ81ZFBPdBnuT96YwZ6olumHwWKKEVa8JuMZeG99Smuh01v2RgfWqWjF5/aA
 CEI=
X-IronPort-AV: E=Sophos;i="5.73,392,1583218800"; 
   d="scan'208";a="12394719"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 May 2020 09:56:08 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 14 May 2020 09:56:08 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 14 May 2020 09:56:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bX532sEpYuhWpOuQ9DkT65EcQP4dQU52O4JsbYg8g1hAdBOOOSfuljNcp8OMnMkRUaHZR6PpT8eVsCLktzNGMvpqjn/0ITmQI3uyoQWJcJ7StDn67RNCEPokwqJfCgwDJQY3A/pBsohdZNI9KRSJK/Jnc71dEYWvklQjJQGv6qec0R7gkxfJE3BPfNVRkYj/7+GpdEX3uhw6ZoCeREGls/A+WbjCNWRWIaw6lWoStxj7sMQoQ57qVbpq/qZbgL77aL//ghuh+5TegC4orIIqMRXmgTcMajaksBvCqQpld9xXGUUqmH/n7biKGtl4TMyEQ/kX2fKcFPTpMNoX5sECdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/VF/DB5xdlkFqlR9pRWeHKoPoRyOceF987pS97xGZY=;
 b=abDirenZMURJUnqs3cH8vA6PuVz371py5E4oeXXhS8HwQ+Wb77j0EeUDg516289A2Ej/UJkoBfXFvhZ28azBSpa+BykwEFWcYNFBCCYWPFR5zgOrEG220BEsQtpPg3FyJwCZjC7ouKxvS9W2E5aN8EJZNcp4KayY8ZXZVhjQQBBbAwPvMkqc1tiFS2thrwFL+Dn3PFP0C7VvZZF/v91B3gIL62+iR05JF6HPlKGFI9GXkcMtU2nJ+iIkCNsQ4ZFbUYhxHhtU+A4vOKIDtSJ9BwbueflivduHr95ypc2m7Z9k6rKJZA1x3OQ+09OziYwRPMs4iwjf8sL27Ada3xZ6MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/VF/DB5xdlkFqlR9pRWeHKoPoRyOceF987pS97xGZY=;
 b=R9/dYEHoN56OT8J6kYKkUmukdpnKV7oOf6tyk9He0WxOeGrymMJSeELGz+bC9AuUmihuJQ8ex7DTzaowDWfhXjUizDTx5e+DhR2LYFkxR956N7JOKberc5D7j++ny+t7i44lctBNFxhQyQARminHfKmK4P94ixfVB5KVug/spxg=
Received: from DM6PR11MB3420.namprd11.prod.outlook.com (2603:10b6:5:69::31) by
 DM6PR11MB3899.namprd11.prod.outlook.com (2603:10b6:5:19c::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.26; Thu, 14 May 2020 16:56:06 +0000
Received: from DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::e8fd:29e5:1fa6:c01d]) by DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::e8fd:29e5:1fa6:c01d%5]) with mapi id 15.20.2979.033; Thu, 14 May 2020
 16:56:06 +0000
From:   <Christian.Gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 3/7] staging: most: usb: check number of reported
 endpoints
Thread-Topic: [PATCH 3/7] staging: most: usb: check number of reported
 endpoints
Thread-Index: AQHWKfYqq84KdWH3xEChn9R62lWpjKinndeAgAAvWYA=
Date:   Thu, 14 May 2020 16:56:06 +0000
Message-ID: <7db036e80b554d7e0c1e07330f71dd7d1cb07d29.camel@microchip.com>
References: <1589463989-30029-1-git-send-email-christian.gromm@microchip.com>
         <1589463989-30029-4-git-send-email-christian.gromm@microchip.com>
         <20200514140637.GE2581983@kroah.com>
In-Reply-To: <20200514140637.GE2581983@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.5-1.1 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [46.142.165.223]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 367d088a-442b-4060-e289-08d7f827b1a0
x-ms-traffictypediagnostic: DM6PR11MB3899:
x-microsoft-antispam-prvs: <DM6PR11MB389942DFE68C303FDA71EE7AF8BC0@DM6PR11MB3899.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 040359335D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PaOyNpwItEGmeIovlpeF18U8yVeJeaOcO9urWsHf976wAqty5s0MLS5je2qEVJQ7PtBPOjatMiJIWtw4xPvNzX53dGUCtmLJsnikPGfmLsh448zTGxyn/iZJc1Tcp3o5EZ/13tQe+shtNegVSbILVjniHXYBdypZVhUTk+PELd4yhkihyJSVwYRoiynXbG1Afj9v3U0eAJ4ofYl2qLlfaaRvLY34QNLC7M39FGv6ttisfl17mQQIA7dosl26+mtheMPlBNnsTzxuNjVNt8c/Jlt7+xfBbanLggfFmP2orfocqXoUThATDm3a+AdZD/rwwKTQYMn7cLCIuPOWL1BSM4BHDjKILyZS3flDmnD5B6CbzhvlFlozOl2KG2dKe4buC4DaZYW5OIIX2u+wXyXq80WkBJy2vpy3S3uKgj7OhA6qaJw79hDK3ZAxDFThFLyi
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(346002)(376002)(366004)(39860400002)(136003)(36756003)(8936002)(8676002)(2906002)(4744005)(6486002)(71200400001)(5660300002)(316002)(26005)(186003)(86362001)(54906003)(6506007)(66946007)(64756008)(6512007)(76116006)(91956017)(2616005)(6916009)(66446008)(66556008)(66476007)(4326008)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: mLrxhIeCO08eBjL3PLBd0IlZocxFGmXXtaPRBz+zHGKPbuA59aba9pRQ3dqMd8rWXRlzrfJ3egTEng2MVgS/ND5rZCX2KNDP2aqlkXIglCjNFmzW4bGYmahUX4cWWqwe+7lRXDv3g5gbOfycxX+AwJw0L4kxqWWycN40SYJwao/RwBcxby6WTIY+YBIbxVKNdRcOzZQ6A+nsEHsHen0+83NmJmE/Til5sJhYuNC9+h5I5FJUZgpiCfuRnBd8iCIcoebyefxb6cvA/hhgxGR0nYw/GQ9cPZJ9g+Afnjz95em+JMefetOWGfleryqLvXWNgx0CA8W0543xKoM+Br7WPzMYlyLGVgVrGuqUM3r89xluBfH8rtWn4eo2C3gFkDwxTDVCwgr6CBcCYqhTe1OdR2cKZlL6gidR6ADCwdQ5lgpWNz5nhv32vF68gqHjLVwtMAb+Dls1iuPS/loM/i5vKSkNbaTtKnLTMfFDFQ2YCcdjn+D43upSmcUxE1BfxXIF
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <2A15E9EFFB1D6944AA6AD3349CFACF3F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 367d088a-442b-4060-e289-08d7f827b1a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2020 16:56:06.2309
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z3fCNeTSX8HB9PduB6JyMJXqwjQy1dgF44oL19e6TXvZRYlGXHl250LHUhvul1AupZJG13faxoM/sZML13POv19kwjomQPQ+waOqK+020R8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3899
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCAyMDIwLTA1LTE0IGF0IDE2OjA2ICswMjAwLCBHcmVnIEtIIHdyb3RlOg0KPiBFWFRF
Uk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNz
IHlvdQ0KPiBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIFRodSwgTWF5IDE0LCAy
MDIwIGF0IDAzOjQ2OjI1UE0gKzAyMDAsIENocmlzdGlhbiBHcm9tbSB3cm90ZToNCj4gPiBUaGlz
IHBhdGNoIGNoZWNrcyB0aGUgbnVtYmVyIG9mIGVuZHBvaW50cyByZXBvcnRlZCBieSB0aGUgVVNC
DQo+ID4gaW50ZXJmYWNlIGRlc2NyaXB0b3IgYW5kIHRocm93cyBhbiBlcnJvciBpZiB0aGUgbnVt
YmVyIGV4Y2VlZHMNCj4gPiBNQVhfTlVNX0VORFBPSU5UUy4NCj4gPiANCj4gPiBTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RpYW4gR3JvbW0gPGNocmlzdGlhbi5ncm9tbUBtaWNyb2NoaXAuY29tPg0KPiA+
IFJlcG9ydGVkLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24u
b3JnPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3N0YWdpbmcvbW9zdC91c2IvdXNiLmMgfCAxMyAr
KysrKystLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDcgZGVs
ZXRpb25zKC0pDQo+IA0KPiBUaGlzIGlzIGEgYnVnZml4IHRoYXQgc2hvdWxkIGdldCBiYWNrcG9y
dGVkIHRvIHN0YWJsZSBrZXJuZWxzLCByaWdodD8NCj4gDQoNClJpZ2h0LiBJIGFscmVhZHkgc2Vu
dCBvdXQgYSB2MiBvZiB0aGUgc2VyaWVzLg0KU2hvdWxkIEkgcmVzZW5kPw0KDQp0aGFua3MsDQpD
aHJpcw0KDQo=
