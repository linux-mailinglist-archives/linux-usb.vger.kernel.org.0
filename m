Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9B69144988
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2020 02:47:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbgAVBrA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jan 2020 20:47:00 -0500
Received: from mail-eopbgr70057.outbound.protection.outlook.com ([40.107.7.57]:6076
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726605AbgAVBq7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 Jan 2020 20:46:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORrRha8m2juFWohJhnc6u238DSELU06TQv1/+R9HLXymvKgBMIOT/jdhV5mTIsjn7i7wgChEsC9IW5nJljg4y/ts8P/gh1Ba+trEcdfVqyF88dWkhVc3ppJC/ZpGLpNYDQRf1A3NOKEnTlhVApEjvrbtODLHXtgpZifDxMoEJmcY/oMBa/Z1/fM3QnlULKjlQ1/np7lIAoHXywSu4HriUjBKBBm53USs3R2h2sx6TKmZ331ZtAN394MLnQYPbmMFPeVQCiXJMb8mqlEr40G/CDqcN4rEtrVafDo+kgIP3hJRLhCcCrCpv7+WLzyPJWjUCvFtzwP5MgszUtqSAQxb3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dV+1c1TQRKkRwjp+6zrAqHJ7JKdhlnpYv1gYlie7cdw=;
 b=jD+z3Bap0WQn5Ai0nv+2ahQBOhg+iquORkY/8SjnxrLR8JzZF9QhEQyQ0gqdM/hO9Ke96V70ZdmAr0G0OepJCIL6wE9Tv3KgOdr8O1T4wC0W5tj5I64STGVcJdRH0KMrHY6JShY8mEeXZM5w2AEe0PMdiD8vYTekGBcz2P4stwNJsPAlZwoD2KyoYAkOWSkuSTKumc06qfbpiwHdmEBkXTSkyqHgocOo/sBvFAD6hdenIwft+0oq7H5wZznr4WVSKELQmo+1Leb2vSk4mU5YUi9vemspfzR7Kaq3o+YJ2Or7uBz8ldRZ3zrqG85E8av3sMy21IuokcOxarpBQyJ+NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dV+1c1TQRKkRwjp+6zrAqHJ7JKdhlnpYv1gYlie7cdw=;
 b=sq2EKCVr0buFWk4iKpARuMHleYXkh5LNcfczOLRno+KTpzGTOizhVCm5GiLGfSbqrN50vijqKLKubqcBG3g0e03cOsNoQO90o24kMxnqE/9Dq3HCFi7c3ul8uyGzH0kFwOzzmjQmIXwQpPfELdKU8MF3viytiKvI/4FMHj8K7iQ=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB5997.eurprd04.prod.outlook.com (20.178.122.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.19; Wed, 22 Jan 2020 01:46:57 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e%6]) with mapi id 15.20.2644.027; Wed, 22 Jan 2020
 01:46:56 +0000
Received: from b29397-desktop.ap.freescale.net (119.31.174.66) by HK2PR04CA0087.apcprd04.prod.outlook.com (2603:1096:202:15::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.18 via Frontend Transport; Wed, 22 Jan 2020 01:46:55 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 0/2] usb: chipidea changes for v5.6-rc1
Thread-Topic: [PATCH 0/2] usb: chipidea changes for v5.6-rc1
Thread-Index: AQHV0MXUvOvScafLWEC1N1vFuV0MUg==
Date:   Wed, 22 Jan 2020 01:46:56 +0000
Message-ID: <20200122014639.22667-1-peter.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.17.1
x-clientproxiedby: HK2PR04CA0087.apcprd04.prod.outlook.com
 (2603:1096:202:15::31) To VI1PR04MB5327.eurprd04.prod.outlook.com
 (2603:10a6:803:5c::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3bc3ca2d-7d74-4fcc-4d92-08d79edcf6a5
x-ms-traffictypediagnostic: VI1PR04MB5997:|VI1PR04MB5997:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB599761708A134E7EA129935C8B0C0@VI1PR04MB5997.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 029097202E
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(39860400002)(136003)(346002)(396003)(376002)(199004)(189003)(86362001)(1076003)(52116002)(26005)(66476007)(66446008)(66946007)(66556008)(6512007)(64756008)(5660300002)(8676002)(71200400001)(2616005)(316002)(6916009)(956004)(2906002)(4744005)(4326008)(54906003)(6506007)(478600001)(6486002)(8936002)(81166006)(81156014)(44832011)(186003)(16526019)(36756003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5997;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l1DHfIBGxsS5yj9+NqGwD2rHZxc/SE87M0pZo4a7yZm6EEKneLqVcJd5a2G9MVsExy3WZBBp8DEFLkCH3+qOZdh2pvOcTQWl5i26E/oD3NXJVxOdtVvXXDfpeSWdT1Xt9DY6YAwPbfUJ/7cjZiZTk9ULuAHema3/MZytLWM9bIVSy8B4YWjbsHn9Tv0v6Qq/MAtz108tl/aDRBnmRUKVoZD+iL5lKxZS4oiwgrlAcH5XmmwUcWbNlFT62Pv9vHie/3P2BUPPIZH+VsT7Rfpjwazm6XagUFztb8Pj5qQldCFPzUl37GwskSFeJLPssx+vegkxrCjce3QAXjQZHyojKmGN7cRC8NEDEC5ukggyukLPj6oOB2/mSk8RELT7od0aoivjLPTBFUyvsUFKSK7zH6WBRhW/1rsbXqlinrTvFGECn9o2fM52n9UQ2pJ3YzoQ
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bc3ca2d-7d74-4fcc-4d92-08d79edcf6a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2020 01:46:56.8924
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U3v+BsTIrGp+RKJvj2EoxXnLfmVEHXMf8SDQKR3Pqn8XEN9v1Ai7VBBszpDH+qTpcK6X846bfa5JFyEA0vLcoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5997
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

The main changes are handle the use case for single role
user. Since the New Year holiday is coming at China, I
send it you a little earlier.

Jun Li (2):
  usb: chipidea: handle single role for usb role class
  usb: chipidea: add inline for ci_hdrc_host_driver_init if host is not
    defined

 drivers/usb/chipidea/ci.h   | 10 ++++++++++
 drivers/usb/chipidea/core.c |  4 +++-
 drivers/usb/chipidea/host.h |  2 +-
 3 files changed, 14 insertions(+), 2 deletions(-)

--=20
2.17.1

