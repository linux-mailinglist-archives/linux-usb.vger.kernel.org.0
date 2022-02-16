Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73C6A4B84C0
	for <lists+linux-usb@lfdr.de>; Wed, 16 Feb 2022 10:48:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232401AbiBPJrj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Feb 2022 04:47:39 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:54884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231837AbiBPJri (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Feb 2022 04:47:38 -0500
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com [216.71.140.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B30AD6E2A2
        for <linux-usb@vger.kernel.org>; Wed, 16 Feb 2022 01:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1645004846; x=1645609646;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6hwKoa0ikMC0BcrvOTcS0+EPtfeogcHz2gWOFdmtxfQ=;
  b=FmfQZ0qo8ug6H+Gd9HzONffOkNV0S+4Jj7Zesn0IM/bxvKkUwap3LWdC
   AW0B6WtOnVcLHM/RHoUOzDAoGdi0zggMiv7uV8seAH85QWu3fVMfocdAU
   egtdDGmG2jNTOgv6pAUw7zsa7D9Yxjx1iIVr8kgK3d+Oonkv3aP/XreR0
   U=;
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 09:47:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UiAuLwaTnS9Gnur1sNjA21O8ZmTATX81henny5N6n1zlGgEWjFZiiU+jfXxrp2ZjPKIQrgKvzeVXYHyoJUH1eiVxlNcaGzvl3n+gSWL08Er/QXVbnXUxBSFKLLYgIoabtfALsaO9aymf7bqx9NuaWxYsgk/xvRoVG/Cam7O8WMrc+b5j/81eG786/aFj2u9b8O7yjw/G2cDITQ/U5jFHPb8uM2GsqSgoD4E8I4qJk0DymIvRuujHMYtE2yYNnppU6gC2/f4rkh1p2rbX0y+uNmfgs47w144oLSfjmwrCvuN4gQiOYVw3jhvHR0OaGO6sbarzTPweOnRgAOKKXcsDLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hwKoa0ikMC0BcrvOTcS0+EPtfeogcHz2gWOFdmtxfQ=;
 b=YgluPTVaSCg0lhG1KVEqbc4UpSzc/W1pKGzkKN4AixnVFSzToUQuWBRCHx6bC4KLsWoSMGxW3rZDEjnEWiUvUHTJ/SpD/bU6HMDVwNu/h17u4JHXcdkNO7gscvEOu0om8+o0s4ZhVgpuRJbCesFA1aQsq5KxME8jeG/mIz0E6EdYSEx+9+W3HUy/sgRgKmW1uDlTQ6/0HEkX6UN8+q13M5EyjZLg2x5E+ALo9/sCXuWisavFG8qggz/sIuHwTJUhtIFY2849EuLFYcM3Y33gnBlRfSC2sBnabyRBN/tWZGZ8UIzyGlaUDoysuTcvdJZOM/6B0aFqlJbqR8ZmVDEdmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM8PR02MB8198.namprd02.prod.outlook.com (2603:10b6:8:4::7) by
 BL0PR02MB4929.namprd02.prod.outlook.com (2603:10b6:208:54::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.12; Wed, 16 Feb 2022 09:47:23 +0000
Received: from DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::4436:2dce:bdd5:f36b]) by DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::4436:2dce:bdd5:f36b%6]) with mapi id 15.20.4975.019; Wed, 16 Feb 2022
 09:47:23 +0000
From:   "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Jack Pham (QUIC)" <quic_jackp@quicinc.com>
Subject: RE: [PATCH 1/5] usb: host: xhci: use ffs() in xhci_mem_init()
Thread-Topic: [PATCH 1/5] usb: host: xhci: use ffs() in xhci_mem_init()
Thread-Index: AQHYIwK9k1QFHIs6WkKkI3ydjpIoXKyWcu2A//97FUA=
Date:   Wed, 16 Feb 2022 09:47:22 +0000
Message-ID: <DM8PR02MB819861F71713D5539EF66D12E3359@DM8PR02MB8198.namprd02.prod.outlook.com>
References: <1644994755-12975-1-git-send-email-quic_linyyuan@quicinc.com>
 <1644994755-12975-2-git-send-email-quic_linyyuan@quicinc.com>
 <4688f5bb-c0fd-bbce-de1f-a554d543ed03@gmail.com>
