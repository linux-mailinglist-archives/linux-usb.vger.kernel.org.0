Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 285416C4C84
	for <lists+linux-usb@lfdr.de>; Wed, 22 Mar 2023 14:55:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230475AbjCVNzg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Mar 2023 09:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbjCVNzf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Mar 2023 09:55:35 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3840856532
        for <linux-usb@vger.kernel.org>; Wed, 22 Mar 2023 06:55:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KfyZ0RpdbPmZTtsFtSvNMO3nofqjzo4PuiE3krU+aTjMBRMfq6a1REP6UKksjx4jhBW0alFAriT8vyteEbxLmRtL3A0KX5McTP8VeOWpn+cJy4OAHTn1hcmZWklup+ExiZvo7xdum/abi5wdFnfYLtwvPaiwanW6R00eoETyClfQRrhWmgRMIb5eHlv9KGOqWnaXR1+nHyZ63nlDrNH3P1U1qMA0eFK7ThbvzO/bnWH9YWCR44SObsyv6BYH+WjEFPs1Jz+cL4KFF5LInJ1vwSQb/EZILBxBhbCdcqjmQon1EhU6C+eZ/vuJo6/mj0iyIYOwX6eWsTqmdNJm5w4rUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPq09KZdCdM/picUOlg0KqV8piKf6/fgGcvwN42i5GQ=;
 b=M637Uk5JScjd7sFxRgv7iW+ZJDDukT3dCtDo02NIZPano0RsXipjk1EfqUvgczcSB+3SNRXw8SV0UfENb2T8kpNWCEv5sdYH9bdzourSYOKe/ROADTG5AodmV6IPHMeFgFLK0SFQ1oQUng+QqY6haSIA4SDYXaKSbAImYZg/YRIGcRE4MkqlTBb3CFYcIDPynaDZo3aE3Sh8gGDsxBWh3lm0kKHZvZKeLIek8Km2sQKMu5o96mgtIPDmErXoDeRJ5CJsgyPEKEeCByMqY3TSZKf9tRx4Hh7LhaL+pH3+VNrsgiT3l65eKcGjc/0Tc4lPHFxgL2mJaHLQC0HYSqEfhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPq09KZdCdM/picUOlg0KqV8piKf6/fgGcvwN42i5GQ=;
 b=eK5vuSA5z2eLlINWylAzCkk6Q3q5PR4OBx4cyUUua7sWLdPbNL5r12AvEKMDfPn+8ROScdQceQeHSTSG67mYdvtkmV1yhOY7HE6EdkqYK/893q3U6x8ibM2eql8wo7pyTWppslSt9a9guTmHrSM6/q3wpNwAfoz4dSdawjHuPkk461jC/f9LABtLdgg9eg3vxfUKJUadkAA26bh5kikJYsRwKF6sHqES5rHXOYKo/Lb+RXyAuVJDhS/eBHLSRi64el0py1mrRsbPFLmyaBoMS5UeDQKB+V/Q4Qh0Zn79WsCLUnEPAXTmf4vLY1OOCcV3PdGhMqmhQqoM2ednMxCSOw==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by BN0PR10MB4918.namprd10.prod.outlook.com (2603:10b6:408:12e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 13:55:30 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171%4]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 13:55:30 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: usb tree branch usb-linus merge plan ?
Thread-Topic: usb tree branch usb-linus merge plan ?
Thread-Index: AQHZXKg0f6oFrouED0immaY74o4uma8GrYOAgAAlGIA=
Date:   Wed, 22 Mar 2023 13:55:30 +0000
Message-ID: <7e2d175b1e018d116bff9087c364d7fc398338c2.camel@infinera.com>
References: <8d92e4f66c153bb43c040c5e2f6666978196efd4.camel@infinera.com>
         <ZBrps8reH2AYqZoJ@kroah.com>
