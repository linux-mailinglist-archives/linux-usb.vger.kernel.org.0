Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 348FE232C9F
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jul 2020 09:32:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728697AbgG3HcD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jul 2020 03:32:03 -0400
Received: from mail-am6eur05on2085.outbound.protection.outlook.com ([40.107.22.85]:49696
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725892AbgG3HcC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 30 Jul 2020 03:32:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqVCJpPzngLEBdY4olMzf5WiDNTct9aYMYXYgQKBA4CJS9glLTmINxtISl+loq0oq0XV7ghtGCmObFKhLO6weAPzyMqF+5Vj81y6Dp8Sg5FgPnJGRMuLbrHJ6E7KOuVxXjih46Eyg0wQihXjbXGam8iMzGXEgvFaISKBTWis7mQOtrPyXOc6dZR8h6j5nViwhw11mHXK3uKyqGkcoAc4837P13uVZoVUM1li7wxcmKfogOAA1DtjtixtNpA29wh0BpQzEEPeGOYAnSblojWDWt9BQOJdktIE4+4ms1PzKzxlFWBLKqPDjFsmO5MIvfAhNTm6nnmOAxR+95kB0DJPNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVHz3jQTF2JzNNPxf01jAN6qKWxCk6vbzFCyXNodKQ4=;
 b=P5RWv04h0VAXkLgiG66m1c+epYFjf/XisVflSdLeBhSDUdUWm6808fMRYHPw3zapVS8GkJQVoOTLWWnD6sYh9gaHYtzqVgeUnod2OJpSijz+KoblcaWKR0UdCddTSozlARetWrEd5PWFD7PdPbpbIqHQrpvYyvp2wyxpWGYWqpyOs6SZ21AlWVRsQ+QUv3scZkmoSa6C/p8MH0x8MmJaeNjOmBb/yrYmBF36/V6u3kuX2H0a1/8qzfmoqCyd8/MLBj1I96MCbsT6XJ1RwCeSo0eK9ZgrRzBHYZUq318gN26jg123kAIqmr1FPHsx/f8+Z1Tw9oHzF2wx5LIyeKNZNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVHz3jQTF2JzNNPxf01jAN6qKWxCk6vbzFCyXNodKQ4=;
 b=Vt4P8i0rrfkWBEj/j/oZFrVLbXDT5LiFTVLy1Kja0cRekIjDkBhIzsEpcIM3dfR/BwKUk4GdwKioCPcx/2OMEvAQexKbCuP7JFep1NuDWFJzdcQI76HcdT7CarSDfs81liTOXjNTHGPRqY6pYhwLzP/5BCxKpZVvPONIrHfdV1M=
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
 by DB6PR04MB2999.eurprd04.prod.outlook.com (2603:10a6:6:5::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.27; Thu, 30 Jul 2020 07:31:59 +0000
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::8a7:786f:91a3:1e1f]) by DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::8a7:786f:91a3:1e1f%7]) with mapi id 15.20.3239.017; Thu, 30 Jul 2020
 07:31:58 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Greg KH <greg@kroah.com>
CC:     Alan Stern <stern@rowland.harvard.edu>,
        Roger Quadros <rogerq@ti.com>,
        Anton Vasilyev <vasilyev@ispras.ru>,
        Evgeny Novikov <novikov@ispras.ru>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        USB mailing list <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>
Subject: RE: [PATCH RFC 1/4] USB: UDC: Don't wipe deallocated memory
Thread-Topic: [PATCH RFC 1/4] USB: UDC: Don't wipe deallocated memory
Thread-Index: AQHWZeX+sOparEfj/0SX/jVZ2loWAKkfdvoAgAAfGwCAABM4AA==
Date:   Thu, 30 Jul 2020 07:31:58 +0000
Message-ID: <DB8PR04MB7162D3E8F721DCCA942EB2158B710@DB8PR04MB7162.eurprd04.prod.outlook.com>
References: <20200729202231.GB1584059@rowland.harvard.edu>
 <20200730032744.GC26224@b29397-desktop> <20200730051904.GA3859261@kroah.com>
In-Reply-To: <20200730051904.GA3859261@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kroah.com; dkim=none (message not signed)
 header.d=none;kroah.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e11b9a0d-ad95-491a-babe-08d8345aa4cd
