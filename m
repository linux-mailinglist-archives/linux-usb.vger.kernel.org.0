Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6AE5C485
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jul 2019 22:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbfGAUtG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Jul 2019 16:49:06 -0400
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]:47832 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726934AbfGAUtF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Jul 2019 16:49:05 -0400
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com [10.13.135.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6DD20C0181;
        Mon,  1 Jul 2019 20:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1562014145; bh=zAJr4jE56YicYhz5Lvm3GStIlA+3oTSD0q5n890d1+0=;
        h=From:To:CC:Subject:Date:References:From;
        b=DLEOEZSVZqisH3/5W7sfmEyN7KFat0aHlGvIwT5OWfIBs2IXkikXTqPbN4oSNjSAM
         bz5xQfh3cHQW+qiBlTx2WeAdKuQYHW/5m+T1piDGI8J56RPLeqAYJrW2HgwOkrV6Y6
         MEDgZegB4Vvf9vKFIr5iWZEH/6faijBGHx4KjzJU5vnHBP33VztKq+gA6+aOy5a24f
         XXA9GGlGP63nhDKkv4rk8ZJ2dOe8eBabmu+yExI99LaD9357knh3k8nHoTMDBKfQjD
         ETCB3RUcANW563Z1Yb4S1uxclTqkVa0rwFMZRXpRnlTklFEo+BG4dNS+59KlWrcnhI
         1B4U+aGlBuJsw==
Received: from US01WEHTC2.internal.synopsys.com (us01wehtc2.internal.synopsys.com [10.12.239.237])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 55F4BA023C;
        Mon,  1 Jul 2019 20:49:05 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC2.internal.synopsys.com (10.12.239.237) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 1 Jul 2019 13:49:01 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 1 Jul 2019 13:49:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8FudRWUSQCcy3wvusuXvklA2Uy50EOTY77j6L7919Bc=;
 b=Bv5FRTmSK+Pp3Y0tafDPpxcVu9Sbu6U1/MkJJFK+JvEVi7V5sFG6y1SEu6fJcVVJZRMWtXeJQAuhGfvCg815y11t5tpLx+ppElzrveWmCnl9E3v2Mif1gY8v4jE5YGyXIBsjz4VXs2oK4LlvpNrcwhKobxDSHE6IuCyu6ztQ3hk=
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com (10.172.78.22) by
 CY4PR1201MB0055.namprd12.prod.outlook.com (10.172.77.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Mon, 1 Jul 2019 20:48:59 +0000
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::f520:c8d1:43e6:5fc3]) by CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::f520:c8d1:43e6:5fc3%6]) with mapi id 15.20.2032.019; Mon, 1 Jul 2019
 20:48:59 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "v.anuragkumar@gmail.com" <v.anuragkumar@gmail.com>,
        Rob Weber <rob@gnarbox.com>