In-Reply-To: <4688f5bb-c0fd-bbce-de1f-a554d543ed03@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1c3e105-e6d6-42f1-845c-08d9f13154f8
x-ms-traffictypediagnostic: BL0PR02MB4929:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <BL0PR02MB4929CC1E05A9B0FB19FBF22A9F359@BL0PR02MB4929.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sXxQ2pU1V/w/tQ2iJG6oa46KSVyNIOMDcPBBC/NNo27h6NKHJWJRkg1Dko4C+ThuXINTYviqi603UlfNyAKvQNjXbEuSWdSblYi4RxYtqyH7E/XU+hWqoRZE3ufzFGa/mxg8ES3EGM1cavam1el0D+YG0S+dNUcQQjWMUST9x8TbizJitcVmib1yftEn1oDpP2uLaHgaAtb4V20VKzlskm0ar+yxSzmi49dASan6Gcrgyrp3P9oLuUi/F3Ypj5lSLkMbUa0G0a/I2LgZYnWrBpTRhpF4GRh9Zyo1E8POsloBN1d0XCx6FffU2eYh7FWOSedlRfsADxQQyJql4VnS4OioejcfyYBROKUwHBWuQXMdMkFY7jcVh5g9OgW1utcX4kbWzQ1p58DZXZ1serfq6HknQB2DQ74Pfq4tyqA5dT/iVVdNEwVJY7LCMKEBxxQ1Q1XBv1D8omufv8y9hUDbqm2iaPNbnt7sgdN0SKbCBwtECsYBwEmI/YEmNfYoXLMtMuiqGllVHr7HgwGiTKzxk3YH5dURiVzGjtSqk0WgELCqWgqD3gZwPxWhUPVkLBbSNePoVXoS3ZHdQTpFsn+xs63GNwK85WLEcBIJax5Gvvz6qQJ/1TAyGG6g8nWNgX17ZBggzZfwaMZjubMIwYzwoGWRDE5fSr2G8sxeB1zFwWKbU7ZlaClElBZs02HT4JtI3w4+ba+qmAhcpt4Ixm2hAQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8198.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(7696005)(53546011)(6506007)(71200400001)(9686003)(26005)(5660300002)(122000001)(83380400001)(107886003)(186003)(66476007)(8936002)(55016003)(52536014)(508600001)(54906003)(110136005)(8676002)(66446008)(76116006)(64756008)(4326008)(38070700005)(316002)(66556008)(86362001)(38100700002)(66946007)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cU9jNmlEbGRRTUFZV2NKRXh2TVRnNmQ1elVjcy9KWDBFb0JaMW5PRituY3kw?=
 =?utf-8?B?aWVDRkNkUzlYVGZPUWZhN3pqbURKTm96N3R3ZnA5OXZDcmU4elg1ekY4V2ZJ?=
 =?utf-8?B?TWpnMXI3RDlEd2dkOEIzMHZZY1VBeXZpdjdQVm9uRHN2R0QybjFQeWVmRWFn?=
 =?utf-8?B?NXp3RFBLdUE3a2JDMWxNQlRBaC94RU9OTWtYTkNVRndXVUZIYkk4TGNtemNh?=
 =?utf-8?B?MDlPUzB4Wlg1R1dtKzc0TFlXdktNeHVFWmREUlZZS1hCQzFpa1BWRGhXZ2Zj?=
 =?utf-8?B?S0x4eUpicEdUUk1sZ1VhK3BGdnJHb1lvekpZdTZvU2RQYkd3dnBKTGFsSm50?=
 =?utf-8?B?dVBudmtLV0x2N2NETFZNbVRtcnNOb1p2dXpkWWYwTlhLaURqRGtMekpXV0FS?=
 =?utf-8?B?ZndKOTI1bGUyV2Fmek9UeWxzK1pZT1pzenFkT2RYWVErUDFLRkFndWVjMnhq?=
 =?utf-8?B?S3Rndys0WjB3ZndyeUFTWHhGbHVUWk1qNXViaGZ6aE1mTVpUeUxiOWNPeWI0?=
 =?utf-8?B?VFZmelFEQXJsR3Jqcmkzdnllc1d6ZENMLzZ1MGNyOEFGZE1OQ0hrMG4yMU9Q?=
 =?utf-8?B?WFgxYm1mU0JWZ212NGFkM2RqRTc2UjNqeXlJUFdpTFZZdDdjSUJuSkFvQVFQ?=
 =?utf-8?B?Y2RuRWdYWE5pWFJnSEtGMlg1RjJLSHBNL2I3eWQxcjRsazQ4UHlaV0VaNnZM?=
 =?utf-8?B?d2pwTXI4YnhYcitxWXMrQ3NESWFCVHBrOUx2YlQ1SG5kN3hqaEJBaThBR05P?=
 =?utf-8?B?Wk1KZ2IzRVBWZllrZzJ6WW1oRDRvUUZyaUpmVXFQUlFMamZIVWxvOWFsWnVk?=
 =?utf-8?B?dTBuT0tCU29XcFBaQ0JybzFLT1FTR0Q1aW5Vdm83ZjdOa1BLRWZpZkpxcHJX?=
 =?utf-8?B?ZVcrdThSY0cyV1pOaVlpd1p4RTZQbnhlNmZ0VUtMRm9vdzVpSGFSYnprQ2pv?=
 =?utf-8?B?aXZwVkFncWVXdUJ5eEl5bHNWMi9IcWRCVmF4MHpRNE53N1VnN2JkOGh6UUJR?=
 =?utf-8?B?QkN3VnpCOTdHVXhSKzVDQ29VVUtHQ2VOV25SSXpKdG5CM3ZlL0MyMHhTQTFh?=
 =?utf-8?B?RnRqa0MwYkE3eE02WU96M01iME42YTRhbS9vYnFEblNSejhJSStuTjN3MEdK?=
 =?utf-8?B?MU9tK2p5MVhvc0Z2djEvbG1VaDNuZ3JnZW45eHZObWVCUHp1eENXVUNVdTY3?=
 =?utf-8?B?T3VDMUtFUGd5RzRlRzVUV05jWk1GdjA0ZWlTVXFDdGpYVmJwbGRTNDFobVIz?=
 =?utf-8?B?VEswMHZBeForN2VUSlhkQk1lZUVhWU9ZMEo3dFRJdjNTOUpNc0c4WmY0Z0w1?=
 =?utf-8?B?TjRzN2tNQWRGQWg2L1J3TU1qQ2RhNmwxZ2ZyUlV5Mng4R0wvSE5qdlBnNXhj?=
 =?utf-8?B?UEJiZWIzejVPMCtCVnlBZDZYZE9GTnN4aUlHQnFHb3VJajd6M3dCaVFXM01N?=
 =?utf-8?B?K21CZTh0NUdUZjdteGszUWNSS3NaRllFbHlFVTI1S0xJVFdNUTdyQ2R2OEYr?=
 =?utf-8?B?MFhBYzh5cmQ1WC9XQVNPeG16b2xwaXZKUnNnL2o4VzdURFFtcS9lQzdoTjlv?=
 =?utf-8?B?WDA5K3ZLSldHaHV4VFdnZkkvRS9EZ2FEWC9Lc2dsN0UvMFptamNjYWgxbzJH?=
 =?utf-8?B?eFJOaW50R05XNmxpUG03K0MyMGdOQ3Zzb3A1Z1owdzNEeEpLN2R1cmFVVTRF?=
 =?utf-8?B?V09DODRweURnSjgxK0kyL2hubXpDTUk3Y0hEKzBDRW9SMy90NFVjUWd6TEJD?=
 =?utf-8?B?QXJ2L1JXM3pDS2lkdnFoYmozY0JVcmVDQVZYNU96N2orbXo2RGlBaThoZ0lk?=
 =?utf-8?B?WEY1SXVMWTRnb3VrU0I0QU9yTFEwU0d4NzJuMGJLUmNVSlhicXRnU1ZUM3lJ?=
 =?utf-8?B?YnJEQ0NGc1ozU1FZdzJncnBQZi9KUTJNR2QzSm1KUnU2T0RrSUtMdmdGTnFT?=
 =?utf-8?B?eFJyS2I2QlJZcFQzNklaclhURFUzWWZnMWJ0R1d3UFgzMW5Ed1Q2K0FQYzZz?=
 =?utf-8?B?UElWdVdieEl2R2tuNkpVT2dnK0o3MlJwY29hRlI5MXNvYTJINGJwdWJrRjZJ?=
 =?utf-8?B?SWdTek9SeDB1dVdCLzlXQ2VkZkVFUUtOYVNwVzUvWitmVVBaUHcrZEROWkVX?=
 =?utf-8?B?ZldHSGFEQTdZeVFIaFBzaDBnMjJsVDBKQVdMR3c4RC9LeFRoWENzU1ZxeHlZ?=
 =?utf-8?B?dDhlQnc0QUNmQW10TGIzYTltOVBkcUdCVUw2S2d1K2l2bTlMelhJcThrVVpy?=
 =?utf-8?B?V0UwR3NzbDNVSnN0Sk4rM3EyTnNRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8198.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c3e105-e6d6-42f1-845c-08d9f13154f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2022 09:47:22.9805
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pwcKxBkbsoL1smKd+VHgSI4Jx4i8V3JUxHPjfXZrX/TUVeNrOywT6FX0V74z3MLbWmJRXeLw2WrSHvPsYX3AvBfuEv5hTTsJXul/MGFUFVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4929
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

