Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65E7013647A
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jan 2020 01:55:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730430AbgAJAzs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jan 2020 19:55:48 -0500
Received: from esa2.fujitsucc.c3s2.iphmx.com ([68.232.152.246]:33405 "EHLO
        esa2.fujitsucc.c3s2.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730386AbgAJAzs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jan 2020 19:55:48 -0500
X-Greylist: delayed 429 seconds by postgrey-1.27 at vger.kernel.org; Thu, 09 Jan 2020 19:55:46 EST
IronPort-SDR: /GAKQIpntjLQZiO6F/x+eudUvo3gBa3RNeHXateBZBG5PO2cI/f5MZ+ezSfqf5UyGfcWy6lygg
 88AlGCngB49IugR+LhsvIRgRVGzCRSEDUAdpJhzRhBmrwXCJlEbf8YEeSXMAzCez0Qruqobnm0
 3ceV/zfTjnfmAZCvFGuceVaqEtBGn92AIEHxkkRPi4BpCOELMrDIjcZO0rHTXkSxgXWbx8mBx2
 bQwd90gg24q5EBIUWWa4/yfIqJO5z1Qu4p4TqqRt5HgYLG1gxSdAW3KyNBxd5jtyrrF6L9nOG7
 xlc=
X-IronPort-AV: E=McAfee;i="6000,8403,9495"; a="17441808"
X-IronPort-AV: E=Sophos;i="5.69,414,1571670000"; 
   d="scan'208";a="17441808"
Received: from mail-ty1jpn01lp2052.outbound.protection.outlook.com (HELO JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.52])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2020 09:48:37 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+pcZ3d30agsR80H6qPUuKdvPNKnnRumKx4dCcDiASN7BVoAEtqFEGGvViBr+mMMf9iv2CG7EcOybFtQCBQ+ZaWCaexn8bnWxE5vH3ZOjM6ZQZ60+voBn3bZXCNA1p05BPSPSBnkBYzz37M1DcsW7+YOypVSWp+qkgQm8nP0RWYxIODrrdq4C2X4UPQTA78YtX6zO+4bpyxLHiijEKmsZpOt2n5zsvbO0f86tHLHR1QtKjkrqYrou0CRBL8k7ZuI+/S0ALfSX9Vke/G4DykICeVOlKw/dvFHwwGh/xBBBNYh56mTOoajlLWXw33aofZUFnhj1OUYHJDfylI+m6A9Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dinsda6dLUFm3C+outoUFysMUsUXK67VSEbeYnlpOoI=;
 b=EDhBnGvSKRIKbQe2PXl6pykXYLaOkOdrLovD8vN98RwBqILVBLXeL3ZDmL2xskAb09htqadGBOaTtCz4jM7Szxp6z5dj0l53jpEe1o5NgBc36KGafbsl60nU9/wkyA0Zooh5kilqTt+BTsyHs11Z74JRdxuu9l/VuyahHiWThjlMiJFDag4H9muZABToJQhWffnxuoa0Y1iET6RT3I/HKLQ19avATGtkl54P1AwG8Sv2ZM3ZkW9DHaiRIBgsvHQVMJghY8lNgiOEMKrKIS+0H4rDU7t5A43r37lozDIIwfvvWn8javJURPQwJfqYTZz4Gcj6X3UBqCk8qPFncSAA3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dinsda6dLUFm3C+outoUFysMUsUXK67VSEbeYnlpOoI=;
 b=SXaiMgmEyBsVeYbL2FwCxnCCvy8U0P4qV/BRMfO5W2E2mYfrdVvl6ELrybGUtLk8ZLyVshakDVDfinMENJ9EUTu4PFgtylt65cFBwoTZ6cP0sCVRTZwZ9DDaweRC49yQ9YPb61z9GH9K47vg4J2qFYkUMtb5LSx2lN6+kdNKcxo=