Subject: Re: Clarification of set_sel handling when dwc3 is a device (gadget)
Thread-Topic: Clarification of set_sel handling when dwc3 is a device (gadget)
Thread-Index: AQHVLrjzp0xnkXfqDUapp8rL9YUyuA==
Date:   Mon, 1 Jul 2019 20:48:59 +0000
Message-ID: <CY4PR1201MB0037D801D920ACAD8B4CF3B6AAF90@CY4PR1201MB0037.namprd12.prod.outlook.com>
References: <6dbe8df06875947d7ea6d6a21f83ac68315c0ef4.camel@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [198.182.56.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f644760-111d-455c-6eee-08d6fe658ada
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:CY4PR1201MB0055;
x-ms-traffictypediagnostic: CY4PR1201MB0055:
x-microsoft-antispam-prvs: <CY4PR1201MB0055AD86B03FEE59E42F5A34AAF90@CY4PR1201MB0055.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(366004)(136003)(396003)(376002)(39860400002)(189003)(199004)(66446008)(64756008)(73956011)(66556008)(66476007)(76116006)(91956017)(66946007)(486006)(6436002)(71190400001)(102836004)(71200400001)(8936002)(446003)(476003)(52536014)(14444005)(256004)(5660300002)(6506007)(2501003)(86362001)(33656002)(74316002)(6636002)(7736002)(2906002)(305945005)(68736007)(316002)(54906003)(110136005)(3846002)(478600001)(6116002)(25786009)(53936002)(99286004)(6246003)(4326008)(9686003)(7696005)(76176011)(81166006)(55016002)(186003)(229853002)(81156014)(26005)(14454004)(66066001)(8676002)(473944003);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR1201MB0055;H:CY4PR1201MB0037.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 09dYnKyieHmS5HWA/9Il0+N5tx1eJBcxni5Bdm8MNAhuX2yDmw11sAf0oYjsZUGoPAVdplHS056YaTdeW9+d8yDddYhpyIfL/R6ymTvu3i835CuY3NBznyNpzQ5oEEmsTFsYYmZC6vnnZHV/PCL1BMRT0WC3IejpHLhIr4zk8Xf0SrtXzmGfHvCiMDDd8JfVkMXoiHXBo+CSCh+qg2KdsBqSrifzA61j0ZY5OjMcHaZSlxpdrTfOYrLLswTP+A2cr/bdLsmkmLSz5hpDqnR2U2aSJzyFTupfnNHilBD5qADrx533RPK5auXD59GhA9iHK83O164b5NKfbzCdF3rgB7fRLRzJZfSEPTYML+AEY/1Nk/9j2gq8xWSHKYemOw7nsLdj3wUciiGdRxjrcjPmAeYVgSX2zPDokLCEAnAPEtY=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f644760-111d-455c-6eee-08d6fe658ada
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 20:48:59.2995
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: thinhn@synopsys.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0055
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,=0A=
=0A=
claus.stovgaard@gmail.com wrote:=0A=
> Hi=0A=
>=0A=
> I have earlier worked with the possibility for disabling U1/U2 to solve=
=0A=
> an issue where the dwc3 acting as a gadget device sometimes failing to=0A=
> leave U2.=0A=
>=0A=
> Analyzing the situation when the dwc3 failing to leave U2, it happens=0A=
> when the link is in U2 after timeout from U1, and when the device wants=
=0A=
> to leave U2. Not when the host wants to leave U2.=0A=
>=0A=
> Going back the BOS descriptor from the device reports=0A=
>=0A=
> bU1DevExitLat 1us=0A=
> bU2DevExitLat 500us=0A=
>=0A=
> And the SetSystemExitLatency control transfer ends with=0A=
>=0A=
> U1 System Exit Latency 86 us=0A=
> U1 Device to Host Exit Latency 1 us=0A=
> U2 System Exit Latency 585 us=0A=
> U2 Device to Host Exit Latency 500 us=0A=
>=0A=
> Looking at the length of LFPS etc. it seems that the U2 exit is just=0A=
> above 80 us,and it start link training just after.=0A=
>=0A=
> So I was wandering how the exit latency of the system is communicated=0A=
> to dwc3 core, and found the following code from ep0.c=0A=
> dwc3_ep0_set_sel_cmpl=0A=
>=0A=
> ----=0A=
> reg =3D dwc3_readl(dwc->regs, DWC3_DCTL);=0A=
> if (reg & DWC3_DCTL_INITU2ENA)=0A=
> 	param =3D dwc->u2pel;=0A=
> if (reg & DWC3_DCTL_INITU1ENA)=0A=
> 	param =3D dwc->u1pel;=0A=
=0A=
This is incorrect. If the controller is enabled for both U1 and U2, then=0A=
periodic param is U2PEL. If the controller is only enabled for U1, then=0A=
U1PEL is used. Probably the original author intended but missed the=0A=
"else" on the second if case.=0A=
=0A=
> /*=0A=
>  * According to Synopsys Databook, if parameter is=0A=
>  * greater than 125, a value of zero should be=0A=
>  * programmed in the register.=0A=
>  */=0A=
> if (param > 125)=0A=
> 	param =3D 0;=0A=
>=0A=
> /* now that we have the time, issue DGCMD Set Sel */=0A=
> ret =3D dwc3_send_gadget_generic_command(dwc,=0A=
> 		DWC3_DGCMD_SET_PERIODIC_PAR, param);=0A=
> WARN_ON(ret < 0);=0A=
> ----=0A=
>=0A=
> I don't have access to Synopsys Databook, so I am puzzled about=0A=
> the DWC3_DGCMD_SET_PERIODIC_PAR command. The code favor to use the=0A=
> device to host exit latency, and use the u1 if present over the u2.=0A=
>=0A=
> So the dwc3 core never get the system exit latency times, and they just=
=0A=
> disapeer.=0A=
>=0A=
> I hope that someone have access to the Databook, and is able to share=0A=
> some details about the set periodic command and the parameter.=0A=
>=0A=
=0A=
According to the databook, currently the controller doesn't use these=0A=
programmed values. It uses the value from CoreConsultant configuration=0A=
setting.=0A=
=0A=
BR,=0A=
Thinh=0A=
