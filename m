Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 261A3303D0A
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jan 2021 13:32:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731806AbhAZMcE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Jan 2021 07:32:04 -0500
Received: from mail-mw2nam10on2086.outbound.protection.outlook.com ([40.107.94.86]:14689
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391041AbhAZMbO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 26 Jan 2021 07:31:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fbLuEHHquLVj5Gbl0YXJkusxlJ5pcN/pox/1ORXSoK9kVAJJs1Yx0hGaavVzgeAmsUr/qSfXMp62tnsUf/BQUkooxL9qOKpHVKpUb9xdAzbu62QLoF6TD+dOQtIThBF4i/UGWNEid1vD66+m4qEQ742EnL8z6bSSAsMR6dfu36x0xI7SGixDSFOP7hN2O98aIgQJrFcevKJyvnhZG9Avnjmd+BVTQsZLUETjP5nEGh3Yoeid561OjPy2T/bQxpx5TGON1y/QVjGXv3It+aeb+JcgAeIky5W31X6hsQidvNXdJyxJZnT2bMO9Hp62YczKrwACcP9p8BME6TZZPlgT1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RyBRnTihuRsftUgeXN8KaUvWDO1DTm8GxSPcn6rdCpY=;
 b=MGgopFusLkcKeL37DgfVvCuqmnF8j06/uBdCx8/t0sHsQ6oa7IJi262Tn0Dngi5M523KIhJfrl5Om70qg+NZpODSf9CgN8CWXoWRd0BbKdlK3CO+hCvvrdIgKdetMdPbVJyllILtpODdEdrnE5l7c2Jdv8sE9rK9zr3DE8oqhTRtU+4GuhkEa6KrerUIRX63WD9BwjX7fw379fdRk+ag+BUPghKZzKfM677PTodeIEvM6IfdXMarkH14YNnwNSszROdqOGOGNX39lfj60OXdwDK8+Fwnt4LtzjWP6uWhnmsimFicQ1L6SBCB5rSiuoGIxbrAxO9se6r0xnkHIAuWYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RyBRnTihuRsftUgeXN8KaUvWDO1DTm8GxSPcn6rdCpY=;
 b=YD9QAS/bjYHjI2uD9llbxAOLxWwykUy4WGkfcyKUUs0T3o/9Ob4gvqOFcdF1Mq8ematnX4dxpIpFiQJiuxeciKHdoD2YZv51aFIzrnWI1BnEo2bZmNarFb0MkHiImOO5VPWHGR7ZPZCNqtY627kjYSEeRzaqrOMiZW9oZ/bfVUE=
Received: from BYAPR12MB3238.namprd12.prod.outlook.com (2603:10b6:a03:13b::20)
 by BY5PR12MB3796.namprd12.prod.outlook.com (2603:10b6:a03:1ae::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Tue, 26 Jan
 2021 12:30:12 +0000
Received: from BYAPR12MB3238.namprd12.prod.outlook.com
 ([fe80::6daf:7d00:b03b:8a16]) by BYAPR12MB3238.namprd12.prod.outlook.com
 ([fe80::6daf:7d00:b03b:8a16%4]) with mapi id 15.20.3784.019; Tue, 26 Jan 2021
 12:30:11 +0000
From:   "Liang, Prike" <Prike.Liang@amd.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>
Subject: RE: [PATCH] usb: pci-quirks: add XHCI_COMP_MODE_QUIRK for disabling
 amd xhci D3cold
Thread-Topic: [PATCH] usb: pci-quirks: add XHCI_COMP_MODE_QUIRK for disabling
 amd xhci D3cold
Thread-Index: AQHW7gVV3ApciWvP60+Oe5Ez24fdsao54VlA
Date:   Tue, 26 Jan 2021 12:30:10 +0000
Message-ID: <BYAPR12MB323835A7CCA78DE6F8702B58FBBC9@BYAPR12MB3238.namprd12.prod.outlook.com>
References: <1611020924-17178-1-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1611020924-17178-1-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=58841f12-ab08-4437-a4ca-cf833390abcb;MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=0;MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2021-01-26T12:29:44Z;MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
x-originating-ip: [139.227.235.92]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1992d66d-deed-4f0e-d83f-08d8c1f61fbd
x-ms-traffictypediagnostic: BY5PR12MB3796:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB37968D23055C9610F5A21127FBBC9@BY5PR12MB3796.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hy77atYXWJiQuMpZjxzXOWXnU4cnf2musqww7kTz/wZ5E2bYLcnwiXXTWLbiP1LIiSJ987a/zAnBgire1MTdy1AV/cHM/9GgLO8PoCP7bUPnK1hyH2I5z3Yl6dEfaBlmvBAhLVxShk9PDf4rbAXUtx0cnHnK1RjJlDqMfg2FTSdLmFwYe5C/7RW1IEkl7cJ4kAeabc1VTT1an03MIzviQrC28z8KwpyPWsWpxZjRn4vOvPxWxkULVE7YOElK4rEKFuRXCC4J2HoAKKEXOXcmWAJr51fvYZv49Mc6sVuAiAraNvFAdOdg788WKvHkL+SfkWlTCwql/DmMpPMuVHEio6VsvL9llQxUbt9WQu5vEmIdk+qd1+V4pZEYVZYgdaFdHwUyq2wEQIvpDAQYthBkKWRF0RGdlQ4L0speJEQGGjdjBI5OGi3Pt0FwnESxUIqrzqBfFkBOSj/kR0rT/31Tg2YVSfwmXK8pQ3HU81ClO5jNHn9vi9LajXOSTWCMy245CkdbbpQIhFRNCtc7zVKG7/Avxb30sOyMypUB0q3YJxTRljgkI3fcDJPZF+it26vD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3238.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(366004)(8936002)(54906003)(7696005)(4326008)(6916009)(26005)(33656002)(5660300002)(316002)(186003)(66946007)(76116006)(478600001)(64756008)(86362001)(66476007)(83380400001)(66446008)(2906002)(55016002)(9686003)(71200400001)(66556008)(53546011)(6506007)(52536014)(8676002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?SXwO2p6TM/cIdtzYEwavGlDyuOl90qWdSRer0j3r4NdZyb97GcGuI3aWEPiS?=
 =?us-ascii?Q?nF9ZoCLzSuoE7RNSpwktW4z3EueU6/TpPeVgpuZtw/OnleIlNvzzPKuWnTQ7?=
 =?us-ascii?Q?oTXatmX6feszFuOMbM/K3fW/pTyPNcXWJbGPkg54kapI032HDTxywi6YydCR?=
 =?us-ascii?Q?0rW39dt36MrJ16JL9v2eNgfx06DtdDwXWcKq4DjPWdcgVH9nxPQpkDgW2/dv?=
 =?us-ascii?Q?RX19bxxhaVnwDKjCEz9ld8NZhhE/0+3RAdwpiEVNrnO33/o/T4gKO1hmybDr?=
 =?us-ascii?Q?gukZ/u+2hpXy1mUbjhMUFFqZ+g0vfVq/F28vtcxJUbU/oxSear9TGkc7uNkw?=
 =?us-ascii?Q?1fuvpS6jNEDTMK4H754hPIzEKMTTdMVYeIkmyBD5vHSB7gI7qbH3hPqElVkt?=
 =?us-ascii?Q?M/U9Sy6ftl6ROFKhqs0J4gFFeNtIVGpmM4noMjLmClGiQyUDScZHb7mEiyLT?=
 =?us-ascii?Q?Xtsb+6IsUAE46GWZiwMAY/Lj9KUf4oZfe+rlYEUoFCZ/ca0my59Qxfy4hPbj?=
 =?us-ascii?Q?QbWSwEe2sb1usAmT6qsDr9CrdYyD52PoKqOegNOnK+9Sg9XQodv6YzU+eLO+?=
 =?us-ascii?Q?IIr0TFXiGFPcStxYsmij3y5xkaHQr5SL2+6AaiTV9Jipiteejochce1jEdrv?=
 =?us-ascii?Q?qltBHvUayZUzznW43ezrPwwHMHhQBaYY3n2209Phfh3vRkJH/H6ciwhkRpZg?=
 =?us-ascii?Q?w2LQaJrMOqgeYj2GAjQxp+9dofJzH4t7tOnFMzfc03ly0yKcMzyMPFVWv/HO?=
 =?us-ascii?Q?zcJJvl3aGrqY0fIZcGkNSkLgXTuE1HTFGCwSpajiTYKF8Sau9C3bD54plBdh?=
 =?us-ascii?Q?GTOcemceVq98v6496Vro4qSm1yJO0gUNUa9hj+MNAxVjo/Yjx9lp6xXYECdv?=
 =?us-ascii?Q?oSgaf+2AA44PgZuQKWO0j4o5xATr5ww4F+EgUiCBfM+PO7NQsuGVVc78XgfH?=
 =?us-ascii?Q?OLjaV61xrawzuozL2ZD25nmh1AcJi29wiyMyH7TkVgBCYlvh0sgBmUIhxGon?=
 =?us-ascii?Q?nz9t41BmhMzmZZZ1jsCZClmTvUqElXpEOkBx0w1II+tAYfqhWwk9cxa7JO2u?=
 =?us-ascii?Q?OsCPRu5i?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3238.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1992d66d-deed-4f0e-d83f-08d8c1f61fbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2021 12:30:11.0156
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9FQBeWaPCZMh4ID1OL8v/6+2wFUZoIB4dGlxM+bm21frIitnWYgLxk4OmumSbGjN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3796
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[AMD Public Use]

Ping ... please help review.

Thanks,
Prike
> -----Original Message-----
> From: Liang, Prike <Prike.Liang@amd.com>
> Sent: Tuesday, January 19, 2021 9:49 AM
> To: linux-usb@vger.kernel.org
> Cc: mathias.nyman@intel.com; Liang, Prike <Prike.Liang@amd.com>
> Subject: [PATCH] usb: pci-quirks: add XHCI_COMP_MODE_QUIRK for
> disabling amd xhci D3cold
>
> During xhci suspend some AMD USB host will lose port status change events
> and need to have the registers polled during D3, so now just avoid D3cold=
.
>
> Signed-off-by: Prike Liang <Prike.Liang@amd.com>
> ---
>  drivers/usb/host/xhci-pci.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c in=
dex
> 3feaafe..bff817a 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -170,6 +170,11 @@ static void xhci_pci_quirks(struct device *dev, stru=
ct
> xhci_hcd *xhci)
>  (pdev->device =3D=3D PCI_DEVICE_ID_AMD_PROMONTORYA_1)))
>  xhci->quirks |=3D XHCI_U2_DISABLE_WAKE;
>
> +if (pdev->vendor =3D=3D PCI_VENDOR_ID_AMD &&
> +pdev->device =3D=3D 0x1639) {
> +xhci->quirks |=3D XHCI_COMP_MODE_QUIRK;
> +}
> +
>  if (pdev->vendor =3D=3D PCI_VENDOR_ID_INTEL) {
>  xhci->quirks |=3D XHCI_LPM_SUPPORT;
>  xhci->quirks |=3D XHCI_INTEL_HOST;
> --
> 2.7.4

