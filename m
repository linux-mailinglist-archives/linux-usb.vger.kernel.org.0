Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8792132B69E
	for <lists+linux-usb@lfdr.de>; Wed,  3 Mar 2021 11:32:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237422AbhCCKbc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Mar 2021 05:31:32 -0500
Received: from mail-bn7nam10on2088.outbound.protection.outlook.com ([40.107.92.88]:35809
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237648AbhCCGNn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Mar 2021 01:13:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fRNOWuOupFM7TWOawSSyoY/sIms9tSBzvor3GslhD5jq9y/WsX/xGxLsRdanZCxNkf0HTdsAZsuTaqZHWlvOk5kA56UvcLDXBbVqu+VLqKGEivr8M7nrgN8zbjyQ/38gsprYthEE5j4w4ieHWJxdC15RUX8tGAx5pQMk+ilSyWt7iWia2B+2dXXHo0pd3bTWHvswKNdSk5/vkjX3+eJpR5THtpH5PWh6qUJxi8wvD1XGQZiKW1C0wvAjD0lFhGaYH+MJFWr9LFTgZz898TMfYnEgXq1Llkb5v+5SGuobUp/0mXpFBWbhjblTld5lAH335Ib0eFBoaRb7jHLBJzTk+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9hxYtz91ZYrq8h7CUPb7JZYtGHLmUcbsc396yfdHkY=;
 b=nq/DwRiolaXQ20WBKFjY4/28nRmKpzd2yquGmx766Z3oxy0xGi5sB20WvWctbnbfN3NZw5GGDcYKNId/cpqv1JJ0VUQzkNuRWIzAVuhC1/lSKcqzp/YPMvIksIzlZYIIIop0sTZ4Ri4G/4QIVXgy0Aonl3S3t8o6Kq/tFNVIkX5XFGZX651iWg/AQOp1CqdTZU4okYm6MwkwC/dGF5qDbApRsUtba1ubvCmfH3hYVS65Jx0QqxDS3jmHmBQdLEo4ida+YyK/IlBazDFk7v12fZVWYw7Wgh9+kWonfosSGV/5I0L1ZHGWRtCZv4KzYGThJfx9u0AH7uxD+D2me39RqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9hxYtz91ZYrq8h7CUPb7JZYtGHLmUcbsc396yfdHkY=;
 b=ZGPIeN+tsC+Dxb3WiRwGNN/fAcmSRjYbXUFIBfh9rVefkT+gwVWpdU/23qBBuUmNKD/mPoVI9moNzKCFGIRi2kmgIGxjEineI9PBssPEDjOWc46eeV14I1OeeYJ2HP88DkC5ovTTRJBzLLfVMA0fVM5U9UQLRPVaT8YguymeEus=
Received: from BYAPR11MB2632.namprd11.prod.outlook.com (2603:10b6:a02:c4::17)
 by BYAPR11MB3559.namprd11.prod.outlook.com (2603:10b6:a03:f7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 3 Mar
 2021 06:12:47 +0000
Received: from BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::89a3:42c3:6509:4acd]) by BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::89a3:42c3:6509:4acd%4]) with mapi id 15.20.3890.029; Wed, 3 Mar 2021
 06:12:47 +0000
From:   "Zhang, Qiang" <Qiang.Zhang@windriver.com>
To:     Pete Zaitcev <zaitcev@redhat.com>
CC:     Greg KH <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: =?gb2312?B?u9i4tDogW1BBVENIXSBVU0I6IHVzYmxwOiBBZGQgZGV2aWNlIHN0YXR1cyBk?=
 =?gb2312?Q?etection_in_usblp=5Fpoll()?=
Thread-Topic: [PATCH] USB: usblp: Add device status detection in usblp_poll()
Thread-Index: AQHXD+vwg4k9Y6Oby0ugeh2qPdrAyapxxYTy
Date:   Wed, 3 Mar 2021 06:12:47 +0000
Message-ID: <BYAPR11MB2632C3C64F5B9116E0D074E4FF989@BYAPR11MB2632.namprd11.prod.outlook.com>
References: <20210301040300.20834-1-qiang.zhang@windriver.com>
        <YDyfL/yg9QNM4nku@kroah.com>
        <BYAPR11MB263268B5FD6EB3C3B80B63FBFF9A9@BYAPR11MB2632.namprd11.prod.outlook.com>
        <YDymu1AlS+8UjdXG@kroah.com>
        <BYAPR11MB2632AE1A6D78903112F86062FF9A9@BYAPR11MB2632.namprd11.prod.outlook.com>
        <YD3jlIR7UJjXT6Se@kroah.com>
        <BYAPR11MB263258B4BD102A08BF454D82FF999@BYAPR11MB2632.namprd11.prod.outlook.com>,<20210302231254.7a0e32cb@suzdal.zaitcev.lan>
