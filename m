Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F376739004F
	for <lists+linux-usb@lfdr.de>; Tue, 25 May 2021 13:48:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232046AbhEYLt5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 May 2021 07:49:57 -0400
Received: from mail-eopbgr00083.outbound.protection.outlook.com ([40.107.0.83]:8334
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231370AbhEYLt4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 25 May 2021 07:49:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/U9nZNFgwRCGg79SDB2nlKq0pv6GcygGLASRxwvXd3qsb4CN1XyQKt7n44E6oTL0qHqGwBa7AFC5P69vrUqlNaO5cobXBuAO5PlWiVRoCnMvqi3BsO2cHMdn/F/OwVbK30IU91PrsiW4jzqgxPcPHYfokgew+nn0dRiEyhXRFUBILtPK2j+gN87KHd4MdX3Qw3sNKASsSpM9sVedgsL2WZdVJQwW0lTbhWC5vYK2LC6rA2+LEB5yVWqtmhr5UWB8+obXpo6M5yGDGI91kpJOoYmSiKClNQih5n9F+/TKjjaG7ttwNHPQ13PTtkMbfAy4ri1PnXvDM7Qyjg0oZbQvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4XUsmiZphXuYN54DCHKJKIfAPsUgJwMYAFrWIDk2rM=;
 b=dp6GuBSQM8z1ct7+7hdfGNxL1iBoFHSYGKUmWE4a5py32n++cUWFblJNxpeb+aE0JBXPMRydHn1+NjUHqARJkiNQk0MHiEWxwMzoRTJixBdLFPtGE4/0Gclq73hP1+wU0kwYlZpVtDNs30iA2POfIDB9p+CJQb+sIdrKgduryp93Ink2P7w3Y/wQleeuz8i3IIUWcmVg5wGkZLxGpnEAAIji8ngYIYj9A48ikmpKEXdnT47QTdomxUTCtcs89I0etZNE/uBnCdmztWsqxUTyVfx4GNXHr0DpJO7gp0QWZfveZ3++Ag5rLbbkn+KNtKDBT/8bdJxzr0Di5Gnb1VaLnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4XUsmiZphXuYN54DCHKJKIfAPsUgJwMYAFrWIDk2rM=;
 b=EeL8cCxK88Zz4j3S4pROB8IubovpmN3GcksTxFbeJUemAOTVAsIDHHjzfkgnaXhZ5se0/EPxGlPN+3BvOGNhUMUcquE7sjL/7PDaZABvgLIdQnrzdb0Mv3JrePbxvddX70+ryc48WopakledSDJobeUZZNDmUbhVmQ6G8/hoj/M=
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VE1PR04MB6607.eurprd04.prod.outlook.com (2603:10a6:803:121::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Tue, 25 May
 2021 11:48:15 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::453c:f24d:af8e:f194]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::453c:f24d:af8e:f194%7]) with mapi id 15.20.4150.027; Tue, 25 May 2021
 11:48:15 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Rob Herring <robh@kernel.org>
CC:     "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 1/4] dt-bindings: connector: Add typec orientation switch
 properties
Thread-Topic: [PATCH 1/4] dt-bindings: connector: Add typec orientation switch
 properties
Thread-Index: AQHXTIEFGGgpZp4KuU2p2ENqEKhApqrtKN6AgAb1bLA=
Date:   Tue, 25 May 2021 11:48:15 +0000
Message-ID: <VI1PR04MB59354AF207D956B1D3934A5689259@VI1PR04MB5935.eurprd04.prod.outlook.com>
References: <1621408490-23811-1-git-send-email-jun.li@nxp.com>
 <1621408490-23811-2-git-send-email-jun.li@nxp.com>
 <20210521013053.GA2430162@robh.at.kernel.org>
