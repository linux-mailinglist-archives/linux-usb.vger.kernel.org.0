Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD2BD32792A
	for <lists+linux-usb@lfdr.de>; Mon,  1 Mar 2021 09:27:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232861AbhCAI1Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Mar 2021 03:27:16 -0500
Received: from mail-dm6nam11on2050.outbound.protection.outlook.com ([40.107.223.50]:33363
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232904AbhCAI1L (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Mar 2021 03:27:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOV1DpFBf9Ut7UQg73aE2t5QuM2tVF886PM7qag6qEglsnIwkTGTm+ar14RR3ufg6lITApNFlBbvE+uxW5Jip17k5zrOf3Jq0tastAzrL0+M5OszH6KoYmljyzZl/9I1bWLTpL/uvWX6/E3GsKEt0iKkurLR/jJbjw73t6mI23x+jNzCAhzRmf4Hf3Rd+bL0zKi6hrCUp2OH8mV4vxh5zN0ETSNekuWieCGjH2yQPwMLqav8HEV9NPZqCyRAXmJpvjWIIF+heDIqTdNs5pmofB4pgFWk0Dm92jcIoJ9O1PMykoLKPWqVN0tL51aPNf1wZjOmvHDhCxr5nrAzHCPNxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWj3ZytW3SNH+u9RIkrulfnATMCsNEamgOwmXZy0t7k=;
 b=KI6M+od6aRYLvGL/xBulHrgUB4inl47wnjdIyKHlIj8mmaKd/c7z4qbP9Pt6kn12YctU4a6hpe2pMxukdFM8fP1qFFwfkUEpTW8iS14Lf8Pd1hF1wFT9hqaE8u/VHTGFGZ5yjF65UoSUr3VTwPDpjab0PwRg7cFI1NgBGx74CDYPHknXkCUUBO3yWl+tEmJ7Ttds1wSDHuSrk/MtPKnX51CQcAT1WSFVtMhVFd/o6toULMziB0bEGuYB0lPlZlpAdMR2Z8CELNzz/1JkRtoCi8cyDob2JWsWHkueU9ldPatkSa682PVa3mqpTgdNiNPJ+VIHT7xTmpfwdml4ptbvgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWj3ZytW3SNH+u9RIkrulfnATMCsNEamgOwmXZy0t7k=;
 b=Oov/kAznJUcZjfcjkld8Cj+sinv5buk3DhK3POIOCVdLg0kw//D3pj7elGCs+YanFeTxrNW0VxyH/1s9JZ63rLGjVWnH7mJ4go2quH95VWfEl2pz8qAXT+SW4EJvOVH3RpwwfN+XniH5UJNfIZZHOmY33fOkPgNPvckZT9sWgRI=
Received: from BYAPR11MB2632.namprd11.prod.outlook.com (2603:10b6:a02:c4::17)
 by BYAPR11MB3349.namprd11.prod.outlook.com (2603:10b6:a03:1c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Mon, 1 Mar
 2021 08:26:22 +0000
Received: from BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::89a3:42c3:6509:4acd]) by BYAPR11MB2632.namprd11.prod.outlook.com
 ([fe80::89a3:42c3:6509:4acd%4]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 08:26:22 +0000
From:   "Zhang, Qiang" <Qiang.Zhang@windriver.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "zaitcev@redhat.com" <zaitcev@redhat.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: =?gb2312?B?u9i4tDogW1BBVENIXSBVU0I6IHVzYmxwOiBBZGQgZGV2aWNlIHN0YXR1cyBk?=
 =?gb2312?Q?etection_in_usblp=5Fpoll()?=
Thread-Topic: [PATCH] USB: usblp: Add device status detection in usblp_poll()
Thread-Index: AQHXDk20+BdPbRjrkkqRIs2SLfiV1apuxV6AgAADMfw=
Date:   Mon, 1 Mar 2021 08:26:22 +0000
Message-ID: <BYAPR11MB263268B5FD6EB3C3B80B63FBFF9A9@BYAPR11MB2632.namprd11.prod.outlook.com>
References: <20210301040300.20834-1-qiang.zhang@windriver.com>,<YDyfL/yg9QNM4nku@kroah.com>
In-Reply-To: <YDyfL/yg9QNM4nku@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
x-originating-ip: [106.39.148.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5fc2bbd3-d81a-4329-b913-08d8dc8bb26a
x-ms-traffictypediagnostic: BYAPR11MB3349:
x-microsoft-antispam-prvs: <BYAPR11MB33490C091A919012DAAA5388FF9A9@BYAPR11MB3349.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f8JJfYVj3mj3kOIJ9JV2YPah3+gTdoBMW19fpQWPIcETZZutm5TPJHApPBtsw3ff4J2bVO/YO3/LXK6rad/iVqwvIMeKp6UVf64pT5uwsONhLvdQ0ofxntb9lDIiwXnLBiJ3JzMx1dt1FFjv+M9DDQmvHRgvCZsfC5EjUrQVMqjS6Mfbh5WwKJWjTkRMqshFeHfjF9Lkg5A88fdHclrK3JX/Sr/6CSth3ojKuS5R9sGTk0qmN1EMOQWnjyiohHTl8SdgeJEX+hrB3MB21JmQj31C2srLhEFsqWd3JouI6zR38yMPbOhrthuEKIazBWHwYtYbYdwfD6tMvFD6pJbGEqYtK2tc2V2DAtw7z67efzLM7DN4WO9er+HzvSaOOuXbLoeyHt80C7PNwpnbEgoByoiAQtBHCVB7HY70nXotzcDk5+MjXTPThiPYvz9G90gVt11eyh2wOlxZDXf8NaLZeicRelW1rptqGnHfyJ99xljQmd0edtDD+Q3xsF9L/AAP4Z0eCozH2T+EQdx4MmUW/g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2632.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39840400004)(136003)(366004)(346002)(66946007)(66476007)(66446008)(2906002)(64756008)(83380400001)(55016002)(478600001)(186003)(316002)(71200400001)(66556008)(6506007)(91956017)(52536014)(4744005)(76116006)(5660300002)(6916009)(8936002)(9686003)(224303003)(33656002)(86362001)(7696005)(26005)(54906003)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?gb2312?B?ZVFuVzJuWUtHRy9wSk5UQW9WMk8xejdOdWNYSnR3Z0RJbzMrZGU4NEFjQ2lK?=
 =?gb2312?B?VEFZTmY4TkZoT0tKRlhsNzNUMmZ5V1AzUFNwRnVuZndnTVBRSnpjMWpEeWZO?=
 =?gb2312?B?UEowTEVQVFNYZWdHcHA1OUFnMVRnaEd6NEdsNzdXY2NVWUtuMTgreWdkSnpP?=
 =?gb2312?B?S1ZkZ29aWmdWVWg5WlExVDJYSm1wOGo2dUhLek1KYTU0a2NNS1I0c0xkang2?=
 =?gb2312?B?NDNTQVVIRDc4Y1oyMVlyNEJOZUJncnVZS1BzUjZBYXRKaFRsNnBQNHJIK1dv?=
 =?gb2312?B?eGNpODFBS2lmNjFXSi9LZ2NoSHJxVWVyZG5LMEVzbDE1a2g2MjB2azJkZnN4?=
 =?gb2312?B?aU9heHMzYS9oNmVwSzQ4NlVTSnJQYVYva1pwTGlOeUdQMThLMFViZmgraXUy?=
 =?gb2312?B?a1RTbWl1eDRoK0duVXFVWmlLdzVsNXl6QVozeWtHSEVncmNETzRNZTUreUpv?=
 =?gb2312?B?NjByYmtVQ0JsbTBFRy81STd3ZmppNEhLalk1Y05ycGcyL1F5K1FJdVo0WUYy?=
 =?gb2312?B?VjBkTWxadzZwN0gvTGlVbU5DN0xRRUQ5T0tCTjFpblF5SCt4ak1ZVi9wMXhK?=
 =?gb2312?B?L3hMdW1ubXdGQyt0eWVoTzBSUjA1R2QrK3UvUDBVaXhQKzN1bWlEazJLRGJF?=
 =?gb2312?B?L0xBaHM0ZXpaTVNzRkdlWW9jVlpPZHFab3h4bXNRSVRtcEc4dmJ1V2dtTkoz?=
 =?gb2312?B?clQ3R1U2RHVObU9uM3VoTm1LSmt2MkhzV3oxVlVZU3dPQitqOUI0QUNnSGlD?=
 =?gb2312?B?TXM5K1lOM1kySkI1WGtzYWZtZk1xZ1lMZXpTK24yMER2L213dUVkWFYvS2ho?=
 =?gb2312?B?TFlqejhGOTJBczZJUHpQQUozUW9MeFlXNUdkcjdZYUdRaWhlS3VhU0dFOExi?=
 =?gb2312?B?cVM5blFBbmtuckppNng5ODlMajlXcU5RRExsaGI4bXk2M2lVMkIwZCtWRFY0?=
 =?gb2312?B?T1RnbkxvS3grZE5RdzFrZHkvYlJoNTVpU3dHczJ1TStGd05vVzljWTNpYklE?=
 =?gb2312?B?TmlKZXlNMFFNVW5nenFraHhFTWIrbW5PQ3Q0YU9QeEdZSXlQTGcrRVd6ZW5K?=
 =?gb2312?B?UTdUWXFBQVJ2blZxVks4dG4zQWRUT0VJVzlZcTBPUXpHRzQxSU53em5HWVhj?=
 =?gb2312?B?Q2o4S01DK2x2WW5PZzRib0ZMd1JqNjY4MGFDQ1dieHdGMEdVZUl3aFdGNzFo?=
 =?gb2312?B?YjZtU1NLVkhvczBmOVRBa2Y3SjVyWWhMakw0OGlCa0Jqdnd5c3RJaVVrSWZQ?=
 =?gb2312?B?bFdSZDdKNEZGeFdudTZ1Y0hucldRMGVJYkowTWhWSnQxTlF0anNvZ0kreU43?=
 =?gb2312?B?UDRDWERvTzR6eU5SWmFHOE5YOXNUeU5Pa3dYalF6MURsby9uWHVuSmU0ekRK?=
 =?gb2312?B?WEk0NllFZ3ExeW9ORmNuTzdNMWE3Mlp3alZ2RTA3WUNjWWtsTWVScVRBcWsy?=
 =?gb2312?B?N2hmaUVsRCtQM3Jrc2lMYXhGdmU0NTQwLzJOR21xZDVIaWZGME1iWGdPY25y?=
 =?gb2312?B?YXBCMkVrNnB2YmhGc2NTak5QZW0rbjR3Z0lvcnQ1cnpFeUVISG5KbXRpMTZ0?=
 =?gb2312?B?b0JEMWNqZTJXVWIvZ1F1bHp1YVdjMUh4Z3FUL3cxeERsRGpLSGR6Q0F6c1NG?=
 =?gb2312?B?R3pMN2V2azlNdWwwM0F5bUM3NnlNRTd5Um5PRzZtajJnZWNlcW9JSlVsdHBp?=
 =?gb2312?B?NUFtd2xUMzZrUlY2bysvUnJxcDZOUUIvODVGQ0FyQ3hrQ05MUnRzSDhna29k?=
 =?gb2312?Q?51YjsF77fWp+hukZDk=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fc2bbd3-d81a-4329-b913-08d8dc8bb26a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2021 08:26:22.4209
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kWUMtH92ooxKuEnjwkr2mhgIJi2Qpu862AZGl66DJDxHZnf9IeBzDlimHHQgLRv2MrggTS2XNwNa+PUIZBZUom5bZ5Fdm35R+rVWrZxpP/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3349
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCreivP7IyzogR3JlZyBL
SCA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Creiy83KsbzkOiAyMDIxxOoz1MIxyNUgMTY6
MDAKytW8/sjLOiBaaGFuZywgUWlhbmcKs63LzTogemFpdGNldkByZWRoYXQuY29tOyBsaW51eC11
c2JAdmdlci5rZXJuZWwub3JnCtb3zOI6IFJlOiBbUEFUQ0hdIFVTQjogdXNibHA6IEFkZCBkZXZp
Y2Ugc3RhdHVzIGRldGVjdGlvbiBpbiB1c2JscF9wb2xsKCkKCltQbGVhc2Ugbm90ZTogVGhpcyBl
LW1haWwgaXMgZnJvbSBhbiBFWFRFUk5BTCBlLW1haWwgYWRkcmVzc10KCk9uIE1vbiwgTWFyIDAx
LCAyMDIxIGF0IDEyOjAzOjAwUE0gKzA4MDAsIHFpYW5nLnpoYW5nQHdpbmRyaXZlci5jb20gd3Jv
dGU6Cj4gRnJvbTogWnFpYW5nIDxxaWFuZy56aGFuZ0B3aW5kcml2ZXIuY29tPgo+Cj4gSWYgdXNi
bHAgZGV2aWNlIGhhcyBiZWVuIGRpc2Nvbm5lY3RlZCwgZGlyZWN0IHJldHVybgo+ICdFUE9MTEhV
UCB8IEVQT0xMRVJSJyBpbiB1c2JscF9wb2xsKCkuCj4KPldoeT8gIFdoYXQgcHJvYmxlbSBhcmUg
eW91IHNvbHZpbmcgaGVyZT8gIElzIHRoaXMgZml4aW5nIGFuID5vbGRlcgo+Y29tbWl0LCBpZiBz
bywgd2hhdCBvbmU/Cj4KClRoZXJlIGlzIG5vdCBuZWVkIGZpeCBvbGRlciBjb21taXQuCkFmdGVy
IHRoZSBkZXZpY2UgaXMgZGlzY29ubmVjdGVkLCBpZiB0aGUgdXNlcnNwYWNlIGNhbGwgcG9sbC9z
ZWxlY3QoKSBmdW5jdGlvbiwgd2lsbCBibG9jayBhbmQgbmV2ZXIgYmUgYXdha2VuZWQgLgoKVGhh
bmtzClFpYW5nIAoKPlBsZWFzZSBwcm92aWRlIGEgbG90IG1vcmUgaW5mb3JtYXRpb24gaGVyZSwg
dGhpcyBpcyBub3QgdmVyeQo+ZGVzY3JpcHRpdmUuCj4KPnRoYW5rcywKPgo+Z3JlZyBrLWgK
