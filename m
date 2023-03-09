Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0EA26B2B5A
	for <lists+linux-usb@lfdr.de>; Thu,  9 Mar 2023 18:00:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbjCIRAR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Mar 2023 12:00:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231221AbjCIQ74 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Mar 2023 11:59:56 -0500
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2069.outbound.protection.outlook.com [40.107.101.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 122F964B24
        for <linux-usb@vger.kernel.org>; Thu,  9 Mar 2023 08:54:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZpGbMbjsSd00sX0/7PflpB2N20p3V0p8PwvLFGnhgICb/n4sFUX2Y/aSq3kao7aTTplpNqKhlBkI+sns3QQWcPIKC+TaGbzdh8RY50+yJHMg6T+JumCqDdWyJg7AlZ9ePKS13iRRCYKCc9Kr7ipQeAAa7Scy7ru6dk84KypL/8bTMK1i1TCDEpOssDJ5aSU7FV8Ia+txE/FPtKx8d65svbTcPCLHmSTUM8gSm0l6wViy/ngDnxl7I0XCT9p97qcjIypkJVpUm/NFIO6t/6Jrub5Zw61A1LGer2IDaNaqKNnldBdG1Ogg9AsxdVJOz2Yi8SS5yto2km3ZrGWr7/SmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+LQJAhuSNhSaJamjnZ0twfYg9kvLeBzVNXhgwQK2KU=;
 b=jzM2C2sh4hZqnZ2ANZJOZT2fywz66NUFFnphjtQPZnDbBVWoFLNiT3ii7kKc/0dztBnbwQLnO5cEbbELOjrmXMM7EoK1XcKfbA0fnIJpKFU3nGMFPFroKIImMRZxsJ8wV6X/yQg8YIp+AT9agyZugzOzxFmjy8HOZvJnbIvl2oIhhWaeNZaQPK/oF2wl5VGOE2//o2p9jmpdKL2EXnFWqrCp2ZeoW+NRKXKpYVFqX73/jI252GHYt/j2Y34I+Nn/nXjm2fsYYNkJ2BV4jMZQYiN8uzsUtXplbRRaHd6eXP1VSF5veUAMRwTeH66drFlD6OuUxjO82ah7S4U+eR5cmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+LQJAhuSNhSaJamjnZ0twfYg9kvLeBzVNXhgwQK2KU=;
 b=ZMeyJHfLriV7VAD1KknNABNYbeEuVXwqg44QDaGtVax/KDl1aeDqSYzQNn46Yi3w2igYmoe5tJvZm/oS1h9buVSCjMGLQbrmwYjckwLKk4eZScRVtaBJpL8LEnJGFFiCIWofBuB4xrZMcahRD4lP5MCsagOZ+VBkc1sVxONJ31SXHTFcDxmZ/QarihRG7aEMQjL+jzC79Tpjntfm89D0x+6+XxHh4kIJKjP2g5bunGa3Nex4VUBE/EdlQdibkM0Uo4nBsz/ZZ/0ULk6GaAmuRhVCooqcf2c58OpCrrdbv03xKXFpbiZ3LkV0Xl28bl7e3hfVUC/sn/2XYZuRjbZYbA==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by CH0PR10MB7409.namprd10.prod.outlook.com (2603:10b6:610:183::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Thu, 9 Mar
 2023 16:54:03 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171%5]) with mapi id 15.20.6178.017; Thu, 9 Mar 2023
 16:54:03 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "Thinh.Nguyen@synopsys.com" <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>