x-ms-traffictypediagnostic: DB6PR04MB2999:
x-microsoft-antispam-prvs: <DB6PR04MB29991744D56BB715157863088B710@DB6PR04MB2999.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /O2TSG38yaXpXfhPNWUutEc3KV0xSAUWHPfPXJYIEV2mMWeSCo+f52GJ58/F2YkxLET3SEmhcH4mbybokgTy3tQ/wBb2ErkDDU7ezg4zajpKeMoIBfWOjHiruhuhn9Ee/UrmWSVVNvs5p8knOzNxgDumPJUzbU2VNZWiRS5JoXAzPFnefy6PqUSlWU7JqnqZJLIQs6xck/S7jVgI2+THR5i1G/tuUrsaGoaJDHxN6oRthXRvkvqJmcvPl0hTS6NtGNyn+kdLZtVCz/xGei2WMu1pjtdR3s7uz5zCFTREcoIfBRY5kgQygXs33b1oQS4iIQJdPLTSxMaFRc7CYgzuXw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7162.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(136003)(346002)(39860400002)(366004)(4326008)(86362001)(2906002)(478600001)(316002)(33656002)(6506007)(54906003)(5660300002)(7696005)(6916009)(53546011)(44832011)(71200400001)(9686003)(186003)(64756008)(26005)(8936002)(66476007)(76116006)(8676002)(52536014)(66446008)(55016002)(66946007)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 9RE4KW/Nk9eOWXC8AVqR/9geHqDJtYvAWzFdg3suxPO4j+WFCpbAqK/2XfYscVjtSRLR1pST8C0j0In2oz9/iXTE6Sbi5LNbUdsUDQ4vJ3YqC6UKEMHgA8IrLrcE5Abn6iA9Z0kZt2gPAnBscgrvVqOkXDcgytna6G099fez4OA2dtVLoOEhes9MGZD0bv4hePzHsArEds0f1X8o43qElihnBWo+YOjaMCm4/xxlY3ocp3sv66L13hTQnqf09/NzrN02w5g0eFHVIYg8fIsYEi3sirIE7wEoaV5thd2fZ/e+FAWMmpmiS4v6llgrMCT9Vw920Wm1nbi+SOW6G4xNGzf1xbrHnjWPWUI33QpHQMTPNfiT3LqZV3vIzNbAozSRQd+fdxiD/m+Pd8kDUruOyOrVSmJcMTcIxlbdm4Q31LFPDUsMBHO+XLcjF8p369eaVVv0PEih+rUSS/DV7ObWX3KmaOX9C/2lYeWJUwJ6cZ8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7162.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e11b9a0d-ad95-491a-babe-08d8345aa4cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2020 07:31:58.8526
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ipQY5hzYfHJboCIubir/W/bKnLSf/raJmh9bgE1tGh4tNOhFE5eKGRbq9XWpEJbCKk+zZd81EiFdVop8n9rNCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB2999
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
> On Thu, Jul 30, 2020 at 03:28:09AM +0000, Peter Chen wrote:
> > On 20-07-29 16:22:31, Alan Stern wrote:
> > > Abusing the kernel's device model, some UDC drivers (including
> > > dwc3 and cdns3) register and unregister their gadget structures
> > > multiple times.  This is strictly forbidden; device structures may
> > > not be reused.
> >
> > Register and unregister gadget structures multiple times should be
> > allowed if we pass a clean (zeroed) gadget device structure. I checked
> > the cdns3 code (cdns3_gadget_start), it always zeroed struct
> > usb_gadget before calling usb_add_gadget_udc when start device mode.
>=20
> How do you "know" that the structure really was properly freed/released b=
y the
> driver core at that point in time?
>=20
> That's the issue, even if you do unregister it, the driver core, or any o=
ther part of
> the kernel, can hold on to the memory for an unbounded amount of time, du=
e to the
> fact that this is a reference counted pointer.
>=20

Yes, I find many UDC drivers have issues for that. The UDC driver's .remove=
 has
no sync with device reference counter for gadget device, they free device p=
rivate
structure which contains gadget device unconditional without considering de=
vice
reference counter for gadget device.

The UDC driver may need to call get_device/put_device for &gadget->dev to s=
ync
with device core, and at gadget->dev .release callback, free the whole devi=
ce's
private structure. So,  a common .release (usb_udc_nop_release) callback at=
=20
core.c may not suitable for most of UDC driver.

> So please, never "recycle" memory structures like this.  The documentatio=
n for the
> kernel explicitly says "do not do this!"
=20
Yes, "recycle" memory structures have issue, but at cdns3 driver(cdns3/gadg=
et.c), it does not
use the same memory, it always allocates a NEW memory region for device str=
ucture before adding
to device core.

Peter

