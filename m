Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5392DA6DF
	for <lists+linux-usb@lfdr.de>; Tue, 15 Dec 2020 04:33:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbgLODcn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Dec 2020 22:32:43 -0500
Received: from mail-eopbgr130075.outbound.protection.outlook.com ([40.107.13.75]:25985
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726435AbgLODbx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 14 Dec 2020 22:31:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=apEz0wgACrFnaVe6JGxnRtdzc4LcZZpl+stl1cpaV6KzcTBxqQQe5pX4WDN7VsACzPxqv/CPqzc8ZMnolZfaHsQsaoATgdk1mGHwEk6YKiJpZDhu/qeunb7GJKIeK46oNNYhZYADUitM5OQoyx5HVkDBfx+tHQFh4Po7Ujc0NkGT1Eh/s7bY82/iuzNBZFUmboZpHzxy/i57TtpKMS/81UlsvZIyHUgcuCPtREpkSUWDDiuHFoo/qxbdEu/hgGLuuJ+hiioMymdwG38uZvSg0hDwj5+JZgY1vlLw1vj6U5HLiy4EpMT5P0afnMHUDNTrTL0yS4OSrJKS/I9o6mhbmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNdj4bZxdi2aE8NQMcVrTMkgUzYyvf/iyUtB0IY7g2w=;
 b=B8WbN22rtwLgKCY+bcXSC99h6HxQIG8Ke9pozQosTxhZzn+W2R2xAtHNGNzsmLNPi+vdRqsrF7lf2L3ufWnecCHagbDtSJGbfXnst446RSR91HTioZMxCWwF2GOe2OO4PQRyfxxyW792fKuIHqwaim1jBGhF/y0bJYK8xhSDWlVfARmI7j02fM9ODsivIHEYbGtETYWN2swXDZL4ag+R698wj5dqPQ4LnES7FVb+XcESgnfxYcumrHnTY5VhLgWSiGomiWnhAQEWm3E3C4DzPRsawjOCkFZN51ySy+VFYt8EPd70XciKHn6YMpkPhW5tjqTS63KDPPn10gKwLIG1hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNdj4bZxdi2aE8NQMcVrTMkgUzYyvf/iyUtB0IY7g2w=;
 b=BvvAg/zJv+HbRE53XOVEuXnNfOpaGYI/IW+RhomfzgpD4U7yL3IEKMdRNfC1VQevbhjo47M57m0TCi2u6Mpa5ubePbpyEg1MkteY5S/uz9c1/JESNLlolfil4pwtvQFlXpO4JXji4moIWtnK1Tg4oi3oS3YKrvyhSQuVct6uOEw=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB7PR04MB5468.eurprd04.prod.outlook.com (2603:10a6:10:86::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Tue, 15 Dec
 2020 03:31:04 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3654.026; Tue, 15 Dec 2020
 03:31:04 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: port power is on again after turning off by user space
Thread-Topic: port power is on again after turning off by user space
Thread-Index: AdbSkrHAwwTe1v1pTzSTgGOOVcOG/g==
Date:   Tue, 15 Dec 2020 03:31:04 +0000
Message-ID: <DBBPR04MB79793525394F70DE397E24038BC60@DBBPR04MB7979.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rowland.harvard.edu; dkim=none (message not signed)
 header.d=none;rowland.harvard.edu; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [180.164.155.184]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a67ac3d1-501c-4138-3e7f-08d8a0a9da1d
x-ms-traffictypediagnostic: DB7PR04MB5468:
x-microsoft-antispam-prvs: <DB7PR04MB5468B969137D478A401836318BC60@DB7PR04MB5468.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KRtIZjrA7aFic8HmmIUc+rdehqLUdN9SZomCFbg3MJmkWiY3hlGjBESYRyGBr1Sf3QQgvNXYDHrubmsTFb4FQga1akKHQDNPAPSbkNLF0iGbEhosx72609OKWDbqNwESnMeWwvOClPehYYXQLYJFPSslZw742WuJpCcC7Dj2Axe+WMgqmEP3rb0qA+FqxIU44F+PYYbKRDL7kirkevdvsgWgyroWB8hv7cC0dTfxENRui3J1TJL6tXeY5sDLjA7yn7isIBn1T9oQY4QIBs+fMaVtOIW3gEXF06ZvTYZvDtFQ1FKIWZzm8WRjzsdAETa7RUjyRBJeUWJl18ImoaXqiXHunozyEafnINdch2mBq8LDJ1lPFniVSDN7cOfjYxReLQD5nrGqae+Cb/CSh0b0fA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(9686003)(4326008)(6506007)(4744005)(478600001)(55016002)(26005)(186003)(7696005)(44832011)(71200400001)(66446008)(66476007)(66556008)(316002)(86362001)(33656002)(8936002)(2906002)(6916009)(5660300002)(8676002)(64756008)(66946007)(76116006)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?EMqW/qU60MvE1YsoHPFjw4/GfSHcKWKvq4+LutwvlCjacW7Fhk2qocJb7n8a?=
 =?us-ascii?Q?D4yBI++RwSecVKw1SkrS9R7Cmsb03xttsy+WbS/qp/niFLx+XJXpm3QCorS8?=
 =?us-ascii?Q?GaEoLVkC0p3WNKvL2L9Dle8NDQL6nT1tDQ+O328lGLeGb/vNkHBojEDvpCaW?=
 =?us-ascii?Q?IVVjmNfyr4DVNdXi3BLfiPMAeJ852Aif+fwsEwlEw8ANJ0nv+V/04V6j9XPT?=
 =?us-ascii?Q?bg7llTz3X8baQ7b2ogtPz96efbfwHYbWZOhoB3SmecNCWFxlwYKkRjzs3wXB?=
 =?us-ascii?Q?pRVK13N+9pHc4Tr+Wfrt4T5Drdwe7XmcynUkUmDqUN3qHg6uzRaqhOvefo9S?=
 =?us-ascii?Q?5fFIiMf9KWdXDAfdbGSPBV6Ve0KjGEqmmpdzFDPgMxAXFvugOPTCt6B2w6oY?=
 =?us-ascii?Q?ncPc+TJ3b7hxfrYSQzUw3XxW+QZNFaVBbXLYvjlv26vp0GO4uJdTshVcLr2N?=
 =?us-ascii?Q?eH8my94y2ER1Qn1AWx4S6ulxmWref3J1SlyEksYN8k7OvgkEgt3LbA2w04C6?=
 =?us-ascii?Q?Mc4Vr+pX+AAw+nJJw5lFU16Ge4W59Pr7gzErh3jWjqodHwVp7dI7kXXjK7N6?=
 =?us-ascii?Q?u0nvo2irgo+86PhK8cvVwmM20lYhcmZryamc1s8W+PH+KwUUJtU3zYVa1RUI?=
 =?us-ascii?Q?ge3K4yfTv3wHwjXoZsE5yfmnXv8LVKJbeDVDxxBUqbvEL8Ar9vscl87Gxu3K?=
 =?us-ascii?Q?EjbhiWMIoKV6vVSajP2g0EcxIhtcu4ZRPpOJ17NAyKf9c0AdxxADgIj5AOKz?=
 =?us-ascii?Q?XhbbtT3Lu6uXjULyqBg3T/+Gc0G0X/y686XQBjkxOrLgJVTd014QvptGjsPi?=
 =?us-ascii?Q?Rppdu5JzmgOj+cEWiK48MTQLJyPJ3V+99Ly4Ue4e30IthcZ6dr8rY4R6/646?=
 =?us-ascii?Q?VqFNjomj3By3VJfSewa5xjS6TpV+hjT7V1cusUo5gIcloRq2yIztqcvCwJLv?=
 =?us-ascii?Q?hxZaVgiIVxmr20q/GyYfpI4V+dGKKHzQV78uKOvzH0k=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a67ac3d1-501c-4138-3e7f-08d8a0a9da1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2020 03:31:04.1365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SnUwUgEceV7C+B1W4Zvko6BsPjhqCNxoWGEkLlR1fRqRE2crdgt586kjrxN+gVww0h/PQI3cOtQv0iSgu7VkcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5468
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

I use one HUB power control application (https://github.com/mvp/uhubctl) to=
 investigate power switchable HUB, and
find the kernel turns port power on again at drivers/usb/core/hub.c, after =
port power is turned off by user space.

5122                 if (hub_is_port_power_switchable(hub)
5123                                 && !port_is_power_on(hub, portstatus)
5124                                 && !port_dev->port_owner)
5125                         set_port_feature(hdev, port1, USB_PORT_FEAT_PO=
WER);

The main sequence for testing turn port power off like below:

- uhubctl sends command to turn specifc port (eg, 2-1.4) power off.
- devio at kernel gets that command, and send to hub.
- port power is off, the hub_event is triggered due to port status is chang=
ed.
- usb_disconnect is called, but port power is on again by kernel at functio=
n hub_port_connect.

I can't find the code history why the port power needs to turn on after dev=
ice is disconnected, do you know why?
Any sugguestions to fix it? Thanks.

Best regards,
Peter Chen
=20

