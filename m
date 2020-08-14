Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44B6D2444FD
	for <lists+linux-usb@lfdr.de>; Fri, 14 Aug 2020 08:25:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726064AbgHNGZL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Aug 2020 02:25:11 -0400
Received: from mail-vi1eur05on2071.outbound.protection.outlook.com ([40.107.21.71]:38753
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726315AbgHNGZI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 14 Aug 2020 02:25:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AEoWxxUOHsSN9OC1WkkHz3SNQjT0KsX/WMJ/DVxy0fojqse864YLAGxV4t6t8CTckz13PmcKFxd0irB9HqZkHaecbpjesC5ti5m51mELSVDcB0SqaQLy7H+iU06WwEwkvpFhygElVtEj0Aoq/ARirS6ZJgSnWvEL8Nc5uEW3h6QOrCsPBCbBqA3wAVMbNX+/11dzumEH49dIAUr0kE2zSo8pebja/Ag8ODjtgw/ToQ/tfG4UdiqbUUgfuOBydoimdGs3VgJHZk8JnCB8t6+f/VMaVsJZdfuSN6TxaAmFeWhc0Nhn1YCFXkrYi7baNr/Vq3oWdEsM4DfbeSuecnNDwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=okD/9gC/gEtWkWj8lQgEyTZVvGyqjAa06vtbxrW7Sbg=;
 b=W/tdHNoqvtBYdUg5y6YmstvOjShEXlJVvjtfMVur8wRDNuxWFxDSEks/BViZ6fhNsMDvv7GOMYK3TzvgTIsR/uO0+isiK/LhMxM7YqcwZhwFXDR7km2AgIp3r4q4UX2Y5seRj70LZvZuNh5z8dRULvRgYBFXbfzSFDKQiNoAaiTMOHIw4+XwLWxnufN4Dd9cIClAAleCLi1B3NACIuFGelgaCGXm9xDlcabazmNwsJqAWH+PFOlVNge3x1hZwzyGJ0c/yZN4NKRzDrJGOuAl30pPLu+0O060VcTr+M1ZqTyu23OXYMvh77QuuJsoL2k/a9nYnR08ko9I+0bqHdui6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=okD/9gC/gEtWkWj8lQgEyTZVvGyqjAa06vtbxrW7Sbg=;
 b=FetbC7/2+YFTj2tdoFg8doFMWiWVtv2R8Tgah7ig+CNeAGY0fMqhDwh11AbPG8y1jxxhxXi5ASr31ANtPr9fFFQ+jrGNlkj11DryQrkzRuQIuB+IIJnctRGsz6YzjXXCTV3ibyszzEhVxD01/cpxeh0wmUvBHKxgdhdXA/enHwk=
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
 by DBBPR04MB6154.eurprd04.prod.outlook.com (2603:10a6:10:c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Fri, 14 Aug
 2020 06:25:04 +0000
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2]) by DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::acee:9763:7898:84a2%9]) with mapi id 15.20.3261.025; Fri, 14 Aug 2020
 06:25:04 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [RESEND PATCH 5/7] usb: host: xhci-plat: initialize device wakeup
 default enabled
Thread-Topic: [RESEND PATCH 5/7] usb: host: xhci-plat: initialize device
 wakeup default enabled
Thread-Index: AQHWcSNEBiMk+Y3vU0eT7r/rwnN1Aqk3JMYA
Date:   Fri, 14 Aug 2020 06:25:04 +0000
Message-ID: <20200814062412.GC22554@b29397-desktop>
References: <20200813033741.13982-1-peter.chen@nxp.com>
 <20200813033741.13982-6-peter.chen@nxp.com>
