Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F343A6CD3FB
	for <lists+linux-usb@lfdr.de>; Wed, 29 Mar 2023 10:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbjC2IGI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Mar 2023 04:06:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230259AbjC2IGD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Mar 2023 04:06:03 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2078.outbound.protection.outlook.com [40.107.95.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AC1935A2
        for <linux-usb@vger.kernel.org>; Wed, 29 Mar 2023 01:06:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FZRn6mDFD70XlOIfbxHErWoFZ1w0QUniFd5QelPFMRjnYl7kNHdTJ1XI1rHGjQjmyBc4bZjhUL0sbZy97OWRtb4PONToRRPGzor5qjf/7JI6p6a3fadpvisg3ssGitK2wf3kHolgM8L7paaYG/a+MgKFySObFMbWCKxAwE9v1Sph784kN7UjdKDFLSGihGtcVAUxaQ16IIDsI4PDcEoxuQUbwsgbQZkViaaOo8eSSi/REOemKe4bW4oEB2iSOr92pZdNs40lgEln5XmVsVtu27YmYkrLNGOCtr1QQfD93iUZ3XXn6pYBSVU3jJkbLWOrhSSXM4b8Ah9NbeZ6azuaaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFnAR0oWKXzhu9VgRpcDshOWrgAojwMAZ9XbjqfqaaE=;
 b=YjunqoZtO+zhl8bTVhSRYdb9nkVqr251uGAWUhuwhs+1oh92AZGfSF/VHB0TmZzFZwZTXa/1USE2nAs/NqKLwhX0I4Y83Bef9R8eQQvXCsnhuwm4F9MOvRgfDL+XpD7coNTq8B4nCVH3DKNb8dsZPABuD+4I60+SrjjLKfZ/iWUrXMCxNAwIVp51B8irmG3MlUDZyetn1N5jHGUB9m35b5bHoe2Awfhdhpg6PyP52fs0SxQxsqQ0i9EdpSmi/8XV3yIYVZxC06M94uAneu+IgxWtAgnRbS+d/5p1vH2vh1myNKz8+H0esYtzqKRGpAveUgaGz6e5YRpNgrK3xpiYEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFnAR0oWKXzhu9VgRpcDshOWrgAojwMAZ9XbjqfqaaE=;
 b=Z/UfUG6L22XxD8dT3L5oyP8xJoXRsWm2bmQHCfB5G8SaxyhNZaU6FzaR7+R6TcSKNRH+c9r8IkwU7CbD3Y9KCclk/xHEIIFz46N63h90KqQu/AKrfKyDiTMdnEMMmBQEAj1R6WChKu2vcsl+d+47ik97QtTcjnhIoDh/VBfW2NvS3tioeKjAdEbXInhX9Y6Rqb5MLbiqWk1Jo8b898hVSWXc4CB8wHP6TSKTrtimaCdJtYIsey/+YFajaOGvuxz7mG5pD/iUf738W003BP7NNDY8rbY2ufwY0aTN2vsIuo+jfDZWpXF2h839MYgdbwiIPAVLFq7zbGdSg7iWL/C/gw==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by CY8PR10MB6801.namprd10.prod.outlook.com (2603:10b6:930:98::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Wed, 29 Mar
 2023 08:05:58 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171%5]) with mapi id 15.20.6222.032; Wed, 29 Mar 2023
 08:05:58 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: usb tree branch usb-linus merge plan ?
Thread-Topic: usb tree branch usb-linus merge plan ?
Thread-Index: AQHZXKg0f6oFrouED0immaY74o4uma8GrYOAgAAlGICACaiVAIAAAgSAgAD0EIA=
Date:   Wed, 29 Mar 2023 08:05:58 +0000
Message-ID: <3d035307bdeb98cb9e995be3d90f4f337eb4e1d8.camel@infinera.com>
References: <8d92e4f66c153bb43c040c5e2f6666978196efd4.camel@infinera.com>
         <ZBrps8reH2AYqZoJ@kroah.com>
         <7e2d175b1e018d116bff9087c364d7fc398338c2.camel@infinera.com>
         <a61062edbd266f6c8a260fd30886a97242133ea0.camel@infinera.com>
         <ZCMkqSD8-DtaY6Oc@kroah.com>
