Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD9CC6B962C
	for <lists+linux-usb@lfdr.de>; Tue, 14 Mar 2023 14:28:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229446AbjCNN2E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Mar 2023 09:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232484AbjCNN1b (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Mar 2023 09:27:31 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::61e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFEE41ABE0
        for <linux-usb@vger.kernel.org>; Tue, 14 Mar 2023 06:24:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rh+t/UXkvomzKhfa/F5ksTrvKgiHWtpLMXgqYeVywTkNhONvBox7SHYiw0f3+k1u6fHYNOm8PX7NGXXKY1rWaYk1OAobeur1n2PHt398EGPpnU0tlPLzr0qny4vjq1ihi3Ensqf1ywMmSLzNnosHqSe2ImDZ6gHBJvRceL2luCne4NSJ7MCITtrgX7SBETFZEd7OPyT4kM/4HYere8nxhQ7GN8ZsilbbbEfZULAcmXe5aIJ+nvq4I06eN8TYs6slh9MmhG3w0Ex0G0aGqz9c2ErVx7KhtrvrFSQdJDuQOZwA2ORC7wmteGwQS1TK5TqBmYjsOabxPs62q4PkNDQ0MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1npJ0X0PrySkEffXYg2KVu3y5L/afS+Fsv9op5CiAc=;
 b=gnYiwZJYbCSrAy7V45nLX0394Vb1B/xtrRDNBpBvqI8fsmU503YuJKODXeSrS675FeZJTBlVw88tYQOJpo3owV0Av5uhMnX6v1m3zAUOz7K0RM+JbNQ2bmdZhmS/oiWaW8sGvRS5mMoITcCDFj6bb2pkqhR74KW/2aSJ0SMXjhYmeDBwCe1L+bXBc3/0vVywA/RtyD6a4+c7DO2B0vHkAUr1XjoHJq2bZloFfgBX9bd+JQ5qhukK5qs8Rrz47pUCoj8Uld5q7rtQquELfAasJdJLhOZ2DAd9bHtPpXNeTx7m8wzcj8gam8VoSTcFLsRmc/DJ9Tmmib0FckGB/9IJVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1npJ0X0PrySkEffXYg2KVu3y5L/afS+Fsv9op5CiAc=;
 b=ih1jSpvApjqF+lwftqHSiQlsubIZSAvAwqpF2It/Z0rM5LPwiS24XhY9YxBKCNatlgq66todc6KGpeK1E/uENfzeqRVoAwamj+8D19WvvsKbbnQkq49oM932sD+LG5Huj9HbovMISuT4RIpf32BXUXxGkpd6zD2DSgrwlGGJiMwdTmifccRSCGumhxfBXHDewAZwvdzERcVHSQVH/ebp8UPbzgjKDXE9qVOyBAE/Qyp60eT7QuI3d96GAVz3stgU71XviEJSK/V2e5U5ROFJ8vHY98U9vAyLQ/MciOb7a+CIOiW57EzZtFcm+eFeJFSrwDbcHlv8zgEzxVRodOTugw==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by PH7PR10MB5697.namprd10.prod.outlook.com (2603:10b6:510:130::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 13:19:25 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171%4]) with mapi id 15.20.6178.022; Tue, 14 Mar 2023
 13:19:25 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Legacy configuration for NCM/RNDIS does not work for Win >= 10
Thread-Topic: Legacy configuration for NCM/RNDIS does not work for Win >= 10
Thread-Index: AQHZUzTnvuOBWwNTH0CfFBqIVx8BD67zxl4AgAAqsICABle4AA==
Date:   Tue, 14 Mar 2023 13:19:25 +0000
Message-ID: <7d2287ea03069b702b8da2157f8148b820de4446.camel@infinera.com>
References: <c52296b791b4c7ba6661226e2e5dfaa678663c78.camel@infinera.com>
         <ZAr+eiTrUN/LV3YN@kroah.com>
         <b626ba525751345e59da4af438c4adf2c833ca0a.camel@infinera.com>
