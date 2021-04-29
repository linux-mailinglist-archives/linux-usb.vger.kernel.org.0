Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4D1E36E35B
	for <lists+linux-usb@lfdr.de>; Thu, 29 Apr 2021 04:39:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232316AbhD2CkH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Apr 2021 22:40:07 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:52588 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229805AbhD2CkG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Apr 2021 22:40:06 -0400
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 86890402A1;
        Thu, 29 Apr 2021 02:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1619663960; bh=0d6AdOQNK0kvYnvXiRVYhdzGyDcRaLe094yW77GZ4Fk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=gFgMeSGJDuGgrT/4FkRD/Cuiez/qK4WARgASKXJf7D+rsKH+Ssx5c+nDzZNgMmztg
         04PFWjTKLk6ldoxw8iFj4gSdiSeQ/1zcKteOpWmuyvJ8/HKY1Y31vicx0s307KefN/
         imBBC/RsAhmWCjjy893F4mRm+EZa0Zxzn0zkzyLX0Ladbjq5DLTOgRbnFRu6YnKI3B
         usFpHe5pnUiERY9S2Z84SLBhfF6l4ui4MDcgpDgo233+EX6Wz7Z1IUqZeYPT+bI0E4
         wklZc7XLpI2Mw3o4liIQVSgJvk3MFcBJHyR5zNHsFm+2ZK9sxv5P6SAnJgE4h0h2D/
         UC5xMVgevU+oQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id E47A4A006A;
        Thu, 29 Apr 2021 02:39:19 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 50AB24017D;
        Thu, 29 Apr 2021 02:39:19 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="CoHOmUje";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fA07hcaUTPGrlIiSBb9eMJjvH5pZRyFINT5aIFrcxtQI1dUr1sr8K49kGTr8ynAqOylQtbbzOKG5ToEzEikM3Kv/yhvFIyufDFMvyKxQQ8UR16LOkJEWcj9jTHI2AbxmANu/IP5O6Hvt6ek0bXjUbyCfzpcbnoQhj4mb2ZMMa/slR/i0RHEpIB/XK8Jhbx3SggjFzjkfkV+T7O8vb22SFsdmM7Lmg+sWBwvyry4mTNyQbFn9Xij/GyF2teDHGLcXeYlqnFqkOtOaLJISvIK7bxGzkiFVHePsKks8ldL7bOs7u7YadJbsq9OP6mA3vuYrJ9FgFu2P0MEdl9WP9YocXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0d6AdOQNK0kvYnvXiRVYhdzGyDcRaLe094yW77GZ4Fk=;
 b=Z2k7gRb4ack2jdjfKWpRRevhBlFKKVpysUGFafSgyCrUsDAGIzql6rU+CGGlVu3HSOkZsMxIFNyIyNQ/dCLaPCmJ+xpIaeijZz9PwMGNP/t47fHhELEbpfiuzEyoSwXGs4IoKkaH8i3CRD5SNrXbSW5CdsjjBYQRROoP/SDbwZcaDZKTXnz2leCT/GZbINMc7NBbTG29TBpvXuG0g3oSxjq8aJi7oIW4D2geelsDwSZrgLabe1mnN9jYY2QU5i7SDNxMUWa3tBhIrPkkXgrLa45Oz4++wqVCvg3g94Fxkxt4aKvEpcu2YZK65IAGCjyrCUgsn8CNw+fIQvHaZJbWbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0d6AdOQNK0kvYnvXiRVYhdzGyDcRaLe094yW77GZ4Fk=;
 b=CoHOmUjeKjETXxhrP8hO8vMBuBYoDadoeY66BD4RtXJWLl/zvk+d9/hYgKf/DzkoevPUVLNS6V3sDKjJnwV/ZhH6EERbObIzH+wL0FqCQgumf2cI95xpEj7hcKrNWeBkDxIy86lun3+X5BreK5B2hWgj2tZrda+RH3cp4Jtc1ic=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4209.namprd12.prod.outlook.com (2603:10b6:a03:20d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Thu, 29 Apr
 2021 02:39:17 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c%6]) with mapi id 15.20.4087.025; Thu, 29 Apr 2021
 02:39:17 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Jack Pham <jackp@codeaurora.org>, Felipe Balbi <balbi@kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Baolin Wang <baolin.wang7@gmail.com>
Subject: Re: [PATCH 2/2] usb: dwc3: gadget: Rename EOPF event macros to
 Suspend
Thread-Topic: [PATCH 2/2] usb: dwc3: gadget: Rename EOPF event macros to
 Suspend
