Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3CEC6B10C8
	for <lists+linux-usb@lfdr.de>; Wed,  8 Mar 2023 19:13:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbjCHSNU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Mar 2023 13:13:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjCHSNP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Mar 2023 13:13:15 -0500
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2046.outbound.protection.outlook.com [40.107.96.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BFB41BD6
        for <linux-usb@vger.kernel.org>; Wed,  8 Mar 2023 10:12:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QcnDiPKtuJuD0H2Rp/FHtJtx/DlvWXh5HNm+YqCGocPBnMU+5xNRdGT+jXd8cEIxIBuCU83HTEdBLXSPrieAuQgKkMeZGXTbb7f3Vi0nW3KFKfdW+y3xd/wJv5iWMzPa0Lv8EvoFsu+TgPDcy7rBfADntnLlLon+kH83IRWEnVC315E0RuJ9sphZ3Drl+t7tskpaoKHvv6Ut6iIXTUgqgtap9mOgokI2aSJHVZfaNc279j6x4LyH6Cm3+OU4Ljsty7QDhdHbD5bM0IYkUP2lt01J+Gfj6dW7tlPSwv3BSPtyCnF+t1wMVi4eIb+6putrBM7Pm2JXRK+ZC4y3qvihmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tl4fMvXv4x4E2bKh5w7jjIASxQR9iSCPSVPi3cdCkmo=;
 b=Scw7h/9mWCSuJ7yUla8xznXQD5HBMNRny+m/jfCwpsjXYEX/SWkmCAK9IyeYKUdoca/BfaSn7p6DiVRc7MJ2it1066KTS+y7VGzIAxIZ3DXZld2WjzJ5TETqmyJowHdyejLWKK/h+wdkUMWmStCAtjQKKwsgklRxB7CufqgPyW4H8LSpvTcNxRr9HeXrD909mmT07ylw05QFo4LYArzZUrFUF+RxrIVGFXO8E966vTTCds8Gn4E5Xzygwj/5hec7Rcw4vMspbZfT9zjB52G6I4mqgw5C5Fcddkku0UisGtCXGAxqDX7r5+YBK9+4Isrl0cdYdgilsBD63Ud73xv//A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tl4fMvXv4x4E2bKh5w7jjIASxQR9iSCPSVPi3cdCkmo=;
 b=Y+im2mQF9FSZ67z4L6Lx5mfjnDIEzn5Hksb8zg89FBBKFKjt6pZR5AT0fQ4ZM4maYsStdo+IElF8HjkCuZ834jdx6wjwJa0ITNkaxtgFDtVytIvKgPcgrDxhAGar2k5eIb2Pmiqibzrx4TsjScnyKrMn1aBGE1PqM4rlGrmUWt0/78/t72k7T+uf0sqZ6I9rSqwFC1TzxIE4hwnPCbQYm4QGkGyJ52FIsfUEo/31J2ArcB+f8C7hnRm8RSd5ZuT/kaxQTUYueUbB5l+eg5gkh6ru0x5mUqVk30FGclVTdj+0rnUqwjmRxqENBoSQbHoXN73C0g566tAdWgbTDo9FgA==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by SJ0PR10MB4768.namprd10.prod.outlook.com (2603:10b6:a03:2d3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Wed, 8 Mar
 2023 18:12:52 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171%5]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 18:12:51 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>
Subject: Re: dwc3 gadget and USB3
Thread-Topic: dwc3 gadget and USB3
Thread-Index: AQHZUeDbzC3YzvbOF0edn6Gh7r6tPa7xIiEAgAANS4A=
Date:   Wed, 8 Mar 2023 18:12:51 +0000
Message-ID: <d4be672670da6b06456b5a82624e3db0128fdae8.camel@infinera.com>
References: <c604031d4e3aa215b90f73e9a2dd55e7e116186f.camel@infinera.com>
         <ZAjE+p4IoXk/kvXu@kroah.com>
In-Reply-To: <ZAjE+p4IoXk/kvXu@kroah.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|SJ0PR10MB4768:EE_
x-ms-office365-filtering-correlation-id: bfc204be-ba7c-41d3-979d-08db2000bb55
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: noa8fC69ipU57KDLiz/BROiJFPYOAkA6FlXLzrxjfhF/cL6GPjPbEW46lOIyf4eaDLKvAzRiYD72yUQqwulVspfx1JmfpoGgmuo5+LlcR0Ofq/z47HHZSz9hqRBg/4hf5Kpvh6mY2TK8ux2Ffk3NeWRHiqXJTVeTM4fGoWK5Hd2hfu5xQhu1X/n+fti5itmrYl4yQ4p1JX8qABZcv4n6M8GRPZE/tYiHQxy8zceh2xQvYaIa/kd9PkYLEQxsEtxfe8z0pjPbR2aJ28E6NvC09aPDbnMC8THh8+225LeZj5W0kfDll3HC0QeTpiJL3Y0WqFfD/zhhCMJeelX223fJ6DXL0H6VmtHQQQSsiUfLtBXZU9tjdGNw+Y8H2y322lRNlvY+vv0Q0EmomWuJ7i4Z0Z7HRw5dUQqgDu+zVIqjCWNnNOyhsdDffmDDeC0wFZX8D0vzUv0qsbdEXiFZIpJ09psnKVSpzc5ciFJ+nJtS5z4lUBZk0Sc4Cw/LAcIx3QIAafomdv+7Y9aB5u27wmaMo9XDCQ9NH0zewIMycOt7w6Z9i3dnwikXxceP5QHVZNWm354jPpEo5/yynWmJLiiukfSU342VPUEJg0Ve3SsuQCaMPjiGCt5/k1THDOruXiJSmPemH9EtNSf3gBMpXikKdJQHgGWHCR9Wphbk0P6w6C/owi9RurWAVzOR85REHDXIWG/krq5Ks5yu2OlhAomKuA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(451199018)(36756003)(83380400001)(71200400001)(6512007)(6506007)(186003)(6486002)(2616005)(66946007)(86362001)(66446008)(66476007)(6916009)(66556008)(4326008)(8676002)(2906002)(64756008)(8936002)(76116006)(41300700001)(5660300002)(4744005)(38070700005)(38100700002)(316002)(91956017)(122000001)(54906003)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TFVmQTZvNXZKOXZvd3ArWHBtL0FUdUh3TWdzVDI2Z3MzQlpoVGVrWnJIM3kx?=
 =?utf-8?B?T21PZVE4cTRnMyswb2NrRjNxcG5MT2VFUWRRSmV2SExFRUcxVzlpUmc4TUFz?=
 =?utf-8?B?Q3ROSzhTVXI4T0g2WVRnYUI0dXVwL05KdVExQnpNMFYvUGJQT25ibHJtNzEz?=
 =?utf-8?B?Q3Y0Q2ZUbzhyZnZJSGJSUHVuWVdzMjVUdEx5SEhxOVpxMng2ZW1DQ21zaXVr?=
 =?utf-8?B?c1lMckx2Q1ZxZ1hHajQzdERFSndrNXlxU1k5bHl6YStBc3cxTGpWVkJjMWRE?=
 =?utf-8?B?QVA2QTVjK2VudGg4S0JiR0ZBN3Z0VTlsbEs0dTVOU3dvRk5INHdFT0dBQzNn?=
 =?utf-8?B?QXNoR2dpZjdEUEc4UEN6dmNodzd3YS9nRVBCYUtxdmsvTmdBb3htYnh6cjVC?=
 =?utf-8?B?cHI1OE1BYVQyTjJISlVoc2hBUmxlRU0zVGFqQW5uSnVpNHFhWDd0SDN3My9n?=
 =?utf-8?B?WUdjMkVMWWtwbnRLaTFWbTlmS2xRK2IxYVVVR2I0VzMwT1VHaXJQdUFLc2x3?=
 =?utf-8?B?a3MwUklPVStlSGNpckgvSFYyWEFXZmJURmtYTVFqZWdCOGltdW1CZW9PYXhC?=
 =?utf-8?B?NnlFR1NodVY5SXArL3dhSk5ybUdYaXMvMW54elBucVhndm55ajVRMVFLMGlO?=
 =?utf-8?B?VkJQZDFYd0xlMmRYL2pxaW5tMTNBUVZFejRZK1FEZ0xMdzByYlBZVGE1UDlp?=
 =?utf-8?B?SklNVmp2VmZGSHZtQzVuUmZwS01ydGZwTHRIRWFKNHBKbDYwUzErb2pGbGRp?=
 =?utf-8?B?anozVlNLK0RMOHV5Tm44cDFjbHdWZ2tWMXFwajdqZVB0U0E0UzdaRWtqZjJq?=
 =?utf-8?B?RHd3N3hnTGpHdU1OdGhGU3B3VCs2MlZCVkdUTFkray83T05sYzJUbERNMVJr?=
 =?utf-8?B?RkVCdzN6QVVoUlBlWitDL2FyTzE0V20wUzZ5QmRLQ2tXakJZOU80d0ZTbUVP?=
 =?utf-8?B?ZVZ5Um83OHVJcTJVQ1p0bGRqMjhqbkRhZkJlQkVUZ1RVMzZwZjVNbzFZdUxF?=
 =?utf-8?B?K0QrZmRuSDR5WWw0ak5iTnV3NFRaT29HNmVBWkhRNWttM0x3YVFmSUEyaGho?=
 =?utf-8?B?aFphRElDUTVEZENEWHVPaE9IelBoVHB0NVdDRnNRQ3Y5TUM3TzlIMXV2T09u?=
 =?utf-8?B?c25Bc0dwbTVzbTRCVE9OcVV3b2pYdW9GNitXUDlSVGNDSTFSSVRHM3RnRll3?=
 =?utf-8?B?ZnM1Smk0cEFYQWlwNnpZSHdYTFE1Q0lmcGVsOFB5QmgvdVBSTWs0NkhHT0dG?=
 =?utf-8?B?Ky9hdi9JYXNHZzlGOWRqUWRkUCtmNzNwbXpFMG43MmtKNnB2bG51USs0aU5K?=
 =?utf-8?B?aFJaRUtOUCs5KzFML0Urd0JtbmlBWng2Ti9CVmNYNkt6M2t1SS9rdG40djJu?=
 =?utf-8?B?VHdPazdibGFkZUY1Um9CdVk5dzEvZjdqdE1TMnlLemdRUlRHQnU2VlRUSlpp?=
 =?utf-8?B?aytyVVlUVFZCQkxVWDRPcWx5QSsvVy9WM2pJb2tMdXJtb3l1M21MdllMeXFW?=
 =?utf-8?B?aFU2QlJJRG1UckJDYVZaWmgvTVh3VE5tOHBZQS9aUkhrVERsbGNsbzlwUlpr?=
 =?utf-8?B?aXFJTUlsQS9yMlVnUExMTEpCcFJ5TFBGNVlLbzZZaGwrNUVBWnQxVkc5RkdD?=
 =?utf-8?B?TGZ1TTZ6YWxqUENRclpxblNPOUxIOFd2UVBldnRPN1pmeC9kSlBnaG0ydnhE?=
 =?utf-8?B?M3RTTUJTcUUzZlBqeVM4dE9UVWZ6d2c2SW1zYmtIUERMTENUV00vcUpHVXZD?=
 =?utf-8?B?N1N5THNJdzdkS1JKWitHZGI1dHBxTEptQW1qakFBMkNtK2Q2eDlrT0QvWlc4?=
 =?utf-8?B?c3lrbnEvbkpPTU5scEFqODEvVEthSUtqU2NmT3BuVEVQVS9NK0VmMlNvbGhL?=
 =?utf-8?B?bTJITjdrNUo5RXZaYU5aRW0rNTIvOUM5aHNsNXpEODZCVzJhenA1OWFxdUI4?=
 =?utf-8?B?ZjZhc1l1ODRVRHlZSUFwRytZSTJZbms3L24vei9EcjI5S2dFdVlNNld5UUtD?=
 =?utf-8?B?RUZwM2NHMEx6Vk5RMzZxQTdRRmRnSEdrYmFtSlRIZDVCblU1c0svNy9BV2FC?=
 =?utf-8?B?a0JkU2VPOW5tcVNrVkdSaEZ5MlNoK09YSE4vcXNqLytHM2hXdUxlVkprWEF1?=
 =?utf-8?B?ZXRCWjduTFl5MkVHdFdkTkRMNGVWWllGZUZEVllGSkpiaEhYSS8wZUVPbkpn?=
 =?utf-8?Q?draSMrwz0cZgE76uNzn7CDxGzh1JRrrrAzpA2BV9OoU9?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C197B71EB10B84B9DE71157B41A84E3@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc204be-ba7c-41d3-979d-08db2000bb55
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2023 18:12:51.7469
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i4bHKd+FOXcQ2i1EUAyhiFxqzmZwpJmA+hPx1MEufyx0mLvNpQHicLXpkjWM1Y7Ezm0iniId0ns9QceGcnqtlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4768
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gV2VkLCAyMDIzLTAzLTA4IGF0IDE4OjI1ICswMTAwLCBHcmVnIEtIIHdyb3RlOg0KPiBPbiBX
ZWQsIE1hciAwOCwgMjAyMyBhdCAwNToxMDoxN1BNICswMDAwLCBKb2FraW0gVGplcm5sdW5kIHdy
b3RlOg0KPiA+IHdlIGFyZSB1c2luZyBmc2wtbHMxMDQzYS1yZGIgYmFzZWQgZGVzaWduIGJ1dCB3
aXRoIGEgbHMxMDIzYSBTT0MgYW5kDQo+ID4gdXNlIFVTQjAgaW4gZ2FkZ2V0IG1vZGUgcnVubmlu
ZyBlaXRoZXIgTkNNIG9yIFJORElTIGV0aGVybmV0IG9uIHRvcC4NCj4gPiANCj4gPiBXaGVuIHdl
IGNvbm5lY3QgdGhlIGdhZGdldCB0byBhIFBDKExpbnV4IG9mIFdpbmRvd3MpIG92ZXIgYW4gVVNC
MiBodWIsDQo+ID4gbmV0d29ya2luZyhOQ00gb3IgUk5ESVMpIHdvcmtzIHdlbGwuDQo+ID4gDQo+
ID4gSG93ZXZlciwgd2hlbiB3ZSBjb25uZWN0IHRoZSBnYWRnZXQgZGlyZWN0bHkgdG8gdGhlIFBD
L2xhcHRvcCB3aGljaCB1c2VzIFVTQjMNCj4gPiB3ZSBzZWUgc29tZXRoaW5nIG9kZDoNCj4gPiAg
IFBpbmcgZnJvbSBQQyB0byBnYWRnZXQgd29ya3MuDQo+ID4gICBQaW5nIGZyb20gZ2FkZ2V0IHRv
IGxhcHRvcCBkb2VzIG5vdC4gSG93ZXZlciBpZiB3ZSBhbHNvIHBpbmcgZnJvbSBQQyBhdCB0aGUg
c2FtZSB0aW1lIHdlDQo+ID4gICBzZWUgZ2FkZ2V0IHRvIFBDIHN0YXJ0IHdvcmtpbmcuDQo+ID4g
U2VlbXMgbGlrZSBwaW5nIGZyb20gdGhlIFBDIHRpZ2dlcnMgdGhlIGdhZGdldCB0byBzZWUgaW5j
b21pbmcgcGtncyBzb21laG93Lg0KPiA+IA0KPiA+IEFueSBpZGVhIHdoYXQgbWlnaHQgYmUgd3Jv
bmcgb3IgaG93IHRvIGRlYnVnIHRoaXM/DQo+ID4gS2VybmVsIDUuMTUuODcNCj4gDQo+IDUuMTUu
eSBpcyB2ZXJ5IG9sZCwgZG9lcyB0aGlzIGFsc28gaGFwcGVuIG9uIDYuMj8NCj4gDQoNCkkganVz
dCB0cmllZCA2LjEuMTUgYW5kIHRoZSBwcm9ibGVtIHJlbWFpbnMsIEkgaG9wZSB0aGF0IGlzIGNs
b3NlIGVub3VnaCA/DQo=
