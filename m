Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FB241D76BE
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2020 13:21:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbgERLVg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 May 2020 07:21:36 -0400
Received: from mail-vi1eur05on2087.outbound.protection.outlook.com ([40.107.21.87]:12275
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726499AbgERLVg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 May 2020 07:21:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dNKJJRwOOv4hKOIY2bv4pmQY01mHLCrfmgmeFT7M55CryMfkpjuUkqjrCfuWrF8e6D1/r+1CvDD3c8sL7zSJgxN/XAeGsG0NXr4PHT+ARTvM70wMItNmhDl7MMnjXoWH7+HfsDazXDgwNtvrgB/ZseCjUleUUdxUJBYisqz/0mVcUHzW1DvrLlMOAgEtFi5q9i183nUWBVB0kl94TqGpCKP/g+dQtFsUQCDQZFUucWh4BY2940gmHA7rv1FXfPwxiTx+WVgQhQ2hrRVrbui/8nW718H7BYdn8MrDkaKkNXiN77unneNEvjiqgHl697hsAgtLq7UYOoTn1e/ZiO2MsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZsz5TchsqB1ukXlelw6gokXZAyE5oAfjTjsH9mjGcw=;
 b=EzFsgE263usSIIefuyQZjFoktJlbtex/iVpngBFqz1lgkCcT+CbG8Mg65o9o2B/y7OcKRJWGfTWq7KB7Afqc6acxQl47diGy2+ujnmb/r4s69UAPTia2n2zZzXyuTo7SH/ZuU532kyjijmWxD2OzuyEDbZ1gkNtuAS2X4vpoctDhASwaTayEafVPVyCJtUeokn764Y/DG/KXVnRQsKfpHmzEx8hY4o3mBR3+N6fbwR8nNjP7hmUleZjB7ZOyGtO6slKi5471ARY6YdQ+fJwV2/JMLkZqGUlutaJmn1Zz7VkJup4yJIEtjMNAIJOS8p7zlm4mutL691RDAz4jsNsiOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZsz5TchsqB1ukXlelw6gokXZAyE5oAfjTjsH9mjGcw=;
 b=OeTgZGCfc+/HQ7aPrVKLVPK0VFc/y8jXY9SxPfu84r0iyZR/esORTwMTI07fYxZsIwMop75l+1v3CG8yFqVFnKLvrZy+utwED+BuxqPPOEQ0OkYP7BHDujwBbYFt9AkWqKwz6vn3L8F5bKtuvym3QIIsRtrsXw7QGjjVrecJmTU=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7079.eurprd04.prod.outlook.com (2603:10a6:20b:11d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25; Mon, 18 May
 2020 11:21:33 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::7c34:7ade:17d0:b792%9]) with mapi id 15.20.3000.034; Mon, 18 May 2020
 11:21:33 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Pawel Laszczak <pawell@cadence.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Peter Chen <hzpeterchen@gmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH 1/1] usb: cdns3: ep0: delete the redundant status stage
Thread-Topic: [PATCH 1/1] usb: cdns3: ep0: delete the redundant status stage
Thread-Index: AQHWG8utTtXaQQv5R0ONjsi6OGoclaiZK+EAgAKs4wCADSf/AIAEVoaAgAANBYCAABtOgIAAJeAAgAAvpqA=
Date:   Mon, 18 May 2020 11:21:33 +0000
Message-ID: <AM7PR04MB7157D5C811E0772B84842B798BB80@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <20200426130751.32556-1-peter.chen@nxp.com>
 <87368ebz3d.fsf@kernel.org>
 <CAL411-q4euWFrJ5Sp+tocBEsXXYkviQXt_pz_SyHHC=ELNf_sQ@mail.gmail.com>
 <87ftc135i3.fsf@kernel.org> <20200518035015.GB27612@b29397-desktop>
 <DM6PR07MB5529DFE46AD0CA63C740D39FDDB80@DM6PR07MB5529.namprd07.prod.outlook.com>
 <20200518061435.GD27612@b29397-desktop>
 <DM6PR07MB55294A6614050A8B424FD1CBDDB80@DM6PR07MB5529.namprd07.prod.outlook.com>
