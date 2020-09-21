Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D018E2718FB
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 03:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726221AbgIUBUk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 20 Sep 2020 21:20:40 -0400
Received: from mail-eopbgr40058.outbound.protection.outlook.com ([40.107.4.58]:18120
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726126AbgIUBUk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 20 Sep 2020 21:20:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JFQcAc0zHe1B3FoPJ2xRL5GaLfh9G7EV7BUMXdc/9RY2ISa6Dl/AKWulTmRI+JNJ+DfnqZM9DftsL2PpyMVMf9ZH6Lvi4L2P3oetR1ypQb1flnVKCY6WbDmHYCmG83E/u6jmIhD8ylwHahKwSi0NX6QYT7bQ9HD3db5KJey44WgnACWg6lDk4lFvzGpvJHf/cfsycOpHDC0HhCyCbSAEZIFCZT39FHqtdmQsofYufStciZxgkMx5R9PcEGcogNHMmUrH7zXfn8kZcoHJZl0EIlyQBfpZKYxmRDHuTy+sFc+qjCS633J1sXKZKilhJTXVOV6/KkRY/OAyKlWpeM+NCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/RrnaiVSLhDienh7jpGHpLb642qRMbWLV0OT6HaYpY=;
 b=WrbSXCSQqeZk6P/ZZI6ljaH6WlHooRDckDMuGP/yceQsqiIuvP8Lak26FSX7+Q5b5gAEk9VSvLcHoX0GIHiLzlR+FrKL7wS0YXHo7EY4wZRSbHDX+QXX5h4FVtQzTMdmxqaVtF+d8IrH+nOrWSLi+jOVZlOme9iS7j2U341zaqGMWfAGO9RorPU8Bh/Ab9cmVFQbFYpjFafdqjciErcsvLMW/USPf5o2le61MEwESTm8+nvjFXQmGBm1X/kFbqzRBCXuIuc/N7o4AJ8DThlpbLv973O3nDdFm9K3bzl8liQoAEE7MMbQYGzZB8tdQfvWIcVRS/e1kbvRa9h8jqROog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/RrnaiVSLhDienh7jpGHpLb642qRMbWLV0OT6HaYpY=;
 b=V6+jkq7YiHZ6hn42Ld36mJ+eSX5zwZsPzRJSvRyT3smw6V8vYj+Hz+BBW5KyUfYrH7/PitLdR8tdYRB7ZXjStL7bJeDB7h4ohhQjJdldlEuJFjwMJMsl8q9VIi6R7YdSpYviguTcFpZOSqzvPA4TWkuaKzT2ZsImrcJYHYrgrEs=
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com (2603:10a6:20b:96::28)
 by AM5PR0402MB2899.eurprd04.prod.outlook.com (2603:10a6:203:94::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Mon, 21 Sep
 2020 01:20:36 +0000
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::1953:c81a:cca2:60ec]) by AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::1953:c81a:cca2:60ec%7]) with mapi id 15.20.3391.024; Mon, 21 Sep 2020
 01:20:36 +0000
From:   Ran Wang <ran.wang_1@nxp.com>
To:     Sid Spry <sid@aeam.us>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: Enabling Device DWC3 Device Mode
Thread-Topic: Enabling Device DWC3 Device Mode
Thread-Index: AQHWjU7JiBHQvCKfrkqZwjWYHFt6aqltlBoQgAAjIQCAAAMm8IABvwsAgALPUbA=
Date:   Mon, 21 Sep 2020 01:20:36 +0000
Message-ID: <AM6PR04MB5413410663D6DA1551718833F13A0@AM6PR04MB5413.eurprd04.prod.outlook.com>
References: <8d9ea8e7-ef9f-4d00-8ca0-b624dcd91de1@www.fastmail.com>
 <AM6PR04MB541315E1AF4DB7DEF9F3D2BBF13F0@AM6PR04MB5413.eurprd04.prod.outlook.com>
 <63692cc0-4df0-41d7-8889-a83eca7fd806@www.fastmail.com>
 <AM6PR04MB5413A79BF32C07041B1B7B70F13F0@AM6PR04MB5413.eurprd04.prod.outlook.com>
 <0aa35d4b-50f0-41e3-b12d-c59b1263a5cf@www.fastmail.com>
In-Reply-To: <0aa35d4b-50f0-41e3-b12d-c59b1263a5cf@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aeam.us; dkim=none (message not signed)
 header.d=none;aeam.us; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4eb23054-f695-4a09-7c5b-08d85dcc8b59
