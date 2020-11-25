Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74D642C3675
	for <lists+linux-usb@lfdr.de>; Wed, 25 Nov 2020 03:10:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgKYB6R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Nov 2020 20:58:17 -0500
Received: from mail-eopbgr20050.outbound.protection.outlook.com ([40.107.2.50]:21983
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726155AbgKYB6Q (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 24 Nov 2020 20:58:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FWjNAByNGkTadpnkpscIAbR83V2PRUtbesBl8KEoWFemmx9ojd5m+ZA9wy3KgVYAXD4nit4G8VrvguoM5V9XKlP2kj5SpCpXItQyHglg8X6+4VoT1i0XNq3i7aPAx1Zn0KSlBfbVfhtxRASrHAv1KDAGFu2HI/AFVDdyMz9uBJupIpdzXM/D30SECDVqknURCkEHkTyp9RDpnyqHNRVqDGCY6vhVqc6uIdweuTHLHlQI3jKzwq9lE9N/iNR0bCYt9WHFyFSB1z9BeBBBaj7y7DN8CBaY2sRazauxzwkDsjQIuKldpHw7iSNXwevPw8LjI7wnAZAsXWf5f01NE7rxVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s71z/vaQdYOYCp2yOp4m0GAvAp8Q5dA9dcsWLQrNXUk=;
 b=D9hgIu8vpXf0DElWJ8ZPYPy2Yjeg4zNdv4Y2BwTt9TXhZd+i0HgnxAASNFjpRywC2+EZ64YZyRDyJZy6/OPlGRmH0B82cciwBqY2fNbPchc9n9CMOZf/VK7sgREGLcG82F2iOztr4eKyEQnaCZghHpBXtNinpcBz8r8chEkB0OF64L2IOjWwBbIYRXNwzYD6U8kmTTy4movPC3pHvOHbKZA3186D8kRTyFV8xhBosVgfHjdVXv0e/dhJR4tGQL7w514AyYAO6HiOHsnQcWQbCQcfiEgjmj6V2cq+I7NvCoya3S0v3BK1+OvdIxVvDyvV6NxTDFnVfM93qI2OY1dzEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s71z/vaQdYOYCp2yOp4m0GAvAp8Q5dA9dcsWLQrNXUk=;
 b=hHEzCy8JOyaJshP7BLOQ91q5ZgYN3mLAs9S8QQCdHKO/akPNVSxNNiKir9kAAxiZPNJW3epcVlFxhfgzvsT103DRppLIXhWs+kxLwO1rGlNO/ZWlc5TLGabRVfLjjc3nSaM4GvhjD+XiKkaXrWbvfkAxH0+JmGqHpkmugnrlfDg=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (20.182.191.9) by
 DBBPR04MB7850.eurprd04.prod.outlook.com (20.182.190.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20; Wed, 25 Nov 2020 01:58:11 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3589.030; Wed, 25 Nov 2020
 01:58:11 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Fabio Estevam <festevam@gmail.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 1/3] usb: phy: phy-mxs-usb: Use of_device_get_match_data()
Thread-Topic: [PATCH 1/3] usb: phy: phy-mxs-usb: Use
 of_device_get_match_data()
Thread-Index: AQHWwoBjdKkP4Uur+ECB1vaKYiRwUanYC7mAgAAB7QCAAAoRAA==
Date:   Wed, 25 Nov 2020 01:58:11 +0000
Message-ID: <20201125015742.GF9929@b29397-desktop>
References: <20201124163912.12074-1-festevam@gmail.com>
 <20201125011447.GD9929@b29397-desktop>
 <CAOMZO5A91b1cVgakrpPtGpGiMDzCKQ1Z37Ae8UX4LbskwYO4gw@mail.gmail.com>
In-Reply-To: <CAOMZO5A91b1cVgakrpPtGpGiMDzCKQ1Z37Ae8UX4LbskwYO4gw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 364dacb0-a772-4ec1-670a-08d890e59065
x-ms-traffictypediagnostic: DBBPR04MB7850:
x-microsoft-antispam-prvs: <DBBPR04MB78500CA42993EBCC3144F8C68BFA0@DBBPR04MB7850.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CUDbfjGOcl5zETTB5j4Ck2YltjGQzje3aqa/LeS9TMEBPPA8InPcTruK1EXZV4vuwrl87VdlsIisbFVVpDMX+UDdvgNHvkKcaK/VjRjyaKCjdSGuzMfvAFlItzIzganHJ1YkuUvMZXij4d12cDtr367/OqBsCGu5TpJ/rFvjjPT+DRyj2DNIym7EoXsUcSLaWEpoy5bWIMuVT6nV1GCjhOz3KWeCa0HSCeR3tKb3jp81GLFUuJmVzSSG+aiy5iiV6gg8+K3dlOFQ2rz2Mm/LbgRFqCX6bJlg682pK5zx9039t1fOHTfSktvchDyRgZiLXktytcOZ8DaFSKPYrq9ZBw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(346002)(376002)(136003)(366004)(396003)(6916009)(1076003)(4326008)(186003)(71200400001)(33716001)(316002)(54906003)(4744005)(64756008)(76116006)(66556008)(33656002)(53546011)(86362001)(66476007)(6506007)(91956017)(66446008)(66946007)(8676002)(26005)(44832011)(5660300002)(6486002)(8936002)(9686003)(2906002)(478600001)(6512007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 1OGk7pqSGg4v9KpFrynNNdXAkuVJzD/+Jrq3iVAEo7Oxnuekdb2bIhh/Pep64RGU8aSdqJ4gFgg71i3fXOAaA0rWX5ioiJElhd8kowfZ6CJlnHNrJqS1kG2zf5r2WJeX94CGtSHkcHoBHuRAR17EpauJAYasbLtoJIA1E6SByJq9uUQyg76vRMUYbFe3ilrQXW5Sx9VRZ59tLGlsYML6ykzSM2w+xYTm16/bi819poq6uZG0bYfiJtw9NQQZdp8oUKCc21tAIXnG2oLpQY5eyKGTbGAnwHvcGJawIbtwWQ21MhMyRcTkYoV2uRE5rVIfoUJSsHnDfvFgilQFRCfOAZTWq0DFV7wXnKvEG7rCqxWnR/RCFX6ogiJualQ3DnxesP3GCmfmKh844ugnTKLbmEmc+wHlbHYzzyLe1EC8D7R1G18Yd3KL75T4WZrTaij6KZKgYSZd9EOhLzcY57waON9UaVA/vbt/2NBiRyK07ddY6kUbjUUTrrTrEI6zPpZqyu/d/3eUAs4weVRPG9/mho2efXHY/P3r654oO51J6a5U5LebBQF+rEMp0CgNCmXcVvoeiM7wcKhsrqaSgmbtM9Xfii9AJ3R/2LfV9Z0xUYss7VimlrDyoYSXqJCSJnlLNtgBU5I3HqyYOFxpdwhKaSZFmUuSXQvC4Vt7vDYldSfIwA17xoEno+TONRRUYn53VDitiASbv+RTLT8SgtmdvvQ7T60Wy0TfPfFx2rJMJyeNs5AF4sDW7JGEu6LUmPubK1V9NO7kn5jYBV3tViCA5hFLiW0VgBg1TVvkFxGaomns7jIn1FuL/4rUlK7HYRJ341ry4dP2ziH0pH/jzWB5qImTFenP2dHfSN4dMa91l4FynWJdyyUTFudXe+M+HjZeZcJMalFcfYyK/oMKIbAvxg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0452A6B38D4CCE488023046620BBB8CC@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 364dacb0-a772-4ec1-670a-08d890e59065
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2020 01:58:11.6145
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /513Ja3BaBWsfyDO3r5+WX+PM+3aB3h06cVv6FmdGjYZhVoX57xgtSXAOVX9mHdkCFs4x4xOPXIAYJbasSZJGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7850
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-11-24 22:21:40, Fabio Estevam wrote:
> Hi Peter,
>=20
> On Tue, Nov 24, 2020 at 10:15 PM Peter Chen <peter.chen@nxp.com> wrote:
>=20
> > > -     mxs_phy->data =3D of_id->data;
> > > +     mxs_phy->data =3D of_device_get_match_data(&pdev->dev);
> >
> > You may forget the error handling for it, eg, -ENODEV.
>=20
> How can this happen?

When adding the new SoCs, the new compatible is added at dts, but forget
adding at device driver's of_device_id table?

--=20

Thanks,
Peter Chen=