Received: from OSBPR01MB4104.jpnprd01.prod.outlook.com (20.178.98.215) by
 OSBPR01MB1797.jpnprd01.prod.outlook.com (52.134.225.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.12; Fri, 10 Jan 2020 00:48:33 +0000
Received: from OSBPR01MB4104.jpnprd01.prod.outlook.com
 ([fe80::281b:3405:4509:a915]) by OSBPR01MB4104.jpnprd01.prod.outlook.com
 ([fe80::281b:3405:4509:a915%7]) with mapi id 15.20.2623.010; Fri, 10 Jan 2020
 00:48:33 +0000
From:   "nobuta.keiya@fujitsu.com" <nobuta.keiya@fujitsu.com>
To:     'Greg KH' <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] usb: core: hub: Improved device recognition on remote
 wakeup
Thread-Topic: [PATCH] usb: core: hub: Improved device recognition on remote
 wakeup
Thread-Index: AQHVxqviaGnGHXER10+DbqKmyqCSRqfiepMAgACVLhA=
Date:   Fri, 10 Jan 2020 00:48:33 +0000
Message-ID: <OSBPR01MB4104AF84C96E5199B6A8487285380@OSBPR01MB4104.jpnprd01.prod.outlook.com>
References: <20200109051448.28150-1-nobuta.keiya@fujitsu.com>
 <20200109154630.GA549548@kroah.com>
In-Reply-To: <20200109154630.GA549548@kroah.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-shieldmailcheckermailid: 6a00980a3b93439a9eccbfef81a02074
x-securitypolicycheck: OK by SHieldMailChecker v2.6.3
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=nobuta.keiya@fujitsu.com; 
x-originating-ip: [210.162.184.116]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2011a112-f62c-4d03-7cf8-08d79566d1d6
x-ms-traffictypediagnostic: OSBPR01MB1797:
x-microsoft-antispam-prvs: <OSBPR01MB1797E8C954FC37F2C035A2EC85380@OSBPR01MB1797.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 02788FF38E
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(189003)(199004)(55016002)(4326008)(5660300002)(85182001)(6916009)(9686003)(76116006)(7696005)(66476007)(66556008)(81156014)(2906002)(6506007)(33656002)(186003)(478600001)(26005)(558084003)(64756008)(66946007)(81166006)(8676002)(86362001)(316002)(8936002)(66446008)(71200400001)(52536014)(777600001);DIR:OUT;SFP:1101;SCL:1;SRVR:OSBPR01MB1797;H:OSBPR01MB4104.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sm21VlNdiM/fTiaSOo9fHdndIRiWWG/JmhQODR5g+4CGPAggkCif+uQN6KR38odfeqEuCxHic0y15Jwhe2qedZkzDbr6U6XKZFlZEvN2dGK0Y0sJZ5u/jKZhIoGjI/bw0Cb2tzCy7O+5IRQ2ekyAl24V+Iy7VmCkBp3Ki3svqNDMFgvIxaXk+K1o9fb4iv++d6ivk6rfrRcjBTuWQAqieWWWPjXqHBMa0AUeYHBxd41eMGOqSx3Ny5Ngtt2GrwvWCON3ZGkkVhKOqQQhN/CTKR69uc3tf8mP3whli+//EVzNp8jyMZVVdmBnVUUPm/mrVqXUj8PIbxVX1CGQcE+1RgQrSPTBTtMDoDUvUV2P8sC3iaMb1FjJfSmQlTpjSFCGCWGtPSCXJe76/2MVwatmyXa+RmYJB4u6z/WFxE7E1YxC6WNsx4Hphg0uLE120YVuSL5cINFxqTpxkTciSowBwva5KBJV0mc7iMsk5arM8+79ILahE6QeDlIW7xYfsx42
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2011a112-f62c-4d03-7cf8-08d79566d1d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2020 00:48:33.5062
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ici2KKsJXrNduCobIxnHopgb4iTcbb7H+IQZik4qB7yUlhURmGsQDa3jYr/yKgJi/Gq7EXfuqHvpc+uGXlYw04lJZYewAOXCPqatHF3BL8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1797
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

> Is this something that should go into 5.5-final and the stable trees?
> Or is it ok for 5.6-rc1?

It is ok for 5.6-rc1 (I'm glad it goes into both).

thanks,

Keiya Nobuta
