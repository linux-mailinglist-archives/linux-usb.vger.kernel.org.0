Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 476D14FF19D
	for <lists+linux-usb@lfdr.de>; Wed, 13 Apr 2022 10:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232400AbiDMITS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Apr 2022 04:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbiDMITR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Apr 2022 04:19:17 -0400
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com [216.71.140.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F7F34D638
        for <linux-usb@vger.kernel.org>; Wed, 13 Apr 2022 01:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1649837817; x=1650442617;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=E9+Qs6Gd0v39O7qUGX65mPw8V0hMfos3F06D3iQvglQ=;
  b=PE+20LD/++16S/qNvlLCtHnwAtoG0iH2xKp5YHAheghU+1TWj90mR40Y
   QX6rqUYl2HWcm+anTwVYDZX7eWen0cvOW8DH+/VAOlU53ouuAXIGPHjmr
   p47dGXuZ9WIHxYu4bxv5dyZQGESOWHIX/VoBjIZ6YmHz2T+Gki5rOlL9i
   k=;
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 08:16:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eeJ3nzl7srRzuwfkLS4VVM0XLnC2ByPJjSj1M0QAVrlDe9J1Vx3n79aALkKfb8AxRc6YF/ctf+JWMdvxiM/12mZsw/TgEGCzX4NT02B+G6/KQ0sGs5GAa5xeLiKXQNgksJSx2CCWxsfE9BRyofTlYRei8WeSYvfRzJttAB1y4MgKRbG0r4O2HsarjFvvh78TfLpWLCvG81LXmUJuBoVFFX9mJfRlujWyM6g5EvDLn1Y+qUe8J7RWCOvoZRqad8Qww7vU/KqfSgF3XZKn52OZh36jGPYA6UZLUWj6rPTzMdaTqnUKymLQQF6dGwDAF4Ll1anQNml+iFvkb46PmMAeEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9+Qs6Gd0v39O7qUGX65mPw8V0hMfos3F06D3iQvglQ=;
 b=VqfsVEUMW9wFgX0dHdeBRxzhzDLKNM0HHcjEQBPZh+ozn8+ZqHaQWinCLKfAglZuEcv1ygQMh7pgcPz/W0dfJMPnqByz0ZDs2RUHPa/gTXmjARFc8qsZpvKbIwf8WU0x+4UuQImDvUGk+7mry3kCf9oYpEq+5nRRST9GAeFQLrfFC3RtncWp8hi79NsZPbHY6GzctIHh3rENJXdN/rp9++N+JDIC01mc7oCD1VggSTsHhTmfqUDIouH9jTLUJ0omTUot0+ynbmw2eMlbvTE1My6zQcF2Fu8BKU+YMmsE6WVPznNLu4nrMy0htYzVAi/B4apTrBvkdtuBcnjoSRlDgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM8PR02MB8198.namprd02.prod.outlook.com (2603:10b6:8:4::7) by
 SN1PR02MB3741.namprd02.prod.outlook.com (2603:10b6:802:28::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.29; Wed, 13 Apr 2022 08:16:54 +0000
Received: from DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::15d6:317e:e736:e9ad]) by DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::15d6:317e:e736:e9ad%5]) with mapi id 15.20.5164.018; Wed, 13 Apr 2022
 08:16:53 +0000
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
Thread-Index: AQHYTlhOBGmy0G1uSU2sGWcLEt44Mazt7b0A//+OfGCAAHgpgP//i5qg
Date:   Wed, 13 Apr 2022 08:16:53 +0000
Message-ID: <DM8PR02MB8198536D2D5962F6FB5DB789E3EC9@DM8PR02MB8198.namprd02.prod.outlook.com>
References: <1649759407-24049-1-git-send-email-quic_linyyuan@quicinc.com>
 <1649759407-24049-4-git-send-email-quic_linyyuan@quicinc.com>
 <YlZ/wrIRUD7HpMDB@kuha.fi.intel.com>
 <DM8PR02MB819850DA69CED34F1B31B6EBE3EC9@DM8PR02MB8198.namprd02.prod.outlook.com>
 <YlaFVUyJPkKJpi2D@kuha.fi.intel.com>
