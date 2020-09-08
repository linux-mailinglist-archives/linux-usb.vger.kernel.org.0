Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35471260BA2
	for <lists+linux-usb@lfdr.de>; Tue,  8 Sep 2020 09:15:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbgIHHPU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Sep 2020 03:15:20 -0400
Received: from mail-am6eur05on2072.outbound.protection.outlook.com ([40.107.22.72]:4000
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728479AbgIHHPT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Sep 2020 03:15:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xq27g9/bzqfCgSS+Lh8qZAqaTQbzUY6DVI4rX9ajnEsEOuM+B6rNgdOaANEiyDVBrTfV6qfY8eVwK0zPl5TlqLpD/PrUKsPMdDL7qoKPKPoKYr86fDwBM6AxlyhRrlArQYpo3t3VIywX3RpQ2ErsNQKGiAxJYpUgmEFBEoR9UD+4BguodnsNxl3iX2qGGyhWVyNBgEH/TrxbD4t6/PVg16Ypz144T0+yfHAFUVVgaUiCCfWD+Z9kLqLuIdajc3/WjLW/M5xzbK3NWsa/egnTKVnDRt1dEfb7tMGaUzdpN2MaewmCrNgvXA+zYZFz6V+8Q0XUmw9nus1votJSB8iiXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6twGSEoSyLCQW9u0lOaB0sNSvDdP40ixbuaO1jUiNe8=;
 b=WMsIZMvORzVbTKCGQ4oRAx7mswDncZ8vkj//R0AIyVeKlJ+w81zvsC/Z2eqwL8UeWnpzI9pJf29CvAc8YIzlzyTu5QIej6PwDCA3wk4Joj9HbRe2nbQEUUUEjKulhyuK+mcC7r/qS/O8zmohZLdtmCYNEEf/MBkhbn9Fgv3jDt5mBpjXjZ9ZHVBreYGXKGzswWmfscbxTuOVDy/JUFQ+aCuSligRtbnftNxF7K+PkbU/yIBxHP1moMLTk3lQN6PopcfpWgP61NTLKX0ghDgQkOJ3gUQPxQPdrQ5V5eWvFPZ6mQE2uhMOSFHfWvyMD9kVdJAvPxDpGLvRVewUdTbTQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6twGSEoSyLCQW9u0lOaB0sNSvDdP40ixbuaO1jUiNe8=;
 b=sqO857XqJeNfOnknORsP/F9OL9BHNr5gtkYnkUPiAiQTxcFi4/n27b3XPOsWm19tuAb9CavG0WXFbiJB9C8R71/1BrCnljjTHzubez/Pk5sC5fOk4lvsWcvZlvcvGCrrp7XqMk0Ketl/pUl0/LhGTBhXbIcSjiq/Eq1xF2S6u48=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Tue, 8 Sep
 2020 07:15:16 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 07:15:16 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH 3/8] usb: cdns3: gadget: calculate TDL correctly
Thread-Topic: [PATCH 3/8] usb: cdns3: gadget: calculate TDL correctly
Thread-Index: AQHWgDxAVk6v4x6ZcE6LmMIppZMb3qleUCoAgAAO1gA=
Date:   Tue, 8 Sep 2020 07:15:15 +0000
Message-ID: <20200908071448.GC17366@b29397-desktop>
References: <20200901084454.28649-1-peter.chen@nxp.com>
 <20200901084454.28649-4-peter.chen@nxp.com> <87ft7sn5zd.fsf@kernel.org>
