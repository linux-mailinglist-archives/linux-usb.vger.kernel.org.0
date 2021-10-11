Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 231CF428983
	for <lists+linux-usb@lfdr.de>; Mon, 11 Oct 2021 11:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235392AbhJKJT5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Oct 2021 05:19:57 -0400
Received: from mail-am6eur05on2062.outbound.protection.outlook.com ([40.107.22.62]:16000
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234280AbhJKJT4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 11 Oct 2021 05:19:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajb0km21VGHIxoAMpzja7p7Z8I7efk6fX2toigiPKOVYSMevCOosnxRw+iadtf9Ax+vfB6LBSEUrv5Ey+fGUqLzQSglLjbYBcDwep5+VGrIZ24Zt6e968HVJPDvBYAQ+QUe7LCuY87KeR+oq5gADDqON9S+cl93UUZczprq93pIG2errl73KOCKTvhwHWQbcYTOoIhDE5/gZvqQJ6FPd9+lneV/q3mL/5HaAKFp168mOhabVVwisBmJcOOt4QUawCguChRf3t6vF1k8BzsQbqcayspNOVvjGkWDY5nWJHYdPM51XC4fraz/jwqN5FB22FSAQ8598i9E7fw1KBaNpnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDAuTwg4GhKISsmhwTF7rYs0nKxmfIKqCQHwEKyyE1o=;
 b=OKB4eJzAU+eKhwv/kKb2PEsVxglWnQQe2poFiIk093iP6ynP2GfWI8FdZKbVqcopCHT3Q+ROQdDmbOg3gRnCcWSz7itbKlPkSJlhG4kZUDMXI0KOoqJv93uzW3oB0uI+gx9teaCETf3xmeadE1VHjWMAWnRiz9kGqxU5G1toL4HAyL944XgS122yJueuoydRI20Obgmo4HBv15EVy4XVUAAjyBC/tITyB44QEWko0sNHd1j7qWY95Tp4mJ4qI7zyryWe7urMudxjB/yJ72+qa+lLxS/vLCQe3Xqbym8Svy1ZC7RO+zfNTsU3CXMSc12XEZ8rGqK5ZWZe1TxDZenCnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDAuTwg4GhKISsmhwTF7rYs0nKxmfIKqCQHwEKyyE1o=;
 b=qtWVdXzstnqQXQJ8qYOIaorEuDHz2jZgO41GU66SI9K+E0xDm7FRCwPXKJ9nDyd3kTfsNYCk2HBpnlgRt5/Gc58eGKhnZBCfXBcVnhQJpHJn4Ax7MWEaQ9w5jpMA+tIAksxFuSDLrB0SbX1i7+1sjwHerqeqvYnleO0OILwTqDU=
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com (2603:10a6:10:11b::14)
 by DB8PR04MB6475.eurprd04.prod.outlook.com (2603:10a6:10:103::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Mon, 11 Oct
 2021 09:17:54 +0000
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::2102:b9f6:1221:edef]) by DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::2102:b9f6:1221:edef%4]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 09:17:54 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>
CC:     Jun Li <jun.li@nxp.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [EXT] Re: [PATCH v2] usb: typec: tcpm: fix issue of multiple
 tcpm_set_state
Thread-Topic: [EXT] Re: [PATCH v2] usb: typec: tcpm: fix issue of multiple
 tcpm_set_state
Thread-Index: AQHXmzljyOAmdD7k3EKMdpCjq+0g06vNnMeAgAAgggA=
Date:   Mon, 11 Oct 2021 09:17:54 +0000
Message-ID: <DB8PR04MB68432981F23173E7894587D58CB59@DB8PR04MB6843.eurprd04.prod.outlook.com>
References: <20210827114809.1577720-1-xu.yang_2@nxp.com>
 <YWPaPfzlnWdEsk21@kuha.fi.intel.com>
