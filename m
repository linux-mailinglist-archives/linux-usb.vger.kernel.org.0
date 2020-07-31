Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD4DF234753
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jul 2020 16:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731750AbgGaOGZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jul 2020 10:06:25 -0400
Received: from mail-eopbgr80055.outbound.protection.outlook.com ([40.107.8.55]:30934
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730799AbgGaOGZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 31 Jul 2020 10:06:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EoSi/3dHeKTzyGD/uiNtD4LbLeSqpEE14UCOM2+Bj2Vp1njiCPunFCoAHJzrCGtiegTp/UWx/0nQnrh7G0K3H59ZzCQnSRsWoLvChCph4hM0ypkNWRRITYX2+F49kpLg62wds0qvkQA395kLl+GudUYCP9MCmbVvm7nPLTVPjNCfOGz2r203iuBpTzuW/puRY/lUSUzJIWuHmvov1E49hbxlJev3M0GkexyQIhi6e6iDS/J/Ezwwd7Qyk85GiIzyit+4ajv23PVL0E6kcd+PMDoFJr8RV2Vhs6Jhjd7MekFAsm7QqlwOHZ0ozH2HJDSItmiuEzt21A76A/qiRy0/yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGKD9NmZHMQ5j2dJJRVoRlqczPJpZVeo/G2M3tp5ASM=;
 b=Jkx3RehUYNTs6olSms0bLP4e+AKKcOSbSXDMIQEiKde6Sa4+qaa0YqmIqI+Fil4kL5u2P8N+phbgv16A4jq7DQM4WVbWjO9IFJPIcXokQCwo/gT/b49W+fJQ+JAgYwtG2AdoITdSIxHukCwvsxwCDPxPjo19Ck7fxjBmKp/Fgt4T3wPmfNaFi2+upzOsYWFZQZCGT5XI5owvGChr0vQSi6I0MTozcCCiNn0w5hl1eVR2OcB22HtJoozMcjzT9BBQv7jqu1NA/mEO0gcu3GPvn8r3BJQO5VjDiIi+A/dLMhrykYXIGNlYbUqk/SJAKOsXql5iCirq7qKn6qn09ua6ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGKD9NmZHMQ5j2dJJRVoRlqczPJpZVeo/G2M3tp5ASM=;
 b=VaswKqNEXHMbDDGv3zhzhXSxSSuDolSEQsRJwUv4IsForpyl38ZoK25+Sb3xW6CMZZahOlydiytCdg99MfChkdNUbF8eH8Y57U81fLS7JuSv/7GXIqzIaDecraIiOcMdfpelD3CEArrvt1OZI4l34ZH7FvpLtHpcG7DJj1Xy2dg=
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com (2603:10a6:10:12c::13)
 by DB6PR04MB2998.eurprd04.prod.outlook.com (2603:10a6:6:4::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.28; Fri, 31 Jul 2020 14:06:20 +0000
Received: from DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::8a7:786f:91a3:1e1f]) by DB8PR04MB7162.eurprd04.prod.outlook.com
 ([fe80::8a7:786f:91a3:1e1f%7]) with mapi id 15.20.3239.017; Fri, 31 Jul 2020
 14:06:20 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 1/1] usb: gadget: core: wait gadget device .release
 finishing at usb_del_gadget_udc
Thread-Topic: [PATCH 1/1] usb: gadget: core: wait gadget device .release
 finishing at usb_del_gadget_udc
Thread-Index: AQHWZyFjrjQabElMSUmE/uyQe+yec6khlL4AgAAB30CAAAZvAIAAHBiA
Date:   Fri, 31 Jul 2020 14:06:20 +0000
Message-ID: <20200731140553.GA8013@b29397-desktop>
References: <20200731095935.23034-1-peter.chen@nxp.com>
 <20200731115536.GB1648202@kroah.com>
 <DB8PR04MB7162B2FAC7FACD0A11F6D8218B4E0@DB8PR04MB7162.eurprd04.prod.outlook.com>
 <20200731122520.GB1655976@kroah.com>
