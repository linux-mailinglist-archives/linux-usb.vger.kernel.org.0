Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 521B0227DFE
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jul 2020 13:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729448AbgGULDK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jul 2020 07:03:10 -0400
Received: from mail-eopbgr60043.outbound.protection.outlook.com ([40.107.6.43]:23430
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727043AbgGULDJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 Jul 2020 07:03:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWtylFKNY6Gs5E3uZe17E2tUNPUvLKlnpFwmeqGH7NFVGapisKFjCEhA6MGU8UUrEuP7VrMpsPDPVHsmad0m6ihfzzgAu3+keeOvnISBE6h5nyEqnNofJQcIZoMpU73qEVR341dUUHD/poOLkumRzAQnz4v3DTqeCQwF+vPAxFt22tbrWDnP2VW4WZK6J8QxqTB5HeZ6UfSAy+qbHpsS279Rr7Z6exgkGib2SJ0HD2A5ZEWTvGsRzNOf6pKqJkPuhYz8IerAXXKSGNHc1Ulb7AHdnha2GmZg3cvY79fGfA2xHbpHfXR8L3SaiTd33F4Prm5K9bsajbRfLNKkknPTNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lm7YF0EeX7/CRLEy7V6aq7T+obj266hhdsFPxfGuICw=;
 b=hjEZWOdDceNUJsvkmDyPcf4QC+I29mSa0I6/8Chx5XxPzBHZODojrBeYBQnWi65xan0el9aUcADDSy6lUtfjyT2yJc90xsAuopDC3CWFuqGqhuMA+ygi4LlU0WwyOF3WnbjBHBXKbtmOwUSrYfgbeFHQubL7z5c4inBzdmSBRNmjz+o57mSYuVrfNHXCFGU+81w2heAVa/Eadqv2DwPoeAF3yScOkHacVHIru2YlqS24Dc1w1o0ahbkP9y8PfSwyDFC1wpfel6Y7OLdc6pP9Mxoy1CeJj1lF8sOB5CpLpZgB2nrW+BdPD1fenmOnOcrnNobuBkTkcgKbNi9B+gLUiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lm7YF0EeX7/CRLEy7V6aq7T+obj266hhdsFPxfGuICw=;
 b=r3c5ILLfm6K63kjHmtpWBV775FyQFi4aMI4YHZfWvNQqizQck3/x28fui/UkKMDr13L9kDIApRneVtWz0OrUzZiHYmygpG4wOdT0hC8oGxzrMF//qAzJEm1rgstlcwgz/QdinRDYHiL+x6MLlCWnHii4CZUTNIiQQEXQp6nHF0E=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7000.eurprd04.prod.outlook.com (2603:10a6:20b:104::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23; Tue, 21 Jul
 2020 11:03:04 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3195.026; Tue, 21 Jul 2020
 11:03:04 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH 2/2] usb: host: xhci-plat: add wakeup entry at /sys
Thread-Topic: [PATCH 2/2] usb: host: xhci-plat: add wakeup entry at /sys
Thread-Index: AQHWUQLEv7puXBnz7kavmyMm4fC5l6j159KAgAE/joCAAFrnAIAAv0sAgADOc4CAANPw0IAA3ViAgAChxYCAAO2QgIAA9LEAgACKIgCAAO53AIAAoIQAgBKcgoA=
Date:   Tue, 21 Jul 2020 11:03:03 +0000
Message-ID: <20200721110255.GA30348@b29397-desktop>
References: <20200705021256.GA29527@b29397-desktop>
 <20200705143151.GA672371@rowland.harvard.edu>
 <AM7PR04MB71571A625BEEE70F2D9B3C138B690@AM7PR04MB7157.eurprd04.prod.outlook.com>
 <20200706162237.GC704149@rowland.harvard.edu>
 <20200707020137.GA5373@b29397-desktop>
 <20200707161153.GB740256@rowland.harvard.edu>
 <20200708064740.GA18440@b29397-desktop>
 <20200708150204.GC776368@rowland.harvard.edu>
 <20200709051534.GA17510@b29397-desktop>
 <20200709145004.GB818352@rowland.harvard.edu>
In-Reply-To: <20200709145004.GB818352@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rowland.harvard.edu; dkim=none (message not signed)
 header.d=none;rowland.harvard.edu; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3a5a0d28-c68f-4a12-7645-08d82d65a41b
