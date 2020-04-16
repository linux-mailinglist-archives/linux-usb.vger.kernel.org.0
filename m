Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E09C01AB55A
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2020 03:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730432AbgDPBSz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Apr 2020 21:18:55 -0400
Received: from mail-eopbgr10086.outbound.protection.outlook.com ([40.107.1.86]:4256
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729107AbgDPBSh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 15 Apr 2020 21:18:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k1WTu00LN/56/HnBDj/Cn+HVU2BjbKXWTAhk4JuFE2zX1sJbWf+uuWUFBweVNe4e6ftZdoLhI91XQqoM8gq8egdQSSq899W6C8ccSzsQ9AmU0fZtILkewPSaSmLg3wiTvs2fLiVtywZ3keAN46L0jGFbPRx3mVrJCkn72CH2ML5soNUlQ1BwsXoeQ800ztcMHQXVg65F6UllKvVQoMgvrNMpXIAiXiVCEk0v+nkd4rat0wIT3jvKIwoDEmCaDjtK9v2LIqkXv31Y009G0xHsa3ImmhcJ67t5nCM7+uANxqZwhRaT6M5oB/re6xT4fwZqQjuZ7xZCqnDawc40Gs9SEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NA11pcBLpVRmGKPtCV66zj1BErJVCV5hZrvA/vs0nHU=;
 b=SvwRiBy/2aUcfXkEfpozM+jOA26yiqBwyyZw1z1ASrkWpJ145Yfk7YSSWL8w9nOwhKmiOPupWBwXDuALYHsgDjPlvzHOC4uWm24XXJnO+rbphxD1D6oiQ/L41lkNNBE1aLBJNY813zt/ekElfXXYSBdQ2MhPYTZQRX2xCO4QoEHFHVFqwUqsNCnECMnXRuMmcio10IlNoBDPaVOP9QZ2lASVuuCG/H7ODz/cr1CME+XyhBADOyyqNS3LP/CFqHJ+iBpw+Wj39GuhbM+uaeC6BwaB0YXKod6rj4K0UMhtNz/dlTmURGof/NLqq0ecLxtzQTmPZNO53XHMkm1cL5UkDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NA11pcBLpVRmGKPtCV66zj1BErJVCV5hZrvA/vs0nHU=;
 b=gl+maPQNLwVk7vfus6oJ1Q4JTMjhdoMT8UF94xvnuaVhI6QF3iP6pqEi02vSt2kcx3ovkSQYVC9F2ieHu42jYpKlOWF5eym1cwQhT7kqdobwGaGG69f3KdsKdk7sN3KTpzgCR8SZgI61jpXKwjdSa7M5DxQmbCrKnhTLVw1uTXE=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6951.eurprd04.prod.outlook.com (2603:10a6:20b:10f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.26; Thu, 16 Apr
 2020 01:18:34 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792%9]) with mapi id 15.20.2900.028; Thu, 16 Apr 2020
 01:18:33 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Paul Zimmerman <pauldzim@gmail.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: No disconnection event for suspended device at v5.6
Thread-Topic: No disconnection event for suspended device at v5.6
Thread-Index: AQHWExEdF/RbB1xlJUuHFbQ82dXD26h6lU+AgABekAA=
Date:   Thu, 16 Apr 2020 01:18:33 +0000
Message-ID: <20200416011858.GA27767@b29397-desktop>
References: <20200415103232.GA5609@b29397-desktop>
 <Pine.LNX.4.44L0.2004151352250.6539-100000@netrider.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2004151352250.6539-100000@netrider.rowland.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4f17c4f7-bcf1-4069-45bb-08d7e1a414f8
x-ms-traffictypediagnostic: AM7PR04MB6951:
x-microsoft-antispam-prvs: <AM7PR04MB69518CDDC498FFF5E66791A08BD80@AM7PR04MB6951.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:923;
x-forefront-prvs: 0375972289
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(7916004)(4636009)(136003)(396003)(39860400002)(366004)(376002)(346002)(86362001)(33656002)(6916009)(33716001)(44832011)(53546011)(54906003)(478600001)(6506007)(316002)(26005)(186003)(5660300002)(4744005)(1076003)(76116006)(91956017)(71200400001)(4326008)(6512007)(9686003)(2906002)(64756008)(81156014)(6486002)(66476007)(66946007)(8676002)(8936002)(66446008)(66556008);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 48ELXS97CdqsHHRvxb13aPqGfaUZcDSdeaXaV0kZkWxyXAVLyx8r7KCWs+bgssVxj59qXW6rp20Fd0mWuVOYKDDqSKYvtnS0OCauTSRsFWjO8Do+2Pxyjhms4aypKwqjHLetvgKjbtb7zGdNtFo6WMqplKgWlZbBFkCJK3Q0dP5HlUEXn47kk8yqGIcHpJGRYhP2JJq9vIp1Q1Sr6Xi+CnjKlWw0H3KzJI4YPGMXHx86+ip+DKGG4nMDqX8RJpj6bxEbU9+HJcA76fghNsWvsv2yQ7jiMi6Bsaablgb9FhkMV2Ok/LsTt9ZXVAaxtijwq9ZNnQaHqsE7YxqCFSfeQgAW2xLTGwOz78ellndukv9I8DR/rLPHf9V9UF0AYcTiy/dxkj70xfav3QLl239kB5WAGGkbtYct+iqueDam2xld/PnYj2/4LG7BPTEzLhlU
x-ms-exchange-antispam-messagedata: j6d8tzCkV1ZasbJ91pFGade8Yp4p/qihUqJfD0l4Y5Ibv0FV+rFXflPTHKYi0JtprL4OSTlmDzA9/0IJRZ/3tjuj5tvkdVZABvyiIRgsyrq3O8qnl7dyOcWZeTcP1WB2t+k4Hz0rl4goS5PU2pMb/A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A4F941CF87FAEA4DB13518BE254E05C5@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f17c4f7-bcf1-4069-45bb-08d7e1a414f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2020 01:18:33.8159
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hlR4VHcMAigbLGY5rgP+TxuKu9eskDq0Z2WPqwxO8Wk3bOIy0iaV50F0ixpAXwGq4l+izu8QBruTVlcJLpSLqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6951
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-04-15 15:40:31, Alan Stern wrote:
> On Wed, 15 Apr 2020, Peter Chen wrote:
>=20
> > Hi Alan,
> >=20
> > With commit e5d078af8e5f ("USB: hub: Don't record a connect-change even=
t
> > during reset-resume"),
>=20
> For those who care, this is commit 8099f58f1ecd in the upstream kernel.
>=20

Sorry, that commit was from v5.4 stable tree. I ran this issue out at
both v5.6-rc4/7 and v5.4 stable tree.

commit e5d078af8e5fb0896706af855f52e9c0c69627b1
Author: Alan Stern <stern@rowland.harvard.edu>
Date:   Fri Jan 31 10:39:26 2020 -0500

    USB: hub: Don't record a connect-change event during reset-resume
       =20
    commit 8099f58f1ecddf4f374f4828a3dff8397c7cbd74 upstream.
   =20
    Paul Zimmerman reports that his USB Bluetooth adapter
    sometimes


--=20

Thanks,
Peter Chen=
