Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E5A235A9A3
	for <lists+linux-usb@lfdr.de>; Sat, 10 Apr 2021 02:44:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235268AbhDJAoZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Apr 2021 20:44:25 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:39234 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235215AbhDJAoZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Apr 2021 20:44:25 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1B1DA4033B;
        Sat, 10 Apr 2021 00:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1618015451; bh=wt1jXFI6tyG8u5Pm7BZJZepya7WxMX+2cvltWlSbfTM=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Qqb7Mi9Ct0907NocPgpfny+mzx8NggNQsoFIyVyn1T4eskq+Z+zNpET5HjxUjq27u
         mkeVoQ90/Ra90BiOyAFBMwhRrNfq1XfEFXtVMppwPPEMCZh/TTcw6HWQK+qUHkkHw0
         ucWOkZxrn1HSy++tQnC6VvY1KOv8M8fXwI64lyEycySUos0fIl7/pti0sSuML68617
         cp53ZmpMrb9bmNqjudBLDBpmgZitV5cV3QGs5PvyeZpI1l7Xsp2k5d1i4b6yqajmzC
         Jyws0FhmlJbRya1vxYuZvDzHwqDqs573nFozFsP8H0Pteeo/0XDoc+biUFVBmYSZ77
         m5xLoQDWxNFJw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 8F8DBA0067;
        Sat, 10 Apr 2021 00:44:10 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 63485800C2;
        Sat, 10 Apr 2021 00:44:09 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="jjPid10z";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AstgGlzds8C17l38kEFoqBVV1LPOGwqwOB1kav+6odBIRuyse5gFgD+hVOoqDIRr36XVRKdJo1/4K4vZigjZAIP4zh+85J+QuH3b8IhYE/d29U4ybaCzoI9vstBeOPQeF8zTTHa9Jcf1oQ/vzP1bOov69y8h6VqQihw595llnsZiFCFbERBUI6V+kIA8lsR57jUPe6aFwxOftxPHAPHckfmie3miqH9UJz6yiARvZPa1bkTYJ8ZvczgZnmnGJPG9odktR5CIquXCFZJWT/llLIceTaVyFuFfmohjCBxjkJx2CreuSC9X0aMygEPhdDxamUpLP8p6hocC+/6GZv4PYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wt1jXFI6tyG8u5Pm7BZJZepya7WxMX+2cvltWlSbfTM=;
 b=LOjlcyyYbENsa2MNolIWkrrtG5J1KaxqFQqo4NCx2rSJQG2dOl4D0rHt8hGKPv6Rhh7EWRyAq+FawolSaSi2qzz5Sj3aVToe5iuXNa4/Uo4houK3LdhIM/fw3TAqt5nfpP7BAEmeSYomJLtNVNCFQZc9w8w1MDg5Qvdhfw56juJ4pZ49ipva/kuTuZsrjp9v8jfVbAUTTD8aV+dcY6/UdnhclmtVP9Fu98IfUv8Q79zJw3qoIMkTfLg/2b+yl3W3SDqDZuR9mSR057JrJkS+c12eteGE6/S0s6+FD143kFMlDd0CWB3DbxIaXJfmHV20kwDAY2BbgcDCPBjSHUcRHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wt1jXFI6tyG8u5Pm7BZJZepya7WxMX+2cvltWlSbfTM=;
 b=jjPid10zc1L1ZBeNNI4baunWnvZ9XrGo0p28dnpOthJ0TKwh3Q60t2J7yPJefZqK8xM7fsnR3T5hSdZyKoDBHI4BO2wgnQcTSOfUKbY1V6dVvcK8ej6Mi4YzLcX92L1pcFRBlMRldqj6Mc8DMxJeYtL1c0A6lPP0gJQ6eWO+MAQ=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB3304.namprd12.prod.outlook.com (2603:10b6:a03:139::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Sat, 10 Apr
 2021 00:44:06 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c%6]) with mapi id 15.20.4020.018; Sat, 10 Apr 2021
 00:44:06 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 6/6] usb: dwc3: host: Set quirks base on version
