Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECAA5408940
	for <lists+linux-usb@lfdr.de>; Mon, 13 Sep 2021 12:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239010AbhIMKnd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Sep 2021 06:43:33 -0400
Received: from mail-am6eur05on2042.outbound.protection.outlook.com ([40.107.22.42]:38913
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238823AbhIMKnc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 13 Sep 2021 06:43:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PCr92QMyDkTeA2weHf5ifaolhO17ccmg2xTpiFJLbFEckhb27uQQn1OgfTpSma+rqE64VcSO/4TUD8/DqQlIcI3xoq/5yzugvzD7e3A99gNePaLOrxdWSFHeeFRK6CKdI++kEgFQw9D0hlXBGkNw9ksHXmH+uLGUKpVAXUgTQSGv3AMWa9BQIroh3Ku/eQdlN7lJq1v+KYpANdYcPHWTBAwO3kZHnU43npvS+fUPyd1qsKCOWD1b2L78WUvwzeklkBWfC5a9E9yEQhxxN9lwgRjBx3KBb1SBrQQOiN9AjVhsWJ6dbo/ZJQFvJe8DVwai/128AxhLcrPuXSBzkJcYWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=4TxFOQPr4ERE9o6+uqDk0B2+WkkPaJMwpAHkTSRazcM=;
 b=HmAOvcLqHYquxRHA4apN3NIZnyCY5bFSAKqji49aQnV1XdoYxPhESfbJyrvf4Lapg2FLAPGMIcIRTCvHNfM1CzOfFABcxDrye6gLnmkbmSHnGwk8pTCyvoNDDfknzscQk0dwBjikTHQNbgQuqGjfPRG/cXCYVFwFTEh6Nz2ExtgqlmhGb8n8EmvQQ+IXXxb8oQ7bWrYEiopyPzfPHkHwIIBHwy4+eDFTosNDfDVVEkLwOXnaStmmOfbnfayLYEDVr2t9vnpSOfTAtyQTxvmwm2KpXncUW0yxHGktBWkGGJolRvy9RS7xIcXfP76dlYYIgMCWcj8yW33BpzsbkcvsIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4TxFOQPr4ERE9o6+uqDk0B2+WkkPaJMwpAHkTSRazcM=;
 b=EON2JE6ke9F5D6HqPquybsEOfTewH4gK3NzloPNMmWtGpwEZRViyp1neRC/h+HS3u27LqzpN7bTWAK4xkMqWMMKn8VRe2K0+8/7rEqnwbDamUiifqKWfFAM33VhGbJQFh041wkKDTVEQzPBfmJ6UGdb7PlNIKFSWEMMEEUjaOVw=
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com (2603:10a6:10:11b::14)
 by DB8PR04MB6554.eurprd04.prod.outlook.com (2603:10a6:10:10a::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Mon, 13 Sep
 2021 10:42:14 +0000
Received: from DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::418c:d3c5:fe04:dfb2]) by DB8PR04MB6843.eurprd04.prod.outlook.com
 ([fe80::418c:d3c5:fe04:dfb2%8]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 10:42:14 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>
CC:     Jun Li <jun.li@nxp.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH v2] usb: typec: tcpm: fix issue of multiple tcpm_set_state
Thread-Topic: [PATCH v2] usb: typec: tcpm: fix issue of multiple
 tcpm_set_state
