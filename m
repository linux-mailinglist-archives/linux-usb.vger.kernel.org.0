Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DED3F26EA51
	for <lists+linux-usb@lfdr.de>; Fri, 18 Sep 2020 03:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbgIRBLg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 21:11:36 -0400
Received: from mail-db8eur05on2056.outbound.protection.outlook.com ([40.107.20.56]:5217
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726040AbgIRBLg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 17 Sep 2020 21:11:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I2ncpjLqUv951qQbYu6ld+uwmkZho710Qpk3Irlb5h+CZ8nC7t1TAE3/UBkfiJ/c8dZ0ltbhn0HbRpF4RaBrG0dSQj6SnyaInKYgUzB6ZEW84FIrQOcCRG7+0gwFiS2hD2hZHu3fZpjLJHEYfEGt+Up0C+wBh+gUjDj5RUadU6DQXvOlr2SMt7uTkLoNMLusmGWvYc21yJemTmB5m9IetvTQ0ivZp8P9bY5jJwIEOC6z2FyPM2vtNWyApqBVjUA9+Ld0TJZVC8j43DtyPOu9CP3c47WijjNDQNzgP06IrFcYY0y2SdaVk63UYCIOEC4hzuJWfru0TsZgY6b4bJ3HUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMXhoTxoFe/l19qPNNH9cmZWjmuwjMAWG+QGB0mHZVg=;
 b=cvngH/rpyaVnzhV4RFCGZxwic6ZEZenMVfstVPgQZFneQJDIn35v4FuETqfOmr2oVj4ZHz668S+5fZqKVdYF+Orc0k6ZrkyWQ1E+23+SKXL1EkBvI0frhz05KuoQ/2zIFgPJju8iznZul6Jk1l88Q12l9xhIyVryZkA4N0WnioOi5Z52o4NsXlPJhdJCgzUpwsYN6Rn4Zju7XMAmbvtFVbtBNlqWgA0qgyiokuPKxIyvaGF98eeMJQCH9zkLrlLG4bmgiiy1TNszgZawrd0fS5GWZbeCdFdgy/SjpR4pWQN/z+cONKJJ6ex3fcx/dLOPVQQorXkQ2oLsn4px1qu9Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMXhoTxoFe/l19qPNNH9cmZWjmuwjMAWG+QGB0mHZVg=;
 b=ok+iAuMuLeyGR5mRnw6KWBPm5Fob68GeXu9Nr/xdX3zCSq5d06lzQfkfxFqnvaQJpfAfzkRvwTR5VUrvd2Ie6D0E5ftSy0sev2FOQjmYi+su0v7uIORePowrQN37biiUFAHhPbXlLFVDwkEQpBSdH7m7SLV70+RNOUS5SiCqQKE=
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com (2603:10a6:20b:96::28)
 by AM6PR04MB6071.eurprd04.prod.outlook.com (2603:10a6:20b:b6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.17; Fri, 18 Sep
 2020 01:11:33 +0000
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::1953:c81a:cca2:60ec]) by AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::1953:c81a:cca2:60ec%7]) with mapi id 15.20.3391.014; Fri, 18 Sep 2020
 01:11:33 +0000
From:   Ran Wang <ran.wang_1@nxp.com>
To:     Sid Spry <sid@aeam.us>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: Enabling Device DWC3 Device Mode
Thread-Topic: Enabling Device DWC3 Device Mode
Thread-Index: AQHWjU7JiBHQvCKfrkqZwjWYHFt6aqltlBoQ
Date:   Fri, 18 Sep 2020 01:11:33 +0000
Message-ID: <AM6PR04MB541315E1AF4DB7DEF9F3D2BBF13F0@AM6PR04MB5413.eurprd04.prod.outlook.com>
References: <8d9ea8e7-ef9f-4d00-8ca0-b624dcd91de1@www.fastmail.com>
In-Reply-To: <8d9ea8e7-ef9f-4d00-8ca0-b624dcd91de1@www.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aeam.us; dkim=none (message not signed)
 header.d=none;aeam.us; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0f2c9bd6-2da0-4cff-026b-08d85b6fc845
