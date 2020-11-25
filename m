Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 432E32C3660
	for <lists+linux-usb@lfdr.de>; Wed, 25 Nov 2020 02:56:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgKYBxt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Nov 2020 20:53:49 -0500
Received: from mail-eopbgr60043.outbound.protection.outlook.com ([40.107.6.43]:12622
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726298AbgKYBxq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 24 Nov 2020 20:53:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=meKdJ6hF8TZb2jZf7c4+Fwe3NQwqEwxdAIiuA5bZeT9H2S1fn4VOGmys3xox9BCzWd7O+GqrQoV9VK6P8HaCPYEXjX1bZuCjIUjgy3eGLTqFDep0CCRFXXJR1jQHn9CwCgfQ0kQzYp7BLL/y5QjjiYyAKXcCUvhY//Tcpl6u6VYOwnjijKUznPDBEZq+1SQR7zCqACtBwf0PG8j/XHjszOGQVyfFmnZy+AAXBlJ3p9fVdx5xBdHQy+LC8GzdUmbvG00Ki2gSXz4h/suU49ozca5peDku/S4naVPSOzNkN/uN9VZo3GwtCDUna52DMIBzoJ8z2NHjQ2cqbiPPic7C5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EK/kU12euhVOFoNcOwccHVpB3CYhnn4W0GJfkHWPwco=;
 b=ZCIWxKetnHzWudIi/fqWjDWpRjTQSv6zEGc8NR5OPEl6GS4lsh+wfjkRcZMkPC3+ILIz/xLkJ6cVDq2sR+BQ6Qt2MnY1jatAP5zhVuElu+oNftXPPorG/z2/Vt6rBUynFHndVfCvD2cwV8BXv9UryPoLMkwTdTFjF23oVT/ANgCKkFF4a+OPjdPny3HmZs0JyrqVIpymlfWNlNYROs//hfIGcT4FHKJyPJdwwHbPQVG85kDetUezVmNJJJKoJIzXP92nmzjZzhxy67l1GxaR/fnDMBp0oTXJG1NCYAFTIJ9q0/tBePIDxo3WBT7IJu68oZYbnL5zo07mZCtrrL4V9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EK/kU12euhVOFoNcOwccHVpB3CYhnn4W0GJfkHWPwco=;
 b=NwpQqUlHdcXEUFkpG5/Ma0r4cyGMvUOo9MG99SfOmITR/4aTIanj4+icWonZVIUJRHolJNSeAdZPRE144iVfd1ocqSDHdbYNmaAbRbUJLNswIBYH3AMTVCelJEmNEpUvtChjCknCRx7vdLC573zFlWWl/rU22UYkKlfy6idStZc=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB8PR04MB6860.eurprd04.prod.outlook.com (2603:10a6:10:112::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Wed, 25 Nov
 2020 01:53:42 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3589.030; Wed, 25 Nov 2020
 01:53:42 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "Neuenschwander, Bowe" <Bowe.Neuenschwander@garmin.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: USB Gadget EEM Suspend/Resume
Thread-Topic: USB Gadget EEM Suspend/Resume
Thread-Index: AQHWvG1JL2Kd5y1bZE+t7tgpTs7zZanLi/CAgADydl+AC6Q3gA==
Date:   Wed, 25 Nov 2020 01:53:42 +0000
Message-ID: <20201125015313.GE9929@b29397-desktop>
References: <09f87aed186f4c8cb56aee1d2409ae65@garmin.com>
 <20201117013849.GA5967@b29397-desktop>
 <bb22f96493394335909c5e85b09b0e9e@garmin.com>
In-Reply-To: <bb22f96493394335909c5e85b09b0e9e@garmin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: garmin.com; dkim=none (message not signed)
 header.d=none;garmin.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c921cfab-f2a2-4b5f-dc1a-08d890e4f00a
x-ms-traffictypediagnostic: DB8PR04MB6860:
x-microsoft-antispam-prvs: <DB8PR04MB68603F9E7F05DEEF95E1A2148BFA0@DB8PR04MB6860.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mggg503LOFKvUv+cdjTISh8o7dQ0TETuuZXLSGPENr8/tRR2ikCSB4K/qzMKBey6EV5/c4JP48BriSm7AQPY3ZB/6BuLyBkx1jtI2sLt6rQpzmHnlPsGQ0WlH0BRuXdkm0W4TQqhCNHwLv8b83qGKTmdyHY5aANfJPfI+tzM1ZzDmpHZGEIX/BMU5TMVP9AGsAmsUkwvgOrbInPSlohXUXWWHhGrDPbkopfXv0CpdsCnb2kUnAxLBq7XJpT773Q7hx1jVAD/4xUhO2etDYZVV+v30+/cpLhKbvAjSNx8Iar7Eg0gOQtpL8HvjZGmLMsOQp/l4gUZUS5Otkv9ic5GMA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(376002)(396003)(39860400002)(366004)(136003)(86362001)(478600001)(33656002)(5660300002)(15650500001)(316002)(66446008)(33716001)(66946007)(91956017)(76116006)(6916009)(64756008)(6512007)(66556008)(9686003)(66476007)(2906002)(186003)(26005)(71200400001)(6486002)(8676002)(4326008)(1076003)(83380400001)(6506007)(53546011)(8936002)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: RhsgNHtaKcdjBB7lCBB755YFRXS7+4/gcCXiQNFwPhr9+mxJjt7bqFo+jQc3nUxlUYB4NYfNu+er8cYOtZkswgWrHNobm2LfmjImW/Phu4NPrDJsgzp2UqUOvUHbwalA7iIeP3bgB/lVJOVu6PEhzOjCmmd8wCdXubo3l1/5wT2bn+pi/UOD9benloj+ysX7IrYK4yVo8AhR2uQguY+HHUfObdAjHao8W3gvP0qmBD1nfN4R85rAbeFrYLACFA+Xgte1m3mEtI6JPJ8jii91S52KOtjsJODrOj8VWZVPNgOamn5HLIuZJncsvboSBNTWFT/c4Q5MYrVQ1x1Mhvh2a861NUCmh6f+UtdF0Kjx3hXewjnlu0KqpzDg+thsD05mY5S7shPZIbpeZXU/4C3jXmrrD+NYAqSWeUgVqrIDjXsF18w/rONSM6aa5wK/Uk0+H5gH8gpSwQt8mZu0NLfVSh9E78vJ+KVGMICoHYeJJNsPpJVkoDI+QBTV1gCqioVqkzRfU1zHqKQul8YcU5HFJafNsSqXcbfZTj6RyGh3o7uEJFatqEFawezfrn/KKN8NjExWPDRALoexkHMA4ZO0P7LdlgX35bBHScz6TTGfW+jaUOdn7Gj0pNMlvyiy0Tk76l/gdDAJ7caqPqu4bNCZXzYJsbns2cqwBKOGrOcvGSv95CWhYdNqgHLbicV86e9tAOPUjaZS1X0FyAUa6V9Bt3BN0z96s+fN5kBtfe3Y8onRxRbnmxWABHiiADmJvskzhw8JRW4fkU+X8ckDqWHcupqI3kOh3vfmsTt2L3STW7e132G4aRwoRlFnztcqyQlk1mcjkP/oWPB5nHUF712U3qR9ysjcROaG9jHrBizoBN0cLiQBQSSWaE5z0dZlxStlRHxv9gmW7gyLR0BlrV9bRA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E21342773CFEB1439034395B0ABD0A81@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c921cfab-f2a2-4b5f-dc1a-08d890e4f00a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2020 01:53:42.6046
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oFS0S02XpEynl3DwAoiPcREVY45Y0Pw+vF4rHooYKRCLNA/SSgfUtQtjbnULUwijW8w9KKkpeHanJq50Ach25A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6860
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-11-17 18:30:34, Neuenschwander, Bowe wrote:
> Thanks for your quick reply.  I think your ping test/example tells me qui=
te a
> bit about the expected behavior.  I do have concerns though on what this =
would
> do to TCP connections.  Could that cause quite a bit of packet build up a=
s
> the connection attempts to re-transmit packets that were not ACKed (but s=
till
> sitting in the queue)?  In the case that the suspend is long (say 10-60 m=
in),
> it seems this could cause quite a lot of packet build up, though I assume=
 its
> TX queue will fill up pretty quickly and send will start returning failur=
e).
>=20
> The issue we are seeing is when USB is physically disconnected, the suspe=
nd
> hooks are called, but the disconnect hooks are not.  The device side of t=
he
> USB link (the one configured with Gadget EEM) is externally powered and h=
as
> a hub as well.  The host is disconnected from the hub, but the link betwe=
en
> the hub and Gadget EEM remains intact, so the Gadget EEM processor does n=
ot
> see VUSB go low.  See below for a crude diagram (monospaced font needed):
>      ____________________________
>     |           Device           |
>     |  ________       ________   |        ________
>     | |        |     |        |  |       |        |
>     | |  USB   |     |  USB   |  |       |  USB   |
>     | | Gadget |-----|  HUB   |--|---X---|  Host  |
>     | |  EEM   |     |        |  |       |        |
>     | |________|     |________|  |       |________|
>     |                            |
>     |____________________________|
>=20
> Therefore, it stays in that suspend state until USB is reconnected, at wh=
ich
> point the disconnect hook gets called and the connection is reset and set=
 back
> up.  See below for dmesg (note that the USB Gadget EEM interface is vis0)=
:
>=20
> USB Disconnected:
>     [ 4047.888922] g_ether gadget: suspend
>     [ 4048.442846] vis0: stop stats: rx/tx 13079/13406, errs 0/0
>     [ 4048.442967] vis0: host still using in/out endpoints
>=20
> USB Reconnected:
>     [ 4054.891454] g_ether gadget: reset config
>     [ 4054.891487] g_ether gadget: eem deactivated
>     [ 4054.891500] vis0: gether_disconnect
>     [ 4054.897743] g_ether gadget: suspend
>     [ 4055.273258] g_ether gadget: suspend
>     [ 4055.662466] g_ether gadget: high-speed config #1: CDC Ethernet (EE=
M)
>     [ 4055.668899] g_ether gadget: reset eem
>     [ 4055.668912] vis0: gether_disconnect
>     [ 4055.668924] g_ether gadget: init eem
>     [ 4055.668934] g_ether gadget: activate eem
>     [ 4055.668974] vis0: qlen 10
>     [ 4055.674126] g_ether gadget: reset eem
>     [ 4055.674161] vis0: gether_disconnect
>     [ 4055.674219] g_ether gadget: init eem
>     [ 4055.674230] g_ether gadget: activate eem
>     [ 4055.674267] vis0: qlen 10
>     [ 4055.847697] vis0: eth_open
>     [ 4055.847729] vis0: eth_start
>=20
> The problem we have is when it goes into that suspend state, that interfa=
ce
> remains up but cannot actually send/receive.  There is a process (for whi=
ch
> we do not have source code available) that starts consuming a large porti=
on
> of the CPU (according to top/htop), which in turn causes other issues.  W=
e
> have have a little daemon to detect when USB gets disconnected and bring =
down
> that interface (ifdown), and we have tried adjusting the offending proces=
s's
> nice value, but these do not fix the issue (they help, but do not elminat=
e
> it).  The only fix we have found so far to eliminate this issue is someth=
ing
> similar to the patch I previously sent; but again, I have questions of if=
 it
> is acceptable handling for USB suspend.

Since suspend is one of USB bus state, the USB host may suspend the
device at some situations, it seems it is your HUB's issue that does not
disconnect its downstream ports that the host disconnects it.

Could your daemon poll suspend state for gadget through
/sys/class/udc/<YOUR UDC NAME>/state and bring down the interface?
You need below change at kernel for that.

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.=
c
index c6d455f2bb92..bf11488de93b 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -2330,6 +2330,7 @@ void composite_suspend(struct usb_gadget *gadget)
=20
 	usb_gadget_set_selfpowered(gadget);
 	usb_gadget_vbus_draw(gadget, 2);
+	usb_gadget_set_state(gadget, USB_STATE_SUSPENDED);
 }
=20
 void composite_resume(struct usb_gadget *gadget)

--=20

Thanks,
Peter Chen=
