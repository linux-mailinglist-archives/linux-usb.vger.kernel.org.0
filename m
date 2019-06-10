Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF2013AFFE
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2019 09:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387855AbfFJHvz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jun 2019 03:51:55 -0400
Received: from mail-eopbgr780072.outbound.protection.outlook.com ([40.107.78.72]:22816
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387781AbfFJHvz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Jun 2019 03:51:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Dkf9d5pnViWiw69ms56zfjgwd2e29I+RtSrYonXL14=;
 b=DYngO1grvIKP5Llk0UdVJfw8fcuBqj4V7iF/yHwiUMHC9x11/lJqzXm/LxVVR0EIotiiDePyc/VQ3r8F5Xt0FHGzpEWVLGyHCdDcWs+yl31reVxxtuD6VXQJAaJlbgDf0BczIo7PGvWXhCgtVb8M4duCL9piOIRv6onmzWXJ9mM=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (20.179.78.205) by
 BN8PR10MB3667.namprd10.prod.outlook.com (20.179.96.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Mon, 10 Jun 2019 07:51:53 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::a460:e299:c4c:4ba8]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::a460:e299:c4c:4ba8%6]) with mapi id 15.20.1965.017; Mon, 10 Jun 2019
 07:51:52 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "leoyang.li@nxp.com" <leoyang.li@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: fsl_udc status?
Thread-Topic: fsl_udc status?
Thread-Index: AQHVH2FeViVekb5FTkyBYafYtN/FkQ==
Date:   Mon, 10 Jun 2019 07:51:52 +0000
Message-ID: <95d5902538997e340ccf7784406832904d512b51.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Joakim.Tjernlund@infinera.com; 
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f8ce444-0e39-4857-5e77-08d6ed7880a6
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BN8PR10MB3667;
x-ms-traffictypediagnostic: BN8PR10MB3667:
x-microsoft-antispam-prvs: <BN8PR10MB3667CC61736488C6B58D08EBF4130@BN8PR10MB3667.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0064B3273C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(136003)(396003)(366004)(39860400002)(346002)(199004)(189003)(6486002)(2906002)(6512007)(6436002)(3846002)(6116002)(305945005)(2501003)(5660300002)(71200400001)(71190400001)(478600001)(4744005)(66446008)(64756008)(76116006)(66946007)(73956011)(91956017)(66556008)(66476007)(7736002)(110136005)(72206003)(6506007)(25786009)(26005)(102836004)(118296001)(81166006)(256004)(14454004)(186003)(7116003)(316002)(36756003)(476003)(68736007)(53936002)(8936002)(2616005)(66066001)(86362001)(81156014)(99286004)(8676002)(486006);DIR:OUT;SFP:1101;SCL:1;SRVR:BN8PR10MB3667;H:BN8PR10MB3540.namprd10.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: infinera.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BnhFDGclbR1Db4vKHH8yY7S/EH3wV+osIWAyvq+4nNFqt/82I2eoFP0VMqDm4vPh2oixth9DXBs4iisXyBkFg4+18LfMJQASP/1zS3YpsefhCzgEkExNQpKqFVHmLLJrFgxxH38Q3nhnt9p/nJa2TyBlSghhpkLLg/QNYvQ5AGTNrVbLCXvymMyuxyF8lMsvQMNoKLKc+hkhQWCZCkBnIBu6kj+0Mz9l9CjTrN/gfCrGUm0zsJ6jJXmyXv6pUmlq44OFg1FJneAsDPZX0lEojrEe2ap5hWew9R+/VvoNNDDHfpBsU+CFaiIq5cIpZ5a4io4Z5nbFLu1ADFM99iD0gBIunqbrjURBbLvp+iZ8TX4lDMKa5xmOsNlqMffrTe5NVOgNnxZOKDkhknm9t7RuBt9cRSWEVjktxbBW6ZFFkFs=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2190210F1592E04FA9FE0E297EC699E2@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f8ce444-0e39-4857-5e77-08d6ed7880a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2019 07:51:52.8499
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jocke@infinera.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3667
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

V2UgYXJlIHRyeWluZyB0byBnZXQgZnNsX3VkYyB1cCBhbmQgcnVubmluZyBvbiBhIFQxMDQyIHdp
dGggd2l0aG91dCBzdWNjZXNzLg0KU2VlbXMgbGlrZSB0aGlzIGRyaXZlciBpcyBsYWdnaW5nIGJl
aGluZCB0aGUgY29ycmVzcG9uZGluZyBob3N0IGRyaXZlcihtcGgpLg0KVGhlIG1waCBkcml2ZXIg
aGFzIGEgbnVtYmVyIG9mIFVTQiBlcnJhdGEgd29ya2Fyb3VuZHMgd2hpbGUgdWRjIGhhcyBub25l
Lg0KQXQgbGVhc3QgZXJyYXRhcyBBMDA3NzkyIHNlZW1zIGFwcGxpY2FibGUgZm9yIHVkYyB0b28u
DQoNCklzIHRoZSBmc2xfdWRjIGRyaXZlciBmdW5jdGlvbmFsIG9uIDQuMTQueCh3aGljaCB3ZSB1
c2UpPyBXaGF0IGlzIG1pc3NpbmcgPw0KDQogSm9ja2UgIA0K