In-Reply-To: <DM6PR07MB55294A6614050A8B424FD1CBDDB80@DM6PR07MB5529.namprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: cadence.com; dkim=none (message not signed)
 header.d=none;cadence.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0a2f9d1a-03fd-4ce2-f32a-08d7fb1d9ef8
x-ms-traffictypediagnostic: AM7PR04MB7079:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB7079F7A94F783964A7C10EBE8BB80@AM7PR04MB7079.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04073E895A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YzG4sp3kNfJoPPcM+pblfi9lTFEc0HsMGtTKGitQ8P8q0o1cyexxxPkO3d24UW303tf773zhiNDj3GJh1pknN4K7rnbWzp5ya3kqneUf4KTl18yOvZCsLDHKNEwAyGTPf7G1SGYKNIQTTUSytKQ+1GVMuHbMsRsnt1xmUgDH9BS8OogmeL9kdI3RWGKoY7I/Nzt9wjkaODiqVt9UKjP5OUmY84ZIbO+hdRo6ksUxhKsxISQLyrWqifbV/eciJm8ivEHDpj69mZ+H2LP5ibaPcwl9vJHJEp2Pva8TPBRGnWmFkPdX76wteIzrXJZi49ZSRwE0LT3ofQvFxHV//i1zvGH+92+tMTY5Rm3rPp7bu9O46vIb0dOS9UCmopuHaqxppdYDHh7ot02iSy1vnLCv+DhEqb6O8ovnAvDzjag1R4VZ7+j7U5mbw7L13c0jrZf7
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(8676002)(5660300002)(54906003)(86362001)(66946007)(55016002)(71200400001)(4326008)(76116006)(316002)(7696005)(2906002)(9686003)(478600001)(6506007)(186003)(6916009)(44832011)(52536014)(64756008)(66446008)(66556008)(33656002)(26005)(66476007)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: nGNCewtZtNrr9uk3WTtkzyCu0Qa7KotOe2vOfyzZiV9tsQp4nm7ZQGSydO4bciEB//31FCBD2i1qiMkgbJ5kvD94ta5gGqc1fMa0bkDKuoqoMsvbdv1LM5bTtvuA1NQ1tTKJ0vqYkZugC/uSNygDa6jF3ZWi5MpekKWao9u+OuC0NcNaroW9+8KX78MBdUZQYruj+/zrZIRDReHlPCWM4wYL6AhkVpETDDmTzQ4b4Pt0o6E/O5GUQuApTWZogYehmbcFkAzcuepFNR6PIfCdZVAs8yJfJng22mQY2ADpjsZpk3mtZJi8ZpL7bE2/r+3HNvTbt5xcpO/J+QacskgGh2DZUxFBk2yJ3LYbSfZulOIpNPdYiOv55YgEaa+8vRMwR6ldEn9lVz6HdI6ivgtE8WoAIFh2n/344e+7HWXpmGFZAiXqNY9D30Z6oOiLc9fg7IFKm/lz/HfGTQB0MyZe4Z1aL6qaEoF8EKFP5OJMwNs=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a2f9d1a-03fd-4ce2-f32a-08d7fb1d9ef8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2020 11:21:33.4808
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9kQuSnpssmdNFwFPH8tF62r52asmp0SkDXX/acNNh+2LsjXV2qmd4zparGAUJU1+oCh7NedyNv85a0HcYazq5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7079
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
> >Pawel, would you please confirm it with your design team? I tried to
> >comment out cdns3_ep0_complete_setup at cdns3_ep0_setup_phase for test
> >mode case, the test mode can't work. It means it still needs software
> >setting to notify controller to prepare status stage.
>=20
> Sorry. I got something wrong. You have right.  Driver must prepare Status=
 Stage
