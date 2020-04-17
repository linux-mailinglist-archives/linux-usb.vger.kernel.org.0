Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 115991AD497
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2020 04:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729083AbgDQCmq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Apr 2020 22:42:46 -0400
Received: from mail-eopbgr10055.outbound.protection.outlook.com ([40.107.1.55]:59204
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728364AbgDQCmq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 16 Apr 2020 22:42:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RwLN/D20CAHyBupUOs0fmX54O+DXosN+H0k/AMfnpHsU6jOFmgaPiHcTPxtAJ5lSuZRuESQQF2gX53SoV0fZuesmLVwXimMWHHjWw1taokAyifKKCyxQrtD8aLhTcTjxtsbWkJGOshDjb9lOJTCMXQ0xIE/Fil0TONtZ/wv/Ky4fBFuH204j0RwswkBx3I6ntgGpsNIYsX6ZgeNnKddpZ3NTzcCK1TEIs2lnADbe2A2P5XJO9n//26O3FWqGALsxD/v2I7ayOKMqWAMizXDmShpT+u2PxJ1gwEcuER9LA5Lxs/R3sF0pAm07S7RJWnmS4YB3s7NFsqXW6p/nlqeb2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tO5G+FUYEEbxIM4wHsx3TNQiuTEnzPJEwjDogro91SY=;
 b=PInX35Ioxoqp+Iho9qbA25pgceYYM8kD+/zbtvbWiIwngs8bINVb9b3Hx/m2I7kxb+KXQxcOVAGm+MHYgh44BbGb61puFOWPJggfpHsIBQQXso21z3ERDcqpis9MTesKYYxLtoqdzX9Y+Gi56UWhE+vObqq8jkZuHy0BpndvSDmR6vmXh/MgrC57zHBL8abP7MU/XbZs8kcP61UgQNv7DMob2VGPO4Gs5XEOA9INiPuqqm9c5UzYEKfQoe7UD3tzQHaiUNmZZ5U+Ikzk5wiQz09Rn18Whil0zn9MDfybTzrCRuQw9Ok5syXx80SN3c6zxLXDFlNj9Sj3vUKm7kB4bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tO5G+FUYEEbxIM4wHsx3TNQiuTEnzPJEwjDogro91SY=;
 b=ensFWV+DbGgc6zmRTztETM3vcdPZJ+j81fOHoxDRi5K/LwdXfoNaOCMeBYNcZUD5At9eUNmS5m+H9u/Kf4OKM5124Bw7N+6t98abztPtCpq1s1ABHzCGNEM0AhfphaoPO/aXvKGthDTSaRBYBrI8sfu2MfDK2/Db0/lqIozXyO0=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6888.eurprd04.prod.outlook.com (2603:10a6:20b:107::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.27; Fri, 17 Apr
 2020 02:42:42 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792%9]) with mapi id 15.20.2921.027; Fri, 17 Apr 2020
 02:42:42 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Paul Zimmerman <pauldzim@gmail.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: No disconnection event for suspended device at v5.6
Thread-Topic: No disconnection event for suspended device at v5.6
Thread-Index: AQHWExEdF/RbB1xlJUuHFbQ82dXD26h6lU+AgAA+GoCAAP7UgIAAVzIAgAAJVoCAAGrtgA==
Date:   Fri, 17 Apr 2020 02:42:42 +0000
Message-ID: <20200417024302.GA24426@b29397-desktop>
References: <8a6cd6f8-b3c0-ca7b-9e69-23c68ac80d9e@gmail.com>
 <Pine.LNX.4.44L0.2004161619300.20822-100000@netrider.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2004161619300.20822-100000@netrider.rowland.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3e88edcf-cb31-47a7-709e-08d7e27900a4
