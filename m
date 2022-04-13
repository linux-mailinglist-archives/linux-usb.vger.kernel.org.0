Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B17D04FF7FE
	for <lists+linux-usb@lfdr.de>; Wed, 13 Apr 2022 15:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235899AbiDMNpT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Apr 2022 09:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233893AbiDMNpR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Apr 2022 09:45:17 -0400
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com [216.71.142.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36C8660077
        for <linux-usb@vger.kernel.org>; Wed, 13 Apr 2022 06:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1649857376; x=1650462176;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iD+N0PcyDET408BbdwSQFl0QH2wJbDRwmyeMxeNIgb8=;
  b=uSvCiX5UWtTUlnTAY3pXWKcBLvPMhPm2QyO9BdO8c/D+7kjt99/or85r
   wAx/wwFky8fGayUTQ8CbzQ08mwpxG2DQ7byNPLuaJPA/ma9NSTgzwnL+W
   c6E6w8iEZdnxy2OSXKS7eDe+YWaXKhr/b9P0YhR/UuW6tM0b5wBZElpsI
   k=;
Received: from mail-bn8nam08lp2048.outbound.protection.outlook.com (HELO NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.48])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 13:42:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=izW/lk8Qury69arMeRh4rUZrA/gVemmUrfDnK0EII/1LA0Miu/FVb9+Len+YWH2NwAOdiEi7I3x+IetUL7OgWWZg2dY1hTgx792bMw+m23VKXykcrT8QkmSCOk7No9l1idL+KyMkoF+hGOQOw+5NoWwUwJELeImW3PcaEnBlLXQ+2yDPwqF/x2OuE6RfLiyyIafrIkOrZZdRySeWXlkpiVsxJGKqFb/HN5J0ZAlAmOs5dNbv/4poom93u4I0o7vU8Bmuv44cU//tfOLIGOj3nIIqAhGJte5FFNJu5YEAv3CiXWdzLNjE0XC3mY18i/QxCmPCYnq/Uu6nJU48C6osBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iD+N0PcyDET408BbdwSQFl0QH2wJbDRwmyeMxeNIgb8=;
 b=QDAabb6lQlXQeUcVj1d8tAQiQlunZ1/OZt6b3jglc5u+y/yeq5Cg7+/NXSNqBv8KhnBBaBVD6xspZbaCToXt4qi1hbLLokl4z5L7btwMr+nQwsSdr4L1BfQroCv2fcHlml4nXsZaS/Lz4ShRD9ojqfnTJrYmpZS7sE+f0VLp2+0RT5RJ3Alf0Ww3MnZ9w6l0mf16eKGFUMRvOAYgUcMAAjGDCVh8DP+Ox/7q5byEXfOZm4uFTb+h3lk4p1NmHE6CfOLd6bRNHm9NHVoM8ocXlpT1xjdH/a8tnCPR0kNi1xjWhPFuLJijlHo2ZMfmqR2v4USq5x1l1R7NL4dQxze0+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM8PR02MB8198.namprd02.prod.outlook.com (2603:10b6:8:4::7) by
 CY4PR02MB2725.namprd02.prod.outlook.com (2603:10b6:903:128::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 13:42:52 +0000
Received: from DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::15d6:317e:e736:e9ad]) by DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::15d6:317e:e736:e9ad%5]) with mapi id 15.20.5164.018; Wed, 13 Apr 2022
 13:42:52 +0000
From:   "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Jack Pham (QUIC)" <quic_jackp@quicinc.com>
Subject: RE: [PATCH v3 4/4] usb: typec: ucsi: retry find role swithch when
 module load late
Thread-Topic: [PATCH v3 4/4] usb: typec: ucsi: retry find role swithch when
 module load late
