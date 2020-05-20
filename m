Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 819631DBA6D
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 19:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgETRBR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 13:01:17 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:46820 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726439AbgETRBR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 May 2020 13:01:17 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A7224C03D8;
        Wed, 20 May 2020 17:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1589994076; bh=GIYOkJ1Np/Y3mQ/JYkJKTSYgC7QgvMttrYv/CtVaVtc=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Z8bc2KCzlJ80KFtVgmpbOW2IYaY13UpdyGX+JmqsO8A1p/BjNJ2OkFSLMmUWwFuSB
         QwAyxmorKdr2BSAPfMlO/KF2Zmdmcd9xdYoggwayi78lRX8frW6X9nEKg36DirYli7
         WV9A6YkkFzZf7gw/0Njgu33Pnl27+B7gOUCn5bI+6StoefCZDiuVJh4Qu4Skg0eqsL
         6cSIJqXtFno+8+0t/VVJ8NlnrJMEtwLGy3BEEIIM4GXelprKC3YSiHCigNlhJsgmdw
         jJT50PBRUQEE7kNC7oVxeWxH2SWOYGkbbiKyltNJlpmEN0auBOn2+Kt79yl04mBYGX
         X+I1BHl4v0d3w==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 28A66A006C;
        Wed, 20 May 2020 17:01:14 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 20 May 2020 10:00:52 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Wed, 20 May 2020 10:00:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YxuiiAqgoJsWU28LBlKbKNj/a5chfxddLYUvr16uf+YHepUsG4vZ9EunsAT5c6yFpTwod/kE4aZElR4W+796PZ2MXAQlfTKLqMvyOH8A1N0P0f76Z6UQlefOxAtyGvEAFEcXbl0asXkbhmMf6I4TJKawIosmVVUbzYHdusXFlyA2QBgRqfzRx9Z40c1UOBndcnbO1SAkALwcUYhf6dFo4L4FrcVOA+rqjX4EgqEc3+6XC/oQD55jTKOuY3y0yGZO+A4cMYpHtfaQWLo5fb4fTE+TMcSp4UewGM2fSB823lZU/6OVSshWQKJ/UzQlzdCNdH+/idmd5L/E15zc9/VcFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIYOkJ1Np/Y3mQ/JYkJKTSYgC7QgvMttrYv/CtVaVtc=;
 b=klYMOg+pgZU0G9HD14fobugFyPhS+6RuXnr6hVQZ/r0oChfdqS0qdRe/BXQk6anJ/ELkGBJKTthHmxFGIjrQhOaWnEnFzd7OilOiESdBPcm4h2NYVE8PIVrOvdU8UGzFffhShMTV8Z56r3WBzGI72wO9RkQvgN3ZrSpIfMarnT4roNdNKJnSDNPSPF7p1dKqzib/8RdoU1OTcpYWsbW/UvzRZL9gubhXu/B/mUlpUTrndy6Wf/Qy55dgKLfrNOifIGoFZJBIdikB9nNetW4rAhQ8TF4MCWpp4b/Rs+DyvDtbuRQlhbLdpbxz0AzACamB31Z8DGSLfKfrsAKTonfwGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIYOkJ1Np/Y3mQ/JYkJKTSYgC7QgvMttrYv/CtVaVtc=;
 b=KAYFeytQnoucUg8A2lmklHcqWkC6MRx/aKW0e085I0WjMo3SFEjoCmcB1S6wen64qO9tphYmIZHqgHGBeMHLv3Zjsvli/y5RHEslPFL4saWLegDkc4lxdCPLlNOm+A4lNaxmwPkaiuZB4YeDBePDHdacKBvLjRREESTv0A+rsdw=
Received: from CH2PR12MB4311.namprd12.prod.outlook.com (2603:10b6:610:a8::21)
 by CH2PR12MB4293.namprd12.prod.outlook.com (2603:10b6:610:7e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.24; Wed, 20 May
 2020 17:00:50 +0000
Received: from CH2PR12MB4311.namprd12.prod.outlook.com
 ([fe80::cd38:4727:1239:f467]) by CH2PR12MB4311.namprd12.prod.outlook.com
 ([fe80::cd38:4727:1239:f467%4]) with mapi id 15.20.3021.024; Wed, 20 May 2020
 17:00:50 +0000
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>
CC:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH v2 4/4] usb: xhci: Use temporary buffer to consolidate
 SG
Thread-Topic: [RFC PATCH v2 4/4] usb: xhci: Use temporary buffer to
 consolidate SG