In-Reply-To: <YlaFVUyJPkKJpi2D@kuha.fi.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b17c3ef3-a2db-4f84-03cf-08da1d25f816
x-ms-traffictypediagnostic: SN1PR02MB3741:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <SN1PR02MB37411442D46F8C10029A1BB79FEC9@SN1PR02MB3741.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6Ep5KxVwzxC7D7PHCu3KYq47NvGMmeS9N1lCBJRnIY+VYPcp4hmj0BHgTfU9WulkDF+q7QXBAHu6PgD7Zu012cFLuG+JgLTs8Xs0Mvbm7QHmszV2/utxak+fJMxshGr9h/qIU3xj6ekwLxWqwf3jzN/Sr//EMmDBzDt3ZMLybucbOo7VJDW4WsC1rgeK41H0q8lgoyGz35sIhpaDRb7SSG9thI6Fb+4XHAioyNPbXyL4rgiaQckSr0q+00rXRMpRTzRVCL5wSzyV9VY1mvk3fMXVre9H7EBQA/fQsCpnZ8doT2N+69JCBA+PEUeIOH4cXydAJh3nTMYU8yC8XG/lmTZ2qFBlxMemBzsgrNM7OC5Djz3wCwblUJgW+7vg6utH7QnKjwFFyJ9e4nbswOk05kra7mCSpQMmC2Atfuu0haHOMBQPvNuaiHxW31U/61r9sDqeYWh7qM04FWBgc/o6q2CUYIzRm4QPgup3jVDIFy/2ARsPYDx7i8ms2OhOjVGlpd52PhslLTL6I2TRw2IDWv+7DiIeYOsXEtwMZCPkQCoO0yt0PSpDyscWLSoKsf1x4YRAMcgo4aHg6J/gEjjLyURXJyTt/j4pvI0L900AnrUOGkyxXs4crdaJvRoxAwmHQvZhLhdkHYDzjAqxBq1gBA8+iYGl4UfWEMF7mnIeve0pfPw9LqUqO6/Gk2PJzEKyvxba26gdWFHIWldP69pk7g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8198.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(76116006)(54906003)(66476007)(66556008)(64756008)(66446008)(66946007)(4326008)(508600001)(53546011)(7696005)(71200400001)(9686003)(6506007)(316002)(83380400001)(26005)(107886003)(186003)(110136005)(33656002)(2906002)(86362001)(55016003)(38100700002)(122000001)(52536014)(8936002)(5660300002)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LdZkZxCIsyjC70jqORUQhNguOdVHxaobEBC+xrANMOg9aYk+jWjgZ6un7gjh?=
 =?us-ascii?Q?IEoqOiA1678uSjNC8RJ+koyH+2Lu/8Zu3D7BcE9GEvLIvHFcXCBH5FXBAFJJ?=
 =?us-ascii?Q?k4zFrGXUQO5X0+0sEBUKs2hflKByIha6Fq82YQgNQn2mQpqpSIsUHgaQfh1A?=
 =?us-ascii?Q?Fh0x38/pbVk7he/1b7/Bl95Y7H6tf/iZyoqn0/tAjLQuIJAmsfmuRTtqoe6P?=
 =?us-ascii?Q?ahg/fAsYTI6LXpqenCVVpOjFUEf+teQLccEpnWaPXOcz4P8Z1VKpb2ZjBfa8?=
 =?us-ascii?Q?waM1B5g0K31QDLAxVF7o9gfikTZ4n4Se/H7+0iMz9HVkmh3CqSRLSjGu05R+?=
 =?us-ascii?Q?TrrwAn660PF9QPlMm1+1sH8pxk38CIeYJTN+mK4QgRuonXMkjs4bCq2pDDdQ?=
 =?us-ascii?Q?Lj3dFR2OZdqJhE8CEXgKjF/LgX++0kipJhjlTUcp8sy/VMipndKKkskACGMe?=
 =?us-ascii?Q?ungXYC6NbWqsX3bIc00kjdYcM+UYTJgeb1tYrpdX483tp2nq53qUxdjes803?=
 =?us-ascii?Q?nvUDsRiBagPyATto/0CHuVsoteA3A6M/CVB2oOJzESBeyVzx+6CYEYXrk02E?=
 =?us-ascii?Q?G6//zhX7verrAjduibdC1RIdu+M45dWj77bLd1Zx/3Z/MB8wsuv3/9VCEyB1?=
 =?us-ascii?Q?CjzwfWzGU+Kyf0lbcTXXRAS1xfvb52RXHf3m6W3uk2KfBTIXpHyP7EK5Qc+B?=
 =?us-ascii?Q?iEMbiVX85SEHZJGX5Aj2GSbwDX6/rV6F2l2qps7cYwfgcYqCp/UOvn4YTV+Z?=
 =?us-ascii?Q?OhtCBfVinfwEns0OA9eyf8QI5PXgDkbUxLdT0om56mDG0DK+kP6iMvMCarri?=
 =?us-ascii?Q?ggQLrSi9MuGTr6YIZo1kEhXF7G1srv9MzuhAMFjr1OcoMCpOaZrF+Vw/mZjP?=
 =?us-ascii?Q?PqzFvFe0yCb0xF72my5vPbj0TlnE5mSfqqHdVijIAU9TU6Mbssy2rwhY4r1l?=
 =?us-ascii?Q?q7oW+6ricCpEvASQ639A5gepBKgfDKSx4QRC6O/1ALQepHTDDewQ6Yn3JUUO?=
 =?us-ascii?Q?yD4/O81C1vGU9R6lS+fIvSlmRRennlC147TGdMogsiTgrk6wNlf5qzDDQitS?=
 =?us-ascii?Q?mPZp3IcrwvIJoP877ud671SS2vSci93KHMkEA1TZpL+og7kB2vJbdW3miSc2?=
 =?us-ascii?Q?CAps55mSd9ospvEAjmPHI+Mitse6OjJwaiOxEyl6/l3+3yMyH21thZUnvGVZ?=
 =?us-ascii?Q?ybeYVSLLPUK3xhxHfhT257xZj6ftjqn9tQAwyYA8qfwYRsa/5486bcEEMUZM?=
 =?us-ascii?Q?HUboxw44BUmxYthLExa3lZvYN9s6R/WFolRoYnqJVx6fY7xzh1X8muVvO3Tr?=
 =?us-ascii?Q?YDePEYGrkSdBk+oJDvk3RY69Ycb1zheMGcm0RWeCYZ2pl5Drb0cBj7qIMbpY?=
 =?us-ascii?Q?aC/26BvvHY6vs8cMLyZbPVhNmLt3vB8Kcmi72LmWzidAwBRRVMpwNoJb9Zrv?=
 =?us-ascii?Q?oayoNkoKZ4KZom84Fdwa4PBDMcuC28H4rEdSgHvjEXs3sUi81XT0yIuEzHAf?=
 =?us-ascii?Q?9kchwBIzoMx4HzUSMz5lplqdDv/Twy5m3HXKIGg3NiKlPSNxryhCt/lluGVI?=
 =?us-ascii?Q?epqoCfYiGQwzvq32xIS3N9CbXXX+dehFdJrrPH5iJ+ym6nJasIXZGJlaUUl6?=
 =?us-ascii?Q?5IYAy29gE6Curh6qBIbuPcO8J30Sq9RDSaZoysLj1Q3JajJNrNrr/owI7mYp?=
 =?us-ascii?Q?jQJfdArJf+ZsZ1erAumS3pMk6fNXOrVmdk0t68a6p8iVavPReftmkEd75Xxj?=
 =?us-ascii?Q?anKeZ5mpBw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8198.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b17c3ef3-a2db-4f84-03cf-08da1d25f816
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2022 08:16:53.8284
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lHAHsbyP9PvQqzYQnp0cWo3l6HJzN+VqDK/Y0rSwxjCg/+NE5idIw6qDyIDo1xdAOF40mSIOfcv8Xxqkxi0Ugpwt5O80GLYCECyDqX1Deq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB3741
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
> Sent: Wednesday, April 13, 2022 4:10 PM
> To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; linux-
> usb@vger.kernel.org; Jack Pham (QUIC) <quic_jackp@quicinc.com>
> Subject: Re: [PATCH 3/3] usb: typec: ucsi: retry find role swithch when
> module load late
>=20
> On Wed, Apr 13, 2022 at 08:00:35AM +0000, Linyu Yuan (QUIC) wrote:
> > > From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > Sent: Wednesday, April 13, 2022 3:46 PM
> > > To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; linux-
> > > usb@vger.kernel.org; Jack Pham (QUIC) <quic_jackp@quicinc.com>
> > > Subject: Re: [PATCH 3/3] usb: typec: ucsi: retry find role swithch wh=
en
> > > module load late
> > >
> > > On Tue, Apr 12, 2022 at 06:30:07PM +0800, Linyu Yuan wrote:
> > > > When role switch enabled, return -EAGAIN if fail to find it due to
> > > > module load ordering issue, then restart ucsi init work to find
> > > > it again every 100ms.
> > > >
> > > > It also means change ucsi init work to delayed_work.
> > > >
> > > > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > > > ---
> > > >  drivers/usb/typec/ucsi/ucsi.c | 28 ++++++++++++++++------------
> > > >  drivers/usb/typec/ucsi/ucsi.h |  2 +-
> > > >  2 files changed, 17 insertions(+), 13 deletions(-)
> > > >
> > > > diff --git a/drivers/usb/typec/ucsi/ucsi.c
> b/drivers/usb/typec/ucsi/ucsi.c
> > > > index 684fc4f..fabd4df 100644
> > > > --- a/drivers/usb/typec/ucsi/ucsi.c
> > > > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > > > @@ -1053,6 +1053,14 @@ static int ucsi_register_port(struct ucsi *u=
csi,
> int
> > > index)
> > > >  	con->num =3D index + 1;
> > > >  	con->ucsi =3D ucsi;
> > > >
> > > > +	cap->fwnode =3D ucsi_find_fwnode(con);
> > > > +	con->usb_role_sw =3D fwnode_usb_role_switch_get(cap->fwnode);
> > > > +	if (IS_ERR(con->usb_role_sw)) {
> > > > +		dev_err(ucsi->dev, "con%d: failed to get usb role switch\n",
> > > > +			index + 1);
> > > > +		return -EAGAIN;
> > > > +	}
> > >
> > > No, this is wrong. If there is a role switch assigned in the firmware
> > > for the port, then fwnode_usb_role_switch_get() will return
> > > -EPROBE_DEFER until the switch has been registered.
> > >
> > > So I think what you want to do is just make the failure to get the
> > > role switch fatal in this driver. Just return PTR_ERR(con->usb_role_s=
w).
> > Thanks, will change it to check -EPROBE_DEFER.
>=20
> No, you don't check that, you just return that.
Yes, I do like it.
>=20
> So you don't need that crazy polling mechanism where you queue a work
> until you get the resource. Just let the driver core handle the
> situation.
The issue is when a UCSI implementation driver probe, it call ucsi_register=
(),
But this function will not return -EPROBE_DEFER,
It just queue a work to start connector discovery.
>=20
> thanks,
>=20
> --
> heikki
