Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3263F1E10EC
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2020 16:46:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391019AbgEYOqP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 May 2020 10:46:15 -0400
Received: from mail-bn7nam10on2069.outbound.protection.outlook.com ([40.107.92.69]:59584
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390903AbgEYOqO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 25 May 2020 10:46:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMTF9T2mnm49+OA9krhZaanoqJb/tFUSJ47d7U+QVL7hwgT3jDq62S6B7VtnYQYEGMm/UWxOt+VFklKkX96y/KBlAswBAHEvgBNEZOCTvZXDnh5xQcFkULj92yYnUC5xbuN1iDiZQh8EY7eF0vOsr/0M2wBYVYNSIyFofTD4Nq5HmZBpEakYoNOIwu5h0z2i7hugoLT3e3iG8W48iGNPopH8r3lPS4YBJjovLAmUhTuubm7Q8KC0g7ilLh3KjLmPElVW0JpjWfbdhyFSgjuMbTD0xdZO59B/Zt4VPjZ0qvrQxkg66DP6GAvMeoyP8dqPBs2CirbaAcFiDlKme2OdFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtxWj9BUghaHcuwng0OI+hj6lRza0ecgfgj7/DbywF0=;
 b=AO/rVwxlaohBxmjzTzRKLYKuMUJRj7kUvHFixHHix5g3DjnJJ37y29aKDr+bV8oYBpge1/0e4VhdOKmkxlmEtfpuuyavrHYDqihTndr3uZXXEkFTJSBGsRH/EuKcC9A95eqfnBZ/xmJAK+Ug3bxp34jJyAsDVVSyHT1UMn6ryqwjLduMB5d18dQMQLBMGfmIM8hpAVdPIvHPjLIzRxDhaoepkiy3XiTjoNxVPUdDNmNBd3qMVf8cAjSeRJV6Sua2HK/QLIuMKkCmHIsesL5z27ri5BEijL4iUOZ6MzpHKGbrCJ89yL4J5S7iLf2FSUICsO+eE37GTRnRBnpX9LHQIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtxWj9BUghaHcuwng0OI+hj6lRza0ecgfgj7/DbywF0=;
 b=CDQkTEDZJ267kcwcFoZnEau2BVp/ygQ54GJq5Hua/Ors2h2rG8OEo/HwEVLNGRrIDOLqrzyjQLXwcB1fjnennLNPsqWZcfSXuPLxuHAkZdIO2P/3kYqp0TOgj8APPSg16W+fJu/V4ohX+ZMPAZXdXk//DyhS3SaLC7ja4dQ8FNM=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (2603:10b6:408:ae::24)
 by BN8PR10MB3204.namprd10.prod.outlook.com (2603:10b6:408:c7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24; Mon, 25 May
 2020 14:46:09 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::c158:d59f:e3bc:1941]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::c158:d59f:e3bc:1941%2]) with mapi id 15.20.3021.029; Mon, 25 May 2020
 14:46:09 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage chars &
 disconnect
Thread-Topic: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage
 chars & disconnect