In-Reply-To: <YWPaPfzlnWdEsk21@kuha.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 62f159af-e9c1-4dc6-0fad-08d98c9801e4
x-ms-traffictypediagnostic: DB8PR04MB6475:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB64750C92B781F8567F3667888CB59@DB8PR04MB6475.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vOG12Gpyh5Gi+C5Aqu9P7zybRZbrWMc3rawxWOgUhQ4xtiAoO7Iu33FIgVaQ8muaP+xgNtdcJYlxYtFtHMKKymjReEqVz81TZw3ui2Xxl+W2IV8jQo1qXspnl54svM90Hb194DmWuMZeGy6iM+ns60De4YT9w16AAi1oiu8PL9mwoQbcROv6pr2d9rw0eo5lEnuIMZ0Cwdq6ye//P5d4obJw7+jbtFD66M6s67oEc3z3PyKW9SOoi6ruHLav8Fe2j0ByLk6pP+SARbJEQQS9UYTob3byhxod6kelY0q+5xR+AbtiE/jM82oW17GiIeAymuXJmxxpt02y25FWWlHDmswDGL2trIvbel7L2iOL2Ekqmeytrx4xTzLbxNsnt+mT0Ln3j7WstrUksD2vUVyPHqY1FdfkikJqtYoB8ZsliLm9IEF8N6V8eUVp/v49x16s/zIneSa+evanuxjyC5hHrrGxQwS3bGStj1skrMFLH22ZgHgDTOcW49R+xIcdfiWGUnxNdvotWcRxMMT9nCyBqkrbyUOe4XE8YlSiI7Q5KaC1l6Y6aAdU/u5LgBRALDIiVI7U1WHjSSzsG4E3eeUVXPxtvJGhAlbIsDwM4bDC3kQZtx2XJnIWYEQaEtNdjJAmEGO11rOJ/Xd2bU2sdRkAp7Xo46jlvE2lhzBMzdkrW9QqEI0jjG3g0WGwCCtKCzTUkTQpqS6Eoz43zq4gcOI3uQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6843.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(55016002)(122000001)(5660300002)(7696005)(76116006)(71200400001)(508600001)(38070700005)(33656002)(66446008)(64756008)(66946007)(86362001)(53546011)(66556008)(26005)(6506007)(316002)(9686003)(8676002)(8936002)(38100700002)(54906003)(110136005)(83380400001)(186003)(4326008)(66476007)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FgZ33ER9mOi1N86+6aBhwi02PeUnYQkCuPFGHzCyQ0s3SgRZBEmvaOvwxSwp?=
 =?us-ascii?Q?WaYIvpqpB0cYTD+Tap9JUpGEnz4sdqO5KArxDQgHpzpIfNbL0PNLLye2cjE9?=
 =?us-ascii?Q?1tSwYYALTF2E56FW1ljlCs7DgvUFlH7KJVHdRqhHngXUSoSV7ovhoDyVZyIl?=
 =?us-ascii?Q?xWwfZlOfz6EDWTrE5X5iUh5LJ21al6hGSHXDzQhOgNqyATsRJWXqqnwhu/YB?=
 =?us-ascii?Q?yc9AT99vyR7aBV89PBAf+KsooAQA95VX26Ym0LRC4xWxUu9EOAaDHyBLf5vx?=
 =?us-ascii?Q?2b/4wyLAa7iXLW9psCBTxuL4RvDTUwb/GDf5AN5p5M03DccA9RBPk1gr7Ld/?=
 =?us-ascii?Q?IXngjMDmduW+2LfSzwna178YQi/0UPkcZWH/qsdP5lQ0n73jLV1eHBuqtUm2?=
 =?us-ascii?Q?a63uLFA2GPWPCzh0nPxOq1plwYgh2YySpZwnMlk67ia/daRegO/kUf6yqq56?=
 =?us-ascii?Q?rVXIKD50DY6nPqe7PH0uKQ6AjZf1TEtDRvlKyJTX4yGDOftJq8WSRidfXUHQ?=
 =?us-ascii?Q?JUtcXAnsQQckdIEUcIdt4LLRPWpxvCM1Lz6PL635OqqmwS2KZAM2flPdRsVT?=
 =?us-ascii?Q?Pr04/4ZE5Jqs1uqBJ/y4l1B+zcrBjv1YLtkL3vNHaM3mYiJecqFBwD7XPZ1m?=
 =?us-ascii?Q?jtT/dSeBymcxgxPPTuhvB+CTekxF2J26iuAPOPcdSoFW8Y8nYebI9qsAntek?=
 =?us-ascii?Q?6oyH8jDoydUMQAu9f1zQkkQs6IVqLS3b3v0dTReUhzbqgHdmc+cTVVWV5WxU?=
 =?us-ascii?Q?H3+QQwXEqWApiwFlApS5+wFe2potnjxdkgrBoHDgPA+BlNkjrEGUB+9JAfHv?=
 =?us-ascii?Q?3N36juTx326F0zkShMeX2/RAw/AILTU9Dt0Cn2WHJrR5LmR+AxX16rgZhyCr?=
 =?us-ascii?Q?VsS2vepgOKjX8Y/5WwMKYMhrQGQTPoJETe3eXYFT2i+qBXDObtSdpI/ak5s2?=
 =?us-ascii?Q?QXijFc2s0PWzbcuwkoNY8qrNW7vm7cR6av4fYFb2kymAxJeIVlwv1Mp4j3Qk?=
 =?us-ascii?Q?iP19jRARiyjyWSr3ZK56ozo49YVoc6k/7kITtNgvjybWmCCIfHxX2QhgJZm+?=
 =?us-ascii?Q?tK1u3ZpV0/qVbujBdN34+ZO+JEIYqgVLifDCuh61bqysNU54tBaDRXHIW8jD?=
 =?us-ascii?Q?aSKN2w1/29IBSD8Jfub3BBHufxVgQrfIDVpv58Zdv2rYFtMdvZJmjFTTl2A3?=
 =?us-ascii?Q?S9xq3cp/VL2/mkxf768I7f74PPDgp7oXF3Z4iuW1IBMdi0uKzGN/6PeL9VUO?=
 =?us-ascii?Q?FRps7hnPp2dUWBTJ/pLntIuORm/Vq0L0+q+e1OvgEvSpzm4g9cjaW8DbRYxD?=
 =?us-ascii?Q?tdzLlPk7ReORAORu0UDaIRHH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6843.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f159af-e9c1-4dc6-0fad-08d98c9801e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2021 09:17:54.2614
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qs8yhI6yL5ItZsgSdND6a7sk6JfOsDZ2cSX+tbXoja9ew/83LLf+86n9mOxOPUTuu358XOwUd15e+B1loATPjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6475
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi heikki,

