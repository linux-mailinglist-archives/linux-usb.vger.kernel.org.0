Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6152830B612
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 04:53:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231344AbhBBDvl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 22:51:41 -0500
Received: from mail-mw2nam12on2056.outbound.protection.outlook.com ([40.107.244.56]:64456
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231324AbhBBDvj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Feb 2021 22:51:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/9K1jhKEgTgNiwF+UMIl9aTG2ZhprMunfhBZxCaHkGH/4jqscPh1GWbo4nfH3PfL3geJgSTqORG7a1wfwMd3o1/TZCPgKA77VFeBncWT7xDTy6yCz3eVlbXfx/aiv7CcDoIax5JVzf7+MRzHnXaIkbMfiqBecNOsU0bMhyKi1gg2AxfFNkaL3+QE4f+WUDBP9I6pPVQCkpCqCGxj02qwBXlcdPdEPm1YbGREOF6F2A19/+4uLlzV8ZD0Bp590/tQzOqbRJJdxwhh1RJKzHkEbYBE9TsahKreOqFAA3Ryikk+REadoBbl50aCMm7HAZYlKkooUXS/7Ke1BG1FfYDVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32+hKVzxDi6wsQIqMscq5zqtxUlWf2BB9cqWASjNFzo=;
 b=X+vfdCbOG0bGLEoWoTvAx2Nkmhm44X56lPT0pX48wCtfOvG9m/B4ZQSILW/Yvtci+X9tzgVZqp83t/6PBca7YNTjNDFcU4PHNYQf8wIFJKDNVEm5zs9NVz6aVDJ6+pLyDlUXrK0c4QKKfiy9U937elmUfzy+QkPJNCzhNJYkRrypcvAUucKNyWk+G0ZjG9OKg8ekAZaXgsyIpYsvnl6wHA++fbmJ96Cef+tCTgP7rKKUeV1bGmAWiNWR2K9v2kxhYRkBMKbK9tbTU956flgWrQyLR4seSK/N71EGCl+iflMz4EGycQrpiJaDkUxK3Y8M1GpaKpr8/3GFtA9VsyAA3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.onmicrosoft.com; s=selector2-silabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32+hKVzxDi6wsQIqMscq5zqtxUlWf2BB9cqWASjNFzo=;
 b=O/SFxOZNxDDQAKLtwKeVT2YsIT/WrNcFV6jzSlCCInGAPJVPwBX+mA/T59BZ/JUMgFDf6RejMF6zdCGUkxbOEzOzDm8t42iPeUtU1RTB4tGyYMejcNDrWy7H/LJvs2EcKm6gKkybpdftaKO3DvKr76o47sgawZ8638EoaCaow3k=
Received: from CO1PR11MB4882.namprd11.prod.outlook.com (2603:10b6:303:97::8)
 by MWHPR11MB1518.namprd11.prod.outlook.com (2603:10b6:301:c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Tue, 2 Feb
 2021 03:50:50 +0000
Received: from CO1PR11MB4882.namprd11.prod.outlook.com
 ([fe80::8577:b56c:df22:b00f]) by CO1PR11MB4882.namprd11.prod.outlook.com
 ([fe80::8577:b56c:df22:b00f%7]) with mapi id 15.20.3805.027; Tue, 2 Feb 2021
 03:50:50 +0000
From:   Tung Pham <Tung.Pham@silabs.com>
To:     Johan Hovold <johan@kernel.org>
CC:     Hung Nguyen <Hung.Nguyen@silabs.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Pho Tran <Pho.Tran@silabs.com>
Subject: RE: Bugs: usb serial crash when close second comport
Thread-Topic: Bugs: usb serial crash when close second comport
Thread-Index: Adb4crZThI4kYMAnS3uhwz9Hcje1rwADnCSQAACjTQAAIvLfEA==
Date:   Tue, 2 Feb 2021 03:50:50 +0000
Message-ID: <CO1PR11MB48821E7544DCB4E06665849481B59@CO1PR11MB4882.namprd11.prod.outlook.com>
References: <PU1PR06MB2117988A6B7680CA1806DBE091B69@PU1PR06MB2117.apcprd06.prod.outlook.com>
 <CO1PR11MB48828958BDC51E796D37D63F81B69@CO1PR11MB4882.namprd11.prod.outlook.com>
 <YBfVqOwEZfkvX7YA@hovoldconsulting.com>
In-Reply-To: <YBfVqOwEZfkvX7YA@hovoldconsulting.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=silabs.com;
x-originating-ip: [113.190.252.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9f60008-2cae-4023-1b5b-08d8c72dbb87
x-ms-traffictypediagnostic: MWHPR11MB1518:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB1518016BC94A9E6CC4BC8AB581B59@MWHPR11MB1518.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mqQy6da7o6y3Nm+ginF8gwTjmmKCjJESQUMJMgiOizhvltefbmHkHoxcQWEmQNZKNK98dQU7XPNb5IulrCwBoGNwPPaJ23Hy+yIXHlI4+xmkzI1Vuw8upoVRtFyfmlJAM/0n7W8tFCY7b0PwNanCWC2+pizNN3pikhbwDWRu9PVgf4Z82fcRSuy9Z0WK77ZXtbP3+gFCOoOUpO9b2NNIHgRKu+nKxdHXJ5fNBghJI+weFbHgVZzXT1n0NUM/3dxSW1VHPZSMBot2O1YaAseDDGMedEJYnCMRtRGiTaVlUFv7MlusyIg/Dy4zW5e+GBubdaQeH031HJhyysxbJoPOH/4K5vwZGBjBBy1Z0Xmf7J3+XHi0onD08Bqz/j9++tI9dTf4q4abKQFFOsR51NrWsY3Z/34z4FGSsgujJyc8J+s6KdEkQEZCeHDQctHEXxR31PTfL42CKUjlXd8urcWozCCkHPii9XGz2cwRqX38BafAHYyFNfJ9pa5YC2p3FDmlD3Y/YiTjzwghehE8ZKPMGA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4882.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(346002)(376002)(366004)(396003)(136003)(316002)(71200400001)(186003)(66556008)(9686003)(7696005)(54906003)(83380400001)(4326008)(33656002)(55016002)(8676002)(2906002)(52536014)(478600001)(6916009)(86362001)(107886003)(5660300002)(8936002)(64756008)(26005)(6506007)(66476007)(66946007)(76116006)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?lH1sK7jHSTy0mHwSxVy+QNfvSgC0v+C4dEs65bwlbWmvLeE7FopT6oobiA5J?=
 =?us-ascii?Q?nfsJBk/TANRb+0BycqnPPuGDGyYwMmLDrPRq4IbjkDQMm97Zye5Sp/eX754S?=
 =?us-ascii?Q?EKjAnRxc86eZSCgxjcjQFtH3FylWsQj37dAAxiajrMl/JxeL9CQad4kj/nCG?=
 =?us-ascii?Q?rLWstUC0veewWHdVroB8r2uf190kYk4r3L8SeCwpnNTnu5J85YicaGIjNauH?=
 =?us-ascii?Q?T1s0yqfYWKF8p/JwjNu/CUzgRL6Jl8JuPJUbe9/mSDyEwBQtvfi/l7Jgl05W?=
 =?us-ascii?Q?wXn6Q1YS9P8hULg5FXRZ00B+KGlE1kAw+tpow12CZzs1QmbsPxFXHxNstaiL?=
 =?us-ascii?Q?L3YZnme1DlKcnZAf/+hETDZirp56b/ghYAMoixcsIB3dm7de30i7S3xH5Nab?=
 =?us-ascii?Q?/vN1tR+ZaOmDiJsBOnPLI8xnPlqpHFLiMoEAUq0J1j/9vgxcKAQoOCYmb4Py?=
 =?us-ascii?Q?+N7VNdLOchCMh82mbQEnPq+nJwcYUF/asAaYUJg75anZNQZ///BhEnmJ6G4q?=
 =?us-ascii?Q?ND2GcvmA4oaw+0pWGj3+FAPwPSWI6VrvqAj3BBRG0W9Xej4HQAXTC6+H0LUy?=
 =?us-ascii?Q?b2rzKmoaju9v0t6bY3NPiC7nmtJD16MNRH8BOoGBM8mrOcWpEVzZtYmHIzdx?=
 =?us-ascii?Q?xqNX93ZTXDydK7azxFV29/CLJaEh0eZZixceKjp0smUna3np12Cu7AEg0Cp9?=
 =?us-ascii?Q?7GO6GEsaCus63tquwvrFmCq9ywjKCW1n6QuHFIoznLeEXsZg9IFS6YdbpvAD?=
 =?us-ascii?Q?N50cSCXnUCfS7DDtiGkU/tXQNP1+bDLV48FKCeWuhLNI2QGYzR9N6hQNT6I5?=
 =?us-ascii?Q?nqGizjNvzlebfrd1Nui6zzJn3nTbJrICvF5aw35sHSF0D9vtGcbYn6Wy9FDV?=
 =?us-ascii?Q?kM/y6m4o6afAYW5iDmEl4xdvdbfgLanaYgK+f+V8iDz/XcGCfrK7Olvy/DDY?=
 =?us-ascii?Q?emYXUcPHl8k4R7TXLA4mtZZPE9NDXvwjnRNmyVdOzwlSGrjN+cLG17gj8laK?=
 =?us-ascii?Q?jvWQihF+7tw8IFrxFyNR1Bwb1yYW+XJkmxRKRRN/AKjO2qqREKkv2/pDSzLd?=
 =?us-ascii?Q?yfllzNix?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4882.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f60008-2cae-4023-1b5b-08d8c72dbb87
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2021 03:50:50.3996
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m9xQh2QHZAcgZfGV1KMNKvV7WQpW/0ZiCPn6vVnfwFZ8iGBpzn1v0JtiIp0cuNPbPI02rw55kk22DY/6pJBNyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1518
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dear mr Johan Hovold

Can you reproduce this with a mainline kernel?

Otherwise, you may need to bring this up with Ubuntu.

-> this bug doesn't occur on Ubuntu running on pc, it only occur on raspber=
ry.
One additional thing: the bug doesn't occur with HUB: Orico, model W6ph4-u3=
-v1, Manufacture: VIA Labs, inc.
It only occur with hub: HB-UM43 hub, Genesys Logic, Inc.

This sounds like you could have a problem with the host-controller driver. =
What controller is the RPi4 using?

-> For the Pi 4, a fully-featured host controller drives the downstream USB=
 ports. Downstream USB is provided by a Via Labs VL805 chip - that supports=
 two USB 2.0 ports and two USB 3.0 ports

As you write above, the usb_serial_generic_close() is needed to cancel the =
outstanding URBs during close so you can't remove that.

But my guess is that something breaks in the HCD when unlinking those URBs =
when connected through the hub. Do you have a stack trace from an oops? Or =
do things just lock up?
-> I don't know how to capture stack trace?

Tung pham.
