Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF04B4FF0C3
	for <lists+linux-usb@lfdr.de>; Wed, 13 Apr 2022 09:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233445AbiDMHsO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Apr 2022 03:48:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231337AbiDMHsN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Apr 2022 03:48:13 -0400
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com [216.71.140.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A97F3CFD7
        for <linux-usb@vger.kernel.org>; Wed, 13 Apr 2022 00:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1649835953; x=1650440753;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IK7YtI4aMwrLZrGZOQnfRnYqnvZhtpyGmZ812S8W14U=;
  b=xMOonNdPBHhmyKzUSm6wzMA6HQU1+qj3WCT6UkEYaKnGuRoqFCKoBVmJ
   tn2kSbqRKjrKAQGQ0jcr/ghRWoemn4eTbRETWiNMba8OhT6LhMWqpAZ5O
   FLsVcQV39JINdPls8I0254rJIf0VXNAAbkR4SsQJe6PekYnqCLBGmpS5G
   8=;
Received: from mail-bn8nam11lp2171.outbound.protection.outlook.com (HELO NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.171])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 07:45:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lDKnhXVprwNCPHOpHW6ibyOjT8SjwWCNpIWlWKpijj5mR1Tf2wcCOMAMA9OgfinXlV2WyenSd7rK6UWcquBGFEZkpHrVz9/oQBWyZSYAGfvbWCCNaVU0Eb7gnHGTBMyeB+3jI3A/Bd1zv7029xYWc15chkSCxbvdfiVj2aKEkkTZ362NfOXH3xPJfV3Xdtjct7lc49qy3IqpByS3knse8oijaClY5hLKWjN5OKfnAfWdXwQ2gnaPhbf5RGLDYgCsrwe56lNAtg1ba3Bqhxn1+hv55EIeeytQTrJCVnx3CZOK6dd+jQODS99oP9G827/hbaElwI/A0TmuzG8p23tZLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IK7YtI4aMwrLZrGZOQnfRnYqnvZhtpyGmZ812S8W14U=;
 b=OZOTB4rwrjMv5WbYWAOOyio5UFupaQjEGSteow6nxODSp/Z4KNi7mme6Smg6LREM44CyzCD7Luczb44YyvGo8rswEVb5n+nhiVQJKFvgtxMIUtrPVTzEOy3BvZVEhW3aPeLkTt0ktc9N6djjUDasF0DaPfNTjj3KawSnRFuCwuWBguJszduHHXsUVwLZTfLwqxQGgT67sNMOiNYRKSyIgXyD+WrpQdKUzK9di2aphdm4PSNzIZOqEKrS3b6YeR88eRCxzGDMPSG2hiqFZt6004f9w67mX2TbWx21i4BT7hm3OOldQfP/Yc7ieWg1QM8tAYncTkUZPraGUJHPFfvSsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM8PR02MB8198.namprd02.prod.outlook.com (2603:10b6:8:4::7) by
 SA2PR02MB7641.namprd02.prod.outlook.com (2603:10b6:806:143::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.30; Wed, 13 Apr 2022 07:45:48 +0000
Received: from DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::15d6:317e:e736:e9ad]) by DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::15d6:317e:e736:e9ad%5]) with mapi id 15.20.5164.018; Wed, 13 Apr 2022
 07:45:48 +0000
From:   "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Jack Pham (QUIC)" <quic_jackp@quicinc.com>
Subject: RE: [PATCH 2/3] usb: typec: ucsi: add a common function
 ucsi_connector_clean()
Thread-Topic: [PATCH 2/3] usb: typec: ucsi: add a common function
 ucsi_connector_clean()
Thread-Index: AQHYTlhNsnfJA27WPkC6w5AoMQaJj6zt646A//+McLA=
Date:   Wed, 13 Apr 2022 07:45:47 +0000
Message-ID: <DM8PR02MB8198E1969E001A5293C9743CE3EC9@DM8PR02MB8198.namprd02.prod.outlook.com>
References: <1649759407-24049-1-git-send-email-quic_linyyuan@quicinc.com>
 <1649759407-24049-3-git-send-email-quic_linyyuan@quicinc.com>
 <YlZ97SSX2kTwzj5z@kuha.fi.intel.com>
