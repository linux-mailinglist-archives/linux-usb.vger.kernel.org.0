Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCAF432B709
	for <lists+linux-usb@lfdr.de>; Wed,  3 Mar 2021 12:02:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239760AbhCCKbu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Mar 2021 05:31:50 -0500
Received: from mail-mw2nam12on2064.outbound.protection.outlook.com ([40.107.244.64]:10688
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1356111AbhCCHQA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Mar 2021 02:16:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/ELDKIQ8V1FAOuyuehJ/QBSCRi72JopRZgSdJVJ0VIgHzPRq+M1Wu+VkcBWA3tvn1O67v0rpN+3ESmrZQ0QSisjKnb/ENkipRWKvxqVhSO+9umL/TO1od/tNYgLsf9bvfuCzApsPtpZIZyspvEXXpxs3sJFapfW5qxBB6JzQBVWsdqa8xURPsqJx410Hsai86SNHsjZtEzJrgJbdJ9M1gCa66L0vIMiZjEQt5MKKqUUkfxOs3kdZcII+MngyLpzHrbAJKRt1/KJxsnH/Z9VTsNdzHv8iOunLnetiNuYuqDeewNBg83D2BFV3fA5ayvReij3wsDZ3gP+EqGHYuRAgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRrd4J9tsKw5XlIcpL0RXPzUcvEGliv1R4INP9NODxU=;
 b=P6kj2yWL4maqmzKsddkz7yyNRY6EH92js+Xc8G1XF3PKJriGxduC9e6J7hTVtbIJHXf983H2OZtVznGQczobuEeg2KLaQuJ/u/Vt0id/yTXANIKrZrDtM34KUBtzvnxMbavr5B5IzC2G+xvWjcc5ymOCQlE5/pzubsu7I4EkCHLiq5f2ROwhlzId9OPPz7veraqyWxsBMrW0rjeLYEYwZvhpPgAB0U61d+Qy9qao7GeBThB8U04kR4EbkyaRSF1xhfHizs17AkOhxT41mC6EK7Gk5yyYAMTvPAp5Ea7+h0SilENXZWCQXv4sPTsP+ZEykIzDrAUn89mFHP2OgMK0RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRrd4J9tsKw5XlIcpL0RXPzUcvEGliv1R4INP9NODxU=;
 b=dPH3jFwqgT0D7xRdN7ZZ01cDroUz4otoLoGzNZ0xxf66Sh18jUcc1dFuNC9K9vdKXHGxjVDIziMCz8obxHZoHFBsKjbaoVYw0WOznW+ekIlB7BO5vnZB2zl6H6/P6XEDuciTs4DQ6Eb7CiTCQu33y2BT2It+NM6L2dM955njZ8o=
Received: from BYAPR11MB2632.namprd11.prod.outlook.com (2603:10b6:a02:c4::17)
 by BYAPR11MB3766.namprd11.prod.outlook.com (2603:10b6:a03:b5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Wed, 3 Mar
 2021 07:15:09 +0000
Received: from BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::89a3:42c3:6509:4acd]) by BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::89a3:42c3:6509:4acd%4]) with mapi id 15.20.3890.029; Wed, 3 Mar 2021
 07:15:08 +0000
From:   "Zhang, Qiang" <Qiang.Zhang@windriver.com>
To:     Pete Zaitcev <zaitcev@redhat.com>,
        Greg KH <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: =?gb2312?B?u9i4tDogW1BBVENIXSBVU0I6IHVzYmxwOiBBZGQgZGV2aWNlIHN0YXR1cyBk?=
 =?gb2312?Q?etection_in_usblp=5Fpoll()?=
Thread-Topic: [PATCH] USB: usblp: Add device status detection in usblp_poll()
Thread-Index: AQHXD+vwg4k9Y6Oby0ugeh2qPdrAyapxxYTygAARpNg=
Date:   Wed, 3 Mar 2021 07:15:08 +0000
Message-ID: <BYAPR11MB2632D5B277F40BB273D639CAFF989@BYAPR11MB2632.namprd11.prod.outlook.com>
References: <20210301040300.20834-1-qiang.zhang@windriver.com>
        <YDyfL/yg9QNM4nku@kroah.com>
        <BYAPR11MB263268B5FD6EB3C3B80B63FBFF9A9@BYAPR11MB2632.namprd11.prod.outlook.com>
        <YDymu1AlS+8UjdXG@kroah.com>
        <BYAPR11MB2632AE1A6D78903112F86062FF9A9@BYAPR11MB2632.namprd11.prod.outlook.com>
        <YD3jlIR7UJjXT6Se@kroah.com>
        <BYAPR11MB263258B4BD102A08BF454D82FF999@BYAPR11MB2632.namprd11.prod.outlook.com>,<20210302231254.7a0e32cb@suzdal.zaitcev.lan>,<BYAPR11MB2632C3C64F5B9116E0D074E4FF989@BYAPR11MB2632.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB2632C3C64F5B9116E0D074E4FF989@BYAPR11MB2632.namprd11.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=windriver.com;