In-Reply-To: <ZCMkqSD8-DtaY6Oc@kroah.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.0 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|CY8PR10MB6801:EE_
x-ms-office365-filtering-correlation-id: 25634f06-ab78-41dc-49ae-08db302c6e04
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XYDUfqCrApl8LAW3jQbJeZn9N1GgDF8PvgB6Ni/Z1adH7NnQodVHN/9ETYAj7FPQyoAeTanyuW7hCdCWD5A0tHrHaaw1vPSIzD6xpxUX4+Xq1mDx2smsFx3gPLZDvniY7p01lUOVdJMHlNKIohOOMnZSaidGdLTlPK7b+IFlPzVrTjidvcao8IlyN3vPx0jz43N92GHk01lGdmOi+H7U1veyIywsFdFPXpe3QNNVTuU+wK360BMEibBmtaTmM2fJOIVZgQ2tgyX5OfH+MsUIm21RxDhQwRllatldXXbKSALtENM4FEClDJb/7I7Sw3XilEkGghOPamfUz9lDnDiAUNNdL2Bj2lUv+nr6v08BLv8wkyqVWUm4Og/mT2wPnJ4ys42jEWvL112VLWJInT8gozDlMoVFFsnLL8xeYYBQEE7nWRIZd8n+CpF+u/hyLEIvbMKMeBtzeA3gEDyJ9eujzJU2zE+PXUGx7aU/TDtt0eSd27xRD0vY8ZyhzqOfJEP8cxCzQRU0Uj9/wRu/qFfLIhTFx790WDybIk9NUXisx73fPZGbL0Wocs+g0SfqQ+PMFruq78+hJjhFYj/OpEK4Yc+6zGwuZFvkIqzoKgu0dZM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(396003)(136003)(39860400002)(346002)(451199021)(478600001)(45080400002)(66446008)(66476007)(8676002)(91956017)(64756008)(6916009)(316002)(66556008)(122000001)(5660300002)(8936002)(186003)(41300700001)(66946007)(76116006)(2616005)(71200400001)(83380400001)(6486002)(966005)(6506007)(6512007)(4326008)(38070700005)(86362001)(2906002)(38100700002)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXRWUjhjUDNFcUZPdmladEgvaTc5QjdocEVUdlZaRmFBOEgwN2pGZS9rcGRC?=
 =?utf-8?B?UFRVZEpXMytwcG1USTB2aFJPYVlVazhiZDVYeWR2YkxVYW9xb2pKclJNUlJ2?=
 =?utf-8?B?S2tuQmdiT2tsMEZwNXJMRW1BaE9hNU5YdE1ZYU8vZlFIM1o1eHBZUlF1M0x0?=
 =?utf-8?B?QjNZOEdJdUdhM285VExxOFZmb2tDUXBOdVduaEVaNFJaZWVkRnhPc0dhQVpi?=
 =?utf-8?B?OGd6dklCcGNNc2tDdUE2STFWZ2VCdGFDQmtPbEtDdEFGSDViTjBHTHREUDBD?=
 =?utf-8?B?RWJDYitlQVo3Y1hETTNUcDdpekVqUXZrMTRZMVpzYVVibmJMSWVFV0tqd2sy?=
 =?utf-8?B?dzZyWnpVcFVrNFd6T29zckNHckNvZkVyS3llc3VBd3BkYS9aUlo2NEV3TmpL?=
 =?utf-8?B?VFdjSXdqY0I1Yk5GTHlvRDhidHNQNVBQRmZBT1RtNlArOXVIOHhHanY4SmFW?=
 =?utf-8?B?enFsYTVxNFB1dlpKbDlENXJ0OWJURHIrNmEwaEVJZnB1VWsyL1pzYnkweG9z?=
 =?utf-8?B?eFdwUTc3M21QSm5uTGVRK3VoUkExdG1SSUdlUzRwSEcvbWR3MG9ZK0tDS09z?=
 =?utf-8?B?dlhoanVmQjk1bW9XOTgzSWxGTHM2cTZXUXVuWjdxb3dENnNOL2h6V1lYbThY?=
 =?utf-8?B?NlJFN1pDekE2NjIzL1VXR01Md3A5dWhENlhQRFAxbDdSM1dSVWZVc3gwYTNY?=
 =?utf-8?B?QjJkQUtjUTA1SlUrdWUxVk4yK0F3QnZ2UGlnTFdjb2wzRXZOei9kSzJSdUVz?=
 =?utf-8?B?eFFZL0lKR3Y1SnZLRmV2dXBjeG1IL2VmcnRvemJVdUJUOGprL283OUxOampJ?=
 =?utf-8?B?c0RqdVpuSno4Wk9uZ3JRcjJVSkNJR3pEZEdwc1BIWkU2MVpjQlRtSEl1aVdH?=
 =?utf-8?B?ZWsxeGduVkl1USs1VGcxTG4wYWJxOURsTStNRm0xZXpIUFF3NEc3THdNUU9Z?=
 =?utf-8?B?NE85ckpKUE1abjJOMjNUY0JCM0hHZ0QwWWk3TDhRcFhjS0NCUkF5Nk9tVW9i?=
 =?utf-8?B?Ti9GM1BGbmJiWmJIcDJFcDI0Q0NSMjV4dnI1bCtrQitnbUZzV0ZQZ2pMYmdI?=
 =?utf-8?B?eThDQ1VkTlBjNHZVNUxPVVVlWHQ0c1I2SktTYTY5aVgrUCs3TFhqU2xuZkNJ?=
 =?utf-8?B?TzlPNGQwV3NGRTB1TklWYStoNnRjY01YbUxpaE1xWDcyYXMxSjM4WE5yc0Rq?=
 =?utf-8?B?U2hoSUFSdVdUV3F0clliZkJVSWNCZ2lNY3RsU0NDYzdrTUd3bGhEM015Sk1S?=
 =?utf-8?B?emh2d2lldkE2QU9NbTRsTmZwcU1iUXZDWE9hR3k1aG13QjBibXU3eEJMUjN6?=
 =?utf-8?B?eVFsWUJzTFIxaEZFeVI3eFdwcGhkZXN3czgxNWVsckN6NTg5Qm01cXhBU29J?=
 =?utf-8?B?dnYwMTNvYjVvWktNdDdiMU8zeHlXRFlZSHNoRGpzRFBTRUIyMXkyL0Q3cTBU?=
 =?utf-8?B?Y2gzSS9FUzRTRlVXNEM2c3I3Sy9SbG5xRzcyTmovcGZVTWJRU1F5MENXcGdu?=
 =?utf-8?B?V2cwME9VQ3FwWG9PV1Z0djUrOVJRVVE1UFRkaTQ4TU1IUXJLbnUvcG5oclR5?=
 =?utf-8?B?VHpLSjVHVTc1WTZxLzdmTkEzL1VsNldjYlVGcW1wTklNQUliQTB4KzF6azIx?=
 =?utf-8?B?ZCtYY0w3SE9BSG9KdDBXZnJKbitKbGNHS0luVHZGcmR1WkEzUG5UUXdva2Rh?=
 =?utf-8?B?V1orck1IL2k3TjJxWHVucHB5eHdOMThSODdyVWFRMDdkbEp3UkUyUE1sNlhl?=
 =?utf-8?B?Q1JEQ2FUL0cwbm9wYnFEZFNaOWRONGNJTHdjWGgvcGtZaTFqU1R6WVl0eGlX?=
 =?utf-8?B?M1ZpektVZzgrZld4aHRDYzBrNWVoVVZSZENQL05zKzNheHVFZmQ3YzBUSEpY?=
 =?utf-8?B?d0c1MHhMUVpHSDY2WEt3T1FQRFdXbWtsVGtoQklNeW5QQWdmUFhvMzg3cmxt?=
 =?utf-8?B?V2F3WTRIZ2RScDRKbGNEdjE1WCtPUFNKMGdSSlIxRGV2M1FHRm1NSmJjcEFu?=
 =?utf-8?B?M2xCYUJxRjd6RE5TeHFnaHRnZTJxNlorMXV4d2IvUnAwZHI4TjB3Y2Z0bkJS?=
 =?utf-8?B?bWtnN1Z4RFZHdDAwYi9uUlAzRlRBeFZxSjNXL2w0Mmh3UmpLaFQ3dWhpbklY?=
 =?utf-8?B?TlN2dHJXUytlZmRLS0xjZjhMeFNRb3NwUmZielowd2p5aE9HaHZCTndSVnJN?=
 =?utf-8?Q?6atcyvWVCcqo6BPLeSFJ0a8wo5MxOyblzh+4a9zSUQcz?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9899C35BE7D371459727D8941AFB0649@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25634f06-ab78-41dc-49ae-08db302c6e04
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2023 08:05:58.5502
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vaWtf2MDsNoHqL7tJccktP1G+1OJDDdJXiPOvsdB1YrboHwsFxAO3Hv7mhLeLFf8hpdMeSCy7VA1QOqV6p8MEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6801
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVHVlLCAyMDIzLTAzLTI4IGF0IDE5OjMyICswMjAwLCBncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZyB3cm90ZToNCj4gT24gVHVlLCBNYXIgMjgsIDIwMjMgYXQgMDU6MjU6MjBQTSArMDAwMCwg
Sm9ha2ltIFRqZXJubHVuZCB3cm90ZToNCj4gPiBPbiBXZWQsIDIwMjMtMDMtMjIgYXQgMTQ6NTUg
KzAxMDAsIEpvYWtpbSBUamVybmx1bmQgd3JvdGU6DQo+ID4gPiBPbiBXZWQsIDIwMjMtMDMtMjIg
YXQgMTI6NDIgKzAxMDAsIEdyZWcgS0ggd3JvdGU6DQo+ID4gPiA+IE9uIFdlZCwgTWFyIDIyLCAy
MDIzIGF0IDEwOjIyOjI4QU0gKzAwMDAsIEpvYWtpbSBUamVybmx1bmQgd3JvdGU6DQo+ID4gPiA+
ID4gSW4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJs
PWh0dHBzJTNBJTJGJTJGZ2l0Lmtlcm5lbC5vcmclMkZwdWIlMkZzY20lMkZsaW51eCUyRmtlcm5l
bCUyRmdpdCUyRmdyZWdraCUyRnVzYi5naXQlMkZsb2clMkYlM0ZoJTNEdXNiLWxpbnVzJmRhdGE9
MDUlN0MwMSU3Q0pvYWtpbS5UamVybmx1bmQlNDBpbmZpbmVyYS5jb20lN0NmMjE5NDEyM2U5MTQ0
MDEwMTI0NzA4ZGIyZmIyNmEwNSU3QzI4NTY0M2RlNWY1YjRiMDNhMTUzMGFlMmRjOGFhZjc3JTdD
MSU3QzAlN0M2MzgxNTYyMTU1NTg3OTcyOTAlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lq
b2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4w
JTNEJTdDMzAwMCU3QyU3QyU3QyZzZGF0YT1pVUJJU3dXbGdiaGhMTElTd21sQ1oxWjl3RmxRMjFz
d0pHcHc3cVlwZkt3JTNEJnJlc2VydmVkPTAgdGhlcmUgVUNTSSBmaXhlcyB0aGF0DQo+ID4gPiA+
ID4gcHJldmVudCBPT1BTIGluIHN0YWJsZSBMaW51eC4NCj4gPiA+ID4gDQo+ID4gPiA+IFdoYXQg
c3BlY2lmaWMgY29tbWl0IGFyZSB5b3UgY29uY2VybmVkIGFib3V0Pw0KPiA+ID4gDQo+ID4gPiB1
c2I6IHVjc2lfYWNwaTogSW5jcmVhc2UgdGhlIGNvbW1hbmQgY29tcGxldGlvbiB0aW1lb3V0DQo+
ID4gPiB1c2I6IHVjc2k6IEZpeCB1Y3NpLT5jb25uZWN0b3IgcmFjZQ0KPiA+ID4gdXNiOiB1Y3Np
OiBGaXggTlVMTCBwb2ludGVyIGRlcmVmIGluIHVjc2lfY29ubmVjdG9yX2NoYW5nZSgpDQo+ID4g
PiANCj4gPiA+IFRoZXkgaGF2ZSBiZWVuIHRoZXJlIGZvciAxMyBkYXlzIGFuZCBJIHN0YXJ0ZWQg
dG8gd29uZGVyIGlmIHRoZXkgd2VyZSBkZWxheWVkIG9yIG1hcmtlZCBmb3IgYSBtdWNoIGxhdGVy
IHJlbGVhc2UuDQo+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+ID4gSSBkb24ndCBzZWUgYW55IG9m
IHRoZW0gaW4gTGludXMgdHJlZSBhbmQgd29uZGVyIGlmIHRoZXNlIGFyZSBwbGFubmVkIGZvciBs
YXRlcj8NCj4gPiA+ID4gDQo+ID4gPiA+IEhvcGVmdWxseSB0aGV5IHdpbGwgZ2V0IHNlbnQgdG8g
TGludXMgbGF0ZXIgdGhpcyB3ZWVrLiAgSXMgdGhlcmUgYQ0KPiA+ID4gPiBzcGVjaWZpYyBydXNo
IHRoYXQgeW91IG5lZWQgdGhpcyBub3c/DQo+ID4gPiANCj4gPiA+IExhdGVyIHRoaXMgd2VlayBp
cyBmaW5lLsKgDQo+ID4gPiANCj4gPiA+ICAgVGhhbmtzDQo+ID4gPiAgICAgICAgICAgSm9ja2UN
Cj4gPiA+IA0KPiA+IA0KPiA+IEkgbm90aWNlZCBhYm92ZSBVQ1NJIHBhdGNoZXMgaW4gdGhlIHN0
YWJsZSBxdWV1ZSBleGNlcHQgdGhpcyBvbmUgOiAidXNiOiB1Y3NpOiBGaXggdWNzaS0+Y29ubmVj
dG9yIHJhY2UiLA0KPiA+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9v
ay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmdpdC5rZXJuZWwub3JnJTJGcHViJTJGc2NtJTJGbGlu
dXglMkZrZXJuZWwlMkZnaXQlMkZ0b3J2YWxkcyUyRmxpbnV4LmdpdCUyRmNvbW1pdCUyRiUzRmlk
JTNEMDQ4MmMzNGVjNmY4NTU3ZTA2Y2QwZjhlMmQwZTIwZThlZGU2YTIyYyZkYXRhPTA1JTdDMDEl
N0NKb2FraW0uVGplcm5sdW5kJTQwaW5maW5lcmEuY29tJTdDZjIxOTQxMjNlOTE0NDAxMDEyNDcw
OGRiMmZiMjZhMDUlN0MyODU2NDNkZTVmNWI0YjAzYTE1MzBhZTJkYzhhYWY3NyU3QzElN0MwJTdD
NjM4MTU2MjE1NTU4Nzk3MjkwJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xq
QXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMw
MDAlN0MlN0MlN0Mmc2RhdGE9MjJ5Nkk0aklVOEJaNmRBWlp2OXBtUThkNG1weUR1cWVXdk1LaDQl
MkZxUHFvJTNEJnJlc2VydmVkPTANCj4gPiBNYXJrZWQgZm9yIHN0YWJsZSwgcGVyaGFwcyBmb3Jn
b3R0ZW4gPw0KPiANCj4gTm9wZSwgZG9lcyBub3QgYXBwbHk6DQo+IAlodHRwczovL25hbTExLnNh
ZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsb3JlLmtl
cm5lbC5vcmclMkZhbGwlMkYxNjgwMDA0ODgxNzk3MCU0MGtyb2FoLmNvbSUyRiZkYXRhPTA1JTdD
MDElN0NKb2FraW0uVGplcm5sdW5kJTQwaW5maW5lcmEuY29tJTdDZjIxOTQxMjNlOTE0NDAxMDEy
NDcwOGRiMmZiMjZhMDUlN0MyODU2NDNkZTVmNWI0YjAzYTE1MzBhZTJkYzhhYWY3NyU3QzElN0Mw
JTdDNjM4MTU2MjE1NTU4Nzk3MjkwJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0
d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3
QzMwMDAlN0MlN0MlN0Mmc2RhdGE9Z2FZS1ZBd0VvdGpYd2NJUmdGU2hWeWpQT1pnM09YWFZaNCUy
RmViV0NWTHJRJTNEJnJlc2VydmVkPTANCj4gKGFsc28gZm9yIG90aGVyIGJyYW5jaGVzLikNCj4g
DQo+IElmIHlvdSBjYW4gcHJvdmlkZSBhIHdvcmtpbmcgYmFja3BvcnQsIEkgd2lsbCBnbGFkbHkg
YXBwbHkgaXQuDQoNCkkgZGlkIGEgZHJ5IHBvcnQgdG8gNi4xLnggYW5kIHNlbnQgaXQgaW4uIFdp
bGwgYmUgc29tZSB0aW1lIGJlZm9yZSBpdCB3aWxsIGJlIHRlc3RlZCB0b3VnaC4gU29ycnkuDQoN
CiBKb2NrZQ0K
