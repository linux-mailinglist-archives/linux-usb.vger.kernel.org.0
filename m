Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD5DA4FF77F
	for <lists+linux-usb@lfdr.de>; Wed, 13 Apr 2022 15:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233678AbiDMNSb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Apr 2022 09:18:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbiDMNSa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Apr 2022 09:18:30 -0400
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com [216.71.140.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 999B23CA77
        for <linux-usb@vger.kernel.org>; Wed, 13 Apr 2022 06:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1649855765; x=1650460565;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xNQXU6BGGMC9aZxcYYvpD3ra8iOvF2lFU+eZ362Q/jU=;
  b=Rj862+txKHnonLOqKVktaOdQ7O8NdSYC4bOiEdN4XtOwr5rqr9jlnWQD
   Po1gt0pPqYcp8kJYtXGv/X6/nF8EHxTcpODbZWuXMfOmOT6TZ7lQdDvsf
   Ocat8tSkUmr9oCGac0ZMY7sHcUcRAF+1vP/7Q7OTkZhtovIjdvhc7OBgP
   4=;
Received: from mail-mw2nam12lp2043.outbound.protection.outlook.com (HELO NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.43])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 13:16:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LK3ds6YO9OK/9NydzJn3mFWULWvufhHiMWT7Z7aHRt6H1mc2zdRK38k093AeLH/pLR5j4gdPtuA8apcm+TFi7UmuL7/YMbOKFzPbGxIrkoYrsE8YN555iW+mNKLVfaEt7Da7zx8qasLEEmkjz1jucnlPH2287AZFRcGjbXPc7NmEWJ7lVTsxz22VLl89hOsDiMLR5SGneG4AoVcTFNpyNA6EUbtOGxKlk3wpGuz0LiFn6ClELx26PzdebBjl4ZfkVSwTRB/Phm6Dxv47kfaLnVhvveqbtyhV9Xcb8UxHldZxbFK2KtOZSVr2AEkWtq0tdgj4Nu0ZEztPCSFxG/gXLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xNQXU6BGGMC9aZxcYYvpD3ra8iOvF2lFU+eZ362Q/jU=;
 b=MWKEdggl2ggUW4/XeFdAxUZb1hvHSowI9TFAdKeP5v2xJFM3/82Cpr9tQpctanpXJ7w3zYlktf2j44Q/sD8XCSe+RXGhvBkaDoxnAIwPmugNCYq/eFgtxUQlwtj2jxOI5IX47VELSbUCuVDfuT3gNXztlUqIXIjgv/n06ifpI0Uab/Rr/Ywiba0kAHUcSLlJnq5Y4ZtdP2SdxhsotQFyWbpEan/z5m/mCp7o4SjLykbs4gGazVxCBKXoHeucKZfi71c2ncWcYmrT2+r7Uw1tb86GakN55IFIUlZlGX2BwnEb2EQfBFvgMX1klDyURBkhJDoCTVKtV6v5dTFB1SgVfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM8PR02MB8198.namprd02.prod.outlook.com (2603:10b6:8:4::7) by
 MN2PR02MB6894.namprd02.prod.outlook.com (2603:10b6:208:202::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.29; Wed, 13 Apr 2022 13:16:00 +0000
Received: from DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::15d6:317e:e736:e9ad]) by DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::15d6:317e:e736:e9ad%5]) with mapi id 15.20.5164.018; Wed, 13 Apr 2022
 13:16:00 +0000
From:   "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Jack Pham (QUIC)" <quic_jackp@quicinc.com>
Subject: RE: [PATCH v3 1/4] usb: typec: ucsi: set con->port to NULL when
 register port fail
Thread-Topic: [PATCH v3 1/4] usb: typec: ucsi: set con->port to NULL when
 register port fail
Thread-Index: AQHYTx0CB3/FkSRBr0q1e3DRqgnfRazuK0AA//+njcA=
Date:   Wed, 13 Apr 2022 13:16:00 +0000
Message-ID: <DM8PR02MB8198D4F087979AF459AD31A2E3EC9@DM8PR02MB8198.namprd02.prod.outlook.com>
References: <1649843891-15554-1-git-send-email-quic_linyyuan@quicinc.com>
 <1649843891-15554-2-git-send-email-quic_linyyuan@quicinc.com>
 <Yla0pvOElW+Voh8G@kuha.fi.intel.com>
