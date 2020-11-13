Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7786B2B1742
	for <lists+linux-usb@lfdr.de>; Fri, 13 Nov 2020 09:35:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgKMIfe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Nov 2020 03:35:34 -0500
Received: from mail-dm6nam12on2080.outbound.protection.outlook.com ([40.107.243.80]:12608
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725866AbgKMIfe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 13 Nov 2020 03:35:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=htbfBbUAEyzL83nwTDK0m5dI33uaJd88ADrjaN7RzU98ATCnce3dJ5RYzkO44HbxttcmLeZX7A16zhHkbBS6scXHmLSeN8rtyFxPh0mK2bHmpsFPaGbr7yOEwLnSXRi0wX37J8IsCRa6MjV7iL915oIstiB71b6W2NjxB+gklY4lzkfbX6/t2dJ8bsN4UklnG3rEEmQ6kdqNd/a44eyJkTkfuMttG981eavB+fx8w4kc/jQsf1bzKnKmbDDI8Gfz+5WqxmepDPkxkdiUOE8QLtKfFFx30B6dXb1brQ6ZnCOB687sLZ/chb8XqL4KnjU6Eg5pMcMLmirXjCGJOPIoMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLAfUPM/cS9Bvqo2MHPhGizg8UerbrdAoU0X8urfJbQ=;
 b=XBKdZH7kJFjIuzHe7t/KoAAYT0S3b4s8SQwuN/NcBkO69nttqHIOsjlQnYywsLwYvCmEl4UT7yfOuHwWsAIEVC5dWnCZXsGHlBCWu4z1wYMW53wADI3oXFWSi7fJZ9SnJ2SAx1N1DeCuQl0lV3pbYx7hG/fIbM7IYcEx+YUOiTdHPOkISdFZ9ng2o7VKT+9QHABrKMYQnnMe1iK2klrL7BR1Gz+kdOxbxtpnJc/tjBvAnlgiI0WWG9+S/L+RQWQ0zaR0QIn0TfriVSIDnxX1ehb3hTQrcYAAsz22jbv5CurfxzI5fnUHw16qDpj1yEcEmd5pS8gybJleQjNyk7DRjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLAfUPM/cS9Bvqo2MHPhGizg8UerbrdAoU0X8urfJbQ=;
 b=d4Ggxp7JyGIJ8MhzZ3QDKow0aZHExdG2ciaEkrpVHEHU3MjoZUOkFYgba6+qcsSRszS0BGwnQuTc7sut+OTo2Qb3DP2rmuYX7n+s+8dy62VWj0a6Z8gRRI/d95mcKPBcovUv9zMKhcv7JPIeaQDTbmKOY+FDuNqyl8z2Dt/CSKo=
Received: from BYAPR11MB2632.namprd11.prod.outlook.com (2603:10b6:a02:c4::17)
 by SJ0PR11MB4928.namprd11.prod.outlook.com (2603:10b6:a03:2d2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.23; Fri, 13 Nov
 2020 08:35:30 +0000
Received: from BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::dc7e:c582:20a1:5bc7]) by BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::dc7e:c582:20a1:5bc7%6]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 08:35:29 +0000
From:   "Zhang, Qiang" <Qiang.Zhang@windriver.com>
To:     syzbot <syzbot+47b26cd837ececfc666d@syzkaller.appspotmail.com>,
        "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "syzkaller-bugs@googlegroups.com" <syzkaller-bugs@googlegroups.com>
Subject: =?gb2312?B?u9i4tDogbWVtb3J5IGxlYWsgaW4gX191c2JoaWRfc3VibWl0X3JlcG9ydA==?=
Thread-Topic: memory leak in __usbhid_submit_report
Thread-Index: AQHWuDJUzxiIra3U80escrZ/LIy//KnFvfz2
Date:   Fri, 13 Nov 2020 08:35:29 +0000
Message-ID: <BYAPR11MB263293B55BE486163D125AEEFFE60@BYAPR11MB2632.namprd11.prod.outlook.com>
References: <000000000000c99ca505b3d525fb@google.com>
In-Reply-To: <000000000000c99ca505b3d525fb@google.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: syzkaller.appspotmail.com; dkim=none (message not
 signed) header.d=none;syzkaller.appspotmail.com; dmarc=none action=none
 header.from=windriver.com;