x-ms-traffictypediagnostic: AM7PR04MB7000:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB7000A21949C298D52F188A308B780@AM7PR04MB7000.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xwMxfRktHJk/EYmOVVwANnQNfUykswKAeGHXLjNUFV/sqWemhClHSI4Su3EJVxbEItFml2FIAgz5GxleH1tP7Jve5SeK6+WMdI8vK8fF+GUd3baYwYZwqAfR6/kvlEfsC/UfgW6pPejDYXfBSn7A7vibkLiKc+kQljbJjnQAW0uGI4d8k4XsyxPv1saeS+r5FoqJK5aRn34Y7NNiH1GK1h/vqTbk9k5rp+aQmXKb0dAcBpSjwL3uMcgtz2iPUuB/kVUMgHzzHHlyqi9D/ShBJdTSv26coW7g3c4UnH6F2HIYiMdjT3LzhyFuhjJcML64
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(7916004)(366004)(136003)(39860400002)(396003)(376002)(346002)(66946007)(6506007)(33656002)(91956017)(4326008)(44832011)(1076003)(316002)(53546011)(33716001)(83380400001)(26005)(66476007)(66556008)(6916009)(54906003)(64756008)(2906002)(86362001)(66446008)(186003)(8936002)(5660300002)(71200400001)(76116006)(478600001)(6486002)(6512007)(9686003)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: mp62gGqnkfj/Y060i5YXELogIPUSw76iwWcbP4nmORau7/CHdBJxi4ooaYp1t50/C9J2yoLwJnX2ZafuNq1x3XK5d7mMSWa4fIRitZnfq4E+eq02eGAEymAmBdmEEgAMqjm0+2QjkXSV6ILAsDp7EYKIEGWIXl6uLDivezeizvfkuoNiI5vWtmmYjW0KJB6EpCEYXgs+DPffeV2QFIZILVWg8AmgVrcICoYT+beAA4g7Z091O3HBnuj2Qy2ugzoqNLEwJ7PjO/JLJ9DO+kmUbYrP4emDIjycN1uj5BEX0XUHTLhBcaxXe3FYFubX3qYGtbFW6e5U4tap9zZoM4IgEGFKRpV3rN/FJTDn06pwv1H7S4/eZUrKYWS+Vx9zD14D7W4xzSBuBTDPE5KAvQq8i1O4MJ1UWfZ0YPHvEbo6M1RPveMMpX/O7u4/HDbArC5OU2GCTC5lh8S2ie1SWKGgAHNJ+w6x5K+xdK/Vg1wMCKI=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8EDADEBE087B8F458FE2BD57E6244D97@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a5a0d28-c68f-4a12-7645-08d82d65a41b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2020 11:03:04.0398
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SO7fnERp3RkQTujW8B1wgEOR+/il7aid+yO2h2+TVSQbV5zHaJqzA3vFDjU/3xlJQtOW7gO7hRs5L/+k8e3/6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7000
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-07-09 10:50:04, Alan Stern wrote:
> > > We want to make the system simple and logical for users, not necessar=
ily=20
> > > easy for hardware engineers.  This means that wakeup events such as p=
ort=20
> > > connect, disconnect, and so on should be controlled by a single sysfs=
=20
> > > setting, for a single device.  The most logical device for this purpo=
se=20
> > > is the root hub, as I mentioned earlier in this discussion.
> > >=20
> > > As a result, the wakeup settings for the other components (non-core o=
r=20
> > > PHY) should be based on the settings for the root hub.  If the root h=
ub=20
> > > is disabled for wakeup then the non-core hardware components shouldn'=
t=20
> > > generate any wakeup requests, no matter what their power/wakeup files=
=20
> > > contain.  And if the root hub is enabled for wakeup then the non-core=
=20
> > > hardware components should generate these requests, unless their own
> > > power/wakeup settings prevent them from doing so.
> > >=20
> > > From these conclusions, it logically follows that the default wakeup=
=20
> > > setting for the non-core components should be "enabled" -- unless tho=
se=20
> > > components are physically incapable of waking up the system.
> > >=20
> >=20
> > I agree with you that the default wakeup setting of core part for host
> > (xhci-plat.c) should be "enabled", but if for the dual-role controller,
> > the wakeup events like VBUS and ID do not related with roothub, we can'=
t
> > set core part for controller (cdns3/core.c) for defaulted enabled, and
> > there is no thing like gadget bus's wakeup setting we could depend on.
> >=20
> > Besides, the non-core part (glue layer) somethings can't visit core
> > part, we had to depend on itself wakeup setting, but not the child's
> > wakeup setting.
>=20
> All right.  Note that almost everything I wrote before was meant for the=
=20
> case of a host controller; it did not consider what should happen with a=
=20
> UDC or dual-role controller.
>=20
> It seems like the best answer will be to call device_init_wakeup for the=
=20
> core controller device, but not for the non-core devices.  Or maybe call=
=20
> it for the non-core devices if the controller is host-only.
>=20
> Alan Stern

Hi Alan,

Since the controller's wakeup setting (PORT_WKCONN_E/PORT_WKDISC_E)
should be decided by roothub's wakeup setting, then, why controller's
wakeup setting could affect it at current code, does the controller
device may affect wakeup function at some situations?

int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
int ehci_suspend(struct usb_hcd *hcd, bool do_wakeup)

It suggests the user needing to set both controller and roothub's wakeup
enabled to let the wakeup function work.

--=20

Thanks,
Peter Chen=
