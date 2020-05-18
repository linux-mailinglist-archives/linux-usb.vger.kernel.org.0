Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCF5D1D70C0
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2020 08:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgERGOO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 May 2020 02:14:14 -0400
Received: from mail-eopbgr80042.outbound.protection.outlook.com ([40.107.8.42]:34531
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726180AbgERGON (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 May 2020 02:14:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TipBJsC1U2dsw2kOgvng0KcFkI5mXEPNb9exlfTFBguB+77zmk81Oed6G+fqO8DBTI4B9NuitgRYJL82AHQJRKdbDaCohYpH3n8+EanVNnGUkVwcDI+0WNKzVdvIgdvfIB/hGX4QjYNOVdR0pBfNtd6Ru+zoJBZLzlbyGKOH7Z7cNqXVuJZbx7jDY/eF69jfrnYGSJBc3G6ECEX3EkBFDJ4B3b/jiZa5DkEoIxCmF2NR7+0tjuGyRycYcCu2gUMxxKd1Hdp58Qc/gaOZPp1u+YYKTNmXiJ2ozwImsTnk8t5gfCENAaZAB1Pt+bVm/YAeTEqWH21w0YJf/WefHvzgzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kw0GL22hQry+jReHLVdNjB7+QI6bOYAC83RFeEG6fUI=;
 b=GRyaSit4XMfwM/2PUm3s7d1W1wlSPhQiZLjCi2fz7pRf8xKjhj88ZuJy75rPIpLl3uGXiGaCi/dMNKnswnXgClbYnHXwPbS7np3CvgjYPqxx3tk2wSwFZvKlTP6zt+d6sXYpV2AvmRgVfQC1CGuz0BzVk9GVSVfgxxyaetS89pLunKkuYFQA8XpzKctaowEVvbTloeia1n0+dym9r24Zlrd5E7E+s11robM7nxJmrdLt2lclvPnBqriWig+IQgb8cA0WRtqE2VfX8LZm9P1DgWGArqmYX7JvRy2UvBKFWYLVcZbBkKaHmEwPM/x/jRnXh8h1rEZNunnzYjYK/4wdPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kw0GL22hQry+jReHLVdNjB7+QI6bOYAC83RFeEG6fUI=;
 b=mN4EvKU1bzhjx985N/OG2KJHumUf0SX4l0y7+Om8KZCbcyBBCjUeOenHkdcmBD6HZ7E3lAFTEy6+Wr1+Qh3PFFxJkM8oWYWu6cnAcvT4r3ZlvrxX9nUbRz+ATYU5R1AG738px/x79P0r+/Eazrv2rUtPeWFtExU3JqZQcisODSg=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7110.eurprd04.prod.outlook.com (2603:10a6:20b:119::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.24; Mon, 18 May
 2020 06:14:09 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792%9]) with mapi id 15.20.3000.034; Mon, 18 May 2020
 06:14:09 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Pawel Laszczak <pawell@cadence.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Peter Chen <hzpeterchen@gmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH 1/1] usb: cdns3: ep0: delete the redundant status stage
Thread-Topic: [PATCH 1/1] usb: cdns3: ep0: delete the redundant status stage
Thread-Index: AQHWG8utTtXaQQv5R0ONjsi6OGoclaiZK+EAgAKs4wCADSf/AIAEVoaAgAANBYCAABtOgA==
Date:   Mon, 18 May 2020 06:14:09 +0000
Message-ID: <20200518061435.GD27612@b29397-desktop>
References: <20200426130751.32556-1-peter.chen@nxp.com>
 <87368ebz3d.fsf@kernel.org>
 <CAL411-q4euWFrJ5Sp+tocBEsXXYkviQXt_pz_SyHHC=ELNf_sQ@mail.gmail.com>
 <87ftc135i3.fsf@kernel.org> <20200518035015.GB27612@b29397-desktop>
 <DM6PR07MB5529DFE46AD0CA63C740D39FDDB80@DM6PR07MB5529.namprd07.prod.outlook.com>
