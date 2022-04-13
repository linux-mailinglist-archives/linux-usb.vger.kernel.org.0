Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6B204FF12F
	for <lists+linux-usb@lfdr.de>; Wed, 13 Apr 2022 10:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233553AbiDMIDh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Apr 2022 04:03:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233714AbiDMIDA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Apr 2022 04:03:00 -0400
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com [216.71.142.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB2AB205F3
        for <linux-usb@vger.kernel.org>; Wed, 13 Apr 2022 01:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1649836839; x=1650441639;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GMYSQrUeG2D1RQO43TPNCn4KYNDDFGkGJm077NxJzQM=;
  b=VusF7IWfuJ09zk/m951b4+UUPXv631jR2OVqoNTnSImwRVY9A39QTAR4
   Fk0d+k9WKTUNB1eWTW6dhW2czGAPm0UnAsOi96SHiODStiprHqfKKNike
   zqGgy+iNnciBchbND/G63DouqHicVRIErbWgfE60G+f8xrR31r7TGEET7
   s=;
Received: from mail-mw2nam10lp2106.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.106])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 08:00:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RjVqcG022NMY6k2ubwhJ5m2ZNX5YtPOo5pqaKdrctBelHlr50yS77lf+rTiMha882AEc9Vb0n5NrwCBHt76UwN841o1c0BcLHKQ8biLAhzbn7cvgY/k062wlekwHaHRuvmIZjDO4ybfkjI6t94CeGzOWFjJTMQCXqIzQZj3ZDHoqmLIk0Y4fOZC6uDhE9LttAHyBjC31voji1IOe+8D9oK/4ivPotf+Ba3QoEovVh/ABXKhUZm8KTH/SZ6irk8FZWQakrm+leUS1NmSuOhT0BJauG4fU9BV5TdXx0kyXUTLPiZLmv+3QZo6T+SnwjUqKwj+4GJLYFWSO2dYX7/Fw6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMYSQrUeG2D1RQO43TPNCn4KYNDDFGkGJm077NxJzQM=;
 b=hkGvaga8FQ4Lr+seZFWbk0qMRsj2NMgK6DpIZ/rFCS7rPVoiuOGZ+zDpCuWnDt5qyqvw8wavW6354TxWLLZBlphpsW0zaVVL276Gb70APP7vQPmWcODK9K6RZL7+Md5WfruRsPQXS4OAhDC46FrKWx7DJ9Wba1lFAsSvydc9FJg2Rsv1FGdZFO9KBcaOP2IooutJCUct8VdgXfoDTg3tV9yYZD9fzPr8Ly9EG2OgZH/VZsVQGWZjVCBRlGnrvYOclQG1kdCjBB0gSUjoe6BmJId+FHc/UdlE+YdYEDryuO5GWSBacm3xqqI+bh1kAUuoZahCkZz4jUgYbra+6Yoz5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM8PR02MB8198.namprd02.prod.outlook.com (2603:10b6:8:4::7) by
 CY4PR02MB2774.namprd02.prod.outlook.com (2603:10b6:903:124::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.29; Wed, 13 Apr 2022 08:00:35 +0000
Received: from DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::15d6:317e:e736:e9ad]) by DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::15d6:317e:e736:e9ad%5]) with mapi id 15.20.5164.018; Wed, 13 Apr 2022
 08:00:35 +0000
From:   "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Jack Pham (QUIC)" <quic_jackp@quicinc.com>
Subject: RE: [PATCH 3/3] usb: typec: ucsi: retry find role swithch when module
 load late
Thread-Topic: [PATCH 3/3] usb: typec: ucsi: retry find role swithch when
 module load late
Thread-Index: AQHYTlhOBGmy0G1uSU2sGWcLEt44Mazt7b0A//+OfGA=
Date:   Wed, 13 Apr 2022 08:00:35 +0000
Message-ID: <DM8PR02MB819850DA69CED34F1B31B6EBE3EC9@DM8PR02MB8198.namprd02.prod.outlook.com>
References: <1649759407-24049-1-git-send-email-quic_linyyuan@quicinc.com>
 <1649759407-24049-4-git-send-email-quic_linyyuan@quicinc.com>
 <YlZ/wrIRUD7HpMDB@kuha.fi.intel.com>