In-Reply-To: <20200813033741.13982-6-peter.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2c435473-d318-4e37-1e40-08d8401ac874
x-ms-traffictypediagnostic: DBBPR04MB6154:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBBPR04MB61544384D2BD1832F5402ECD8B400@DBBPR04MB6154.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O/x3dX3WhgxK+f55v44G9Obplc064rbugCH798D6Sx/DBESGBpwGWtDdFPCxIeudivXLqZQJ9wKEDZUNHy3tzgQD0cXUGRtGKmHzdEsarJL2yMB2qXYKlTFxY7xJqEiBUsVyMfQDYBIYEEBYK+x8qODWc3R0e9IXdr75STWZ9hprpworhFU5uwQgtNe3qF6vDKTHMRzSyb4/lA/cyyzMamnLjflWjwu/+oYQ6x5i5Q/jWgSIg3XF+Rtl129r5LDjFrRZC1CbijtxJTd8ZrAfHtFMClix5n6xs2fHWu/Xg/OfALM/yloG95On8rmd4pgePLjuL1D8payUkZi59YNUUg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7162.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(5660300002)(66946007)(66446008)(66476007)(4326008)(66556008)(64756008)(6486002)(44832011)(9686003)(186003)(86362001)(33716001)(6512007)(2906002)(83380400001)(8676002)(54906003)(8936002)(1076003)(478600001)(53546011)(71200400001)(6506007)(26005)(316002)(110136005)(33656002)(91956017)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: g1MuSWb7gtmxpcogy0Qi3/JxNjRxQvF2M13+rNYWAli5HHSTk6ELNcFEWdkDis2xiGUrhNRhaA8ezONIkF2UXkaIi1IZz0gr9LkajjhIgxisU/iO8Y94ii6uWy/VugT1zefN+mn2UzbUpeAmmCuZtjOYAhRpLtpLLjActoTdrmgrKLhC8ymFyOvUio1rkE70GU2vTDPSRqo7r1bkllM0ZBIL/4jU25KoEq4x8ZaYtz+H2KNeDfQoUwgpR0IhQqH9ICxskU5AO9vbiG/FOWhiShdEu327EMHlOJzkVN0zj0vA4J6RL8sFhCfYU+Pjk0gYSMSU78wu9H+v+ItnxdzRfPjXKgaiMhModzd1wxzYuYe2Kyh/npsVYYtzO+UjA7z8VsxYYrYAYqqRxBKMI4ytWH15MkxvW3uxpO3keQx/VZUeMbQT0GNFNDfU3oaT5xFA+nzEUnebCBKO/NBwINr4/wt+m3dlqBOL3hhUbmTpAaKhewW8ViJdP4VnuhtzpncgRm+w7VMxkKtLfOKEu+3CX9IrkRG1uXVJ0IjnwNM6pLBgIYSOpjkwiLLJHFfzmvbRix8xpoaxGgThySiVR3V/yZRQGwfp0dc/RLRT4dvk+SFq8tsKN234Jcn7n3Q621MIpkZ4Zn2eb6orCiWOzzlLsA==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9A26C1B9AF26AD41ABC130752E5DBD23@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7162.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c435473-d318-4e37-1e40-08d8401ac874
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2020 06:25:04.7911
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mdzWs/A7XdvUltyXmyzo17f4LLcnQJQ2XXErJPwfeDJjeKXrLeprfKHdKUlr45MoqYX/lnnAfLyuuKIt5Alk3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6154
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-08-13 11:37:39, Peter Chen wrote:
> It initializes the controller wakeup setting as default enabled
> unless the user changes it, whether the controller responds
> the wakeup event depends on roothub's wakeup setting since the
> wakeup occurs at the bus not the controller itself.
>=20
> With this change, the controller uses this driver could have
> wakeup capability due to device_may_wakeup(dev) at xhci_plat_suspend
> is default true; without this change, this value is always false.
>=20
> Reviewed-by: Jun Li <jun.li@nxp.com>
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  drivers/usb/host/xhci-plat.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index 14ff65a387e8..0ef28b2caea3 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -287,7 +287,7 @@ static int xhci_plat_probe(struct platform_device *pd=
ev)
>  		*priv =3D *priv_match;
>  	}
> =20
> -	device_wakeup_enable(hcd->self.controller);
> +	device_init_wakeup(hcd->self.controller, true);

Hi Alan,

We may can't set the wakeup enabled as default value since it will
affect the parent's wakeup setting. See function:
dpm_propagate_wakeup_to_parent at drivers/base/power/main.c.
The parent's wakeup_path is set as true during the system
system routine, then the power domain for the parent will not be
off (See genpd_finish_suspend) after system suspend, it does not
meet design expectation. The expectation is the device's power
domain is only on if the device as wakeup source.

Even with host-only use case, the thing is the same. If wakeup enabled
as default, the related power domain will be on during the system
suspend no matter the wakeup is really wanted.

Do you agree I set the wakeup default value as disabled?

--=20

Thanks,
Peter Chen=
