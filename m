Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F87D74AB93
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jul 2023 09:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232097AbjGGHGQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jul 2023 03:06:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjGGHGP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Jul 2023 03:06:15 -0400
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2079.outbound.protection.outlook.com [40.107.249.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC73C199F;
        Fri,  7 Jul 2023 00:06:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWxSaTFPTBgEqz0f8lZNOiEHvcBFh1knRs12r4wLAu7aQSw6x4whVn8YR6kXWqmWWPKeDeDtH5R2NhllDZFYjCZ1xpalAGxw5RMvlx8mSpzf5Hmwr3jFX7C0vkAjAeZju6vZPCmEFKkdPvqWqx4Wv74dk6bpP2UzgZwkaozPAYa9FQPkZwgGzOG8dD6xlGn0Hg3BHDDuq277BekkHLSY1WmfXI1J+QSXZrtro2vPafwzNGjKHWbBsP1c5nV2Sj2AO2rhBXPJu545Yyix36CMJ8NwjmlFptBXSqk1Oex2UJfAMh7qgPDfT9sItwngPxNXnWjZbY6B/d914mTCEqVyQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNl2RefzWMpNdivQXhCweO8bCJdbte9yQaSApRGd9es=;
 b=aFbwWRg0j3fONdqkQOQIPjcGb1Ghh6SeJmqNSD5z+8xuEwiqNmzmx4A2V5G2Efnto70OFI2RDIGfbh3HQRW6J0AHh8hzeiJ7c8Yj3ofR11AE8yO2XNfuwtdYOlcCQmpcS55uw44HJbaoH9KMC9l24/dIhcfwl0rWzHWC3zzJx37KZKRaJbebtg2OJ5ty8MDiPQYwhgGhjyGEOupmLA+t7G8Nc2U1p8/jA5WubDp8Pju9o+hm22sMCkSnuWa48XbQFaZXofL1S2p04d8IaQTIOINgYoVXRj/vmJfpbJt1aCDL0oCh/q9bGTP38AsH/VmdRUfe5SrrO65tDmd9mDkYdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNl2RefzWMpNdivQXhCweO8bCJdbte9yQaSApRGd9es=;
 b=e367HhAlIGE3rvEoYw4zgJ2YmQihMLc2DROzO4hrn1HY7je2pNPmRwdvjKDmzvkhhRDPj7ose+8MKxl1WaBUIXXMuhOPrHZh1uhWpUVy9IA6qIMQTYPiVnI2sN6usBV7MZD3mn3l9Ke9eTvniTZLQHTA1wyeiUe067BSfPShqqY=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 AS4PR04MB9460.eurprd04.prod.outlook.com (2603:10a6:20b:4ec::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.17; Fri, 7 Jul 2023 07:06:09 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6565.016; Fri, 7 Jul 2023
 07:06:09 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Rob Herring <robh@kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peng Fan <peng.fan@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH 1/1] dt-bindings: usb: ci-hdrc-usb2: Fix number
 of clocks
Thread-Topic: [EXT] Re: [PATCH 1/1] dt-bindings: usb: ci-hdrc-usb2: Fix number
 of clocks
Thread-Index: AQHZsD6muR0fxI4HtkusgjmpqEfIia+tz+8AgAAOS9A=
Date:   Fri, 7 Jul 2023 07:06:09 +0000
Message-ID: <DB7PR04MB450585C112FA299FE46023828C2DA@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20230706093928.3580544-1-alexander.stein@ew.tq-group.com>
 <20230706191825.GA170669-robh@kernel.org> <4814813.MHq7AAxBmi@steina-w>
In-Reply-To: <4814813.MHq7AAxBmi@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|AS4PR04MB9460:EE_
x-ms-office365-filtering-correlation-id: 8a381233-9ec6-421d-f605-08db7eb8a3e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p51oRZ5K4pRmaMmLr9LSh8qjxKSajWhFIgkZpZUDSssaOcKXr+FNF93QwPmXk6U3R1KwKb5YeMVL1IZEucdnlG/g1Pz5JFkTS3iR6L46HADYZNXnFwLwY5D6K44DDxgTVS8KF5T4Cc8AzcpFM95M+31ZkNTcYDU1opbFnyEmftzVH6DvK46/Hh2YX5DEsXt4iZ3jvWraHmjpW1R0KQzuKXsJzlsla7NDhS5PH0ZsWMJLOJAR/MRwXpn0NGkLWwYs6m8aKNV+UU5Ju6h3eW0IkT/maCMRoROPIeUdq5JnMLJGW7Lob5FhcpSi+Q1c/TURC1BmOTGqfLbRb+NKwUc1DFw4NUp7tFSK9TlBz2GQjbsg2H+oPpaz5VdXBLdwu3/JipHbfQxoFwity++3vcbt46r704NERnH2j/91RvxoSeJ3gwwVONHmvQKnYj4OEf8FZNamo+7kbdzRkEfJaOjpoVFjSppy26XOGTuOY0JDlZUC1XFlKn97lVDbY8++I77RFw5JRpc+w8DVLGCCynaGe0GTVAIw14I2//udn1n4I97BWOsKWOmu3PmrmLHVYJI9aty6fIoHUwW2raa+EtUzRT3Hk/9CHddhZkR6mdMsqDpYamvN1ecXcN7yxvuZbxHk
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(451199021)(9686003)(76116006)(38100700002)(66476007)(4326008)(66946007)(66556008)(66446008)(64756008)(122000001)(55016003)(110136005)(186003)(38070700005)(7696005)(71200400001)(54906003)(86362001)(33656002)(478600001)(6506007)(26005)(8676002)(8936002)(5660300002)(41300700001)(52536014)(2906002)(316002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ixE7DtdU3WSgrgs9XRqEYyyPd+fddpID3fhC+NdxocYwhy6J5mXA7G5Iuc/U?=
 =?us-ascii?Q?UrV7/FIAkkW/ngEN0MmpfsjdE2T6Gw8lF8AwWLEahMgjytljImWLbxF6coyc?=
 =?us-ascii?Q?gBpwDaJ+rqMvzIlP8ZlcLZfddfI27EqgHLDYwKdVG64lEfEp4LW1eOPYQdUx?=
 =?us-ascii?Q?tbindN1QXvu1EgrTyZakBABIaclw7xUF2L1ru/+il/llRVVLhZO7BpbsbxqJ?=
 =?us-ascii?Q?mAmbyvdDuy5UNo53Zj5WCSu+1oaDLh32J88+qsQEMdqFL8KO2BH2+s8NvrBf?=
 =?us-ascii?Q?s/HI4ByXgScMptjIV0u9b2k/UFauO87B3ssToIbveW/ge5Ed7f/N41e0yIPL?=
 =?us-ascii?Q?a4wQO++0cTCi1avvZTH7QlNJ01x2i/tQa3PXY+g2/X0dmIin7NY4t7Y21V33?=
 =?us-ascii?Q?+kK5PNBQGysBgD0zkI+kZvbjVafzI2QDN1ilaq8hJjofXoGTvJARDmbdmXH1?=
 =?us-ascii?Q?5ex8St3KXbzlecjHezu8kWdu9K/ti5aXeAZopnuZlej9L8QwSlmA2OhpqMif?=
 =?us-ascii?Q?3Q+PSwccTl4F8Uurnu6jfOC3We/cjbpHpe86WKrqp7gVWNaHKSjeMrwylFF6?=
 =?us-ascii?Q?NeiZC16p4qwL1TjyMLYTHm7tXTYBOnnANwxjEGkjGksvvym2PUATgPdtW8RI?=
 =?us-ascii?Q?mamDaQRVWWDEewNWFzUXDudDgkmcMVX+BJANMRNWIOa+AS7xeCz/oO3hWcrs?=
 =?us-ascii?Q?KKJE7fna1PCSmna/A3z7UktHPgDqF9qE+bMj0bzbTDVDFHI81+zxbi77o2YY?=
 =?us-ascii?Q?VHHgceW5ZWP1GTw/S2O8RqVGTT/LG3kyLXisV1Gc13/q4yekrZgdQNjMmRzh?=
 =?us-ascii?Q?dVpCurT3aBGepMLNk9EsJTQSBbtzUyK7Q8J7WzD4el/Qb7PDGsGhVFhMm5vC?=
 =?us-ascii?Q?LWHoJv0u4cKIyWDWJfIzJBa/ZZDbwynVdjlkwg4C0vHlCFcMg4vIXFtJz1Vi?=
 =?us-ascii?Q?YuoQ8Las9gL4cvTOB6Knwpw6q5SVsjnurky1XqnzjyDcSnN7PQX+8rwcOm/J?=
 =?us-ascii?Q?4hDxn8H1P1ERPDYlsq8+Rwe5Ok3LYB9dgdAcJSXVUTmwGslx8qaKB9nBmJKy?=
 =?us-ascii?Q?1NT3Lyn5oU2SF2M2ho6TLHP1RDc91O/S+FpHQ6VRriA+wL/i6HQFm5w4VTMR?=
 =?us-ascii?Q?61GJYD1grlYjwYGzLopCfmiNbLqb4q89q3L7y8i4A1I/t1crbkI1N2ubdKMF?=
 =?us-ascii?Q?HZx/vsdv3lZS3AUt6iSBDXm7aBpAqRBuGY4Dmpgx3+iIuUwQ0ABUuIiIiGod?=
 =?us-ascii?Q?Hu+rYOsXrERAquVOppOYfk/TpEAG7cGNWSd76+hAQ821g08NJVkLrDjK5OHM?=
 =?us-ascii?Q?A8CprkYXXq+HXYo37YvajNLvnnn7cXxQmM5+I6VCgBzDDb1mJhRIkaD78ANT?=
 =?us-ascii?Q?8YrRrtL4KkZ3tzD1QP7u1vfJqf6iIyRssogkCzZkH2tZLLXqWwLUKlcwlT9U?=
 =?us-ascii?Q?dXWA9ZbQMcXsUE7uU3grwwxIdvYURHwyTH4s5eAqg5mdGdr0gGRLv5AnIKfY?=
 =?us-ascii?Q?sbQE43bNIEMsiR4ylBI2FzSp5/PZBkNhFc0eAzwDSPHjs5k3bX7qayGiVf5Q?=
 =?us-ascii?Q?4MSxrnAIpQJ/XkLgPHk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a381233-9ec6-421d-f605-08db7eb8a3e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2023 07:06:09.1931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: izshZSLbqT1vP3v5t+RfAAsfaQ5KpXDwdPZoTB95+jIu9kJwc8gU1cb1zhimGDwG3Lps4fAr4YBOFz1meTqCGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9460
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alexander,

> -----Original Message-----
>=20
> Hi,
>=20
> Am Donnerstag, 6. Juli 2023, 21:18:25 CEST schrieb Rob Herring:
> > On Thu, Jul 06, 2023 at 11:39:28AM +0200, Alexander Stein wrote:
> > > Some (older) IP cores require 3 clocks, named 'ipg', 'ahb' and 'per' =
while
> > > more recent IP cores just require one. Fix the number and explicitly
> > > state the clock-names.
> > >
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > >
> > > >From I can tell, is that imx25, imx27, imx35 have specified 3 clocks=
 in
> > >
> > > their DT.
> > > IMHO minItems for 'clock-names' can be removed as I presume that this
> > > property is not set when only one clock is used.
> >
> > Rather than presume, did you test that? Well, I did[1] and can confirm.
>=20
> Okay, probably my wording was bad. There are a lot of users (e.g. imx8mm,
> imx8mn) which only have one clock but still provide some clock-names prop=
erty.
> It works just because it is not called 'ipg', but some SoC specific clock
> name.
> So this patch should cause some warnings, but these users were incorrect =
in
> the first place. Following up this patch, they need to be fixed.

It means that all the usb nodes need to contain 'ipg', 'ahb', 'per' clock
names with your patch. It's unexpected due to only imx25, imx27, imx35
need this. I think you need to narrow this property to specific SoCs.

Thanks,
Xu Yang

>=20
> Best regards,
> Alexander
>=20
> > Reviewed-by: Rob Herring <robh@kernel.org>
> >
