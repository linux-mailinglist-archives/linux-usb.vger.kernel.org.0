Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 021371BD2D4
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 05:15:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbgD2DP1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Apr 2020 23:15:27 -0400
Received: from mail-eopbgr60054.outbound.protection.outlook.com ([40.107.6.54]:18110
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726560AbgD2DP1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Apr 2020 23:15:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ntKCn98PANq4drKL3l86zU5+18A1p1OQuOypU/YONcPKSOZDRZQBmVBDZxqx2NkpfhOMPeZGujsQSx166x/inJFqDCjJbifn8lkoKd18NhmcNPptS41I6D1U3b5n+HwrnLcmm7aJ4Lu9Gc1tZ9vXYg5yJdCLsU829lwCduJ1AMVChYHb12HS9AunKEVgCW4BCVyIl/4eLANmcarvaQ5G5dFKpnK0BGn9401P9rOc03DHZOI/1RJKavvYFL3VFJmK8eEbvhYg68GxO8WYo0MiKFI8xefjmCteB7ShARqiccS2LDyNLlMPfEmyYkOPjFnELTAhAi3MjEM9i9X5mGrjEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsa9dz3vd+w9UkzOXpHj1Lvl13XcpZbDLPVVNi8z4NM=;
 b=liqkVMBShzR5r9rbEmeeUnF/DcC7l7QLsNNkRr9RO5AhwCNUFh3jCwPS0UDvJi73q41V/s40O6NEwpdgFCH8RDhNw5XzNDMggrc8uPt5oGra7ZpFpUHXzXGurVJ26ldyJcRHDNg+SS4JMOTKWY+9y7/FLS7aDbUdu1kR6RG/a0iQPzk7jbadzE4BQLFCnJIvgNj9BSYIgcm2x9MVzF/G68S1884qXmbyOgn9r8Yelc/0pyeC3VIl122z1U8ZUHQd6M3VVGXglG4iSs8SkwMI7gJitqhfFnI8vG+8LrRIZPdw1XBUIygSpykx6WnQdC3Ci7h3fLGf3KrmUhEvVl94yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsa9dz3vd+w9UkzOXpHj1Lvl13XcpZbDLPVVNi8z4NM=;
 b=kOyv1F/SSLSAnvxiutavobf4tOxhr5fAMJ8BMNHxEkUSjrLWTQqC2CeJO6mNkDZbSqcshVI3roKfvb3qwkq7KnxhY64KmiUjw75Q9lzt+SOvBu8bWiIJcuE3YJXNZodmbyeDHY/uTt6lo9Xad6gX6v1w8/ZK+AwKaMZFIS2mud8=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB6869.eurprd04.prod.outlook.com (2603:10a6:20b:dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Wed, 29 Apr
 2020 03:15:24 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792%7]) with mapi id 15.20.2937.026; Wed, 29 Apr 2020
 03:15:24 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 1/5] usb: gadget: Introduce usb_request->is_last field
Thread-Topic: [PATCH 1/5] usb: gadget: Introduce usb_request->is_last field
Thread-Index: AQHWHOMWqMCgbiXkIk6n6QhvkyzwnaiPbzCA
Date:   Wed, 29 Apr 2020 03:15:24 +0000
Message-ID: <20200429031549.GB20222@b29397-desktop>
References: <cover.1588025916.git.thinhn@synopsys.com>
 <456f864b86a72ab9490ce095d5ba3f59b39d6a09.1588025916.git.thinhn@synopsys.com>