> -----Original Message-----
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Sent: Monday, October 11, 2021 2:31 PM
> To: Xu Yang <xu.yang_2@nxp.com>; linux@roeck-us.net
> Cc: Jun Li <jun.li@nxp.com>; gregkh@linuxfoundation.org; linux-
> usb@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>
> Subject: [EXT] Re: [PATCH v2] usb: typec: tcpm: fix issue of multiple
> tcpm_set_state
>=20
> Caution: EXT Email
>=20
> Guenter, can you check this?
>=20
> On Fri, Aug 27, 2021 at 07:48:09PM +0800, Xu Yang wrote:
> > There are potential problems when states are set as following:
> >
> >     tcpm_set_state(A, 0)
> >     tcpm_set_state(B, X)
> >
> > As long as the state A is set and the state_machine work is queued
> > successfully, state_machine work will be scheduled soon after. Before
> > running into tcpm_state_machine_work(), there is a chance to set state
> > B again. If it does occur:
> >
> > either (X =3D 0)
> >     port->state =3D B and state_machine work is queued again, then work
> >     will be executed twice.
> > or (X !=3D 0)
> >     port->state =3D A and port->delayed_state =3D B, then work will be
> >     executed once but timer is still running.
> >
> > For this situation, tcpm should only handle the most recent state
> > change as if only one state is set just now. Therefore, if the
> > state_machine work has already been queued, it can't be queued again
> > before running into tcpm_state_machine_work().
> >
> > The state_machine_running flag already prevents from queuing the work,
> > so we can make it contain the pending stage (after work be queued and
> > before running into tcpm_state_machine_work). The
> > state_machine_pending_or_running flag can be used to indicate that a
> > state can be handled without queuing the work again.
> >
> > Because the state_machine work has been queued for state A, there is
> > no way to cancel as it may be already dequeued later, and then will
> > run into
> > tcpm_state_machine_work() certainly. To handle the delayed state B,
> > such an abnormal work should be skiped. If port->delayed_state !=3D
> > INVALID_STATE and timer is still running, it's time to skip.
> >
> > Fixes: 4b4e02c83167 ("typec: tcpm: Move out of staging")
> > cc: <stable@vger.kernel.org>
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>=20
> What changed since v1?
>=20
> thanks,

