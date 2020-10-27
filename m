Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A75329A83A
	for <lists+linux-usb@lfdr.de>; Tue, 27 Oct 2020 10:51:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896011AbgJ0Ju5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Oct 2020 05:50:57 -0400
Received: from mail-eopbgr70085.outbound.protection.outlook.com ([40.107.7.85]:7046
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2895922AbgJ0Juz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 27 Oct 2020 05:50:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=avlVsZ5NPQxazhhZAbyU2WS9e8Gr4eCXuIDZ4hsZmvFYozN4fuXRnT8x21EUEIBoGovvXL0l23VV0UTIjklw+51ordo2XfSfv7tI1zHlKE8SMxGt9a5I5euALaNue15SJhVk1vswLCnR5Pgawcqq/TpDXSXlX6rMVa2QkyzWc8oQloaWoU9J/PcPJ9Vi6y4/CXqWnyIVeAk+qdiyWmv6g+RQmaOKQQQuTli/mxMUjTGSqMwCD35+SENMyD+oanZr1gZj/g4a5R3HknnAiV5NheDbWGpFtQKwUZSrmkEVg7a3qYaWPyV2LRISj593JfoERHKtxNuyH08bID5baYLo6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/rmEOdNuNxIiWkUjhPP9dOAjC1qqvsdK5AMY1NvwFE=;
 b=WDYivhVqkECUq/QBDhvHgMVx0Z4llSnXgzRgjGeDyQYJatGVvOae9z0JLGLcYM2y73dZB1Sw0+FlGDwcHBYBwIXnMWn9L6XibZQUYs29eYskBuvboPR08ApdxFjtEGiICTYb7WAK29qvu5YcowwlVf2Q/CjZxg/dpCmeyvdeJioISMzNTg3a1jWm1W0iyUE6u9irv+YJSPFFleED2F/eYmWDWT3Nx/OKPQnRmGxtNibPkH7NXl5CQpKqy/JAsrCNFQSmkl8fEh5ab5kwA0QaHvug+E+s0tmAjaDp+KO2JAYjjkZDxaYEHlOHB6IPlO+BIhubevcjvyIznt++ME50fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/rmEOdNuNxIiWkUjhPP9dOAjC1qqvsdK5AMY1NvwFE=;
 b=nSnwDLot5akY7cE6/THruwlBubiPNoOxWbo5kw/LhF5gcyoq2oaHtq/s4t07jp3ua9HLkCYe58Hjv0+CrMgHHYhJnAsvMj5q6FMRWT6F1EDcZhSJsy4usSt5fZpPwO3XcUoowskemzLbOKsSvOc/cFf2pvXnywxOHKlhQ8mQXGs=
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR04MB6852.eurprd04.prod.outlook.com (2603:10a6:208:18c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.24; Tue, 27 Oct
 2020 09:50:52 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3477.028; Tue, 27 Oct 2020
 09:50:52 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
CC:     "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>,
        Pawel Laszczak <pawell@cadence.com>,
        Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH 1/2] usb: host: add XHCI_CDNS_HOST flag
Thread-Topic: [PATCH 1/2] usb: host: add XHCI_CDNS_HOST flag
Thread-Index: AQHWqB+8EkbyC5HZU0qhM2+GN/QOFamqAbAAgAC07bCAAHDwAIAAFWCA
Date:   Tue, 27 Oct 2020 09:50:51 +0000
Message-ID: <20201027095023.GB5940@b29397-desktop>
References: <20201022030133.19528-1-peter.chen@nxp.com>
 <e3f75fb0-8fab-357f-d3f4-ca122995166a@linux.intel.com>
 <AM8PR04MB73003D7F9CD52561E69616108B160@AM8PR04MB7300.eurprd04.prod.outlook.com>
 <1d673d32-5860-c4e2-c88d-df7ef57f1d7a@linux.intel.com>
In-Reply-To: <1d673d32-5860-c4e2-c88d-df7ef57f1d7a@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a2f4d01f-95b0-4c48-a691-08d87a5dca83
x-ms-traffictypediagnostic: AM0PR04MB6852:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB68521EB3D5AAA0332B6307258B160@AM0PR04MB6852.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1091;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BtMbi5ODN+hwv6Y4Y/A/24hGYD2jk23wSzQbhbiQtl3XbJ1Br5wgmetFBOtkVVtpPgf/20+xzgNAYm3CfnAYFD4xPtrRuvj3Dzw8EBaR2WBptGyTkJFY7TIfT/QEShF2x5MV31nHlvfN9Ff+9/g377i6MMo8PgBSsZ7Z3inYh/YZW7RFwzfQ+926kIxzghC2gKn39Cac3y9yMPqg4ypOkSE6XKnlWPY6BZ2w9zqUXd3TjhZXNqdvkGbI8kiMuc/PzaX64tXX+76QRbjSqRwzvNu3vGyMEnXv613k5JKhFvbkNKL1UkqNePUCYK6qJgSC9MV40L0wI2IRGEPWIivPBg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(66946007)(186003)(53546011)(91956017)(6916009)(76116006)(83380400001)(8936002)(66476007)(64756008)(66446008)(2906002)(8676002)(6512007)(71200400001)(66556008)(4326008)(9686003)(478600001)(6506007)(86362001)(6486002)(54906003)(44832011)(33716001)(33656002)(1076003)(5660300002)(316002)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Ibv3LlR0XiFmrjuJbHz6ABdqEitxu44mb4RVbfYG43jNILnDLzzNx4MkLV8WqI3fFPYBpJLRGU4yhfLe3JBQ6I5VvE1ifHzRhuj+YBi2f1MmzkZInD9MVqTMxmxsOlxfPaMwzUhkQNmvyxic7eguVui2BVDGbwMfoi2plooDI4DjKo7Y5JZ5jf1ibYTv++BwigUv0okCzV+2ByGtpMPACK01r3lw3U8/+KnyrUXLNR4peF9wqLuO3D/2MUfVmlESn5WUq6/PCTZP86M6U37kcCenXAtyV9mbkPocSqiTHIgAVJoGzYacnjT/VVQOSQKL30fD3wKk6hHh8P0piGtZRLNiG1FGgmwL33qpnsEiumHJS1+XX3JwLF+ym2K7tnIIOHQUR+28a9aewYni3ODuEcUdBSkYV25lSB3fNC/+nSbHRF7j4m7u5mnQTd9AsbdZMbsASfd3j4zszWFE40G/DidFtZ4UvenH/dkhCXHVG1cnmrt5aBy9AevzQvujjJXJwUjJLbnq+iauWYtg2WrEoKOCbgZiRI247AMdyNf6o5dRaTuoIIT4AqRitSx0hSmEde2nI9ABO1gs8BJAMJMIn+zxbtYF0JGIikTki1RlBq8WZvGD7Uk76gmaT5D8ugj7Cp39y8GDBol8PS8GC6eyNw==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <444A0CB0C4781F439E66809EF2D945A4@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f4d01f-95b0-4c48-a691-08d87a5dca83
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2020 09:50:51.9704
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PnsCaAwz3XekHZDzGV+gmPMDPEVSTDJjivqbaCwt84HbtAiEvKSlIMfMME9Xbx1+MXg1K1PVHLVwvsgE3hupKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6852
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-10-27 10:33:52, Mathias Nyman wrote:
> On 27.10.2020 3.50, Peter Chen wrote:
> > =20
> >>> Cc: Pawel Laszczak <pawell@cadence.com>
> >>> Cc: Roger Quadros <rogerq@ti.com>
> >>> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> >>> ---
> >>>  drivers/usb/host/xhci.c | 2 +-
> >>>  drivers/usb/host/xhci.h | 1 +
> >>>  2 files changed, 2 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c index
> >>> 482fe8c5e3b4..fc72a03dc27f 100644
> >>> --- a/drivers/usb/host/xhci.c
> >>> +++ b/drivers/usb/host/xhci.c
> >>> @@ -193,7 +193,7 @@ int xhci_reset(struct xhci_hcd *xhci)
> >>>  	 * Without this delay, the subsequent HC register access,
> >>>  	 * may result in a system hang very rarely.
> >>>  	 */
> >>> -	if (xhci->quirks & XHCI_INTEL_HOST)
> >>> +	if (xhci->quirks & (XHCI_INTEL_HOST | XHCI_CDNS_HOST))
> >>>  		udelay(1000);
> >>>
> >>>  	ret =3D xhci_handshake(&xhci->op_regs->command,
> >>> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h index
> >>> 8be88379c0fb..4b7275c73ea5 100644
> >>> --- a/drivers/usb/host/xhci.h
> >>> +++ b/drivers/usb/host/xhci.h
> >>> @@ -1877,6 +1877,7 @@ struct xhci_hcd {
> >>>  #define XHCI_SNPS_BROKEN_SUSPEND    BIT_ULL(35)
> >>>  #define XHCI_RENESAS_FW_QUIRK	BIT_ULL(36)
> >>>  #define XHCI_SKIP_PHY_INIT	BIT_ULL(37)
> >>> +#define XHCI_CDNS_HOST		BIT_ULL(38)
> >>>
> >>>  	unsigned int		num_active_eps;
> >>>  	unsigned int		limit_active_eps;
> >>>
> >>
> >> Is the XHCI_CDNS_HOST quirk bit set in some other patchseries?
> >>
> >=20
> > Currently, no, only at the function of xhci_reset in this commit.
>=20
> I can only see it being checked, not set. Am I missing something?
>=20
> -Mathias
>=20

Oh, there is a missing patch for cdns3 host change, the code is
located at drivers/usb/cdns3/host.c. I will merge them together,
and send v2.

--=20

Thanks,
Peter Chen=