In-Reply-To: <DM6PR07MB5529DFE46AD0CA63C740D39FDDB80@DM6PR07MB5529.namprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: cadence.com; dkim=none (message not signed)
 header.d=none;cadence.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2598f0c5-f741-4997-a6e7-08d7faf2ad90
x-ms-traffictypediagnostic: AM7PR04MB7110:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB7110934BBBBB7E58448F55BE8BB80@AM7PR04MB7110.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04073E895A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OuVD91ZNFogTraQ6vAX57yolgNxyqAncKKRF+0YfOJzcBm3VDisrrQMBOqyCf0zKe+jJIjzUKChMAPm3U8ciTOdISBE0wZQhlFOLt3Z+hxzvc3qtJfXRtTEQWe1CJ+OT1MYqd7tlm5GvAinlzCY8Ya28PnnBTb7eQHIWOrpBwvohH7ren+TgqE2bA9Ec9PNrksoVvfG14tc6a20atH/YN6i63JiE3zmXmuFpwYT3/CbDpusukXjmMKgbiGIsTRxgHCXb5zMeYXNBSYUWgvQsbJsRtg+OBdjbT/MEkfN6S3zTWJrn5+Aack6z3L3XkjCRKsMWNBdOuBb6CBWZRUOP+F271pYM5sFiwjo8qTuTzP5PHHkcfIELtLldAiGV4jFk9alinHkSedFacrJq7LYoAtDFC8O+erI6WBOPC4D+k7urS9W+e+r3hK1LqtBmMhsd
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(7916004)(136003)(39860400002)(366004)(346002)(376002)(396003)(44832011)(6916009)(6486002)(316002)(54906003)(5660300002)(8676002)(6512007)(9686003)(4326008)(33716001)(86362001)(71200400001)(478600001)(8936002)(2906002)(1076003)(76116006)(66946007)(6506007)(64756008)(91956017)(66556008)(53546011)(66476007)(26005)(186003)(33656002)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: GsjE+vdee/qNsDj8HvV1FWL3HBSlEh81qn3dSnnEXlnIGiG1gOB+Y6G0NmwHIeChq/WVAtb4i+t1eNnOj9510niLG+WbOKiQctT3EADk+Hb4sDC8+qFDG9F5VQzNuaEISMb1m5WjGZQ+ePJrCffh3y43pxnHU2HR07jplebj0P8aOc6fv3UshRUOHzIAusm7VaExhSrEpbxZV7QGEFQLA0vFa54W+AXvb9PTZKY8pFfNtgMkOBwonH+dYcesU/zux/Ola7sZQJswq6rtUyopZxKXI9qLYWMFy9j5TpoA1OBmngDY7OUN50uGz8cAM4mkFR6FHNx9T32VYNuPxA4DSUCgtYtM3XIJWU3uif681GQyan8MqzAyrs41vNqdRM1+MvGvlaI5DT5NxlRqeNxRmoQSBGD9ZgvQsjY3lgdcPKqB9ow6Rg2UCFh/bNVJ9hYHPC/NMoyZV+mD0n95HQAHYe1CT58+kvHsTfhTfStCW8A=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5C1FF4070AC0584ABDCECAF9408DC094@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2598f0c5-f741-4997-a6e7-08d7faf2ad90
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2020 06:14:09.6206
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aXCFdVos2sWr/2ALKZu9yGPeZCbzNOSu+CDD8LT/nsi5Z4IASUIj9nIETc7jA0SMPLmJj8eh2ubHuXTIotdCjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7110
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-05-18 04:36:51, Pawel Laszczak wrote:
> Hi,
>=20
> Your changes looks like:
> -			cdns3_ep0_complete_setup(priv_dev, 0, 1);
> -			/**
> -			 *  Little delay to give the controller some time
> -			 * for sending status stage.
> -			 * This time should be less then 3ms.
> -			 */
> -			mdelay(1);
>  			cdns3_set_register_bit(&priv_dev->regs->usb_cmd,
>  					       USB_CMD_STMODE |
>  					       USB_STS_TMODE_SEL(tmode - 1));
>=20
> I'm not sure whether the first line is necessary in this place  " cdns3_e=
p0_complete_setup(priv_dev, 0, 1);" .=20
> Maybe it worked accidentally on my board.=20
>=20
> I will confirm it with someone from RTL team, but as I remember the statu=
s stage for Test Mode is=20
> send automatically by controller.