In-Reply-To: <87ft7sn5zd.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: af233c92-1374-403a-deff-08d853c6ef85
x-ms-traffictypediagnostic: AM6PR04MB6551:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB6551261E93912C36BD8DB1858B290@AM6PR04MB6551.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U/hB06Kp+VAC1CWcTBSaiamP32UjKeosCJ3cnoHNmQGdTLVbmwQ94jRSVaCVr2XYmlulTDD+TLDDet2v03mMoln/CXAF2h3z26U64QzVp0b2Xctta+ETurp7ib1oA/3JcgTaYZu4Jr1jC2jeyorfb9BKC/xWe7JukkNFVpQ8hzpxSL5F38RsNc2riymVsvomdJxAk4bkok53fl8VHTmuu52GH27zrpPaai+nlkWtDPHzfKieuX4eLINOwGrQFxNjHRDvEgqXTNkMDDxyx9IGn9nnqFTiSR6cV7rPF4DVG2POR1iJl25W7t2KxZZGhj0OdsdXIDHuEMRDzzeJnVBd8A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(376002)(396003)(136003)(366004)(39860400002)(1076003)(44832011)(5660300002)(33716001)(71200400001)(83380400001)(4326008)(86362001)(9686003)(6512007)(6916009)(4744005)(91956017)(186003)(26005)(8676002)(2906002)(316002)(66946007)(478600001)(76116006)(8936002)(33656002)(64756008)(66556008)(6486002)(66446008)(66476007)(54906003)(6506007)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ptD0+Nb3EeaXEL0TqjMFvd5O+m2P3DwG9uap6VL9ICzcB07k2+nGOwekEbY0K6yNTZRYjclErAVj0m1W8EaFI3zSlEI0o7Hz8pnbgE3tvp9mmDxh80i1b11x20nJ5AMrgcTjJQP29hbAs3XrHipIh4dMFoU0/8fhHMj9XGiau+oVBPf0jIu9GMo1S5A7SjhPx9k90i9hBXrtqEbrtHocvWct22VpQSTZ3HQPjip3N55iUCqyM+Gd03NVEGO2/rUvqPnmR8e7C3SYprnIhqz0BtczYVzYvP8mDQVCdqiB/AOy2O3+9ItWJFuAcZ+NxesxluH8kOJ/9GavFTZMt0aLhbcwjanzyloKBElKNsHjhSinUTmUbkDMoKTQsfUmMbBFxebq1xZtRhlsON3XbjiDVw2OE8Wjm3b3ZjmpZINWhVY00tE7hpMU6nyjig5NRO/12bJrpomZcSspXVjjKTAN/POuEWTiosEQ/BnLdI1VUBDFB7jqa3e2r78gY34nAyncAFg8fY/4x//qGRud/fiKrLS1MaN2M8D3pLuEWI8VrUhreI+TdNMf5n16Af290NLSjoEwoH5qSwPgduxIfua3aJagBodIrnlOM7ZBv4EuGwkqzmWKs/NXKVhlnWbzS13+wleWuxQc5vI3D0Q9FKJ81w==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7B362549E1062649BF1568374ED3794F@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af233c92-1374-403a-deff-08d853c6ef85
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2020 07:15:15.8928
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WlIM9XtUoHfxgt6KawgspZgl+mquaVfl/w4icB9owEU3FF/QbIxo/o5hPFNR8oTiIE8TSbtugYNtAoOvuNzSBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6551
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-09-08 09:21:42, Felipe Balbi wrote:
>=20
> Hi,
>=20
> Peter Chen <peter.chen@nxp.com> writes:
> > @@ -1168,9 +1169,19 @@ static int cdns3_ep_run_transfer(struct cdns3_en=
dpoint *priv_ep,
> > =20
> >  	/* set incorrect Cycle Bit for first trb*/
> >  	control =3D priv_ep->pcs ? 0 : TRB_CYCLE;
> > +	trb->length =3D 0;
> > +	if (priv_dev->dev_ver >=3D DEV_VER_V2) {
> > +		td_size =3D DIV_ROUND_UP(request->length,
> > +				       priv_ep->endpoint.maxpacket);
>=20
> spaces for indentation?
>=20

Will delete the spaces, thanks.

--=20

Thanks,
Peter Chen=
