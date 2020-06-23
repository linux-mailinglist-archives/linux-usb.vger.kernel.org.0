Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26CEF20529F
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jun 2020 14:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732628AbgFWMhj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Jun 2020 08:37:39 -0400
Received: from mail-eopbgr130089.outbound.protection.outlook.com ([40.107.13.89]:4064
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729611AbgFWMhh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Jun 2020 08:37:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bpRE0DnFcbP1rOk4pPNNRkBFe55tVIcdMi/7QDK0nHRPEwl89hoTKQYtKa4I8i7PlWVEt7859QSgVW4VfmKrYwLwLpqr9elEl24rjSqrQ4VRObBqsziN5YXVIymJfj/tbCnuxn5DlRmtqWqWUR2IngdPldU7u0V0UqSIMNN1Ta3XRhJnSY2o0v8VCTfdh1bSTtsOKYhJWr8spedHYCvq4V0mi54EE6QduUjfNKCptPizzfFiclyloTHdQi9uuo5Hiuokr/0m0HVYVNIiUQRz4i3BOfniBFi7+GBbEle4rrxSZ4ut0PUZKvcapSrfZTbvuTpX6n8KySV3Wgf8IvhG+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVQxXTMKtlyt3gNaN6JrC8ZC/v89k20/HTa8KWVY5v4=;
 b=eeYPjpH2APhqyC28wGGhiAdfRHmmxm1aESzXKZJdwZUhB/DSld/EpuJKk1//UcscMy9/d2GgC0CUv3sShmPEhUo+S43HOdrhFw9Hb8MzO6dWbG0nug/xxwc1pDUhdNJqr5fpxkzj17eJGBzPwmSRj7PcI4LMEZ7sExKiwjFB38rm2RzkkXP2vBnSdpaguli/MmmzEkAY1JxyoLivVjt1kXIDCXJGmIZL6X898ipFIrEsGa7VeH0v558R3yLFPr9NXRUCuXpeW94vWMJbvtEYub58FChunX0qpLjVU3bQns0aPavneS2JuTJeygqzF2ZLhk3vbTNj8jjtZHfMxQOhIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVQxXTMKtlyt3gNaN6JrC8ZC/v89k20/HTa8KWVY5v4=;
 b=QOl6hv4v4n3VKx570SXPd5W/JLwTrzRB6uvtxKbVCvHP6lXA8DkWMJXdLeWnHRORa/nQFZJVxJZE9sQpVIdKGEICA1VXe7hX47O7U80ayqtr9j4rIFGV+bMya850KM+PVuIXKI6XgqSnxKx1ZMy6wHu0KaVwn08n+HtRLwKOPgA=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB6351.eurprd04.prod.outlook.com (2603:10a6:803:128::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Tue, 23 Jun
 2020 12:37:34 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::30e2:71b0:ffd3:e39e%7]) with mapi id 15.20.3109.027; Tue, 23 Jun 2020
 12:37:34 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Shawn Guo <shawnguo@kernel.org>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Peter Chen <peter.chen@nxp.com>
Subject: RE: [PATCH 5/6] arm64: dts: imx8mp-evk: enable usb1 as host mode
Thread-Topic: [PATCH 5/6] arm64: dts: imx8mp-evk: enable usb1 as host mode
Thread-Index: AQHWPlByhRTFPy8+3E+K0YuATAk1xKjmIkUAgAAVYHA=
Date:   Tue, 23 Jun 2020 12:37:34 +0000
Message-ID: <VE1PR04MB65283346BE373F8D0D2D8D4789940@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1591701165-12872-1-git-send-email-jun.li@nxp.com>
 <1591701165-12872-6-git-send-email-jun.li@nxp.com>
 <20200623111423.GZ30139@dragon>
In-Reply-To: <20200623111423.GZ30139@dragon>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9feea47b-146f-4afa-aedb-08d817723473
x-ms-traffictypediagnostic: VE1PR04MB6351:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB63511FF6ADD8CF102D6CB72089940@VE1PR04MB6351.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 04433051BF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M7yI2GJeCSUy6oN0Td4deoILXxql3iF4GLtm6wKn+X/HOZTBL8GdtptwqIpbhr7a8RMACO4gPT7d31qyf8VASOHTq00/Q9PfxG1VnOg+W59PuzDbqWOuv+iscVatafkqQNOj8ViUWfr3Bfx0vAWo0J5nnwA3lnK+zx35qqao2k5rgj9T/RWSpfR6fPCLRfOa5f1dKsEo1EnIfrAAYL0Xfky7PuTolbxf0a3dCesaI7056mNA1f+u3M+u+h8Uals6dZ/29HRjtkc/PascyqZQ9YLIlEBQ+I9J1yz0GF3IioV+b/A7GTmy26TBTpjRNwHce4NSky2DGvS2SttsjeSOzAHkWK3WutJwkzy86rWdwNKCfoRPxahgv7aMVNtILtoQ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(4744005)(86362001)(6916009)(8936002)(52536014)(5660300002)(8676002)(66446008)(64756008)(66476007)(76116006)(71200400001)(66946007)(33656002)(66556008)(44832011)(6506007)(4326008)(26005)(186003)(2906002)(9686003)(55016002)(7696005)(54906003)(498600001)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: oiRv8ClZWOpOWXu/InU366eMtTPzQfoQtjHpRZv0Go2OcLgbr/MUICfmVmtiY+ofZU9TbaPMgvc/ccQcvv7681Q3DTxJIyD8ZiShfth39X9XoSA9Q6S8NdnkuiVe23F0mMP6cEBTcaf+jAuSbVp8MxntOV2WGHIVsLb2aUAqYiHLJuNW8DmxMhNQEtVArnjiCfEMP4Ly3C3O/K9RmjDMVOh7Y18C0dQBNogVVNDjggpk7Fwn3R3CCyHeZjSpdjSUJXnQSfF814Hv121id0pgXM5N7LCbHz976308dQP3OYtmWceRi99xHKQVGwATydzQpBmCFPTQAZnGeX9GwgKbQZ+rlpAJGpGinnHXwPHWrNlxgIxft/F9ZeOg5fdJZNwbNJsAynD1cGJk15pHcbzY3JhUNSPszZki8GMxRKU6RDHNqI9cztEqWk8vyU9C2hWEgMhHcrItpPrgKDeZglrn8U38Pwj3CAPX3pjiPwJNGdI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9feea47b-146f-4afa-aedb-08d817723473
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2020 12:37:34.5023
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OJOyuax7NGH425gl4v955BU0dbRKvj7CmVwat4eMuyBHDFBFcSDrZl21l60PwrZv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6351
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> > +
> > +	reg_usb1_host_vbus: regulator-usb1-vbus {
> > +		compatible =3D "regulator-fixed";
> > +		regulator-name =3D "usb1_host_vbus";
> > +		pinctrl-names =3D "default";
> > +		pinctrl-0 =3D <&pinctrl_usb1_vbus>;
> > +		regulator-min-microvolt =3D <5000000>;
> > +		regulator-max-microvolt =3D <5000000>;
> > +		gpio =3D <&gpio1 14 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +		regulator-always-on;
>=20
> Instead of having it regulator-always-on, it should be controlled by usb =
device,
> right?

Right, I will try to use that pin as usb power function instead of
GPIO(regulator) for vbus control in v2.

Thanks
Li Jun