In-Reply-To: <20210302231254.7a0e32cb@suzdal.zaitcev.lan>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=windriver.com;
x-originating-ip: [60.247.85.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 19e5f822-1007-4a1b-b78a-08d8de0b5e24
x-ms-traffictypediagnostic: BYAPR11MB3559:
x-microsoft-antispam-prvs: <BYAPR11MB3559BACA77368E01FA99F3EFFF989@BYAPR11MB3559.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8iNAPtMympbw5m3pLTiLRtt5qGwtlBJDaMn3aFnKqh7hml2vnGO/18Nj6WhdE2roZ2e+t/ahkmBtz3aENCn53w2KYKEEyyDAPjfqpRAEYx6GmSQ/wQ7vBs3xRAIZlmNMpqwHIV7zWFMATulVByUnnpg4YNsEQzYlOEQhg3qPiAW6+hBqnh2uWzkiF9Vb7MpQ6igCQmGS1ELhTxaUO0VttAvNCI6ujv03DqUf6LxDoyRq5WL4ArqfQTPZFsk/iJKJ4ZA9y9dDzafQnVUKDDLBGA9Y0vZj3wbE86/DudvUTYSkotSoiXzIePozBw84mtbveLCj+38XSGD3EJ6QMtQ7vPemo4IjsXYd/jrn6op4Bunn692DLiVxPw9k+93m6gU/FE0z8h+L0W5CiX5rEAFaJuTjEuhIG46+KK79ryHRRzg77RYUBbuKxStvi+tEkMKHWeN2PedxJgGdFoG5A5lNe1qVMsuDwkai7eqaMpL6yYLZc7Px1WBk1m5K8M1gws3rh+StNyvLf9aZ5kCVDNIZXg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2632.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(136003)(39850400004)(376002)(91956017)(8936002)(4326008)(9686003)(71200400001)(224303003)(52536014)(33656002)(5660300002)(66946007)(478600001)(316002)(76116006)(66446008)(54906003)(64756008)(66556008)(66476007)(6916009)(83380400001)(7696005)(26005)(86362001)(55016002)(6506007)(186003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?gb2312?B?WVhFdWFoalZsWGhYUGRScVhGZnQwQ3M2cUZhWEQrRDUxaDE3Q0xNb2FBWHJr?=
 =?gb2312?B?N3VKODJxcTd0UWtNSHRrdFpiV0x3QzFsRjUvTVJ3UnUxV25ReFcyRVVNZFZ0?=
 =?gb2312?B?c3hWVTIwQkpUdHk4Rm5qWFYrS3Jlc3FpYXkxZFc2dkE1alE1TXQrdGpnbkpx?=
 =?gb2312?B?VEhUaXRnWTRtYnFOK1orb00xRmtncmhxMTJQdFZBTWZCRmdBaTgxZUpTR25z?=
 =?gb2312?B?d3hNdGJNWHZiMVRMR0N5M1p3MXZJL0FKR0JvMmI1a1FaTmlrak9KNUFyNkZa?=
 =?gb2312?B?S29tVWgzaVRvWlBSdmJuTG12SnV2dmZidWZhNFY1c0VFZituVllOOW1ZMnhj?=
 =?gb2312?B?cjlvTW9wTFFjeXN4TkYvdXlrMFdKZWRNOHNOSzhmVnd3b0djd0VtV0lnL0Rx?=
 =?gb2312?B?QnNFbERkZGphNjFKOEJ3THZaaC9nU3lhQVNDZGVWSXIxT0ZMOUgxWndrOHUr?=
 =?gb2312?B?OExkNnBrYmM5RFhNNWpTc2gzMmV4d0Z6ZDh5Vi92QmlpTllmdGdBZVgrNSt3?=
 =?gb2312?B?RmhpWGtJVGNrQXc4YTFSdG9JZEc2NmJvQ3pmZURaSkhlUmYzMFJsdnVFcHk2?=
 =?gb2312?B?UTQ5SHFkNk5wMjVBa2J4N05CQmpodi9ndzJEdDVTa2V3WHZkQ25NaDBLVkJ0?=
 =?gb2312?B?cTVmYnlaVm5md25EQ2Z6R09LRTdLRVgweVlmUnVlN1RxWi9XUEhhTjFVWE9r?=
 =?gb2312?B?YUxkek5VWmhIMkdRbE1kbGYwWVZDc2VDQ085ZmF2Q1RmUzFHRmZ6Q05RQzds?=
 =?gb2312?B?YTFtTWE5NHA1QnE4a2lLYjZKckJmcURobURTU01FVmZMbVdkVFhRSFB4Vjdt?=
 =?gb2312?B?aEJWQWU4L3VNbGRPZnlHczRUVmtmWG1MMjJWV0FqKys3WWN0N3R1aFNsNU5o?=
 =?gb2312?B?YWhwNmFLaDFLZnpkSXlubHF5dEVIQVJvbkcvdldWVjk3TzFZQ20xT01pNStH?=
 =?gb2312?B?aXBiY29kdVJuZ0llUHZnd0VLazgwZGcwUUpNdHQ1TEFFaDdnVmF1aWhEK2ZW?=
 =?gb2312?B?RE0xdHBUZi83RGMrQkVoUDUyUkZoaVkvSEFjMUFOdVdJOFpJMUdiK1hXY0FY?=
 =?gb2312?B?RExGN3FNTlNCSDcxTW5tbEJBajFIUy95L2YrdG1pU0VNVmNscVk3OEY5SmdP?=
 =?gb2312?B?em5vR1k0UmFkQ0xpYTlqaUYzNTZrWHhCQnJRWEJlNkpZR2V4OU9INDRjWlJD?=
 =?gb2312?B?bkNxNTZWU3ROWXViZUNxdlZYdCtpSUo2NkdVQVBDYlJNMTBVd2JCUVMzS29L?=
 =?gb2312?B?aEQrTjJ1cnlSM3czWlZ6c3ZlTCtkYmc2UkVpT0c2ak5ERFZtTSswRTllOVdx?=
 =?gb2312?B?TlROWGZSODc3Mm0xU1ZFbUZwWm1YcmtFZ2oxa0hLWmZnVWl4Y05ZY3VIKzJu?=
 =?gb2312?B?Y0w2Q01sTzR2c20ydmRxakNxaXo2aVgyMEFYazhUSjk4N1ZXbnhkTVQxYU5J?=
 =?gb2312?B?d3drejFrQm9VTDhxMUtuMlNoWlZ5WENlcE5SejdGR0ZZY09hcFN4RjVIWURW?=
 =?gb2312?B?RW9MUTNTa09ncUpYaSsrY0NwOEltRmViR01aZUFmMnBqNlZPWWp2NVVBbU1D?=
 =?gb2312?B?WDg2MXhQREUyS1d6ZEFIVUJPWDdINUtBSWdZMjFGUXhqcFRxSno0aEw2SXhR?=
 =?gb2312?B?T0k4US9UUGlob1A1cEdKc0RzeEZCYk1kdXpFRGw4VndaaUNRaWpORU5HeXFI?=
 =?gb2312?B?ZStKMExNOHluYm5sb3NMVFRocmRsbGJuQmp3THo4UTBTWXpBUzNEYnhicTd3?=
 =?gb2312?Q?IMXgfx0tfSZ2wkk5po=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e5f822-1007-4a1b-b78a-08d8de0b5e24
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2021 06:12:47.7546
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cIs8fhu8m3xwh+P/X+8muLyCleKVN0JzwPr0Xx6z3ipemRF0S9w/rKHJklER/FHip3gagxvG+fjffMhDZ2OrGOf+AcU/HxuTqUMmqVOsZEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3559
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Cgo+X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+t6K8/sjLOiBQZXRl
IFphaXRjZXYgPHphaXRjZXZAcmVkaGF0LmNvbT4KPreiy83KsbzkOiAyMDIxxOoz1MIzyNUgMTM6
MTIKPsrVvP7IyzogWmhhbmcsIFFpYW5nCj6zrcvNOiBHcmVnIEtIOyBsaW51eC11c2JAdmdlci5r
ZXJuZWwub3JnOyB6YWl0Y2V2QHJlZGhhdC5jb20KPtb3zOI6IFJlOiBbUEFUQ0hdIFVTQjogdXNi
bHA6IEFkZCBkZXZpY2Ugc3RhdHVzIGRldGVjdGlvbiBpbiA+dXNibHBfcG9sbCgpCj4KPltQbGVh
c2Ugbm90ZTogVGhpcyBlLW1haWwgaXMgZnJvbSBhbiBFWFRFUk5BTCBlLW1haWwgYWRkcmVzc10K
Pgo+T24gVHVlLCAyIE1hciAyMDIxIDA3OjQxOjA3ICswMDAwCj4iWmhhbmcsIFFpYW5nIiA8UWlh
bmcuWmhhbmdAd2luZHJpdmVyLmNvbT4gd3JvdGU6Cgo+IGFuZCBhbHNvIEkgZmluZCAgc2ltaWxh
ciB1c2FnZSBpbiB1c2IvY2xhc3MvdXNidG1jLmMKCj5TZWVtcyBsaWtlIGEgYnVnIGluZGVlZCwg
YnV0IEkgZG9uJ3QgbGlrZSB0aGUgZXhhbXBsZSBpbiB1c2J0bWMuYy4KPlBsZWFzZSBsZXQgbWUg
a25vdyBpZiB0aGUgZm9sbG93aW5nIGlzIGFjY2VwdGFibGU6CiAKSSBhZ3JlZSB3aXRoIHRoaXMg
Y2hhbmdlIC4KClRoYW5rcwpRaWFuZwoKPgo+Y29tbWl0IDgzNTkxYWM2M2JjNjY2YTQ0ZjI1MGI0
M2FmNmMwZjVhMWUwMDE4NDEKPkF1dGhvcjogUGV0ZSBaYWl0Y2V2IDx6YWl0Y2V2QGtvdG9yaS56
YWl0Y2V2LnVzPgo+RGF0ZTogICBUdWUgTWFyIDIgMjM6MDA6MjggMjAyMSAtMDYwMAo+Cj4gICAg
dXNibHA6IGZpeCBhIGhhbmcgaW4gcG9sbCgpIGlmIGRpc2Nvbm5lY3RlZAo+Cj4gICBBcHBhcmVu
dGx5IGFuIGFwcGxpY2F0aW9uIHRoYXQgb3BlbnMgYSBkZXZpY2UgYW5kIGNhbGxzIHNlbGVjdCgp
Cj4gICAgb24gaXQsIHdpbGwgaGFuZyBpZiB0aGUgZGVjaWNlIGlzIGRpc2Nvbm5lY3RlZC4gSXQn
cyBhIGxpdHRsZQo+ICAgIHN1cnByaXNpbmcgdGhhdCB3ZSBoYWQgdGhpcyBidWcgZm9yIDE1IHll
YXJzLCBidXQgYXBwYXJlbnRseQo+ICAgIG5vYm9keSBldmVyIHVzZXMgc2VsZWN0KCkgd2l0aCBh
IHByaW50ZXI6IG9ubHkgd3JpdGUoKSBhbmQgcmVhZCgpLAo+ICAgIGFuZCB0aG9zZSB3b3JrIGZp
bmUuIFdlbGwsIHlvdSBjYW4gYWxzbyBzZWxlY3QoKSB3aXRoIGEgdGltZW91dC4KPgo+ICAgIFRo
ZSBmaXggaXMgbW9kZWxlZCBhZnRlciBkZXZpby5jLiBBIGZldyBkcml2ZXJzIGNoZWNrIHRoZQo+
ICAgIGNvbmRpdGlvbiBmaXJzdCwgdGhlbiBkbyBub3QgYWRkIHRoZSB3YWl0IHF1ZXVlIGluIGNh
c2UgdGhlCj4gICAgZGV2aWNlIGlzIGRpc2Nvbm5lY3RlZC4gV2UgZG91YnQgdGhhdCdzIGNvbXBs
ZXRlbHkgcmFjZS1mcmVlLgo+ICAgIFNvLCB0aGlzIHBhdGNoIGFkZHMgdGhlIHByb2Nlc3MgZmly
c3QsIHRoZW4gbG9ja3MgcHJvcGVybHkKPiAgICBhbmQgY2hlY2tzIGZvciB0aGUgZGlzY29ubmVj
dC4KPgo+ICAgIFJlcG9ydGVkLWJ5OiBacWlhbmcgPHFpYW5nLnpoYW5nQHdpbmRyaXZlci5jb20+
Cj4gICAgU2lnbmVkLW9mZi1ieTogUGV0ZSBaYWl0Y2V2IDx6YWl0Y2V2QHJlZGhhdC5jb20+Cj4K
PmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9jbGFzcy91c2JscC5jIGIvZHJpdmVycy91c2IvY2xh
c3MvdXNibHAuYwo+aW5kZXggZmQ4NzQwNWFkYmVkLi41NzMzYTAwNjdmNWIgMTAwNjQ0Cj4tLS0g
YS9kcml2ZXJzL3VzYi9jbGFzcy91c2JscC5jCj4rKysgYi9kcml2ZXJzL3VzYi9jbGFzcy91c2Js
cC5jCj5AQCAtNDk0LDE2ICs0OTQsMjQgQEAgc3RhdGljIGludCB1c2JscF9yZWxlYXNlKHN0cnVj
dCBpbm9kZSAqaW5vZGUsID5zdHJ1Y3QgZmlsZSAqZmlsZSkKPi8qIE5vIGtlcm5lbCBsb2NrIC0g
ZmluZSAqLwo+IHN0YXRpYyBfX3BvbGxfdCB1c2JscF9wb2xsKHN0cnVjdCBmaWxlICpmaWxlLCBz
dHJ1Y3QgcG9sbF90YWJsZV9zdHJ1Y3QgPip3YWl0KQo+IHsKPi0gICAgICAgX19wb2xsX3QgcmV0
Owo+KyAgICAgICBzdHJ1Y3QgdXNibHAgKnVzYmxwID0gZmlsZS0+cHJpdmF0ZV9kYXRhOwo+KyAg
ICAgICBfX3BvbGxfdCByZXQgPSAwOwo+ICAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+Cj4t
ICAgICAgIHN0cnVjdCB1c2JscCAqdXNibHAgPSBmaWxlLT5wcml2YXRlX2RhdGE7Cj4gICAgICAg
IC8qIFNob3VsZCB3ZSBjaGVjayBmaWxlLT5mX21vZGUgJiBGTU9ERV9XUklURSBiZWZvcmUgPnBv
bGxfd2FpdCgpPyAqLwo+ICAgICAgICBwb2xsX3dhaXQoZmlsZSwgJnVzYmxwLT5yd2FpdCwgd2Fp
dCk7Cj4gICAgICAgIHBvbGxfd2FpdChmaWxlLCAmdXNibHAtPnd3YWl0LCB3YWl0KTsKPisKPisg
ICAgICAgbXV0ZXhfbG9jaygmdXNibHAtPm11dCk7Cj4rICAgICAgIGlmICghdXNibHAtPnByZXNl
bnQpCj4rICAgICAgICAgICAgICAgcmV0ICE9IEVQT0xMSFVQOwo+KyAgICAgICBtdXRleF91bmxv
Y2soJnVzYmxwLT5tdXQpOwo+Kwo+ICAgICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmdXNibHAtPmxv
Y2ssIGZsYWdzKTsKPi0gICAgICAgcmV0ID0gKCh1c2JscC0+YmlkaXIgJiYgdXNibHAtPnJjb21w
bGV0ZSkgPyBFUE9MTElOICB8ID5FUE9MTFJETk9STSA6IDApIHwKPi0gICAgICAgICAgKCh1c2Js
cC0+bm9fcGFwZXIgfHwgdXNibHAtPndjb21wbGV0ZSkgPyBFUE9MTE9VVCB8ID5FUE9MTFdSTk9S
TSA6IDApOwo+KyAgICAgICBpZiAodXNibHAtPmJpZGlyICYmIHVzYmxwLT5yY29tcGxldGUpCj4r
ICAgICAgICAgICAgICAgcmV0IHw9IEVQT0xMSU4gIHwgRVBPTExSRE5PUk07Cj4rICAgICAgIGlm
ICh1c2JscC0+bm9fcGFwZXIgfHwgdXNibHAtPndjb21wbGV0ZSkKPisgICAgICAgICAgICAgICBy
ZXQgfD0gRVBPTExPVVQgfCBFUE9MTFdSTk9STTsKPiAgICAgICAgc3Bpbl91bmxvY2tfaXJxcmVz
dG9yZSgmdXNibHAtPmxvY2ssIGZsYWdzKTsKPiAgICAgICAgcmV0dXJuIHJldDsKPiB9Cgo=