x-originating-ip: [60.247.85.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 488198aa-2dff-4848-145e-08d8de14140c
x-ms-traffictypediagnostic: BYAPR11MB3766:
x-microsoft-antispam-prvs: <BYAPR11MB3766FB8BAB5B980BE8F17B2BFF989@BYAPR11MB3766.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xd+PwsCPX14my9jcSiXVoqCFChSGUGPZif09tJruoS0bjdoIplcGdKYn/vsvpkietwHmP8cm5DAJ+GKFJFMm+OlwHkpPl+wn4mKCO0LEzORRLzNqtJTMbJs6HBGQPNYtBowcVNdYtp351b0GhsUI4K2lPYiGH9fPEAiX0bdMlIY4R3x/73fvEyQeU/JJaHiDO5hmfaduU/wm4j3GWGdgmt/xUgOKusTfomx8sKerPaZpVV3pd9BJWzmkKyaC7besTTGc6qB9iD2dxfvxQsm7RjbvagS05gOMZKcC/LS7F3bR62+Rco4ZGUDe7mYywgY/fjvjrXdEt9X/vwuamarCTSxhrRuE4rOQVDfdWLYNn74kZ8BKbMIMluqldZUdxC5tSezp/HbGksj20wC2bSkJfgN7xtSKpBUFzHXjJ2NMn5RqtIhgq1iYHb79l+h+xjVQq4t2LSwUaqhC5HYVc0WhcnngCLFjE24YG0qMW8qEyvV7Oa5HjxYLQYPwV0Q09S2dANC7izrqA5W08qdQiLrH/Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2632.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(39850400004)(396003)(136003)(6506007)(52536014)(316002)(83380400001)(2940100002)(110136005)(478600001)(5660300002)(2906002)(7696005)(224303003)(66476007)(76116006)(66446008)(66946007)(4326008)(55016002)(33656002)(186003)(9686003)(26005)(86362001)(71200400001)(91956017)(8936002)(64756008)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?gb2312?B?a01XUkpDUXNrL0JMc2JlaVpiZE9IbzZMbWtYWmNhQjNGOFQ1UGprK0p4N2t4?=
 =?gb2312?B?Y0haWTY5UFA5ODhmMHIvZ0pBNWJZdElTRWhMQ013Z2J1eFlyUEhtVkVjZWVE?=
 =?gb2312?B?c3ZzVHcydUY0VkJPVVM4NzRiZnNoUVhoamxHQnp1OW1DbSt4UUNwTGJFajVB?=
 =?gb2312?B?UFQyRXAxWGxkNkwrclNyVjI0Ym9iVG5yNTdPRzBPMWJZbW1ZbkhRRGRQTXhG?=
 =?gb2312?B?bzJxMEJkemxPRHB1NW55Q3hPRWxWUktLSDU0dGx2T25rd2VxV2UvMngrN01O?=
 =?gb2312?B?djhqeGVUQ0hldUJod0lKV0pZbDJJRWtsTHBiSkRsRklSNEozTHNXZWtwaUlv?=
 =?gb2312?B?Q3ViZzl1STZNZ0ZaWlFRZnpxekNGTnY0TU9Kb0lrOXgrYStyWW9PaWMxQjgw?=
 =?gb2312?B?VHF4R3pqekY4a2IrRnVud1BaVTdlVElsNHMzRWdjVSs1ODFmOThVYzRDb25a?=
 =?gb2312?B?U1E2NmxDTmlWakFmNi9PZ1F3alE3VDhiKytJWkdPSTJqS05BMkZlWS9YS0ls?=
 =?gb2312?B?TDlKc3I4SFhlQk1qcGNPeTlQVUdBSE1qcEdHRzRXQnhOM2cyWmxVU2tZT0Ji?=
 =?gb2312?B?ODRvSHRXV0h2N01XS3lWRFY2MGJRN1NsVnpGWGRRai9uTnFBbW9aMXNXTXdY?=
 =?gb2312?B?bHdNQ0k3YWwzYXE4TjZPVkVPVmFSYkhvZ0ZOZTF6NFlTdytQMHZkM1duUElv?=
 =?gb2312?B?eXJ6a2w4akNLVnZPVmtZS0xqaHVlRytrOFMxVmZSaU1mSHloOTBGUzk3STZ1?=
 =?gb2312?B?RjRRbldmZm55MUczVTlaL01SSjhVS1EvcDVEank0RWI0emF2U0lYVjlVWGJy?=
 =?gb2312?B?OW1DNWFEVEx2dHNvMFNJK3JoSzdPRTVyTjJ6NmlzMXpvbnVadmFYaGk5cTJF?=
 =?gb2312?B?QjJLV2F4SEIvTlc1SmxVdG14KzhlMUxJRkExUVVJYmovTnJxUktncVdFS0RD?=
 =?gb2312?B?Vi9CZXNIWVJSUThwcSttcVdIZXJGZWFybEp3L2U3WVBoNzJWeXpEVyt6SXdl?=
 =?gb2312?B?cnZBNGpwR2pQNkl5MmVkdkNPaEMxQnFnajBPbmFDZ0s0aWtSUnhETWdsRDFp?=
 =?gb2312?B?eWw1N1FoeGVnS0tGL21PckU1aGk1UWp4SjQ5bEppUkM0RUxMVE1jWWlQRjZi?=
 =?gb2312?B?VytSSTBGbnJGRC9COW1nOHAzZmpMNG95NkNaR01Zd0UrUWh5MVF1eS9aTVln?=
 =?gb2312?B?eEUyUXptQlZ4VS9NY0l2YWs1aGcwMU9vWkNYL3RiMS82enhYTGk2OHFGdkJx?=
 =?gb2312?B?UFlJc0V6NkVPWUhiM2JTcVpZeEFXLytmWFlLU2l2S0JBTzVGeVVNOGVSQzZa?=
 =?gb2312?B?ZkVvb2FEVHg2UEFQcGhlUVF1R3VIcUMvTGV3N3ExZUxEMm9OMzZZUjI5djlM?=
 =?gb2312?B?Wk41dXNtYWlvaXRlOHByNk1aaDlrWFpybkF2ajFLcGRxc2k5VDJpanlKUzRm?=
 =?gb2312?B?SUdyaVJCVC9mMDFQQklIT2N5MDFwbndXaURWVnNwbENqM0ZWd01FQWFLVlJ5?=
 =?gb2312?B?cmd0UzZkdWFqenZONFgwU2JpSEZ6Y21Wd1VQV0szVGJTeEdkN3FyWXZCRTQ4?=
 =?gb2312?B?cXNJSXEwK0hmTmFxdWVUeWtTQkR3RnhPcWhsWUorYTUraU1LMGtCVnZjSnBP?=
 =?gb2312?B?TEc0MUhlUWN0NDFtSVNDUXFsMDIzQWlCWWh0c01JOERjdlphdGlCOFVQNTZB?=
 =?gb2312?B?R2hFb2xFN0VxRTVJTXlaTHo2YmtxQUhCOUNrWDYxcjdlNzBLR0V2emIzZGRh?=
 =?gb2312?Q?g6wdUUIPHBBPJQxPp0=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 488198aa-2dff-4848-145e-08d8de14140c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2021 07:15:08.9113
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lo/E6G/hePRoR6TqxBptbzAy4xIneULdRttCImNisATjqKR2q2lWfN1YJf5GankO87NkWWHSdMsYcaf+U/3qcaFE0UQLDBbC79phzkKFktQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3766
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCreivP7IyzogWmhhbmcs
IFFpYW5nIDxRaWFuZy5aaGFuZ0B3aW5kcml2ZXIuY29tPgq3osvNyrG85DogMjAyMcTqM9TCM8jV
IDE0OjEyCsrVvP7IyzogUGV0ZSBaYWl0Y2V2CrOty806IEdyZWcgS0g7IGxpbnV4LXVzYkB2Z2Vy
Lmtlcm5lbC5vcmcK1vfM4jogu9i4tDogW1BBVENIXSBVU0I6IHVzYmxwOiBBZGQgZGV2aWNlIHN0
YXR1cyBkZXRlY3Rpb24gaW4gdXNibHBfcG9sbCgpCgoKCj5fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj63orz+yMs6IFBldGUgWmFpdGNldiA8emFpdGNldkByZWRoYXQu
Y29tPgo+t6LLzcqxvOQ6IDIwMjHE6jPUwjPI1SAxMzoxMgo+ytW8/sjLOiBaaGFuZywgUWlhbmcK
PrOty806IEdyZWcgS0g7IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7IHphaXRjZXZAcmVkaGF0
LmNvbQo+1vfM4jogUmU6IFtQQVRDSF0gVVNCOiB1c2JscDogQWRkIGRldmljZSBzdGF0dXMgZGV0
ZWN0aW9uIGluID51c2JscF9wb2xsKCkKPgo+W1BsZWFzZSBub3RlOiBUaGlzIGUtbWFpbCBpcyBm
cm9tIGFuIEVYVEVSTkFMIGUtbWFpbCBhZGRyZXNzXQo+Cj5PbiBUdWUsIDIgTWFyIDIwMjEgMDc6
NDE6MDcgKzAwMDAKPiJaaGFuZywgUWlhbmciIDxRaWFuZy5aaGFuZ0B3aW5kcml2ZXIuY29tPiB3
cm90ZToKPgo+IGFuZCBhbHNvIEkgZmluZCAgc2ltaWxhciB1c2FnZSBpbiB1c2IvY2xhc3MvdXNi
dG1jLmMKPgo+U2VlbXMgbGlrZSBhIGJ1ZyBpbmRlZWQsIGJ1dCBJIGRvbid0IGxpa2UgdGhlIGV4
YW1wbGUgaW4gdXNidG1jLmMuCj5QbGVhc2UgbGV0IG1lIGtub3cgaWYgdGhlIGZvbGxvd2luZyBp
cyBhY2NlcHRhYmxlOgo+Cj5JIGFncmVlIHdpdGggdGhpcyBjaGFuZ2UgLgo+Cj5UaGFua3MKPlFp
YW5nCj4KPgo+Y29tbWl0IDgzNTkxYWM2M2JjNjY2YTQ0ZjI1MGI0M2FmNmMwZjVhMWUwMDE4NDEK
PkF1dGhvcjogUGV0ZSBaYWl0Y2V2IDx6YWl0Y2V2QGtvdG9yaS56YWl0Y2V2LnVzPgo+RGF0ZTog
ICBUdWUgTWFyIDIgMjM6MDA6MjggMjAyMSAtMDYwMAo+Cj4gICAgdXNibHA6IGZpeCBhIGhhbmcg
aW4gcG9sbCgpIGlmIGRpc2Nvbm5lY3RlZAo+Cj4gICBBcHBhcmVudGx5IGFuIGFwcGxpY2F0aW9u
IHRoYXQgb3BlbnMgYSBkZXZpY2UgYW5kIGNhbGxzIHNlbGVjdCgpCj4gICAgb24gaXQsIHdpbGwg
aGFuZyBpZiB0aGUgZGVjaWNlIGlzIGRpc2Nvbm5lY3RlZC4gSXQncyBhIGxpdHRsZQo+ICAgIHN1
cnByaXNpbmcgdGhhdCB3ZSBoYWQgdGhpcyBidWcgZm9yIDE1IHllYXJzLCBidXQgYXBwYXJlbnRs
eQo+ICAgIG5vYm9keSBldmVyIHVzZXMgc2VsZWN0KCkgd2l0aCBhIHByaW50ZXI6IG9ubHkgd3Jp
dGUoKSBhbmQgcmVhZCgpLAo+ICAgIGFuZCB0aG9zZSB3b3JrIGZpbmUuIFdlbGwsIHlvdSBjYW4g
YWxzbyBzZWxlY3QoKSB3aXRoIGEgdGltZW91dC4KPgo+ICAgIFRoZSBmaXggaXMgbW9kZWxlZCBh
ZnRlciBkZXZpby5jLiBBIGZldyBkcml2ZXJzIGNoZWNrIHRoZQo+ICAgIGNvbmRpdGlvbiBmaXJz
dCwgdGhlbiBkbyBub3QgYWRkIHRoZSB3YWl0IHF1ZXVlIGluIGNhc2UgdGhlCj4gICAgZGV2aWNl
IGlzIGRpc2Nvbm5lY3RlZC4gV2UgZG91YnQgdGhhdCdzIGNvbXBsZXRlbHkgcmFjZS1mcmVlLgo+
ICAgIFNvLCB0aGlzIHBhdGNoIGFkZHMgdGhlIHByb2Nlc3MgZmlyc3QsIHRoZW4gbG9ja3MgcHJv
cGVybHkKPiAgICBhbmQgY2hlY2tzIGZvciB0aGUgZGlzY29ubmVjdC4KPgo+ICAgIFJlcG9ydGVk
LWJ5OiBacWlhbmcgPHFpYW5nLnpoYW5nQHdpbmRyaXZlci5jb20+Cj4gICAgU2lnbmVkLW9mZi1i
eTogUGV0ZSBaYWl0Y2V2IDx6YWl0Y2V2QHJlZGhhdC5jb20+Cj4KPmRpZmYgLS1naXQgYS9kcml2
ZXJzL3VzYi9jbGFzcy91c2JscC5jIGIvZHJpdmVycy91c2IvY2xhc3MvdXNibHAuYwo+aW5kZXgg
ZmQ4NzQwNWFkYmVkLi41NzMzYTAwNjdmNWIgMTAwNjQ0Cj4tLS0gYS9kcml2ZXJzL3VzYi9jbGFz
cy91c2JscC5jCj4rKysgYi9kcml2ZXJzL3VzYi9jbGFzcy91c2JscC5jCj5AQCAtNDk0LDE2ICs0
OTQsMjQgQEAgc3RhdGljIGludCB1c2JscF9yZWxlYXNlKHN0cnVjdCBpbm9kZSAqaW5vZGUsID5z
dHJ1Y3QgZmlsZSAqZmlsZSkKPi8qIE5vIGtlcm5lbCBsb2NrIC0gZmluZSAqLwo+IHN0YXRpYyBf
X3BvbGxfdCB1c2JscF9wb2xsKHN0cnVjdCBmaWxlICpmaWxlLCBzdHJ1Y3QgcG9sbF90YWJsZV9z
dHJ1Y3QgPip3YWl0KQo+IHsKPi0gICAgICAgX19wb2xsX3QgcmV0Owo+KyAgICAgICBzdHJ1Y3Qg
dXNibHAgKnVzYmxwID0gZmlsZS0+cHJpdmF0ZV9kYXRhOwo+KyAgICAgICBfX3BvbGxfdCByZXQg
PSAwOwo+ICAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+Cj4tICAgICAgIHN0cnVjdCB1c2Js
cCAqdXNibHAgPSBmaWxlLT5wcml2YXRlX2RhdGE7Cj4gICAgICAgIC8qIFNob3VsZCB3ZSBjaGVj
ayBmaWxlLT5mX21vZGUgJiBGTU9ERV9XUklURSBiZWZvcmUgPnBvbGxfd2FpdCgpPyAqLwo+ICAg
ICAgICBwb2xsX3dhaXQoZmlsZSwgJnVzYmxwLT5yd2FpdCwgd2FpdCk7Cj4gICAgICAgIHBvbGxf
d2FpdChmaWxlLCAmdXNibHAtPnd3YWl0LCB3YWl0KTsKPisKPisgICAgICAgbXV0ZXhfbG9jaygm
dXNibHAtPm11dCk7Cj4rICAgICAgIGlmICghdXNibHAtPnByZXNlbnQpCj4rICAgICAgICAgICAg
ICAgcmV0ICE9IEVQT0xMSFVQOwoKClNob3VsZCBpdCBiZSAgcmV0IHw9IEVQT0xMSFVQOyAgClJl
dmlld2VkLWJ5OiBacWlhbmcgPHFpYW5nLnpoYW5nQHdpbmRyaXZlci5jb20+CgpUaGFua3MKUWlh
bmcKCj4rICAgICAgIG11dGV4X3VubG9jaygmdXNibHAtPm11dCk7Cj4rCj4gICAgICAgIHNwaW5f
bG9ja19pcnFzYXZlKCZ1c2JscC0+bG9jaywgZmxhZ3MpOwo+LSAgICAgICByZXQgPSAoKHVzYmxw
LT5iaWRpciAmJiB1c2JscC0+cmNvbXBsZXRlKSA/IEVQT0xMSU4gIHwgPkVQT0xMUkROT1JNIDog
MCkgfAo+LSAgICAgICAgICAoKHVzYmxwLT5ub19wYXBlciB8fCB1c2JscC0+d2NvbXBsZXRlKSA/
IEVQT0xMT1VUIHwgPkVQT0xMV1JOT1JNIDogMCk7Cj4rICAgICAgIGlmICh1c2JscC0+YmlkaXIg
JiYgdXNibHAtPnJjb21wbGV0ZSkKPisgICAgICAgICAgICAgICByZXQgfD0gRVBPTExJTiAgfCBF
UE9MTFJETk9STTsKPisgICAgICAgaWYgKHVzYmxwLT5ub19wYXBlciB8fCB1c2JscC0+d2NvbXBs
ZXRlKQo+KyAgICAgICAgICAgICAgIHJldCB8PSBFUE9MTE9VVCB8IEVQT0xMV1JOT1JNOwo+ICAg
ICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZ1c2JscC0+bG9jaywgZmxhZ3MpOwo+ICAgICAg
ICByZXR1cm4gcmV0Owo+IH0KCg==