x-ms-traffictypediagnostic: AM5PR0402MB2899:
x-microsoft-antispam-prvs: <AM5PR0402MB289971A470295B0DE803A41BF13A0@AM5PR0402MB2899.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kz1DfTgqmCZxEuoiiAo8pBzJ3eia4nRG74J2vIavwe5KhNB6Ngkj2MBOJUKwGw1dk8+wUSdI9+kRXp289q/VRUnj+14IryeeLciqDR6FwAWhu9NGtHo5+zGhM3cPDHuyf9LmQhtLTRg3QJGDYD7Vk5zaR0CTZEQ9/d8k/oq9Zia+z+RXpUjzvYLyncrkiHbYgqTmMcpeXOzI7cedX7IUVuYHKXLs6hrT6OaWquPyKzx7FQ+aM9rUfnsjFkACQH+DGuVQSrHjO9+/JzIyLm/0Uz8QoSDRhikiUl4k3YjHPVbQj0O6G3AZ7sSN8FYI25Un
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5413.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39860400002)(346002)(376002)(396003)(76116006)(66946007)(66476007)(66556008)(64756008)(66446008)(55016002)(9686003)(186003)(8936002)(52536014)(8676002)(5660300002)(316002)(71200400001)(26005)(53546011)(7696005)(6506007)(83380400001)(2906002)(86362001)(4326008)(33656002)(478600001)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: AgQV4GhrK59ibNAOhbwtg+nBUSv7ZLE+GI0OsHyqF0s1tcMclgc3j84wNJTF5XyCZqz9Te5icFbxr5f/41Y9orX+XRcTsarfr7zdRHJcajI4UCaUmtw/oFgo/oyitFR5FFYchvbLQQDQxq2Of3OmFF1R6AGpVt0gFygpLzCEOjt60XTXJeVypyTmZYoQ07EFGWb/umTHEbmavWe0pVUaIJKjLKyCRz/fRFHRayZbV61E9WGL4auKWrd6hcVS5lZZ4oZMKbs8qdQXsQpK+7XnNj+HERqa2u5pHy7JkRjLy6rVNPQVg5OaNS2PTrEzhoGa9rQjdqWpCu6tGWEaAlco+aZUtnEiVQsDbZN3e06K/HsN9dTg5nIK4RLQaJOH/7jlttkrj81Z8WLBrHOC8hI0CUpBpJVI7EMAIRM2lsCK5buerpgTUk4JgRQ8K3UTsel63yOWb6zgKzQDx6J7hw3dR37OVQA/rEiFhCdBzdXyOGddaC3zlVBu3qcb9iyS+OK0GzUYyzZw9g1FNnqe5xYDL1Mi3QiBooM+39ambyq5KNnzqD/Fw/nqJVoDryhr9QESyutrvVcCQp0SeewnmrRAB6wKQ4yDltq9/NGfRkMpFbVRdxBgSEbv9lD0XkUx7M5NGsMPrjqgJZ+8TYqSlZTv2Q==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5413.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb23054-f695-4a09-7c5b-08d85dcc8b59
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2020 01:20:36.3605
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vabJxcFyCRBx62lSVqpsNhoYZT8vr4NlVXfwJvx7OrqLO8vdw5+5yWNJQxOszK8NTsRwIeOkFfO4T9Cvc7Sbyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2899
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Sid,

> -----Original Message-----
> From: Sid Spry <sid@aeam.us>
> Sent: Saturday, September 19, 2020 1:59 PM
> To: Ran Wang <ran.wang_1@nxp.com>
> Cc: linux-usb@vger.kernel.org
> Subject: Re: Enabling Device DWC3 Device Mode
>=20
> Hello list and Ran, I've some more observations. Firstly, I have to set t=
he dwc3
> mode to peripheral directly. Checking the code I was unable to find what
> actually allows you to select the mode if specifying OTG.

Yeah, I also think debugging on peripheral firstly would be easier than OTG=
.

> I have devices in /sys/class/udc and they function properly via configfs =
when
> plugged into a USB2 only port. If I plug them into a superspeed port I ge=
t
> nothing in dmesg on the host side. At first, I did get a response on the =
host, in
> the form of:

So the gadget registration for DWC3 UDC encountered no error, right?
dwc3_core_init_mode()->dwc3_gadget_init()->usb_add_gadget_udc() return 0?
If yes, it looks like SoC internal configuring has no big issue, I think.

> [591550.770819] usb 1-1.2: new full-speed USB device number 76 using
> xhci_hcd [591550.870962] usb 1-1.2: device descriptor read/64, error -32
> [591551.078865] usb 1-1.2: device descriptor read/64, error -32
> [591551.286875] usb 1-1.2: new full-speed USB device number 77 using
> xhci_hcd [591551.386873] usb 1-1.2: device descriptor read/64, error -32
> [591551.594859] usb 1-1.2: device descriptor read/64, error -32
> [591551.703160] usb 1-1-port2: attempt power cycle

For the speed issue (expect SS but got FS), you could try adding below prop=
erty to dwc3 node,
On our platform this is necessary (see dwc3_gadget_set_speed()):

maximum-speed =3D "super-speed";

If the get descriptor read issue still happen with above change, maybe you =
need to check PHY status,
or using protocol-analyzer to see what happen on bus.

> However now I get no driver activity when binding the UDC in configfs or
> loading or unloading the respective modules. Kernel is 5.7.15 w/ patches.
>=20
> It doesn't seem like a fried the port or tripped a polyfuse, the port sti=
ll works
> after attempting USB3 device mode.

How about dr_mode=3D"host"? Does it work? I think it would help to verify y=
our HW is good to go (such as PHY at least).

Regards,
Ran
