Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06F7F260E89
	for <lists+linux-usb@lfdr.de>; Tue,  8 Sep 2020 11:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729053AbgIHJSQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Sep 2020 05:18:16 -0400
Received: from mail-eopbgr40080.outbound.protection.outlook.com ([40.107.4.80]:34765
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728676AbgIHJSL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Sep 2020 05:18:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxLhD2WcntrBgtKAXOZSmaZrjlq42bi83l8V1jogJGJJcktVYWgPuxamzXW5g8P61HaG1asVTygSWy74TbflkzOvi2XqI2Xep/TZ4CkyW3Q/fDm9unVVcblsuMEWdJnPNcZWcfuWxJL+SP6aYkzm1EswvXJMYoPZ/jfmn/hRtEgpDlxHeQ0eOnUVolXMqPBQ8uYuOjW1yaStkMQxJKfkQh0hgWbDBJaMhH2ekIE13KK0tfRCBKgsPKyzxFBLk9Qj7RO1TSsjrqJPa6zEizif9bNZznb2Lq3WGx68cAp8tbtFAbz6PAJRd2AZhuVGHgX8ofUGSdFdv4aTQFQJIRhQJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zczU3uoBCjPbrhE+6VB/kAQMwZU8PkxwBxyXkE2CApg=;
 b=jymsPIwazb0eM+cbKMVnGk8jqmPMVaV+8ipQgVyK3yhlOPkrrFADAOTKu9H0WIsKMxr7g2XTYcQVqf/6y5deGH7Jwu3vA/c6rytP/QM/6Xhm5iAeQlOl1zYlCD+7HgmNTyByQeQWH+ofkMxMxw7h6jRBzmPTAxttJ71KG+yhgIKiAwhC23iOfjSoyk4rcVXHkIWBL19z1EHjzveA9lxTRrxdrjTO+NBKQvQVMpPV2TiRkfLVfY2MYTer+TEvCPHUkioHG3dz8vAxkDhyp+WBMbgqJdtlmfgPjPKJxGImR91nryHQ8gJeHpeFQFCHCvoA5CJvcASkkMcv6o0RXWZBnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zczU3uoBCjPbrhE+6VB/kAQMwZU8PkxwBxyXkE2CApg=;
 b=cUkC23YQ+I5nqWT5ert5r4te03EdGaGUGHAYnHs5ZELj63ZuKVr/EoZbyDK39VJ1SM36xBXUVJj9L/2FZQaCtnU4d7fUPvIC+0HNQfMEQbBXrkSl6n872pM/4+Bo/mZRzigSDGPxc7SWU0gM7bD1UBrslhkv0IA3QyH4XGW2a8Q=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB5367.eurprd04.prod.outlook.com (2603:10a6:20b:2a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Tue, 8 Sep
 2020 09:18:06 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 09:18:06 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH 8/8] usb: cdns3: gadget: enlarge the TRB ring length
Thread-Topic: [PATCH 8/8] usb: cdns3: gadget: enlarge the TRB ring length
Thread-Index: AQHWgDxIffbmBfOBQUepN1bKpJMDzqleUzEAgAAuIAA=
Date:   Tue, 8 Sep 2020 09:18:06 +0000
Message-ID: <20200908091738.GC18578@b29397-desktop>
References: <20200901084454.28649-1-peter.chen@nxp.com>
 <20200901084454.28649-9-peter.chen@nxp.com> <871rjcn5hb.fsf@kernel.org>
In-Reply-To: <871rjcn5hb.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 544d3136-a9cc-477f-2a9c-08d853d81874
x-ms-traffictypediagnostic: AM6PR04MB5367:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB5367ABD06F4F796CB7CF8CE18B290@AM6PR04MB5367.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WqekWJMpwgyTnYgU/NYa8Ajumr60yKXy6WFUPW7vUQNaDOV4OxFaN1+SWyRtbmL3q8Xemor2e/BMD+GpdCTrQyqeXCWTKgQ7/sI+tLyjZVWinFUAHq1IaZn4pMlGjC6+GS8dZb1j5shOKmX+K/VE8fAaT6wlTYpL0XwEulOIv6vAVJIQwFrrzFqnJ2MMgBxczEcU7PDtmNLPAYeaTHtfHj94FThekWQHeyFKc4L9jFwZwEiTEU801a939pD9OMInlPiJmTQwd10uwP0IcDjABN+YqzpUxTDEeu9+MZbfvb56CQ22NF0jJzOFlgJ9xJVZyD0Dp7385RHVFnV/IdphlhXdHKqo/7MJYLLWDKADM9nJuS/LgxvrHXihGI/WeKEUuHnhRTWBiO26oYiD/VrFtw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(2906002)(8936002)(186003)(26005)(8676002)(9686003)(6512007)(44832011)(316002)(4744005)(4326008)(54906003)(6486002)(66446008)(64756008)(66556008)(1076003)(66476007)(33656002)(76116006)(91956017)(66946007)(5660300002)(478600001)(33716001)(6916009)(71200400001)(86362001)(6506007)(53546011)(83380400001)(161623001)(147533002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 4aX2aaDOWoV89STKgfHQjPx8Deyg85U9b5cNkxx1rGjy6UwyYHZgSsp0JaB3NmPGjsfec4JHkq4ERm3g4ZKm0EHJPzZzXy4ZUTQ3uT9nEcatB2vQXUuIjQGbjuewWYrhGFd0uXRf/MfjNixQGIpdV6/40EPydsyY1MMj9oLcr6M8jCpugs8K4UaNf/jtm7SHrdhKW2OEZJ8K2btUXiyY31KqxpU6qy3S9kgC6xk2cnrRe2lB6yH48d2G0cjnPEKZ5UVSJ3YlykcjgEKYJJ0I6FTOQTLjrahB8MRXJpv41PdXJt2QbMMRuBvD2Q5d/YyQcG3fIe4n1gjkY6N4srxeG0H567ucGs9zhMJde3XdIK8Nz4XrP8B2QfzKtNjVEez0dgqJGcY8zxB/384DKEcwXvdWh4qELKqiZUlq2h67U2IUaa4mWisFWzlKHX/73WEMUpiUKh/X3YwSNy7II3py67MXF9LpAj40H9xkj7AgSk0ceVLJ4GYHUpCJdzKJR5L+tAw5Gd3/V3KzRp4LkFDhxz2GrrZf9B4eP0I6cVHwlYy6TqsT8Wy7WxZjzWlUskytuV8cz740mrX2nMO87rDfMj4tjwSDekAyWEwTwvt2MzJ3LXi/LCowJg7SCzwJdsA1eJdgJazN90wkGAnHQjAdJw==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <03CA5ABC565744468D8C4F2D53E024B1@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 544d3136-a9cc-477f-2a9c-08d853d81874
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2020 09:18:06.0645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TxvKW8Ovqa/q4EBfNf+an9ZU6tShMq7BkccOnvRJsf5nXLuqZXrMGSFmKmsGl1rdNAtqsG/PG7qcHCXWUFRzzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5367
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-09-08 09:32:32, Felipe Balbi wrote:
>=20
> Hi,
>=20
> Peter Chen <peter.chen@nxp.com> writes:
> > At Android ADB and MTP use case, it uses f_fs which supports scatter li=
st,
> > it means one request may need several TRBs for it. Besides, TRB consume=
s
> > very fast compared to TRB has prepared for above use case, so we need t=
o
> > enlarge the TRB ring length to avoid "no free TRB error".
>=20
> can you give a little more detail here?

I will.

> How many sg entries do you get with ADB? What's the size of each TRB?

I remembered it is about 120 requests for ADB and MTP use case, 16KB for
each sg entry, so four TRBs (4KB/TRB) per sg entry at worst case.

> How many memory does 600 TRBs
> actually amount to? How many segments are you using per endpoint?
>=20

Each TRB consumes 3 * 32 bits =3D  12 bytes, 600 TRB consumes 7200 bytes.
One segment for each endpoint, one segment includes 600 TRBs.

--=20

Thanks,
Peter Chen=