Subject: Re: dwc3 gadget and USB3
Thread-Topic: dwc3 gadget and USB3
Thread-Index: AQHZUeDbzC3YzvbOF0edn6Gh7r6tPa7xIiEAgAANS4CAAAy+gIAAKXUAgAE//gCAAAYfAA==
Date:   Thu, 9 Mar 2023 16:54:03 +0000
Message-ID: <4f6fa0c5f077c01c7fb5b15667d061ffa81af8ea.camel@infinera.com>
References: <c604031d4e3aa215b90f73e9a2dd55e7e116186f.camel@infinera.com>
         <ZAjE+p4IoXk/kvXu@kroah.com>
         <d4be672670da6b06456b5a82624e3db0128fdae8.camel@infinera.com>
         <ZAja0So7EDH5FfI0@kroah.com>
         <e31b7802f0b33f66338b009de898526b8eb936f6.camel@infinera.com>
         <14bebac5f1e046c4fcdedc540bcdddc83cdd2b47.camel@infinera.com>
In-Reply-To: <14bebac5f1e046c4fcdedc540bcdddc83cdd2b47.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|CH0PR10MB7409:EE_
x-ms-office365-filtering-correlation-id: 22db3541-0bab-4118-5825-08db20bee343
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i4qtMEaIhWxu7oc/A0Vf804knT5zCs6/NY+zjSwATtsvZoNdrh24pv+a6mqKerVUPUnizGFE2GvLSsgyKvaF5S2QIKtqHC/MBDNNgOivThp+Ks0rc4TeoqO7emwB/Hg3uznvmeSizU8jtgNkKA/MAwMra6A4z4rGD3UfenzkiyPtqMrIfaqqHGx8OxnIPjp3vHWtK1L+LL5zX1kjG0k6xvKlnC9DIOV7pNh3idYq35luY3d/XjoSloSk8o7/FSXx86dmPcTsTuw9wOHlqupGBRTL9rFzcBT0NG6MCF4Ifz0Yzd5JfWca4oqAgJ5spj5R12MDzNmDhLNgJ5td4UIGLKUqd5bYA2fYz5/b4sKPgUU6+/tWR5jza4eWyvsIq/QUkO9fM3kFxODtmi4jLzcI5gAT7zWrgnFD1kdXr1k4SWGW2KD7xRwBbxJ8xEfoKzWqadjqvVj+3YcysI/0sJi9c/E5+wPIE3koHraxwSOiQBakG0L91vvpmmealIWQrXgEXZrID2uMGp27G9s4VDlEpxp53ixO9W/1oI/6oAin8A+l6PlJzD13gCRqFGeu6dR/BoVJcehtv/yOA2L6PQS+JedlsnR9P59ShXxn/JYj+6YiqeWOrWwHa+FPedTQrriRPiKsW3Oq2Ly+WjmOLTI04AmLbwYdP7eA0V0LhlnZwrYdP37im8a6peI0KcAJ8m7mHDy9PQu3lOax/Ghhhsx/7w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(451199018)(38070700005)(71200400001)(41300700001)(6916009)(8676002)(36756003)(83380400001)(54906003)(86362001)(4326008)(5660300002)(478600001)(66476007)(66556008)(6486002)(8936002)(64756008)(76116006)(66446008)(91956017)(66946007)(186003)(122000001)(2616005)(2906002)(38100700002)(6506007)(316002)(6512007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bi9odUJIZlh0OFRxSEozb2pnaXRTcjRpalNRTE1wR0d3Y3I4NjdiTGc3L0RT?=
 =?utf-8?B?TEhnTkwzdDBESE1aK2ZNV0ZiV2JjY3orYUV0UzhCZDhEVHBKeE5YcGlRb1cw?=
 =?utf-8?B?dWRtRTBPSE5RQWFtSVpvUStGV0d6d0NETU9jdUdFRGEvem5lZWk5VldCTnhk?=
 =?utf-8?B?dHp1VjVKY0Z2VTNqSVQxK3ZTVUxtM0VYaWxESVEyQUNXcnorSm5rZnJ1OXBp?=
 =?utf-8?B?T2o1U3VBb3BhaDhUUnhzYlp4Ulg4V3RpT2cvamRCTWFqRjU3Sm5PRFJQUnYy?=
 =?utf-8?B?Y0FFOFBDZlBWWTQ0SklWM3F1c0xaTW1yVDZWaHpPQ3p2VlFhUkNiZWVuVmRM?=
 =?utf-8?B?N25zV0M3aXJMSlRJQ2NBVXlEKy9ybENvSUYrOXJsbm9pZmlhUlJzcGQ1T1Yz?=
 =?utf-8?B?Ti9HMjRmNXQ1b3RUNXA1dnNNUUlxRDBmSlZWR2NFdFZjNGpRNDM4c2dPaFJZ?=
 =?utf-8?B?REVtRS91bmJ6WTV1VENMRm1KSE02dlQvbnZNRGN0UzhzMXlSS1VKdWhCSXVW?=
 =?utf-8?B?K1cwb29QL2FZTEtBN3RsMnBEcnlhUW40UWk1NEZhTnFERXRQNE91bldNaGVP?=
 =?utf-8?B?NWRVVHpNdkMvV3VCQ3hwNEdmTFhJaFFjdUI2dFhVZS9LemZIdTNSY0pJTzE5?=
 =?utf-8?B?Wjd6d2Z0ZDc0L1ZnMCtnOU54MmQ0ZmNRMEYvRStnUmhWYnpjNHhTVlFXVm9S?=
 =?utf-8?B?bVdyZUo1VjNwWnFDSGNmOEtuRSt5ZFphejdPY2poN1pCTTNONDJmcElJelNG?=
 =?utf-8?B?L01PbGd1eERBak5JQTgza1dTNjBmUndRM0FXTTR4b0hqK253NFhZQk9WaUJt?=
 =?utf-8?B?Q0tTaEYvdDg1ZWhUVnpCV2NCNFZMTU1uYjNub05vaGJKckFycHdzUXplS2Ir?=
 =?utf-8?B?V1diVTFndUJvcmlkUVNJZ1pFM01PdWFOVFM0ODlzRi9OdVFPdWQyekJaRE9m?=
 =?utf-8?B?UTJCaUxldjJuL0Z0NmdSSFBJYjl2N2g4YjczZ3JVcVJFSUFFVVUzTlBaL29V?=
 =?utf-8?B?RlNzRmRTTkh0cVFxWFJzOEswcVB0VmhKSWFlSU8zdEx1bm9xZzh1UE56ZUcr?=
 =?utf-8?B?cnBKZnplQkhpM0pqb1VyNDBVbEhTaUFQbnN4a1BNZ3pJNXJiSlAvMjZzM2FW?=
 =?utf-8?B?Qjl0RFhiS3lGWDBXSTcralhJdU5kWUgrTzM4Y0gwZUVGMDdVbW5INk1jeEtu?=
 =?utf-8?B?R21hcVZtaUF5SjVsQ1Mrby80UThiOFptME5jOVVZS2F1N2VwMDM3YXB0TTd2?=
 =?utf-8?B?SXBSWjAzNWRncFJrYk1tWmh2dDJnQjlCYnpuOGFFTmQ3NlcraVFvMEUvQjZ1?=
 =?utf-8?B?RW02d1JJem4vK0w0cTJNcDVWQlRNcGhFVjhvcm90YTU5MjdoTlJ0aC9Ua3lO?=
 =?utf-8?B?MzRxUlBITVFIZjZ5L2todC9zNkk3c2ozVzNKZXEvdlk5SVpLSUdub3pOYXQ1?=
 =?utf-8?B?Z05hWmIxTjdzd013Q2J5bmVQaXB4bWRKRTl0ejBDUXdYSmo1cHo3aUZERzA1?=
 =?utf-8?B?MUxRR1RqSEF1WGQzUjdhV3pOMmNHd1lUdHcvWVFVdUNxTzE2emVocDNKQUpj?=
 =?utf-8?B?OFVRalk1QkNyeW01L1MvR3g4QWd6MFc0RVhhMnBjUFIrRmRydHN5UERuSlYx?=
 =?utf-8?B?YmxDdGo0UGUxZmE2ZGhaTWJCcjhadEJHWlJQVVFJd0E2RUxEME5saFRTMjlx?=
 =?utf-8?B?RWxvaFhkMWNLbVc1OHFGQmljcDlWcHNIenpFdEZaRXpJSThuVU5zSk5CS3Vs?=
 =?utf-8?B?RXFjWm16QTZMcElVWitYL29yRkVIdXZZd2lZVGtYK0xtWFlWVkxJQ1hVS05x?=
 =?utf-8?B?LzBzY0NVZXRDa0djeDZIbmh0ZHlwOWNhRXFFRmhQQ2NHK1JMR2VQODdBYzRv?=
 =?utf-8?B?U0YrODhPQlY3RGhBZEY4VjNtVWRGdVFoU3FRWDJibUxUUWR6NTg4Qk9qNkZk?=
 =?utf-8?B?Y2dtenpIS2ZrdjJGa1lESUFEbXJCcWhJbGU4VmFXcXRNTkx6eUp3N0hQWFlt?=
 =?utf-8?B?dFMxcmNEU1lzMGdLMi95WUx0UGVrRE5tS0FyYlVadmhDRU51am00MnJoN05q?=
 =?utf-8?B?MG00djVhdlgxci9jZlZyR2swOTNPY3h3bkxkL0xaMW84RFBVNnBIRzVWWDYr?=
 =?utf-8?B?bUdKSDRsbkxWZ1F6dE95cXM0TlpLZTExWVF4WldEckZYRVY5ek5kT252MFJk?=
 =?utf-8?Q?QPZtQTkJe0PnNL8Mvjtf6eaNhkGjHefIla2gg/wXWAk6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4219CDDD070B7548892BAE235330932E@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22db3541-0bab-4118-5825-08db20bee343
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2023 16:54:03.1305
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kZ4TPJztofARLqucCNRmIyo42HMiFLr6Y1qF9uIpA4Mii7CKpSjndyHtyV6LNibcYlFWJDaNMMfLnH20ESlDVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7409
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCAyMDIzLTAzLTA5IGF0IDE3OjMyICswMTAwLCBKb2FraW0gVGplcm5sdW5kIHdyb3Rl
Og0KPiBPbiBXZWQsIDIwMjMtMDMtMDggYXQgMjI6MjYgKzAxMDAsIEpvYWtpbSBUamVybmx1bmQg
d3JvdGU6DQo+ID4gT24gV2VkLCAyMDIzLTAzLTA4IGF0IDE5OjU4ICswMTAwLCBncmVna2hAbGlu
dXhmb3VuZGF0aW9uLm9yZyB3cm90ZToNCj4gPiA+IE9uIFdlZCwgTWFyIDA4LCAyMDIzIGF0IDA2
OjEyOjUxUE0gKzAwMDAsIEpvYWtpbSBUamVybmx1bmQgd3JvdGU6DQo+ID4gPiA+IE9uIFdlZCwg
MjAyMy0wMy0wOCBhdCAxODoyNSArMDEwMCwgR3JlZyBLSCB3cm90ZToNCj4gPiA+ID4gPiBPbiBX
ZWQsIE1hciAwOCwgMjAyMyBhdCAwNToxMDoxN1BNICswMDAwLCBKb2FraW0gVGplcm5sdW5kIHdy
b3RlOg0KPiA+ID4gPiA+ID4gd2UgYXJlIHVzaW5nIGZzbC1sczEwNDNhLXJkYiBiYXNlZCBkZXNp
Z24gYnV0IHdpdGggYSBsczEwMjNhIFNPQyBhbmQNCj4gPiA+ID4gPiA+IHVzZSBVU0IwIGluIGdh
ZGdldCBtb2RlIHJ1bm5pbmcgZWl0aGVyIE5DTSBvciBSTkRJUyBldGhlcm5ldCBvbiB0b3AuDQo+
ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IFdoZW4gd2UgY29ubmVjdCB0aGUgZ2FkZ2V0IHRvIGEg
UEMoTGludXggb2YgV2luZG93cykgb3ZlciBhbiBVU0IyIGh1YiwNCj4gPiA+ID4gPiA+IG5ldHdv
cmtpbmcoTkNNIG9yIFJORElTKSB3b3JrcyB3ZWxsLg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4g
PiBIb3dldmVyLCB3aGVuIHdlIGNvbm5lY3QgdGhlIGdhZGdldCBkaXJlY3RseSB0byB0aGUgUEMv
bGFwdG9wIHdoaWNoIHVzZXMgVVNCMw0KPiA+ID4gPiA+ID4gd2Ugc2VlIHNvbWV0aGluZyBvZGQ6
DQo+ID4gPiA+ID4gPiAgIFBpbmcgZnJvbSBQQyB0byBnYWRnZXQgd29ya3MuDQo+ID4gPiA+ID4g
PiAgIFBpbmcgZnJvbSBnYWRnZXQgdG8gbGFwdG9wIGRvZXMgbm90LiBIb3dldmVyIGlmIHdlIGFs
c28gcGluZyBmcm9tIFBDIGF0IHRoZSBzYW1lIHRpbWUgd2UNCj4gPiA+ID4gPiA+ICAgc2VlIGdh
ZGdldCB0byBQQyBzdGFydCB3b3JraW5nLg0KPiA+ID4gPiA+ID4gU2VlbXMgbGlrZSBwaW5nIGZy
b20gdGhlIFBDIHRpZ2dlcnMgdGhlIGdhZGdldCB0byBzZWUgaW5jb21pbmcgcGtncyBzb21laG93
Lg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBBbnkgaWRlYSB3aGF0IG1pZ2h0IGJlIHdyb25n
IG9yIGhvdyB0byBkZWJ1ZyB0aGlzPw0KPiA+ID4gPiA+ID4gS2VybmVsIDUuMTUuODcNCj4gPiA+
ID4gPiANCj4gPiA+ID4gPiA1LjE1LnkgaXMgdmVyeSBvbGQsIGRvZXMgdGhpcyBhbHNvIGhhcHBl
biBvbiA2LjI/DQo+ID4gPiA+ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiBJIGp1c3QgdHJpZWQgNi4x
LjE1IGFuZCB0aGUgcHJvYmxlbSByZW1haW5zLCBJIGhvcGUgdGhhdCBpcyBjbG9zZSBlbm91Z2gg
Pw0KPiA+ID4gDQo+ID4gPiBJdCdzIGdvb2QgZW5vdWdoIDopDQo+ID4gPiANCj4gPiA+IEhhdmUg
YW55IGxvZ3MgYXQgYWxsIHRoYXQgc2hvdyBhbnkgcHJvYmxlbXM/DQo+ID4gPiANCj4gPiBObywg
ZG9uJ3Qga25vdyB3aGVyZSB0byBzdGFydC4gVGhlcmUgYXJlIG5vIGVycm9ycyBsb2dnZWQuDQo+
ID4gDQo+ID4gPiAgIEFsc28sIHlvdSBtaWdodCB3YW50IHRvDQo+ID4gPiAgY2M6ICB0aGUgZHdj
MyBtYWludGFpbmVyLi4uDQo+ID4gDQo+ID4gSSB0aG91Z2h0IEkgZGlkIGJ1dCB0aGF0IGxvb2sg
bGlrZSBvbGQgaW5mbywgYWRkZWQgVGhpbmggTmd1eWVuIG5vdywgdGhhbmtzDQo+ID4gDQo+ID4g
IEpvY2tlDQo+ID4gDQo+ID4gPiANCj4gPiA+ICB0aGFua3MsDQo+ID4gPiANCj4gPiA+ICBncmVn
IGstaGoNCj4gPiANCj4gDQo+IEZvdW5kIGFuZCBVU0JDIERvY2sgYW5kIGNvbm5lY3RlZCB0aGF0
IGJldHdlZW4gZ2FkZ2V0IGFuIFBDIGFuZCB0aGlzIGFsc28gd29ya3Mgd2VsbC4NCj4gU2VlbXMg
bGlrZSBhIGh1YiwgcmVnYXJkbGVzcyBvZiBVU0IyL1VTQjMsIG1ha2UgdGhlIHVzYiBuZXR3b3Jr
IGZ1bmN0aW9uIGluIGJvdGggZGlyZWN0aW9ucy4NCj4gDQo+IEZvdW5kIG91dCBzb21ldGhpbmcg
aW50ZXJlc3RpbmcsIG9uIFBDOg0KPiBjZCAvc3lzL2RldmljZXMvcGNpMDAwMDowMC8wMDAwOjAw
OjE0LjAvdXNiMS8xLTEvcG93ZXIgICMgV2hlcmUgbXkgZ2FkZ2V0IGlzIGNvbm5lY3RlZA0KPiBl
Y2hvIDAgPiB1c2IyX2hhcmR3YXJlX2xwbQ0KPiANCj4gTm93IHBpbmcgd29ya3Mgbm9ybWFsbHku
DQo+IA0KPiBTbyBMUE0gZG9lcyBub3Qgc2VlbSB0byB3b3JrIHByb3Blcmx5IG9uIGdhZGdldC4g
Q2FuIEkgZGlzYWJsZSBMUE0gc29tZWhvdw0KPiBvbiBnYWRnZXQgc2lkZT8gDQo+IA0KPiAgSm9j
a2UNCg0KRm91bmQgc29tZSBEVFMgcXVpcmtzIHRvIGRpc2FibGUgTFBNLCB3b3JrIGZpbmUgOikN
Ck9uZSBvYnNlcnZhdGlvbjoNCg0KcGluZyBvdmVyIE5DTSB0byBMaW51eCBQQzoNClBJTkcgMTY5
LjI1NC4xMDAuMTAyICgxNjkuMjU0LjEwMC4xMDIpOiA1NiBkYXRhIGJ5dGVzDQo2NCBieXRlcyBm
cm9tIDE2OS4yNTQuMTAwLjEwMjogc2VxPTAgdHRsPTY0IHRpbWU9Mi4xNjYgbXMNCjY0IGJ5dGVz
IGZyb20gMTY5LjI1NC4xMDAuMTAyOiBzZXE9MSB0dGw9NjQgdGltZT0yLjE2OCBtcw0KNjQgYnl0
ZXMgZnJvbSAxNjkuMjU0LjEwMC4xMDI6IHNlcT0yIHR0bD02NCB0aW1lPTIuMzMzIG1zDQoNCnBp
bmcgb3ZlciBOQ00gdG8gV2luZG93cyAxMCBQQzoNClBJTkcgMTY5LjI1NC4xMDAuMTAyICgxNjku
MjU0LjEwMC4xMDIpOiA1NiBkYXRhIGJ5dGVzDQo2NCBieXRlcyBmcm9tIDE2OS4yNTQuMTAwLjEw
Mjogc2VxPTAgdHRsPTEyOCB0aW1lPTAuOTIxIG1zDQo2NCBieXRlcyBmcm9tIDE2OS4yNTQuMTAw
LjEwMjogc2VxPTEgdHRsPTEyOCB0aW1lPTAuOTYzIG1zDQo2NCBieXRlcyBmcm9tIDE2OS4yNTQu
MTAwLjEwMjogc2VxPTIgdHRsPTEyOCB0aW1lPTEuMTQzIG1zDQo2NCBieXRlcyBmcm9tIDE2OS4y
NTQuMTAwLjEwMjogc2VxPTMgdHRsPTEyOCB0aW1lPTEuMTYxIG1zDQoNCk5DTSB0byBXaW5kb3dz
IGFwcGVhcnMgdG8gaGF2ZSBtdWNoIGxvd2VyIGxhdGVuY3kuDQoNCiBKb2NrZQ0K
