Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5A224276AC
	for <lists+linux-usb@lfdr.de>; Sat,  9 Oct 2021 04:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232276AbhJICar (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Oct 2021 22:30:47 -0400
Received: from mail-eopbgr60073.outbound.protection.outlook.com ([40.107.6.73]:60035
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232269AbhJICaq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 8 Oct 2021 22:30:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YlevwEx/ZfFTAiiEZYpUeDIB+jatn2K7aGfiy5DAjzZemsxAxI0Gn3W2XKOHfmxRj/ob49W0t0j4oezwB7T6rXLpD0C0GmNAaiq9lKwXAs1KYIbLLhh3prni3xyP8PFYY3nLtpWFoGKhH0hlpwSMMbT1EcgGFXPn87PdhPvdBceUQTF8gAruBd0iRpa3jHJNL+aQjiQYQB3EMYV8iAEwIaG5RUr6ZfKMEz4OHI30WFEM2kvi9XGoXJSY+yvYGLLcg0M4WKKUOC1raz+iU6gwIajtN6SrlyKrxdN1tQIbw4JSmW9ZSAe+Ptbn5oF0p81eoH/Jf1vWXlHFSIayViq3VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4IwdYm+gbQdB6UnJ7ATOnszQVE0TTvx3CPYbW4z9O4=;
 b=iwQKArP0jEaQ6QejMKACsq/I1fwA+vQNOR0vEsUwIlFAarLYLuWMzVMdDypGmZ50wRQdBsFdEwfwscvivcMkK1gjWwHhCthuRsDdI3jMNbTIKzolbUIaKwV/dFrnyo0dFV41i2dQNHq5fDJavyGFIyksQ28xpS9cehAcOUeRP8uNXwD59asGw+tH+v5GR5aUj2tWmMj3U44UVfHMXNC27Bcv6YzdSdAvcMSZebG8hZJ8Aifo5DdqY+doU2nG8wUaQ4WI/blzBa5Rfl0dkQOY2avq+U26yK2/JSNyPMF8bsARQvFyg/56Y7Z/eS9c/gXgbxuo4OuRC23Aojm6jN126A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h4IwdYm+gbQdB6UnJ7ATOnszQVE0TTvx3CPYbW4z9O4=;
 b=Ai7SHU4U6Iyjagm8nZQgq/FBOQOGZ9cCyMT6HL00sKyIR75xwvk5Kob/fX7CDqB3ZXieRmLYCubzreQqTfY9qJUdy2m1BuTD7wUIkyx7UGN/2jmNAgepVnML/gCyL1zdfS8bZXNKLMROe5rhvAMswXUFBq5gGht99X7P9HP+5cw=
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com (2603:10a6:10:11b::14)
 by DBBPR04MB6153.eurprd04.prod.outlook.com (2603:10a6:10:d2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Sat, 9 Oct
 2021 02:28:49 +0000
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::2102:b9f6:1221:edef]) by DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::2102:b9f6:1221:edef%4]) with mapi id 15.20.4587.024; Sat, 9 Oct 2021
 02:28:49 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     Jun Li <jun.li@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH v2] usb: typec: tcpm: fix issue of multiple tcpm_set_state
Thread-Topic: [PATCH v2] usb: typec: tcpm: fix issue of multiple
 tcpm_set_state
Thread-Index: AQHXmzljyOAmdD7k3EKMdpCjq+0g06uh4NcQgChS3lA=
Date:   Sat, 9 Oct 2021 02:28:48 +0000
Message-ID: <DB8PR04MB68432A2A70EE38D6962528CC8CB39@DB8PR04MB6843.eurprd04.prod.outlook.com>
References: <20210827114809.1577720-1-xu.yang_2@nxp.com>
 <DB8PR04MB68431AEB789C4AEC35DC8E458CD99@DB8PR04MB6843.eurprd04.prod.outlook.com>
