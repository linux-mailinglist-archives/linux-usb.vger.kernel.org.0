Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 763AF2C7CCD
	for <lists+linux-usb@lfdr.de>; Mon, 30 Nov 2020 03:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgK3Cip (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 29 Nov 2020 21:38:45 -0500
Received: from mail-eopbgr20069.outbound.protection.outlook.com ([40.107.2.69]:29003
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726000AbgK3Cio (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 29 Nov 2020 21:38:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C3ggQsr+2U9Vsdkfn2ipzN/djX8P4uVT1TMMnu8zT1Y4GA9COA095XF86XvEnkL8Gi69fjGV5H2hkAZJ6ZhAq6xrOGJCbFJQB0rUv92Fsz7hH2rcAKwVR9NeJgi0LE/4KlpyrOSd8xqD6xQTre52xHme+wCavosGQV3ROj69t0IeP1DFBrYKbUiauop45vDNrwvxBAQ/9YkZxujHu7d2C6TFm7tw2l/oN6enlG9e0h/CDzhP1oWJKer+nxaNQoAZSkEVyh+TdhIX+tCL5q67Q06L8ZCiMtrtqHhUxya+IFGVa+vwDMNPThE62VyBOIsPtbs4x9UkFzdaDv/ppUociw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jH/TKqPKMT9urK0ZRSKiO9d1cpIuxijeFzBdqTK6QNs=;
 b=aB4r49mX4Rs1t9mG1ouXSsCu4J+GO0QvVmQW7tu4eigJ1pECuzenTz57A+NTMoU1PFOtyEnI2vXbIHvm4VItPDAwBL5dKC/H5ECrFQ7zl3ERWMZ+xuiePr9QZbg/N9s/e+rrOLh7L20i/Ug+Jw9zjuD1xClPH+/jtPPCGN4t0gscuXnkhdMAbjt8WfodG/1Pn6nO6xlHSY0mfMOqo2xtFVrxI/oIdud28/dPxW5lShz8XiDyfgg+GuX9aoiw140WWkvGQovB8hbLR4i4nwxrYmFVZRQ6S3JhtQ6ergux/9R7JAAKk8qNRxvDHhz8cigEHZ3hkvLIW4Wc9kngyo6iVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jH/TKqPKMT9urK0ZRSKiO9d1cpIuxijeFzBdqTK6QNs=;
 b=oAj7yus+kDMYa9KyHo2I+3TsVwJgZ3Y4FMISmog3vM8kpNi+8/jUdAGJK8GrXvMde5Gpi6PD+5JanYC9N/JiYRLQMDrczKpSZsypIfPCBnL2IUKnnnoB/1kh9g6noPkQ18mFx6CTcOaqgWPT0GeUaYUfi1R/6xyWAQJIRtZTWy8=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB4590.eurprd04.prod.outlook.com (2603:10a6:803:6d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 02:37:55 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6%7]) with mapi id 15.20.3611.031; Mon, 30 Nov 2020
 02:37:55 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Peter Chen <peter.chen@kernel.org>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Peter Chen <peter.chen@nxp.com>
Subject: RE: [PATCH 1/1] usb: roles: reference controller's parent device if
 existed
Thread-Topic: [PATCH 1/1] usb: roles: reference controller's parent device if
 existed
Thread-Index: AQHWxIaMOP3mHXEjj06uWNIXxpVdA6nf9irg
Date:   Mon, 30 Nov 2020 02:37:54 +0000
Message-ID: <VE1PR04MB652872CBAAE71856BBF68FE489F50@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <20201127062820.588-1-peter.chen@kernel.org>
In-Reply-To: <20201127062820.588-1-peter.chen@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 632c0cde-87b5-4389-2228-08d894d8f174
x-ms-traffictypediagnostic: VI1PR04MB4590:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB4590061C690A6F63F05BA6D689F50@VI1PR04MB4590.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sk6a+dvFaGC7+pIwRI5S8oBsZziAVG2XGcj5nH/msn7im3mdeKF8S5ERTq9YUdqXz4b0EX5eFIpCFJBVpv03ApeVlmN8eNmvuaM64Jl/eglUeUsmM4Ml09AFDGxivE+RS6FkLX9CH5vkR8gIatPRK7zQebygXpq+MQHrwdnTmy3LRt8WFFmM8x3zzXkHKW27W/Q9/My+sC+O7LTsSUUiIQ/A5+SxgUmAoPVFo1UpKU0RSOmufeqZEPMrsDNtYl8esmFUP9sL+FAOi7nV7MPdCgjdC74sFNXZAsAvH3Kb2LwvaGQA7yU2H+txo0VnFf9Fz98zA7PZCiz4maqtLd0mzA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(4326008)(71200400001)(478600001)(44832011)(86362001)(66556008)(33656002)(8676002)(64756008)(5660300002)(8936002)(76116006)(66446008)(52536014)(53546011)(2906002)(9686003)(6506007)(186003)(54906003)(83380400001)(316002)(7696005)(66476007)(26005)(55016002)(110136005)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Sj4Zni4Z7sa2IHcQD+lSvEeefO7KMe4iw6ykFhxASVL8Y3ynqLZI/KMusdcl?=
 =?us-ascii?Q?o3MxlqSsYDkVYpMeKjClg8oLQNpNQo8oaRqHzZUindZfzrnyJYO7fZ6cE25Q?=
 =?us-ascii?Q?Xsty3o71l/iFw7v2Yfy2PhpRkr+vLR9un7akHQanSeuRmKXw2fWRKkzTLV3J?=
 =?us-ascii?Q?S3+pB3vkw/0SZMldD+W9LfVU34n5+clKnUutdZZy6rO+QQYks2OoAooeZ3u/?=
 =?us-ascii?Q?bS9CE29Gy2Z8VgSCnBArtgBIIMzfaNDqGzqQHaZgeBhUt1221y71bs2wmd02?=
 =?us-ascii?Q?E7ccz5WmBTKGVhdm1ZQwrxLHURvebUeaBDT3pYCpRTwutJf9jaysTZuRqmnv?=
 =?us-ascii?Q?lyJU3gKWPy+omq6LRZHVehp3mc9IWWo8TiPUPEHRqmC+MMN1J3Rzz9Ng0FpD?=
 =?us-ascii?Q?0IbV6j/k5ELSfp2u6h7QTCZ720Or8ol+gqZNfMnI9Hhz7fqar8/b7p7vKwnk?=
 =?us-ascii?Q?moU2F61rkt9QRnAAUL/MpnQonZ9OtI6T4Keb0Yw/UryNSV5CWAWvqsvyc8zb?=
 =?us-ascii?Q?L5Y0m9WBMXhpmLyQSx4rAIzcMm9FUUcGRb657sIkuvnqRdbXZA9w/Wk129i1?=
 =?us-ascii?Q?OWji7BySVenYp6S8SpmWqVUqXOtfg++MCKOPsmZ4lDy5Z4VsddIbNniXgWkj?=
 =?us-ascii?Q?R3UU5DTxFP9OWGbITaB99aYYZ9RnDhYCwFa669xsmtgcCDXIWnTR4vUxTeNM?=
 =?us-ascii?Q?Ni2bO9FGyTs7+K9LNaRgL6hzliG/vJHz0lnKRpPyLuqoKaJhTMkss1IhqJq9?=
 =?us-ascii?Q?PWHRV85uCophs0NxtX8KhrwO96lu6c5WA+5VbUBe0AibNZViZ8GRXzJRBEEn?=
 =?us-ascii?Q?kJrp4TAD/fkI8ksyV7N6oQ18GJ1l3qjzka+9p9Mjbth6HeXTVVPb6aQHWzSy?=
 =?us-ascii?Q?J9wpvdyNIEDuEKYQ3nqz9KyOZ4t79faZ6BaOP2UDeEUdRlOj0b5NBQftHlnD?=
 =?us-ascii?Q?uxISrJwgYpBEFBrQcKUZxxoPnxAs120C104mD5Se2yo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 632c0cde-87b5-4389-2228-08d894d8f174
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 02:37:55.0446
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LKYfECvqJae85EYNK5BzHaFX6inpJDSwfIN0TaTNruNPMofFrnutIbZYczzK5qvM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4590
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Peter,
> -----Original Message-----
> From: Peter Chen <peter.chen@kernel.org>
> Sent: Friday, November 27, 2020 2:28 PM
> To: heikki.krogerus@linux.intel.com
> Cc: linux-usb@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>; Peter
> Chen <peter.chen@nxp.com>; Jun Li <jun.li@nxp.com>
> Subject: [PATCH 1/1] usb: roles: reference controller's parent device if
> existed
>=20
> From: Peter Chen <peter.chen@nxp.com>
>=20
> For some DRD IP drivers (eg, dwc3/cdns3/chipidea), the core device is cre=
ated
> and deleted by glue layer device. So, if role switch user (eg, tcpci), co=
re
> device, and glue layer device are all built as module, and glue layer dev=
ice
> is removed first, the core device's driver ->remove function will be call=
ed,
> and its device's driver pointer will be NULL, and cause below oops.
>=20
> To fix it, if there is a parent for controller device (role switch device=
's
> parent), it references to parent too.

This may not enough, the trouble is role switch class isn't aware of
the role switch is unregistered by its provider while typec class is
using it, this can happen by different ways, if we do role switch provider
driver unbind, we still suffer this problem:

echo usb_controller_dev > unbind

I am not sure if we should prevent this happening at USB controller
drivers(provider side), or this is allowed and we should enhance
role switch class to be aware of this situation and properly handle it.

Thanks
Li Jun