Thread-Index: AQHWF8I9mzJAua+iDUCYnE0KWVGzAqiuMWMAgAKCaYCAAKoXgIAAAwSA
Date:   Wed, 20 May 2020 17:00:50 +0000
Message-ID: <a577925a-98ea-2e6d-da0c-b3e8dbe3dc7e@synopsys.com>
References: <cover.1587461220.git.joglekar@synopsys.com>
 <969b5c9f31807635785ecc74b2ae2559ddc3bbeb.1587461220.git.joglekar@synopsys.com>
 <a1845154-2d8d-e63c-a3e7-7a3ed244bd57@linux.intel.com>
 <6551a485-5478-ccac-ca1f-d3e2ec4c9053@synopsys.com>
 <20200520165001.GD11084@rowland.harvard.edu>
In-Reply-To: <20200520165001.GD11084@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rowland.harvard.edu; dkim=none (message not signed)
 header.d=none;rowland.harvard.edu; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [183.82.184.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b33a023-2304-4acf-f834-08d7fcdf59bc
x-ms-traffictypediagnostic: CH2PR12MB4293:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB42939FC9BBB3CBD44849B4CAA4B60@CH2PR12MB4293.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 04097B7F7F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: foixtD0LxC4D112fk+cIDYwZnYdHCv+KcpjQnLSIvR27LH1KDCeBtFCT5tw+JlMktiRkkDrnAmjOcmgzEK671JRapeY8VxypuxKugFWlV655BclgrBZKzoGKAB6ka9R/plkmxV4IvKABzK1cMssu34MdFmS/a0MhoEYbfPMPl/3Nbd4cJ2YVpLzHBVsU2Xuzsnyb0aU7/ze6aZmUL4e1UeSoVCRIozDq1zVJXaY/HMgvZ4xYYGxnPcIbJyoEHxIhJmU9vMDMq+icwUhu4pf9viKUPn5HNIBYel48gaAwPCFsrA0+k6pj7oneLcDlYcBHatotls4iuXy/yJc0x+6Rp7VG/uejKD1UOX7zKRcrz7mH79v+9/rB62hdIwvQutfUZCzsFuA4t2gWZwjE7tTwn3WAZGgMBFB7XRxnqFMusyOza6USb47l6WRT/o8/M9yL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4311.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(39860400002)(396003)(376002)(136003)(8936002)(2906002)(186003)(36756003)(26005)(2616005)(64756008)(478600001)(66556008)(76116006)(66946007)(53546011)(91956017)(66446008)(6506007)(66476007)(31686004)(5660300002)(110136005)(8676002)(6486002)(54906003)(4326008)(71200400001)(6512007)(31696002)(316002)(107886003)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: y5JFvOCUym9cXnCmF8B4M8WF4BjzTsIUzBEqrIcWIIGWqwPYX4I3hV4wwKwj/ULVVMlkC+//ulzQfmJO0g9Ni1/lgfdOl01yrZZZ2KAX+Qs0JKWr9L3LWtrNj0ETrnVrXfym+lqhB0BZDnHgVKpvRuQ7Avmhd5G+/Q1dPPSt8z3NVJaTRS3JBlIMzEwei0+LR24ydgDQOJYIpz795cktSviKbsLIspkyH3JeodsaCpfQYP/110p+ZZ3SmsJ/IIlNO9WpdhSAi/BOmifP5vzvN4jAaItyN6v/1rrUmsO6tFjsn6ZnVY0AAOXfCfzx3lhrVBHGbDQeHZxkFnqjkY5yy/3LO1839vm/cv+Pi0lG2TgR/mUlD4TxdiLEw2WhYoxnSDbVrX3XwA5Wiw2YVpfqm1GPWkUu2I8Vk0XXT2br3jsgMPs183RIr9sE4vzMH51ZNZSaUbCp2vAaqxcIkCYkC80Q3v2y49t4CMCs9IRret4CTMsWJACElzqQ5VgZq0mW
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB0EB7A84F0A4546B2B1A22A6F96B760@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b33a023-2304-4acf-f834-08d7fcdf59bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2020 17:00:50.7945
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OOBxjEQmRvsOjkvdmeSqJPM0pma7WKwYY0Ry8QavDJTHXzB19Xg90OEN8ZCxXwYW1nojeeuZmaO+KEIK56BVIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4293
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQpPbiA1LzIwLzIwMjAgMTA6MjAgUE0sIEFsYW4gU3Rlcm4gd3JvdGU6DQo+IE9uIFdlZCwg
TWF5IDIwLCAyMDIwIGF0IDA2OjQxOjE2QU0gKzAwMDAsIFRlamFzIEpvZ2xla2FyIHdyb3RlOg0K
Pj4+PiArCXVyYi0+dHJhbnNmZXJfYnVmZmVyID0gdGVtcDsNCj4+Pj4gKwl1cmItPnRyYW5zZmVy
X2RtYSA9IGRtYV9tYXBfc2luZ2xlKGhjZC0+c2VsZi5zeXNkZXYsDQo+Pj4+ICsJCQkJCSAgIHVy
Yi0+dHJhbnNmZXJfYnVmZmVyLA0KPj4+PiArCQkJCQkgICB1cmItPnRyYW5zZmVyX2J1ZmZlcl9s
ZW5ndGgsDQo+Pj4+ICsJCQkJCSAgIGRpcik7DQo+Pj4+ICsNCj4+Pj4gKwlpZiAoZG1hX21hcHBp
bmdfZXJyb3IoaGNkLT5zZWxmLnN5c2RldiwNCj4+Pj4gKwkJCSAgICAgIHVyYi0+dHJhbnNmZXJf
ZG1hKSkgew0KPj4+PiArCQlyZXQgPSAtRUFHQUlOOw0KPj4+PiArCQlrZnJlZSh0ZW1wKTsNCj4+
Pj4gKwl9IGVsc2Ugew0KPj4+PiArCQl1cmItPnRyYW5zZmVyX2ZsYWdzIHw9IFVSQl9ETUFfTUFQ
X1NJTkdMRTsNCj4+Pg0KPj4+IE5vdCBzdXJlIGlmIHVzaW5nIFVSQl9ETUFfTUFQX1NJTkdMRSB0
byBmbGFnIHRoYXQgdGhpcyB1cmIgaXMgYm91Y2VidWZmZXJlZCBpcw0KPj4+IGFwcHJvcHJpYXRl
Lg0KPj4+DQo+Pj4gSWYgR3JlZyBvciBBbGFuIGRvbid0IG9iamVjdCB0aGVuIGl0J3MgZmluZSBm
b3IgbWUgYXMgd2VsbC4NCj4+Pg0KPj4+DQo+Pj4NCj4+IEBHcmVnL0FsYW4gZG8geW91IHN1Z2dl
c3QgYW55IGNoYW5nZSBmb3IgdGhlIGZsYWcgaGVyZT8NCj4gDQo+IFRoaXMgcmVxdWlyZXMgY2Fy
ZSwgYmVjYXVzZSB0aGUgY29yZSB3aWxsIGFscmVhZHkgaGF2ZSBzZXQgb3RoZXIgZmxhZ3MgDQo+
IGZvciB0aGlzIFVSQi4gIEkgZG9uJ3QgcmVtZW1iZXIgdGhlIGRldGFpbHMgYW5kIEkgZG9uJ3Qg
aGF2ZSB0aW1lIHRvIA0KPiBjaGVjayB0aGVtIG5vdy4gIEJ1dCBpdCB3b3VsZG4ndCBiZSBhdCBh
bGwgc3VycHJpc2luZyBpZiB0aGUgY29yZSANCj4gZG9lc24ndCBleHBlY3QgYW4gVVJCIGJvdGgg
dG8gdXNlIFNHIGFuZCB0byB1c2UgRE1BX01BUF9TSU5HTEUuDQo+IA0KV2hlbiB0aGlzIHF1aXJr
IGlzIGVuYWJsZWQgYW5kIGl0IGlzIHJlcXVpcmVkIHRvIGNvbnNvbGlkYXRlIFNHIGxpc3QgdG8g
DQpzaW5nbGUgYnVmZmVyIG5vIG90aGVyIGZsYWdzIGFyZSBzZXQgZm9yIHRoZSBVUkIuIE9ubHkg
cXVlc3Rpb24gaGVyZSBpcyANCmlmIGl0IGlzIGdvb2QgdG8gdXNlIERNQV9NQVBfU0lOR0xFIGZs
YWcgZm9yIHRoZSBjb25zb2xpZGF0ZWQgU0cgbGlzdCANCmludG8gYSBzaW5nbGUgdGVtcG9yYXJ5
IGJ1ZmZlci4NCg0KPiBBbGFuIFN0ZXJuDQo+IA0KVGhhbmtzICYgUmVnYXJkcywNCiBUZWphcyBK
b2dsZWthcg0K