In-Reply-To: <Yla0pvOElW+Voh8G@kuha.fi.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1cf2d303-7c3c-4ab1-69f2-08da1d4fc0fd
x-ms-traffictypediagnostic: MN2PR02MB6894:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <MN2PR02MB68947831D910F08196CCA8299FEC9@MN2PR02MB6894.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RxgajXGcDGB9zs7JIPiGvJWc0nrv8+1d/djRg+30XPedWth9tITyasmSaN2aTFhp71wqlmbakY/iQQr+XQsm8/UttwOv0/vXntcHWmAuRn+52L9uUfZYkeFzYL2op3MUQxN1/MSk3c/3bVGd+R4GY74PlsK64Qx8eOCMpuTvPMpT7BlM3Qhv+eKSxfxR3sK+EMlwR0e7EV2rUUUjho/vG7XjJQuB80/IdQwb6SuYkyJuBUbMDs/0IntVRczsOD6noIQYo8j5l5uJfUo5okrAje4YCu5loEfn8MlTiQ8AdaVXuS1KvYZTEcOm2DZc26Gp//4LdS/QhaCoFSaxTPnMn2ASV3kDBsmnKekZpwBCS0gvOpz+vFCmP6z8zjyNdffyvRT62hin7ALi1Tijjy4OkfjaQsxwals38Fz6AvgMPyKOnW7rIa6uHfYoDLJANE/IZhdaa2kj7kAyxCTwZUJVmJZZ97F2gM7qEI/81VPjxL+jsciHMp628r10Z6GvEfNVFW7lftl/u21f8PSyTr/zu/ImEdc7mYhLOTsXTmeVx6iH7EF46fTgLawCfzXio6aMZ+ND2BUoU0BNBfRr7UxvEo705APblhLSjlSLAXjDa7DyAryKMlgbqq2ZGwQyEGOl6pjM2aG/LUHD3QFZxuJ2KcxPgnpBevDbqERPRrkQ74/uy+Qe8uw3QLBFOM9EmBiPRhGsgjOkTgZcywKhOzkXKA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8198.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(7696005)(52536014)(54906003)(6506007)(316002)(55016003)(9686003)(122000001)(26005)(186003)(107886003)(110136005)(38100700002)(76116006)(66556008)(64756008)(66476007)(66946007)(66446008)(2906002)(5660300002)(71200400001)(4326008)(38070700005)(8676002)(86362001)(8936002)(508600001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?m7GAcPsamSRv5qAWQhzlXWtKR7DfABDbeeyt9Fmy5a7FjELEkprU8Tmdt1RU?=
 =?us-ascii?Q?MAWPf6qbVyaZ0A8QuuPvHSSpo7f517KtS5gGjrDuG+4PbaYsHpmzWc7dKJEl?=
 =?us-ascii?Q?DgP22qK3KGbafTUeYWBY5Xgv3Az8+rJ28qHLx5hVW2zqDCt/18sPdzGgDZkU?=
 =?us-ascii?Q?FVRYWtHBIhUrht4pVUuhExMBuv/9VtKz3ePCb2lET+60+b3cdFpDoz+oE0Qn?=
 =?us-ascii?Q?d+WI2Vs2EyPsAmF5JM95ksvG5lFpk7hG87CSQwDENJEg8WrX9HYj9zRVJnKG?=
 =?us-ascii?Q?rUD2YUiuJOS6T0BTScG34B7Qe0GKBMg5wemJxHke2gL7FsqQmvjrmDtAhXq1?=
 =?us-ascii?Q?+W9pNnWc0k4ywjiZOy2iwTwrHaz7e8uUGQ2FMzJG3vzh/JIZq+0apAObsJjG?=
 =?us-ascii?Q?9Uu/IRovT6nsEiE31uMbeKxkpbBmOBQwL2hfhm/hdKRiVLcTJRaZlh6wpixM?=
 =?us-ascii?Q?KIsxo66WY3tyVoefMIw8JxubrDeUAmSnV6FXN6JOcX6ccOzh/YbuChFzMs8l?=
 =?us-ascii?Q?9hOyIViwJbhTGYR1agHwUjQtnwiBz3rFF1Y0Ev6uIojaTwKLu7ZIroxAn5Im?=
 =?us-ascii?Q?pt8h0LluIaA701HvfT34oL7/GiGKsHnP1/yV3YjTXbL/XgaPiwnie2vQW3x/?=
 =?us-ascii?Q?zR2eXfUizwW1mFf7chRpRZDf2iUmoVWd7dK9amhQaeWuWfJb+pUtWBxYTgXx?=
 =?us-ascii?Q?15nA/VesTfLjCrUInEvd3od+i1vCWRWNWI58xd8NFyhs7ozaNGkkVm+gqWkM?=
 =?us-ascii?Q?wpYINLq6jFwPLsMLtaoCCiKMzTji9sL5XVKPiMgDP/06uIL6vwjN5hHmlS7y?=
 =?us-ascii?Q?MdPNOlczGuJ8eL0wHj4LHa1g6Dc2kdKG8VsCDpemWIO/qmmzFosujDnxMnzZ?=
 =?us-ascii?Q?Hv1hg8Z9DrqwQWWRm0uny8W9ucf7YdSSXyGTVkg6ChiTX4/xiZT9bsYD3qnG?=
 =?us-ascii?Q?GDYYcsUCt9iZflH9hMmipIVzQv2zIZAo5SdVPwv+7rTGCz0IuVT1Om3oALM6?=
 =?us-ascii?Q?Sf7MpkNacSLakmpucZIpJWySyceR7mffSSTgXLNudNUZFaolidXd8ieyCOWD?=
 =?us-ascii?Q?s9GIaifih/bu9YdkQBvA5r/D0n3jGwltKIlX0WwPNR/Bvniu20tb3gaUWoRj?=
 =?us-ascii?Q?Gof5+iyGdFhBQL5MnEYGi9pCNhBqCDq7zuPHvpugrBFOpq5sFnrWHO5blGnC?=
 =?us-ascii?Q?eYscguRB81sQiO3ObFYCHTVTLR0jnEnkt16Y65+FtSrlN0F6wVhTmTs3NybC?=
 =?us-ascii?Q?EVYjBzc3MXbjqSmGSoVokm+vK5lwENpVjhpEgpUmj1BvFfrtCfo0jSCpC43K?=
 =?us-ascii?Q?TP9ZETm5Ax+iTa0VIWBzR508gVzAmfhyaJmE19sx4jBkq8iwqdVLnb9gQbyA?=
 =?us-ascii?Q?ZU3PQNeL+JmciPGF5gnlpGUlj+21X/oyKXtJaOz7Zcp67k0AvK+yDIcFKGbt?=
 =?us-ascii?Q?jj22FTg9ZDtu4CyJhvy6F7rvjpTpaAAFWWlXUud29QYX3VrOeZG+KnSWgZbi?=
 =?us-ascii?Q?i0LIDoJ+eo78n/rTTrQIVhsocxHbOmytA+eHsYfJyR0vtn3j28fnexekGd3Q?=
 =?us-ascii?Q?2FZWKUmFRsmqhpG9MN1QjZe6Jd9UOci2VXYooLn915HFsCvdAvWH7TxUxjyd?=
 =?us-ascii?Q?qoODTSvjPcatWR3fV6RsKj/yT3D1s24YqN3yD6582WBiYH0ueERtdfq7cWAB?=
 =?us-ascii?Q?OAcjTsX7TtrBwK6IpMhUKYi5R6dTWx4dkmWdezerFyKs/tvaLmOtyD4zs21m?=
 =?us-ascii?Q?nH//rC6pwg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8198.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf2d303-7c3c-4ab1-69f2-08da1d4fc0fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2022 13:16:00.2708
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wSuMaDv+Qn0ukccWgp2gYafblNUe7TWZezbNBVM2ESiQxPmbXQb/FLC780kzgvQTAKmk/+F/c8tNUlPaOzlHvjzGQ41KqblRML1MqeGPOtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6894
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Sent: Wednesday, April 13, 2022 7:32 PM
> To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; linux-
> usb@vger.kernel.org; Jack Pham (QUIC) <quic_jackp@quicinc.com>
> Subject: Re: [PATCH v3 1/4] usb: typec: ucsi: set con->port to NULL when
> register port fail
>=20
> On Wed, Apr 13, 2022 at 05:58:08PM +0800, Linyu Yuan wrote:
> > As con->port will be used in error path of ucsi_init(),
> > it should be NULL or valid.
> >
> > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > ---
> > v2: no change
> > v3: no change
> >
> >  drivers/usb/typec/ucsi/ucsi.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucs=
i.c
> > index f0c2fa1..77ac0b7 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -1100,6 +1100,7 @@ static int ucsi_register_port(struct ucsi *ucsi, =
int
> index)
> >  	con->port =3D typec_register_port(ucsi->dev, cap);
> >  	if (IS_ERR(con->port)) {
> >  		ret =3D PTR_ERR(con->port);
> > +		con->port =3D NULL;
> >  		goto out;
> >  	}
>=20
> Please merge this into the next patch.
Sure, will do after all discussion are done.
>=20
> thanks,
>=20
> --
> heikki