Thread-Index: AQHWMqM6W5iP9Jkv9UCEGIiDuBaJww==
Date:   Mon, 25 May 2020 14:46:09 +0000
Message-ID: <6a4fe396ab5ae6cda548e904c57bc823103999d7.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f8a0b59f-87fe-4956-6c50-08d800ba5ca3
x-ms-traffictypediagnostic: BN8PR10MB3204:
x-microsoft-antispam-prvs: <BN8PR10MB32041AB68BD13CD295CAB889F4B30@BN8PR10MB3204.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 0414DF926F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EF7zO2OVVvRyosgcAwwT2TP+63PhqKAhtZ/GrZ62rGdqCKMlJILUmn70MQxXH7CDqhpgCTlaJg0PSijFh+wDCWa8W5Y1ndpABShl68qRFPJdm34ulT3PNKYbeXQt+/XO8jXDoT+P0MBoPKWWdjyI6Y3kNibawijZfzANYrqbI6koXYTk6pyTCedeZQL1qNei4h4PJ+hzKBfgylo9eiTfcnn1fD2IUTf/U6jwCA3UHYjFPzZ4mofScoy7DWCqmRtw5oQHHDQkBC0AmoAElOBltu9uzrCUczr/BMTOTt+h3As4uAgqcjNMGb5QgGErcPyPJELld2cK5zaFVbqEfotWzQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR10MB3540.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(39860400002)(136003)(346002)(396003)(366004)(66476007)(26005)(66556008)(64756008)(6506007)(66946007)(86362001)(186003)(76116006)(316002)(66446008)(8936002)(2906002)(478600001)(91956017)(8676002)(2616005)(6486002)(5660300002)(71200400001)(6512007)(36756003)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: gbIYcOf8FQ469f2sPu/2R+b/6WOXuL/5HEaUOCGl3xCylXw0Isyv4ydhY9nrNV3JNP3TmrUslDnioiC3pWS9NoStUEDreORNBKfVChlbOpSJiVhTmVrFqesX/mxDbc6tyS0egHJS65X7HSVI7Br+Lh7mVOWeY7P9BAZdrXMOWTEwpQjUS3Jidu3kLzhZTsTICstdlVrbArlru54CxZ+lQHtPstm8kvyk+YbuIyFEtAaeqRom0+ZB8j8xBkLPabT3ruBWNDtCFEo1IHrMct5Vb5m2sPWDlmWcZZMO1ZDPAFDdr+ObO4GQbWWdmvQEPq229azrcsyI+9znIRa3ZvaxHU83gw5A01/V41bwTb/D84Cs7OcNM1c1MODdR4MkUbZ4nZUimT6xdco11WO8bzw0VydBucnVGzBI4mHT/GddevtkZjpJIQxeokMCiMJ0bHudUb84+9flk3XGWbBsMH13Kt2THff/Dlq6Zcuwyg0DM1g=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <AEBD7E3ADB362C4B8146E6C3E1ECEAAD@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8a0b59f-87fe-4956-6c50-08d800ba5ca3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2020 14:46:09.0826
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 77BT0ekFzUPg4AsiCqQlhKpNXwH5dM5lbTVruMA9tX7B9LhXK63m0J4GJqoUAQSX+HV57O4hhlyIB8ZqPmGp7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3204
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RXZlcnkgbm93IGFuZCB0aGVuIEkgc2VlIGluIGRtZXNnOg0KDQpbV2VkIE1heSAyMCAxNDowMzox
NiAyMDIwXSBjZGNfZXRoZXIgMS02LjI6MS4wIHVzYjA6IHVucmVnaXN0ZXIgJ2NkY19ldGhlcicg
dXNiLTAwMDA6MDA6MTQuMC02LjIsIENEQyBFdGhlcm5ldCBEZXZpY2UNCltXZWQgTWF5IDIwIDE0
OjAzOjI1IDIwMjBdIHVzYiB1c2IxLXBvcnQ2OiBkaXNhYmxlZCBieSBodWIgKEVNST8pLCByZS1l
bmFibGluZy4uLg0KW1dlZCBNYXkgMjAgMTQ6MDM6MjUgMjAyMF0gdXNiIDEtNjogVVNCIGRpc2Nv
bm5lY3QsIGRldmljZSBudW1iZXIgODUNCltXZWQgTWF5IDIwIDE0OjAzOjI1IDIwMjBdIGNkY19h
Y20gMS02LjM6MS4xOiBhY21fY3RybF9pcnEgLSB1c2Jfc3VibWl0X3VyYiBmYWlsZWQ6IC0xOQ0K
W1dlZCBNYXkgMjAgMTQ6MDM6MjUgMjAyMF0gdXNiIDEtNi1wb3J0MjogYXR0ZW1wdCBwb3dlciBj
eWNsZQ0KW1dlZCBNYXkgMjAgMTQ6MDM6MjYgMjAyMF0gdXNiIDEtNi4zOiBVU0IgZGlzY29ubmVj
dCwgZGV2aWNlIG51bWJlciA4Ng0KW1dlZCBNYXkgMjAgMTQ6MDM6MjYgMjAyMF0gY2RjX2FjbSAx
LTYuMzoxLjE6IGZhaWxlZCB0byBzZXQgZHRyL3J0cw0KW1dlZCBNYXkgMjAgMTQ6MDM6MjYgMjAy
MF0gdXNiIDEtNjogbmV3IGhpZ2gtc3BlZWQgVVNCIGRldmljZSBudW1iZXIgOTQgdXNpbmcgeGhj
aV9oY2QNCltXZWQgTWF5IDIwIDE0OjAzOjI3IDIwMjBdIGh1YiAxLTY6MS4wOiBVU0IgaHViIGZv
dW5kDQpbV2VkIE1heSAyMCAxNDowMzoyNyAyMDIwXSBodWIgMS02OjEuMDogMyBwb3J0cyBkZXRl
Y3RlZA0KW1dlZCBNYXkgMjAgMTQ6MDM6MjcgMjAyMF0gdXNiIDEtNi4yOiBuZXcgaGlnaC1zcGVl
ZCBVU0IgZGV2aWNlIG51bWJlciA5NSB1c2luZyB4aGNpX2hjZA0KW1dlZCBNYXkgMjAgMTQ6MDM6
MjcgMjAyMF0gY2RjX2V0aGVyIDEtNi4yOjEuMCB1c2IwOiByZWdpc3RlciAnY2RjX2V0aGVyJyBh
dCB1c2ItMDAwMDowMDoxNC4wLTYuMiwgQ0RDIEV0aGVybmV0IERldmljZSwgN2U6MWQ6MDY6YzA6
M2Y6M2MNCltXZWQgTWF5IDIwIDE0OjAzOjI3IDIwMjBdIHVzYiAxLTYuMzogbmV3IGhpZ2gtc3Bl
ZWQgVVNCIGRldmljZSBudW1iZXIgOTYgdXNpbmcgeGhjaV9oY2QNCltXZWQgTWF5IDIwIDE0OjAz
OjI3IDIwMjBdIGNkY19hY20gMS02LjM6MS4xOiB0dHlBQ00wOiBVU0IgQUNNIGRldmljZQ0KDQpU
aGlzIChFTUk/KSBkaXNjb25uZWN0IGNhdXNlcyAyIHRoaW5ncy4NCjEpIEkgbG9vc2UgdGhlIFRU
WSB0ZW1wb3JhcmlseSBhbmQgaGF2ZSB0byByZWNvbm5lY3QuDQoyKSBBZnRlciByZWNvbm5lY3Qg
dGhlcmUgYXJlIGdhcmJhZ2UgY2hhcnMgb24gdGhlIGdhZGdldCBzaWRlLCBzdWNoIGFzOg0KICAg
ICBo77+9XkBeQO+/vSBeQF5A77+9IF5ADQogICBvcg0KICAgICBY77+977+977+9KUjvv73vv700
xJ5e77+977+977+9DQogICB3aGljaCBjYXVzZXMgY29uZnVzaW9uIG9uIGZvciB0aGUgdHR5L2Jh
c2ggb24gdGhlIGdhZGdldC4NCg0KVGhlIGRpc2Nvbm5lY3QgaXMgbW9zdGx5IGp1c3QgYW5ub3lp
bmcgYnV0IHRoZSBnYXJiYWdlIGNoYXJzIGFyZSBhIG1ham9yIHBhaW4sIG9uZSBjYW5ub3QgdHJ1
c3QNCnRoYXQgY21kcyBhcmUgdW5kZXJzdG9kLiBJcyB0aGVyZSBhIGJ1ZyBpbiB0dHlBQ00gZHJp
dmVyIGNhdXNpbmcgdGhlc2U/DQoNCiBKb2NrZQ0K
