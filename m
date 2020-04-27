Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9632C1B94E8
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2020 03:27:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgD0B1E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 Apr 2020 21:27:04 -0400
Received: from mail-vi1eur05on2085.outbound.protection.outlook.com ([40.107.21.85]:6261
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726186AbgD0B1E (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 26 Apr 2020 21:27:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uc3qD4WORaAskU/qQqjBK2zWRvUWs2nj+1m8N3hPgJlzeRxtpeSS3eFA/cFa4Ku4Ylt+6TFgFbOdWaYKIeCZayVN4mMHJBKF2EB6LGc12YRU6gTeLhFnVTmEyqY999Trrua7cMrfC5xQssV8wDMGPMKwj/JriZF/rsUTHbI1rIHm7RNq0HLPLxONuIAu1LsqkselG8XeGXU0SLPEetRMUp5ikdIUjXwbK0tWNrWXxwoGC0u8Mf4tBcF4/w7WEYd8xomhveNuRyZN8MM5GmPzW3aeZfxvr3wU1SEkXmjte9OKmtgjZeowJlSOzp577ZCGAezg6sGxSsgPajpCpdOigA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYE0ty6JfuZ2J6e9eGt4zIZN5dhTquEvr2smA/pV9Z8=;
 b=a/X9sF1ZcAuKJ5CO0XVx86zxUq0rvJEOdjhjqo1blxpWbXYo6444MDTxKRC0sBNry3ZxTFW58VOtwzgaA1uxGl5zm/OY4395pnTQ8YmEsmxMgxhdwBlSqMZh42o5sPb/lXStrHWxHeUOzgFY7m/ojtawlFQc1k4VdM7tDOeb5usd0/OBbb2z96z90QE7m6rJsItJEx79NPb47dBP9cIsnLYao2bqVXVj+u4k7R1KkYn+9d13xtLJaZy1iSi0f1nm7IA7cjxW3dzKCa683hYaluGe5FpseRR6qSUtq9ehljFM5AffDObX5ffyuC+kJd5eEM73ZgI9n3fWcHuPvCE+nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYE0ty6JfuZ2J6e9eGt4zIZN5dhTquEvr2smA/pV9Z8=;
 b=P9hsMYQd66tqpHRcYF0NieFt5g49Oo2ureyM6ai6XCFQtCVova+Z3/WnV28FSc64gQJWaa+pY1nV/ltDTNsYDNb9FBw/0MRzhVKy/uV3b1f7UzM/R318pd3/zeyG6v3ywDSLBGkO/wBMHhtci6TLLi1HctJmVYyUZ4ssyxcC3/g=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7160.eurprd04.prod.outlook.com (2603:10a6:20b:119::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Mon, 27 Apr
 2020 01:26:55 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792%7]) with mapi id 15.20.2937.023; Mon, 27 Apr 2020
 01:26:55 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Andrey Konovalov <andreyknvl@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: Testing endpoint halt support for raw-gadget
Thread-Topic: Testing endpoint halt support for raw-gadget
Thread-Index: AQHWDo6rdpCZvdzu4EeBxUSOSG5p0KhxgSoAgAD2yoCAAAs/AIAZxawA
Date:   Mon, 27 Apr 2020 01:26:55 +0000
Message-ID: <20200427012719.GA6782@b29397-desktop>
References: <CAAeHK+x5-z85v97ySvX+5=sJTn=hVbpkbCiQBZCD-6BKvKPSpQ@mail.gmail.com>
 <Pine.LNX.4.44L0.2004101136490.15021-100000@netrider.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2004101136490.15021-100000@netrider.rowland.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c86319fe-ea83-43bc-e6a7-08d7ea4a1252
x-ms-traffictypediagnostic: AM7PR04MB7160:
x-microsoft-antispam-prvs: <AM7PR04MB7160D55351D71298BF19DE858BAF0@AM7PR04MB7160.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0386B406AA
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(7916004)(4636009)(136003)(346002)(366004)(376002)(39860400002)(396003)(66946007)(4326008)(91956017)(76116006)(71200400001)(2906002)(33656002)(6916009)(44832011)(81156014)(8676002)(8936002)(86362001)(6506007)(53546011)(4744005)(64756008)(66556008)(66476007)(66446008)(5660300002)(33716001)(478600001)(186003)(26005)(6512007)(54906003)(316002)(9686003)(6486002)(1076003);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 37Ab6RJAIGH0vU42a7fGNndc9YrZblrNNeN1SnRUDNz4jDWpbweYN0vMKFLz2h7yl8+nQN7pi9fQnTXkVZOmtOgH3pmD5p7iN4Bpg/V1sao5NObSq0KWC44IEZ0KyI/p0cmtVH6Bs8Me8Idynt3J3cB/lKMCidniO/uLJ9LvOjHm1+ZCZ+xjlsA433dCmtXhgjgrZvQhtw9E/Z3F7sLDdnkVKMVPQ7zxiEj8KxTzKw3GbaHbbFiUDUOtUtE/IxsarA+AOULYWfeiS8aCjVz4eYD/hVKqdB3q7kJUSYA5++zD2ml+9BQnLGFqca6uERc9nh1o+/GXl6Q3mYkcgxOdYn4FebYWCtm1Nt67bLu6zlvSTZ4dbznlw+7kXdiovsRK1PfeqTGMFu49EQUdTkADACYHoFPf5PE0oqPKE/XT6fYZGSuxejZxibaDlW2UMsnm
x-ms-exchange-antispam-messagedata: hN4jNFU2VgqXcigjX4xt/3eYjVBdRXIuDxkaXvaARjIgwRAA3HsgvapfAPWVnLBDfhsk2c2pTd4059iCYyrbDhbdSU+WQNyzPfVATvR535l4Ytgclv5rZqOvlU9WJ7UbWjtYrYBUJAww0qi4tXUBKC4nNbcX61MjqW0AoOMamZSFuLHGB0yvrZk/Ruldo9xXDAmmsGcTZyVL2mYeJcGt0X7rMWogurWUWVe74uA/DJanUdCCWKY2n2nB9J8A7jTwg+4rGm6MuAKAg6w/gEOou5DIv+i5c7Odc1t5rcaNZ7ydMco39RynleY/qWufjL07R41BVXXSBVegHgAjX1jZcOwLT2x8x6FHkG3pFAN0BURBsanJ1Ofz5DzHoEGkNKP3FS9dwxhV5Kd6RMFk03caEtqAnxUY28lwdknO3XHbgsOmiId+jO1AlIT6B3equVRCHNACs8QIceDwMR+RJYguZMxkCAGtqCJPACyj1YkYiDMA7dfKmu5XxGM+DXiqNZmeA050fIU5XjP2MgtVapdpiYmhL7+NZfaG3q/XSoQ/QyPjHPot0yx5re+8JMnBx3jzXfCLSxxyGO1e68iXcShWi/1iWpCpZ3jwbW7mZcshNXGjugZGNYoe2YufDpMQtkSjdJpiU1PIm/9gZI4pfUcOzskYF9s4A5HGZAV47A0b2/CIH7g0iLnpJcLCbPDZXY77chclvHFaqS4KObYyI5nTH4buRIacBL6kunldec5DwwA0ThrXk1eE1yQ/aSZBPwZ5ejX8kq26W6nhsgNzXqDUOyeoV+BZQdNEpTswxarmpa8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C2511DCB96A2EA44BEF32548C6395378@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c86319fe-ea83-43bc-e6a7-08d7ea4a1252
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2020 01:26:55.1629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Msrze3El2or23vxAa/oLESbUf5Waj/96LdnTKFw7AbeijEnvMBDmWqT8xn7lJbtL96w2KaZ+zsj8DRZIO7ufig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7160
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-04-10 11:53:20, Alan Stern wrote:
> On Fri, 10 Apr 2020, Andrey Konovalov wrote:
>=20
> > On Fri, Apr 10, 2020 at 2:29 AM Alan Stern <stern@rowland.harvard.edu> =
wrote:
>=20
> > > Have you implemented wedge as well as halt?  Wedge is needed for the
> > > mass-storage protocol; as far as I know it isn't used anywhere else.
> >=20
> > No, I didn't know about "wedge" at all :) Looks like the API for it is
> > really simple, just usb_ep_set_wedge(). I'll need to figure out what
> > it is and how it works, and I'll send a patch that adds halt/wedge
> > support then.
>=20
> usb_ep_set_wedge(ep) does almost the same thing as=20
> usb_ep_set_halt(ep).  The difference is that a Clear-Feature(halt)=20
> request from the host will un-halt an endpoint if it is merely halted,=20
> but it won't un-halt a wedged endpoint.  (I don't think this is=20
> documented anywhere, unfortunately.)

Hi Alan,

It is documented at drivers/usb/gadget/udc/core.c, function
usb_ep_set_wedge.

--=20

Thanks,
Peter Chen=