x-originating-ip: [60.247.85.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8408f1ac-464d-48d1-ca5c-08d887af1402
x-ms-traffictypediagnostic: SJ0PR11MB4928:
x-microsoft-antispam-prvs: <SJ0PR11MB49285AE6FF38A6A94E10CFAEFFE60@SJ0PR11MB4928.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uDx3atmLJUFj+SChyAnP3EYn3EsKy3+SvJPzoPGDtP3rtz7wKeo3+P2c3sktRXbasoXCIwxDdceHDGoL8RbzPwb5GYQkUR6lTvgNQ2cztNGmMihCbiJXGMxXNUIHN4QIid70Y1Zwu2QGgvSGehXlPX6T8l3iiHa8Mf9TeuCCEnHulQRpFwM8BSFA+qwEhCnfT2Fd8Xmpm2PXjy/xuhMFQ4QCKYeWUqDuHPUkbv9/foBUkAhQjsjL3NetwRRPDp69pe1FfVNaRlFs62FsWBSP8+iwfgg3RPhUsLQIUXEshdzZwrMzLZ8CKZIbg4rx5kBEl7gGqfPwHkWZh5epj+D9kBNIL6xY7KQmzLYnqsFcuryNpMv42rZDXib8i4U4c9JNPOa9xpdE0mPdSiw1OTc8MtOPuE/sNJAXbQ3QyLZOUZ+NHTF8htkmODds+V/Xu8XRLJ+4cxk8lHc+5lVa/4Go2x1aGx23tsXeibt7lAFODD8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2632.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(366004)(376002)(346002)(136003)(26005)(71200400001)(9686003)(186003)(64756008)(478600001)(966005)(55016002)(6506007)(52536014)(66446008)(66946007)(83380400001)(224303003)(7696005)(8936002)(2906002)(91956017)(76116006)(66556008)(5660300002)(33656002)(316002)(110136005)(66476007)(86362001)(99710200001)(505234006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: FsQWB3GE3s8rSceSt+yBht2pTuCUOvLjAezr5COglJOGwOrlP014w5YGMBt5aRsh6hwgnQwF16KCEVYp+rhAY2D0xB/6nQAC4NXLnDSKOVzrxcWrXEHKSgtZfv0ylhiZpYkR7+gp9uIzAAAcJo5DWOWl4fgQiqlgj07o2IiM0RGkd3Tyirsoa5+w8EGtaMu9+n9dJ8rIMLnGzVG+L0nWoxXfGT3U+ywq3Z1EVmjUWa65pOwztaooJPID4uqdDpOFO4+eYP+XoaVjc7IDdCLvxOW509tikWC6v/MGSg8kyF7WUvwCKRzLx8OydDrovd+MWow5XuF0yoXeAZQFnQ/bTKkEpiwrZizxrHfhm/4mhvZIYK7Uf7eswedgNUazDW3e57m1JXSO0RxrSllu1JxlmQ3vymHuInU6HUtFPvN7qc1QJG3jnlq5vaDs+HXwuFHUNDMCJ1EtigUsHGhF7eMXe3+AxxZnIFnwP/bvF5VGGHAWT1nnng3ZZhpRXiIj97H20bmi8sQvo++s/IxWKMpd2U6XH4pkFthbdkGRpkY0F9sDG4YaorqcSg8SsqiaRLqOjI4R5D4hOEndoTU84Zc9MfTz0ZcGKzg8nZWz3camPb1bv51W+kDSpojoluQARy+cEXCvpqInwtQ+mD2aWtrfGQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8408f1ac-464d-48d1-ca5c-08d887af1402
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 08:35:29.5170
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D0kDpq2Le2tV96zmqNJur/z8Sf4Jwxic1mNvTTAajjx40zcohiWlXNdsD6Asl98YBGmN+PbrCj2S4X4JVKwe400goT/UJkoDyxHxzTTRaSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4928
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCreivP7Iyzogc3l6Ym90
IDxzeXpib3QrNDdiMjZjZDgzN2VjZWNmYzY2NmRAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbT4K
t6LLzcqxvOQ6IDIwMjDE6jEx1MIxMcjVIDIxOjU1CsrVvP7IyzogYmVuamFtaW4udGlzc29pcmVz
QHJlZGhhdC5jb207IGppa29zQGtlcm5lbC5vcmc7IGxpbnV4LWlucHV0QHZnZXIua2VybmVsLm9y
ZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtdXNiQHZnZXIua2VybmVsLm9y
Zzsgc3l6a2FsbGVyLWJ1Z3NAZ29vZ2xlZ3JvdXBzLmNvbQrW98ziOiBtZW1vcnkgbGVhayBpbiBf
X3VzYmhpZF9zdWJtaXRfcmVwb3J0CgpbUGxlYXNlIG5vdGUgdGhpcyBlLW1haWwgaXMgZnJvbSBh
biBFWFRFUk5BTCBlLW1haWwgYWRkcmVzc10KCkhlbGxvLAoKc3l6Ym90IGZvdW5kIHRoZSBmb2xs
b3dpbmcgaXNzdWUgb246CgpIRUFEIGNvbW1pdDogICAgZjgzOTRmMjMgTGludXggNS4xMC1yYzMK
Z2l0IHRyZWU6ICAgICAgIHVwc3RyZWFtCmNvbnNvbGUgb3V0cHV0OiBodHRwczovL3N5emthbGxl
ci5hcHBzcG90LmNvbS94L2xvZy50eHQ/eD0xMmViYmRjNjUwMDAwMAprZXJuZWwgY29uZmlnOiAg
aHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC8uY29uZmlnP3g9YTNmMTM3MTZmYTAyMTJm
ZApkYXNoYm9hcmQgbGluazogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2V4dGlk
PTQ3YjI2Y2Q4MzdlY2VjZmM2NjZkCmNvbXBpbGVyOiAgICAgICBnY2MgKEdDQykgMTAuMS4wLXN5
eiAyMDIwMDUwNwpzeXogcmVwcm86ICAgICAgaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20v
eC9yZXByby5zeXo/eD0xNDQ5N2I4MjUwMDAwMApDIHJlcHJvZHVjZXI6ICAgaHR0cHM6Ly9zeXpr
YWxsZXIuYXBwc3BvdC5jb20veC9yZXByby5jP3g9MTU4NmZmMTQ1MDAwMDAKCklNUE9SVEFOVDog
aWYgeW91IGZpeCB0aGUgaXNzdWUsIHBsZWFzZSBhZGQgdGhlIGZvbGxvd2luZyB0YWcgdG8gdGhl
IGNvbW1pdDoKUmVwb3J0ZWQtYnk6IHN5emJvdCs0N2IyNmNkODM3ZWNlY2ZjNjY2ZEBzeXprYWxs
ZXIuYXBwc3BvdG1haWwuY29tCgpCVUc6IG1lbW9yeSBsZWFrCnVucmVmZXJlbmNlZCBvYmplY3Qg
MHhmZmZmODg4MTA5N2U1ZWMwIChzaXplIDMyKToKICBjb21tICJrd29ya2VyLzA6MSIsIHBpZCA3
LCBqaWZmaWVzIDQyOTQ5NDkyMTQgKGFnZSAzMy41MjBzKQogIGhleCBkdW1wIChmaXJzdCAzMiBi
eXRlcyk6CiAgICAwNCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAw
MCAgLi4uLi4uLi4uLi4uLi4uLgogICAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgMDAgMDAgMDAgMDAgIC4uLi4uLi4uLi4uLi4uLi4KICBiYWNrdHJhY2U6CiAgICBbPDAwMDAw
MDAwODI5NmVhYTE+XSBfX3VzYmhpZF9zdWJtaXRfcmVwb3J0KzB4MTE2LzB4NDkwIGRyaXZlcnMv
aGlkL3VzYmhpZC9oaWQtY29yZS5jOjU4OAogICAgWzwwMDAwMDAwMGZlMzlmMDA3Pl0gdXNiaGlk
X3N1Ym1pdF9yZXBvcnQgZHJpdmVycy9oaWQvdXNiaGlkL2hpZC1jb3JlLmM6NjM4IFtpbmxpbmVd
CiAgICBbPDAwMDAwMDAwZmUzOWYwMDc+XSB1c2JoaWRfcmVxdWVzdCsweDU5LzB4YTAgZHJpdmVy
cy9oaWQvdXNiaGlkL2hpZC1jb3JlLmM6MTI3MgogICAgWzwwMDAwMDAwMDQyOGE4NTRiPl0gaGlk
aW5wdXRfbGVkX3dvcmtlcisweDU5LzB4MTYwIGRyaXZlcnMvaGlkL2hpZC1pbnB1dC5jOjE1MDcK
ICAgIFs8MDAwMDAwMDAxYmI4ZDg2ZD5dIHByb2Nlc3Nfb25lX3dvcmsrMHgyN2QvMHg1OTAga2Vy
bmVsL3dvcmtxdWV1ZS5jOjIyNzIKICAgIFs8MDAwMDAwMDA1ZDlhMmY5Yz5dIHdvcmtlcl90aHJl
YWQrMHg1OS8weDVkMCBrZXJuZWwvd29ya3F1ZXVlLmM6MjQxOAogICAgWzwwMDAwMDAwMGRjOTk5
YjI5Pl0ga3RocmVhZCsweDE3OC8weDFiMCBrZXJuZWwva3RocmVhZC5jOjI5MgogICAgWzwwMDAw
MDAwMDk5ZDVhOWVlPl0gcmV0X2Zyb21fZm9yaysweDFmLzB4MzAgYXJjaC94ODYvZW50cnkvZW50
cnlfNjQuUzoyOTYKCgoKICAgV2hlbiB1c2IgZGV2aWNlIGRpc2Nvbm5lY3QgIHRoZSAicmF3X3Jl
cG9ydCIgc2hvdWxkIGJlIGZyZWUgaW4gdXNiaGlkX3N0b3AuCiAgIGNhbiB3ZSByZWxlYXNlIGl0
IGluIHRoaXMgZnVuY3Rpb24sIGFzIHNob3duIGJlbG93OgoKICB1c2JoaWRfc3RvcChzdHJ1Y3Qg
aGlkX2RldmljZSAqaGlkKSB7CiAgICAgICAgICAgIC4uLi4uLi4uCiAgICAgICAgICAgICBmb3Ig
KGluZGV4ID0gMDsgaW5kZXggPCBISURfQ09OVFJPTF9GSUZPX1NJWkU7IGluZGV4KyspIHsKICAg
ICAgICAgICAgICAgICAgICAgICAgICBpZiAodXNiaGlkLT5jdHJsW2luZGV4XS5yYXdfcmVwb3J0
KQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGtmcmVlKHVzYmhpZC0+Y3RybFtp
bmRleF0ucmF3X3JlcG9ydCk7CiAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHVzYmhpZC0+
b3V0W2luZGV4XS5yYXdfcmVwb3J0KQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGtmcmVlKHVzYmhpZC0+b3V0W2luZGV4XS5yYXdfcmVwb3J0KTsKICAgICAgICAgICAgICB9Ci4u
Li4uLi4uLi4uLi4uLgp9CgoKCgpCVUc6IG1lbW9yeSBsZWFrCnVucmVmZXJlbmNlZCBvYmplY3Qg
MHhmZmZmODg4MTEyMDIwMGMwIChzaXplIDMyKToKICBjb21tICJrd29ya2VyLzA6MSIsIHBpZCA3
LCBqaWZmaWVzIDQyOTQ5NDkyMTQgKGFnZSAzMy41MjBzKQogIGhleCBkdW1wIChmaXJzdCAzMiBi
eXRlcyk6CiAgICAwNCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAw
MCAgLi4uLi4uLi4uLi4uLi4uLgogICAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgMDAgMDAgMDAgMDAgIC4uLi4uLi4uLi4uLi4uLi4KICBiYWNrdHJhY2U6CiAgICBbPDAwMDAw
MDAwODI5NmVhYTE+XSBfX3VzYmhpZF9zdWJtaXRfcmVwb3J0KzB4MTE2LzB4NDkwIGRyaXZlcnMv
aGlkL3VzYmhpZC9oaWQtY29yZS5jOjU4OAogICAgWzwwMDAwMDAwMGZlMzlmMDA3Pl0gdXNiaGlk
X3N1Ym1pdF9yZXBvcnQgZHJpdmVycy9oaWQvdXNiaGlkL2hpZC1jb3JlLmM6NjM4IFtpbmxpbmVd
CiAgICBbPDAwMDAwMDAwZmUzOWYwMDc+XSB1c2JoaWRfcmVxdWVzdCsweDU5LzB4YTAgZHJpdmVy
cy9oaWQvdXNiaGlkL2hpZC1jb3JlLmM6MTI3MgogICAgWzwwMDAwMDAwMDQyOGE4NTRiPl0gaGlk
aW5wdXRfbGVkX3dvcmtlcisweDU5LzB4MTYwIGRyaXZlcnMvaGlkL2hpZC1pbnB1dC5jOjE1MDcK
ICAgIFs8MDAwMDAwMDAxYmI4ZDg2ZD5dIHByb2Nlc3Nfb25lX3dvcmsrMHgyN2QvMHg1OTAga2Vy
bmVsL3dvcmtxdWV1ZS5jOjIyNzIKICAgIFs8MDAwMDAwMDA1ZDlhMmY5Yz5dIHdvcmtlcl90aHJl
YWQrMHg1OS8weDVkMCBrZXJuZWwvd29ya3F1ZXVlLmM6MjQxOAogICAgWzwwMDAwMDAwMGRjOTk5
YjI5Pl0ga3RocmVhZCsweDE3OC8weDFiMCBrZXJuZWwva3RocmVhZC5jOjI5MgogICAgWzwwMDAw
MDAwMDk5ZDVhOWVlPl0gcmV0X2Zyb21fZm9yaysweDFmLzB4MzAgYXJjaC94ODYvZW50cnkvZW50
cnlfNjQuUzoyOTYKCkJVRzogbWVtb3J5IGxlYWsKdW5yZWZlcmVuY2VkIG9iamVjdCAweGZmZmY4
ODgxMDdmYTk0MjAgKHNpemUgMzIpOgogIGNvbW0gImt3b3JrZXIvMDoxIiwgcGlkIDcsIGppZmZp
ZXMgNDI5NDk0OTIxNCAoYWdlIDMzLjUyMHMpCiAgaGV4IGR1bXAgKGZpcnN0IDMyIGJ5dGVzKToK
ICAgIDA0IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAuLi4u
Li4uLi4uLi4uLi4uCiAgICAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAw
MCAwMCAwMCAgLi4uLi4uLi4uLi4uLi4uLgogIGJhY2t0cmFjZToKICAgIFs8MDAwMDAwMDA4Mjk2
ZWFhMT5dIF9fdXNiaGlkX3N1Ym1pdF9yZXBvcnQrMHgxMTYvMHg0OTAgZHJpdmVycy9oaWQvdXNi
aGlkL2hpZC1jb3JlLmM6NTg4CiAgICBbPDAwMDAwMDAwZmUzOWYwMDc+XSB1c2JoaWRfc3VibWl0
X3JlcG9ydCBkcml2ZXJzL2hpZC91c2JoaWQvaGlkLWNvcmUuYzo2MzggW2lubGluZV0KICAgIFs8
MDAwMDAwMDBmZTM5ZjAwNz5dIHVzYmhpZF9yZXF1ZXN0KzB4NTkvMHhhMCBkcml2ZXJzL2hpZC91
c2JoaWQvaGlkLWNvcmUuYzoxMjcyCiAgICBbPDAwMDAwMDAwNDI4YTg1NGI+XSBoaWRpbnB1dF9s
ZWRfd29ya2VyKzB4NTkvMHgxNjAgZHJpdmVycy9oaWQvaGlkLWlucHV0LmM6MTUwNwogICAgWzww
MDAwMDAwMDFiYjhkODZkPl0gcHJvY2Vzc19vbmVfd29yaysweDI3ZC8weDU5MCBrZXJuZWwvd29y
a3F1ZXVlLmM6MjI3MgogICAgWzwwMDAwMDAwMDVkOWEyZjljPl0gd29ya2VyX3RocmVhZCsweDU5
LzB4NWQwIGtlcm5lbC93b3JrcXVldWUuYzoyNDE4CiAgICBbPDAwMDAwMDAwZGM5OTliMjk+XSBr
dGhyZWFkKzB4MTc4LzB4MWIwIGtlcm5lbC9rdGhyZWFkLmM6MjkyCiAgICBbPDAwMDAwMDAwOTlk
NWE5ZWU+XSByZXRfZnJvbV9mb3JrKzB4MWYvMHgzMCBhcmNoL3g4Ni9lbnRyeS9lbnRyeV82NC5T
OjI5NgoKQlVHOiBtZW1vcnkgbGVhawp1bnJlZmVyZW5jZWQgb2JqZWN0IDB4ZmZmZjg4ODExMjAy
MGI2MCAoc2l6ZSAzMik6CiAgY29tbSAia3dvcmtlci8xOjQiLCBwaWQgODU2OSwgamlmZmllcyA0
Mjk0OTQ5MjM3IChhZ2UgMzMuMjkwcykKICBoZXggZHVtcCAoZmlyc3QgMzIgYnl0ZXMpOgogICAg
MDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIC4uLi4uLi4u
Li4uLi4uLi4KICAgIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwICAuLi4uLi4uLi4uLi4uLi4uCiAgYmFja3RyYWNlOgogICAgWzwwMDAwMDAwMDgyOTZlYWEx
Pl0gX191c2JoaWRfc3VibWl0X3JlcG9ydCsweDExNi8weDQ5MCBkcml2ZXJzL2hpZC91c2JoaWQv
aGlkLWNvcmUuYzo1ODgKICAgIFs8MDAwMDAwMDBmZTM5ZjAwNz5dIHVzYmhpZF9zdWJtaXRfcmVw
b3J0IGRyaXZlcnMvaGlkL3VzYmhpZC9oaWQtY29yZS5jOjYzOCBbaW5saW5lXQogICAgWzwwMDAw
MDAwMGZlMzlmMDA3Pl0gdXNiaGlkX3JlcXVlc3QrMHg1OS8weGEwIGRyaXZlcnMvaGlkL3VzYmhp
ZC9oaWQtY29yZS5jOjEyNzIKICAgIFs8MDAwMDAwMDA0MjhhODU0Yj5dIGhpZGlucHV0X2xlZF93
b3JrZXIrMHg1OS8weDE2MCBkcml2ZXJzL2hpZC9oaWQtaW5wdXQuYzoxNTA3CiAgICBbPDAwMDAw
MDAwMWJiOGQ4NmQ+XSBwcm9jZXNzX29uZV93b3JrKzB4MjdkLzB4NTkwIGtlcm5lbC93b3JrcXVl
dWUuYzoyMjcyCiAgICBbPDAwMDAwMDAwNWQ5YTJmOWM+XSB3b3JrZXJfdGhyZWFkKzB4NTkvMHg1
ZDAga2VybmVsL3dvcmtxdWV1ZS5jOjI0MTgKICAgIFs8MDAwMDAwMDBkYzk5OWIyOT5dIGt0aHJl
YWQrMHgxNzgvMHgxYjAga2VybmVsL2t0aHJlYWQuYzoyOTIKICAgIFs8MDAwMDAwMDA5OWQ1YTll
ZT5dIHJldF9mcm9tX2ZvcmsrMHgxZi8weDMwIGFyY2gveDg2L2VudHJ5L2VudHJ5XzY0LlM6Mjk2
CgpCVUc6IG1lbW9yeSBsZWFrCnVucmVmZXJlbmNlZCBvYmplY3QgMHhmZmZmODg4MTA3ZmE5YTIw
IChzaXplIDMyKToKICBjb21tICJrd29ya2VyLzE6MyIsIHBpZCA4NTU5LCBqaWZmaWVzIDQyOTQ5
NDkyNDEgKGFnZSAzMy4yNTBzKQogIGhleCBkdW1wIChmaXJzdCAzMiBieXRlcyk6CiAgICAwNCAw
MCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAgLi4uLi4uLi4uLi4u
Li4uLgogICAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAg
IC4uLi4uLi4uLi4uLi4uLi4KICBiYWNrdHJhY2U6CiAgICBbPDAwMDAwMDAwODI5NmVhYTE+XSBf
X3VzYmhpZF9zdWJtaXRfcmVwb3J0KzB4MTE2LzB4NDkwIGRyaXZlcnMvaGlkL3VzYmhpZC9oaWQt
Y29yZS5jOjU4OAogICAgWzwwMDAwMDAwMGZlMzlmMDA3Pl0gdXNiaGlkX3N1Ym1pdF9yZXBvcnQg
ZHJpdmVycy9oaWQvdXNiaGlkL2hpZC1jb3JlLmM6NjM4IFtpbmxpbmVdCiAgICBbPDAwMDAwMDAw
ZmUzOWYwMDc+XSB1c2JoaWRfcmVxdWVzdCsweDU5LzB4YTAgZHJpdmVycy9oaWQvdXNiaGlkL2hp
ZC1jb3JlLmM6MTI3MgogICAgWzwwMDAwMDAwMDQyOGE4NTRiPl0gaGlkaW5wdXRfbGVkX3dvcmtl
cisweDU5LzB4MTYwIGRyaXZlcnMvaGlkL2hpZC1pbnB1dC5jOjE1MDcKICAgIFs8MDAwMDAwMDAx
YmI4ZDg2ZD5dIHByb2Nlc3Nfb25lX3dvcmsrMHgyN2QvMHg1OTAga2VybmVsL3dvcmtxdWV1ZS5j
OjIyNzIKICAgIFs8MDAwMDAwMDA1ZDlhMmY5Yz5dIHdvcmtlcl90aHJlYWQrMHg1OS8weDVkMCBr
ZXJuZWwvd29ya3F1ZXVlLmM6MjQxOAogICAgWzwwMDAwMDAwMGRjOTk5YjI5Pl0ga3RocmVhZCsw
eDE3OC8weDFiMCBrZXJuZWwva3RocmVhZC5jOjI5MgogICAgWzwwMDAwMDAwMDk5ZDVhOWVlPl0g
cmV0X2Zyb21fZm9yaysweDFmLzB4MzAgYXJjaC94ODYvZW50cnkvZW50cnlfNjQuUzoyOTYKCkJV
RzogbWVtb3J5IGxlYWsKdW5yZWZlcmVuY2VkIG9iamVjdCAweGZmZmY4ODgxMTIwMjA5NDAgKHNp
emUgMzIpOgogIGNvbW0gImt3b3JrZXIvMTozIiwgcGlkIDg1NTksIGppZmZpZXMgNDI5NDk0OTI0
MSAoYWdlIDMzLjI1MHMpCiAgaGV4IGR1bXAgKGZpcnN0IDMyIGJ5dGVzKToKICAgIDA0IDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAuLi4uLi4uLi4uLi4uLi4u
CiAgICAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAgLi4u
Li4uLi4uLi4uLi4uLgogIGJhY2t0cmFjZToKICAgIFs8MDAwMDAwMDA4Mjk2ZWFhMT5dIF9fdXNi
aGlkX3N1Ym1pdF9yZXBvcnQrMHgxMTYvMHg0OTAgZHJpdmVycy9oaWQvdXNiaGlkL2hpZC1jb3Jl
LmM6NTg4CiAgICBbPDAwMDAwMDAwZmUzOWYwMDc+XSB1c2JoaWRfc3VibWl0X3JlcG9ydCBkcml2
ZXJzL2hpZC91c2JoaWQvaGlkLWNvcmUuYzo2MzggW2lubGluZV0KICAgIFs8MDAwMDAwMDBmZTM5
ZjAwNz5dIHVzYmhpZF9yZXF1ZXN0KzB4NTkvMHhhMCBkcml2ZXJzL2hpZC91c2JoaWQvaGlkLWNv
cmUuYzoxMjcyCiAgICBbPDAwMDAwMDAwNDI4YTg1NGI+XSBoaWRpbnB1dF9sZWRfd29ya2VyKzB4
NTkvMHgxNjAgZHJpdmVycy9oaWQvaGlkLWlucHV0LmM6MTUwNwogICAgWzwwMDAwMDAwMDFiYjhk
ODZkPl0gcHJvY2Vzc19vbmVfd29yaysweDI3ZC8weDU5MCBrZXJuZWwvd29ya3F1ZXVlLmM6MjI3
MgogICAgWzwwMDAwMDAwMDVkOWEyZjljPl0gd29ya2VyX3RocmVhZCsweDU5LzB4NWQwIGtlcm5l
bC93b3JrcXVldWUuYzoyNDE4CiAgICBbPDAwMDAwMDAwZGM5OTliMjk+XSBrdGhyZWFkKzB4MTc4
LzB4MWIwIGtlcm5lbC9rdGhyZWFkLmM6MjkyCiAgICBbPDAwMDAwMDAwOTlkNWE5ZWU+XSByZXRf
ZnJvbV9mb3JrKzB4MWYvMHgzMCBhcmNoL3g4Ni9lbnRyeS9lbnRyeV82NC5TOjI5NgoKZXhlY3V0
aW5nIHByb2dyYW0KZXhlY3V0aW5nIHByb2dyYW0KZXhlY3V0aW5nIHByb2dyYW0KZXhlY3V0aW5n
IHByb2dyYW0KZXhlY3V0aW5nIHByb2dyYW0KZXhlY3V0aW5nIHByb2dyYW0KZXhlY3V0aW5nIHBy
b2dyYW0KCgotLS0KVGhpcyByZXBvcnQgaXMgZ2VuZXJhdGVkIGJ5IGEgYm90LiBJdCBtYXkgY29u
dGFpbiBlcnJvcnMuClNlZSBodHRwczovL2dvby5nbC90cHNtRUogZm9yIG1vcmUgaW5mb3JtYXRp
b24gYWJvdXQgc3l6Ym90LgpzeXpib3QgZW5naW5lZXJzIGNhbiBiZSByZWFjaGVkIGF0IHN5emth
bGxlckBnb29nbGVncm91cHMuY29tLgoKc3l6Ym90IHdpbGwga2VlcCB0cmFjayBvZiB0aGlzIGlz
c3VlLiBTZWU6Cmh0dHBzOi8vZ29vLmdsL3Rwc21FSiNzdGF0dXMgZm9yIGhvdyB0byBjb21tdW5p
Y2F0ZSB3aXRoIHN5emJvdC4Kc3l6Ym90IGNhbiB0ZXN0IHBhdGNoZXMgZm9yIHRoaXMgaXNzdWUs
IGZvciBkZXRhaWxzIHNlZToKaHR0cHM6Ly9nb28uZ2wvdHBzbUVKI3Rlc3RpbmctcGF0Y2hlcwo=
