Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C54A24C9A4
	for <lists+linux-usb@lfdr.de>; Fri, 21 Aug 2020 03:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbgHUBrc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Aug 2020 21:47:32 -0400
Received: from mail-eopbgr70074.outbound.protection.outlook.com ([40.107.7.74]:18470
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726957AbgHUBrb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 Aug 2020 21:47:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z8eSXZGz6BPablSECjWat+Sv15c6oo70Qtws/F8xpIDtTEYgB2vDv+EjlhHgHHRWDqJo5+HoQ5b93WjUGIhR6KVws41w92JCXZ0FgEVbklewp7oE+/Ow50G4ULV2ZGhGX+vWnfivTyT6XCONsl4hP3sEY/wI7XnMoqwGHZD1aJLH4bbzzYmAfeSft68z3LGrh0PLE//b6lE+bQV+pCCKomnEH4k/pnRk0U3scNuRRSJuNJALb2VfHPZlqtucQNHjumvgMwL/sEmIsZfAWFT0KdAblrmTbQp1BwV2ZrScewjE//GZseJQPNjm1oaMpct2N0b6Mp/BkT0hRctE1nQVMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ocW3hWAV8KqCDAR4Z97YrGXOmQxbJLACpGpWpC2B+8Q=;
 b=VtrwAIfIco5ksCplNm36/AdA64H4uIWS4O5CC2sLEFOih1BBWe+lFtH8xrqMG59CQcwUGaMcO/67Lje9mEGCU34zlTbGVbrDqP2AQ0Leg592h0zn9+UTWEIyKoy1biX5OuQKNpXrhIJC5b9y/kbGFTmpiTngRAmOkUsgB6M9Kl1/WORrbE9MQYdHwBo9Zmd7cEsFUlNzInguKlYfWzqYwNzcowNaIt0JyQUU5x1XrhBgI4+DJU0WtlvGy97L57kC/QRQgaVOSjpeTxc7NlIq8KIfBLkyms40s8yVdwWz9scM4et9R+aRig7ma/xsUrLyPwiIe7XsBIV/JGP9svLXAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ocW3hWAV8KqCDAR4Z97YrGXOmQxbJLACpGpWpC2B+8Q=;
 b=S4e9nWwzt0ByIAHkuqFh2X/BR+nzLcqP90rV4ebhHtQX3rMIGVRMHv1+eUq7EHwgKaQs1cBEY5wTFWxYcTQMh3t2IDkZRFHT7/2NVQGi5rvay4z+q7qeQrZtm4cuMgDSeqaeMyNSfa8Fv8qdgVJKUfbY27G/iacfvcrbjL71dLU=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB6191.eurprd04.prod.outlook.com (2603:10a6:803:f8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Fri, 21 Aug
 2020 01:47:26 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7%4]) with mapi id 15.20.3305.024; Fri, 21 Aug 2020
 01:47:26 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Jun Li <jun.li@nxp.com>, "balbi@kernel.org" <balbi@kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 1/2] usb: dwc3: core: don't trigger runtime pm when remove
 driver
Thread-Topic: [PATCH 1/2] usb: dwc3: core: don't trigger runtime pm when
 remove driver