Thread-Index: AQHYTx0F90xU2/wxzkix8ByZL1bktazuPkaA//+YNgA=
Date:   Wed, 13 Apr 2022 13:42:52 +0000
Message-ID: <DM8PR02MB8198A080766C934496479FE2E3EC9@DM8PR02MB8198.namprd02.prod.outlook.com>
References: <1649843891-15554-1-git-send-email-quic_linyyuan@quicinc.com>
 <1649843891-15554-5-git-send-email-quic_linyyuan@quicinc.com>
 <YlbEm31fOaMsFW6C@kuha.fi.intel.com>
In-Reply-To: <YlbEm31fOaMsFW6C@kuha.fi.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 316eb9bd-2e75-4805-d6d2-08da1d5381dd
x-ms-traffictypediagnostic: CY4PR02MB2725:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <CY4PR02MB272554E79EDF02DD399D3E479FEC9@CY4PR02MB2725.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5TBUJfSQNmdqb/bPlquFT2mWuDEhNNHHUphvSGlpGBmhXNiLFUpNQV6mfmvsuORV5Hm51q/b//biU6it1zmodK2BxZImhHGT4gcbmZos4+PblSoulzhwtrCC73KCUioeOpNYtY+IS5TGSFm3VPSLKTnMmAjYCfFjAyf6UEtZ+6QfhpMqaFcU6sUsBuysteu/DD8nb/tYB1I+dbG2uAavYTz9cPFl6HB08fMlr/7KxnURwTMQJZELQSi3W9JqY30H58rTu3/FHjt8rva6hwyM703szsH/RxAfapyGwXUKra6pmR2+9iSpr7vKBkWl2sUZfUqYipp4yY33X0i4agXBN6dkLTkx8YNfgnJnThvcIiB5NcMXeAs4w4D9zzCGfeIM1JWVN6K2gYDOCB0Vot0TxBsKViEHPIFepahnbnIfWNFMc1AVkjEQg5csHol8e5u+Jr3D+6IZDjXxpzGfdTOIeLFbLSPsFddlO0LNSy59Pe/61zPj09Uqpeb+z1pTJl/RY+gpOI4lX1eDRqpmCsMOfdexeqY+1U8HPYzQ6FYFi7kKvu61t95dP9vF/fuoqjeb/dBsgy/hhzhXjP9+SCQBlrAi78FfU8Rvhc24ASjhtN7iZ6wRHRKduUM/n3/BU2XXAyswRKH0aFkosc3l8Hv705BMkVSMdOGi6YVWEAUQGPGN6A0P1y4PQkZXGL/i/kbFDdSarOVIobVPqdxrvT9aWQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8198.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(33656002)(186003)(54906003)(110136005)(66556008)(64756008)(508600001)(8676002)(76116006)(66946007)(4326008)(66446008)(38100700002)(66476007)(122000001)(316002)(55016003)(2906002)(5660300002)(71200400001)(38070700005)(83380400001)(107886003)(26005)(86362001)(52536014)(7696005)(6506007)(9686003)(53546011)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xlcB+7oXyccOfZcLDmnGhnjFKlGliOkAeh0mQ2ZxaVCe8NC3ai8ttn+niSMG?=
 =?us-ascii?Q?U7GsDFtxDH5+U+YjlTf60aHbTXV+TsODUjlwLB3gcTo1TIuCtguFM5vuTttt?=
 =?us-ascii?Q?OeBVwFa0HZ6EpxiW8wLMABUvnqOTv4r/mo8Lkgn2FCCm0xXpzettrXlro4Xn?=
 =?us-ascii?Q?NirU1W2HZoud90GM4pdpSb92E8rtK+kZ8cq022vqShCAuW07lR+IAF3w4nZP?=
 =?us-ascii?Q?jkTbdu4lOYEwmnJWFb71SKC5fRkAVoMyVsYJucaVmUir6YtRy5707cocrh7/?=
 =?us-ascii?Q?SheXnMAIPL34IedJZ0ph+jJuxGl6yracL7GA61qzLqtvbNyjIqm1RPmn98EV?=
 =?us-ascii?Q?Pz9zy/EJl7IatZjn4aCVRsfAPQRyrSp5okJScheJ9Qdp9aIicbZvQDwiMcHF?=
 =?us-ascii?Q?qkNk0S+x+x9ENEHlKS3desx7d1THU324QIP2FQnB9Uv+yO5RDT9GJxLPSQZL?=
 =?us-ascii?Q?34xaxzfM/Pod74tpQ1MbZTur0TT5AJrENJXm5r+G9pcOlIChkhrz96oqhX1S?=
 =?us-ascii?Q?ZkYbBzbJL9ARkZjm6XkVgcBfOxllDrQTc2qJevWckm202AVY6CYNVjr/K0s9?=
 =?us-ascii?Q?NF8kAnFoF7r+4+or7V2jkRBgZQYi+FdlcFfQu/bzbTZmJeSjA1IFxjAVWN1x?=
 =?us-ascii?Q?oU9+p9IMWpltkG5onBV4GyZZxQ8w3dMllwuiWOwIsNoR3Z3O08EgtjVfD61S?=
 =?us-ascii?Q?sTUthLGf0eROW+Y1OaVu3/TiDXSIEoSCrOod9xRs+hLN5RCKTxhW6bQtKKwA?=
 =?us-ascii?Q?U1rVZsEmrfLxXPMtlG7QWleXhj+URJqa+uNmUo+JJJ0hy1/OiEzfpzhcSuFv?=
 =?us-ascii?Q?Odk3z6mOJM5XbtPqgdcNEs2bwmbzMNmlFJLfFiS/24oBmhxMUd62Dfj6GQIL?=
 =?us-ascii?Q?5yYXzz3AI+aLTNfkQi1dvJiQ1ouNhoi5xVXAS098rKqg+U/CORuxpUVL6bCV?=
 =?us-ascii?Q?PreRho+RFU6uSao+fNK668F3d/mzWVMV/0QJ51AS0NahGkydGIzpF8ZytU9S?=
 =?us-ascii?Q?2XqU457BDcUX56E2Jd2erRcGbsHfqYCyQ3LGY1tkCvOHF3JA4EMRPmmXWYYh?=
 =?us-ascii?Q?UHcylpSWxyAxhrnzraOS0gR7Ul3tVRUBDEYgdBseLqeIlk49xQYg8TQOXkwS?=
 =?us-ascii?Q?PFhDx6WqBsM7XsgybtxM9rLy4SwjW8tQQbLUTMrUUtUxuTu2umNXx4gT2i08?=
 =?us-ascii?Q?hnKE1FkXRJpzP0F75OHmyfdWnpf2fnjLSCdxsmTWRiTjSk1gYvHzrRbIdswF?=
 =?us-ascii?Q?wpgxSEN6blaIXWjK2GNOfw2VL8KKszFHMjfeeWmipR2U8vPfo6q8QqFNiHkP?=
 =?us-ascii?Q?8a//spnZ3ouNCXxY1elVsLnQxP3c9dS+OQkKL6Jioql9uIUeOH4hwe2gLslL?=
 =?us-ascii?Q?O7XZR1HJIwPrCD2q98vfeUFxKC22Bmmc8cHjyW0Vbsw4WBoNbH7t2poxk+W9?=
 =?us-ascii?Q?HWdp/16/sNsaXcSAMexBrXcLOmVh4vcQe2PgcLi/hF5S1BCSmf5ruWEh1F/A?=
 =?us-ascii?Q?1feiZPKJo96hfTJWPYnbm0DR8pzfUfOJBkPpF27JtM8c/Ngrx7hg0bbnbQup?=
 =?us-ascii?Q?fDbPB/sjOuYM6Z6vObFc5WieDKFosf+D6UFKiTVYBmNNO/FLZkn7tBwcjx2O?=
 =?us-ascii?Q?B+Caqbscr5xr/dbaPynKbjSOnnD1sFn5oiWXVtWNdZjgs7SHNP4esAd1R9ps?=
 =?us-ascii?Q?KuUboyRHPFpp97GjYzGlt37CmlicsSzqmEphkLL9XkAhbMYHza5qGD5Cz8x2?=
 =?us-ascii?Q?WjMFcZxfog=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8198.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 316eb9bd-2e75-4805-d6d2-08da1d5381dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2022 13:42:52.3386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h9md3Erqmv2ZuAwT+SG1dENvefea93Jv5Fj6d1XjFhi96Wpn7DxIOrdPlV4lVhJf4O1jhsvEOZrW0mpA85JXVj5XYOZpv+hkksFMeUaBUzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2725
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
> Sent: Wednesday, April 13, 2022 8:40 PM
> To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; linux-
> usb@vger.kernel.org; Jack Pham (QUIC) <quic_jackp@quicinc.com>
> Subject: Re: [PATCH v3 4/4] usb: typec: ucsi: retry find role swithch whe=
n
> module load late
>=20
> Hi,
>=20
> You have to make the subject line a bit more clear. Perhaps you could
> just say "Wait for the USB role switches".