Thread-Index: AQHXmzljyOAmdD7k3EKMdpCjq+0g06uh4NcQ
Date:   Mon, 13 Sep 2021 10:42:14 +0000
Message-ID: <DB8PR04MB68431AEB789C4AEC35DC8E458CD99@DB8PR04MB6843.eurprd04.prod.outlook.com>
References: <20210827114809.1577720-1-xu.yang_2@nxp.com>
In-Reply-To: <20210827114809.1577720-1-xu.yang_2@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60c18723-d88b-483b-ddf0-08d976a3264d
x-ms-traffictypediagnostic: DB8PR04MB6554:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB6554B45C61DB405314B157548CD99@DB8PR04MB6554.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2V7fjxKLb4XBOeyQN7gECxHaBAcPels/wRRdPx9V5Z8BZstjvyGAzks1OZPf30TafcLjWZQbPv3C+UIAor9MZFuNDxw9HaFZf/TMwl7LwJyvMlP9lLPBeHWeLrlBHuJYf8RudYiZaePgqBP4uecRyq3BgTe7+z+gnIpOCKTLHPOe3s48qEErFXGOFzi2Yg7NTgUE6lxM1S53EXcoNy6T6NQbBv2EkpCT6YjLc8910ixFmhgu85lkw7BFtAdjum9qS179Q14Bxot6ZRuB6CvSERKUE4Qb2CRtmpOD3DDUCYkh+C5kH3b3tR6krPD9Wx4UjLDMPz/TExtNYowHZN04S9h/yzOSK2NViw3RJIpGadQjWs0+Zqbn0DSw4OqyvHoqfkb7Gp8SDd3+Du9lURT0XhHUxxhudmMOLa8S1nRhH7+P4OM9Ze8z6OFLpkXfKjagEBUju0b7kbhn6CP4MF2WTfPIpmkDm/7Tlny9u6OiJ+/rg7JIPlKtA2IqsIClcfnX5MlpBqHv0eSwM6nO+DuFyMRIFPmcCmqAe4oJ09bvgvsr/fsxKSXTKpzI2JruImJ0JLIStYk4PiokX+hkFXshZtHqtPd9O7i2XWbl1Fo84J+89Uw6bQGS+2o37/O1J6dKwpeKsqYnrOdbftfD9ByzR5WVlVzFH834NXxRPUVChiBr/6mg0IokXhPdXH6kXVmwMezE7DphN6ZZbmtBVg7Jsw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6843.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(83380400001)(55016002)(9686003)(5660300002)(6916009)(122000001)(54906003)(4326008)(316002)(38070700005)(478600001)(6506007)(38100700002)(53546011)(66476007)(66946007)(26005)(66556008)(64756008)(66446008)(186003)(8676002)(8936002)(86362001)(52536014)(33656002)(7696005)(71200400001)(76116006)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QCVNfw4ga5W9PwwHxoyCQqBfXrZZaZdS0ZRdAP89XCx9qcTkUAKYO6jq+/a4?=
 =?us-ascii?Q?sA68Cf7mIIdU8xxAws7R59oQ7vQppHLuXtEuk3p5rBn94QzynLbMcPYoPu9g?=
 =?us-ascii?Q?CvJJ3ijdReuObGcE83OuLFHIlO3x16NWpZZplOA/J+8Z3Nu/unvmMpMprlDV?=
 =?us-ascii?Q?/3UyXY6PPhsocrSllsI7ro7EL9HYCnZj06s+sWyqxDWZQTsyWuYa0q0IOpwT?=
 =?us-ascii?Q?Vg1rvOyTiLtwvmtsBG/WSmASGeRi2BPgsO4d8eMiwU69gQvUeCWJlQMhKzeX?=
 =?us-ascii?Q?7acMGbtLoUfN6JgRyQ8XBEylmLguULBI9YJBamCJf/oYQuyIRPov+nh0WCmH?=
 =?us-ascii?Q?g291ylaYOpd5pY57UZW8AHYYkyqUK6aZ20Bn4iQ8nf3wSLyFzLe34jrWIEQH?=
 =?us-ascii?Q?9SfEPj0btI4f0FlkXhWKIoKjAfyage8JcGbu/FbUSRGb3u7BZYKv6bvW69H4?=
 =?us-ascii?Q?s1lZEq86vgyu1vs8E70/LC8itEC1BTqQg17J2eaPg9rxnBrnL4oLq9QyAZ5t?=
 =?us-ascii?Q?dq7SKpf3bLS4p5U9lBZGjsw9unm9qXfKqkEj3DAMRglxPYpbBZsVTkvoBsLY?=
 =?us-ascii?Q?9ZSBUsSAEDERz7JfDJ16Obj40qSIWlvBiwQuJr/W5Xw1USjPDmJe02RgmRoF?=
 =?us-ascii?Q?0cC6dgv2BeuwycxUoOWnIH3pXzSiWSBssKz9DlhpZWtqsSmwXioRfh2FxCnT?=
 =?us-ascii?Q?uPu2DI+edwpRoUOsWQcn+V7UlmSN/Mo9r0+ih/8H/AEnX4ahcsT9cwXP0St6?=
 =?us-ascii?Q?qYEAfnfRB+VtQ1/E6Nt6lKijyOAG02Y7nU6CXT+2AZx5wu5I68SiWnrYgZXH?=
 =?us-ascii?Q?Z7HdAFijNhpL6GOqAz1yt/AAXVj6gaiceOxIIurlETRS7UBGt0mdIaudMFmJ?=
 =?us-ascii?Q?dr4kOa3db/KIFjye2WGmPsaq5o+1GeSNs7cLe7lhBaZ2BW+4554kEgcw1f3J?=
 =?us-ascii?Q?4FkF6QsC/H45aGDTyjImLWbwONPepOoD07nXKdLb0EjQS+ubOJS0NkxzMXXu?=
 =?us-ascii?Q?G8XRzby4QhCukAkLsIiK5x1cJ0XzFee2FKmnPHjmUMT2FmPLbG/FVaRqOE9S?=
 =?us-ascii?Q?TTasM57z0FbCjDeqGq0D7ywkjN/Lu99JgJZsvXAtJURZJkyRAxWScItAZfZV?=
 =?us-ascii?Q?q93CNE3p8SurgAMODlOV1OL/klzqJadZacuM3A1YRU0Ce+Gayu1+yPO6cjbQ?=
 =?us-ascii?Q?BaoeNZpiKJxbAyb39q2xrIkRaO6pv6jR4igSbZVt56p7vtHNRzJvB/ieyXQQ?=
 =?us-ascii?Q?q8JZWB4enjb4LqMpDsvSscPNjtGvjm9gQZjI5SxmzT0b3UNwXJk9QZO8zLhb?=
 =?us-ascii?Q?tn8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6843.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60c18723-d88b-483b-ddf0-08d976a3264d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2021 10:42:14.2506
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ci3rdzgrGSPQRtF+dSKJTBN7uB3Xa3IJmULF3ms9WHJVHKkxwfa20w11mKXS/nNxMhH2pfbjf+QcSuXzGHMZZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6554
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


