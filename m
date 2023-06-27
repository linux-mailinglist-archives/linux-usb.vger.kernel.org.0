Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB2D73FF13
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jun 2023 16:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232098AbjF0O4l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jun 2023 10:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232087AbjF0O4O (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Jun 2023 10:56:14 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2081.outbound.protection.outlook.com [40.107.7.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24A943596
        for <linux-usb@vger.kernel.org>; Tue, 27 Jun 2023 07:56:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fpQ8TLVGnMKC4/c4J9afHQayg/3YlmF3/RkwYzH3uT5mjD8MQr0EeTsCy4mWr1S4Ik7enRk60urznJBPPd1hzwcFMKrr7vHZR68qj69MY9+Gl7x00IEWNtRBeInkwm+RWnR84Mrp6NIs+jh7guXnP6+CQdeciD5KhOTijX2dxVHqWI2D1LCIV/ZGIN2dob1wMo4mIGMWYwD8Jxjggc8VyW1fz2/FR/E5vQD9O1PEm1eH0i4D7FxW4DLqfHPxCFM0zn4at7LL2oGcOg8Y3jjavFlbrx/e/yoFvD/eIKABm8yOy9UdXUAcQdmDPmJ2Q8uczpyrH0kYVEk8kMHIcsTajQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FoSXDw05/fWqjjbdhGa8dk1jIBTgz2R0rIX86URK7Ns=;
 b=PIsMKFDVBGGnW/2HB5odmg2rRxR7B527y+sEWqIGde7meMQqh8c1b4zZoYmAulhrpvGpq0gbMu0HvhJkKiEiC1okWTC2d/b8AJzV2yCJIzz+hpxW27NSm+9Ef4oyoNdXWceJp2YYe72l3T1pbyeoagt76JMqdaaZB3ifbj0lh7AZM6SZf/4IHiacbtqNQril3LJlgAtYb0khOJQ+CDhCTWXAw7RMdvZpiy8KRw4+oPkNBXCM2SCc7cOkUclSrFMmozscg2qAd1KRkYIR255ikm94aMLBCVs81ziCe03tnJLRheSFs8Ze7j3B6bgthGiugD17EZH1fxqdUgiBCBa2Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FoSXDw05/fWqjjbdhGa8dk1jIBTgz2R0rIX86URK7Ns=;
 b=BzamHtJfuJ2HhMNB2ud4QCu+M/UlXw8bxH0+53VCqpMSCyYBkGZ5gcW0RCYNRCOiV5cZaLVDaVkZw2pFFnWNUi1vCuTUJzu55PtDi/XE/fetYopEFI5H4tEuhR7mtoCJKVqSEV/6M2E9yrqRsO1WoqeCvAV78TU3eXwRw2aQ6yQ=
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by DBAPR04MB7319.eurprd04.prod.outlook.com (2603:10a6:10:1ac::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Tue, 27 Jun
 2023 14:56:04 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::4a2a:262e:415f:e41c]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::4a2a:262e:415f:e41c%7]) with mapi id 15.20.6521.026; Tue, 27 Jun 2023
 14:56:04 +0000
From:   Frank Li <frank.li@nxp.com>
To:     Roger Quadros <rogerq@kernel.org>,
        Ravi Gunasekaran <r-gunasekaran@ti.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "peter.chen@kernel.org" <peter.chen@kernel.org>,
        "pawell@cadence.com" <pawell@cadence.com>
Subject: RE: [EXT] Re: usb: cdns3: Onchip memory reservation for built-in
 gadgets
Thread-Topic: [EXT] Re: usb: cdns3: Onchip memory reservation for built-in
 gadgets
Thread-Index: AQHZqOPr0K8Qv+d+aE+qe/9mSATp/a+euTRw
Date:   Tue, 27 Jun 2023 14:56:03 +0000
Message-ID: <AM6PR04MB48382467AC7D6AF26C8CC4918827A@AM6PR04MB4838.eurprd04.prod.outlook.com>
References: <aa5837a9-8dd6-f10f-fd58-ec43e027ef07@ti.com>
 <b0314296-0df7-efcd-b0cf-166cb09ab338@kernel.org>