Sound great, will change once all discussion in this thread done.

>=20
> On Wed, Apr 13, 2022 at 05:58:11PM +0800, Linyu Yuan wrote:
> > When role switch enabled, return -EAGAIN if fail to find it due to
> > module load ordering issue, then restart ucsi init work to find
> > it again every 100ms.
>=20
> It looks like you did not update that.

Sorry, will update later.

>=20
> > It also means change ucsi init work to delayed_work.
>=20
> So from where does that 100ms come from?

Yes, no place define it, just an experiment value.
Any suggestion ?

>=20
> > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > ---
> > v2: keep original con->num in debug log
> > v3: change return value from -EAGAIN to PTR_ERR()
> >
> >  drivers/usb/typec/ucsi/ucsi.c | 28 ++++++++++++++++------------
> >  drivers/usb/typec/ucsi/ucsi.h |  2 +-
> >  2 files changed, 17 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucs=
i.c
> > index ce9192e..63c25dd 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -1053,6 +1053,14 @@ static int ucsi_register_port(struct ucsi *ucsi,=
 int
> index)
> >  	con->num =3D index + 1;
> >  	con->ucsi =3D ucsi;
> >
> > +	cap->fwnode =3D ucsi_find_fwnode(con);
> > +	con->usb_role_sw =3D fwnode_usb_role_switch_get(cap->fwnode);
> > +	if (IS_ERR(con->usb_role_sw)) {
> > +		dev_err(ucsi->dev, "con%d: failed to get usb role switch\n",
> > +			con->num);
> > +		return PTR_ERR(con->usb_role_sw);
> > +	}
> > +
> >  	/* Delay other interactions with the con until registration is comple=
te
> */
> >  	mutex_lock(&con->lock);
> >
> > @@ -1088,7 +1096,6 @@ static int ucsi_register_port(struct ucsi *ucsi, =
int
> index)
> >  	if (con->cap.op_mode &
> UCSI_CONCAP_OPMODE_DEBUG_ACCESSORY)
> >  		*accessory =3D TYPEC_ACCESSORY_DEBUG;
> >
> > -	cap->fwnode =3D ucsi_find_fwnode(con);
> >  	cap->driver_data =3D con;
> >  	cap->ops =3D &ucsi_ops;
> >
> > @@ -1147,13 +1154,6 @@ static int ucsi_register_port(struct ucsi *ucsi,=
 int
> index)
> >  		ucsi_port_psy_changed(con);
> >  	}
> >
> > -	con->usb_role_sw =3D fwnode_usb_role_switch_get(cap->fwnode);
> > -	if (IS_ERR(con->usb_role_sw)) {
> > -		dev_err(ucsi->dev, "con%d: failed to get usb role switch\n",
> > -			con->num);
> > -		con->usb_role_sw =3D NULL;
> > -	}
> > -
> >  	/* Only notify USB controller if partner supports USB data */
> >  	if (!(UCSI_CONSTAT_PARTNER_FLAGS(con->status.flags) &
> UCSI_CONSTAT_PARTNER_FLAG_USB))
> >  		u_role =3D USB_ROLE_NONE;
> > @@ -1286,12 +1286,16 @@ static int ucsi_init(struct ucsi *ucsi)
> >
> >  static void ucsi_init_work(struct work_struct *work)
> >  {
> > -	struct ucsi *ucsi =3D container_of(work, struct ucsi, work);
> > +	struct ucsi *ucsi =3D container_of(work, struct ucsi, work.work);
> >  	int ret;
> >
> >  	ret =3D ucsi_init(ucsi);
> >  	if (ret)
> >  		dev_err(ucsi->dev, "PPM init failed (%d)\n", ret);
> > +
> > +
>=20
> Extra line.
>=20
> > +	if (ret =3D=3D -EPROBE_DEFER)
> > +		queue_delayed_work(system_long_wq, &ucsi->work,
> HZ/10);
>=20
> You have to stop queueing that eventually. You need a counter.
>=20
> I'm still not sure why do you want to queue this same work again and
> again? Why not just call ucsi_init() in a loop?

Will follow your suggestion below.

>=20
>         int my_counter =3D 1000;
So you prefer 10 second in total ?
If so, next version, I will change it to 500, as msleep(20), check next.
>=20
>         while (ucsi_init(ucsi) =3D=3D -EPROBE_DEFER && my_counter--)
>                 msleep(10);
In checkpatch.pl, it suggest msleep no less than 20ms each time.
msleep(20) ?

>=20
> >  }