In-Reply-To: <YlZ97SSX2kTwzj5z@kuha.fi.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3de4daf1-4f39-4e16-ee34-08da1d219fe4
x-ms-traffictypediagnostic: SA2PR02MB7641:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <SA2PR02MB7641A7EA82BBA59D8679EB439FEC9@SA2PR02MB7641.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P0nuRFRuT/xVdfUUtRDlJYwKDOUdH/MoxH1LnyD2b2FKiL2brPrCjjSZ6bA9QRGzWhcZhylxMfh2hR0IJi3VL/zaqkbzKQdNxU3I1WnbNBu5PEx72fLy5GaNwSB966WxWbSDTdswl8pBhvF7Ofvec3OitOQhDyvkuiCJ3QTjBVF48ucT4rQaNtvo4Y49HSFCAnpM7mkXbcfwZ/YWxV9A5M3sSUjp1Djcyp/a0DPAg8lRZLXlFPPD9ZmgEnJTMxhP+KueqGwah8IKNMCn3dzYPmH0wd72tnco9g3Zhsdd5aXMIJmi/I0Ge/BCrAHANKNp5qm+9v97fCTDQUBk+/QnvFDKXVvC3ck+FkmVH0JhzPG8PBJRmvvECh2nigpMBJ8ZDpkYwIIVu44lvhc1IxJrXdAajo0375eDbe+BETOhxP+f+A1XsakVmvO8ArGSjpqyKCYVvjiXkSQF/3Fd/+hgm3o7/OBYDDsUV47TJL4BUVDiUoUrmZqEcXwsEL0Tk9jkiRsEI5QXb+Lkq9LqZs9Akk0WQjI1DPu48zRu5k7KPu3TVqUR3fThTavE83dEcHqL6cf6Cm7pb/t+nWcquAtKVkU16fv7TX/YetpIEIAr/VEEFXAo7nl4ra1K38GgU5a1yX6bLDfsD6zMlnR0Ink3nSOsQBVwO8yw40KR7vKBWCnbE3jluns6lVc7oG6hc/r7DG3wyUtYli2GhWIjN+YafA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8198.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(54906003)(508600001)(8936002)(76116006)(33656002)(71200400001)(186003)(122000001)(38100700002)(52536014)(8676002)(110136005)(66946007)(66556008)(66476007)(316002)(86362001)(53546011)(107886003)(64756008)(55016003)(83380400001)(6506007)(7696005)(38070700005)(9686003)(5660300002)(4326008)(2906002)(26005)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eeIEjqgQcqdP90ct6SWk54sb0vc6WESMYmREKjVQIoWjjg1MQYMDpPDWxcpU?=
 =?us-ascii?Q?ScgTLtE6QJsQ3GN4cANkAdI/qOV0s4Sdny7CtTYciO50WKh4BF8+xnd0sscA?=
 =?us-ascii?Q?v9qtedCcVNvFVXTMFIwGc81u1m+5NsTl+xZnKUf1+yVrRPNT5tPW6R/2QJFO?=
 =?us-ascii?Q?qPwxD/CRF5RVN+ycY7aky0zLZrT+g+lqPdqGGW3xXdF3YMDORArgzYIs8kqc?=
 =?us-ascii?Q?bLpyZhMp7XKeV+OaI8Umu96ysQ9Fo5lw3QuJLhl2EdZSKXhfASFTdDjnx8Lo?=
 =?us-ascii?Q?uwyq8OwV51zwzULv0l8NCG2MRCaijK9yBld/rU+C4xBXONkT/VdudIYykbeK?=
 =?us-ascii?Q?oYMgYTPYWEYKl8F4B2OYjf5dcafnfrApPa3nrKsuq03xgHJCmsEm5AEFm+0w?=
 =?us-ascii?Q?eKWo68j918DEWqeaX8Ew/ja1Qa7ej6F+3H5c1r90yRsu26CUznNhSLZZGhHt?=
 =?us-ascii?Q?d9UJrkpG6HkVJ9C8eexyUEULd54lC32YiAPsZrAl4mxhVbz9D4uh1BPKZnAP?=
 =?us-ascii?Q?b+h0h1b5sePTBjLF41k5+BI9J/A6rkAYI7TamuQiGnjzHOOGf0XpwBCbUnbI?=
 =?us-ascii?Q?xOkcMIpiYtsOZJULMcpZ4zB8Fs3L8ZyeiR9/529Jp92eHp7NrDh3vrPhhbiv?=
 =?us-ascii?Q?kN7xp3nNG5gMnoav4ROaEvKPbNff892TqDoVB6r1Ux3G0oeognhLKvrZHG0i?=
 =?us-ascii?Q?+KRz2VS2SJUewYc+NxJ+jhn20/eLS7lJxy8MJMU1xMQ/q5yLJaYYtP+gzlv4?=
 =?us-ascii?Q?dBsqPJv3ZNhN5vsqJ3LjNoCQZmKaViMnFOj1S8W2mJcN5D5z6vflLWjcngYL?=
 =?us-ascii?Q?fGGstUSGF+qk3GlMTBTre5MSrzBysR0q46Y+yNElavKE8LC2E5/jTM2QFFnL?=
 =?us-ascii?Q?sUTeg4+145MPfYdGK7vRki6uoe9FpaTKe4viXqXjGBIfH9if/0KOZ2NLLpBX?=
 =?us-ascii?Q?B5s7cXemky6xvQ+K4gB7W6HBi3c/i561uGTah9r0VBLOb8rxTNU2j+GjGCq/?=
 =?us-ascii?Q?7Byef2neX7MHY9PGYVabDvUlIMJWHgzVwBQYOsOswTh7i3ZaQ7Vv90GCOG6f?=
 =?us-ascii?Q?W7FTfEnDiwLZZga26PCq3jYQ69vPgZ3mCPSKa+ctYpvG0QELl/o/iAXYAVSj?=
 =?us-ascii?Q?kAQnyWKIB/IeGbppb2Tn+2Mupi2VRAPOyssjJ3CNpVYHrHfSqVTja3FjqQeG?=
 =?us-ascii?Q?ubTvTNMJypVpky3UIi+ebEuPUfdtKbdjVPdGIrp4mlbgf3yTBCjg+lRzYbxY?=
 =?us-ascii?Q?xM0aDSk3fYPXAS9mv8cFA9jO0PR8N+unAohtKpvoNSmw172OJSTq1MiviEw3?=
 =?us-ascii?Q?F+2aCBN38S7xhEDCsQqQ3qWA8DwwRLqI3dC8Q3L9E+yLpwrcnjvblOkqPdeR?=
 =?us-ascii?Q?8Hj5xDwZtoawA/hvgA6mJao9FaNVmjmP+4YXtAHHy1/RGMZ0VsQMbsG3VYSj?=
 =?us-ascii?Q?8i2jNdIFj7EyjllTomQDAs2mIlQ79/8krBPBI88vfL1uO/oYSAVgzd5lPU95?=
 =?us-ascii?Q?x6/f3cuAZnAVTZ3emutmIwMEIi87gijyoZwn9ysKte0N+FOuxX/gjo84eue1?=
 =?us-ascii?Q?7dYwbPY5gKY80dpWiP3oO2vG7y2lx2a8s7OILkdQBWxYezBX1EdH5L0IaXmo?=
 =?us-ascii?Q?1RLINXuyAZqka3vn+goX01puHTS5qqp7IaPj1YGNeWoggXGVNFejgCBWMPHK?=
 =?us-ascii?Q?KWzWWDuphf80WHvvX/KP1uB0c7fxxjz0ph3bn2YAvvqyihzYr3IGXXUo45kH?=
 =?us-ascii?Q?vfRxJW0F5w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8198.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de4daf1-4f39-4e16-ee34-08da1d219fe4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2022 07:45:47.9115
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6XSVLrXPPfT0M6YwZwEaxPkQNw0ZdCVvs543TOjx2jIj9b2xnaeUBMzCC67kMmebIGwWu1mmH7Mr0LhQKKxIxqhQg6Wh3y5nmN2MjOgOYcg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7641
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
> Sent: Wednesday, April 13, 2022 3:38 PM
> To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; linux-
> usb@vger.kernel.org; Jack Pham (QUIC) <quic_jackp@quicinc.com>
> Subject: Re: [PATCH 2/3] usb: typec: ucsi: add a common function
> ucsi_connector_clean()
>=20
> On Tue, Apr 12, 2022 at 06:30:06PM +0800, Linyu Yuan wrote:
> > In error path of ucsi_init(), it will clean all valid ucsi connector,
> > and samiliar operation also happen in ucsi_unregister(),
> > add a common function for two places.
> >
> > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > ---
> >  drivers/usb/typec/ucsi/ucsi.c | 46 +++++++++++++++++++++--------------=
--
> ------
> >  1 file changed, 23 insertions(+), 23 deletions(-)
> >
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucs=
i.c
> > index 77ac0b7..684fc4f 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -1187,6 +1187,27 @@ static int ucsi_register_port(struct ucsi *ucsi,=
 int
> index)
> >  	return ret;
> >  }
> >
> > +static void ucsi_connector_clean(struct ucsi *ucsi)
> > +{
> > +	struct ucsi_connector *con;
> > +
> > +	if (!ucsi->connector)
> > +		return;
> > +
> > +	for (con =3D ucsi->connector; con->port; con++) {
> > +		cancel_work_sync(&con->work);
> > +		ucsi_unregister_partner(con);
> > +		ucsi_unregister_altmodes(con, UCSI_RECIPIENT_CON);
> > +		ucsi_unregister_port_psy(con);
> > +		if (con->wq)
> > +			destroy_workqueue(con->wq);
> > +		typec_unregister_port(con->port);
> > +	}
> > +
> > +	kfree(ucsi->connector);
> > +	ucsi->connector =3D NULL;
> > +}
>=20
> This looks OK, but the name of the function is confusing to me. Can
> you make that ucsi_remove_connectors(), or perhaps
> ucsi_unregister_connectors() to keep it alligned with the other
> function names in this driver?
Thanks, will choose ucsi_unregister_connectors().
>=20
> >  /**
> >   * ucsi_init - Initialize UCSI interface
> >   * @ucsi: UCSI to be initialized
> > @@ -1195,7 +1216,6 @@ static int ucsi_register_port(struct ucsi *ucsi, =
int
> index)
> >   */
> >  static int ucsi_init(struct ucsi *ucsi)
> >  {
> > -	struct ucsi_connector *con;
> >  	u64 command;
> >  	int ret;
> >  	int i;
> > @@ -1250,15 +1270,7 @@ static int ucsi_init(struct ucsi *ucsi)
> >  	return 0;
> >
> >  err_unregister:
> > -	for (con =3D ucsi->connector; con->port; con++) {
> > -		ucsi_unregister_partner(con);
> > -		ucsi_unregister_altmodes(con, UCSI_RECIPIENT_CON);
> > -		ucsi_unregister_port_psy(con);
> > -		if (con->wq)
> > -			destroy_workqueue(con->wq);
> > -		typec_unregister_port(con->port);
> > -		con->port =3D NULL;
> > -	}
> > +	ucsi_connector_clean(ucsi);
> >
> >  err_reset:
> >  	memset(&ucsi->cap, 0, sizeof(ucsi->cap));
> > @@ -1364,7 +1376,6 @@ EXPORT_SYMBOL_GPL(ucsi_register);
> >  void ucsi_unregister(struct ucsi *ucsi)
> >  {
> >  	u64 cmd =3D UCSI_SET_NOTIFICATION_ENABLE;
> > -	int i;
> >
> >  	/* Make sure that we are not in the middle of driver initialization *=
/
> >  	cancel_work_sync(&ucsi->work);
> > @@ -1372,18 +1383,7 @@ void ucsi_unregister(struct ucsi *ucsi)
> >  	/* Disable notifications */
> >  	ucsi->ops->async_write(ucsi, UCSI_CONTROL, &cmd, sizeof(cmd));
> >
> > -	for (i =3D 0; i < ucsi->cap.num_connectors; i++) {
> > -		cancel_work_sync(&ucsi->connector[i].work);
> > -		ucsi_unregister_partner(&ucsi->connector[i]);
> > -		ucsi_unregister_altmodes(&ucsi->connector[i],
> > -					 UCSI_RECIPIENT_CON);
> > -		ucsi_unregister_port_psy(&ucsi->connector[i]);
> > -		if (ucsi->connector[i].wq)
> > -			destroy_workqueue(ucsi->connector[i].wq);
> > -		typec_unregister_port(ucsi->connector[i].port);
> > -	}
> > -
> > -	kfree(ucsi->connector);
> > +	ucsi_connector_clean(ucsi);
> >  }
> >  EXPORT_SYMBOL_GPL(ucsi_unregister);
> >
> > --
> > 2.7.4
>=20
> thanks,
>=20
> --
> heikki