x-ms-traffictypediagnostic: AM6PR04MB6071:
x-microsoft-antispam-prvs: <AM6PR04MB60716A2B0D7CADC91715413CF13F0@AM6PR04MB6071.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IOumRg/svGnZ79G3FOOrb4FWm7w3BeAj0cEsLhjLzV6NU1fkvCaB0YyB6Wc7GTy1vcYQeCowsHiIMuRQhgAQedZcgNGgwyjuj41ohIOdJB4bRPFSn7joS+xPXDn//4UX4blmnmpU566lwUmaH1LzzCxUaTGyhWvIvAGWcADVX1Xq9nwUjlf7zhb12LFdAl/TnULWJu7oBn8/OuH6kVf9M3+8dYEnagYEQpUc5qaXp5yA+l8O5+wtCh2y0iEnYk6oiAStLYqBF2yizcOMTw3RGyBcqL/2diHWeQSQBN17qnmB1SXQBMXLNj2awspn6m06axZ5bkdUphXeNfyyyhld7t9MEOymyk/EioIKlDBoSSEf6kaj7PC4/K/ukFhaHQ+J2LRhi96Uy3Y272SAavlU/Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5413.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(186003)(5660300002)(66946007)(8676002)(86362001)(316002)(55016002)(9686003)(71200400001)(4326008)(64756008)(66476007)(2906002)(76116006)(66556008)(66446008)(7696005)(6916009)(26005)(478600001)(53546011)(966005)(6506007)(33656002)(8936002)(52536014)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: v1M3qfh3mIJ8drF1h3gdcyF9bDVMbKW/zZ8yy1N3VgxPSdQBVq6RXLDDgd59uEliq7TZ93pT2qTJ726wV6eLnzy+2bcPNwFyEdrXmx3MlmfZcZ8iUgqH4TrJSwLCPo0rDh0qkJtupdXIO7kKehtEK9jigvQ0/TSPSrc/ydlPjRSmzQ3lOlhhYxDpDE7m9N8/+rIWoDeV+zylJbrUO9beNmHWUX4hXI+j35LKZBIpbyzgbJamWeF+INMZ0oDeNjHc4SY7Cpg88lACsiivrNXR+L2ynpBnmHBqvXUa+zQnjT9CZay7MKGHiV3ALPtB860i1xFZE7TGn3W8qlryh+wtlkvXmdFM5JKyLptUr8y2+gPz9sWJcl93R+xN6XT5VYdRF8nH/jqJYkpUKTYOqZp86hUqAbUrn9FjP5LAI7eyXgpslLCcdHZZEYfRn6Ry9zEHbcjxrU13D9Q9f6+eKdIc2LZCXF2NzclWxfHE4SchZmecjQ6uEMTxoTwComKPD1ieTHMwkhl76LYzwR7e7lQOqg09Gcxjri9uxDRie6bXT9a9OnHQOb9Y5OPEPoSwQEE7OHe5LqOM/ufqC/OqyULDXjYafgJmLesBBNS51CUXHhPyCNIF+GygO3289WeXGKsxYyTlJ3o+DKS4vLw9NqVCkA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5413.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f2c9bd6-2da0-4cff-026b-08d85b6fc845
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2020 01:11:33.1748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bHkOiF01D3QHNOM9hIAb1dwI7NWznTZc7VyISlcvz7MD3XrgHSx2P1RTF+m1xIINbNtiJywEYhxNRSfjgh3UCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6071
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Sid,

> -----Original Message-----
> From: Sid Spry <sid@aeam.us>
> Sent: Friday, September 18, 2020 7:55 AM
> To: linux-usb@vger.kernel.org
> Subject: Enabling Device DWC3 Device Mode
>=20
> I've a RK3399 based board (RockPro64) and am unable to find any useful
> information on how to ensure the USB controller is set up for device/gadg=
et
> operation.
>=20
> The base armbian (Ubuntu Focal based distribution) kernel did not have
> dwc2/dwc3 modules compiled. I compiled the modules for kernel ~5.7 after
> ensuring that dual role mode was supported along with gadget configfs and
> am able to modprobe them, but I see no devices populate in /sys/class/udc
> and no dmesg errors.
>=20
> I should be able to target any kernel version, but I am concerned that th=
ere
> may be missing device tree information but am unsure how to check that.
> Most people seem uninterested in using the device mode on this hardware,
> but it was 1 of 2 boards, based on the same part, that I found claiming t=
o
> support device mode USB3.

For DWC3 device mode support, maybe you could check Layerscape platforms
as a reference. There is a doc which has details on how-to: https://www.nxp=
.com/docs/en/user-guide/LSDKUG_Rev20.04.pdf
search 'Gadget driver' .

One of the example in DTS is arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
and arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts, and you need to manu=
ally
update it by following above doc to enable device mode.

Regards,
Ran

> Cheers!