Pawel, would you please confirm it with your design team? I tried to
comment out cdns3_ep0_complete_setup at cdns3_ep0_setup_phase for test
mode case, the test mode can't work. It means it still needs software
setting to notify controller to prepare status stage.

> mdelay(1) was added to give controller some time for sending=20
> Status Stage. Status Stage should be send before driver send appropriate =
Test Mode in
> usb_cmd register. If you remove mdelay it can works accidentally on your =
board.=20

If without cdns3_ep0_complete_setup(priv_dev, 0, 1) before mdelay, how
the controller knows it needs to prepare status stage, the test mode
setting code is behind than it.

The focus is: my board can't enter test mode if status stage is
prepared before set test mode, it is strange. At other controller,
eg, chipidea, we set test mode after receiving the status stage
completion interrupt, but at cdns3, there is no status stage completion
interrupt.

>=20
> Currently I don't have access for testing board so I can't recreate this =
test again.=20
>=20
> >
> >On 20-05-15 12:35:32, Felipe Balbi wrote:
> >>
> >> Hi,
> >>
> >> Peter Chen <hzpeterchen@gmail.com> writes:
> >> > It seems the yesterday's reply from nxp email account is blocked by =
ML.
> >> > Send it again.
> >> >
> >> >>
> >> >> Peter Chen <peter.chen@nxp.com> writes:
> >> >> > Each setup stage will prepare status stage at cdns3_ep0_setup_pha=
se,
> >> >>
> >> >> care to explain this a little better? The controller itself will pr=
oduce
> >> >> the status stage?
> >> >>
> >> >
> >> > Unlike the other controllers, the CDNS3 does not need to prepare TD
> >> > for status stage,
> >> > it only needs to write register bits EP_CMD.REQ_CMPL to tell the
> >> > controller the request
> >> > service is completed, and the controller itself will send ACK answer
> >> > for the Status Stage after that.
> >> > The code sequence like below:
> >> >
> >> > cdns3_ep0_setup_phase -> cdns3_ep0_complete_setup ->
> >> >             writel((send_erdy ? EP_CMD_ERDY : 0) | EP_CMD_REQ_CMPL,
> >> >                    &priv_dev->regs->ep_cmd);
> >>
> >> got it.
> >>
> >> >> Usually, the way this works is that SETUP stage must be *always*
> >> >> prepared by the SW while STATUS stage is prepared on-demand, after =
we
> >> >> get an interrupt from the controller.
> >> >>
> >> >> Also, I see a possible bug in cdns3_ep0_setup_phase():
> >> >>
> >> >>         if (result < 0)
> >> >>                 cdns3_ep0_complete_setup(priv_dev, 1, 1);
> >> >>         else if (priv_dev->ep0_stage =3D=3D CDNS3_STATUS_STAGE)
> >> >>                 cdns3_ep0_complete_setup(priv_dev, 0, 1);
> >> >>
> >> >> What happens here if result is 0 but ep0_state !=3D CNDS3_STATUS_ST=
AGE?
> >> >> Seems like you should have a "stall and restart" somewhere here as =
a
> >> >> default fallback.
>=20
> When this case when happen ?
>=20
> BTW.  I see one issue in cdns3_ep0_complete_setup.=20
>=20
> The last one in this function is incorrect:=20
> 		cdns3_allow_enable_l1(priv_dev, 1);
> should be:=20
> 		/* Resume controller before arming transfer. */
> 		__cdns3_gadget_wakeup(priv_dev);
>=20

Would you please send a patch to fix it?

Peter

--=20

Thanks,
Peter Chen=
