Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF421FFFD4
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jun 2020 03:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730424AbgFSBmu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Jun 2020 21:42:50 -0400
Received: from mail-eopbgr70047.outbound.protection.outlook.com ([40.107.7.47]:39246
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726478AbgFSBmt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 18 Jun 2020 21:42:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HUEstxaXdR24wiv6W1ULcSuX2ocHA3qgIAD5Dh/wOgvVGVhnb0IVrsTQ2dViA6SAfKnXdFr+T1Z2/ziS2495HUmRBxah2puiQlInYGdcJg8+2mgoinvPpkK0LB6VDNUdiYDMdmPAfSHF3VGICitfQTWqM4lBfepG+lNaQeCC2UtsdKMv8EEsc08IuVljoY1294xYU0eSxbXntnB2cCexIYHUhVFYbKB5CoPkf2PF6wq0FOIpcoJXiNF4cXPCGgqIUzmSaRMCxcURPE6RC+mx09rB9RKr71DDB027NyG8zq1YEQkLUaZTKAAGWcvbZ3jFnUjAg3I8GtX3k/THKKB2fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MqY/b/CuYCzo78qPiVE4wP8WR/PDx2ONs6/MITwURwM=;
 b=RIJsyTERkB+K2MxBw7y1HxyK0CkeH37XJIb3qbUJnUlJ7vMskJFQpY/GZkfB9OZd7xvLVWh5SSud8FWBoAbVYzb/8t2IC6UOjPFcF90GNlCAWZgmTFLz+1cKxx2y3NaaA1UUaZoZvKkqV9B9HqDxpsnjp8unzki2NpjbZVSrzSE90X8fRHyEr7NMn9TK7jtTQwnu67+zmKpGibpgyZpyo6OjQCFccQfMnoaWzRjOi+dQCBJOdQvtAoZV3oxim6qkZsPa+qCWWRCa7eV02jwzwo6zyovK60NsKEqi2dyhEsxSB2W82rXWTOCLLUuabNnvq+NZ4uDhLsUz+ykEYW+rdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MqY/b/CuYCzo78qPiVE4wP8WR/PDx2ONs6/MITwURwM=;
 b=IW1jyH4CnPh3NeHwZMVozWHJP8IOm7i+vzmreNoVBcb3ziWIPPcD/xDLTMRiu+mq8dPrT0oHysnirbUFrAEKnZVtf5C79xTWeSwHKtxgV49XP7FYafEUYzH4HITZfapO1SxBRXmAH6cH7DzVRCx4fvF4BJnecaNsx/QFnQ5neqQ=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7109.eurprd04.prod.outlook.com (2603:10a6:20b:117::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Fri, 19 Jun
 2020 01:42:41 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3109.021; Fri, 19 Jun 2020
 01:42:41 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Bin Liu <b-liu@ti.com>, Pawel Laszczak <pawell@cadence.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Jason Yan <yanaijie@huawei.com>,
        Jia-Ju Bai <baijiaju1990@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Arnd Bergmann <arnd@arndb.de>,
        Jules Irenge <jbi.octave@gmail.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Rob Gill <rrobgill@protonmail.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>
Subject: Re: [PATCH] USB: ch9: add "USB_" prefix in front of TEST defines
Thread-Topic: [PATCH] USB: ch9: add "USB_" prefix in front of TEST defines
Thread-Index: AQHWRX6rTZRkIcv3wE2BOocsRlNK46jfKvUA
Date:   Fri, 19 Jun 2020 01:42:40 +0000
Message-ID: <20200619014304.GA8026@b29397-desktop>
References: <20200618144206.2655890-1-gregkh@linuxfoundation.org>
In-Reply-To: <20200618144206.2655890-1-gregkh@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 640bd5e9-ff66-4dd1-af43-08d813f20df7
x-ms-traffictypediagnostic: AM7PR04MB7109:
x-microsoft-antispam-prvs: <AM7PR04MB71092B2A1723A48B812EEA628B980@AM7PR04MB7109.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 0439571D1D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ls18a1txsrsbWydL2Iswp6SP2Lc/FNIZtKGjSgCzQrVIObtlvT4+b7oSkddU0oSipSLlYAR9eqNd1+ySotDI0p/Z1XtOY+3HrDHeXzXtNUH5rYu4yPr6SaKWDJJCI+LZbMVmSikmh9kNcdmGWBe8ECFhYKB4njRWcuX9Id3WttiwQhvp9XLh05V5UkyrdT3yRSQSajWg1bv/TC1igK7o0Amq9ipEVYna/bj0omr1JzzcDJkGWruOkJ322x6ePgbdojR3ddalNNBf0B/UOOjt9RIxcWRijIkEKG4/zLTYci3fFhMVFY/wAVcG44xBiHuTXktC+123zMrUGI7LQ3th+w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(7916004)(346002)(396003)(136003)(376002)(366004)(39860400002)(66946007)(54906003)(186003)(316002)(91956017)(76116006)(8936002)(26005)(2906002)(66476007)(66446008)(64756008)(66556008)(8676002)(7416002)(33656002)(6916009)(83380400001)(6506007)(9686003)(6512007)(71200400001)(6486002)(1076003)(86362001)(44832011)(33716001)(478600001)(53546011)(4326008)(30864003)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: oXb4Lm96waniMqD7XSeDNedJGBX1YPAqDdn0AfJQvNa+J3NGg9GrkJ2N+Q0Dm3RXPPW61EMFh1BARaCcEFDKtfP9WYceNG0jnmH4aRfMvxf8T2tzFL9zNhT69JFoXLFy13tOIr1A8e1frj+OFNVNFqWJ5+AkcuifV8QdTZpvqG5FipX+GiKVd5fSrwkJK86dbRkgLAAVF0wy5tNwrJf0XCpRwFTdYDhmo6QNKpJMGkVtI6hoykoj2JgWdIl6tvl9l3/4M1qAIRFOJTlEEqG0MG/6Rv0OWhbgNYVtNh/YZG6Rd29wXADEECL0DZBFnBayMa2BuiCqpcCjvVGyg9nnGIWgVX3womCSMAybU2AZtrE7X33AQjUCR3n4li5gzEwIx01vNPK4H93dXf0zM1fpiFRMAQ6SlncSy6xTs5CmVU2t7m1/xufcPOhfShfl5RJITX0hKrkoYKOnpHASWgkgyoDf1tj3xyXgYhcsv4xyhjI=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <67951219329AC648A07EFDB4E61FBDDF@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 640bd5e9-ff66-4dd1-af43-08d813f20df7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2020 01:42:40.8592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FSyQzrAyMX4KfXGfSgv/cuqxlp33BVYjENMXFzvUbBdjxXaeWwBP1vsoBoISiiQVj719N/liFOvyDDvky+idvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7109
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-06-18 16:42:06, Greg Kroah-Hartman wrote:
> For some reason, the TEST_ defines in the usb/ch9.h files did not have
> the USB_ prefix on it, making it a bit confusing when reading the file,
> as well as not the nicest thing to do in a uapi file.
>=20
> So fix that up and add the USB_ prefix on to them, and fix up all
> in-kernel usages.  This included deleting the duplicate copy in the
> net2272.h file.
>=20
> Cc: Peter Chen <Peter.Chen@nxp.com>
> Cc: Minas Harutyunyan <hminas@synopsys.com>
> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: Mathias Nyman <mathias.nyman@intel.com>
> Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Cc: Bin Liu <b-liu@ti.com>
> Cc: Pawel Laszczak <pawell@cadence.com>
> Cc: YueHaibing <yuehaibing@huawei.com>
> Cc: Nathan Chancellor <natechancellor@gmail.com>
> Cc: Jason Yan <yanaijie@huawei.com>
> Cc: Jia-Ju Bai <baijiaju1990@gmail.com>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Jules Irenge <jbi.octave@gmail.com>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Cc: Rob Gill <rrobgill@protonmail.com>
> Cc: Macpaul Lin <macpaul.lin@mediatek.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/usb/cdns3/ep0.c              |  8 ++++----
>  drivers/usb/chipidea/udc.c           | 10 +++++-----

For cdns3 and chipidea parts:

Acked-by: Peter Chen <peter.chen@nxp.com>

Peter

>  drivers/usb/common/debug.c           | 10 +++++-----
>  drivers/usb/dwc2/debugfs.c           | 20 ++++++++++----------
>  drivers/usb/dwc2/gadget.c            | 10 +++++-----
>  drivers/usb/dwc3/debugfs.c           | 20 ++++++++++----------
>  drivers/usb/dwc3/ep0.c               | 10 +++++-----
>  drivers/usb/dwc3/gadget.c            | 10 +++++-----
>  drivers/usb/gadget/udc/bdc/bdc_ep.c  | 10 +++++-----
>  drivers/usb/gadget/udc/gr_udc.c      |  4 ++--
>  drivers/usb/gadget/udc/mv_udc_core.c |  2 +-
>  drivers/usb/gadget/udc/net2272.c     |  2 +-
>  drivers/usb/gadget/udc/net2272.h     |  5 -----
>  drivers/usb/gadget/udc/udc-xilinx.c  |  4 ++--
>  drivers/usb/host/xhci-hub.c          |  7 ++++---
>  drivers/usb/misc/ehset.c             |  8 ++++----
>  drivers/usb/mtu3/mtu3_gadget_ep0.c   | 16 ++++++++--------
>  drivers/usb/musb/musb_gadget_ep0.c   | 20 ++++++++------------
>  drivers/usb/musb/musb_virthub.c      | 20 ++++++++++----------
>  include/uapi/linux/usb/ch9.h         | 10 +++++-----
>  20 files changed, 99 insertions(+), 107 deletions(-)
>=20
> diff --git a/drivers/usb/cdns3/ep0.c b/drivers/usb/cdns3/ep0.c
> index 82645a2a0f52..04a522f5ae58 100644
> --- a/drivers/usb/cdns3/ep0.c
> +++ b/drivers/usb/cdns3/ep0.c
> @@ -328,10 +328,10 @@ static int cdns3_ep0_feature_handle_device(struct c=
dns3_device *priv_dev,
>  			return -EINVAL;
> =20
>  		switch (tmode >> 8) {
> -		case TEST_J:
> -		case TEST_K:
> -		case TEST_SE0_NAK:
> -		case TEST_PACKET:
> +		case USB_TEST_J:
> +		case USB_TEST_K:
> +		case USB_TEST_SE0_NAK:
> +		case USB_TEST_PACKET:
>  			cdns3_set_register_bit(&priv_dev->regs->usb_cmd,
>  					       USB_CMD_STMODE |
>  					       USB_STS_TMODE_SEL(tmode - 1));
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index db0cfde0cc3c..4beb25888917 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -1215,11 +1215,11 @@ __acquires(ci->lock)
>  			case USB_DEVICE_TEST_MODE:
>  				tmode =3D le16_to_cpu(req.wIndex) >> 8;
>  				switch (tmode) {
> -				case TEST_J:
> -				case TEST_K:
> -				case TEST_SE0_NAK:
> -				case TEST_PACKET:
> -				case TEST_FORCE_EN:
> +				case USB_TEST_J:
> +				case USB_TEST_K:
> +				case USB_TEST_SE0_NAK:
> +				case USB_TEST_PACKET:
> +				case USB_TEST_FORCE_ENABLE:
>  					ci->test_mode =3D tmode;
>  					err =3D isr_setup_status_phase(
>  							ci);
> diff --git a/drivers/usb/common/debug.c b/drivers/usb/common/debug.c
> index 92a986aeaa5d..410acd670ca7 100644
> --- a/drivers/usb/common/debug.c
> +++ b/drivers/usb/common/debug.c
> @@ -53,15 +53,15 @@ static const char *usb_decode_device_feature(u16 wVal=
ue)
>  static const char *usb_decode_test_mode(u16 wIndex)
>  {
>  	switch (wIndex) {
> -	case TEST_J:
> +	case USB_TEST_J:
>  		return ": TEST_J";
> -	case TEST_K:
> +	case USB_TEST_K:
>  		return ": TEST_K";
> -	case TEST_SE0_NAK:
> +	case USB_TEST_SE0_NAK:
>  		return ": TEST_SE0_NAK";
> -	case TEST_PACKET:
> +	case USB_TEST_PACKET:
>  		return ": TEST_PACKET";
> -	case TEST_FORCE_EN:
> +	case USB_TEST_FORCE_ENABLE:
>  		return ": TEST_FORCE_EN";
>  	default:
>  		return ": UNKNOWN";
> diff --git a/drivers/usb/dwc2/debugfs.c b/drivers/usb/dwc2/debugfs.c
> index 3a0dcbfbc827..aaafd463d72a 100644
> --- a/drivers/usb/dwc2/debugfs.c
> +++ b/drivers/usb/dwc2/debugfs.c
> @@ -37,15 +37,15 @@ static ssize_t testmode_write(struct file *file, cons=
t char __user *ubuf, size_t
>  		return -EFAULT;
> =20
>  	if (!strncmp(buf, "test_j", 6))
> -		testmode =3D TEST_J;
> +		testmode =3D USB_TEST_J;
>  	else if (!strncmp(buf, "test_k", 6))
> -		testmode =3D TEST_K;
> +		testmode =3D USB_TEST_K;
>  	else if (!strncmp(buf, "test_se0_nak", 12))
> -		testmode =3D TEST_SE0_NAK;
> +		testmode =3D USB_TEST_SE0_NAK;
>  	else if (!strncmp(buf, "test_packet", 11))
> -		testmode =3D TEST_PACKET;
> +		testmode =3D USB_TEST_PACKET;
>  	else if (!strncmp(buf, "test_force_enable", 17))
> -		testmode =3D TEST_FORCE_EN;
> +		testmode =3D USB_TEST_FORCE_ENABLE;
>  	else
>  		testmode =3D 0;
> =20
> @@ -78,19 +78,19 @@ static int testmode_show(struct seq_file *s, void *un=
used)
>  	case 0:
>  		seq_puts(s, "no test\n");
>  		break;
> -	case TEST_J:
> +	case USB_TEST_J:
>  		seq_puts(s, "test_j\n");
>  		break;
> -	case TEST_K:
> +	case USB_TEST_K:
>  		seq_puts(s, "test_k\n");
>  		break;
> -	case TEST_SE0_NAK:
> +	case USB_TEST_SE0_NAK:
>  		seq_puts(s, "test_se0_nak\n");
>  		break;
> -	case TEST_PACKET:
> +	case USB_TEST_PACKET:
>  		seq_puts(s, "test_packet\n");
>  		break;
> -	case TEST_FORCE_EN:
> +	case USB_TEST_FORCE_ENABLE:
>  		seq_puts(s, "test_force_enable\n");
>  		break;
>  	default:
> diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
> index 12b98b466287..38fc46b0c026 100644
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -1561,11 +1561,11 @@ int dwc2_hsotg_set_test_mode(struct dwc2_hsotg *h=
sotg, int testmode)
> =20
>  	dctl &=3D ~DCTL_TSTCTL_MASK;
>  	switch (testmode) {
> -	case TEST_J:
> -	case TEST_K:
> -	case TEST_SE0_NAK:
> -	case TEST_PACKET:
> -	case TEST_FORCE_EN:
> +	case USB_TEST_J:
> +	case USB_TEST_K:
> +	case USB_TEST_SE0_NAK:
> +	case USB_TEST_PACKET:
> +	case USB_TEST_FORCE_ENABLE:
>  		dctl |=3D testmode << DCTL_TSTCTL_SHIFT;
>  		break;
>  	default:
> diff --git a/drivers/usb/dwc3/debugfs.c b/drivers/usb/dwc3/debugfs.c
> index 6d9de334e46a..14dc6a37305d 100644
> --- a/drivers/usb/dwc3/debugfs.c
> +++ b/drivers/usb/dwc3/debugfs.c
> @@ -466,19 +466,19 @@ static int dwc3_testmode_show(struct seq_file *s, v=
oid *unused)
>  	case 0:
>  		seq_printf(s, "no test\n");
>  		break;
> -	case TEST_J:
> +	case USB_TEST_J:
>  		seq_printf(s, "test_j\n");
>  		break;
> -	case TEST_K:
> +	case USB_TEST_K:
>  		seq_printf(s, "test_k\n");
>  		break;
> -	case TEST_SE0_NAK:
> +	case USB_TEST_SE0_NAK:
>  		seq_printf(s, "test_se0_nak\n");
>  		break;
> -	case TEST_PACKET:
> +	case USB_TEST_PACKET:
>  		seq_printf(s, "test_packet\n");
>  		break;
> -	case TEST_FORCE_EN:
> +	case USB_TEST_FORCE_ENABLE:
>  		seq_printf(s, "test_force_enable\n");
>  		break;
>  	default:
> @@ -506,15 +506,15 @@ static ssize_t dwc3_testmode_write(struct file *fil=
e,
>  		return -EFAULT;
> =20
>  	if (!strncmp(buf, "test_j", 6))
> -		testmode =3D TEST_J;
> +		testmode =3D USB_TEST_J;
>  	else if (!strncmp(buf, "test_k", 6))
> -		testmode =3D TEST_K;
> +		testmode =3D USB_TEST_K;
>  	else if (!strncmp(buf, "test_se0_nak", 12))
> -		testmode =3D TEST_SE0_NAK;
> +		testmode =3D USB_TEST_SE0_NAK;
>  	else if (!strncmp(buf, "test_packet", 11))
> -		testmode =3D TEST_PACKET;
> +		testmode =3D USB_TEST_PACKET;
>  	else if (!strncmp(buf, "test_force_enable", 17))
> -		testmode =3D TEST_FORCE_EN;
> +		testmode =3D USB_TEST_FORCE_ENABLE;
>  	else
>  		testmode =3D 0;
> =20
> diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
> index 6dee4dabc0a4..8dd69728add3 100644
> --- a/drivers/usb/dwc3/ep0.c
> +++ b/drivers/usb/dwc3/ep0.c
> @@ -425,11 +425,11 @@ static int dwc3_ep0_handle_test(struct dwc3 *dwc, e=
num usb_device_state state,
>  		return -EINVAL;
> =20
>  	switch (wIndex >> 8) {
> -	case TEST_J:
> -	case TEST_K:
> -	case TEST_SE0_NAK:
> -	case TEST_PACKET:
> -	case TEST_FORCE_EN:
> +	case USB_TEST_J:
> +	case USB_TEST_K:
> +	case USB_TEST_SE0_NAK:
> +	case USB_TEST_PACKET:
> +	case USB_TEST_FORCE_ENABLE:
>  		dwc->test_mode_nr =3D wIndex >> 8;
>  		dwc->test_mode =3D true;
>  		break;
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 80c3ef134e41..0b59b2f1cf26 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -46,11 +46,11 @@ int dwc3_gadget_set_test_mode(struct dwc3 *dwc, int m=
ode)
>  	reg &=3D ~DWC3_DCTL_TSTCTRL_MASK;
> =20
>  	switch (mode) {
> -	case TEST_J:
> -	case TEST_K:
> -	case TEST_SE0_NAK:
> -	case TEST_PACKET:
> -	case TEST_FORCE_EN:
> +	case USB_TEST_J:
> +	case USB_TEST_K:
> +	case USB_TEST_SE0_NAK:
> +	case USB_TEST_PACKET:
> +	case USB_TEST_FORCE_ENABLE:
>  		reg |=3D mode << 1;
>  		break;
>  	default:
> diff --git a/drivers/usb/gadget/udc/bdc/bdc_ep.c b/drivers/usb/gadget/udc=
/bdc/bdc_ep.c
> index d49c6dc1082d..ba250cf75bef 100644
> --- a/drivers/usb/gadget/udc/bdc/bdc_ep.c
> +++ b/drivers/usb/gadget/udc/bdc/bdc_ep.c
> @@ -927,11 +927,11 @@ static int bdc_set_test_mode(struct bdc *bdc)
>  	usb2_pm &=3D ~BDC_PTC_MASK;
>  	dev_dbg(bdc->dev, "%s\n", __func__);
>  	switch (bdc->test_mode) {
> -	case TEST_J:
> -	case TEST_K:
> -	case TEST_SE0_NAK:
> -	case TEST_PACKET:
> -	case TEST_FORCE_EN:
> +	case USB_TEST_J:
> +	case USB_TEST_K:
> +	case USB_TEST_SE0_NAK:
> +	case USB_TEST_PACKET:
> +	case USB_TEST_FORCE_ENABLE:
>  		usb2_pm |=3D bdc->test_mode << 28;
>  		break;
>  	default:
> diff --git a/drivers/usb/gadget/udc/gr_udc.c b/drivers/usb/gadget/udc/gr_=
udc.c
> index 7164ad9800f1..345e28d76709 100644
> --- a/drivers/usb/gadget/udc/gr_udc.c
> +++ b/drivers/usb/gadget/udc/gr_udc.c
> @@ -912,9 +912,9 @@ static int gr_device_request(struct gr_udc *dev, u8 t=
ype, u8 request,
>  			return gr_ep0_respond_empty(dev);
> =20
>  		case USB_DEVICE_TEST_MODE:
> -			/* The hardware does not support TEST_FORCE_EN */
> +			/* The hardware does not support USB_TEST_FORCE_ENABLE */
>  			test =3D index >> 8;
> -			if (test >=3D TEST_J && test <=3D TEST_PACKET) {
> +			if (test >=3D USB_TEST_J && test <=3D USB_TEST_PACKET) {
>  				dev->test_mode =3D test;
>  				return gr_ep0_respond(dev, NULL, 0,
>  						      gr_ep0_testmode_complete);
> diff --git a/drivers/usb/gadget/udc/mv_udc_core.c b/drivers/usb/gadget/ud=
c/mv_udc_core.c
> index cafde053788b..69289717d856 100644
> --- a/drivers/usb/gadget/udc/mv_udc_core.c
> +++ b/drivers/usb/gadget/udc/mv_udc_core.c
> @@ -1502,7 +1502,7 @@ udc_prime_status(struct mv_udc *udc, u8 direction, =
u16 status, bool empty)
> =20
>  static void mv_udc_testmode(struct mv_udc *udc, u16 index)
>  {
> -	if (index <=3D TEST_FORCE_EN) {
> +	if (index <=3D USB_TEST_FORCE_ENABLE) {
>  		udc->test_mode =3D index;
>  		if (udc_prime_status(udc, EP_DIR_IN, 0, true))
>  			ep0_stall(udc);
> diff --git a/drivers/usb/gadget/udc/net2272.c b/drivers/usb/gadget/udc/ne=
t2272.c
> index 928057b206f1..fbbe62513545 100644
> --- a/drivers/usb/gadget/udc/net2272.c
> +++ b/drivers/usb/gadget/udc/net2272.c
> @@ -1688,7 +1688,7 @@ net2272_set_test_mode(struct net2272 *dev, int mode=
)
>  	net2272_write(dev, USBTEST, mode);
> =20
>  	/* load test packet */
> -	if (mode =3D=3D TEST_PACKET) {
> +	if (mode =3D=3D USB_TEST_PACKET) {
>  		/* switch to 8 bit mode */
>  		net2272_write(dev, LOCCTL, net2272_read(dev, LOCCTL) &
>  				~(1 << DATA_WIDTH));
> diff --git a/drivers/usb/gadget/udc/net2272.h b/drivers/usb/gadget/udc/ne=
t2272.h
> index 8e644627992d..87d0ab9ffeeb 100644
> --- a/drivers/usb/gadget/udc/net2272.h
> +++ b/drivers/usb/gadget/udc/net2272.h
> @@ -105,11 +105,6 @@
>  #define USBTEST				0x32
>  #define 	TEST_MODE_SELECT			0
>  #define 		NORMAL_OPERATION			0
> -#define 		TEST_J					1
> -#define 		TEST_K					2
> -#define 		TEST_SE0_NAK				3
> -#define 		TEST_PACKET				4
> -#define 		TEST_FORCE_ENABLE			5
>  #define XCVRDIAG			0x33
>  #define 	FORCE_FULL_SPEED			2
>  #define 	FORCE_HIGH_SPEED			3
> diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc=
/udc-xilinx.c
> index 709553bdb233..d5e9d20c097d 100644
> --- a/drivers/usb/gadget/udc/udc-xilinx.c
> +++ b/drivers/usb/gadget/udc/udc-xilinx.c
> @@ -2097,9 +2097,9 @@ static int xudc_probe(struct platform_device *pdev)
>  	/* Check for IP endianness */
>  	udc->write_fn =3D xudc_write32_be;
>  	udc->read_fn =3D xudc_read32_be;
> -	udc->write_fn(udc->addr, XUSB_TESTMODE_OFFSET, TEST_J);
> +	udc->write_fn(udc->addr, XUSB_TESTMODE_OFFSET, USB_TEST_J);
>  	if ((udc->read_fn(udc->addr + XUSB_TESTMODE_OFFSET))
> -			!=3D TEST_J) {
> +			!=3D USB_TEST_J) {
>  		udc->write_fn =3D xudc_write32;
>  		udc->read_fn =3D xudc_read32;
>  	}
> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
> index f37316d2c8fa..073c54e42223 100644
> --- a/drivers/usb/host/xhci-hub.c
> +++ b/drivers/usb/host/xhci-hub.c
> @@ -612,7 +612,7 @@ static void xhci_port_set_test_mode(struct xhci_hcd *=
xhci,
>  	temp |=3D test_mode << PORT_TEST_MODE_SHIFT;
>  	writel(temp, port->addr + PORTPMSC);
>  	xhci->test_mode =3D test_mode;
> -	if (test_mode =3D=3D TEST_FORCE_EN)
> +	if (test_mode =3D=3D USB_TEST_FORCE_ENABLE)
>  		xhci_start(xhci);
>  }
> =20
> @@ -666,7 +666,7 @@ static int xhci_exit_test_mode(struct xhci_hcd *xhci)
>  		xhci_err(xhci, "Not in test mode, do nothing.\n");
>  		return 0;
>  	}
> -	if (xhci->test_mode =3D=3D TEST_FORCE_EN &&
> +	if (xhci->test_mode =3D=3D USB_TEST_FORCE_ENABLE &&
>  		!(xhci->xhc_state & XHCI_STATE_HALTED)) {
>  		retval =3D xhci_halt(xhci);
>  		if (retval)
> @@ -1421,7 +1421,8 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeR=
eq, u16 wValue,
>  			/* 4.19.6 Port Test Modes (USB2 Test Mode) */
>  			if (hcd->speed !=3D HCD_USB2)
>  				goto error;
> -			if (test_mode > TEST_FORCE_EN || test_mode < TEST_J)
> +			if (test_mode > USB_TEST_FORCE_ENABLE ||
> +			    test_mode < USB_TEST_J)
>  				goto error;
>  			retval =3D xhci_enter_test_mode(xhci, test_mode, wIndex,
>  						      &flags);
> diff --git a/drivers/usb/misc/ehset.c b/drivers/usb/misc/ehset.c
> index 7895d61e733b..2752e1f4f4d0 100644
> --- a/drivers/usb/misc/ehset.c
> +++ b/drivers/usb/misc/ehset.c
> @@ -33,28 +33,28 @@ static int ehset_probe(struct usb_interface *intf,
>  		ret =3D usb_control_msg(hub_udev, usb_sndctrlpipe(hub_udev, 0),
>  					USB_REQ_SET_FEATURE, USB_RT_PORT,
>  					USB_PORT_FEAT_TEST,
> -					(TEST_SE0_NAK << 8) | portnum,
> +					(USB_TEST_SE0_NAK << 8) | portnum,
>  					NULL, 0, 1000);
>  		break;
>  	case TEST_J_PID:
>  		ret =3D usb_control_msg(hub_udev, usb_sndctrlpipe(hub_udev, 0),
>  					USB_REQ_SET_FEATURE, USB_RT_PORT,
>  					USB_PORT_FEAT_TEST,
> -					(TEST_J << 8) | portnum,
> +					(USB_TEST_J << 8) | portnum,
>  					NULL, 0, 1000);
>  		break;
>  	case TEST_K_PID:
>  		ret =3D usb_control_msg(hub_udev, usb_sndctrlpipe(hub_udev, 0),
>  					USB_REQ_SET_FEATURE, USB_RT_PORT,
>  					USB_PORT_FEAT_TEST,
> -					(TEST_K << 8) | portnum,
> +					(USB_TEST_K << 8) | portnum,
>  					NULL, 0, 1000);
>  		break;
>  	case TEST_PACKET_PID:
>  		ret =3D usb_control_msg(hub_udev, usb_sndctrlpipe(hub_udev, 0),
>  					USB_REQ_SET_FEATURE, USB_RT_PORT,
>  					USB_PORT_FEAT_TEST,
> -					(TEST_PACKET << 8) | portnum,
> +					(USB_TEST_PACKET << 8) | portnum,
>  					NULL, 0, 1000);
>  		break;
>  	case TEST_HS_HOST_PORT_SUSPEND_RESUME:
> diff --git a/drivers/usb/mtu3/mtu3_gadget_ep0.c b/drivers/usb/mtu3/mtu3_g=
adget_ep0.c
> index 2be182bd793a..563a0a2e970d 100644
> --- a/drivers/usb/mtu3/mtu3_gadget_ep0.c
> +++ b/drivers/usb/mtu3/mtu3_gadget_ep0.c
> @@ -278,20 +278,20 @@ static int handle_test_mode(struct mtu3 *mtu, struc=
t usb_ctrlrequest *setup)
>  	u32 value;
> =20
>  	switch (le16_to_cpu(setup->wIndex) >> 8) {
> -	case TEST_J:
> -		dev_dbg(mtu->dev, "TEST_J\n");
> +	case USB_TEST_J:
> +		dev_dbg(mtu->dev, "USB_TEST_J\n");
>  		mtu->test_mode_nr =3D TEST_J_MODE;
>  		break;
> -	case TEST_K:
> -		dev_dbg(mtu->dev, "TEST_K\n");
> +	case USB_TEST_K:
> +		dev_dbg(mtu->dev, "USB_TEST_K\n");
>  		mtu->test_mode_nr =3D TEST_K_MODE;
>  		break;
> -	case TEST_SE0_NAK:
> -		dev_dbg(mtu->dev, "TEST_SE0_NAK\n");
> +	case USB_TEST_SE0_NAK:
> +		dev_dbg(mtu->dev, "USB_TEST_SE0_NAK\n");
>  		mtu->test_mode_nr =3D TEST_SE0_NAK_MODE;
>  		break;
> -	case TEST_PACKET:
> -		dev_dbg(mtu->dev, "TEST_PACKET\n");
> +	case USB_TEST_PACKET:
> +		dev_dbg(mtu->dev, "USB_TEST_PACKET\n");
>  		mtu->test_mode_nr =3D TEST_PACKET_MODE;
>  		break;
>  	default:
> diff --git a/drivers/usb/musb/musb_gadget_ep0.c b/drivers/usb/musb/musb_g=
adget_ep0.c
> index 91a5027b5c1f..0ae3e0be043e 100644
> --- a/drivers/usb/musb/musb_gadget_ep0.c
> +++ b/drivers/usb/musb/musb_gadget_ep0.c
> @@ -311,27 +311,23 @@ __acquires(musb->lock)
>  						goto stall;
> =20
>  					switch (ctrlrequest->wIndex >> 8) {
> -					case 1:
> -						pr_debug("TEST_J\n");
> -						/* TEST_J */
> +					case USB_TEST_J:
> +						pr_debug("USB_TEST_J\n");
>  						musb->test_mode_nr =3D
>  							MUSB_TEST_J;
>  						break;
> -					case 2:
> -						/* TEST_K */
> -						pr_debug("TEST_K\n");
> +					case USB_TEST_K:
> +						pr_debug("USB_TEST_K\n");
>  						musb->test_mode_nr =3D
>  							MUSB_TEST_K;
>  						break;
> -					case 3:
> -						/* TEST_SE0_NAK */
> -						pr_debug("TEST_SE0_NAK\n");
> +					case USB_TEST_SE0_NAK:
> +						pr_debug("USB_TEST_SE0_NAK\n");
>  						musb->test_mode_nr =3D
>  							MUSB_TEST_SE0_NAK;
>  						break;
> -					case 4:
> -						/* TEST_PACKET */
> -						pr_debug("TEST_PACKET\n");
> +					case USB_TEST_PACKET:
> +						pr_debug("USB_TEST_PACKET\n");
>  						musb->test_mode_nr =3D
>  							MUSB_TEST_PACKET;
>  						break;
> diff --git a/drivers/usb/musb/musb_virthub.c b/drivers/usb/musb/musb_virt=
hub.c
> index a84ec27c4c12..cb7ae297a3af 100644
> --- a/drivers/usb/musb/musb_virthub.c
> +++ b/drivers/usb/musb/musb_virthub.c
> @@ -385,25 +385,25 @@ int musb_hub_control(
> =20
>  			wIndex >>=3D 8;
>  			switch (wIndex) {
> -			case 1:
> -				pr_debug("TEST_J\n");
> +			case USB_TEST_J:
> +				pr_debug("USB_TEST_J\n");
>  				temp =3D MUSB_TEST_J;
>  				break;
> -			case 2:
> -				pr_debug("TEST_K\n");
> +			case USB_TEST_K:
> +				pr_debug("USB_TEST_K\n");
>  				temp =3D MUSB_TEST_K;
>  				break;
> -			case 3:
> -				pr_debug("TEST_SE0_NAK\n");
> +			case USB_TEST_SE0_NAK:
> +				pr_debug("USB_TEST_SE0_NAK\n");
>  				temp =3D MUSB_TEST_SE0_NAK;
>  				break;
> -			case 4:
> -				pr_debug("TEST_PACKET\n");
> +			case USB_TEST_PACKET:
> +				pr_debug("USB_TEST_PACKET\n");
>  				temp =3D MUSB_TEST_PACKET;
>  				musb_load_testpacket(musb);
>  				break;
> -			case 5:
> -				pr_debug("TEST_FORCE_ENABLE\n");
> +			case USB_TEST_FORCE_ENABLE:
> +				pr_debug("USB_TEST_FORCE_ENABLE\n");
>  				temp =3D MUSB_TEST_FORCE_HOST
>  					| MUSB_TEST_FORCE_HS;
> =20
> diff --git a/include/uapi/linux/usb/ch9.h b/include/uapi/linux/usb/ch9.h
> index b1ed2ccfe9cf..48766fdf6580 100644
> --- a/include/uapi/linux/usb/ch9.h
> +++ b/include/uapi/linux/usb/ch9.h
> @@ -138,11 +138,11 @@
>   * Test Mode Selectors
>   * See USB 2.0 spec Table 9-7
>   */
> -#define	TEST_J		1
> -#define	TEST_K		2
> -#define	TEST_SE0_NAK	3
> -#define	TEST_PACKET	4
> -#define	TEST_FORCE_EN	5
> +#define	USB_TEST_J		1
> +#define	USB_TEST_K		2
> +#define	USB_TEST_SE0_NAK	3
> +#define	USB_TEST_PACKET		4
> +#define	USB_TEST_FORCE_ENABLE	5
> =20
>  /* Status Type */
>  #define USB_STATUS_TYPE_STANDARD	0
> --=20
> 2.27.0
>=20

--=20

Thanks,
Peter Chen=