In-Reply-To: <b626ba525751345e59da4af438c4adf2c833ca0a.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|PH7PR10MB5697:EE_
x-ms-office365-filtering-correlation-id: b5b964ad-da55-4f03-c37e-08db248ebb9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jn33sMiScP57HOR1YIoC3m0F0cK8TIp0mq2Uzf7JILJ+DL5QVEifK7Kk0mwKyloQqlJUNUBl/aj0EEdGnLEelaTjCdP5UVW8D2OSNG60LLa3/E5ap632mbUzAKcN/+QiXzvIvR04hwzBtIvBZgw2ZXrw81RNPz4rBQvE50pLwUy48x2IxGcdVVLQj50LGTNfQyoTA3/ii5HZl7tBmd2dDM3yDMjqUwx4KD+C3KQQUMyiFzVujZ3g8XYZZz6A9gcwkYOrS9lPesmxSOc61hHUP0KswNDu8K0Y6EA1I1NicWZUyluyh3kM2Iss2BvsXE+sIZuKYVKRRm77C/mcPmBZaosfh9uzi8S9sjqv5yb+oc4kVOn5RQuHs14ymAx7DQFBt2pq03HyC3UARiGg7GtbCQEFrBvkfLkL+mpenT8CqlQnsM4diTav/DNbXkaBJKOG6rMlLdXUY9XQKJZORelad0gN0IknS17FWUKnRyVGiHCJTiW7AoJgJI7btv+HsFrJ3sk2+vZzrxcvINX6Ak7m4d46k+xEe9lZkF0gpI4ITqM2CZVE/SP6lL+M52M6EBCoyaUY9E+pNrkpTl+XxPGQG9AZKQWm7vZ/+922K3Ox7BFeL0cLI8zHgshf2XaCdjkoZ1/q9bcjjaf4DiCMxj7aUci+Fb7xeuRj/ljmoRFzolDO/BejtAM06sUgGiDjwg7DJKRzSyHHrq256xk5TrmIDw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199018)(71200400001)(6506007)(6512007)(36756003)(5660300002)(6486002)(66556008)(76116006)(66946007)(66476007)(66446008)(122000001)(478600001)(64756008)(8676002)(4326008)(6916009)(83380400001)(316002)(91956017)(86362001)(38100700002)(2906002)(186003)(2616005)(8936002)(38070700005)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MDV3ZDRFNVgxUFNHZXFYY0ppcDFvMVJDZzQ2dXNmakU1cDZUVVVhZ0lGRFht?=
 =?utf-8?B?QlZaZ1RlUk1PRTNmbGVtcVRNcHVkUURXdVVkOWVkcm9qUEJiTjFyT09qZkFx?=
 =?utf-8?B?cmIyRDJ6VHg5d2JKU2FPay9OOElERWxIYXRsZXNManIvRWIrVEJ1WFdDUkVG?=
 =?utf-8?B?aFFJMnhSWnF4ZGFuMGg1eWpxb1J2RTRidTlCcndiUWNrc0VRVldNeFJoSVB5?=
 =?utf-8?B?S205MkVBVXU4VmVtWlgycFdHYmlzV29IbHhGY041RFp0SGdGUEdxci9jMitV?=
 =?utf-8?B?dENscnE0REE4RlpYQWJoaEYvZmFtNVp2K3JvcEwwNWFrTEdXWDltRnplanpV?=
 =?utf-8?B?S2NpUUZEK0pRTGlsZ3Q5VFJsMm5LQXVkcmdRWWt3L1J1WTAvUVplM1pjUnBq?=
 =?utf-8?B?OXZBdTg2RDF1TGhPdTNET1o1bE9hSTBuUi9zTlZEUTNhT0VPNE9QbGRWMUUr?=
 =?utf-8?B?UHQ1SkEzdThUSjVSRFp2N09wbkhrOUY5NkhPaXZFU3NmWitPZyt2cHdZS3gx?=
 =?utf-8?B?MHE4SmFyMHQ3aUZ0cDhzVzJRcGZma1FUYkFQb3gwQkQvQU5yd2ZEeDVTbTdM?=
 =?utf-8?B?STg4OEtheTEwNkIxRFo4dm9LNis5NzF3bkYyZm9rcXdkcWYwZmNyQXdHNFNN?=
 =?utf-8?B?QnEzMkNxOXpCMVR3dGtQOTZ0d09YdDVrMllXUTFvT2Jub255U2lXVVZuU2NX?=
 =?utf-8?B?b2JzZ3lXWnY0U3c5aVFNdE1RYUhiajNueVRZRkV3N3I3TzR4aXA5ekxzSjM1?=
 =?utf-8?B?VW9JdzAxeml2YTR3Y2l2dm9EKytKeHBLakFhMTNNQ2ZPcE91T1VnM1phU3Vp?=
 =?utf-8?B?aDhQQXRMMzMwalozbG5rTzZDdVFkbjBkZHQ1Z3VwUVY5SW1ueEJRQzcrL090?=
 =?utf-8?B?S2h6WU9tNy8yVC9FSkRscjNJbk5DWHhRWnpRZjdSZWVITjJrTWlPRzRaZFl6?=
 =?utf-8?B?aHArT2JJbVpROFlkaTVOOFcwcVVTTTJtTnRDK0VnUlp4SDNna2V6VHhPRnZP?=
 =?utf-8?B?WVV0RjlOcDhUMjBUTDVkbi9lbzUvaXRmcVFNQ3RXUURjbjUwWmZqaHB3M2ND?=
 =?utf-8?B?cFI2ZVpDV1NBNDg4SU0yMEl2eWw1V3hWejNOMmV3Q0xTRjBwZjBGdmdpNGJX?=
 =?utf-8?B?d1JPRDRDT0ZyOGpLYUxTbG5pNnpsQzY5UnhYT1JuRURRRHlnQVc1SXMwN1Vj?=
 =?utf-8?B?UDlJNjFWZ2twRW1PMFhCdmdHZXFpZEFwYVJhNkJQd2U3RUVtck5QNWw5aDBy?=
 =?utf-8?B?UmR5SHZEOHJ6dzJlTXRIcWhhbEJiSG1wVkpUQTV0KzRNLzBkcmtnWVlmNzI1?=
 =?utf-8?B?eHBSVjZOUkRubVBqT1prUnU4TXpTTmVudXdLRlhzTzk2cVhqZ0dKbmZVb2Q3?=
 =?utf-8?B?K1JpbjZlT1B2SVlnTmFmVHZ0c0lRL0ZnTWtNVUhHZXFFbmFTaTYxZnEycDFQ?=
 =?utf-8?B?dnM3Tll5VnhveEF0TDVsRW9wak9pN3B3OFJieGJPaTZrcnFSY2grczBUOEVx?=
 =?utf-8?B?YU5KRkJlRG9oRllGbU43dXMxZGg5bmNoS0k5Z0tUYjRZbGlHdEgza2drTDVS?=
 =?utf-8?B?akVsbThRVWNXeW1nNm5PSGhXa1gyOSt5TFlSWVgrN2cvZG5HaHJhcHMvdDBM?=
 =?utf-8?B?K004MWFUY01ianBsWm1mU1dPN1FkRDc5YnNKcjZlR3hUTmVUUEdwTE9TQlBK?=
 =?utf-8?B?MFhhRUhDR2lvVGF6Z1pCYWhBT1lBcEU4Qm95VHhsWWt3V3RDRlBIeWlFT0s2?=
 =?utf-8?B?aVp4dWZKWDBQam5ud1UxYjhyRGQ5RkZQTStsSzdVM0Ezd2xEazVtNkVmajgr?=
 =?utf-8?B?NjNKeFM3c3Q0S3dIZFZXQU5YS3RrUWVZd3JYWm1UaUJReHZyMDdtZE56M0Jj?=
 =?utf-8?B?NDdKZkJ3dHdtakNxbGxiU0tpbUZ2cHBpVFFUbTI1RTZsSC9EejhWRHJiWVh4?=
 =?utf-8?B?YUh6OHNIVnIzRkpiaC9KL202UUVMd09kNmEwazhDNlpmdklQUTEwZUx2cEtk?=
 =?utf-8?B?Q2QyQy9YRkRyNzhEUmNGNDcrSmhEdm5XVWUvVmRFbDE0OGtxNlU2aHk1RGFs?=
 =?utf-8?B?bUxFcGpnbG11RzR3bDFtNUZUT0trYXJMYjdjdXV2Ry9tWUptNXcxb1FEQnJ5?=
 =?utf-8?B?MW9pRDN2dEVqWDFNYU1hUU1EeHIwSjJTaUlEUyswQmVtL3RPU2tSOVRpRU1S?=
 =?utf-8?Q?nW18u5BDiftV+dnkJ5VZo0eepOY3UxJQ617cNyw9yBB8?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BE81FFE9166CCA40AE3D3A40B7DB40A8@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b964ad-da55-4f03-c37e-08db248ebb9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 13:19:25.4150
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yMczc64vlRCSIJnCpTBImokEx2yOs9dinN2lSk9xbQ9yosDfq2aV0LyeGS2mE7605osGVsI4KyJXnUw46Nf20A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5697
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gRnJpLCAyMDIzLTAzLTEwIGF0IDEzOjI3ICswMTAwLCBKb2FraW0gVGplcm5sdW5kIHdyb3Rl
Og0KPiBPbiBGcmksIDIwMjMtMDMtMTAgYXQgMTA6NTUgKzAxMDAsIGdyZWdraEBsaW51eGZvdW5k
YXRpb24ub3JnIHdyb3RlOg0KPiA+IE9uIEZyaSwgTWFyIDEwLCAyMDIzIGF0IDA5OjQ0OjI2QU0g
KzAwMDAsIEpvYWtpbSBUamVybmx1bmQgd3JvdGU6DQo+ID4gPiBUaGUgb2xkIFJORElTL05DTSBj
b25maWdzIGRvZXMgbm90IHdvcmsgYWdhaW5zdCBtb2Rlcm4gV2luZG93cy4gSSB3b25kZXIgaWYg
dGhlcmUNCj4gPiA+IHNob3VsZC9jb3VsZCBiZSB1cGRhdGVkIHRvIHdvcmtpbmcgc3RhdGUgPw0K
PiA+IA0KPiA+IFBsZWFzZSBuZXZlciB1c2UgUk5ESVMgb24gbW9kZXJuIHN5c3RlbXMgdW5sZXNz
IHlvdSBmdWxseSB0cnVzdCB0aGUNCj4gPiAib3RoZXIgc2lkZSIgb2YgdGhlIGNvbm5lY3Rpb24g
YXMgaXQgaXMgbm90IGEgc2VjdXJlIHByb3RvY29sIGJ5IGFueQ0KPiA+IG1lYW5zLg0KPiANCj4g
WWVzLCB3ZSB3aWxsIG1vdmUgdG8gTkNNIChuZXcgaW4gPj0gV2luZG93cyAxMCkNCj4gDQo+ID4g
DQo+ID4gTkNNIHNob3VsZCAianVzdCB3b3JrIiBpbnN0ZWFkLiAgV2hhdCBleGFjdGx5IGlzIGZh
aWxpbmcsIGFuZCB3aGF0DQo+ID4gc3BlY2lmaWNhbGx5IGRvIHlvdSBtZWFuIGJ5ICJtb2Rlcm4g
V2luZG93cyI/DQo+IA0KPiBOQ00gZG9lcyBub3QganVzdCB3b3JrIG9uIFdpbmRvd3MgPj0gMTAg
aXQgbmVlZHMgY29uZmlnZnMgc2V0dGluZ3M6DQo+IA0KPiBOQ00gc25pcHBlZDoNCj4gCWVjaG8g
MSAgICAgICA+IG9zX2Rlc2MvdXNlDQo+IAllY2hvIDB4YmMgICAgPiBvc19kZXNjL2JfdmVuZG9y
X2NvZGUNCj4gCWVjaG8gTVNGVDEwMCA+IG9zX2Rlc2MvcXdfc2lnbg0KPiANCj4gCW1rZGlyIGZ1
bmN0aW9ucy9uY20udXNiMA0KPiAJbWtkaXIgLXAgZnVuY3Rpb25zL25jbS51c2IwL29zX2Rlc2Mv
aW50ZXJmYWNlLm5jbQ0KPiAgICAgI1NldCBjb21wYXRpYmxlIGlkIHNvIHRoYXQgV2luZG93cyAx
MCBjYW4gbWF0Y2ggdGhpcyBmdW5jdGlvbiB0bw0KPiAgICAgIyBOQ00gZHJpdmVyIG1vcmUgZWFz
aWx5Lg0KPiAJZWNobyBXSU5OQ00gICA+IGZ1bmN0aW9ucy9uY20udXNiMC9vc19kZXNjL2ludGVy
ZmFjZS5uY20vY29tcGF0aWJsZV9pZA0KPiANCj4gCW1rZGlyIC1wIGNvbmZpZ3MvYy4xDQo+IAlt
a2RpciAtcCBjb25maWdzL2MuMS9zdHJpbmdzLzB4NDA5DQo+IAllY2hvICJjb25mMSIgPiBjb25m
aWdzL2MuMS9zdHJpbmdzLzB4NDA5L2NvbmZpZ3VyYXRpb24NCj4gCWxuIC1zIGZ1bmN0aW9ucy9u
Y20udXNiMCBjb25maWdzL2MuMQ0KPiAJaWYgWyAhIC1MIG9zX2Rlc2MvYy4xIF0NCj4gCXRoZW4N
Cj4gCQkgbG4gLXMgY29uZmlncy9jLjEgb3NfZGVzYw0KPiAJZmkNCj4gDQo+IE5ldyBSTkRJUyBp
biBXaW5kb3dzID49IDEwDQo+IAllY2hvIDEgICAgICAgPiBvc19kZXNjL3VzZQ0KPiAJZWNobyAw
eGJjICAgID4gb3NfZGVzYy9iX3ZlbmRvcl9jb2RlDQo+IAllY2hvIE1TRlQxMDAgPiBvc19kZXNj
L3F3X3NpZ24NCj4gDQo+IAlta2RpciBmdW5jdGlvbnMvcm5kaXMudXNiMA0KPiAJbWtkaXIgLXAg
ZnVuY3Rpb25zL3JuZGlzLnVzYjAvb3NfZGVzYy9pbnRlcmZhY2Uucm5kaXMNCj4gDQo+IAkjU2V0
IGNvbXBhdGlibGUgLyBzdWItY29tcGF0aWJsZSBpZCdzIHNvIHRoYXQgV2luZG93cyBjYW4gbWF0
Y2ggdGhpcw0KPiAgICAgIyBmdW5jdGlvbiB0byBSTkRJUzYgZHJpdmVyIG1vcmUgZWFzaWx5Lg0K
PiAJZWNobyBSTkRJUyAgID4gZnVuY3Rpb25zL3JuZGlzLnVzYjAvb3NfZGVzYy9pbnRlcmZhY2Uu
cm5kaXMvY29tcGF0aWJsZV9pZA0KPiAJZWNobyA1MTYyMDAxID4gZnVuY3Rpb25zL3JuZGlzLnVz
YjAvb3NfZGVzYy9pbnRlcmZhY2Uucm5kaXMvc3ViX2NvbXBhdGlibGVfaWQNCj4gDQo+IAlta2Rp
ciAtcCBjb25maWdzL2MuMQ0KPiAJbWtkaXIgLXAgY29uZmlncy9jLjEvc3RyaW5ncy8weDQwOQ0K
PiAJZWNobyAiY29uZjEiID4gY29uZmlncy9jLjEvc3RyaW5ncy8weDQwOS9jb25maWd1cmF0aW9u
DQo+IAlsbiAtcyBmdW5jdGlvbnMvcm5kaXMudXNiMCBjb25maWdzL2MuMQ0KPiAJaWYgWyAhIC1M
IG9zX2Rlc2MvYy4xIF0NCj4gCXRoZW4NCj4gCSAJbG4gLXMgY29uZmlncy9jLjEgb3NfZGVzYw0K
DQoNCkRpZCB0aGlzIG1ha2UgYW55IHNlbnNlIHRvIHlvdSA/IFRoZSBvbGQgbGVnYWN5L2J1aWx0
aW4gY29uZmlncyBkb2VzIG5vdCBkbyBhbnkgb2YgdGhpcy4NCg0KIEpvY2tlDQo=