In-Reply-To: <ZBrps8reH2AYqZoJ@kroah.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.0 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|BN0PR10MB4918:EE_
x-ms-office365-filtering-correlation-id: 91f0f95b-5fd7-4cb5-e544-08db2add194a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RSfsXn9EnPnKSgEOmOmLWtqS5akfEdHoWIifmKyXzT8IBv4g4pxl8pbGdnHBU3n5+ZydniCVGxCBIOPSe0Cdhh1N2MbpXBHLFDPJ3tliSKU+j6YD5LqMTVoTPM2jfqvadlctIOkojTvxAUFEHHIvPOAf/LEL/7n/gP3cLXFk8cklArtTLdl8WHoQlQZqmpRYMy90vbEZUxLjfMtjbwM/FTcopMH8QP/y0dHIMqOQA2USlwU57FH7yDy1q8TsA368paSxFRQNYwgD4lhF+GtBU0ajqFU0mrO6uiIgfB6xtaqXojyq5z0VPObkOhtzvK8XDIW9E88c+ElajNxc5YO5q/EDXiZdxlWT5BAjxoCZAs0hrzzcIS+gVGtRHj/t2ta/3S6TeHzYaguX+1op8P7cl9E/M1/iTw1hjlFTIHnlRn3qCnFKiaabhSv5ARl0z2geOFuzdbrMSw+E/QYm8Xl8JJKp9hEaXYHCFbiaWqrdh/zmnjly0WAPWC95VzElkxuEd6KM2uGNJH2TspNs3BLq0vGxOp3oXqYj9Us6Aqtv4n8MKFL11rM9tO46A63rWaepR8h6n7OiV+AJf59ewssfwluaKQHKeI2QRBaiYTMeJzUF4jJhOoQL8Pj2rXIdhxjQrqi6iTaWLSL1Z04w+z3z3qEFScJ80I2baSwQs4NzH2h68Nf2pJvaivYsykycN7cj
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(396003)(366004)(376002)(136003)(451199018)(2616005)(71200400001)(186003)(966005)(45080400002)(6486002)(4326008)(478600001)(64756008)(316002)(66556008)(6916009)(91956017)(8676002)(76116006)(66446008)(66946007)(66476007)(6506007)(5660300002)(6512007)(8936002)(2906002)(41300700001)(38100700002)(122000001)(36756003)(86362001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eFF5QzJmT2gxZWU1SXUwZDgrblh5bzNpR1o4dzRKTXhSUTFNUkRQY1VLY2pG?=
 =?utf-8?B?dU1jcGFKOXBlT0Ntd2Z4YmhrQSs4dXFNV0c4QjM3ZDcwODB5elBjSm51Ry83?=
 =?utf-8?B?dHcwbHNBUC8vemdkSXBzYzVXL0tlRFFlakxzQVhsOUowMThvUjk5ckxIRThU?=
 =?utf-8?B?c0Q1cFdhdUV2RzF4L0lKTWdWM3NzTmhHYzhPWU15U3lGREVCVnFqU2FJcEpz?=
 =?utf-8?B?MEtESTdrM2Y5Q1VBd2pRKzdqYVpOYkJzd1NlS0NhdlFHUHgzRjlUQWwzSDM5?=
 =?utf-8?B?NkRUR21jVmxXbVFrQzJFQTQ5Zk5GdGNsQXNoc0hXOHlPZk8reDkxQ0RKVWtN?=
 =?utf-8?B?OGxDNDZXTVhpL1VhbkRYZGxKMEZQenNhVFlWV3JCU2xYY2kyQkFPaVBoZDJN?=
 =?utf-8?B?TUZuY1NDT1FZN1ZGeXNQR3dMcElzUjdNSisyamJWTkFDYUEyZWUwdnYxQTM2?=
 =?utf-8?B?MisrVFZ1cWp2NThSNmNVWFhmS2cyQ1NWbWFiYU1VdnFpclRKSnk4TE5xYjJB?=
 =?utf-8?B?a1JGbG5qdHVrekFjSXJ5ZnFsL0U2S3dTT2V4QlRaOW4zNUdiMDA5aExueHZn?=
 =?utf-8?B?aDZjWFc0OS9YR3VzaUpIYnRkTldTaEJXTHNwbDNTTUN4bG9ZdTN4bXBjdnBv?=
 =?utf-8?B?UVorR0wyTXJqSm44b2pZQVlnZ2hzY0duUXFLSXdrbnVvMTkvM3daUkNWTGNo?=
 =?utf-8?B?dnFtVDEvald1ci9HcUlCWGVYWVA0bjJ3bnpQUmErVjRPbW1wRDZPR3JFcTVr?=
 =?utf-8?B?dFlDWm42NWdNUmszZ01uV2R5ODVvTWwxbWQ4MDRQbzAxcGJDbUpIb1ZvVDhT?=
 =?utf-8?B?U1BXWWJjVWRKN0VDSUJCNFdGU1pxNTFPQkVDcEIxclBuaUJIb3luWno0Ymwv?=
 =?utf-8?B?MDIvNGc5TUtoQy91RlRWUElvM3JIVmNxcTgvU092WmJiSUU3bVN5K3U3N2Ux?=
 =?utf-8?B?YmNnSmg4Wld1eDJGQkI5dVZURSsyVDhleWd0QXBVREJhYW1DbnlmZW1IbUdk?=
 =?utf-8?B?NlRpVmhhSko2M0dwTGQ1WE1JTnUvYjVNckF6TGlwVzVyZWZUSGU5YnExa2Jx?=
 =?utf-8?B?a1lid3hyOXQ1SUg5NU5RYUlWd21uWFZoak15ZUQxMnpWc3ZqTy9XWVNXV0dm?=
 =?utf-8?B?bzFaRTQ5dzAvdGZKOWFzTk9maEp1RlpvRCtRbkRpZHJCanlYWTE0a1pVa2Fv?=
 =?utf-8?B?QmRQUTUzNkQ0dk15TndOb3ZwZGRqWEJBUFJNa3p6RzVuTnVNWW1QUzhUOWJ2?=
 =?utf-8?B?YlBka25zNjc3blNXQUMxd2N4UlBDMWpEOXNKTTgvdnJ5TGZwUmY0TEh5a2c5?=
 =?utf-8?B?MmFCTGpacUJVa08va3NsclZMRU1QNkdQYnZMRjFOY2tOWVo5aXMrL1BVRlhQ?=
 =?utf-8?B?ZEFZaUJnZVpCZkpBREpSZ2hIR3RGajVidG9ud0RZRENYNG8zRCtIMEtSM3J6?=
 =?utf-8?B?Z1BISW1EeWNaL3RBZkhKbk5zd29DN1IwNTZ4QXpPNmxLY1A2MWdGVXRBM1ln?=
 =?utf-8?B?b3g0bHJya3VzSmMxVk84a3NPbklRbFVaWGQ2S0c5N2NwKzk0eUhmTW1KQWhT?=
 =?utf-8?B?TmtTNDlpWnNKRndTQUpBejNrTThqY3FZZzh5SnhCbWg2YlFhWkdsMW0xbGxG?=
 =?utf-8?B?aUxqdHgvWGFhVUhzZmVVbjJQbmw5TWVHL21EVDZlYitQOTgrdVlaSnFiNkM2?=
 =?utf-8?B?a0FLdFhyQVpuanNmZmFCelFVNTZrQzhqdlovQTBiRFFQdzkxUkI2M2xySDZR?=
 =?utf-8?B?MHJ3YWppUlFEK1MyREwwc2lveHQvbUFMZHV5Uzk3V3I1Mi9GaVlndURsZ1BN?=
 =?utf-8?B?cnZxQkx4WklRNnJzN0dRV3hQQVhhNGJnaGROQ3Yydmx2RjNjMFgrV0ZscXJE?=
 =?utf-8?B?ek9hSXNlZlArTUlqYjBQRWcrSjR3Rjh5cXU3bHNCd2ZQVkF5UTZxdU9rWUNr?=
 =?utf-8?B?bit2LzM1UEtERGFQZHpPN3dHVFprT0ZibTVKYkVMV212aE9va0pPVnJTWUVP?=
 =?utf-8?B?MG51Z0h5VG9aZ29rSTYzT0I1b0M1aGdTdFdzSHJ0dnorTE9oTllIN2ViZFN0?=
 =?utf-8?B?bHM0c1E1bHFBSG5XUU5UWGdvcFgyTmxDOWZkSzN5dUtrYU5jMXhyQldlbVZx?=
 =?utf-8?B?OWVyVXNoUGlSTHU5THdvV3oycDFnN29rNkhobTJ2RXpnVkxFamZ6Y3FvU1l1?=
 =?utf-8?Q?glFg/ZRKQ7JKtaB8T8u9ekmfJq8IU075yd2BfNY9lAmV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <04827476A0FDD543B53A328298C36DEE@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91f0f95b-5fd7-4cb5-e544-08db2add194a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2023 13:55:30.3378
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8nf36vVVMmi6bq7FcdNKNhyQDnWapCQrzFZ6APtUbY4HXcqgyJR9IJ/NdAIdkMQL+1VO4owxT6/zVVreHe0cDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4918
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gV2VkLCAyMDIzLTAzLTIyIGF0IDEyOjQyICswMTAwLCBHcmVnIEtIIHdyb3RlOg0KPiBPbiBX
ZWQsIE1hciAyMiwgMjAyMyBhdCAxMDoyMjoyOEFNICswMDAwLCBKb2FraW0gVGplcm5sdW5kIHdy
b3RlOg0KPiA+IEluIGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5j
b20vP3VybD1odHRwcyUzQSUyRiUyRmdpdC5rZXJuZWwub3JnJTJGcHViJTJGc2NtJTJGbGludXgl
MkZrZXJuZWwlMkZnaXQlMkZncmVna2glMkZ1c2IuZ2l0JTJGbG9nJTJGJTNGaCUzRHVzYi1saW51
cyZkYXRhPTA1JTdDMDElN0NKb2FraW0uVGplcm5sdW5kJTQwaW5maW5lcmEuY29tJTdDZDBlZmU4
MDIxZDBiNDNhNzA3YjkwOGRiMmFjYTkwN2IlN0MyODU2NDNkZTVmNWI0YjAzYTE1MzBhZTJkYzhh
YWY3NyU3QzElN0MwJTdDNjM4MTUwODIxNzEzMzk1MDYzJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNk
OGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pY
VkNJNk1uMCUzRCU3QzMwMDAlN0MlN0MlN0Mmc2RhdGE9ejN2WjlQSjA1VHk1SnhFNzZoYlBQcGhK
ZXI5QXRBV1I5bkhpQVp1am9EYyUzRCZyZXNlcnZlZD0wIHRoZXJlIFVDU0kgZml4ZXMgdGhhdA0K
PiA+IHByZXZlbnQgT09QUyBpbiBzdGFibGUgTGludXguDQo+IA0KPiBXaGF0IHNwZWNpZmljIGNv
bW1pdCBhcmUgeW91IGNvbmNlcm5lZCBhYm91dD8NCg0KdXNiOiB1Y3NpX2FjcGk6IEluY3JlYXNl
IHRoZSBjb21tYW5kIGNvbXBsZXRpb24gdGltZW91dA0KdXNiOiB1Y3NpOiBGaXggdWNzaS0+Y29u
bmVjdG9yIHJhY2UNCnVzYjogdWNzaTogRml4IE5VTEwgcG9pbnRlciBkZXJlZiBpbiB1Y3NpX2Nv
bm5lY3Rvcl9jaGFuZ2UoKQ0KDQpUaGV5IGhhdmUgYmVlbiB0aGVyZSBmb3IgMTMgZGF5cyBhbmQg
SSBzdGFydGVkIHRvIHdvbmRlciBpZiB0aGV5IHdlcmUgZGVsYXllZCBvciBtYXJrZWQgZm9yIGEg
bXVjaCBsYXRlciByZWxlYXNlLg0KDQo+IA0KPiA+IEkgZG9uJ3Qgc2VlIGFueSBvZiB0aGVtIGlu
IExpbnVzIHRyZWUgYW5kIHdvbmRlciBpZiB0aGVzZSBhcmUgcGxhbm5lZCBmb3IgbGF0ZXI/DQo+
IA0KPiBIb3BlZnVsbHkgdGhleSB3aWxsIGdldCBzZW50IHRvIExpbnVzIGxhdGVyIHRoaXMgd2Vl
ay4gIElzIHRoZXJlIGENCj4gc3BlY2lmaWMgcnVzaCB0aGF0IHlvdSBuZWVkIHRoaXMgbm93Pw0K
DQpMYXRlciB0aGlzIHdlZWsgaXMgZmluZS7CoA0KDQogIFRoYW5rcw0KICAgICAgICAgIEpvY2tl
DQo+IA0KPiB0aGFua3MsDQo+IA0KPiBncmVnIGstaA0KDQo=
