Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF9C114B2E
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 03:50:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbfLFCt3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Dec 2019 21:49:29 -0500
Received: from nat-hk.nvidia.com ([203.18.50.4]:43712 "EHLO nat-hk.nvidia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726806AbfLFCt2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Dec 2019 21:49:28 -0500
Received: from hkpgpgate101.nvidia.com (Not Verified[10.18.92.100]) by nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5de9c1b50000>; Fri, 06 Dec 2019 10:49:25 +0800
Received: from HKMAIL103.nvidia.com ([10.18.16.12])
  by hkpgpgate101.nvidia.com (PGP Universal service);
  Thu, 05 Dec 2019 18:49:25 -0800
X-PGP-Universal: processed;
        by hkpgpgate101.nvidia.com on Thu, 05 Dec 2019 18:49:25 -0800
Received: from HKMAIL104.nvidia.com (10.18.16.13) by HKMAIL103.nvidia.com
 (10.18.16.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Dec
 2019 02:49:25 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by HKMAIL104.nvidia.com (10.18.16.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Fri, 6 Dec 2019 02:49:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MCIL1TpYXVT5p8vDULKTWTU4sX24AwTx2P+mlIH/g85EsJbH54l9J+ZE7sTARXJQrXfFJUvU6zsjifrZtJ6OL5Z43ERm69C/04cF6hj5sTvvYDfYwa2/cjvN+TdLQyGWdhQ5caideaWh9azZYJhzTW8sf7Pw4JpkF5IGcQGtMNp4FrVX3nRuuWld4JmKZHWQ68Rc29i4j0OwSSuogB0Fl1O8iWMvI2FZkG6vr22SxDBFLL7nlM3SK0JF/qkpd6VkyV74MjjB99n2fnEiWMidauv0wsDvjpzvk2y40Wr1RMOIelRyRD8TUGL5WB9Ln0OSN/bEdgkOw481W1cw1L4z1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1HrtIEwydgswEd0qVDWHajIpDeeNCF32zsbcU0UZEc=;
 b=F37yOKabNu49jkNOLYXRxYHTQDGN6sElCY9hm7W1pO5xWpR7+3cTEuhuc/3eAdcYlj2P2nIew6nAtT+fkFL6lC/XcDeii6PiPegKKt8mljKzfPgXZGqRH9X7JEzho5S04JohYAthlwA7XJLzbBhBRnQ/3smu6eEUWm6aCGZNz5bZVQ+IgpahB7LyiwRx5Pj7J5odjTCwBKbQh0In5KE7GdLp4U9WtUUKGP7JGOiJM0W4gHT27X9iSjC7qPA/eXXAT+KDCzByB9zjmbgzIJEruj+BUvhXWUaO8AXwvdPDapPCi1Pkm16v4atZRoaUChSI6J5Forl7c1wHnzxTAM7YlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from MN2PR12MB4126.namprd12.prod.outlook.com (10.255.125.12) by
 MN2PR12MB3021.namprd12.prod.outlook.com (20.178.240.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.16; Fri, 6 Dec 2019 02:49:23 +0000
Received: from MN2PR12MB4126.namprd12.prod.outlook.com
 ([fe80::2572:7735:8756:b5f0]) by MN2PR12MB4126.namprd12.prod.outlook.com
 ([fe80::2572:7735:8756:b5f0%6]) with mapi id 15.20.2516.014; Fri, 6 Dec 2019
 02:49:22 +0000
From:   EJ Hsu <ejh@nvidia.com>
To:     "balbi@kernel.org" <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        WK Tsai <wtsai@nvidia.com>
Subject: RE: [PATCH v3] usb: gadget: fix wrong endpoint desc
Thread-Topic: [PATCH v3] usb: gadget: fix wrong endpoint desc
Thread-Index: AQHVqnVfdqrGApTTNkSKTKfO4HSvBKesaZLg
Date:   Fri, 6 Dec 2019 02:49:22 +0000
Message-ID: <MN2PR12MB4126A38922971576E429A7EBCF5F0@MN2PR12MB4126.namprd12.prod.outlook.com>
References: <20191204073456.57616-1-ejh@nvidia.com>
In-Reply-To: <20191204073456.57616-1-ejh@nvidia.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ejh@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-12-06T02:49:20.6036059Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=b7ce0e37-821d-4e46-8bec-39f3b0528030;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is ) smtp.mailfrom=ejh@nvidia.com; 
x-originating-ip: [59.124.78.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65228996-8db9-4b0b-6509-08d779f6e65c
x-ms-traffictypediagnostic: MN2PR12MB3021:|MN2PR12MB3021:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3021352CF0ED0A1F139358E6CF5F0@MN2PR12MB3021.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0243E5FD68
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(366004)(346002)(136003)(376002)(396003)(189003)(199004)(186003)(11346002)(52536014)(86362001)(2906002)(26005)(316002)(66556008)(66446008)(558084003)(64756008)(66476007)(66946007)(76116006)(33656002)(71200400001)(54906003)(71190400001)(8936002)(9686003)(305945005)(55016002)(7696005)(6506007)(14454004)(102836004)(76176011)(4326008)(478600001)(1730700003)(81166006)(81156014)(25786009)(5640700003)(8676002)(99286004)(107886003)(6916009)(229853002)(74316002)(5660300002);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR12MB3021;H:MN2PR12MB4126.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z9iw9xTKvF3QmeXlYbWlqw8B98n2kPLT3Z0lOed1jRwGssBo7vpqbF4N0Na0/UQXROpilR1rM7XVIlnPLME42GQOxPpjD/n6Z+5XBI52/pIiSttrdJNAgW2ML5G7eGyEdDv/znKLjkMKypUoKLKbuCNokZByBjNb4t/dsabkSGERs9jZMUG7rbS/I9mozrA/J9DNEMMTgUfL3YnA49cum/y0h/K4LeAzUePaPKaJUcJYpT8WEc0kx6+KVrLcma8LtNFGCSqCRV/wtgWidvfivwCFDloCgMn9tLDmqE6+TI3tGgQq91ptiua08fj8p3bnNGXiS7E2iJmMQ0Npmv8gBU44HCr+kIQqpn7003OkEaxh6z8queABETl+dMGY1ZIK05LuKp67ldzMuj7XgZpBJH01maxrCaetLspYfV3d+lwy1ks6kS3OHjPXe8fXRKFQ
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 65228996-8db9-4b0b-6509-08d779f6e65c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2019 02:49:22.8909
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sLSKcrpSb49evagPIv1Wsj48g6HIFSs889puSrsCP0KIAD7pZHKiEdfsxCPvHolM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3021
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1575600566; bh=I1HrtIEwydgswEd0qVDWHajIpDeeNCF32zsbcU0UZEc=;
        h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
         ARC-Authentication-Results:From:To:CC:Subject:Thread-Topic:
         Thread-Index:Date:Message-ID:References:In-Reply-To:
         Accept-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
         authentication-results:x-originating-ip:x-ms-publictraffictype:
         x-ms-office365-filtering-correlation-id:x-ms-traffictypediagnostic:
         x-ms-exchange-transport-forked:x-microsoft-antispam-prvs:
         x-ms-oob-tlc-oobclassifiers:x-forefront-prvs:
         x-forefront-antispam-report:received-spf:
         x-ms-exchange-senderadcheck:x-microsoft-antispam:
         x-microsoft-antispam-message-info:MIME-Version:
         X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
         Content-Language:Content-Type:Content-Transfer-Encoding;
        b=TTunSMVCOK3K4NGi0kFIC2r5tqdW6PXwz/asLR4+dTn3jnYZ/kS0Qaj8u50cQLPFw
         ToheFMAuVebfKf3DeSoddqxlpLPslZ88edl+Zk23uRiou4gFc5QrjXPXRN8VmSSnNB
         vqdjKHfV6jsy7XHcE6gDRVr3ztvWiquyi2X+YHtA3EimDd+srdRbJ0sbpl7XgPsboo
         Zff1VbPGHSNvHxY8utnNGo/6n/ZhYYxqEdIj/g6jawI/T5omwhWHb++g+f6KEN8Gk7
         ZgRvNCvpcYl4Ms5bJsQaMLNL+MnMzCAKCNNDK8BaXv2NO5NVHkYNn08RQ8QCOpTPgJ
         WE19aFs3zVJyw==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Reviewed-by: Peter Chen <peter.chen@nxp.com>

Add a "Reviewed-by" from Peter since this patch has been reviewed in v2 and=
 only typo fix in v3.

Thanks,
EJ
--nvpublic
