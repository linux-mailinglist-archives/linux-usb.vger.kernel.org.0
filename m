Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02EBE2577D7
	for <lists+linux-usb@lfdr.de>; Mon, 31 Aug 2020 12:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgHaK74 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Aug 2020 06:59:56 -0400
Received: from mail-eopbgr60069.outbound.protection.outlook.com ([40.107.6.69]:39648
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726042AbgHaK7z (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 31 Aug 2020 06:59:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FlZ1kK5TRqeYvfs3ekd5oNcR2tguuXu+mVjo3dzCjbZz10zc05H7ew1PFQkO6Hpn1Twp8Zee7gTR5nFoTDRFG7qjQWmoF+Rl3lirbfH8b8AMSKPoWkHLG7DNh7Iz9jKqCd38eUhCNCRtJSgUcDZhprrQu4FMPnkW3ed8/uoqHxtctV1Ia4zlmLawaHmZVqxnubH6vxBnCY3rfSk637/+bEH1yF+gpR7uC4UzxqpJtZN2aNEZwFOcI8TZaayqmF5P5rvG6tk2HQrtxF+k6oEjZEA4Izc7iHvNicpkOdtMa5r/Rnr2tpIp8+fFkZna+An5xl80aCWUfXN+NplBYjz28g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GB+H7jod+dCsneEKkx7PI9STlg/FywjH3tX3arGK3nQ=;
 b=mTxD37nx1AlXxgc9lFn6Vq14b3E4VEw319y371g5G4IR22M5X4qelyFbm2saz60JaMhge8ySYBwf+lAsQGrKNpX896s+TFs6dclbEYER+Ndzs5BtpwFWmYbgC6VdA6coM72TrND/2rTRyApUU67baf2WpJ2HyTVjKS9nUwMbhuR530x/5Mbk8UQvDaw86xjGgOTR9JVYHf1DCkuHNpsikZMdbeTACl4WNUX53/XM0I9tZcbr2wdX8zAA5YhDIwQpdp4+VuyTiX4AiTzmGw58BuDeVUz2X/+2LcmBcBsSeEgjUmpYJm1PvMoi3HYq0BXPxS2N4KllHDw7Ag50QeYEHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GB+H7jod+dCsneEKkx7PI9STlg/FywjH3tX3arGK3nQ=;
 b=Ob4X/DQyxz07uS7TgxcedS/H3PUfedAnGZs3Ud03N24T56bEvvOqemEVLDBDHVUXWOWFGCU44jX0zGfiukOGCJZJoWMJ7fvdXWotqSTQ1R81xVs7PeqCQpsHR6j6qUObR769O2LHSp6VDMdAiQyWF1dAu5koTViTCSR5lPqavmE=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB6149.eurprd04.prod.outlook.com (2603:10a6:20b:b5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.22; Mon, 31 Aug
 2020 10:59:51 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 10:59:51 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Felipe Balbi <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH 1/8] usb: cdns3: add runtime PM support
Thread-Topic: [PATCH 1/8] usb: cdns3: add runtime PM support
Thread-Index: AQHWMCRWhpIqhwoQLECGA5g5M95pL6lSmxmAgAAPWjA=
Date:   Mon, 31 Aug 2020 10:59:51 +0000
Message-ID: <AM7PR04MB71572A2B1EDC6D379B1CBDA88B510@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <20200522103256.16322-1-peter.chen@nxp.com>
 <20200522103256.16322-2-peter.chen@nxp.com> <87sgc39ls8.fsf@kernel.org>
In-Reply-To: <87sgc39ls8.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [180.164.158.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: cee22662-cf1e-4cd3-7d6b-08d84d9cfc42
x-ms-traffictypediagnostic: AM6PR04MB6149:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB61498178EC224810A49C7F268B510@AM6PR04MB6149.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v+0BLKnNw5qW5tQZYR0qKdBZ8zhv+EtdYKvoM8iTyjOFouIPcnKtSRmQFBqg5WkBRcHcIf6XoRwUG6N1DFoXXisjJ/tHLyMpCFDOMzVWZpboIMGcnElPubrdPOYSyOT+M158sEX/ghVpSYlaWJqj7MlPPKA+vXAmQaWL4dHF6xY4btaxOt83d0wsKeW3EG+1r6gQBvo8m/cpiTAsX9qOp+qI+RWGtUxX+6AMk+pmQOC6fbzkxTyKTQfVrPPFWhnKTi/qyWUzA+5OTnvbGTIs4PHqQmV/APLISCUbJg8lGi5l40146fLY0Fvr5Rk0Y9YMZ6e967vvv5KXKzZZwFzgYw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(8676002)(5660300002)(66556008)(8936002)(66476007)(55016002)(64756008)(6506007)(7696005)(33656002)(66446008)(9686003)(110136005)(52536014)(4326008)(71200400001)(54906003)(83380400001)(86362001)(44832011)(26005)(2906002)(66946007)(186003)(316002)(76116006)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: tOWw0TANANu3k/f0m2j5bX7/+/Vnw0PzlyaYV8EaLnuekrJKSp833/XeW0qcx0B602hfkvytd5wNxCBTYD2xuONeELkZIJ7W7nmgbo6pjdYp2qzy1bhv5ge520X3UJOy6p+RyPjBDpTnLriV0VXH0TVwK+dRdMy1hkHjLCB4wQ8KmXX5rmUAlvM1rT7Hf3pqmHbrFvMkxTGPkHSQOwmwDU6Z9J0FNi9fYHM63c3+fPyHwvh1OnWq/DhvjVd76XF+Bp+T4XLn/CYYL89FJUY6HnILeiFr+VL/WLcW64awmW4Q72a0+4f0tQoqq24VkoV4EAhNZbRtN9FrqngopAHLUmoOxkpx5PmbBGrCIYBToV3VEiWzlOdV7ErHeY6vdw/Fuy3N+kib0F1cdnIT7kyn7amePNxnvMsEgFMoQloLditWM4aAXLi3SbPuzC0MJd/c6UQiLj3RtqSHzjEHq1GQUCowRdgYrdjz7CqKR4Z1xFCs6yIJclTDS0AUZkrx3iskY/YCfRAIMgUQaWKg/GDbEKCDXs5sj0pbFt8kwy+oYL7GNRsZ8fTpwFepLxHBIaC0AEvxTEQrOzwJmK0RgCBaxyrwiTba8D2AuayboIp9dTuIFejvRPthPwThgLHTFXF3NmJ+c9pi+IIYcuAUH5bL0Q==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cee22662-cf1e-4cd3-7d6b-08d84d9cfc42
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2020 10:59:51.5049
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ot16xBgywzXB8VCpdsyz0pdBAF03LpxNv4M7vtdHCeeXyTQdz4CV9Bqr4/pCmY++oaF726TgNiFPe+HvNtMuFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6149
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
>=20
> Peter Chen <peter.chen@nxp.com> writes:
> > Introduce runtime PM and wakeup interrupt handler for cdns3, the
> > runtime PM is default off since other cdns3 has not implemented glue
> > layer support for runtime PM.
>=20
> it should be left disabled by default even after every glue implements it=
.
> Enabling runtime PM is a policy decision better left to userspace, IMO.
>=20
> > When the controller is in low power mode, the lpm flag will be set.
> > The interrupt triggered later than lpm flag is set considers as wakeup
> > interrupt and handled at cdns_drd_irq. Once the wakeup
>=20
> This sentence doesn't parse very well. Do you want to rephrase it?
>=20
> > occurs, it first disables interrupt to avoid later interrupt
> > occurrence since the controller is in low power mode at that time, and
> > access registers may be invalid at that time. At wakeup handler, it
> > will call pm_runtime_get to wakeup controller, and at runtime resume
> > handler, it will enable interrupt again.
>=20
> Then what? Are you going to, somehow, process pending interrupts? At what
> point?
>=20
> > The API platform_suspend is introduced for glue layer to implement
> > platform specific PM sequence.
>=20
> I really think that's unnecessary. Why can't we rely on parent->child
> relationship for this?
>=20
=20
Hi Felipe,

This is the old version patch; I replied your questions at your reply for n=
ew
version at last Friday, thanks.

Peter
