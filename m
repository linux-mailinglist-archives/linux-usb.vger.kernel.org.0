Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E95B3EFE44
	for <lists+linux-usb@lfdr.de>; Wed, 18 Aug 2021 09:52:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239343AbhHRHxJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Aug 2021 03:53:09 -0400
Received: from mail-eopbgr80048.outbound.protection.outlook.com ([40.107.8.48]:63909
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239131AbhHRHxI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 18 Aug 2021 03:53:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iVybkMxwD3Xpmju4Plh3WpfqzgCCMjdUeQlnHWLsrwsD4J+kzPVj6vScxOjb7TX1HrX1A3IGxfSmuxWDNZFpWoBq/PbNDSBlZROiUyJ01/Jk9pUHQJVnHEd+oJvrTmk/88gqnOMEqCwhtupazIjGAynowtcw8uI4t6ogdp5ReUj6SAMw2loy/oq814xHYVYYgppOA1cNE+ENkdoVFlvemceuLD2eXoU+CEJNMSiw9PB2xIn0vlmVEszLNL0Lq2uQJwdvRoLqi0lr8oK31Fyj7k8GHshjxqRJ6a9sdxOWLAvQ5/yVWm2BvwBRO+ezPT1rKORIQUgHXnwio2q+sSpn1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGyN4Ag9EhRvcbbHGn+5secUhKcig95DMCDNveTdwr4=;
 b=Xdi/coYfxHRfzQ2gkUT8r6JGweOObWOc5nOyJ/Mo5QEtOAdY/6UdbOn77wiL1JqgmFjiFqX49P7EdYlI0nkTs0lswry9RxTXct3Jrv8ykFaPHkkavKXgYwjatxi4EEBLAFj6O5Fj+HY+9m22VeGPcCHpzBX6FaB12g8kotPXUd9OmDj9jzxardIRwVvT694qPbH/PnEvsGcmCqts8NVgvrt8Ff/iDNApxHMItTvu9eQPKT3ESoIFzLCt1oOS1XrQm2JcyYxUETesVMvgbieJzI/94iJY2cAUr+6A/e8RGj22TSCVYpmG4i/WN8urX1DnTcdOAYudGbUBwbdw1GLVXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGyN4Ag9EhRvcbbHGn+5secUhKcig95DMCDNveTdwr4=;
 b=M8ykV0BLUu1UjitCAejTi2uIYtVKTpFPz/4E7I2q0xNqiJbnEK5R1X/PJVNM9udFDuED2NtITn11lJxrgYfXEKvqGAO4qOXNDm2oWTBM4zm1HgVjESl480fbo/VCfUYLN4JrffvDt+4ijBIPk1a69DASc/Vjus3GWqqZe6OhkTk=
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR04MB6781.eurprd04.prod.outlook.com (2603:10a6:803:13d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Wed, 18 Aug
 2021 07:52:32 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::60f5:9b63:9cc9:203a]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::60f5:9b63:9cc9:203a%4]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 07:52:32 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Jack Pham <jackp@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Ray Chi <raychi@google.com>, Ferry Toth <ftoth@exalondelft.nl>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: RE: [RFT][PATCH] usb: dwc3: Decouple USB 2.0 L1 & L2 events
Thread-Topic: [RFT][PATCH] usb: dwc3: Decouple USB 2.0 L1 & L2 events
Thread-Index: AQHXk9B2SnxDjUL7VUK2JJ/F67P2CKt44GnA
Date:   Wed, 18 Aug 2021 07:52:32 +0000
Message-ID: <VI1PR04MB5935CF921A06041BA8C16A2C89FF9@VI1PR04MB5935.eurprd04.prod.outlook.com>
References: <20210812082635.12924-1-jackp@codeaurora.org>
 <20210818012859.GB30805@jackp-linux.qualcomm.com>