In-Reply-To: <20210521013053.GA2430162@robh.at.kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f54e902-7e6a-4c66-5f20-08d91f72fb8c
x-ms-traffictypediagnostic: VE1PR04MB6607:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB6607A5513DBA433F83DCC7FE89259@VE1PR04MB6607.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9aNOv6q666MMfOplvU6kGlLX6KPS5tYBm4+54FXx1PObdULUVK3+kIrr7BTzM9rfSp+bJW05pktZygJszeLh1ZCNGFNqvGntYnK8i2TAyc3ulScE83Pue9H0UGz+n+6HjOT7n+8b7ClKxTw9QQpCHg4SbF56GbuY+kmxkdscgA5KgVF/9/qdk8RZ2kT7FQ7q5Nf6zYFFl8HuERDxndG3xVt9C9rWTgzXg9LSAt0UOUIVgbMQth34qJiDdtuns7zfOMrSDcOoIYRtAI+miOBQ7jh06HT3RrFPRm86vbnQ6ESD9mPa0yTpyOUS1Q1Fa7U+icy7H34vDXEQnihRgBJ+v1+W69zB3qxoeORv7C3MvhDELPRzxdbwaf6NQzEcaIBBTNn7qH5vSXJ8rDMKVM5RPj0kB5Mju3MFz/10Fkx5CR6kyxnOYJyV/HBvGt+eBN8C1XthlpL0wAeOPd5XO+74khEZUvKHYjN0ON3c3pvel0I5GQGbRh4oV0yEO/uUNSO3T3THwTUvA5+JsPK1xkOzp9mdPjJQHZUYBvKLCTWcsaBg8QWxAk4nGL24kmxVMLNubFQ1GUjb3pbAC/zYTA7nIdhib49qf57vFYyedYITi74=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(5660300002)(86362001)(186003)(8676002)(55016002)(4326008)(33656002)(8936002)(122000001)(76116006)(44832011)(498600001)(6506007)(66476007)(53546011)(66946007)(83380400001)(26005)(66556008)(71200400001)(2906002)(6916009)(54906003)(9686003)(52536014)(66446008)(64756008)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?iHgwWGpZ+8ZOAQp+vH2Vhfjev1wNc0k01GkxreMd3kyi67Rh5GsZZvPHgI5k?=
 =?us-ascii?Q?BKG2vNFQoIR/tlCtJTC+FCU4d50HneTMYeSlPOlmuI92FSjdNr6F4+jZ8yUp?=
 =?us-ascii?Q?56adq73EKSuioFbzLgN4t7aV0puJ9rNjUkQ0uVHQq1ii8avMMPSoL+Jeu0kb?=
 =?us-ascii?Q?WlXNyKlboTAAvAFo14gQeRSS+cgSE42RsXnWIkv5StT+63QrdIElS0GptElM?=
 =?us-ascii?Q?zeu6IpSHWkYMKBpJCZwPXCXC3kudKvF1OdG0veJz1/jf7Erryayl8DccaoIr?=
 =?us-ascii?Q?qekZk75bITIEM3WEdKXRGxNNSIl81FX0dJ8NFJ6lI3u2lSIdVTWtpHNnp3FB?=
 =?us-ascii?Q?pMn4Upnel8xqIny2UZlRZbh1ffBzlPMmpNfKqQGEKmAevCqahCJVJcqaEwtY?=
 =?us-ascii?Q?mAImWkRBbEVRUWsYg2a5Ig7ALP286IMPfIGhcgLZvboaSx9VrzuXs0w8bepu?=
 =?us-ascii?Q?ongNsucvenc1NROPQLwVX5YRIpJ3HA9fswxDFD4DtRqif9Cibehkua94jm0U?=
 =?us-ascii?Q?FidQA496JTEqnEaRMyOaqS0c2gpLut8vAVAfWYNgv25ZNJfbgGogspoi4AI5?=
 =?us-ascii?Q?g2gMgXCwg9BiDjne32MZVYnOUIUAleHZkkIZw4S4UuN+Y/Kivt7YzruVCcI8?=
 =?us-ascii?Q?UqP2K1Fo0FKWRwug7YcvnWqHnlwA+IOvKziIZ+cHQr+qFwY4Qho0SBTeoVAL?=
 =?us-ascii?Q?EnUe7RXO3unG4QkGu81NlfjQgyDarmDKuVMsGyaIxM6srMNdUsh3WIZdNGtt?=
 =?us-ascii?Q?WHtW0aXkN0+fu1U82Gh/tXhxGQ+7Se2fDSjc7Li45XvTawiPlOKH6r2ykazI?=
 =?us-ascii?Q?Bqd6otO17PeYjtAYCSYzdVcLNXoTBicOEaX06fUtnIAg0zOV1ACPQE+d2Q2J?=
 =?us-ascii?Q?o5/enQpP5EzSkLlzVMBILpskUEYn6k1Ps0AtGk6HOEFmjQOvo6iecU33fOlU?=
 =?us-ascii?Q?ygieJ1rkJi/LaMXG48Q8xlkP11InxeQdet3vqPR+VN/QnRcaLzAuuzhp5x73?=
 =?us-ascii?Q?lribVK0QwdcnaYyY1k4vqtxhzkAnvcASBxQpSSk0KjvUY+8pOlRsrUbHl7EP?=
 =?us-ascii?Q?8HWf07gLC6gKoF+tx/IvfeQEb8uVPxOU1TovFxI+tZCd3tG/Zgk+WcTX7LfB?=
 =?us-ascii?Q?QxskRNVP9s0YoKmDuTBl2y4Tg5T3EqLLQ495QbtfxKOVqo8gig7RC4zgM7Y+?=
 =?us-ascii?Q?AMXpn+Xj+C69JP/tAyIC8rwHIvo7d58+AZBP8/0cmmkc3M2yY18jeLUvkHOp?=
 =?us-ascii?Q?wKghP0vVI3rpv1qek0shSgcsOwXbXUBTV/cwxmic/GVtJJ+1ztzy/rAAF9GR?=
 =?us-ascii?Q?UupXVpbZzKWnq3lY61d1Hj+A?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f54e902-7e6a-4c66-5f20-08d91f72fb8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2021 11:48:15.5669
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3jI4xFAaPbZuU8vAaLYlPGsTcCy9kqhwV08u4PoyydlNwiR5e9TClNxuubgRb7Df
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6607
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Friday, May 21, 2021 9:31 AM
> To: Jun Li <jun.li@nxp.com>
> Cc: heikki.krogerus@linux.intel.com; shawnguo@kernel.org;
> gregkh@linuxfoundation.org; linux@roeck-us.net;
> linux-usb@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH 1/4] dt-bindings: connector: Add typec orientation
> switch properties
>=20
> On Wed, May 19, 2021 at 03:14:47PM +0800, Li Jun wrote:
> > Typec orientation switch can be implementaed as a consumer of mux
> > controller, with this way, mux-control-name must be provided with name
> > "typec-orientation-switch", along with its 3 states value array for
> > none(high impedance), cc1, cc2.
> >
> > Signed-off-by: Li Jun <jun.li@nxp.com>
> > ---
> >  .../bindings/connector/usb-connector.yaml     | 21 +++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > index 32509b98142e..567183e199a3 100644
> > --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > @@ -111,6 +111,24 @@ properties:
> >        - 1.5A
> >        - 3.0A
> >
> > +  mux-controls:
> > +    description:
> > +      mux controller node to use for orientation switch selection.
> > +    maxItems: 1
> > +
> > +  mux-control-name:
> > +    items:
> > +      - const: typec-orientation-switch
>=20
> Don't really need a name with only 1 entry.

Okay, will remove it.

>=20
> > +
> > +  mux-control-switch-states:
>=20
> Not really part of the 'mux-control' binding, but part of the connector.

Yes, agree.

> So 'typec-orientation-switch-states' or something.

will use typec-orientation-switch-states.

Thanks
Li Jun
>=20
> > +    description: |
> > +      An ordered u32 array describing the mux state value for each typ=
ec
> > +      orientations: NONE(high impedance), CC1, CC2, if there is no HW =
mux
> > +      state for NONE, use value of CC1 or CC2 for it,
> > +    minItems: 3
> > +    maxItems: 3
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +
> >    # The following are optional properties for "usb-c-connector" with p=
ower
> >    # delivery support.
> >    source-pdos:
> > @@ -301,6 +319,9 @@ examples:
> >          sink-pdos =3D <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)
> >                       PDO_VAR(5000, 12000, 2000)>;
> >          op-sink-microwatt =3D <10000000>;
> > +        mux-controls =3D <&mux>;
> > +        mux-control-names =3D "typec-orientation-switch";
> > +        mux-control-switch-states =3D <2>, <0>, <1>;
> >        };
> >      };
> >
> > --
> > 2.25.1
> >
