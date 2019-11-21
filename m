Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2A751048D3
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2019 04:08:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbfKUDIt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Nov 2019 22:08:49 -0500
Received: from mail-eopbgr40069.outbound.protection.outlook.com ([40.107.4.69]:41126
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725819AbfKUDIt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 20 Nov 2019 22:08:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mh2Z8t+xLyCwXfZVLQz4ThDhl8+iM5Gea5OA5k8WrC/Hv6LYsmkoHH4YH/3ZcnHd1gXwNWdZf7ywNNbMQEBqfrkb1gcsPsw3QpeZOXoZ7WYEpEEAahCDm0jdL6WJEGKZmhO4eJKol0HqnftwALwmo+jCgtk8G+4T04uXVq3RIojjdITRtbTLEMF/AGp5WXadOhDxIhij6YIW4uXLW29PQrI35ynPTIe5WJjN/3eLAxc0wpWYO9w/X1fds5ksbDtxt1nc+QfZjxF6nz+W29JAGQYAxF9n9Wb6gJtJJy9TQDwhNcv8t2gPWHFoEc1TcGpFwVwyg1h9EwTJbW+14PjKRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKX+CVWoS4kXghP0jRrwzedtdt9bSWwTUfrNaMKUUkU=;
 b=J3N3fnbMMo3YUOyI/fLALmW/Ehn4VXZqeOplNBND00P+fAHHKuh0CI/NLvSR0Ti6MkOAIkapKtkIPo4cpyuKGQoDdM227ma3laPHPJDO7LTWEJyi4iOpsEs3815yZ9EX1K3Bs5dnHrewqJlV1hHfEeA79aho/ExmMohZXvtL1VjYfqD8vZ6jewWz/biPfiBW4jAutAwSGWKpIrOMJ4e94XSveWGfzxq8Kub0trQIOip57DDHW+i/RYYXkurZxaKz0y4HSLSC4zxhxwCRmWu8hOgGGN//C8gZ0Xq2/AHiU1TOmpJ+1zAq6KufnVaKNFd/a/zMFat3HGQxMCBAIYZvkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKX+CVWoS4kXghP0jRrwzedtdt9bSWwTUfrNaMKUUkU=;
 b=i+2cD0RmsQ5AFHvUMfXl8Bi7fetCC2iH0jSvJYYxtp+i0t9EJIbGHtfmnlu/buWrXjqq3AbO8jqTmY5kaCpBDZfBI1Bz81WPSWG+UUc6hQl7acq8H1bKNUQfke2Cz0yMgo2XOLsCKHIUCUhSuk9Y+9Fn4TU6jy70tvF/4Etxzko=
Received: from AM0PR04MB5314.eurprd04.prod.outlook.com (20.177.41.157) by
 AM0PR04MB4931.eurprd04.prod.outlook.com (20.176.214.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17; Thu, 21 Nov 2019 03:08:46 +0000
Received: from AM0PR04MB5314.eurprd04.prod.outlook.com
 ([fe80::3c84:9ecf:12d0:f5e7]) by AM0PR04MB5314.eurprd04.prod.outlook.com
 ([fe80::3c84:9ecf:12d0:f5e7%3]) with mapi id 15.20.2451.031; Thu, 21 Nov 2019
 03:08:46 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     JH <jupiter.hce@gmail.com>
CC:     Greg KH <greg@kroah.com>, linux-usb <linux-usb@vger.kernel.org>
Subject: Re: kernel: Alignment trap
Thread-Topic: kernel: Alignment trap
Thread-Index: AQHVn405yhhYWBSmMUiL36RdwCBj9aeUDqIAgABu0wCAAHVlAA==
Date:   Thu, 21 Nov 2019 03:08:46 +0000
Message-ID: <20191121030842.GA7503@b29397-desktop>
References: <CAA=hcWRrES4cpXvqBtD8-pyrUwz-BR03c-hSG-Xr4dei3AQi_w@mail.gmail.com>
 <20191120133152.GB2892197@kroah.com>
 <CAA=hcWQaXPWWAv2c9ZuVnPw-g075SC1tyKy0DP2+WrktdQYymg@mail.gmail.com>
In-Reply-To: <CAA=hcWQaXPWWAv2c9ZuVnPw-g075SC1tyKy0DP2+WrktdQYymg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1da3bb9b-a077-4d88-144e-08d76e301f88
x-ms-traffictypediagnostic: AM0PR04MB4931:
x-microsoft-antispam-prvs: <AM0PR04MB4931D88B7DE35C70459CB6598B4E0@AM0PR04MB4931.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0228DDDDD7
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(7916004)(4636009)(366004)(346002)(39860400002)(396003)(376002)(136003)(199004)(189003)(33656002)(11346002)(4326008)(446003)(8936002)(305945005)(66066001)(86362001)(71190400001)(8676002)(66946007)(33716001)(66446008)(7736002)(66476007)(66556008)(2906002)(64756008)(91956017)(6512007)(54906003)(76116006)(102836004)(3846002)(81166006)(6246003)(6116002)(9686003)(316002)(5024004)(81156014)(1076003)(256004)(6436002)(25786009)(5660300002)(186003)(26005)(71200400001)(6916009)(476003)(76176011)(14454004)(53546011)(6506007)(478600001)(486006)(6486002)(99286004)(229853002)(44832011);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4931;H:AM0PR04MB5314.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m0cWts4mZ267S8qRJZP5gkkeefc2DNlBAFWMkMcBYK/eMvGpA4sgtNBBwXvGiDqAuuy+ZVij1gJ0v6P2TdMgsGCuURcy155QQ4YQWzFi3hCauB2kund1UCrNnNRcX6xACxo6jpft9GeMs9akNFnChxf/2cr1NWQ9ysM/VcBgX6NiyIQ20N2Cd9bZhWl3NyyYy4UAYAC/hvYIZ7WDxLqW5nLlqKGTSJOvFHOZ9lH+YwrZKd2D1fTgfQq7iP41KyL4alLxP8jXWkUPkpMkSsQGlWH40HdEzv3Bwxm5wolBTIRlBmJjmNBBkIE0zdVwKiWbehhvNsZ8qQLx8esKYp5fu9CDXcjvpHVHGkF5vespAGsE7cXSl7cywtd+76V/YqyEf02gAN3RP7zrVLoMIjVheqlbI9y2n+gA5oE/3G07USewmBGr1EqyaK6tI5SzXgdV
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6D8B2F643643BD418AECB929BE694E72@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da3bb9b-a077-4d88-144e-08d76e301f88
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2019 03:08:46.1572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rULRKVXHkx4H8Zxc2MKDzY+2T+LDC0ZfYEFNpHhep7ZGOKPd9GW+1/yhVnlNBi0wUotVgVEaEsckoGVfDNkDIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4931
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19-11-21 07:08:32, JH wrote:
> Hi Greg,
>=20
> On 11/21/19, Greg KH <greg@kroah.com> wrote:
> > On Wed, Nov 20, 2019 at 09:28:14PM +1100, JH wrote:
> >> Hi,
> >>
> >> I am running 4G LTE (USB protocol) and WiFi on IMX6 board, the kernel
> >> is 4.19.75 LTE. It is not clear where the kernel alignment trap came
> >> from, the only thing I could see is the alignment trap message
> >> generated immediate after USB GSM communication or mwifiex_sdio. Where
> >> that the alignment trap came from? Which parts of the program could
> >> contribute the kernel alignment trap, kernel iteself, or USB GSM or
> >> mwifiex_sdio? Appreciate clues how to fix it.
> >>
> >> Nov 20 05:08:09 solar kernel: usb 1-1: GSM modem (1-port) converter
> >> now attached to ttyUSB0
> >> Nov 20 05:08:09 solar kernel: option 1-1:1.2: GSM modem (1-port)
> >> converter detected
> >> Nov 20 05:08:09 solar kernel: usb 1-1: GSM modem (1-port) converter
> >> now attached to ttyUSB1
> >> Nov 20 05:08:10 solar kernel: mwifiex_sdio mmc0:0001:1: info: trying
> >> to associate to 'Solar Analytics Wifi' bssid 78:8a:20:49:4b:c5
> >> Nov 20 05:08:10 solar kernel: mwifiex_sdio mmc0:0001:1: info:
> >> associated to bssid 78:8a:20:49:4b:c5 successfully
> >> Nov 20 05:08:10 solar kernel: IPv6: ADDRCONF(NETDEV_CHANGE): mlan0:
> >> link becomes ready
> >> Nov 20 05:23:13 solar kernel: mwifiex_sdio mmc0:0001:1: info:
> >> successfully disconnected from 78:8a:20:49:4b:c5: reason code 3
> >> Nov 20 05:23:13 solar kernel: IPv6: ADDRCONF(NETDEV_UP): mlan0: link
> >> is not ready
> >> Nov 20 05:23:18 solar kernel: Alignment trap: not handling instruction
> >> e8532f00 at [<b6c802b6>]
> >> Nov 20 05:23:18 solar kernel: Unhandled fault: alignment exception
> >> (0x001) at 0x38626667
> >> Nov 20 05:23:18 solar kernel: pgd =3D 34bdb7e7
> >> Nov 20 05:23:18 solar kernel: [38626667] *pgd=3D00000000
> >
> > You should have a much longer tracedump after this, right?  Can you
> > provide that please?
>=20
> That was the last statement from the kernel log journalctl -t kernel
> -b at the time.
>=20
> > And why do you think this was a USB issue?
>=20
> No, I was not saying it was a USB issue, nor did I know if it is a
> kernel issue or mwifiex_sdio issue or something else, I don't have the
> knowledge to determine it, that was why I have to go this list for
> help, I did try to connect to Linux network mailing list linux-net or
> kernel mailing list lkml, but I must get wrong with the mailing list
> address, I could not get response or subscription frin linux-net or
> lkml, if you could let me know the correct kernel network mailing
> address and kernel mailing list address, I'll ask the help there as
> well.
>=20

Do you have correct firmware has loaded for your device?
Do you have issues if building these two modules in kernel?

--=20

Thanks,
Peter Chen=