In-Reply-To: <b0314296-0df7-efcd-b0cf-166cb09ab338@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB4838:EE_|DBAPR04MB7319:EE_
x-ms-office365-filtering-correlation-id: 70c82280-6eec-4e7b-0191-08db771ea134
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MEI53i2UhHzQBUHkCa2nwaHaNGwIj8NfQ20ut8eKshfkSvbH7NVJA5yt+6oQWbyL1kCI/9yT7Jxa/cxL2xARFuHVDTzMhBAFXJ5mFuEBIDGHBGakThidGgj6viwi84BWcRI23Z7RLYMHP2vRFXLSWOsRv2GpZUJ/jmWxNbTTwaAeXe2ecr2wXXGUduCTmPPZuYRamvPo0lICIH0QGX0w2zh/5mdY6Eng/U1PcwQCcn3+jrgYsSL3y3frkz/5WVVA5mRPzs5SyxvV/ad0DGGvcl7MxaMz+lJSx7c20uUqw/JKiZtGw8YAwJd15P6ZMuXCihmhPnOAn0jtSPXwXW/wFGuk7gs7imzTEFGBIlf+IEFNrlRMvxn6Y+Elk7cld8kzKwj8UdiDYR4AITrXLTmDfA+Y1es/eTp+E42DrveM4w5ba5EoX8NK1lnYtEFCbkyoxGl2iE+CEl6GCYOVsl5npvoPdxMQqWxtuTgSfu70CT5jNLkDUvK4/lHhqOZS7YmsPwJ2Dzm6Zys47mi6GKAvoEPLPO/XTmmkO+ffmxeaoQrBbyX9JvgtKh3KcTa4ANSO3y6FZJHwNoRdZsPzo/0d1XMoy3r9lBOQD1zyaJZ1qR3jxrhLmCbj6sz6Tn9UQ8r0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(376002)(39860400002)(396003)(346002)(451199021)(52536014)(478600001)(110136005)(7696005)(26005)(54906003)(83380400001)(2906002)(9686003)(55236004)(186003)(6506007)(71200400001)(53546011)(86362001)(44832011)(41300700001)(33656002)(38100700002)(5660300002)(122000001)(4326008)(66946007)(66556008)(316002)(55016003)(76116006)(64756008)(8936002)(66476007)(8676002)(38070700005)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MDBDcDR4UkhBTW50Y1REQVJyalUrWnJHVUpIRjhQeWZjOFZYclVEMS9SaFJ6?=
 =?utf-8?B?SmRLTG1mSGwweWVMOVZmakJmdUhXVWRrZXRlUm14Mmk5YW5vUDhGWmNJcTJJ?=
 =?utf-8?B?ZVFHQnExa0RYUEhRMHB6WnhJaWlvYnpJU0p0UHlJd00zSktGTUhRODdDeWti?=
 =?utf-8?B?cG5pK2ZVcnBMbit0cEJmYUxPb2g1N2NmaDdUak1sVVl1K2ZvWk05b1VxeTg4?=
 =?utf-8?B?RW01dHRkRkFNR1JzZms3ZjVYaCtBNVVwQ3QrbVZWa3hYRXpraDdoemc1djlQ?=
 =?utf-8?B?N0dlSUlGbVpzajhUeGMrUkV6aE1sTjNGRGdSTXZrNXhxOTFGTzJBVWl6M2V0?=
 =?utf-8?B?K2h4NHBXbi9QQ1EvSVQ5b2RXdHRwRmZmK0pCeTNnakpEc3l5ZWZPazhtWSt6?=
 =?utf-8?B?Q3BpUTVoWEFiVEZ3cmJvWHppdk1WY3NGSC9nYVdxNHhoTnNtNW5YTFhmNmpa?=
 =?utf-8?B?cWlqalFnNmNPOFB0dkJHWEhkdlRPQ2UzbUF1eG5kZ0tZRnJLWk9XbkJ1aVlS?=
 =?utf-8?B?Mkh6OTRaRFNrNWtPelZwY1AwVmFBbFJMcDlyTi9HbXcrbmNVTEdBT1NsTTc3?=
 =?utf-8?B?aFpLQ1JVdXZMdHhoT0U3a0I4OG5FVjlJbFZKNk1HekU2czA3VDNYODlFdWg1?=
 =?utf-8?B?SlcxNmVseVpDSityNFRZQ0dmUk16Rld4d2Q4bVA3cllXOERCaEtQRU9lSTY5?=
 =?utf-8?B?NXFrL0xEL0JTcE9oMVpPNW1iRVJONmlPSlJndzNFU1pxblY5L1FzRG4relVu?=
 =?utf-8?B?aWdJRWR3cC9KMzI3MU5LRm1yNHd1UWVkYklrUk55OGhTY21NZjRQdnFWMmJp?=
 =?utf-8?B?ZW5lcUN4S3VBZHd6NXJQVTZSb2RHaE1NREtlZEh2K2t1VnFNK1R2WWZhTHM3?=
 =?utf-8?B?aHRON0QvMDJMTVQwTTB3bjR0d1Rla1ZrZ0lsRS9FQytTcXl5aVc1RzdDRHZq?=
 =?utf-8?B?Qm1TVnFuY1BGaHhucnZ5cHUrME1PZXZaZlpqb0NxaVVibHFyMzkzQk45akY5?=
 =?utf-8?B?dEFzWXB3clBJNjlhem8xY3RkSnBQVkhFd3VnSklqc0U1bW15SklHR2JqRXNz?=
 =?utf-8?B?a1NYdDIra3NKQ0dDQ0RXZ09hcS9UVGhYTnRuRzZGbStGbmdTVnV1THpBeFE0?=
 =?utf-8?B?WENmRFBSUzZpZW1BTjNFRk02aVgzWFF1bzR4T2ZpNXgrMm11aFAxemZkeDc4?=
 =?utf-8?B?YWFoZEx4a1pmVjc3Qkd1YkxoZVIwc3p5Zzkra09RMzlhb1JkbzRGaDVxcGhp?=
 =?utf-8?B?MDg3R2dMNlhYTXdPeml2bUdXdlJVYWp5bG1UWjNDUkVIYVF2WHU2Y1NDdlVI?=
 =?utf-8?B?ajZhZ2xTemlQUFVMc3AzeTdGamZCVmVLbnZqY2JqTHVaNkoxYkE5YmRzSm1K?=
 =?utf-8?B?Q1NlYjd2clE3M1VsUXV5OWlxV0hkUnBFNk0xcnc5NmErWkdIRHlkdVVGdXBP?=
 =?utf-8?B?WFM3SjQ0ZXJoNEVYb05QYnFwazIwR3g0bWczSG1UMlFSaUxqREdMcWFhOGlZ?=
 =?utf-8?B?U2s2UTNQclVMODdDOWFkdHZJZFloQWJrNnA3cGN1Z09ub0g3d2EvK0Y3UmFP?=
 =?utf-8?B?V05ITEpkU2dxcnNmekVWRlpQZFNRMWVzS3FEcTE5UllFWkF6clptb2VIUFRB?=
 =?utf-8?B?OW5zcTVoK2o4bUlSS2lYWE9VZ1JYUFBJUWVzQTF5UlRLQTFFU2d5NlFYTlN1?=
 =?utf-8?B?S3p0b09RV0ltcUNTTVRrYWFNL1E3SXd6eUUzN3pxUGJSdHUyTjF0MnBSQk5I?=
 =?utf-8?B?R1J1MjN2NUgyYmZsRTJ0QzBDRDR1NDV1SEgxSU44VDBwWHgxT2djdWhwZFdR?=
 =?utf-8?B?bkVwcGdLdG9kdVpaaE9PMytIYkF0QTBQOWYvZ2JUZ08xNjJrWW9QNmw0Z1lp?=
 =?utf-8?B?OVB3SksvdHBTUUJzSXVJMTNGVElpa1loNGd2V3ZlZ3p6SWl3enZFRHZmRTRV?=
 =?utf-8?B?aFNHRWorNFU0T0dUZFE4aHVwRThhOWUrMzlJY0NGemx1YzNKN1RNZ0ZGS0dP?=
 =?utf-8?B?MmNrT3UyUnVRR281OUI5bkRFREs3aytOckorcGg3bkpqUUpoRjVnc2tLZVhL?=
 =?utf-8?B?R0hoWXRqWVZjN3ptQ3hVeWZWemd2aFB4c2NHL1R1dzNtdlYrZjljcDQ5dkJo?=
 =?utf-8?Q?W9gE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70c82280-6eec-4e7b-0191-08db771ea134
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2023 14:56:04.0146
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: prFzoSOSBM87UudtXRgSphVCHQ+q/J+hHZJ2Vgcgocvk66j/lGOsMFnQdT0gaxCcOHBej7ltn62PRBZ4yD8gOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7319
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9nZXIgUXVhZHJvcyA8
cm9nZXJxQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bmUgMjcsIDIwMjMgNTo0MSBB
TQ0KPiBUbzogUmF2aSBHdW5hc2VrYXJhbiA8ci1ndW5hc2VrYXJhbkB0aS5jb20+OyBGcmFuayBM
aSA8ZnJhbmsubGlAbnhwLmNvbT4NCj4gQ2M6IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7IHBl
dGVyLmNoZW5Aa2VybmVsLm9yZzsNCj4gcGF3ZWxsQGNhZGVuY2UuY29tDQo+IFN1YmplY3Q6IFtF
WFRdIFJlOiB1c2I6IGNkbnMzOiBPbmNoaXAgbWVtb3J5IHJlc2VydmF0aW9uIGZvciBidWlsdC1p
bg0KPiBnYWRnZXRzDQo+IA0KPiBDYXV0aW9uOiBUaGlzIGlzIGFuIGV4dGVybmFsIGVtYWlsLiBQ
bGVhc2UgdGFrZSBjYXJlIHdoZW4gY2xpY2tpbmcgbGlua3Mgb3INCj4gb3BlbmluZyBhdHRhY2ht
ZW50cy4gV2hlbiBpbiBkb3VidCwgcmVwb3J0IHRoZSBtZXNzYWdlIHVzaW5nIHRoZSAnUmVwb3J0
DQo+IHRoaXMgZW1haWwnIGJ1dHRvbg0KPiANCj4gDQo+IEhpLA0KPiANCj4gT24gMjcvMDYvMjAy
MyAxNTo1NiwgUmF2aSBHdW5hc2VrYXJhbiB3cm90ZToNCj4gPiBIaSwNCj4gPg0KPiA+IEZpcnN0
bHksIEknbSBub3Qgc3VyZSBpZiBpdCBpcyBhbHJpZ2h0IHRvIHBvc3QgcXVlcmllcyB0aGlzIHdh
eS4NCj4gPiBJZiBpdCBpcyB3cm9uZywgSSBhcG9sb2dpemUgZm9yIGl0LiBQbGVhc2UgbGV0IG1l
IGtub3cgdGhlIHJpZ2h0IHBhdGgvZm9ydW0gdG8NCj4gYXNrIHRoZSBxdWVzdGlvbnMuDQo+ID4N
Cj4gPiBUaGlzIGlzIHJlZ2FyZGluZyB0aGUgY29tbWl0DQo+ID4gZGNlNDk0NDllMDRmIHVzYjog
Y2RuczM6IGFsbG9jYXRlIFRYIEZJRk8gc2l6ZSBhY2NvcmRpbmcgdG8gY29tcG9zaXRlIEVQDQo+
IG51bWJlcg0KPiA+DQo+ID4gVGhpcyBjb21taXQgaW50cm9kdWNlZCBjZG5zM19nYWRnZXRfY2hl
Y2tfY29uZmlnKCkgd2hpY2ggaXMgaW52b2tlZA0KPiB3aGlsZSBiaW5kaW5nIGdhZGdldCBjcmVh
dGVkIHZpYSBjb25maWdmcyBhbmQNCj4gPiBhbHNvIGEgbG9naWMgdG8gY2FsY3VsYXRlIGVwX2J1
Zl9zaXplICh3aGljaCB3YXMgQ0ROUzNfRVBfQlVGX1NJWkUgPSA0KS4NCj4gPg0KPiA+IEJ1dCBm
b3IgZ2FkZ2V0cyBzdWNoIGFzIGdfZXRoZXIsIGdfY2RjLCB0aGUgY2hlY2tzIGFyZSBub3QgcGVy
Zm9ybWVkLiBBbmQNCj4gYWxzbyBmb3IgdGhlc2UgbGVnYWN5IGdhZGdldCBkcml2ZXJzLA0KPiA+
IG1lbW9yeSBuZWVkcyB0byBiZSByZXNlcnZlZCBmb3IgbXVsdGlwbGUgSU4gZW5kIHBvaW50cyBh
bmQgc2hhcmVkDQo+IG1lbW9yeSBmb3IgT1VUIGVuZCBwb2ludHMuIFNvIHdoZW4gZXBfYnVmX3Np
emUgPSAxNSwNCj4gPiB0aGUgbWVtb3J5IHJlc2VydmF0aW9uIGZhaWxzLCBhcyBpdCBleGNlZWRz
IHRvdGFsIG9uY2hpcCBtZW1vcnkuDQo+ID4NCj4gPiBTbyBJIHdhcyB3b25kZXJpbmcgaWYgYWRk
aXRpb25hbCBjaGVja3MgbmVlZCB0byBkb25lIGluIHRoZSBjYWRlbmNlIGdhZGdldA0KPiBkcml2
ZXIgb3IgYW0gSSBkb2luZyBzb21ldGhpbmcgd3Jvbmcgd2hpbGUNCj4gPiBsb2FkaW5nIGdhZGdl
dHMgc3VjaCBhcyBnX2V0aGVyLg0KPiA+DQo+IA0KPiBJIHRoaW5rIFJhdmkncyBjb25jZXJuIGlz
IHRoYXQuDQo+IA0KPiBwcmlvciB0byBjb21taXQgZGNlNDk0NDllMDRmLCBwcml2X2Rldi0+ZXBf
YnVmX3NpemUgd2FzIGZpeGVkIGF0IDQuDQo+IEFmdGVyIGNvbW1pdCBkY2U0OTQ0OWUwNGYsIGl0
IGlzIGF0IDAgaWYgY2hlY2tfY29uZmlnKCkgaXMgbm90IGNhbGxlZCBlLmcuDQo+IGluIHRoZSBs
ZWdhY3kgZ2FkZ2V0IGNhc2VzIChlLmcuIGdfZXRoZXIpLg0KPiBTbyBjZG5zM19lcF9jb25maWco
KSBmYWlscyB3aXRoIGRldl9lcnIocHJpdl9kZXYtPmRldiwgIm9uY2hpcCBtZW0gaXMgZnVsbCwN
Cj4gZXAgaXMgaW52YWxpZFxuIikuDQo+IA0KPiBBIHBvdGVudGlhbCBmaXggbWlnaHQgYmUgdG8g
c3RhcnQgd2l0aCBwcml2X2Rldi0+ZXBfYnVmX3NpemUgPSA0DQo+IGluc3RlYWQgb2YgMCBzbyBp
dCB3b3JrcyBmb3IgbGVnYWN5IGdhZGdldHMgYXMgd2VsbCB3aGVyZSBjaGVja19jb25maWcoKSBp
cyBub3QNCj4gaW52b2tlZC4NCg0KSSB0aGluayBpdCBzaG91bGQgZml4IGF0IGxlZ2FjeSBkcml2
ZXIgYnkgY2FsbCB1c2JfZ2FkZ2V0X2NoZWNrX2NvbmZpZy4gDQpBc3N1bWUgdGhlcmUgYXJlIGEg
VURDIGNvbnRyb2xsZXIsIHdoaWNoIG9ubHkgMiBlbmRwb2ludC4gIGdfY2RjIHNob3VsZA0KZ2V0
IGZhaWx1cmUuDQoNCkJlc3QgcmVnYXJkcw0KRnJhbmsgTGkNCg0KPiANCj4gLS0NCj4gY2hlZXJz
LA0KPiAtcm9nZXINCg==