In-Reply-To: <20210818012859.GB30805@jackp-linux.qualcomm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95ec894f-0015-4ac3-bd88-08d9621d22c0
x-ms-traffictypediagnostic: VI1PR04MB6781:
x-microsoft-antispam-prvs: <VI1PR04MB67813266DB070DAD52CDE2E989FF9@VI1PR04MB6781.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rJLW47qri71FXfBAnPWKomMWaHZD+PRSbTonH6wfkGG9+dQt+tg/4P17kwA9W2L/f9wRQbY/tVFk3mwRpITaOP5OMDa9dGq3UfiyuQiFuk4RPLJN4UxdXqpcjbn6cmJnDW6/7ojB0QFCtAimnoT4iVDk/JdLlEE+Rp8DTDvHdEP5iseOGU3zwFifVfL0gYz1Iu1wc70xisj9JY0RZgUCIOaoWD9/uCpn3du+CvJRxc0yekip/EKpr42Uqjwa0QYizHOGDtcZD8FxSK9p5eW800Wsqf2sd/8uh50bGu5u5la5bf82Tl1I8kJqF8qzHfYj4Un8UCFmn/N3gepCMPvYR02hWbS9dO0ZJgQ26XpXqWxWD1OFGw3Ax4XSk1JIZIVspvEfklYNc+wMlklQyVoIiXdt1zabu2AgtYAXzsXzoxJ3ASlLShiEPZYiqEhTpa6GJ3iBmzOb1VQVVjvQ9N1UD2vRdx7PAAnNHlWPDJWX9TX3ks3m010dQQhDA/KXuxM8m5AzK36rYAGJRm8gbqWUcsOIGApTG1dYgxo4UlX+hsNU4erhtPF6FknGI0GQcTogdJtL3bCQfNE7e4/38CcaK3ygrEg8BFB6Xnidms7fK+fhWHONSZcC0m2cWyX+kqIXJAODNADAmxj+07RiwP6KiAcuTSSVWZbYznMnm20+ruVssb1JYhVkuHIKI2YxEoB7xKp9anRJjaRGJjEbx/PVLg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(44832011)(83380400001)(52536014)(66476007)(66556008)(38070700005)(8936002)(2906002)(64756008)(33656002)(66946007)(71200400001)(66446008)(5660300002)(7416002)(86362001)(76116006)(8676002)(7696005)(38100700002)(53546011)(55016002)(478600001)(6506007)(122000001)(316002)(26005)(186003)(110136005)(54906003)(4326008)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1EDS50lGvp27WyzwbB+bfo7F07gSJlg6qLlrvpSMD5hhgZcI4PjJ4BYavv1H?=
 =?us-ascii?Q?E8eQ7kLGQZShOVHsHRMQiFb/VWQtHA/AtvnjhNTlnhYKG4wMp32vTJuFKu3l?=
 =?us-ascii?Q?/2tILSAtrpAt99VyA/AwWtj825aYw/FUp9dZt7bAdJgqiJsFpx/12cvWHtEA?=
 =?us-ascii?Q?qLtgEXlN8ikJ98UXVygsgWT4tjVi3dnSY4iCUjiYd/OouSkSq7N4Av+fi+mQ?=
 =?us-ascii?Q?7KtzEk202L6RtmFxZkutcCKVeS3oUlMROj67LSfixY2YCOsRziI41jxT+u4z?=
 =?us-ascii?Q?Sv0T78AzDTeI0btcgocNZegoaESryQUJ6PKtdItSQymN728zpui0h5a1WOeh?=
 =?us-ascii?Q?X07sfajmILYFMi0IWlL8nLHjpzX8IZl+AAyyVrfn7GqpY5OepS2olnhEk21L?=
 =?us-ascii?Q?IY0D+StJiLcC4jhYJuNtEvpi/TgrVi0mksfAJTV3vYmIp7PPAVjIKv54YjX/?=
 =?us-ascii?Q?vCo7EbESQmpTEGqPQnQibLd+hGltc1TCR7DrJvpasihgJ3XHbil/MQFqaquP?=
 =?us-ascii?Q?jMkR5Dr66EbIIMLUCAadfNspOJOL1XL8gO7BfTVEj7dcYWtjstDjXMztitqz?=
 =?us-ascii?Q?MvfO+KpGt2Dker6rlO0WjG/b97EeXqMNBUWfo8g6qt10QlzQWscyWIv14M9d?=
 =?us-ascii?Q?RmPGMJjNRx3WY/vDmvfOx2t37F+4r/a7Kha4lgtnn6XigTuuvdkUMcb5Nba/?=
 =?us-ascii?Q?7tfAjIkyBhlCmgR7MQlEI4o4b3x+8Ut0MmpuxPtVF121NqW07N7HZ0HON22J?=
 =?us-ascii?Q?0sJBkS4aPnYf5Z4p3XHcKBAFutGqYdieMVnXs4O+Re5C1lo37zLzEoOr6Wrq?=
 =?us-ascii?Q?S6UoQeNiGSxrmbFq8Ldpn0jQJhlfW+N2Xpz7IeD2+4pqyaq/WRPuG70veee8?=
 =?us-ascii?Q?eD4VFtUFd8aL+MS3Dqe5u+Xd6RJkvLZ8QL0Lh6JP+1GoTfD9qIhH/4C8cShA?=
 =?us-ascii?Q?0iEZ2PkuLU97Yf7MiaOTBayM/fHKzKRYNaWwI7vt3yNFlMgxu72RGiuCfsbE?=
 =?us-ascii?Q?3l1TW0QFA1HR9xd2CCWchF98wuCYqqjGM57WnhHuO92Qvmmjd+R0+Gphb4Zs?=
 =?us-ascii?Q?oHnGpEPgTlh037/rIw7ssISONS+x30FFn6QkSxlfn85TSAizKlOuotG4flFa?=
 =?us-ascii?Q?bEl7mS2CFsHGvIjREz9xwHUPuSGVnGo6cSxQoMlsvUCBfB2wTzq5xBNgDa2m?=
 =?us-ascii?Q?WxkuazFP32769WFOyAgXYKwExvIBzkOtwSc8wLUd/ekblw/pJ7XFbpSKCWbj?=
 =?us-ascii?Q?1s7ZgUA/3l8JVtSXZCxMhUJbD41XNJdaenCK7zNYeHjMWjXD9V3r1jdTKqNK?=
 =?us-ascii?Q?v552Rbgpk4hhGkscGQfqrYk0?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ec894f-0015-4ac3-bd88-08d9621d22c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2021 07:52:32.5246
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TkCbPw+a4psiW4uuuiZLBIu0V+N4sCSNFjrArVNskqk/fQRJU85FMRuWkP0snCNd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6781
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: jackp=3Dcodeaurora.org@mg.codeaurora.org
> <jackp=3Dcodeaurora.org@mg.codeaurora.org> On Behalf Of Jack Pham
> Sent: Wednesday, August 18, 2021 9:29 AM
> To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>; John Stultz
> <john.stultz@linaro.org>; Amit Pundir <amit.pundir@linaro.org>; Ray Chi
> <raychi@google.com>; Ferry Toth <ftoth@exalondelft.nl>; Chunfeng Yun
> <chunfeng.yun@mediatek.com>; Andy Shevchenko
> <andriy.shevchenko@linux.intel.com>; Marek Szyprowski
> <m.szyprowski@samsung.com>; Jun Li <jun.li@nxp.com>
> Cc: Felipe Balbi <balbi@kernel.org>; Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>; linux-usb@vger.kernel.org; Wesley Cheng
> <wcheng@codeaurora.org>
> Subject: Re: [RFT][PATCH] usb: dwc3: Decouple USB 2.0 L1 & L2 events
>=20
> On Thu, Aug 12, 2021 at 01:26:35AM -0700, Jack Pham wrote:
> > On DWC_usb3 revisions 3.00a and newer (including DWC_usb31 and
> > DWC_usb32) the GUCTL1 register gained the DEV_DECOUPLE_L1L2_EVT field
> > (bit 31) which when enabled allows the controller in device mode to
> > treat USB 2.0 L1 LPM & L2 events separately.
> >
> > After commit d1d90dd27254 ("usb: dwc3: gadget: Enable suspend
> > events") the controller will now receive events (and therefore
> > interrupts) for every state change when entering/exiting either
> > L1 or L2 states.  Since L1 is handled entirely by the hardware and
> > requires no software intervention, there is no need to even enable
> > these events and unnecessarily notify the gadget driver.
> > Enable the aforementioned bit to help reduce the overall interrupt
> > count for these L1 events that don't need to be handled while
> > retaining the events for full L2 suspend/wakeup.
>=20
> Hi folks in To:
>=20
> I'd like to request if any of you could help test this patch on your boar=
ds
> to help make sure it doesn't cause any regressions since I know some of t=
he
> recent dwc3 patches from Qualcomm have been found to break other devices =
:(.
> So I'm hoping to avoid that even for a patch as small as this.
>=20
> Hoping this could be tried out on boards/SoCs such as db845c, hikey960, E=
xynos,
> the Intel "lakes", etc.  Ideally this needs validation with a high-speed
> connection to a USB 3.x host, which increases the chances that USB 2.0 Li=
nk
> Power Management is supported.
>=20
> The overall goal of this patch is to eliminate events generated for
> L1 entry/exit, so we should see a slight reduction in interrupt counts wh=
en
> checking `grep dwc3 /proc/interrupts` for comparable traffic.
>=20
> Appreciate any feedback and help in testing!

Applied the patch and tested on iMX8MP, can't see L1 sleep event of below i=
n ftrace:
"irq/48-dwc3-557     [000] d..1   264.478691: dwc3_event: event (00020601):=
 Suspend [U2]"
by connecting to USB2 port of my Dell host, so

Tested-by: Jun Li <jun.li@nxp.com>
Reviewed-by: Jun Li <jun.li@nxp.com>

> Thanks,
> Jack
>=20
> > Signed-off-by: Jack Pham <jackp@codeaurora.org>
> > ---
> >  drivers/usb/dwc3/core.c | 9 +++++++++  drivers/usb/dwc3/core.h | 5
> > +++--
> >  2 files changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c index
> > ba74ad7f6995..719dac228703 100644
> > --- a/drivers/usb/dwc3/core.c
> > +++ b/drivers/usb/dwc3/core.c
> > @@ -1050,6 +1050,15 @@ static int dwc3_core_init(struct dwc3 *dwc)
> >  		if (!DWC3_VER_IS_PRIOR(DWC3, 290A))
> >  			reg |=3D DWC3_GUCTL1_DEV_L1_EXIT_BY_HW;
> >
> > +		/*
> > +		 * Decouple USB 2.0 L1 & L2 events which will allow for
> > +		 * gadget driver to only receive U3/L2 suspend & wakeup
> > +		 * events and prevent the more frequent L1 LPM transitions
> > +		 * from interrupting the driver.
> > +		 */
> > +		if (!DWC3_VER_IS_PRIOR(DWC3, 300A))
> > +			reg |=3D DWC3_GUCTL1_DEV_DECOUPLE_L1L2_EVT;
> > +
> >  		if (dwc->dis_tx_ipgap_linecheck_quirk)
> >  			reg |=3D DWC3_GUCTL1_TX_IPGAP_LINECHECK_DIS;
> >
> > diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h index
> > 5991766239ba..356b94a7ec70 100644
> > --- a/drivers/usb/dwc3/core.h
> > +++ b/drivers/usb/dwc3/core.h
> > @@ -256,9 +256,10 @@
> >  #define DWC3_GUCTL_HSTINAUTORETRY	BIT(14)
> >
> >  /* Global User Control 1 Register */
> > -#define DWC3_GUCTL1_PARKMODE_DISABLE_SS	BIT(17)
> > +#define DWC3_GUCTL1_DEV_DECOUPLE_L1L2_EVT	BIT(31)
> >  #define DWC3_GUCTL1_TX_IPGAP_LINECHECK_DIS	BIT(28)
> > -#define DWC3_GUCTL1_DEV_L1_EXIT_BY_HW	BIT(24)
> > +#define DWC3_GUCTL1_DEV_L1_EXIT_BY_HW		BIT(24)
> > +#define DWC3_GUCTL1_PARKMODE_DISABLE_SS		BIT(17)
> >
> >  /* Global Status Register */
> >  #define DWC3_GSTS_OTG_IP	BIT(10)
> > --
> > 2.24.0
> >
>=20
> --
> The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