Great idea, it will be less code change.

> >
> >  /**
> > @@ -1331,7 +1335,7 @@ struct ucsi *ucsi_create(struct device *dev, cons=
t
> struct ucsi_operations *ops)
> >  	if (!ucsi)
> >  		return ERR_PTR(-ENOMEM);
> >
> > -	INIT_WORK(&ucsi->work, ucsi_init_work);
> > +	INIT_DELAYED_WORK(&ucsi->work, ucsi_init_work);
> >  	mutex_init(&ucsi->ppm_lock);
> >  	ucsi->dev =3D dev;
> >  	ucsi->ops =3D ops;
> > @@ -1366,7 +1370,7 @@ int ucsi_register(struct ucsi *ucsi)
> >  	if (!ucsi->version)
> >  		return -ENODEV;
> >
> > -	queue_work(system_long_wq, &ucsi->work);
> > +	queue_delayed_work(system_long_wq, &ucsi->work, 0);
> >
> >  	return 0;
> >  }
> > @@ -1383,7 +1387,7 @@ void ucsi_unregister(struct ucsi *ucsi)
> >  	u64 cmd =3D UCSI_SET_NOTIFICATION_ENABLE;
> >
> >  	/* Make sure that we are not in the middle of driver initialization *=
/
> > -	cancel_work_sync(&ucsi->work);
> > +	cancel_delayed_work_sync(&ucsi->work);
> >
> >  	/* Disable notifications */
> >  	ucsi->ops->async_write(ucsi, UCSI_CONTROL, &cmd, sizeof(cmd));
> > diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucs=
i.h
> > index 280f1e1..3812017 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.h
> > +++ b/drivers/usb/typec/ucsi/ucsi.h
> > @@ -287,7 +287,7 @@ struct ucsi {
> >  	struct ucsi_capability cap;
> >  	struct ucsi_connector *connector;
> >
> > -	struct work_struct work;
> > +	struct delayed_work work;
> >
> >  	/* PPM Communication lock */
> >  	struct mutex ppm_lock;
> > --
> > 2.7.4
>=20
> thanks,
>=20
> --
> heikki