> -----Original Message-----
> From: Xu Yang <xu.yang_2@nxp.com>
> Sent: Friday, August 27, 2021 7:48 PM
> To: linux@roeck-us.net
> Cc: Jun Li <jun.li@nxp.com>; heikki.krogerus@linux.intel.com;
> gregkh@linuxfoundation.org; linux-usb@vger.kernel.org; dl-linux-imx <linu=
x-
> imx@nxp.com>
> Subject: [PATCH v2] usb: typec: tcpm: fix issue of multiple tcpm_set_stat=
e
>=20
> There are potential problems when states are set as following:
>=20
>     tcpm_set_state(A, 0)
>     tcpm_set_state(B, X)
>=20
> As long as the state A is set and the state_machine work is queued
> successfully, state_machine work will be scheduled soon after. Before
> running into tcpm_state_machine_work(), there is a chance to set state B
> again. If it does occur:
>=20
> either (X =3D 0)
>     port->state =3D B and state_machine work is queued again, then work
>     will be executed twice.
> or (X !=3D 0)
>     port->state =3D A and port->delayed_state =3D B, then work will be
>     executed once but timer is still running.
>=20
> For this situation, tcpm should only handle the most recent state change =
as if
> only one state is set just now. Therefore, if the state_machine work has
> already been queued, it can't be queued again before running into
> tcpm_state_machine_work().
>=20
> The state_machine_running flag already prevents from queuing the work, so
> we can make it contain the pending stage (after work be queued and before
> running into tcpm_state_machine_work). The
> state_machine_pending_or_running flag can be used to indicate that a stat=
e
> can be handled without queuing the work again.
>=20
> Because the state_machine work has been queued for state A, there is no
> way to cancel as it may be already dequeued later, and then will run into
> tcpm_state_machine_work() certainly. To handle the delayed state B, such
> an abnormal work should be skiped. If port->delayed_state !=3D
> INVALID_STATE and timer is still running, it's time to skip.
>=20
> Fixes: 4b4e02c83167 ("typec: tcpm: Move out of staging")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>=20
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.=
c
> index 049f4c61ee82..a913bc620e88 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -371,7 +371,7 @@ struct tcpm_port {
>  	struct kthread_work enable_frs;
>  	struct hrtimer send_discover_timer;
>  	struct kthread_work send_discover_work;
> -	bool state_machine_running;
> +	bool state_machine_pending_or_running;
>  	bool vdm_sm_running;
>=20
>  	struct completion tx_complete;
> @@ -1192,6 +1192,7 @@ static void mod_tcpm_delayed_work(struct
> tcpm_port *port, unsigned int delay_ms)
>  	} else {
>  		hrtimer_cancel(&port->state_machine_timer);
>  		kthread_queue_work(port->wq, &port->state_machine);
> +		port->state_machine_pending_or_running =3D true;
>  	}
>  }
>=20
> @@ -1250,7 +1251,7 @@ static void tcpm_set_state(struct tcpm_port *port,
> enum tcpm_state state,
>  		 * tcpm_state_machine_work() will continue running the
> state
>  		 * machine.
>  		 */
> -		if (!port->state_machine_running)
> +		if (!port->state_machine_pending_or_running)
>  			mod_tcpm_delayed_work(port, 0);
>  	}
>  }
> @@ -4810,13 +4811,15 @@ static void tcpm_state_machine_work(struct
> kthread_work *work)
>  	enum tcpm_state prev_state;
>=20
>  	mutex_lock(&port->lock);
> -	port->state_machine_running =3D true;
>=20
>  	if (port->queued_message && tcpm_send_queued_message(port))
>  		goto done;
>=20
>  	/* If we were queued due to a delayed state change, update it now
> */
>  	if (port->delayed_state) {
> +		if (ktime_before(ktime_get(), port->delayed_runtime))
> +			goto done;
> +
>  		tcpm_log(port, "state change %s -> %s [delayed %ld ms]",
>  			 tcpm_states[port->state],
>  			 tcpm_states[port->delayed_state], port->delay_ms);
> @@ -4837,7 +4840,7 @@ static void tcpm_state_machine_work(struct
> kthread_work *work)
>  	} while (port->state !=3D prev_state && !port->delayed_state);
>=20
>  done:
> -	port->state_machine_running =3D false;
> +	port->state_machine_pending_or_running =3D false;
>  	mutex_unlock(&port->lock);
>  }
>=20
> @@ -6300,6 +6303,7 @@ static enum hrtimer_restart
> state_machine_timer_handler(struct hrtimer *timer)
>  	struct tcpm_port *port =3D container_of(timer, struct tcpm_port,
> state_machine_timer);
>=20
>  	kthread_queue_work(port->wq, &port->state_machine);
> +	port->state_machine_pending_or_running =3D true;
>  	return HRTIMER_NORESTART;
>  }
>=20
> --
> 2.25.1

A gentle ping.

Xu Yang