Thread-Topic: [PATCH 6/6] usb: dwc3: host: Set quirks base on version
Thread-Index: AQHXLOGd3Si088JpHkKcBGl9GJ5z3qqrwDkAgAATCoCAAFnhAIAAvlCA
Date:   Sat, 10 Apr 2021 00:44:06 +0000
Message-ID: <0f677023-0200-b12d-7afd-c54fcc589c18@synopsys.com>
References: <cover.1617929509.git.Thinh.Nguyen@synopsys.com>
 <a792b1ea6b7083d400b3a6b38dcca70588fc5587.1617929509.git.Thinh.Nguyen@synopsys.com>
 <YG/50kPULbzZRlFj@kroah.com>
 <fbc6c921-114b-ed0b-ed68-b425e09e3e9b@synopsys.com>
 <YHBVMHvCHnT3PTGK@kroah.com>
In-Reply-To: <YHBVMHvCHnT3PTGK@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5fb450fc-fbc1-4695-461b-08d8fbb9beeb
x-ms-traffictypediagnostic: BYAPR12MB3304:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3304CE0AB81F1ACA63B19036AA729@BYAPR12MB3304.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UF9kROVAEStcboq2HvDk7IfiLD95e8u2KKlFqR6YdNGp30RAlU+iilRQvgdfYyn8xuStgHfHAIgdX8u2aM8+ug0vzi6YD7Byi8OeB92CkyP6LGSI0B1/+Z6kElhEe/ImRSph5gjZAWIaaWCJIs8G0l3rL9+MT2+JiWjCXUTs+dnRVLNNOughQpgyhcs/tnCZGiz620y6zSczvceYHfr29TvsHuKnQajTwE5C+4UyzV6QPwT+0tViPdeWXW4wdd8qGNrDSW2TXp24aCNkwqMW31XX3VYsnRIO7bu+7HSOKZKd1TEWvYiNtn/i6zShhQTbhcHVHr1+afEZ3uOYOv5QTLCnZB5E/orlMe5GmAT6MNjjAnEo09Fa8LR5t/UxhkFHMx3I1PQyUbApWion3pRrD8hSH5fxDon1J+oBm3u7h8q1hwvPMlci93w2+u8SiAO5PBJMRn9GMaBfLqc3UzK4hh0py/77uW76d6PYfjbjluNT2FfAezjVKDWTMwvBf/IO5+2uoTcA/OaTqIdMbQBTOUkMy5gPg2UgXvYA6T/4rZUPi0hjDep9k9Upn21mR3DiCJj4LKSFl0KepY4WkqMNAgAQiwIIBA7Uz9Z2IKYmN+uszZ3lxes1hhUaP3Pdp2PJ0noscUSwRyDdEW3HXSfqnjixQ5UCRo1iDeM5D5cncSA5r+DA/cqrLui5h7+CoNnlWmezPJkSQrzy0kQSq5JK8jHmBb5wbWVBAqHwHOBMDlg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(376002)(136003)(396003)(346002)(26005)(4326008)(6486002)(186003)(478600001)(83380400001)(38100700001)(71200400001)(36756003)(8936002)(316002)(5660300002)(107886003)(64756008)(66446008)(66476007)(8676002)(31696002)(66556008)(76116006)(6506007)(2616005)(6512007)(54906003)(31686004)(110136005)(2906002)(86362001)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?L0hQQlZhTHFDaEQ5ZXFjQmd5NURtQy93d3Y4THJDYW5KU2RYdWRNNFFVTVBm?=
 =?utf-8?B?bzVKaWVSVEtrTm55YlR5cVJEVk1ITGpuT0Y5MjNnZnFPNXRLdWZTbDdIMlJz?=
 =?utf-8?B?cDJGemdtSGNVNlVDellWbitxWmZGbXBFTGRhQSt6Q0t4amJ2RERKUGcxNXRS?=
 =?utf-8?B?MzA5ZDhUalNEMVdPRGR2dmZUOW1Pcjc5QjR5WHdoUUNvRmtqVllrbE43QTU3?=
 =?utf-8?B?eDdqc0NDdklocElaVjVHRmJtTkQzb05iMEVIRTl0S3FSVnQ4NFgwSmpudC9q?=
 =?utf-8?B?c2NndjRIaklEMmprQ25YclVzZUlNN2VnbnBwYUt6RHo4a0VDU0ZZZVF6SFd1?=
 =?utf-8?B?N3FWMk9SME1UL2hWUzVzVDJRbzBMYURHWTVvdTFDSW5rOVR2S05sZDRmOGNY?=
 =?utf-8?B?ajJCUEw2VFc5WjhwRzBINXhiQlp0aWJZdWtlU0hoSkJXY1hQZEVvSVZSdWp2?=
 =?utf-8?B?a1MvOTJNMzFNL1hORFpOQnhYbys0Wmd1T1I1M29QdDZmTGoxdjFlM240NVRB?=
 =?utf-8?B?WVovQmlvK05PWnMrSFgwTjdQQm16cUI4dFFadEVOOVZ4ODUwZHlWdVZzOFU3?=
 =?utf-8?B?TmFYQkpsMWRRV21LZ2RLbzNzWTlManZ6UnNwSVlzWEZCM1B4UE10eE1OWHAx?=
 =?utf-8?B?WXV0NktVeGtHQnB6YVZVSnJ5aEhjcVp6Y1lpSjErcEVtNmwxM05jZUdUS0Iy?=
 =?utf-8?B?UGN3VHpiYjd1Qm9FVGQ3Ujl2ckloK0pSY2xXNHh2T0FsSVR1MXBIMlE3bWkz?=
 =?utf-8?B?M2JDYXgyUUlrOEdCTXRVd2htSUpZbHdTb0ZYYm41Z0dTT3lPSjlUeWVBeHls?=
 =?utf-8?B?b1MwZWhNZTZTaUhHL1d1Sy9BUVhQdVBWWkJSclZaUDl3R0p1b01hOVF4RHVa?=
 =?utf-8?B?dXZKYkRsK1VrOHowQTVvT2xEVU0xWVhEUWF1VHFDems5eSt3N0NVT1B6Snlj?=
 =?utf-8?B?MHRkTW0wSklBQklvSk5OZU5lS3JhOUFNVHhNMXBVT3ZMZ1N0WGc4QjFlcnoy?=
 =?utf-8?B?NmpsRnBYam9tb0ZzV3EwN0p2SkR4U1FVUkFZeW9WRjNUZkphb2diNHRNTjAw?=
 =?utf-8?B?ZFY1UjBPdW9kRm5TOVJRRkVPcnk2U3BQQ29aMXQrOGhhQnM5MG1rUEppYWE5?=
 =?utf-8?B?d0JLZHFUYldqMFBBU3dUZmp6STNLdDIyWFdqeHYyOS9NSFVKbkNxdmJOcWpC?=
 =?utf-8?B?NUZ3ZnBMaUorNm5qM0tQZUoyb0NublBNZWdBTGRtaGZFaVUrbWp3V0Zmc1Iy?=
 =?utf-8?B?YnhOR3BjVk05VGZYZGF2YWJ1VHFqNEJHNlF2ZGV6N05NUzNUc0tDdzBiRkJY?=
 =?utf-8?B?cExodmVBME55blVWZzNvRFg2VklTWjhKa0NMRWFZS3Uzcm5vazJualdUTklJ?=
 =?utf-8?B?U1V1dXlnU0xsM2lSaEQ3SnNCSlVlcS8rSFNvVXRDM1BhOW4vaEN1NWRhaFgw?=
 =?utf-8?B?TzJ4Ym5OS2VsOGg5ZFpZUzY0RHVvZjE4dy91SXBRZ0p2UkYrN24xRDgyd2lF?=
 =?utf-8?B?MldRb1U5TzlzdDlVV0o3ZzhUTHBDaThCRENkektZTkpnczlkczErRHBGdnNI?=
 =?utf-8?B?dC9BRC9vM0h0TmZzTnpDcm9jVmprSGc4eCthRUV1MGJ3RTRqeUcveDl5b0dp?=
 =?utf-8?B?WUhYUEdaQW5YVWk3VFgxNzlMN0hnaUZ5Z2pSc1o4bkRrNzVFRVI3Qi9BR0VY?=
 =?utf-8?B?bkkvdFpaNms0ZGtsaFl0Wjh4WEZRU3N4OHNRSXpTa1FMQ2l0aWc0alpUTVRV?=
 =?utf-8?Q?0F7hWxIO8k6uOyf4aI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7821328919FE414AB89ABE598E22BDB3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb450fc-fbc1-4695-461b-08d8fbb9beeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2021 00:44:06.3216
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BFi/v2DnkLq2SRKkoKo5bzFSTQ15UuGOzD15zf5daPu+8H5ZRiFIC1DOjEtAe85q9YD5oFnlxBPHIeOc7CGQoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3304
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

