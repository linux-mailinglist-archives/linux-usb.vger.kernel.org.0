Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 971921F4B97
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jun 2020 04:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbgFJCr6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Jun 2020 22:47:58 -0400
Received: from mail-eopbgr130048.outbound.protection.outlook.com ([40.107.13.48]:17828
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725798AbgFJCr5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Jun 2020 22:47:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Djp+brF9cl3PeOlLtERLQf8etjjOSPDVvYvlrHHj8bZ955lqdeseietW9zGfgMQcvOQWrz2yz+aH+1AzjVfEsDmXrgNCkRA8V9vPSGxgRI9FlLvbbHOfK4P+BZP3Mn+fwGZKs4PLDtB8Rb9PaszrIBOrziIFWc4fseufwn0OTnkyWiF52SvrMFLPQA6vnFHWwZO/6JSAhTnRNUnP8TtUOw/eN9ZrFJgwAJziP+kymtW9Qg3qd7b2at4Y/MyuXhmm5kZ/RfNnaXPejKa5w52gtVWUuKxUj3NNbyHCs+FxkO0f6PSYrJxuE7FD+BNneNq6w3WbOKGCFqRXQQufXW8now==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZhxXPgPT0lHOapgh72QgeABSuI8bfXnK5XzS/7l7A8=;
 b=cNZaeM+GfLooctvCsHSv06DCv4hbGyB4iTfxGu7MQxr4MT7Asu3V0ApF2bdbJ9/MCqxDD+siUZnM/qCJDImFWTpZr0XrVjofRFfM5RhVgZtbk296DuafX/xs3aXkqS1Ov/Gj493VAunSnxQpt2MHyAoPsl9NRBmhI1nrleHg4d9izGyh/61Dic79WEgHaHTlwOgJH9goJjb1GgR4Ni5RH7fw8uX8/rV5W2SsQ/xxjORO6EsXvt4YhNMJ3qmvkn/kiOaHY9KL6xAC1PwWEC98XpDq9h1jSd/dI+a97qh32qmJ/SzLhEmlGwf4wS8doA4/D3zv+wL4HAroAlpefcwM7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZhxXPgPT0lHOapgh72QgeABSuI8bfXnK5XzS/7l7A8=;
 b=g51snoeyb7F2YEIp3Y03AlyNGuZ91oRkosVsddLNOvEPW+464sOzvPRZCxK1uV/zrRM6ugryVYJHsIcQpNQ++dcihdRKVDA9jmmzBwANePL037tCpaYkRbCSpp0pfVJQ/+grR/WEzT+phoYr8FC+GFMTTDCn80IjPKR1Fet/+uY=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6837.eurprd04.prod.outlook.com (2603:10a6:20b:10b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Wed, 10 Jun
 2020 02:47:52 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3066.023; Wed, 10 Jun 2020
 02:47:52 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Jun Li <jun.li@nxp.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/6] dt-bindings: usb: dwc3: add property to disable xhci
 64bit support
Thread-Topic: [PATCH 1/6] dt-bindings: usb: dwc3: add property to disable xhci
 64bit support
Thread-Index: AQHWPlBrTuom4kZ7OUyC2lNKvwm9kKjRJo0A
Date:   Wed, 10 Jun 2020 02:47:52 +0000
Message-ID: <20200610024816.GA18494@b29397-desktop>
References: <1591701165-12872-1-git-send-email-jun.li@nxp.com>
 <1591701165-12872-2-git-send-email-jun.li@nxp.com>
In-Reply-To: <1591701165-12872-2-git-send-email-jun.li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 63e69d50-a95c-433b-76c1-08d80ce8abbb
x-ms-traffictypediagnostic: AM7PR04MB6837:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB6837E9B050B541624BBBD5548B830@AM7PR04MB6837.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0430FA5CB7
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f24a9HS/LH0jbscaA/BBhO6APECiA6OTs7szkGgq2pf0AjbP+5BiytPzGLQDpAzYLTnGXtd2HcO3a2f4ZftaPxFwfwsHUKYNMAT40RnBk7VDuYBnsaRnFxs/ASHND4ZtS1q47Qd6wgg4OLIXtQ2mJVCGsJF/1LBf6lxcy/VclbiTFi6lklpByzQHMj3pgDR8Q3sd/VvMzZFoHUhUUp2mJ17l28wUQXRQGVo63TDn/Bkz70d7gimfEr8rVo6PBP3xx3jhxkRFzf9gakGdgmeA96gVbHCpCXMthKuVoh+l5TeLmtZR35kexD9x2A9Xo9gZ2XOf1mHQFivmiVOgRuUcXg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(7916004)(39860400002)(136003)(346002)(366004)(396003)(376002)(6486002)(6512007)(5660300002)(26005)(64756008)(86362001)(2906002)(66946007)(91956017)(66476007)(66446008)(186003)(1076003)(71200400001)(9686003)(4326008)(66556008)(76116006)(8676002)(8936002)(54906003)(33656002)(478600001)(33716001)(6506007)(316002)(6862004)(6636002)(44832011)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: RU0Lek9CmdzYeY1KpqJbvlhNEkqNnJ1z3ImfJsuPwfmaaqwfLUFXoCUwqAr/KlXzWifyN7YNTWx22NtpEy33JPV9XHwhFG/OdXpe3+HvnSTpLkapOiZMRqrT+UHqjzDwSoQhHizbIVZWIupnZgAf671Ab6rBUV9BQVmhPyV/3EyUhIX7I/+oKhftOfC2xDvMA/fVADSdDjTQ8VkHgbIASH1171ybjmndZRZVuG7MphSywPXTdRHtsiBXUkM5tUqdq8fiEGbO9fkFCg3AEzImntN1J7qsnSuPYfNSi+Et1H9NPqnXEJHUJ0Xsl7NiC1Tw3AkD06tOY0VYHAnoXr1pYF9cWLoVXq2DuUH6g+h7r0lJiBcAvJCN9qDCLHKZsj655Ih4fpJgchyZfPkSbBq7KXd8rnDZ4LO8+P0gyZ8WYmeId2xQlxEHDTH20NJOT1I/JdAlWaVk0g+Huuxkh+bkuvdc+otN+F1eHInP2KhMfM4CNkhl2MJtxqrGWPeKwYpl
Content-Type: text/plain; charset="us-ascii"
Content-ID: <389AA3A11EE6EF4FA6D80A13C7B414F4@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63e69d50-a95c-433b-76c1-08d80ce8abbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2020 02:47:52.4875
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: frybLx72RoXriYmwfcoPw5gj2EVWh+6lVw3KwMzyfirhncBSJ2AeJTOYypp0EDFesEuIGY49xArHlMVryYwFBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6837
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-06-09 19:12:40, Li Jun wrote:
> Add a property "snps,xhci-dis-64bit-support-quirk" to disable xhci 64bit
> address support, this is due to SoC integration can't support it but
> the AC64 bit (bit 0) of HCCPARAMS1 is set to be 1.
>=20
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentati=
on/devicetree/bindings/usb/dwc3.txt
> index d03edf9..d16cba7 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -109,6 +109,9 @@ Optional properties:
>  			When just one value, which means INCRX burst mode enabled. When
>  			more than one value, which means undefined length INCR burst type
>  			enabled. The values can be 1, 4, 8, 16, 32, 64, 128 and 256.
> + - snps,xhci-dis-64bit-support-quirk: set if the AC64 bit (bit 0) of HCC=
PARAMS1 is set
> +			to be 1, but the controller actually can't handle 64-bit address
> +			due to SoC integration.
> =20
>   - in addition all properties from usb-xhci.txt from the current directo=
ry are
>     supported as well

Why not adding it at usb-xhci.txt directly? It is more like general
property, I see Renesas rcar platforms also have this quirk.

--=20

Thanks,
Peter Chen=
