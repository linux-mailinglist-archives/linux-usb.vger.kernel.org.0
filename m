Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 157E740484B
	for <lists+linux-usb@lfdr.de>; Thu,  9 Sep 2021 12:15:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233850AbhIIKQM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Sep 2021 06:16:12 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:18482 "EHLO
        esa.hc3962-90.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233654AbhIIKQK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Sep 2021 06:16:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1631182501; x=1631787301;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uLAZYNsrlidLfA+7zEdANfX0mJTe5mFeeJrgnfbCIKE=;
  b=mrZQ0acNv98UCtDYtCuH/J41EQk6xmGhGZbf8fRFofLuZTD8/fGQB5Gd
   wzpbVcKKG4yntCixPw0rgmg2Jt6LSIdYtr+tS02XxRH1j4Ophy5V5mBfM
   OFUZL84++Pr6aOoaefStqfD0Z19HBKgesdswmVrp+S90A7LTgNlo/M+jI
   8=;
Received: from mail-bn8nam08lp2044.outbound.protection.outlook.com (HELO NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.44])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2021 10:15:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQCXIhvPbHk+bnMPy/GHfP/asRi7fj/A+5W9Ly55Vgzu2PhiQUyFd6ThRpPkQx33h+CMSCHx8OkHBSP6K4XLzVhErUEYZnfEARiXWw9ViVq+B/W2aoxdPwHDZSbYANNODBphFFiXZqPEvKXtLLUG8WaIKh9VOeOe1d42+TbrDUvPSOtK7gqlZd2MA8YMPmsOYXH1kWAwBtDlUkZRkB5A59mlGXu3VtdWyG29T9Ad0/8RdA8ohYndwTuXdFQ/qJFmK4D99IwYfU198R8YxhMi2qxQMNN2nEhHxs6GAbcl1f0QUAB6hReiK+L0y1SOelxQtLU16IWNMjZQk4U1ydnAJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=uLAZYNsrlidLfA+7zEdANfX0mJTe5mFeeJrgnfbCIKE=;
 b=A4qEkFBehMobnRBkKr9Bk1D1rvvDbe+WCspAIW71J6B/Op3KI+E+PE+29rrbi/cWepvEmCbOTyCC6iAXzilVKkvK+GokzTdACPRsbMwVgKE29pXd7oQhCS3eFwbNmFc8LmaQsxKVePTZb+0TGwsNdUrx9FtdLEbgZNpm0NRbKzrCRtqM/+Y9EdOCrwM79hgO3bIWPjpF7OB+cnzfDgaA+rldpXtH/Tgh9CuPPZ00dnFmQNmU8cI5lu8N9KnpCOC+eBXMzrld/niHfSag+0xBjyNihl+Cgv8t8cTKybRIbCZzweNrNqVJ/EB4o9yMTCIz4P6VF1f6LbDbbtD2BacC7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM8PR02MB8198.namprd02.prod.outlook.com (2603:10b6:8:4::7) by
 DM6PR02MB6985.namprd02.prod.outlook.com (2603:10b6:5:25d::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14; Thu, 9 Sep 2021 10:14:54 +0000
Received: from DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::19bd:f5d4:bf47:a8ce]) by DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::19bd:f5d4:bf47:a8ce%3]) with mapi id 15.20.4500.016; Thu, 9 Sep 2021
 10:14:54 +0000
From:   "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v2] usb: dwc3: gadget: clear gadget pointer after exit
Thread-Topic: [PATCH v2] usb: dwc3: gadget: clear gadget pointer after exit
Thread-Index: AQHXpV2g40aJ3GPk7EukVLgREXD//Kub6eAA//+Rc7A=
Date:   Thu, 9 Sep 2021 10:14:54 +0000
Message-ID: <DM8PR02MB8198CF9B0A24B31A4A57B3FCE3D59@DM8PR02MB8198.namprd02.prod.outlook.com>
References: <1631179952-28023-1-git-send-email-quic_linyyuan@quicinc.com>
 <YTnYEp1e9TaSFGa6@kroah.com>
