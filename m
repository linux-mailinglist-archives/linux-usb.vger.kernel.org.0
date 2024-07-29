Return-Path: <linux-usb+bounces-12548-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E64593EA78
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2024 03:05:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EF481C20EF1
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2024 01:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D385C82;
	Mon, 29 Jul 2024 01:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iZWRX4AJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2080.outbound.protection.outlook.com [40.107.241.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E72B2BCFF;
	Mon, 29 Jul 2024 01:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722215034; cv=fail; b=EVmveXfwOt1cP/jbrZK5bEk7/wxW7ITf0DA97fhK46yivuHD8HoWl6S7VHnLiCK4zFJnZA7ZQ+l5MRSLFs3ldCFG/DIBF533skQL/cX+gVmErrJd0aRU4cdE3FfUBLcq6Zi2ruFsruKCRIutHu7sdF1jn+4X72rxi3wOZ8qH434=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722215034; c=relaxed/simple;
	bh=WKMUKpAnqWeFNbgUGbUh1z8ksbcnEZdBO/NHSTJ9yMk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kuFENlyDn10eVQJpaixv/ENrehUhm4/Rpic+U2YIzFa1gOVhBtQGMfMZFznkjiy0Pj0jRubPbt2T6TFvHwkshOEBbolQI7EGnvOHcZCuTrfF0DGkyPcgPX7rVSNZlq1aLXE5ROnRFoj6sudECCVyvfK0h9vJ1o+3eB/0FttY8wg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iZWRX4AJ; arc=fail smtp.client-ip=40.107.241.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XciUhdBfTmsxPLcfjFC9TOKMslAJzfN99zWDYGyyOeoHl2KuHUpoGDoAtDuXr4b6LB94oWFpn1hNczX/hE8nRo6sLv6T90ZAb2czdq5OhqttIJ3JsnSIX0nGnZAfxoYILdAtE1+C4eIemLi9zBwIOdivtWHEzEg6Yok9XYJIvgk86TEAJaHY71/3CI6bdtdgxPSDvLX6GACTP1YEHgA+PeA206DqkcpvTPIUmhXK4o66ZEsZjdl3XTVsnv/772XWqZLuFX1va6dJK4VWXo/MY8uO+T5+cg5qLrWKIncCE1LPeuhrgg85za9B4v8wYOPdMzd2xpGCB39S8lpQ/gIJig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKgHp1QlBYHiclx3UxpVVM8WaxxMDCL+j9UjleQ1UTk=;
 b=AqHD3yEi3dmbFylUtfm7TiJi6WxlZWasOcF+lLvCzInJh/7jTJO0fJXSUborOftfI9x9Uoa3kCnS8R5wHjJlAWttJwBPqDLwKs7BJHK/oI17edMqJLx0GBW4tXclIL6n9zbGi8hBSCTmx4w4HigppLk2lCRaN3HtBj2TyH2RIlsAAoevGD36zl8nIe/dR/TStXpgUtRtZLpXHR23/PUvXJsz7fhz4d2vUjPhMkBB5+VBV9eKOkF74HJSXcdipFrZUOHttXPzYwcE1liwHvkmOx3vlhLmpDiChAtY5Fc9nE/bLV+DksP7kPCbvihmzXRrcI1wEVL764yFfINedrd/Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKgHp1QlBYHiclx3UxpVVM8WaxxMDCL+j9UjleQ1UTk=;
 b=iZWRX4AJuMjiPBpgO2IWnllySyU5Fy5plBu8CtBGzJssMlPLRAR2fiWVVV6ymHsPntsXGfyx9IZF+CcI4iE8pSNisI7Hv/cW1jQTR86FOok2UnUYInNRpaxwWWfKjFYcoh0D58wOZ9X5z7aJCR4py5zESfoaWma3/ut7mtTh66f/i/TDaDvgJ0/2K2QSFzp/ge0xx/jjVDL2wBsXxRYxKA+/PGfIpSYqHza4XuuNqCysFZxTSZiql+B4fJ71SO9Pc15I6ELmaxrzQkYGHRzkU/j9vWWuFblW7K17d/g40AlOTXOqfMiPq4q0YwPZLyItkkP0qFlwlMuoIFX//7XdSA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB10684.eurprd04.prod.outlook.com (2603:10a6:150:218::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Mon, 29 Jul
 2024 01:03:47 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7784.020; Mon, 29 Jul 2024
 01:03:47 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>, "vkoul@kernel.org" <vkoul@kernel.org>,
	"kishon@kernel.org" <kishon@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"peter.chen@kernel.org" <peter.chen@kernel.org>, "herve.codina@bootlin.com"
	<herve.codina@bootlin.com>
CC: "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH v2 3/6] dt-bindings: phy: mxs-usb-phy: add nxp,sim
 property
Thread-Topic: [PATCH v2 3/6] dt-bindings: phy: mxs-usb-phy: add nxp,sim
 property
Thread-Index: AQHa3097fNjJlnhH/0ODxZBb+E47dbIM53LA
Date: Mon, 29 Jul 2024 01:03:47 +0000
Message-ID:
 <PAXPR04MB8459517F5F5BC4E1C7A5E67888B72@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20240726113207.3393247-1-xu.yang_2@nxp.com>
 <20240726113207.3393247-3-xu.yang_2@nxp.com>
In-Reply-To: <20240726113207.3393247-3-xu.yang_2@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|GVXPR04MB10684:EE_
x-ms-office365-filtering-correlation-id: 3438573e-06f9-4a82-5d24-08dcaf6a4d04
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?EwfRVDymF1pqnHxtPtIBtvMU7TkBaHU5nJ+0bRWXRdno4Epg3m3ZX69kAahs?=
 =?us-ascii?Q?KHurtvzywPI7tZ5Hh43Jt9aW4pdokzpp0mWZ9E7Pj7nj1U5SfPVUDHbwiDK3?=
 =?us-ascii?Q?BuRdDq1MmXEm3bsUCGDwWHNGG18Lk/VZQSdeiR1j4nUGOxyPuJcAgUiajNCM?=
 =?us-ascii?Q?ByItETsViy0hG0RJC0akoayyOOPWB3R+HUanaEQwW4goeKGi0OXJhxNFd8eU?=
 =?us-ascii?Q?RBGZD46rZEoBQFvPzzyuTypfxCEH8iRKF3PVQ8qzmpkBgxdCOdTgOe0T2RGG?=
 =?us-ascii?Q?wHZnlWidZcbmAGKx9/TswqebKx0hwKqKLCs3KwKi6sENZzvd9rkdgGVlRpyX?=
 =?us-ascii?Q?MTeJMDXwA11+WpDwT6w/p5wRV8KPbm3Ym9RfYtuDM9eQo/3HOnyjEZkLjSx2?=
 =?us-ascii?Q?0NULDmuzrXWGBZG5XY6ZNq/mg0JYAUs2hgzbYLIxs25vUmwqfClOeu6GNuiT?=
 =?us-ascii?Q?S+A5cwZ4dU20WTpNR2wP9SQf3xGQQPodbUWs/kTZ4Hdq60JuhVu1kL/T81hj?=
 =?us-ascii?Q?fz70kocl2Ed+MQWosFGM6b2CsoNkDJ6cvDiOYvkyEY8xvQ8iwlNWnXkH/Qxj?=
 =?us-ascii?Q?GTWbGAeD68+mhS5UwNhl9MvFSKPTzkaxLY/ES53dFW8gHkKiQ6q+wAUAE1Hs?=
 =?us-ascii?Q?dIrBJNcYcZZYnHIL3Qdx0uLJwGU4mOQrPy0DKw8tsz3ZVYLwGVThfiiWSbjN?=
 =?us-ascii?Q?54G8GnjtCmnd8Fsg7zjg7FzRpOGaoWOcA9PnPM2fQ/yE6lwHL82zKl+0G/st?=
 =?us-ascii?Q?wvCjYMlwAaI1akPoHRfTn8dOSXJe53SscTLshibsOPred2QXkvUhltPmPHBk?=
 =?us-ascii?Q?NZThDEednyIoiYL7UigyNZFc5RBb6ljbfb4u3mmdyGstTwjEJ9z+Ews1F0gG?=
 =?us-ascii?Q?/x417vqlaVIj/Ut2LzNf/22Uug2RIqUqHvV8/Rja5cFnzVnt9L4RtjLiTUZ8?=
 =?us-ascii?Q?+7DCOnW60ekUGVV1cWndqBkaoL4U29roj/dQwrHdtzfsbs2TDJeWBYPpuk+A?=
 =?us-ascii?Q?Q8Ay9vPE3JF7ZjtX0jOly1Sw+iYGHDaQdGoBzK93aoZYz7Urox0gBROVHUP9?=
 =?us-ascii?Q?s79wp03lQKyvw8oU81redD+IB05s699n5Sl+GKot2yxBC3Y9sojN8/dHcMdE?=
 =?us-ascii?Q?XGeoWwOhQ3b/fp3kuCCD5+2TY4xJchBBGrTT44Na5XG77qmH24fLSCewV4R1?=
 =?us-ascii?Q?5aDL9Uz/b3IAn5cqdkm3IHmKlkLKu2V/159oachVg5i/44bCnbF+NAzHAAdc?=
 =?us-ascii?Q?uY7SjmzZ2IkL4MFQmqui9YceXy0TUtOiHSYRAaTH3VrOMU1zt5sHrUiOwTHV?=
 =?us-ascii?Q?rfW1RinHm2RICcOORHhgwdkxw/2kTb3RAa/RG26Lf0gUvTFlVaibEooP48fq?=
 =?us-ascii?Q?TpLBGU+QdixM2xckmnX6LNLN1XASOjHkv96h1VTTRFBl7nbeLruX92oRuVQm?=
 =?us-ascii?Q?R4mVjUOALGg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MnhqTfecGFr/a7fO+ks1eW5Q1m0L43zraBDjJVNh54tY7DjImxV9kf6QLNiy?=
 =?us-ascii?Q?FNL3QZPjhWKSVmX/M+NFBTxCYLtZF2T2I+30+5iQ3RPZ28DK+hADwjbQpQsr?=
 =?us-ascii?Q?9om2oKUPKHwAQQh6GtJqP9+ZFU/b3uXmkEXlSfiD9iWURc4zYVMr0Mlm/4pT?=
 =?us-ascii?Q?e0kpylk43B87iGXxVDp5+NbnoDZBmIB47NnAioDrGCD85184ZcLxP35hcwlk?=
 =?us-ascii?Q?gWyuHQI3iBUPHhwKovCMdzapANR6GoscyFjP1otjQ8Q568tIYfISUCpIlJDK?=
 =?us-ascii?Q?PbSvGCkO/SW+yH/DUm+HRktX8g+SSpkntfXxPfpQim+cosMb8B/53QC7qCIF?=
 =?us-ascii?Q?g2l0MMvyK5TT2dUddEV4pRVU6ZmpIJfkiWSew0acgGs6kAncLBaYOqHRcsXP?=
 =?us-ascii?Q?YdMSvG7Km5MV4gj/lTlfbHNlN05NqZXC8QD+8o5WaJEppWiSFkwG+PPd9kbQ?=
 =?us-ascii?Q?BCwA5MEuscDKlA/ve+bgUOj20gqBVbuD3jpkZikOxwwLCU11NFPrkRb4+hpu?=
 =?us-ascii?Q?oNrxR0HEfPK5R3JjTsqDfDT0agsnl4h+ypBO593ZGItjdg8n6ppyDeF020DE?=
 =?us-ascii?Q?GFgBOVIoeu8iZ/94F6aahzyBXlQMeHhOvSh66JaSfbrkdGsRWkqwY/9HWvN0?=
 =?us-ascii?Q?ewGTid6RmkgT5+mjqSfuuN3b1wh12BS3AqMh14m2Bd6Ibgu1toS/oNDgLYFG?=
 =?us-ascii?Q?cB86c9r1sT5Lc6SO8YVp9HCzZGWUdmm7RmsKQmzLtlY0q5+tRFgedEREPazI?=
 =?us-ascii?Q?YluxgkmZRrmtomAkSe1NuxWd9GSQaU9sPhDdtiEVD+USSye0gY0drjE4pno3?=
 =?us-ascii?Q?/xmvM/C5H1CV8r86c3R1cPgCvqYni9ONRBCH/jA8nGzcF+sjUieVARhoJ2cG?=
 =?us-ascii?Q?/Pm97B54Ll2IU1grAFqQo6BYaXd7A7JMSXB2y98H4W5rBVa+bhknGPsde0hs?=
 =?us-ascii?Q?+IAoZe8GUnNSJz0hx7Acq7MOGFZJ+RI/IzGfdRRP6TWyk31jqNcSz562wteN?=
 =?us-ascii?Q?2LttuyfbwsYQt+iJCfeJDvi2H+0USfGBqHAWl7TvC1ejnkthu/4r06EDZFrb?=
 =?us-ascii?Q?V2An90qdRsWdwqXdQ4NVZVWf8cX91xJ2Qc2/7Yk/McKUg0sX9oO9fx/GDukr?=
 =?us-ascii?Q?WApjbdcwLsTrmZxiHu47551nIu3fPYDddkUrUzkCVM9WfnYQB1F6ZFNYoLt6?=
 =?us-ascii?Q?Z+h+mO15ZTxGctAwLkgDar5ZLVeXqCkfO/AzsrlGaoGUdLxeXZJPot140Fvb?=
 =?us-ascii?Q?X1UrEP+XllCT/CuriS91bbaM1rHHcStDKgqcIRzzdNbxDSqGQe1OmyLM0JOg?=
 =?us-ascii?Q?KpjhMHbNZF9DW0FWdCPdh0860KdpYEY9TIOXPd7RoyinNctnugjXaGA9fiWV?=
 =?us-ascii?Q?362a0HXdej39zceEhYyLUzQ96G0/3q6TTYk2fAkDTuAPwvZD7agh97OgNUZH?=
 =?us-ascii?Q?IJvsXnNCRWpSl1WfXgurac/f3wyrfyvDWBc4Py4WmVBEwVZDEUmIP0M5FBGl?=
 =?us-ascii?Q?F7Txj/4hX/c2BPZ2vJCAzyxmSaGLWXI4hj7ZDWpx53Q283ps0WqoDuGeA9A0?=
 =?us-ascii?Q?lyZFRLJtb/lkFxVdWFc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3438573e-06f9-4a82-5d24-08dcaf6a4d04
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2024 01:03:47.2847
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vji+O+wFHr0LaGgJgczdok1FiQvSheyawLgbFpuYqW+V6pfF9wgYoTQq6kLGaEQoR2MlJosT5bzp1cx6S8yKug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10684

> Subject: [PATCH v2 3/6] dt-bindings: phy: mxs-usb-phy: add nxp,sim
> property
>=20
> i.MX7ULP need properly set System Integration Module(SIM) module
> to make usb wakeup work well. This will add a "nxp,sim" property.
>=20
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>=20
> ---
> Changes in v2:
>  - add else branch suggested by Rob
> ---
>  .../devicetree/bindings/phy/fsl,mxs-usbphy.yaml | 17
> +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/fsl,mxs-
> usbphy.yaml b/Documentation/devicetree/bindings/phy/fsl,mxs-
> usbphy.yaml
> index f4b1ca2fb562..ce665a2779b7 100644
> --- a/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> @@ -87,6 +87,12 @@ properties:
>      maximum: 119
>      default: 100
>=20
> +  nxp,sim:

"nxp,imx7ulp-sim" should be better. SIM is specific to i.MX7ULP as of now.

Regards,
Peng.