> itself.
> It's means that origin code is really incorrect and driver sends the seco=
nd Status
> Stage twice.
>=20
> Hardware team confirm also that setting Test Mode in usb_cmd can be done =
before
> sending Status Stage. Test Mode should start automatically after sending =
Status
> Stage by controller.
>=20
>=20

Thanks, Pawel.

If this patch is ok, could you please add your reviewed-by?

Peter

> >
> >> mdelay(1) was added to give controller some time for sending Status
> >> Stage. Status Stage should be send before driver send appropriate
> >> Test Mode in usb_cmd register. If you remove mdelay it can works accid=
entally
> on your board.
> >
> >If without cdns3_ep0_complete_setup(priv_dev, 0, 1) before mdelay, how
> >the controller knows it needs to prepare status stage, the test mode
> >setting code is behind than it.
> >
> >The focus is: my board can't enter test mode if status stage is
> >prepared before set test mode, it is strange. At other controller, eg,
> >chipidea, we set test mode after receiving the status stage completion
> >interrupt, but at cdns3, there is no status stage completion interrupt.
> >
> >>
> >> Currently I don't have access for testing board so I can't recreate th=
is test again.
> >>
> >> >
> >> >On 20-05-15 12:35:32, Felipe Balbi wrote:
> >> >>
> >> >> Hi,
> >> >>
> >> >> Peter Chen <hzpeterchen@gmail.com> writes:
> >> >> > It seems the yesterday's reply from nxp email account is blocked =
by ML.
> >> >> > Send it again.
> >> >> >
> >> >> >>
> >> >> >> Peter Chen <peter.chen@nxp.com> writes:
> >> >> >> > Each setup stage will prepare status stage at
> >> >> >> > cdns3_ep0_setup_phase,
> >> >> >>
> >> >> >> care to explain this a little better? The controller itself
> >> >> >> will produce the status stage?
> >> >> >>
> >> >> >
> >> >> > Unlike the other controllers, the CDNS3 does not need to prepare
> >> >> > TD for status stage, it only needs to write register bits
> >> >> > EP_CMD.REQ_CMPL to tell the controller the request service is
> >> >> > completed, and the controller itself will send ACK answer for
> >> >> > the Status Stage after that.
> >> >> > The code sequence like below:
> >> >> >
> >> >> > cdns3_ep0_setup_phase -> cdns3_ep0_complete_setup ->
> >> >> >             writel((send_erdy ? EP_CMD_ERDY : 0) | EP_CMD_REQ_CMP=
L,
> >> >> >                    &priv_dev->regs->ep_cmd);
> >> >>
> >> >> got it.
> >> >>
> >> >> >> Usually, the way this works is that SETUP stage must be
> >> >> >> *always* prepared by the SW while STATUS stage is prepared
> >> >> >> on-demand, after we get an interrupt from the controller.
> >> >> >>
> >> >> >> Also, I see a possible bug in cdns3_ep0_setup_phase():
> >> >> >>
> >> >> >>         if (result < 0)
> >> >> >>                 cdns3_ep0_complete_setup(priv_dev, 1, 1);
> >> >> >>         else if (priv_dev->ep0_stage =3D=3D CDNS3_STATUS_STAGE)
> >> >> >>                 cdns3_ep0_complete_setup(priv_dev, 0, 1);
> >> >> >>
> >> >> >> What happens here if result is 0 but ep0_state !=3D
> CNDS3_STATUS_STAGE?
> >> >> >> Seems like you should have a "stall and restart" somewhere here
> >> >> >> as a default fallback.
> >>
> >> When this case when happen ?
> >>
> >> BTW.  I see one issue in cdns3_ep0_complete_setup.
> >>
> >> The last one in this function is incorrect:
> >> 		cdns3_allow_enable_l1(priv_dev, 1); should be:
> >> 		/* Resume controller before arming transfer. */
> >> 		__cdns3_gadget_wakeup(priv_dev);
> >>
> >
> >Would you please send a patch to fix it?
> >
> >Peter
> >
> >--
> >
> >Thanks,
> >Peter Chen
>=20
> Pawel