In patch v1, I committed two patches to fix two problems. However, the two=
=20
problems are resulted by the same reason. And I try to address the issues=20
after it occurs.

In patch v2, according to Guenter's advice, I try to avoid such problems=20
occurring from the source. So I set a state_machine_pending_or_running flag=
=20
to indicate that a state can be handled without queuing the work again.=20
Meanwhile, one patch is enough to address the problems.

Xu Yang

>=20
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c
> > b/drivers/usb/typec/tcpm/tcpm.c index 049f4c61ee82..a913bc620e88
> > 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -371,7 +371,7 @@ struct tcpm_port {
> >       struct kthread_work enable_frs;
> >       struct hrtimer send_discover_timer;
> >       struct kthread_work send_discover_work;
> > -     bool state_machine_running;
> > +     bool state_machine_pending_or_running;
> >       bool vdm_sm_running;
> >
> >       struct completion tx_complete;
> > @@ -1192,6 +1192,7 @@ static void mod_tcpm_delayed_work(struct
> tcpm_port *port, unsigned int delay_ms)
> >       } else {
> >               hrtimer_cancel(&port->state_machine_timer);
> >               kthread_queue_work(port->wq, &port->state_machine);
> > +             port->state_machine_pending_or_running =3D true;
> >       }
> >  }
> >
> > @@ -1250,7 +1251,7 @@ static void tcpm_set_state(struct tcpm_port
> *port, enum tcpm_state state,
> >                * tcpm_state_machine_work() will continue running the st=
ate
> >                * machine.
> >                */
> > -             if (!port->state_machine_running)
> > +             if (!port->state_machine_pending_or_running)
> >                       mod_tcpm_delayed_work(port, 0);
> >       }
> >  }
> > @@ -4810,13 +4811,15 @@ static void tcpm_state_machine_work(struct
> kthread_work *work)
> >       enum tcpm_state prev_state;
> >
> >       mutex_lock(&port->lock);
> > -     port->state_machine_running =3D true;
> >
> >       if (port->queued_message && tcpm_send_queued_message(port))
> >               goto done;
> >
> >       /* If we were queued due to a delayed state change, update it now=
 */
> >       if (port->delayed_state) {
> > +             if (ktime_before(ktime_get(), port->delayed_runtime))
> > +                     goto done;
> > +
> >               tcpm_log(port, "state change %s -> %s [delayed %ld ms]",
> >                        tcpm_states[port->state],
> >                        tcpm_states[port->delayed_state],
> > port->delay_ms); @@ -4837,7 +4840,7 @@ static void
> tcpm_state_machine_work(struct kthread_work *work)
> >       } while (port->state !=3D prev_state && !port->delayed_state);
> >
> >  done:
> > -     port->state_machine_running =3D false;
> > +     port->state_machine_pending_or_running =3D false;
> >       mutex_unlock(&port->lock);
> >  }
> >
> > @@ -6300,6 +6303,7 @@ static enum hrtimer_restart
> state_machine_timer_handler(struct hrtimer *timer)
> >       struct tcpm_port *port =3D container_of(timer, struct tcpm_port,
> > state_machine_timer);
> >
> >       kthread_queue_work(port->wq, &port->state_machine);
> > +     port->state_machine_pending_or_running =3D true;
> >       return HRTIMER_NORESTART;
> >  }
> >
> > --
> > 2.25.1
>=20
> --
> heikki