In-Reply-To: <DB8PR04MB68431AEB789C4AEC35DC8E458CD99@DB8PR04MB6843.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 91566939-3ae2-445f-1611-08d98acc86dc
x-ms-traffictypediagnostic: DBBPR04MB6153:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBBPR04MB61536405AB93A6D2289FD4728CB39@DBBPR04MB6153.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yi2KmkVBaInNe4MstG/FOpPH2Idkw60nGazfGi1NSbkKFohhvqiq2YfCDexNzuVKtnzvuWk6mqbQeXaAG5+ehfmbunidTr5B3FqT8k/5qQ0G+YGObfFTci0jY1kLIB59ofnryJb3NC5UpFrZAACRsOzTBPLvXVwa/IMuV0FHNjsp2Esf+vO4da1O72+5KVQ7D0Y1DoKbSDDiqyMXVVXIKmNBn1vGoDA62PbY5bsPGZkOYhVAN0dgC+7Nf8LddYsAdtnbwZpSXRB9CSpMELDcvB2pgfIjh2wzP/ykV85uyfYFV1r4a1yjcTaKeizVVwgS0G3Ld7AmFZUyHGnJGGkkZ8BJv8+0LrX9YrUh8mv1sbsJILRJrwSW1sAE6sKfdtCkilvS24Op6Z9lDs+Wq7Lsc2Lb6fgdEP7j2A2lmPoEeqmi4Km+Y+o46kbxJVcwO4pprdCKHVChf4tsap+hXeWrpt3wRalT5OheMuP/ROYhvBfRNU2d2mR4H+GFfD9uok0nCmQPyxoJwGcVA5IyRENvW4zmmQ6Q9dKBy6iVgCHjJhANRvnIr8eZwCUoKejpI72zvQAWNQJuyKa0YWvmH6Xsz9oeev/sx6y88FG+ohf4LAdhuwpK7z+GR0IYdVBYuY6aZaEGqypjXmwpsSSU4CU72FJ2k9aQLgw9fGVAerdSRxnqxu4HIgrkwg7gaK2JJ7BrZWWXmJPCiWccZCAdgkxvwg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6843.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(6506007)(5660300002)(508600001)(8936002)(66476007)(122000001)(52536014)(64756008)(86362001)(66446008)(54906003)(53546011)(83380400001)(76116006)(33656002)(110136005)(7696005)(38100700002)(2906002)(66556008)(55016002)(4326008)(186003)(316002)(9686003)(26005)(8676002)(38070700005)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?p2H8nhDh92dKPlxY4PEH/vVz1GjVkd1VXJ0I+mDXfOYpADJKaj62wBTpUsb2?=
 =?us-ascii?Q?tBPkTvalKv0h2TM6s1I96fQeQ0bbgFZR02Tf1WacbFzwdyfoPEgKVhSNVJCW?=
 =?us-ascii?Q?Zf9HRJi32fkTcWaQFrfAsL0yc2RUh2S1VpM+sYzdZP8f8+k8QsojFFAljysd?=
 =?us-ascii?Q?lrY71JtYjDn3ME7fMD+scYUnMe9xVNzy/GgEm+rX1tB0XjAyfz4gi3T0WQg+?=
 =?us-ascii?Q?M/6Id5nle9xgPvP3XlSQ8eNGLjR5Yk4EF5kk/By4iyAU49RhO5ptPXePQJC1?=
 =?us-ascii?Q?nxGGkeDNRb/tg3y++BTwFBMGIjBVXp7uWQojXtx5YJZc5/jZD+cjTcLI/Iqh?=
 =?us-ascii?Q?JLfyYT14HzD3JVCdBi/sxImG7j9NwUlT5z8yB2n6CBUUdNg2CPpxIR05z/yl?=
 =?us-ascii?Q?vkp1S49P5NCTqjGjrtX3H08eQzw17/sp1Tsd61Ef3vYNOBEql/333IM4zxl4?=
 =?us-ascii?Q?bKacTdJoGczesI8nXDa5SFK/iJDiiRzovxvKODHgDTkdGykJGSWJNHqrgN7E?=
 =?us-ascii?Q?gtE2e+lpy/7niosTmY5hPJL5NkmsgSNF+potXoWHOk58R+pohGK4S/lQqzhq?=
 =?us-ascii?Q?Rpyul3nNcdVgI9dk2rIxZjx/bywin1AD/qhlPm55f9FJAA9qJ80AIjJWP77a?=
 =?us-ascii?Q?aPmrViTJfzojK8nsf4zYRDL6q+AVjua/wfsWP4kBOsKg/FfZxwltEQP1pFRC?=
 =?us-ascii?Q?1WUtGEvbmY4qokNc43eOVdcHUFo7jVw5drBB9MAzf7j9Nr1hFl5b14kc1W6F?=
 =?us-ascii?Q?nOofPAroqFZCibQNNk+jSjspdReBxoXD4MFcJw6eebDhdGeUZCOQdTnlYKnz?=
 =?us-ascii?Q?H+VXdvwzB/i+VJoit1LMZJhpMs2UGRJz9DLdQTtUnxGWg6kx5A20MezBts09?=
 =?us-ascii?Q?QABndAH9RDB/QIqjukAkaYeSQbamO9JtIubzYdN86GwoNQqLMdoutAQUFM9g?=
 =?us-ascii?Q?QGnKbE846WWAUAgzvoFujGd51OxcgxljJCLW8E70HHJQhsOhrQLhaEP5ualt?=
 =?us-ascii?Q?XYMmPNGIXzCxrYXpU/rV7cRH1p3w6du3RY0JB2keEiJQNCHDAyWspKDKRT3t?=
 =?us-ascii?Q?l3NqXxxCFqv16Q241wlKmvtbDBW+1nSUmJ37eySyetrkEE00K41kKhnXL4yV?=
 =?us-ascii?Q?UchDsHIRCl6gui68HGnAAa+HEhWzQX2uJMMOfhTsnSUQKruxYwjTQCM/phMQ?=
 =?us-ascii?Q?DpD+P0wSRg81qOkI/3kfMcYzL2mvb7+GiRfQyv558iR9I+567Nv/AyZBDNAp?=
 =?us-ascii?Q?rUvZZybIt00jahboY8qrUZWgpIygA9IYKO8JkbOEIQu49KFEMauLkFJ0GxoX?=
 =?us-ascii?Q?HIIkU7JpA7bMGPNOqKkpL8nT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6843.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91566939-3ae2-445f-1611-08d98acc86dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2021 02:28:48.8803
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VaqczYGarcz/Mo0HRzpY81MSZlgvIjMaMe53AYw8tz94VD/IZqxkNz0qqBRVD8ZysAoSkt/6I6EOEZKEmghWCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6153
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Xu Yang
> Sent: Monday, September 13, 2021 6:42 PM
> To: linux@roeck-us.net
> Cc: Jun Li <jun.li@nxp.com>; heikki.krogerus@linux.intel.com;
> gregkh@linuxfoundation.org; linux-usb@vger.kernel.org; dl-linux-imx <linu=
x-
> imx@nxp.com>
> Subject: RE: [PATCH v2] usb: typec: tcpm: fix issue of multiple
> tcpm_set_state
>=20
>=20
> > -----Original Message-----
> > From: Xu Yang <xu.yang_2@nxp.com>
> > Sent: Friday, August 27, 2021 7:48 PM
> > To: linux@roeck-us.net
> > Cc: Jun Li <jun.li@nxp.com>; heikki.krogerus@linux.intel.com;
> > gregkh@linuxfoundation.org; linux-usb@vger.kernel.org; dl-linux-imx
> > <linux- imx@nxp.com>
> > Subject: [PATCH v2] usb: typec: tcpm: fix issue of multiple
> > tcpm_set_state
> >
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
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c
> > b/drivers/usb/typec/tcpm/tcpm.c index 049f4c61ee82..a913bc620e88
> > 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -371,7 +371,7 @@ struct tcpm_port {
> >  	struct kthread_work enable_frs;
> >  	struct hrtimer send_discover_timer;
> >  	struct kthread_work send_discover_work;
> > -	bool state_machine_running;
> > +	bool state_machine_pending_or_running;
> >  	bool vdm_sm_running;
> >
> >  	struct completion tx_complete;
> > @@ -1192,6 +1192,7 @@ static void mod_tcpm_delayed_work(struct
> > tcpm_port *port, unsigned int delay_ms)
> >  	} else {
> >  		hrtimer_cancel(&port->state_machine_timer);
> >  		kthread_queue_work(port->wq, &port->state_machine);
> > +		port->state_machine_pending_or_running =3D true;
> >  	}
> >  }
> >
> > @@ -1250,7 +1251,7 @@ static void tcpm_set_state(struct tcpm_port
> > *port, enum tcpm_state state,
> >  		 * tcpm_state_machine_work() will continue running the
> state
> >  		 * machine.
> >  		 */
> > -		if (!port->state_machine_running)
> > +		if (!port->state_machine_pending_or_running)
> >  			mod_tcpm_delayed_work(port, 0);
> >  	}
> >  }
> > @@ -4810,13 +4811,15 @@ static void tcpm_state_machine_work(struct
> > kthread_work *work)
> >  	enum tcpm_state prev_state;
> >
> >  	mutex_lock(&port->lock);
> > -	port->state_machine_running =3D true;
> >
> >  	if (port->queued_message && tcpm_send_queued_message(port))
> >  		goto done;
> >
> >  	/* If we were queued due to a delayed state change, update it now
> */
> >  	if (port->delayed_state) {
> > +		if (ktime_before(ktime_get(), port->delayed_runtime))
> > +			goto done;
> > +
> >  		tcpm_log(port, "state change %s -> %s [delayed %ld ms]",
> >  			 tcpm_states[port->state],
> >  			 tcpm_states[port->delayed_state], port->delay_ms);
> @@ -4837,7
> > +4840,7 @@ static void tcpm_state_machine_work(struct kthread_work
> > *work)
> >  	} while (port->state !=3D prev_state && !port->delayed_state);
> >
> >  done:
> > -	port->state_machine_running =3D false;
> > +	port->state_machine_pending_or_running =3D false;
> >  	mutex_unlock(&port->lock);
> >  }
> >
> > @@ -6300,6 +6303,7 @@ static enum hrtimer_restart
> > state_machine_timer_handler(struct hrtimer *timer)
> >  	struct tcpm_port *port =3D container_of(timer, struct tcpm_port,
> > state_machine_timer);
> >
> >  	kthread_queue_work(port->wq, &port->state_machine);
> > +	port->state_machine_pending_or_running =3D true;
> >  	return HRTIMER_NORESTART;
> >  }
> >
> > --
> > 2.25.1
>=20
> A gentle ping.
>=20
> Xu Yang

A gentle ping.
Xu Yang
