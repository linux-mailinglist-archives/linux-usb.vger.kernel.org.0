Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC076B2F1D
	for <lists+linux-usb@lfdr.de>; Thu,  9 Mar 2023 21:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231255AbjCIUwk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Mar 2023 15:52:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231165AbjCIUwX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Mar 2023 15:52:23 -0500
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on20610.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eb2::610])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 854AF6484D
        for <linux-usb@vger.kernel.org>; Thu,  9 Mar 2023 12:51:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5bJICwADny8XF3hYuAr1mwHfzXOT8n+IbEziJOrj+jStPWOhFd+MYSEdDhLrmwk8fHI6l4FwogQIsgSKNPRt/poJpFplrbcJQ+VAGizWtPGAj0NtQCoOq732MQM9B+FVR2/be8uUGSYqDfwzGJgA5oT89fM8tOBIDfoM296s1lblxfFk6OG58h9d66QoqK1yhZcAQhqvNVL64blxBaJF0cTVRYb8FBVpsPsOBCq2LmqOikjF7fE7hqHx//kVBGrre4nBGjTDEeHkysGMOnJFIsv7riZP+5W1k7fCgbXFoWkK/4mq9G7xj2bki1Sr5j8iPkX4ZydT/IjC5xrFYVmAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSAsZUt3heR8xjfL35f/XUR/aghcnbTlRysScp1+19o=;
 b=h85YKCMiGp+lsgW9bHEurfyvYmyOuFVJvoJycdQm7aMecLwvUbMjuLklfClBtGs9TjNGbYcKuAG7FdUjP5SWzOLDzDWXbW6LWFgQgvIUwJpFiQzPymPJc0qQbHEdVTK7UZ34S7piZVyCfQkGtsmsz9POmhxPtYNtxgBVk5DpZCibGOkbsXGKyE8X3PA7Ul44NGnXNz4RXzZRCg3dwO/E3WKQ15xgzzyZzMWjwEE2pfILG8cnzFqQlbjsLUAH61E8xnobiC8ZMxwh+OtPhBOLoYSpsiRw+TZqvFKVl1R5of9R9UxxzHEnxm3sfelnr3lMVbMrbKw818bR2nG+VV+e2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSAsZUt3heR8xjfL35f/XUR/aghcnbTlRysScp1+19o=;
 b=iIczdW0xqTaGznVvHYkA7YtIThsGWoUzrsGRNbFmzBGwJLdLM2KdMGaaXPT+FMWPMgcOTB9H/BZFOG00iU7D4ubX5bkjidfQFGmJAtK1GLK8mJem+0xSD5+UoFRZcec6EZYtcZu2oK2TBIemvfMD2cgEl+7ulwdN04jpMLP422W9+1zSiwebx36x77npT28qtRzPHvKX85YGxpniXo5Ijf/wzBNnmHupq6MUGcSF63H94VvQN+tnVWWCFZW0vRePqseBQB/eFSC81DFz+yCcxdXLIiRLXi+v0zmSWX0qUnx68pnaopnV8WjUcCzknrb1zpkYFM4aeomC3aFk1Hg5Cg==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by PH0PR10MB4424.namprd10.prod.outlook.com (2603:10b6:510:41::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Thu, 9 Mar
 2023 20:50:56 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171%5]) with mapi id 15.20.6178.017; Thu, 9 Mar 2023
 20:50:56 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "Thinh.Nguyen@synopsys.com" <Thinh.Nguyen@synopsys.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>