VGhhbmtzLA0KdGhhdCdzIGNvcnJlY3QsICBmcm9tIG15IHZpZXcsIG9uZSBsaW5lIGlzIGdvb2Qs
DQoNCldoYXQncyB5b3VyIHN1Z2dlc3Rpb24gPyB0d28gbGluZXMgPw0KDQotLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KRnJvbTogU2VyZ2VpIFNodHlseW92IDxzZXJnZWkuc2h0eWx5b3ZAZ21h
aWwuY29tPiANClNlbnQ6IFdlZG5lc2RheSwgRmVicnVhcnkgMTYsIDIwMjIgNTo0MiBQTQ0KVG86
IExpbnl1IFl1YW4gKFFVSUMpIDxxdWljX2xpbnl5dWFuQHF1aWNpbmMuY29tPjsgTWF0aGlhcyBO
eW1hbiA8bWF0aGlhcy5ueW1hbkBpbnRlbC5jb20+OyBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdr
aEBsaW51eGZvdW5kYXRpb24ub3JnPg0KQ2M6IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7IEph
Y2sgUGhhbSAoUVVJQykgPHF1aWNfamFja3BAcXVpY2luYy5jb20+DQpTdWJqZWN0OiBSZTogW1BB
VENIIDEvNV0gdXNiOiBob3N0OiB4aGNpOiB1c2UgZmZzKCkgaW4geGhjaV9tZW1faW5pdCgpDQoN
CkhlbGxvIQ0KDQpPbiAyLzE2LzIyIDk6NTkgQU0sIExpbnl1IFl1YW4gd3JvdGU6DQoNCj4gVGhl
IGZvciBsb29wIHRvIGZpbmQgcGFnZSBzaXplIGJpdCBjYW4gYmUgcmVwbGFjZWQgd2l0aCBmZnMo
KS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IExpbnl1IFl1YW4gPHF1aWNfbGlueXl1YW5AcXVpY2lu
Yy5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvaG9zdC94aGNpLW1lbS5jIHwgNyArLS0tLS0t
DQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDYgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvaG9zdC94aGNpLW1lbS5jIGIvZHJpdmVycy91c2Iv
aG9zdC94aGNpLW1lbS5jDQo+IGluZGV4IDBlMzEyMDYuLjNjYmM3ZjIgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvdXNiL2hvc3QveGhjaS1tZW0uYw0KPiArKysgYi9kcml2ZXJzL3VzYi9ob3N0L3ho
Y2ktbWVtLmMNCj4gQEAgLTIzOTUsMTIgKzIzOTUsNyBAQCBpbnQgeGhjaV9tZW1faW5pdChzdHJ1
Y3QgeGhjaV9oY2QgKnhoY2ksIGdmcF90IGZsYWdzKQ0KPiAgCXBhZ2Vfc2l6ZSA9IHJlYWRsKCZ4
aGNpLT5vcF9yZWdzLT5wYWdlX3NpemUpOw0KPiAgCXhoY2lfZGJnX3RyYWNlKHhoY2ksIHRyYWNl
X3hoY2lfZGJnX2luaXQsDQo+ICAJCQkiU3VwcG9ydGVkIHBhZ2Ugc2l6ZSByZWdpc3RlciA9IDB4
JXgiLCBwYWdlX3NpemUpOw0KPiAtCWZvciAoaSA9IDA7IGkgPCAxNjsgaSsrKSB7DQo+IC0JCWlm
ICgoMHgxICYgcGFnZV9zaXplKSAhPSAwKQ0KPiAtCQkJYnJlYWs7DQo+IC0JCXBhZ2Vfc2l6ZSA9
IHBhZ2Vfc2l6ZSA+PiAxOw0KPiAtCX0NCj4gLQlpZiAoaSA8IDE2KQ0KPiArCWlmICgoaSA9IGZm
cyhwYWdlX3NpemUpKSA8IDE2KQ0KDQogICBBbHdheXMgcnVuIHlvdXIgcGF0Y2hlcyB0aHJ1IHNj
cmlwdHMvY2hlY2twYXRjaC5wbCAtLSBpbiB0aGlzIGNhc2UgaXQgd2lsbCBjb21wbGFpbg0Kb2Yg
YW4gYXNzaWdubWVudCBpbiB0aGUgKmlmKiBleHByZXNzaW9uLi4uDQoNClsuLi5dDQoNCk1OUiwg
U2VyZ2V5DQo=