Thread-Index: AQHXPA0YAV4SUFxw/0GSkMnpgPgnqKrJukwAgABaAwCAALVJgA==
Date:   Thu, 29 Apr 2021 02:39:17 +0000
Message-ID: <7a809b49-358e-bcd8-c5bf-07d96bd27ea1@synopsys.com>
References: <20210428090111.3370-1-jackp@codeaurora.org>
 <20210428090111.3370-2-jackp@codeaurora.org> <87eeeuk8jj.fsf@kernel.org>
 <20210428155026.GE20698@jackp-linux.qualcomm.com>
In-Reply-To: <20210428155026.GE20698@jackp-linux.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76b86872-7093-4d2d-6043-08d90ab7fc4c
x-ms-traffictypediagnostic: BY5PR12MB4209:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB420995EE1CF75091ACED56FBAA5F9@BY5PR12MB4209.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ki4N5QlxTxN38ZYX1ay+MRvtDQj9eBFLpksvgYYBa1Uf41oRo+ariOWE/91v55ub1+6Mv1b+3HDSien1/e9qf7X7vEC/aGtkbMXfZ5dGQMbBy+45qaU1JTEBAVPGJkqeDWviMCrzLv0JnWE4qAeCyNoAkM/MPAC+Tmn0D35hPJRLWXF3Z7nb+Xt52fQQvxQDw6W1dXtiJtx+4s82U/vL0DuxvDhIHG4a7ZT2U6seBtFra4tJKbFBZT9Pfg0UWZhBCNzXnaCeJQeuTPLrPHYFl2ertJ0DtKjogHhstIMTMBskbDo5ILWZrMgS+v6DAoKr/V/NELV7W0XfSLonK6tuVoEF2NsYNXbgh6zDh5RcGzhp2E70Ix2za0/8/f+V33p0VxtJg8Z1ot9kwJseCPWzyaWk8YNAogT9gXboEonq9WHHSWxiNpVlwu/F66lW4FT5K/qLfdaqlxZZoVyFY7tVRWdeYC7As4qdE7oz+rGXme3G3DU+5AE+AEUitBdiDz1rWAbplUJxat+ar1bYJk5Tm9gITzW1DcHlJGhAl2UBE6O85haKzWdirdvAbKvWWczMIpg61oq/K3Rz3N+7LQaetr5Eb/tLwJszf3gXHb0EWQYHooX0dKTcjH2D6svJqxkhLNIVdFzxMtmfsAQrgiAAzEbz+Kd8mGAckJeq67j1dLQvbvuqqlI5PbKNaSdDsdB4
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39850400004)(376002)(366004)(396003)(136003)(8936002)(71200400001)(5660300002)(86362001)(83380400001)(15650500001)(76116006)(54906003)(316002)(4326008)(478600001)(110136005)(2616005)(6512007)(66446008)(66946007)(66476007)(66556008)(186003)(31696002)(8676002)(26005)(6506007)(36756003)(31686004)(6486002)(64756008)(2906002)(122000001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?eXNxVFordGV2SkZlRGY1T21YckN2azBrSHE1aFlRQXA3M04zSGxQbUR2R0E1?=
 =?utf-8?B?VFVnU0VLK1JQWWt2VmVKNWF4SnMvMnNBYTRVdWFabUxvMjZnUjFjMm02YmNH?=
 =?utf-8?B?VGpDQTc3ZFJvUzluVkJzT1pmVGpuVVY0bVJyVENwUXJJV0MvMFNqTDQvV1po?=
 =?utf-8?B?dkhHVmYvUUJqdWFER2VUM21VQjFWbWwvSTZEd0gzdG8yUmZOWXEwZHlxNnVU?=
 =?utf-8?B?Rkg0SFk2M3d5eFhLSkRwZzRTZXppVGZDN1d4MGg0ODNUQWNqREJKSzMzTXcx?=
 =?utf-8?B?UGt1SVFUQ0RtZ0o0bVRnaUl4Sk5oWDNwdVJJMlVWTXoraWVMUE9TbEV4WGwr?=
 =?utf-8?B?NlIzZitCNTRlV2VRampQK1BIRTZLb2FkQ0RxczJJTEpHcXlaYWZMR3l1WXJR?=
 =?utf-8?B?SWFDVWY4ajNYalg4MGVCMXhYNDlsQ2pyT3ZjczZTTmpZZE01b0xxbmRMRlJz?=
 =?utf-8?B?ZEVISktPdlkvQ29HcnNzWWpHdW14eGs1dTNoMjJBLzhmaVhzVGYvMFFBMGc5?=
 =?utf-8?B?OHF3MzFLV25zYmlIdHZhN0oybjVrRk1OZWRWVGJEK0I3M1NTSS8wYUkwMndv?=
 =?utf-8?B?QytDRFoxZEJvbmlyU21NemhHYkJSSi8yZWx0cUIxSGpHQzBiTi9UL2VNd0ZS?=
 =?utf-8?B?WktVckpQMTc4bGRXOWVLQmFYRHN2eTkrUllkUEFRbGpSSDlwZ0sxbU84RkRV?=
 =?utf-8?B?Ym5jZ041dFVkUTZCMEVSOUVDQzQ1WEMxNFFCa3FnYURwbWVPQnRpRkNZaG5a?=
 =?utf-8?B?eWFUeG1ZTFBZL0hBRG5DZG1XQnozWFI2dkQ0b3MxRTZlSys0Q3BHbTYzUURQ?=
 =?utf-8?B?T0RGcUo5cmZiM2dzd2ovWVdUb0hUUmhFS0xyb1ltUXViOEFZTXdRRmQ1eXRa?=
 =?utf-8?B?a2ppNnVwQXhpUEYyZWxtNWc5SmZNVGI4eXFGUGpqNDJmV0hTeEk3QTJjYko1?=
 =?utf-8?B?aTFVQ0paS0VDa0EvWnVWTkkvdjYwaTlSRVJEdkgvb1BPUzk1THBNY056Zm9n?=
 =?utf-8?B?WHNmSXlRYU83aHpUYjQ2eTBXR21kQ1JjQmVLZUxtcmpCbnhSRFA5SSsyRS9h?=
 =?utf-8?B?VUZVUVVjRzdESnVjVG9qYjgxczBvaXdHWlJyeFNxZjN2bm1mTnNYSzFNTGZL?=
 =?utf-8?B?MU44ZGtxenZtRm9ZRUEzVHdHVFpOcXJrelRhVlJ3K2ZiYThveUlCNk1CaFN5?=
 =?utf-8?B?L2ErVzVxcG9oN0k1U2RwSExUU004M2oxa3lXbEh1eXRNTjNCZ3lnVW41dUNT?=
 =?utf-8?B?YU8rcXQya0NnMDRneFA0TU03ZUI2V3k2SFBCTzZyRmg1RkVrL0E3R2NtSSsw?=
 =?utf-8?B?UTlHeFgwYXJyUG05Y3cyaUpNTVA3ZFZSMGNvMHRtS2tjb1N2NkVDbU1BOVk2?=
 =?utf-8?B?cWtVWXRML3FjbWFOcXR2YmtkMjNzT2tlWkV5eUFDSDJpMUU3TGdvMWNNVUtk?=
 =?utf-8?B?clZNQTJENXJGWnlXUUhLRGU1YkJxNDRZaUhFZnk3RFkxc0hpYlJPcjV2Sjcv?=
 =?utf-8?B?YjYrbjByRHQ5ZDVxLzN0bEtMdkwzVGgrS3QwSDlqdlBKUTdHZUhGMlJtMFA5?=
 =?utf-8?B?TmhCSG1id3d2bW00UW1tR0l6RG5qcmJqdFdGS0hRQ3NUS240MDZrL3g5U1ll?=
 =?utf-8?B?clowUnlRUlI5cGFHRG9PZitiUTE2ZkpGUUp4dE5hQTFjVmp0YysyUGFBYVJ0?=
 =?utf-8?B?L01taTZUdGVwYzVhWFVRanBNNHphZHpodHdzV1o2Q2pkWXYzaHByL0RYcmdM?=
 =?utf-8?Q?Leqv6F7yG0DTz53mX6v/e8w8gN4WYqeEbIRMHxy?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9A9C38CC35D3C4CB6BCE2ABC8E7152D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76b86872-7093-4d2d-6043-08d90ab7fc4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2021 02:39:17.5783
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QxRkuI7zUDSoc4sDpVFiVM8y1ONeDFu3AkUQliXai4p8kgm85wq87I0g2GmAGOXsNzA+QizBgpeUUIREuknv1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4209
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SmFjayBQaGFtIHdyb3RlOg0KPiBIaSBGZWxpcGUsDQo+IA0KPiBPbiBXZWQsIEFwciAyOCwgMjAy
MSBhdCAwMToyODoxNlBNICswMzAwLCBGZWxpcGUgQmFsYmkgd3JvdGU6DQo+PiBKYWNrIFBoYW0g
PGphY2twQGNvZGVhdXJvcmEub3JnPiB3cml0ZXM6DQo+Pj4gVGhlIGRldmljZSBldmVudCBjb3Jy
ZXNwb25kaW5nIHRvIEVuZCBvZiBQZXJpb2RpYyBGcmFtZSBpcyBvbmx5DQo+Pj4gZm91bmQgb24g
b2xkZXIgSVAgcmV2aXNpb25zICgyLjEwYSBhbmQgcHJpb3IsIGFjY29yZGluZyB0byBhDQo+Pg0K
Pj4geW91J3JlIHJlYWRpbmcgZGF0YWJvb2sgZm9yIGR3YzMuMSwgcmlnaHQ/IFJlbWVtYmVyIHRo
ZSBvcmlnaW5hbCBzdXBwb3J0DQo+PiBmb3IgdGhlIGRyaXZlciB3YXMgb24gZHdjMy4gVGhpcyB3
YXMgYWx3YXlzIGNhbGxlZCBFT1BGIGJhY2sgdGhlbi4gV2UNCj4+IHNob3VsZCBtYWludGFpbiB0
aGUgbmFtZS4NCj4gDQo+IEkndmUgbG9va2VkIHRocm91Z2ggc2V2ZXJhbCByZXZpc2lvbnMgb2Yg
dGhlIGRhdGFib29rIGZvciBib3RoIGR3YzMgYW5kDQo+IGR3YzMuMS4gRnJvbSB3aGF0IEkgY2Fu
IHRlbGwgRU9QRiB3YXMgbml4ZWQgc3RhcnRpbmcgaW4gRFdDMyAobm90IDMuMSkNCj4gcmV2aXNp
b24gMi4yMGEuIERXQzMgcmV2aXNpb24gMi4zMGEgcmUtaW50cm9kdWNlZCBldmVudCAjNiBmb3Ig
VVNCDQo+IHN1c3BlbmQuIEFuZCBqdWRnaW5nIGZyb20gdGhlIElQIHJldmlzaW9uIGxpc3QgaW4g
Y29yZS5oLCBEV0MzIGlzIG5vdw0KPiB1cCB0byAzLjMwYSAoRFdDM19SRVZJU0lPTl8zMzBBKSwg
c28gZnJvbSBudW1iZXIgYWxvbmUgdGhlcmUgYXJlIGFib3V0DQo+IGFzIG1hbnkgcmV2aXNpb25z
IHRoYXQgaGF2ZSB0aGlzIGJpdCBhcyBFT1BGIGFzIHRoZXJlIGFyZSB0aGF0IHVzZSBpdA0KPiBm
b3IgU1VTUEVORC4gVGhpcyBjYXJyaWVzIG92ZXIgdG8gRFdDMy4xIGFzIHdlbGwgKG5vdCBzdXJl
IGFib3V0IERXQzMuMikNCj4gc28gaW4gZmFjdCB0aGVyZSBhcmUgcHJvYmFibHkgbW9yZSByZXZp
c2lvbnMgb2YgSVAgdGhhdCBubyBsb25nZXIgdXNlDQo+IEVPUEYuDQo+IA0KPiBIaSBUaGluaCwg
SSdtIHdvbmRlcmluZyBpZiB5b3UgY291bGQgcGxlYXNlIGhlbHAgY29ycm9ib3JhdGUgdGhlIGhp
c3RvcnkNCj4gb2YgdGhpcyBiaXQsIGFuZCBjb25maXJtIHdoZXRoZXIgaXQgaXMgYWxzbyB1c2Vk
IGFzIFN1c3BlbmQgZW50cnkgaW4gRFdDDQo+IDMuMiBJUHM/DQoNCkRXQ191c2IzMiBJUCBpcyBh
bHNvIHRoZSBzYW1lIGFzIERXQ191c2IzMSBhbmQgdXNlcyBpdCBmb3Igc3VzcGVuZCBldmVudC4N
Cg0KQlIsDQpUaGluaA0KDQo+IA0KPiBCdXQgSSBkb24ndCB3YW50IHRvIG1ha2UgaXQgc2VlbSB0
aGF0IEknbSB1c2luZyByZXZpc2lvbiBoaXN0b3J5IGFzIGENCj4gZ2F1Z2Ugb2YgaG93IG1hbnkg
cmVhbCBkZXZpY2VzIG91dCB0aGVyZSBzdXBwb3J0IEVPUEYgdnMgU3VzcGVuZC4gVGhhdA0KPiBm
aWd1cmUgd2UnbGwgbmV2ZXIgdHJ1bHkga25vdy4NCj4gDQo+Pj4gY3Vyc29yeSBTTlBTIGRhdGFi
b29rIHNlYXJjaCkuICBPbiByZXZpc2lvbnMgMi4zMGEgYW5kIG5ld2VyLA0KPj4+IGluY2x1ZGlu
ZyBEV0MzLjEsIHRoZSBzYW1lIGV2ZW50IHZhbHVlIGFuZCBjb3JyZXNwb25kaW5nIERFVlRFTg0K
Pj4+IGJpdCB3ZXJlIHJlcHVycG9zZWQgdG8gaW5kaWNhdGUgdGhhdCB0aGUgbGluayBoYXMgZ29u
ZSBpbnRvDQo+Pj4gc3VzcGVuZCBzdGF0ZSAoVTMgb3IgTDIvTDEpLg0KPj4+DQo+Pj4gRU9QRiBl
dmVudHMgaGFkIG5ldmVyIGJlZW4gZW5hYmxlZCBiZWZvcmUgaW4gdGhpcyBkcml2ZXIsIGFuZA0K
Pj4+IGdvaW5nIGZvcndhcmQgd2UgZXhwZWN0IGN1cnJlbnQgYW5kIGZ1dHVyZSBEV0MzLWJhc2Vk
IGRldmljZXMNCj4+PiB3b24ndCBsaWtlbHkgdG8gYmUgdXNpbmcgc3VjaCBvbGQgRFdDMyBJUCBy
ZXZpc2lvbnMgZWl0aGVyLg0KPj4NCj4+IFdlIHN0aWxsIGhhdmUgb3JpZ2luYWwgb21hcDUgZGV2
aWNlcywgcnVubmluZyBvbiByZXZpc2lvbiAxLjczYQ0KPj4gYXJvdW5kLiBUaGV5J2xsIHJlbWFp
biBzdXBwb3J0ZWQgZm9yIHRoZSB0aW1lIGJlaW5nLg0KPj4NCj4+PiBIZW5jZSByYXRoZXIgdGhh
biBrZWVwaW5nIHRoZSBkZXByZWNhdGVkIEVPUEYgbWFjcm8gbmFtZXMgbGV0J3MNCj4+PiByZW5h
bWUgdGhlbSB0byBpbmRpY2F0ZSB0aGVpciB1c2FnZSBmb3Igc3VzcGVuZCBldmVudHMuDQo+Pg0K
Pj4gd2hhdCBkbyB3ZSBnYWluIGZyb20gdGhpcyBjaGFuZ2U/IEkgbWVhbiwgaW4gcHJhY3RpY2Us
IHdoYXQgY2hhbmdlcz8NCj4+IG5vdGhpbmcgcmVhbHksIHNvIHdoeSBzaG91bGQgd2UgYXBwbHkg
dGhpcz8NCj4gDQo+IEknbSBzYXlpbmcgc2luY2UgdGhpcyBtYWNybyBoYXMgbmV2ZXIgcmVhbGx5
IGJlZW4gdXNlZCB0byBlbmFibGUgYW55DQo+IGtpbmQgb2YgZXZlbnQgaGFuZGxpbmcgc3BlY2lm
aWNhbGx5IGZvciAiRW5kIE9mIFBlcmlvZGljIEZyYW1lIiwgdGhhdA0KPiB0aGVyZSBpcyBub3Qg
bXVjaCB1dGlsaXR5IGluIGtlZXBpbmcgdGhlIG5hbWUgYXMgRU9QRi4gSW5zdGVhZCBhcyBJDQo+
IGV4cGxhaW5lZCBpbiBwYXRjaCAxLCB0aGUgc2FtZSBiaXQvZXZlbnQgaXMgdXNlZCBvbiBuZXdl
ciByZXZpc2lvbnMgZm9yDQo+IFVTQiBTdXNwZW5kIGVudHJ5IHNvIGFzc3VtaW5nIHlvdSBhY2Nl
cHQgdGhhdCwgdGhlbiB0aGUgcHVycG9zZSBvZiB0aGlzDQo+IGZvbGxvdy1vbiBwYXRjaCBpcyBz
aW1wbHkgdG8gbWFrZSB0aGUgY29kZSBtb3JlIHJlYWRhYmxlIGJ5IHJlbmFtaW5nIHRoZQ0KPiBt
YWNybyB0byBmaXQgaXRzIHVzYWdlLg0KPiANCj4gVGhhbmtzLA0KPiBKYWNrDQo+IA0KDQo=