R3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOg0KPiBPbiBGcmksIEFwciAwOSwgMjAyMSBhdCAwODow
MToxNUFNICswMDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+PiBHcmVnIEtyb2FoLUhhcnRtYW4g
d3JvdGU6DQo+Pj4gT24gVGh1LCBBcHIgMDgsIDIwMjEgYXQgMDY6NDI6MzJQTSAtMDcwMCwgVGhp
bmggTmd1eWVuIHdyb3RlOg0KPj4+PiBXZSBjYW4gY2hlY2sgZm9yIGhvc3QgcXVpcmtzIGF0IHJ1
bnRpbWUgYmFzZSBvbiB0aGUgY29udHJvbGxlciBJUCBhbmQNCj4+Pj4gdmVyc2lvbiBjaGVjay4g
U2V0IHRoZSBmb2xsb3dpbmcgcXVpcmtzIGZvciB0aGUgRFdDX3VzYjMxIElQIGhvc3QgbW9kZQ0K
Pj4+PiBiZWZvcmUgY3JlYXRpbmcgYSBwbGF0Zm9ybSBkZXZpY2UgZm9yIHRoZSB4SENJIGRyaXZl
cjoNCj4+Pj4NCj4+Pj4gICogWEhDSV9JU09DX0JMT0NLRURfRElTQ09OTkVDVA0KPj4+PiAgKiBY
SENJX0xJTUlUX0ZTX0JJX0lOVFJfRVANCj4+Pj4gICogWEhDSV9MT1NUX0RJU0NPTk5FQ1RfUVVJ
UksNCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5A
c3lub3BzeXMuY29tPg0KPj4+PiAtLS0NCj4+Pj4gIGRyaXZlcnMvdXNiL2R3YzMvaG9zdC5jIHwg
MjEgKysrKysrKysrKysrKysrKysrKysrDQo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0
aW9ucygrKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9ob3N0LmMg
Yi9kcml2ZXJzL3VzYi9kd2MzL2hvc3QuYw0KPj4+PiBpbmRleCBmMjlhMjY0NjM1YWEuLmE0ODZk
N2ZiYjE2MyAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9ob3N0LmMNCj4+Pj4g
KysrIGIvZHJpdmVycy91c2IvZHdjMy9ob3N0LmMNCj4+Pj4gQEAgLTksNiArOSw3IEBADQo+Pj4+
ICANCj4+Pj4gICNpbmNsdWRlIDxsaW51eC9hY3BpLmg+DQo+Pj4+ICAjaW5jbHVkZSA8bGludXgv
cGxhdGZvcm1fZGV2aWNlLmg+DQo+Pj4+ICsjaW5jbHVkZSA8bGludXgvdXNiL3hoY2ktcXVpcmtz
Lmg+DQo+Pj4+ICANCj4+Pj4gICNpbmNsdWRlICJjb3JlLmgiDQo+Pj4+ICANCj4+Pj4gQEAgLTQy
LDYgKzQzLDE3IEBAIHN0YXRpYyBpbnQgZHdjM19ob3N0X2dldF9pcnEoc3RydWN0IGR3YzMgKmR3
YykNCj4+Pj4gIAlyZXR1cm4gaXJxOw0KPj4+PiAgfQ0KPj4+PiAgDQo+Pj4+ICtzdGF0aWMgdm9p
ZCBkd2MzX2hvc3RfaW5pdF9xdWlya3Moc3RydWN0IGR3YzMgKmR3Yywgc3RydWN0IHhoY2lfcGxh
dF9wcml2ICpwcml2KQ0KPj4+PiArew0KPj4+PiArCW1lbXNldChwcml2LCAwLCBzaXplb2YoKnBy
aXYpKTsNCj4+Pj4gKw0KPj4+PiArCWlmIChEV0MzX1ZFUl9JU19XSVRISU4oRFdDMzEsIEFOWSwg
MTkwQSkpIHsNCj4+Pj4gKwkJcHJpdi0+cXVpcmtzIHw9IFhIQ0lfSVNPQ19CTE9DS0VEX0RJU0NP
Tk5FQ1Q7DQo+Pj4+ICsJCXByaXYtPnF1aXJrcyB8PSBYSENJX0xJTUlUX0ZTX0JJX0lOVFJfRVA7
DQo+Pj4+ICsJCXByaXYtPnF1aXJrcyB8PSBYSENJX0xPU1RfRElTQ09OTkVDVF9RVUlSSzsNCj4+
Pj4gKwl9DQo+Pj4+ICt9DQo+Pj4+ICsNCj4+Pj4gIGludCBkd2MzX2hvc3RfaW5pdChzdHJ1Y3Qg
ZHdjMyAqZHdjKQ0KPj4+PiAgew0KPj4+PiAgCXN0cnVjdCBwcm9wZXJ0eV9lbnRyeQlwcm9wc1s0
XTsNCj4+Pj4gQEAgLTQ5LDYgKzYxLDcgQEAgaW50IGR3YzNfaG9zdF9pbml0KHN0cnVjdCBkd2Mz
ICpkd2MpDQo+Pj4+ICAJaW50CQkJcmV0LCBpcnE7DQo+Pj4+ICAJc3RydWN0IHJlc291cmNlCQkq
cmVzOw0KPj4+PiAgCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UJKmR3YzNfcGRldiA9IHRvX3BsYXRm
b3JtX2RldmljZShkd2MtPmRldik7DQo+Pj4+ICsJc3RydWN0IHhoY2lfcGxhdF9wcml2CWR3YzNf
cHJpdjsNCj4+Pg0KPj4+IFR5aW5nIHRoZSBkd2MzIGNvZGUgdG8gdGhlIHhoY2kgY29kZSBsaWtl
IHRoaXMgZmVlbHMgcmVhbGx5IHdyb25nIHRvIG1lLA0KPj4+IGFyZSB5b3Ugc3VyZSB0aGlzIGlz
IHRoZSBjb3JyZWN0IHJlc29sdXRpb24/DQo+Pj4NCj4+PiBncmVnIGstaA0KPj4+DQo+Pg0KPj4g
Q2FuIHlvdSBjbGFyaWZ5IHdoYXQgZmVlbHMgd3Jvbmc/IFRoZSB3YXkgaXQncyBvcmlnaW5hbGx5
IGltcGxlbWVudGVkDQo+PiBhbHJlYWR5IHRpZWQgdGhlbSBpbiB0aGF0IHdheS4gV2hhdCB3ZSdy
ZSBkb2luZyBoZXJlIHNpbXBseSB0YWtlcw0KPj4gYWR2YW50YWdlIG9mIHdoYXQgeGhjaS1wbGF0
IGdsdWUgbGF5ZXIgY2FuIHVzZSB0byBzZXQgdGhlIHhoY2kgcXVpcmtzLg0KPj4gV2l0aCB0aGlz
LCB3ZSBkb24ndCBoYXZlIHRvIGNyZWF0ZSBuZXcgYW5kIGR1cGxpY2F0ZSBEVCBwcm9wZXJ0aWVz
IGZvcg0KPj4gZHdjMyBhbmQgeGhjaSB0byBzZXQgc29tZSBxdWlya3MuIFdpdGggdGhlIGV4cGFu
ZGluZyBsaXN0IG9mIGR3YzMgRFQsIEkNCj4+IHNlZSB0aGlzIGFzIGEgcGx1cy4NCj4gDQo+IE9r
LCBzdGlsbCBmZWVscyBvZGQsIGJ1dCBJJ2xsIGxldCB0aGUgeGhjaSBtYWludGFpbmVyIG1ha2Ug
dGhlIGRlY2lzaW9uDQo+IG9uIGl0IGFzIGl0J3MgdGhlaXIgY29kZSB0byBtYWludGFpbiwgbm90
IG1pbmUgOikNCj4gDQoNClN1cmUuIExldCBtZSBrbm93IGlmIHlvdSBoYXZlIHN1Z2dlc3Rpb25z
IHRvIG1ha2UgdGhpcyBiZXR0ZXIsIGFuZCBJJ2xsDQp0cnkgdG8gbWFrZSB0aGUgbmVjZXNzYXJ5
IGNoYW5nZXMuDQoNClRoYW5rcywNClRoaW5oDQo=