In-Reply-To: <YTnYEp1e9TaSFGa6@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5da1eae9-2504-4361-8c0b-08d9737aab1e
x-ms-traffictypediagnostic: DM6PR02MB6985:
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR02MB6985BA0DEB9EE2CA66CCB5309FD59@DM6PR02MB6985.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZFzUaQsut49nVbt7YGEgd6uykGdzfs9haUDZC4Z2MJF9bapJSLEu6D4p7ww/ZFzxbDOXBKOCR3vUKqoqbf1tJH6oMNgJgWqce/VD9Rzc/Ce8VXMBi/dHPHTBNzulz1s0wGFTnpB53pl3xrym6aG6RSmojUOVCdevWcO6nZVIIQQqi5ABCszrgPIXSPVXeRyNCbx7KWGZ0b3PMqFC0AUbMdsZ4qdan/hWTAePTDIfRRV/CAswLbGzSLw/rSe3E39uuWsOxVhtqOPuLpIP0Xn2KX6uTjePRSKLk3hfEeGsFZ1bjfj/8j7TN+Fk5I9LgbIL452MDoHYEXVPFeo2MZtSEc3rrrDr05mbbZtKdImhBt6OI42chUciHHfCRoKGI2FeqQxvCyaCSgWQruIYayMGAaYytJJboNJE7Tu36lfvmhhoVqiW/rscEjSZyee6mLYToQCzqtkpAk8Am8jUIkoMPBUDPDos6l9DPRvrAczIDYdkE+b9fN7/dswmZAIGqudj2B+JQNz0P+1kYbB3EiOiTxkXeN2tugHJcft0o64MjWfOZnmhQdQngmeSIH3BGENiEw9v0/xvxZsgY7u93NGbaEOU/X4NWzBVIBynyhI3pvzNnQl11AibDmhoM2ZIVEMQ0XoxRrjRB7ufBKvUDIT5581IqFh5h6RsdaEBhWvDIC3ChLjASfqiKjOwkNm4nhkP99zf8vNUYV2dbVdTySXh+g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8198.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(110136005)(316002)(7696005)(4744005)(38100700002)(66476007)(64756008)(71200400001)(66446008)(9686003)(8936002)(186003)(66556008)(2906002)(54906003)(52536014)(26005)(122000001)(38070700005)(8676002)(33656002)(53546011)(66946007)(478600001)(5660300002)(6506007)(83380400001)(86362001)(76116006)(4326008)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YXfiPQJ888rF+SmSaHU2z+RAE2F+r4u0LHwT7KuJwjXssScIGOf1v49nRiY0?=
 =?us-ascii?Q?mPLQGIuVno9MhdPrSHvdjJHGLwNb5NsU252SxIUSE8siXC+hDuD+79PaxrRP?=
 =?us-ascii?Q?i8a/i2waDGVldxaeoyPRHOhoGyK8iM2Lx++qyz9JvabCOHx6bj2uUpHRvEA0?=
 =?us-ascii?Q?SQonyf51rq55XgaP1cVh2gV8WPrR8qoyKADDQ0vGd/nVQYiAByeOqnkKExpN?=
 =?us-ascii?Q?zA88fR/XwaVU2DqRS1OoE/HBNMvW3oF4L592WufooUQa89qyqA2Sw1OJ5E6K?=
 =?us-ascii?Q?aQ5NAd/CUhSpE/EyL5w//eBwp0YYClQz/tpNagjprDJK4yEUciZzNp9BkX0u?=
 =?us-ascii?Q?f0CLWUi9h7A366b0AOra6wBz3vkYCH2rz1wRe6O3WLBQ9LznHnlmHq83xPzX?=
 =?us-ascii?Q?CYGFgxM7wb2sxvRJ+KO/Ta8wTUu0BmS702v15mcK4PcW/Aiv8ClQ8rjfapz4?=
 =?us-ascii?Q?llCNcEtudacTNMQ1ORiXFmsNLibwVPWsnnEW9If4VQ3XAETB4ki6Sl342I7n?=
 =?us-ascii?Q?hIo/bPVyA7u52apHduNwqbW7KAH+eZ3hkmbJQ9Phb16ptm907befsp3ZDU5A?=
 =?us-ascii?Q?1LZYD1+ImBpDLyiUXzLrYQ/qjKU9xKA7y5nnBZ46ngbifwetj+bt79OHjMcd?=
 =?us-ascii?Q?XRP2OlEel4dq78hsHiDo+p5YV5S0PlS8UddDoLTR+bkwKFci2TPP28iaWsL4?=
 =?us-ascii?Q?Zwoe2nNaC0ZRY8i8qaWxGn5+0wfseHFvctXnhE63FKpDbQAnMBFz8fgZdawT?=
 =?us-ascii?Q?ehSAy/Zf5qbPW159fcF4Ct72SxYkdLK9yDWnrRyFGvUKJo1sbawW4y/nJzK3?=
 =?us-ascii?Q?1gR15UbD+86FSzptgdiKEjytPzH4TnpT9wzfHx1+MIdYqn/Oo5e/FqBLmwnP?=
 =?us-ascii?Q?dB792LGu35E/2wrkc37sTMaleR0iY3rK9DBxE+zGRWfPrRiKCf+aDj5SVcpe?=
 =?us-ascii?Q?RMQVY4htD9g+IF7VqHo+ND3NtrBZA3P5XVKy8Se3HsH5Uv4Xo9zSALgxU6hP?=
 =?us-ascii?Q?23leZ01etFKleomxkZ2AlS09xXTyzdAJd5AQrGTmV/ywc9lFfh1wnL6xqgpR?=
 =?us-ascii?Q?Ew/stjndGy/osiWDCuzxRdysPOQUJeUFWs58ETBiAmgPnDJaaeZukIPwOeMv?=
 =?us-ascii?Q?b2ZHZ1f2Cc0RdSCfBGj1qaxwL1xJFMOL1AqAcnDse+KcWmFT118bHe15QLhN?=
 =?us-ascii?Q?CIKhjhXfBRnILbIg1wFT85rla/5MRWDGwxXrokjkXBRJ4TmILOCZSM89uiHI?=
 =?us-ascii?Q?BeKICnyXuulYGwE3zXYoPFW8DA1TdlxQLVhdY6oSvw7X+Ax1MvhOIZ7Pjvm8?=
 =?us-ascii?Q?Bi4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8198.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5da1eae9-2504-4361-8c0b-08d9737aab1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 10:14:54.3039
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CDFPcNejP7tCCiK84z7K7OIq27WbnDlLyK4P0/j3ndR3YdAzxqqYVHxEd80MyvdhsBLrz4WcEWjjQe0Yx4gyvxCKqDcGmfzGbTFrzATMsU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6985
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: Thursday, September 9, 2021 5:47 PM
> To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> Cc: Felipe Balbi <balbi@kernel.org>; linux-usb@vger.kernel.org
> Subject: Re: [PATCH v2] usb: dwc3: gadget: clear gadget pointer after exi=
t
>=20
> On Thu, Sep 09, 2021 at 05:32:32PM +0800, Linyu Yuan wrote:
> > when do role switch from device to host mode,
> > first disable device mode, currently there is no better way to
> > confirm when gadget was complete removed.
> >
> > change device release function to clear gadget pointer,
> > this will confirm device stop complete when it is NULL.
>=20
> Where is this check happening?  If there is nothing in the tree today
> that checks for this, why is this needed?
>=20
> Does this fix a specific commit in the past?  If so, what one?
It is only my private usage, it is not fix a previous commit.

In theory this change have no harm and improve.
If you and Felipe both can't approve it, I can accept it.
Anyway thanks for your time.

>=20
> thanks,
>=20
> greg k-h