In-Reply-To: <20200731122520.GB1655976@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 218cee3c-0cae-4f81-f678-08d8355ae6cd
x-ms-traffictypediagnostic: DB6PR04MB2998:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR04MB299803C9937D4FC120DC848A8B4E0@DB6PR04MB2998.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7d7o6hTu7Fp63ZQrSHLpY7WH674p/DAlQCu+J1N24baa2MLhdXmMEd5GELaOMbmeJRyXwsqtMo9Vw1MNQJUSADU9xMqYdUVZGthJz56Fnsjs3nYUZAaErrCQNdabgIKXogI6Q+fK7vfWvzUruKwu7F7Dx8DweaxEZ2/dmCMlfFnOt+r4yQRG8SxRC4aJRFcfAsr7u4MLBJigpgzuF0rMMft8IuJa7auV8Tbpiij5RRNSGkcI83D92cHEh2I9EEz8GAQVnleaO8cZcBpBhEWLq7f5TEHfegsgJm6sLCcs7ME5MRXRsoeHATedg1bzSxxuoguW13t5cRLGebSO03O73RIFpyCgrMaK53ZDXaO52BSWt6237hYA2WfTwyhUKS0e
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7162.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(7916004)(396003)(39860400002)(346002)(366004)(136003)(376002)(66476007)(76116006)(66946007)(2906002)(5660300002)(4326008)(54906003)(66446008)(64756008)(316002)(33716001)(91956017)(66556008)(83380400001)(26005)(8936002)(1076003)(186003)(6916009)(9686003)(6512007)(6486002)(6506007)(478600001)(8676002)(53546011)(33656002)(71200400001)(44832011)(86362001)(142923001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: FUyuQjJC0DJqrSwA5MjrCvd3vkps84l4Af7tP5ti781OxQu+jLyYZUuneM1wVabPsm0hNNpc09lpANfhm+ZkSJ03q/1h3dYIHR2lQHKznatVrZXwP0aoJJ78WBHQ8bcLglEpYfmVtR7IzlWOsnZKwxh06mUNj+VMDiCALqu9IVvc6M4d4UTEeEl+m5bn3UZ38bxOegU6HcRFiVCaAo4F9Ana/mrkDyJJ5rDROjkCbhpMkF4BSUmWGp2Mstd0PdbuAtuRIDzXPNBxQfZ9nx+91cIjw4WNLGILjDq7axxFkmxCp+JNTbXNbAsg7sYhCN1jHVNt5dLtnlzVr6xZAnsPGA7zQ+iF7XKkUdmM87IjFD5wEtKI3Zkclv+VaNcNCdob7vjAvBAvQQhJmKbeEiKowA7Jr5hbfT2FvC3T2ieISazQu3MwStOuvsHdtjhxLmxrpjNPM+gRi3GnnMK52/HYbgex75Oxec4kqCb0B7R33Fg=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <15761B7848C341429651C253E60E7F52@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7162.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 218cee3c-0cae-4f81-f678-08d8355ae6cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2020 14:06:20.7705
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 73WwGlLAG5V1vgGMuTsPIruk8NM7mBTg0yhv792pBh2Vj7/sQ4P8shaKYkUQJvKwolwkUP1LvPqoAiGhHsMGfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB2998
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-07-31 14:25:20, Greg Kroah-Hartman wrote:
> On Fri, Jul 31, 2020 at 12:11:32PM +0000, Peter Chen wrote:
>=20
> Grab a reference from somewhere else and do not give it up for a long
> time.
>=20

So wait_for_completion_timeout is suitable? The similar use case is when
we open the file at the USB Drive at Windows, and we click "Eject", it
will say "The device is currently in use", and refuse our "Eject"
operation.

When we try to remove the gadget, if the gadget is in use, we could
refuse the remove operation, reasonable?

> > > > -static void usb_udc_nop_release(struct device *dev)
> > > > +static void usb_gadget_release(struct device *dev)
> > > >  {
> > > > +	struct usb_gadget *gadget;
> > > > +
> > > >  	dev_vdbg(dev, "%s\n", __func__);
> > > > +
> > > > +	gadget =3D container_of(dev, struct usb_gadget, dev);
> > > > +	complete(&gadget->done);
> > > > +	memset(dev, 0x0, sizeof(*dev));
> > >=20
> > > No, the memory should be freed here, not memset.
> > >=20
> > =20
> > This memory is allocated at UDC driver and is freed by UDC driver too.
>=20
> That's wrong, the release function should be where this is released.

So, the release function should be at individual UDC driver, a common
release function is improper, right?

>=20
> And this no-op function is horrid.  There used to be documentation in
> the kernel where I could rant about this, but instead, I'll just say,
> "why are people trying to work around warnings we put in the core kernel
> to fix common problems?  Do they think we did that just because we
> wanted to be mean???"
>=20

So, like kernel doc for device_initialize said, a proper fix for dwc3
should be zeroed gadget device memory at its own driver before the=20
gadget device register to driver core, right?


 * All fields in @dev must be initialized by the caller to 0, except
 * for those explicitly set to some other value.  The simplest
 * approach is to use kzalloc() to allocate the structure containing
 * @dev.


--=20

Thanks,
Peter Chen=