Subject: Re: dwc3 gadget and USB3
Thread-Topic: dwc3 gadget and USB3
Thread-Index: AQHZUeDbzC3YzvbOF0edn6Gh7r6tPa7xIiEAgAANS4CAAAy+gIAAKXUAgAE//gCAAAYfAIAAMwIAgAAPLgA=
Date:   Thu, 9 Mar 2023 20:50:56 +0000
Message-ID: <08af59771700795133a9522d8ba5dc7272a78142.camel@infinera.com>
References: <c604031d4e3aa215b90f73e9a2dd55e7e116186f.camel@infinera.com>
         <ZAjE+p4IoXk/kvXu@kroah.com>
         <d4be672670da6b06456b5a82624e3db0128fdae8.camel@infinera.com>
         <ZAja0So7EDH5FfI0@kroah.com>
         <e31b7802f0b33f66338b009de898526b8eb936f6.camel@infinera.com>
         <14bebac5f1e046c4fcdedc540bcdddc83cdd2b47.camel@infinera.com>
         <4f6fa0c5f077c01c7fb5b15667d061ffa81af8ea.camel@infinera.com>
         <20230309195634.e4r5fjbqtycwt4dq@synopsys.com>
In-Reply-To: <20230309195634.e4r5fjbqtycwt4dq@synopsys.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|PH0PR10MB4424:EE_
x-ms-office365-filtering-correlation-id: 1383c532-c51e-4877-2e0c-08db20dffaf1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v6lu1kaHMHIdw8U7r+Vl3GmoJiFUXRWQ/6Jao5aN+E779ZG3yA7kfdUJxJmYp9lXxON8r0SGWBNPpQvZ/08zuNO45PjUg/5dpS829tymyCWxgueiidDV44VRjacXf/nkq1sV9Jtd9jsafGYAo4t07nuqDixU4R4PCjukmWJYgZjbA9TyAETUVB3iIM+kuBtFgjb+RDsw55GSmWjrIuts4pVg5rmgb9SKHXZU9tIg2pdqMPghqGzvyrAi1rGio8AEtNv+HipQ7yoZ6FSQJorUAqjr3WIIuH75A/0gvXbw+b77DevSjEqqGVNUbG/+HJ/GWRIs0bTvwYRWMCGor76WuuyrPO9ObW5pWhQhh+/whQLv5Ygm2OA3+0ijM1HAT3u/oukotyr5cBz+AegIAyenpa8nQw1APaaPIey//hYUKxyCIt6BUP+AN9qLFoZOWV1egDX8A5cZPa/t6AqSBmfCdo4AfR8he7U6JsZc4QjF9ri9Mw8R4F14a1anLcB9g6M80XYdyEnNPIcsqt0/tIC1AJJQocXRopqcuFlxXI/Dt21T81UwzbbyebmCJ/I3C7w23F5PZdGbftHioMOQ0cJa6SK3bySNJuDiEw6tsE5BQSk7C92qHqCVCYpdP9J8jaMGRkzL3OL+6oT9BzynkXlEzjxo6Ebu9gRHLmpy2QW/eEI6mSJzlavshQ8ck2nNPLjhTkozfjVPKxHhrE9Q7DnxPw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(451199018)(6486002)(71200400001)(186003)(36756003)(54906003)(478600001)(122000001)(38100700002)(316002)(86362001)(38070700005)(6512007)(83380400001)(41300700001)(2616005)(6506007)(66556008)(91956017)(8936002)(5660300002)(8676002)(66476007)(2906002)(6916009)(66446008)(76116006)(4326008)(66946007)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZkxHR3Y5ekN4ektZTVBqbmtyditBSFhwVjY5djJ6eDlqUkdRTWxQOHVwbG5L?=
 =?utf-8?B?Tjk5WjJpeURXc1pQa3JhTTZ0amZ4RXc3ZXhiY0FORXpyZVUzcFF6QjNlQXc3?=
 =?utf-8?B?ak80QTdyeFZBZ1dHbUF4Y3RUNEtCcm1XV2V3WlMwWW1oNUVxcXcvaUY2dXo2?=
 =?utf-8?B?emFTUEMrSi91WnhzdDRXVjFNV0FxUkg4MEtjVlgweVZuWDdtVEEvL0ZCQTVq?=
 =?utf-8?B?R0xrTVdvK1hyRXhKRm5XQXl3TlN6VHJVQXVHdjdtWXBJOGUzTEkzc3o5NWpx?=
 =?utf-8?B?VHFDV0tCbUMzeVhGUEp2SWJwdGtxTUF3WEp5T1dxdmhTNXVicjMwaXc1ZGpB?=
 =?utf-8?B?aEVhVVlENHJSVUpDUTVaTTVUbmk3NWdhTzJqV1EyTzViUzJLRjdFWmxKMEFo?=
 =?utf-8?B?YWVlVm1INHd3T0tsY0Nvckt1aXBzV0lhdXVxOU1iaDV1OEd3dFJNUms1cWVU?=
 =?utf-8?B?dHJiVXFjYkRLUkFOM0I4eFQvQ3BXZjh4bEZOZy9zcGk2S0xJSGJ2TUdkWTJC?=
 =?utf-8?B?R0VVRU9tYkVQa1NDSW92dnVrUXNpSkpoa0Nla2p1U1RHS2k0TjlIc0JnTk5K?=
 =?utf-8?B?Mno0ZnFnNkxQbjZhczRhdmlBemdQeWdHdjFwTHVhTElZMnNZcmdscHlMU2dn?=
 =?utf-8?B?dkhWbjVoT3VvVTJiQkZ5VGduRnI1NnQ3VHUzcy8rQ290VnIrdzRILzRSdFhT?=
 =?utf-8?B?anlpQ095SHR1ZC9XcVlwTkFkMW81ZHNCQXV6Sk4rZkdUK2pFdWZxMS82MTdT?=
 =?utf-8?B?NEZmd2xjeVgxUjhMUkp2M0VsQXRRbktQZjNVMjhMTEhmbUFnb1A3am1kbkFH?=
 =?utf-8?B?SWE3bWhiV1ZwOUdKVmxscjFRTDRoaG9meHYrc1JGWFVxRWQweHEralNOUGM1?=
 =?utf-8?B?T0hMYVlUSisxWE04VzBBUG41SFFxdUFaUGdpRlBsTXNuODI3em9ER0drOVhI?=
 =?utf-8?B?dVpOQ3lmVm53eEh4V3VFY3ZnWTdsWGQ1OFNlQm9QNTV0ZmdmWFJEK2EvempQ?=
 =?utf-8?B?M3dGKzd0b3hsa3RObTVoREg5eGxWbXlaSnVJWTJOL3BiN3BkVk44RVZ0MUEw?=
 =?utf-8?B?NEhFVVc3ODBPa1BSNXAxMEJZSjBiSjBqOU5nSXpXUDZtZlNlaUpuUUs3REo3?=
 =?utf-8?B?NFUyNVNNZnhGTDVqU1RuKzU0ai9iVzJjUnlDVWJnK1VYa1NWRDlva2U2Y3N0?=
 =?utf-8?B?NmxIbWhHbHJSb2dNT0p6VktLZzgvOUlJM1FhMlI2ZTRwOTZ0bytRT3dBK29j?=
 =?utf-8?B?OHJUSDEzVVpWbGsyQUUvM0w1RlJ3d2dBSS95a01VOGpvbUJzMzljamU1NVVZ?=
 =?utf-8?B?Nko3aUF3bDhsTzBnUGRFUU9MSWJ5UXJmaFRpeGJkaGpoTkQxZmp2SmhaYzJq?=
 =?utf-8?B?aXlXdHpCYXZDcktzYWpNcTJSYllrM29pTnZhVUI1VmpmVXFPUE1Jalp1R1Q5?=
 =?utf-8?B?dFRnMFZtVCtDcTZGQjROUStETGF4Y3ZhalFhRnJRTkVyWHZQZXpMZnRqa3dh?=
 =?utf-8?B?REJMOFJINjF5bmRzVU5PRit2VkJSWjZZWHVKREVQenpIRGU3R2diQ1B0N2Rj?=
 =?utf-8?B?a1pPcHFxdG1KcHI1aktWbUFYczJaNUpLcFNXbGdSSmQ4bFg0Wk0yRnZJNm4y?=
 =?utf-8?B?MEdNa3BaVGFqVk41Q1BhalJpWXRFR3lJbDRpWFpockYwY094Zk1sOHg2Y0RD?=
 =?utf-8?B?bkNBWjZIeVI5RElicnZNdnVEc2YvOTE2UXdCT0Mzb1lyaHhmeGp1WFRmZ05y?=
 =?utf-8?B?ZFZyNS9OZEVIRkZoQWNudXY2K0krbVZSMlpYdWl0bnN3YnlXcUdHYzdQNjR5?=
 =?utf-8?B?dllFUTZuV1NkQzVKWWQ4OThHMkZ5N21YK0doN1h0dEVrT1FuN2pYMUxKbEl2?=
 =?utf-8?B?dTZ4eHZUTzlGNmhFYzUrVlFQRDZWL00zd3kxMm1SaWt4aWgxMy9OKzJzbVRJ?=
 =?utf-8?B?VHo0WWVML1FCeUU3UHU5MVdOVDZzZlFEaFpja0NLYlh6bzBIQ0piV2JXdlpT?=
 =?utf-8?B?NHUrczY1RkFJVzNjK2U2RWRvZUtiWElualNvVi9rRUhIcWR6VWtCbTJWK1h4?=
 =?utf-8?B?T2FjaDAyTjlXWDdBWndtQnc2RFFGZkY0S3VBRHRiTzBmTkFOZEFHcWZiKzFJ?=
 =?utf-8?B?M0kzV0x0M2NCTUVaOHNiTVVoWm5HbHVRVkM1aUw4OTZYWlF2STgwemtyNmxj?=
 =?utf-8?Q?o62W5YlH1GrToXtenjgsl3Apk256jifuPBeoEQH+R1mT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <91343C5EA0B09E45977D382387CE6F72@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1383c532-c51e-4877-2e0c-08db20dffaf1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2023 20:50:56.2494
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CReraZvA3WWzm/fG8O8W41qz44Ca5OCS/8uWRWqDvKUQ41Ty0i2Rzbqb6vqNcfHCuw3NdMEiUm7ACN3KGeuc6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4424
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCAyMDIzLTAzLTA5IGF0IDE5OjU2ICswMDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+
IE9uIFRodSwgTWFyIDA5LCAyMDIzLCBKb2FraW0gVGplcm5sdW5kIHdyb3RlOg0KPiA+IE9uIFRo
dSwgMjAyMy0wMy0wOSBhdCAxNzozMiArMDEwMCwgSm9ha2ltIFRqZXJubHVuZCB3cm90ZToNCj4g
PiA+IE9uIFdlZCwgMjAyMy0wMy0wOCBhdCAyMjoyNiArMDEwMCwgSm9ha2ltIFRqZXJubHVuZCB3
cm90ZToNCj4gPiA+ID4gT24gV2VkLCAyMDIzLTAzLTA4IGF0IDE5OjU4ICswMTAwLCBncmVna2hA
bGludXhmb3VuZGF0aW9uLm9yZyB3cm90ZToNCj4gPiA+ID4gPiBPbiBXZWQsIE1hciAwOCwgMjAy
MyBhdCAwNjoxMjo1MVBNICswMDAwLCBKb2FraW0gVGplcm5sdW5kIHdyb3RlOg0KPiA+ID4gPiA+
ID4gT24gV2VkLCAyMDIzLTAzLTA4IGF0IDE4OjI1ICswMTAwLCBHcmVnIEtIIHdyb3RlOg0KPiA+
ID4gPiA+ID4gPiBPbiBXZWQsIE1hciAwOCwgMjAyMyBhdCAwNToxMDoxN1BNICswMDAwLCBKb2Fr
aW0gVGplcm5sdW5kIHdyb3RlOg0KPiA+ID4gPiA+ID4gPiA+IHdlIGFyZSB1c2luZyBmc2wtbHMx
MDQzYS1yZGIgYmFzZWQgZGVzaWduIGJ1dCB3aXRoIGEgbHMxMDIzYSBTT0MgYW5kDQo+ID4gPiA+
ID4gPiA+ID4gdXNlIFVTQjAgaW4gZ2FkZ2V0IG1vZGUgcnVubmluZyBlaXRoZXIgTkNNIG9yIFJO
RElTIGV0aGVybmV0IG9uIHRvcC4NCj4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiBX
aGVuIHdlIGNvbm5lY3QgdGhlIGdhZGdldCB0byBhIFBDKExpbnV4IG9mIFdpbmRvd3MpIG92ZXIg
YW4gVVNCMiBodWIsDQo+ID4gPiA+ID4gPiA+ID4gbmV0d29ya2luZyhOQ00gb3IgUk5ESVMpIHdv
cmtzIHdlbGwuDQo+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gSG93ZXZlciwgd2hl
biB3ZSBjb25uZWN0IHRoZSBnYWRnZXQgZGlyZWN0bHkgdG8gdGhlIFBDL2xhcHRvcCB3aGljaCB1
c2VzIFVTQjMNCj4gPiA+ID4gPiA+ID4gPiB3ZSBzZWUgc29tZXRoaW5nIG9kZDoNCj4gPiA+ID4g
PiA+ID4gPiAgIFBpbmcgZnJvbSBQQyB0byBnYWRnZXQgd29ya3MuDQo+ID4gPiA+ID4gPiA+ID4g
ICBQaW5nIGZyb20gZ2FkZ2V0IHRvIGxhcHRvcCBkb2VzIG5vdC4gSG93ZXZlciBpZiB3ZSBhbHNv
IHBpbmcgZnJvbSBQQyBhdCB0aGUgc2FtZSB0aW1lIHdlDQo+ID4gPiA+ID4gPiA+ID4gICBzZWUg
Z2FkZ2V0IHRvIFBDIHN0YXJ0IHdvcmtpbmcuDQo+ID4gPiA+ID4gPiA+ID4gU2VlbXMgbGlrZSBw
aW5nIGZyb20gdGhlIFBDIHRpZ2dlcnMgdGhlIGdhZGdldCB0byBzZWUgaW5jb21pbmcgcGtncyBz
b21laG93Lg0KPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+IEFueSBpZGVhIHdoYXQg
bWlnaHQgYmUgd3Jvbmcgb3IgaG93IHRvIGRlYnVnIHRoaXM/DQo+ID4gPiA+ID4gPiA+ID4gS2Vy
bmVsIDUuMTUuODcNCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IDUuMTUueSBpcyB2ZXJ5
IG9sZCwgZG9lcyB0aGlzIGFsc28gaGFwcGVuIG9uIDYuMj8NCj4gPiA+ID4gPiA+ID4gDQo+ID4g
PiA+ID4gPiANCj4gPiA+ID4gPiA+IEkganVzdCB0cmllZCA2LjEuMTUgYW5kIHRoZSBwcm9ibGVt
IHJlbWFpbnMsIEkgaG9wZSB0aGF0IGlzIGNsb3NlIGVub3VnaCA/DQo+ID4gPiA+ID4gDQo+ID4g
PiA+ID4gSXQncyBnb29kIGVub3VnaCA6KQ0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IEhhdmUgYW55
IGxvZ3MgYXQgYWxsIHRoYXQgc2hvdyBhbnkgcHJvYmxlbXM/DQo+ID4gPiA+ID4gDQo+ID4gPiA+
IE5vLCBkb24ndCBrbm93IHdoZXJlIHRvIHN0YXJ0LiBUaGVyZSBhcmUgbm8gZXJyb3JzIGxvZ2dl
ZC4NCj4gPiA+ID4gDQo+ID4gPiA+ID4gICBBbHNvLCB5b3UgbWlnaHQgd2FudCB0bw0KPiA+ID4g
PiA+ICBjYzogIHRoZSBkd2MzIG1haW50YWluZXIuLi4NCj4gPiA+ID4gDQo+ID4gPiA+IEkgdGhv
dWdodCBJIGRpZCBidXQgdGhhdCBsb29rIGxpa2Ugb2xkIGluZm8sIGFkZGVkIFRoaW5oIE5ndXll
biBub3csIHRoYW5rcw0KPiA+ID4gPiANCj4gPiA+ID4gIEpvY2tlDQo+ID4gPiA+IA0KPiA+ID4g
PiA+IA0KPiA+ID4gPiA+ICB0aGFua3MsDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gIGdyZWcgay1o
ag0KPiA+ID4gPiANCj4gPiA+IA0KPiA+ID4gRm91bmQgYW5kIFVTQkMgRG9jayBhbmQgY29ubmVj
dGVkIHRoYXQgYmV0d2VlbiBnYWRnZXQgYW4gUEMgYW5kIHRoaXMgYWxzbyB3b3JrcyB3ZWxsLg0K
PiA+ID4gU2VlbXMgbGlrZSBhIGh1YiwgcmVnYXJkbGVzcyBvZiBVU0IyL1VTQjMsIG1ha2UgdGhl
IHVzYiBuZXR3b3JrIGZ1bmN0aW9uIGluIGJvdGggZGlyZWN0aW9ucy4NCj4gPiA+IA0KPiA+ID4g
Rm91bmQgb3V0IHNvbWV0aGluZyBpbnRlcmVzdGluZywgb24gUEM6DQo+ID4gPiBjZCAvc3lzL2Rl
dmljZXMvcGNpMDAwMDowMC8wMDAwOjAwOjE0LjAvdXNiMS8xLTEvcG93ZXIgICMgV2hlcmUgbXkg
Z2FkZ2V0IGlzIGNvbm5lY3RlZA0KPiA+ID4gZWNobyAwID4gdXNiMl9oYXJkd2FyZV9scG0NCj4g
PiA+IA0KPiA+ID4gTm93IHBpbmcgd29ya3Mgbm9ybWFsbHkuDQo+ID4gPiANCj4gPiA+IFNvIExQ
TSBkb2VzIG5vdCBzZWVtIHRvIHdvcmsgcHJvcGVybHkgb24gZ2FkZ2V0LiBDYW4gSSBkaXNhYmxl
IExQTSBzb21laG93DQo+ID4gPiBvbiBnYWRnZXQgc2lkZT8gDQo+ID4gPiANCj4gDQo+IFRoZXJl
J3Mgbm8gb3B0aW9uIGluIGdhZGdldCBjb25maWdmcyB0byBhbGxvdyB5b3UgdG8gZG8gdGhhdCBh
dCB0aGUNCj4gbW9tZW50LiBZb3UgY2FuIGRpc2FibGUgTFBNIGluIGR3YzMgY29udHJvbGxlciBp
biB0aGUgZGV2aWNldHJlZSB3aXRoDQo+ICJzbnBzLGRpc19lbmJsc2xwbV9xdWlyayIgaW5zdGVh
ZC4NCg0KWWVzLCBJIGZvdW5kIHRoYXQuIFRoYW5rcy4NCg0KPiANCj4gSWYgdGhlIGhvc3QgcHV0
cyB0aGUgZ2FkZ2V0IGluIHN1c3BlbmQsIHRoZSBnYWRnZXQgd29uJ3QgYmUgYWJsZSB0bw0KPiBj
b21tdW5pY2F0ZSB3aXRoIHRoZSBob3N0IHVudGlsIHRoZSBob3N0IHdha2VzIHRoZSBnYWRnZXQg
dXAgYW5kIHN0YXJ0cw0KPiB0YWxraW5nIHRvIHRoZSBnYWRnZXQgYWdhaW4uIFRoZSBnYWRnZXQg
bWF5IGJlIGFibGUgdG8gc2lnbmFsIHRoZSBob3N0DQo+IHRvIHdha2V1cCB2aWEgcmVtb3RlIHdh
a2V1cC4gRGlkIHlvdSBjaGVjayBpZiB0aGUgZGV2aWNlIGlzIGluIHN1c3BlbmQ/DQo+IElmIGl0
J3MgaW4gc3VzcGVuZCwgaXMgdGhlIGdhZGdldCBlbmFibGVkIHdpdGggcmVtb3RlIHdha2V1cD8g
RGlkIHRoZQ0KPiBOQ00gZHJpdmVyIHNlbnQgYSByZW1vdGUgd2FrZXVwIHNpZ25hbCB0byB0aGUg
aG9zdD8gSSBkaWRuJ3QgdmVyaWZ5LCBidXQNCj4gSSBzdXNwZWN0IHRoZSBOQ00gZ2FkZ2V0IGRy
aXZlciBpc24ndCBjb25maWd1cmVkL2ltcGxlbWVudGVkIHdpdGggcmVtb3RlDQo+IHdha2V1cC4N
Cg0KVGhlbiBtYXliZSBOQ00vUk5ESVMgc2hvdWxkIGluZm9ybS9kaXNhYmxlIExQTSBpbiB0aGUg
ZGV2aWNlIGRyaXZlcj8NCk9uZSBjYW5ub3QgaGF2ZSBoYWxmIGFuIGltcGwuIG9mIHRoaXMgZmVh
dHVyZS4NCg0KPiANCj4gWW91IGNhbiB3b3JrIGFyb3VuZCB0aGlzIGJ5IGRpc2FibGluZyBMUE0s
IHdoaWNoIHJlbW92ZXMgYW55IHBvd2VyDQo+IHNhdmluZyBhcyB5b3UndmUgdGVzdGVkLg0KDQpZ
ZXMsIHdlIGRvbid0IHJlcXVpcmUgTFBNIHNvIHRoaXMgd2lsbCB3b3JrIGZvciB1cy4NCg0KPiAN
Cj4gQlIsDQo+IFRoaW5oDQo+IA0KPiA+ID4gIEpvY2tlDQo+ID4gDQo+ID4gRm91bmQgc29tZSBE
VFMgcXVpcmtzIHRvIGRpc2FibGUgTFBNLCB3b3JrIGZpbmUgOikNCj4gPiBPbmUgb2JzZXJ2YXRp
b246DQo+ID4gDQo+ID4gcGluZyBvdmVyIE5DTSB0byBMaW51eCBQQzoNCj4gPiBQSU5HIDE2OS4y
NTQuMTAwLjEwMiAoMTY5LjI1NC4xMDAuMTAyKTogNTYgZGF0YSBieXRlcw0KPiA+IDY0IGJ5dGVz
IGZyb20gMTY5LjI1NC4xMDAuMTAyOiBzZXE9MCB0dGw9NjQgdGltZT0yLjE2NiBtcw0KPiA+IDY0
IGJ5dGVzIGZyb20gMTY5LjI1NC4xMDAuMTAyOiBzZXE9MSB0dGw9NjQgdGltZT0yLjE2OCBtcw0K
PiA+IDY0IGJ5dGVzIGZyb20gMTY5LjI1NC4xMDAuMTAyOiBzZXE9MiB0dGw9NjQgdGltZT0yLjMz
MyBtcw0KPiA+IA0KPiA+IHBpbmcgb3ZlciBOQ00gdG8gV2luZG93cyAxMCBQQzoNCj4gPiBQSU5H
IDE2OS4yNTQuMTAwLjEwMiAoMTY5LjI1NC4xMDAuMTAyKTogNTYgZGF0YSBieXRlcw0KPiA+IDY0
IGJ5dGVzIGZyb20gMTY5LjI1NC4xMDAuMTAyOiBzZXE9MCB0dGw9MTI4IHRpbWU9MC45MjEgbXMN
Cj4gPiA2NCBieXRlcyBmcm9tIDE2OS4yNTQuMTAwLjEwMjogc2VxPTEgdHRsPTEyOCB0aW1lPTAu
OTYzIG1zDQo+ID4gNjQgYnl0ZXMgZnJvbSAxNjkuMjU0LjEwMC4xMDI6IHNlcT0yIHR0bD0xMjgg
dGltZT0xLjE0MyBtcw0KPiA+IDY0IGJ5dGVzIGZyb20gMTY5LjI1NC4xMDAuMTAyOiBzZXE9MyB0
dGw9MTI4IHRpbWU9MS4xNjEgbXMNCj4gPiANCj4gPiBOQ00gdG8gV2luZG93cyBhcHBlYXJzIHRv
IGhhdmUgbXVjaCBsb3dlciBsYXRlbmN5Lg0KPiA+IA0KDQo=