x-ms-traffictypediagnostic: AM7PR04MB6888:
x-microsoft-antispam-prvs: <AM7PR04MB6888D23A72BD2F0EF7328BF68BD90@AM7PR04MB6888.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0376ECF4DD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(7916004)(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(2906002)(15650500001)(5660300002)(478600001)(26005)(316002)(71200400001)(53546011)(6506007)(81156014)(8676002)(6916009)(8936002)(44832011)(6486002)(54906003)(33656002)(4326008)(186003)(33716001)(9686003)(1076003)(66556008)(76116006)(64756008)(66446008)(66476007)(91956017)(66946007)(6512007)(86362001);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d2iXrO2cf1VFdgMbaM1XP7AaFI3rcOv3qq83Dv7L2rS1JtR433TKseVwyvd9qIr2v3yX6HWIb77OQi1EYxnebUwCMzO5l/P13vGRLoN0sw5V6kubfVdPU7eirVBloKkwxmgZmmjby6vAk2Vh21g16MAPfpGBibjfCLwvgSDdtIvdFwHFNMna0vfaJV0INO0C6FaqsOqO4s8Wev7E32SguQaMfWAwSHX+bcpfRanvosXAznPYbDIV9IjzWdjJKJjI5zUGU5BoKxWO54vM1O53LU2g7IjB5vzvNsD1ZgS6ldDX+1lFsMLGBR9Wthr130SSoMgevPbbO8zizdu009Q3O9JUel+lxdOIZwyERqmad9ZCqxMeoUVuFtI6iE74HuaEjKo9omkpurWJONsF7D+PIW79XUq/auukFcImuhDdhMrFUnnbWLJIqLMEuxlFkyqO
x-ms-exchange-antispam-messagedata: iFcyA8Zsp/5dzTdddg07KaMYXYF9xWUGF2pB7IQGccy4XXMHpz3G03y9XfuVE4r/Hc50gZRslQEAN8JpWkvcZuO4FOCRRTF4y9gfgQVa5mp5FK6XENTsJCshruYbJ3DBBXv12hNkHklpvxpKE5AV4A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C7CC7C8B6899094EACF7B206EEA02DDB@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e88edcf-cb31-47a7-709e-08d7e27900a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2020 02:42:42.5114
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FWXbobMeiUoyGQVvFHtwzay3nTCWYGrAhBqBQTouxBVAz4szWIHdFr+1+nEwTQbXDStiLxVz8zb+xkof7eDElA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6888
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-04-16 16:20:21, Alan Stern wrote:
> On Thu, 16 Apr 2020, Paul Zimmerman wrote:
>=20
> > On 4/16/20 7:34 AM, Alan Stern wrote:
> > > On Wed, 15 Apr 2020, Paul Zimmerman wrote:
> > >=20
> > >> Hi Alan,
> > >>
> > >> On Wed, 15 Apr 2020 15:40:31 -0400 (EDT) Alan Stern <stern@rowland.h=
arvard.edu> wrote:
> > >=20
> > >>> Paul, I trust this new patch won't mess up your Bluetooth adapter. =
 It
> > >>> should still clear the hub->change_bits entry before the hub workqu=
eue
> > >>> thread wakes up.
> > >>>
> > >>> Alan Stern
> > >=20
> > >> Unfortunately, my testing on this is somewhat inconclusive. I update=
d
> > >> to the latest Linus kernel, then did about a half-dozen suspend/resu=
me
> > >> cycles to verify it was still working. Then I applied the patch and
> > >> rebooted into the new kernel. At first I thought it was OK, but afte=
r
> > >> about 5 or 6 suspend/resume cycles, the bluetooth stopped working (t=
he
> > >> desktop bluetooth manager in Linux Mint froze when I opened it). Ano=
ther
> > >> suspend/resume cycle brought it back to life, but after a couple mor=
e
> > >> cycles it froze again.
> > >=20
> > > That sounds different from your original bug report.  Didn't the
> > > adapter fail in a significantly larger fraction of suspends?
> >=20
> > Yes it did.
> >=20
> > >> But looking at the dmesg log, there were no errors concerning the
> > >> bluetooth adapter. With the original failure, it would show errors
> > >> before or during the firmware update of the bluetooth adapter, but
> > >> now, the firmware update seemed to complete OK. And to top it off,
> > >> after a reboot, I am no longer able to make it fail. I did more than
> > >> a dozen suspend/resume cycles and have not seen any further failures=
.
> > >>
> > >> So, make of that what you will :)
> > >=20
> > > Overall, I guess we can call it a success.  Do you want to collect a
> > > usbmon trace to verify that the patch behaves as expected, or are you
> > > happy with the testing so far?
> >=20
> > I doubt a usbmon trace would show us anything unless I could get the
> > bluetooth to fail again. And since I was the only one who saw the
> > original problem anyway, I think it's fine to proceed with this patch
> > as-is.
>=20
> Okay, then I'll add your Tested-by if you don't mind.
>=20
> Peter, have you tested the patch?
>=20

I tested the reported issue and reset-resume case, both are OK.

Tested-by: Peter Chen <peter.chen@nxp.com>

--=20

Thanks,
Peter Chen=