Thread-Index: AQHWZN0rJQoK0XbntUeCX03Y3CvJM6lB8DuQ
Date:   Fri, 21 Aug 2020 01:47:26 +0000
Message-ID: <VE1PR04MB6528011CB06E23D32636DECF895B0@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1595940161-3700-1-git-send-email-jun.li@nxp.com>
In-Reply-To: <1595940161-3700-1-git-send-email-jun.li@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 79ec604e-87e8-473a-2e30-08d845742863
x-ms-traffictypediagnostic: VI1PR04MB6191:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB6191DB0DA41E4240EED07F08895B0@VI1PR04MB6191.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:182;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: akKA7P0eHKWqlJMBxE3fb0UKHUKweVxNm/DKD0syfA4BtJUBmD9s1qM84A1ngXXfR9SuLsuwK6lGxvd0s6jfsvgfyiKHFBzegWLWXhezGGXSvve3vpgjnQwixgdTb26zJ1RzbQDwS6J2aHWWZdEKZAHYZjW32cMKZZ7+XwhW2mJYvuqa6lIryPVcKIWfz1H9IhPWqzi+DC9pPbDf1m85x4UYqUVr5pK2lsku1AwO5dORx64JVye2pElyuMOURE/kbAQ5mek/ZAg6Cwv/f0C8g7e+t6vJkx15a9U/ij6+CakV9soYmuNnXjgUubfCwOJy7pmr7JIN5SyzdsjHQ/oApA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(39860400002)(346002)(376002)(8936002)(52536014)(54906003)(9686003)(110136005)(2906002)(186003)(7696005)(71200400001)(44832011)(33656002)(45080400002)(4326008)(26005)(316002)(478600001)(66476007)(8676002)(53546011)(83380400001)(76116006)(64756008)(55016002)(5660300002)(66446008)(66556008)(6506007)(66946007)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: vU2tOotMJ07n74B7wrrimMjqZxoNJv4ybKh0fgsptmH06FMuE93D/6O5nmz3ZvapkrzIPsqDQt58Ie+x0uIBvvzGBc7cnZdc83+aveHy6TI/2UAfY6D6FQV0IRDCk9m8PxSqTjP5HGZowez1ltq6wnYemqF/sEM3j/GneJZw63zHvns02I7gA8zdMiHuX9N5hVNHETn5KKrE4HxMc3/GJZZIAK22qCID45XFxAYKau+lUWr+v8dR13Ymui0YoLHcav7lpgcvfXzB6szVyVpUpVQXPb2lDhcaILJs6IZJ+tTq4cP2A2oGQ6r8i/lntFCViSw9yh9TEb+mVDJ0fu4LPNWxIlAP1qFNOz5b/OxuyPCLvJbQ3Z+W1tQb8fT0h45e8LPYk8gb4PTSHOA1b2h22eB++8Jq/R3wy1qekDYouQB1kHlKWbhIxXSpmjrNKHXR5ZoRZUAN5JiR93qEpfL4LeC1k69y725gB2a8ivugwp29uM+TZcjOB/aNoYhnrpARWjxha1D0k8r96qyHOjDFlJeXGm4W55utprf9833dSseFST4xuVNMWzMi8JDh4K8xSPfWnkJWhlv3IbptcLhHu95HDQtbpiMolghrGGjEvph29QZg4Ej9xpLJoc1Jz136harfXp8gjF5tJS8iZYcttg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ec604e-87e8-473a-2e30-08d845742863
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2020 01:47:26.7237
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TP05wImG9d5eUy61atdUoFBWGvjj8vjRBEeLG1cPSQQtLA9vPQR1AP4GXOIaI/8H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6191
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

> -----Original Message-----
> From: Jun Li <jun.li@nxp.com>
> Sent: Tuesday, July 28, 2020 8:47 PM
> To: balbi@kernel.org
> Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org; dl-linux-imx
> <linux-imx@nxp.com>
> Subject: [PATCH 1/2] usb: dwc3: core: don't trigger runtime pm when remov=
e driver
>=20
> No need to trigger runtime pm in driver removal, otherwise if user disabl=
e auto
> suspend via sys file, runtime suspend may be entered, which will call dwc=
3_core_exit()
> again and there will be clock disable not balance warning:
>=20
> [ 2026.820154] xhci-hcd xhci-hcd.0.auto: remove, state 4 [ 2026.825268] u=
sb usb2:
> USB disconnect, device number 1 [ 2026.831017] xhci-hcd xhci-hcd.0.auto: =
USB bus
> 2 deregistered [ 2026.836806] xhci-hcd xhci-hcd.0.auto: remove, state 4
> [ 2026.842029] usb usb1: USB disconnect, device number 1 [ 2026.848029] x=
hci-hcd
> xhci-hcd.0.auto: USB bus 1 deregistered [ 2026.865889] ------------[ cut
> here ]------------ [ 2026.870506] usb2_ctrl_root_clk already disabled [ 2=
026.875082]
> WARNING: CPU: 0 PID: 731 at drivers/clk/clk.c:958
> clk_core_disable+0xa0/0xa8
> [ 2026.883170] Modules linked in: dwc3(-) phy_fsl_imx8mq_usb [last
> unloaded: dwc3]
> [ 2026.890488] CPU: 0 PID: 731 Comm: rmmod Not tainted
> 5.8.0-rc7-00280-g9d08cca-dirty #245 [ 2026.898489] Hardware name: NXP i.M=
X8MQ EVK
> (DT) [ 2026.903020] pstate: 20000085 (nzCv daIf -PAN -UAO BTYPE=3D--) [ 2=
026.908594]
> pc : clk_core_disable+0xa0/0xa8 [ 2026.912777] lr : clk_core_disable+0xa0=
/0xa8
> [ 2026.916958] sp : ffff8000121b39a0 [ 2026.920271] x29: ffff8000121b39a0=
 x28:
> ffff0000b11f3700 [ 2026.925583] x27: 0000000000000000 x26: ffff0000b539c7=
00
> [ 2026.930895] x25: 000001d7e44e1232 x24: ffff0000b76fa800 [ 2026.936208]=
 x23:
> ffff0000b76fa6f8 x22: ffff800008d01040 [ 2026.941520] x21: ffff0000b539ce=
00 x20:
> ffff0000b7105000 [ 2026.946832] x19: ffff0000b7105000 x18: 00000000000000=
10
> [ 2026.952144] x17: 0000000000000001 x16: 0000000000000000 [ 2026.957456]=
 x15:
> ffff0000b11f3b70 x14: ffffffffffffffff [ 2026.962768] x13: ffff8000921b36=
f7 x12:
> ffff8000121b36ff [ 2026.968080] x11: ffff8000119e1000 x10: ffff800011bf26=
d0
> [ 2026.973392] x9 : 0000000000000000 x8 : ffff800011bf3000 [ 2026.978704]=
 x7 :
> ffff800010695d68 x6 : 0000000000000252 [ 2026.984016] x5 : ffff0000bb9881=
f0 x4 :
> 0000000000000000 [ 2026.989327] x3 : 0000000000000027 x2 : 00000000000000=
23
> [ 2026.994639] x1 : ac2fa471aa7cab00 x0 : 0000000000000000 [ 2026.999951]=
 Call trace:
> [ 2027.002401]  clk_core_disable+0xa0/0xa8 [ 2027.006238]
> clk_core_disable_lock+0x20/0x38 [ 2027.010508]  clk_disable+0x1c/0x28
> [ 2027.013911]  clk_bulk_disable+0x34/0x50 [ 2027.017758]
> dwc3_core_exit+0xec/0x110 [dwc3] [ 2027.022122]  dwc3_suspend_common+0x84=
/0x188
> [dwc3] [ 2027.026919]  dwc3_runtime_suspend+0x74/0x9c [dwc3] [ 2027.03171=
2]
> pm_generic_runtime_suspend+0x28/0x40
> [ 2027.036419]  genpd_runtime_suspend+0xa0/0x258 [ 2027.040777]
> __rpm_callback+0x88/0x140 [ 2027.044526]  rpm_callback+0x20/0x80 [ 2027.0=
48015]
> rpm_suspend+0xd0/0x418 [ 2027.051503]  __pm_runtime_suspend+0x58/0xa0
> [ 2027.055693]  dwc3_runtime_idle+0x7c/0x90 [dwc3] [ 2027.060224]
> __rpm_callback+0x88/0x140 [ 2027.063973]  rpm_idle+0x78/0x150 [ 2027.0672=
01]
> __pm_runtime_idle+0x58/0xa0 [ 2027.071130]  dwc3_remove+0x64/0xc0 [dwc3]
> [ 2027.075140]  platform_drv_remove+0x28/0x48 [ 2027.079239]
> device_release_driver_internal+0xf4/0x1c0
> [ 2027.084377]  driver_detach+0x4c/0xd8
> [ 2027.087954]  bus_remove_driver+0x54/0xa8 [ 2027.091877]
> driver_unregister+0x2c/0x58 [ 2027.095799]  platform_driver_unregister+0x=
10/0x18
> [ 2027.100509]  dwc3_driver_exit+0x14/0x1408 [dwc3] [ 2027.105129]
> __arm64_sys_delete_module+0x178/0x218
> [ 2027.109922]  el0_svc_common.constprop.0+0x68/0x160
> [ 2027.114714]  do_el0_svc+0x20/0x80
> [ 2027.118031]  el0_sync_handler+0x88/0x190 [ 2027.121953]  el0_sync+0x14=
0/0x180
> [ 2027.125267] ---[ end trace 027f4f8189958f1f ]--- [ 2027.129976] ------=
------[ cut
> here ]------------
>=20
> Fixes: fc8bb91bc83e ("usb: dwc3: implement runtime PM")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  drivers/usb/dwc3/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c index
> 5c52da5..0444018 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1590,9 +1590,9 @@ static int dwc3_remove(struct platform_device *pdev=
)
>  	dwc3_core_exit(dwc);
>  	dwc3_ulpi_exit(dwc);
>=20
> -	pm_runtime_put_sync(&pdev->dev);
> -	pm_runtime_allow(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_put_noidle(&pdev->dev);
> +	pm_runtime_set_suspended(&pdev->dev);
>=20
>  	dwc3_free_event_buffers(dwc);
>  	dwc3_free_scratch_buffers(dwc);
> --
> 2.7.4

A gentle ping...

Li Jun
