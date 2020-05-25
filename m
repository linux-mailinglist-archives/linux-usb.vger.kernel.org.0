Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B1201E06F3
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2020 08:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388519AbgEYGbP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 May 2020 02:31:15 -0400
Received: from mail-eopbgr10053.outbound.protection.outlook.com ([40.107.1.53]:46910
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730230AbgEYGbO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 25 May 2020 02:31:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FPSLR+/Kbv3AcDJRXnp2CDlKBm+E/EavksnFxcW9To/FN+vQ/fmFF/gL8ggo1tPWUxMC1obBAd194vtoFaWchMQm9t3h234RGCkySUzl4Gi45r+Y1unqfcwNokoreQFOmWxYQzh6f6dwHkjKueMSfQ7Zewp4xAe4Qk1JtliK0j2eZFCCYBPlL5BQGBGmNIpw91duJd+6oUK16rmlVqY+kGbV2imCUPlQHbPeCddbbyrFEB+/ZjjVR/y6QvJ6w+YXfx4yYJlw/rDKRGReFF0nGyTgh4KC7QIpaY2A5Yscrk4LF4gvHjRKRwN9GG7GhbnWxcTPaLw6Jlc3Sfadhy0fXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JTHDkUdCSC/EqRjWH/JK+drAT+baPPBcb+4ySiTrz2Y=;
 b=VrS5r6ugPVlufPa10Vs5Y1u3hzqI1EyaV3syZcTyRNYBO/Ym8JiUHeIGSDJmQrXZLIpZZopwN2ff7aLLoxLFCSpsJa+HPdWMlMiuzGi2hHIwWKdu+Gn0/f8pF0xrMSz2Y6kjE46wW29UIkF0xQghPk6aqee50F6ZdTobFMs46diwrrZYXYNFh2fxGj9W2xbKntL7IegpJ68mwvCjd3OxAWf6YX+trP7pE44wI/vtzGiQULXHiLH2mdKmDdkPvnWH9LLhlEFMrDT+1zrDjACAKRmvsHPI5jeLL7mL4DcwU6oklXmYLWarsSLM6TnEeu0R7giTr6nSoKwa77VAm4gMtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JTHDkUdCSC/EqRjWH/JK+drAT+baPPBcb+4ySiTrz2Y=;
 b=BqahLVfVqWX1zzkRipxuQQ+AOFSrQ7ZtoNn42D/m0XYog3xRiGWUpxofBY0lTySGxxFVxBpso47uYJTsw9/7ipH3V7HhwjBeJ8/Ub2+dhkjpxJONkMBL8/3WTvD5Vcsagcbwor2940XBLPyh2KSNMWfKb7o6P3kmxxqduM0iK/w=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7191.eurprd04.prod.outlook.com (2603:10a6:20b:11c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Mon, 25 May
 2020 06:31:10 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3021.029; Mon, 25 May 2020
 06:31:10 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     kbuild test robot <lkp@intel.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH v2 3/9] usb: cdns3: imx: add glue layer runtime pm
 implementation
Thread-Topic: [PATCH v2 3/9] usb: cdns3: imx: add glue layer runtime pm
 implementation
Thread-Index: AQHWMVkZPJsugzXIl0C8lG44yOlDs6i4PhWAgAAbfQA=
Date:   Mon, 25 May 2020 06:31:10 +0000
Message-ID: <20200525063134.GD16948@b29397-desktop>
References: <20200523232304.23976-4-peter.chen@nxp.com>
 <202005251215.nsp7iG6y%lkp@intel.com>
In-Reply-To: <202005251215.nsp7iG6y%lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9097d628-b4d3-49cf-8734-08d8007536c9
x-ms-traffictypediagnostic: AM7PR04MB7191:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB71914785CB6F7E2C421509D18BB30@AM7PR04MB7191.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0414DF926F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QX7vUijKG94q6hyML5wmEhdqTyvaAAHKgW2ikQ+D1m9vNZ0ueS/f+x8H32ooHjpjPSsy8jQv9ER/KJdTohJRJLsYzWQ3E0kn9zxqD3CdxRRmtVHl0r8+zp7C2SHHfkRGSITCQMJ+fS6vuAaKJWJ41FKWXWAGtrz5a0Z0uYfXhoKiZS9beQ4ZXWtmWIAP7UyZiH6zb4ovehfPwppYqSR5KVXLImAcx+QDRXg0sF0q5zQvCkteg7tDD/Qxu7a/I9MZF6o43dcoeSJHTDWJZ0Wohqoa/mf11XMu6ZUjN7StTRx8i7Ud2HRKALSLDmFhk4Q5p4N4UAogG1rchXqQgZcfrxLgrbAjM6JvERnFjLjlUJ0RNmuNHip3gw4BDIPC6xJTLKMc7R7+dzPtsV6YHhe+0g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(7916004)(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(33656002)(76116006)(66556008)(66476007)(64756008)(66446008)(9686003)(91956017)(86362001)(8676002)(4326008)(6506007)(316002)(2906002)(54906003)(6512007)(53546011)(66946007)(5660300002)(6486002)(966005)(478600001)(45080400002)(8936002)(1076003)(6916009)(44832011)(26005)(33716001)(186003)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: cmWHuKv74J3SE32aYdIvJOyDJmE7fquemaOTTuZTP6GiIrUFvVNHrIb3Te40V+JEOqSCrokJQJwFWMJkVaMRxjMqwqA/6HbVM7BFcC0AsPoINR1qCRKHraoi6zcs5iwhSRC1fzx5/69PGm/s4LKdr+JQXVTNrjYN2Fczg6ouiq9pWb7UIkyfdLDyp7OL1PMOpHFzpGPTgsfKGOuOzqlQELutcJRLmsIr1u2UG4CLzbPs21e8eqSNogD6ky6HTfZkz20OduHjmq8P+ijl6KVq4g2v5oKjvQ+dzGnyjERuHTtI1+I+to5GO/PPuBzmhqBoSHPAodMHk/XcMsv5F3MXHIaHo81sMhOqsiaufhu+gnzLcje5H6PvQIgJ6vlq6WWYu4o0+3pR1WwVcvESPmBoESIatovuWWGBpMvq+2vkGW67kYm14pRF92qvpgi9QhpF9C6JpCa+XKw/Td7B7LSF6InB/FXXz1VrG9qWe7PH59A=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7E27057901AEB54FA8868B1D658DB033@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9097d628-b4d3-49cf-8734-08d8007536c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2020 06:31:10.2598
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m78TGn/HXTcArkJpexfnKfny1D7QEMYANXFuRzMOOQaTeVYZdxDxMQmEvaTlkrU1S9mlOJ5lFjejmaiqSiWeqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7191
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-05-25 12:53:11, kbuild test robot wrote:
> Hi Peter,
>=20
> I love your patch! Perhaps something to improve:
>=20
> [auto build test WARNING on usb/usb-testing]
> [also build test WARNING on balbi-usb/testing/next next-20200522]
> [cannot apply to shawnguo/for-next v5.7-rc7]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see https://eur01.safelinks.protect=
ion.outlook.com/?url=3Dhttps%3A%2F%2Fstackoverflow.com%2Fa%2F37406982&amp;d=
ata=3D02%7C01%7Cpeter.chen%40nxp.com%7Cd98349851abc4e0abf1408d8006799d7%7C6=
86ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637259792390096024&amp;sdata=3DyR=
FR26%2FjlA8dg0wS4xGplfPvXtG8tYa1qb2lroSsq0Y%3D&amp;reserved=3D0]
>=20
> url:    https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgithub.com%2F0day-ci%2Flinux%2Fcommits%2FPeter-Chen%2Fusb-some-PM-change=
s-for-cdns3-and-xhci-plat%2F20200524-072451&amp;data=3D02%7C01%7Cpeter.chen=
%40nxp.com%7Cd98349851abc4e0abf1408d8006799d7%7C686ea1d3bc2b4c6fa92cd99c5c3=
01635%7C0%7C0%7C637259792390096024&amp;sdata=3DmJmxpr0897Sk415jiIGMg0Q7jIxA=
O93t%2FvUoJxAOXIg%3D&amp;reserved=3D0
> base:   https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fgregkh%2Fusb.git&amp=
;data=3D02%7C01%7Cpeter.chen%40nxp.com%7Cd98349851abc4e0abf1408d8006799d7%7=
C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637259792390096024&amp;sdata=3D=
nrCKZGGd4%2FFUKaIGm1PTn2OzeJ3XbSZvb9sn7GHgFBw%3D&amp;reserved=3D0 usb-testi=
ng
> config: s390-randconfig-s002-20200524 (attached as .config)
> compiler: s390-linux-gcc (GCC) 9.3.0
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.1-240-gf0fe1cd9-dirty
>         # save the attached .config to linux build tree
>         make W=3D1 C=3D1 ARCH=3Ds390 CF=3D'-fdiagnostic-prefix -D__CHECK_=
ENDIAN__'
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>=20
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>=20
> >> drivers/usb/cdns3/cdns3-imx.c:150:12: warning: 'cdns_imx_platform_susp=
end' used but never defined

Will fix it at next revision, thanks.

Peter
> 150 | static int cdns_imx_platform_suspend(struct device *dev,
> |            ^~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> vim +/cdns_imx_platform_suspend +150 drivers/usb/cdns3/cdns3-imx.c
>=20
>    149=09
>  > 150	static int cdns_imx_platform_suspend(struct device *dev,
>    151		bool suspend, bool wakeup);
>    152	static struct cdns3_platform_data cdns_imx_pdata =3D {
>    153		.platform_suspend =3D cdns_imx_platform_suspend,
>    154	};
>    155=09
>=20


--=20

Thanks,
Peter Chen=