In-Reply-To: <YlZ/wrIRUD7HpMDB@kuha.fi.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f45264d-1978-4c5a-8711-08da1d23b0e1
x-ms-traffictypediagnostic: CY4PR02MB2774:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <CY4PR02MB27743D168AD942C9AD8BA03D9FEC9@CY4PR02MB2774.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vy7XZDDqQBIPP0IDkk3DpLRm2UxzNbVGuoL1Ay8+wqNWj6QZ+wnsfGrdebgTwSDmQ0qm0O9b7eY9el6v/oR1hf1bVYOYPEsmeIDM4Ecuhz8PyqSlh0PVUAwnrGVuQSNOCvLY+GoYwrvRtxqnfAZ4Mghexqt1rSp8ILGkQPWFPjZKxQ/rDl23JSgk8Q5ZEbR3EmWROfPVpqJB6dxWVBRcyOvM2zuReEphv+EoI2RgWDC69AK/yFOHrRGOHlR9OZPuQwF+vCTAgTDomg6rnNcgBgmyQ7SYATfW3AEUHNzj4FQqXouzpS9KyJQz5ZOqjz2b4Z1s8zIlJ7CDbvbhvJXme4yWoqcs4gkgh6BEFuoXtyOFP+ZOgtgWuAmL5ISOQMT4Ib8tHAkU1OWpPiRqdgXxi3S9F6rHkO3qyEV5YiFLTLuo1iTNG4kuM2ZEsnN5X84MMM55Lzy3/qitJ3VTeEhd6g7npaxHIfSVWY0fj3SSC8yKW7belnSmzCDm67lnEUqhU+gQYEa5Qi+XgIXzmvotuVHlXRmWUPjqT1jRI0RwgAp84Q4mj3DoIiTijVLWRHXTQw/mr7VVqGwWmftfUvAuulaXjaP+leNMoT9rg8dGehBQV2NpKJRI8Svfq7d1FIr2SiT3eD7yWfy8J+OoarTSjeXoRAP0x9n0Hd2BiyS+u5lqinR6VwJwtldkMVl3ziTS30Sw29ha5FYdFt+1Kg8dEA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8198.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(9686003)(66556008)(76116006)(83380400001)(66446008)(64756008)(8676002)(110136005)(38100700002)(66476007)(55016003)(2906002)(38070700005)(66946007)(186003)(26005)(86362001)(107886003)(7696005)(53546011)(6506007)(5660300002)(33656002)(4326008)(508600001)(8936002)(52536014)(316002)(71200400001)(122000001)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Th2RWsE8qXvX/JB3iD+4o/BfDbyO3EyJPqq85C7tTHhXbeliPv9e1oz+tCWp?=
 =?us-ascii?Q?9L3MJuL3QtTGBRbMMhsRKfjtxRrLXNkGUBS551E0kvrkpMr/jZm6fm7duk/O?=
 =?us-ascii?Q?aD0BFBvKZHmLeibD4iH4Fw5c9cPe+rEO9x4Xj4LrDGDJwwPLUgn8O0FPWxDJ?=
 =?us-ascii?Q?g/HiLd3eTLKUpAHKtlq1KqfZNB3X6Yj3N+cCdQHQNteDB8sK7ECbuNJ55oXI?=
 =?us-ascii?Q?ffzngMsRqyR66tWCpnSimwuB/tQZtb0bwdYOKRXG5xiylmsP+bILLvvt/y8Q?=
 =?us-ascii?Q?QpXMBibxElwDN+f15LtuD+wMndSZsoJgH09o8cWYM1E2HAXmk8Atlzdauwlg?=
 =?us-ascii?Q?R3hcohAVHiJPoOH1FsaP8AmGN6WrZeBNbtq7bmYLL6v8Aw+48g7UHtSQuRI2?=
 =?us-ascii?Q?19ykNN+YlYFrDwSIGMQDdVE4/KOorr7hmV86fOcl9nzVvdbgQtymfl47FZlh?=
 =?us-ascii?Q?xtSAEkCgMLc+OG52gIHgHHgNm8Bg3hWFVE7Zfai1XrLBPIJWjU1vsBXtQSbs?=
 =?us-ascii?Q?tDaf/RqZafIIdzzywwWR4j0bLVGeLBs5bs02f7t1rWUqfXopr3T9c03VlBaM?=
 =?us-ascii?Q?diNEpP5NOShTO1ubNUH9r8nICpyZa7TJb5ANV14zr0pV92DS8qWpKlLtWpkY?=
 =?us-ascii?Q?hcu0bdhgSxxFbZZ+Uo1asf0vmNnP6mxxqbTdwSCENTQDyUUQxbYnMwqc8iG5?=
 =?us-ascii?Q?ecec4VbgfEORLOREZ/um7hLz9ailiVmkvpGbA/MclpEXpvrg4pnTSAiiCOgM?=
 =?us-ascii?Q?hFk6zdRoI1HWYGDMCqK/7JLiN+HHEgd7VmXS5VedCGyjLbbRFx9fM7jUUP4y?=
 =?us-ascii?Q?iuHTm0Dk0qREQzu+D9r5FlOpUmlJrt50FTU7Gi5II4al8ZmD1AXKVqmYB6cr?=
 =?us-ascii?Q?6Rhi3FN8y8MoL8ToaOzyxSbIhMyij7Ln581RPfpwYgBgjy5SPf3BAi+H55KI?=
 =?us-ascii?Q?bAMsQ1NYQTpRIEKzjFC/4RAk7iGxAtO1+vJEW87L5FbCCMcOUr8DKIjKXnwN?=
 =?us-ascii?Q?9tkm40Km9wanCGRjX4d1uW+zqSqfzDCU9CwQxVSC4J97asDxNXWrcPQp7q08?=
 =?us-ascii?Q?bCJxbV9JAqlz401rzg6nQd827Ka8Vfso7JZykNrpueysxX/N9JE88/my2Tzn?=
 =?us-ascii?Q?t9ooRz5by5tdfjd1C/JEFLfxgljdS/keE8NXvYZ790uG2o9wax+sTQF7DtCN?=
 =?us-ascii?Q?p0woH8sMI/Cvx3mSzaeTmOidhEA2SbbS8qzNnMair+YwzjMAMFQGdsJ7hRRl?=
 =?us-ascii?Q?y/5r73RjGpkTzFKpL408Xb57heE21oKoaJTLkakK1pC2VfnsD2Tl28XZGo5d?=
 =?us-ascii?Q?wvBVXuSO1YkVkBIB+btDolLbi2IWogNmZ5qDv55ohyO+h+hhWiUprzEYNi5z?=
 =?us-ascii?Q?IJV+HHejJ9rZnpsuazIfnK1bavA9RqApbkHvSyDEE3nGph0l43G+6EIKfx/9?=
 =?us-ascii?Q?G1OeBKER1UFMM813rdSWhB9+IhJ157NoB+zKqoYE4VnvL0dBq3mMH8cM+PP0?=
 =?us-ascii?Q?11qodxYKEBEp0nQudWUMSJuwtpuTS4ShHbcZTLgGBBD5klvDmXn24ifFzXBV?=
 =?us-ascii?Q?ZT+/QhTAvEWURXrP0r9O1zPjlAcTGsRgCNMRz3XJmxZylsnemm66NbJKYFtx?=
 =?us-ascii?Q?524IGg7PCnxWRlNkhjW8QNl7izs5XD40avv9Tsli76RlQivS4Gwx6UDOAp5O?=
 =?us-ascii?Q?YDthdvVLctUQWE0Br/5bhnE/AKslRfFrzk28pfBMlU34YwD38LoMn8p0g/m1?=
 =?us-ascii?Q?k/6rbx0Wfw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8198.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f45264d-1978-4c5a-8711-08da1d23b0e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2022 08:00:35.4196
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u37R6jyAiw9Y+hTVj4DxSTBqlqaKByvhGWhm9TFXY9Ey2S9bKSgS9BSwKp1QK12T+HSxiqiOlHfOsM69uO3JEuOHBDvHbJ6gZXeEg4MLDHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2774
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
> Sent: Wednesday, April 13, 2022 3:46 PM
> To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; linux-
> usb@vger.kernel.org; Jack Pham (QUIC) <quic_jackp@quicinc.com>
> Subject: Re: [PATCH 3/3] usb: typec: ucsi: retry find role swithch when
> module load late
>=20
> On Tue, Apr 12, 2022 at 06:30:07PM +0800, Linyu Yuan wrote:
> > When role switch enabled, return -EAGAIN if fail to find it due to
> > module load ordering issue, then restart ucsi init work to find
> > it again every 100ms.
> >
> > It also means change ucsi init work to delayed_work.
> >
> > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > ---
> >  drivers/usb/typec/ucsi/ucsi.c | 28 ++++++++++++++++------------
> >  drivers/usb/typec/ucsi/ucsi.h |  2 +-
> >  2 files changed, 17 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucs=
i.c
> > index 684fc4f..fabd4df 100644
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
> > +			index + 1);
> > +		return -EAGAIN;
> > +	}
>=20
> No, this is wrong. If there is a role switch assigned in the firmware
> for the port, then fwnode_usb_role_switch_get() will return
> -EPROBE_DEFER until the switch has been registered.
>=20
> So I think what you want to do is just make the failure to get the
> role switch fatal in this driver. Just return PTR_ERR(con->usb_role_sw).
Thanks, will change it to check -EPROBE_DEFER.
>=20
> thanks,
>=20
> --
> heikki