In-Reply-To: <456f864b86a72ab9490ce095d5ba3f59b39d6a09.1588025916.git.thinhn@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0a3c81f3-109e-4f3c-21dc-08d7ebeb8ed8
x-ms-traffictypediagnostic: AM7PR04MB6869:
x-microsoft-antispam-prvs: <AM7PR04MB6869260A2AE702330E9F08C38BAD0@AM7PR04MB6869.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03883BD916
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(7916004)(366004)(346002)(376002)(136003)(39860400002)(396003)(1076003)(33716001)(71200400001)(6506007)(44832011)(5660300002)(53546011)(33656002)(2906002)(316002)(54906003)(66556008)(66446008)(6916009)(91956017)(66476007)(66946007)(76116006)(478600001)(6512007)(6486002)(8936002)(8676002)(26005)(86362001)(186003)(4326008)(9686003)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hwbcpy87Sae8/lYXUMMwuDe1dWWkJbevF/e0eM1swZ5ZhvFmKEYn37C8qHU8nnL7DiQw+Uahw9Oxr03Y7BfaQgKkx77aOd47Vr4RXfk8xk29bGFhAPIqG1/lHi30/Cd4BS/xe3W/c+Cn8LxlSMCaiJEWTdbBT8Ajt0oQK+Ob/SmM1tfYzmI5B63Ms1Ai6CMpT/J2DKQP+JZbMyGUizhknCP6qzUMn4kXtYBm2MRlUf0Qy3vcDaFF4uafa+BCIS3OE4MFoPo2an33f6W2fnLf//la9mAx6bGQ9x31N/lWtFDvcdr+dTpgsiU4Zgux4OqBNAqhWmGo3C53wzUW3W0IKMVqXlNE72mwbs8V1XGoLRL12ufBJHIS+o+FobYvYxhEvzobRp1P71XKb8+Zuox9NsshqRtz6Pf2sqIHjD6pKscqZWTNzTdW4AFBvi5tghDw
x-ms-exchange-antispam-messagedata: KrwZmz6AgApyyZDvrksFG/byWt7vK+pj5dKIY6pmqQ8pegcJtHWL729GvxkimikjEuMOkbcouBkl81MSxjqx/Unh1Z7odZrbs0B/oWL59VBd4lvGUw91EjEKBaWE4SgUfiPIPQNxCteYZWNfqjKA9alewnipeYXJxf4YIwExspHWtJ5kw59dPLwVpU5ZCG47N1cq0OFI9IDDfLixdfS8a+yQV/3/gQ62TOfzj1cXRohSYaxb/Gk2Us2dRDyLc+SzQE12KDtKdUANZeX41r1f4s1OwGyKFX2wRMoGQ8fvrNWJSaxcCVDuiLWhYK5S5VWgJzGmqI0Fs9JHFM9Qmd2vllsLHl305dVUET++ZTUMXZgMp8W7eGxMAKamcYJgoEeh3thnE4T2Wi7pFwmsJ4Iz53SBQUrpLUY3vRIeyLcWUj3uJpLR6c7uK7aAQRP5lzvc9jcTYH2PRITdgV2W5duxfxmFW91fVmpWMP30c+fopVOwQd4nsr8gBVzOdSCg9w2KBkR3SFsKw5Q9oeRlPHZmARhzmStG1HGa5YiorYH6/00mIU8vdWD4KzUSjOlWKfjgrkxGZbR/CoKkymoztWVHI4BtvXFTLHs9Yc6JprrSJO8vpEBpi39dmWssvKRJz7GTVeH5j/BZkgJN/ET+h6dvdUsbZBLBB0MdC3umt2Iguud5tInk+7kQztyv1kd3edkTuF0pJ0aVLoR1WaVy9TdGqyKGPlhXLtq9ZBKwPZ3mNPmGpERZUV1K/5WGvJMUbdNPlTlfnqZBHXFBgnYRN/hzyMYFcNhcbl42kzU5pBJLsA4=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A345A42C86BD574DAB236AA509151D4E@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a3c81f3-109e-4f3c-21dc-08d7ebeb8ed8
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2020 03:15:24.2018
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yv3dxHztIrBoUDRI3YbeaMAQ+pqsk1O2o2ffnn6jJWMA13HzAnyN1XNyRSMuJdBKq0BH+MJjN7fuk5TBuccIZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6869
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-04-27 15:27:41, Thinh Nguyen wrote:
> A transfer is composed of one or more usb_requests. Currently, only the
> function driver knows this based on its implementation and its class
> protocol. However, some usb controllers need to know this to update its
> resources. For example, the DWC3 controller needs this info to update
> its internal resources and initiate different streams.
>=20
> Introduce a new field is_last to usb_request to inform the controller
> driver whether the request is the last of its transfer.
>=20
> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
> ---
>  include/linux/usb/gadget.h | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
> index e959c09a97c9..742c52f7e470 100644
> --- a/include/linux/usb/gadget.h
> +++ b/include/linux/usb/gadget.h
> @@ -50,6 +50,7 @@ struct usb_ep;
>   * @short_not_ok: When reading data, makes short packets be
>   *     treated as errors (queue stops advancing till cleanup).
>   * @dma_mapped: Indicates if request has been mapped to DMA (internal)
> + * @is_last: Indicates if this request is the last of a transfer.

Would you please describe the use case for it, and what's 'transfer'
and 'request' in your use case?

Peter

>   * @complete: Function called when request completes, so this request an=
d
>   *	its buffer may be re-used.  The function will always be called with
>   *	interrupts disabled, and it must not sleep.
> @@ -108,6 +109,7 @@ struct usb_request {
>  	unsigned		zero:1;
>  	unsigned		short_not_ok:1;
>  	unsigned		dma_mapped:1;
> +	unsigned		is_last:1;
> =20
>  	void			(*complete)(struct usb_ep *ep,
>  					struct usb_request *req);
> --=20
> 2.11.0
>=20

--=20

Thanks,
Peter Chen=
