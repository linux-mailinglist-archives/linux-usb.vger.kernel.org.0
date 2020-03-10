Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33F8D17F189
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2020 09:14:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgCJIOx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Mar 2020 04:14:53 -0400
Received: from mail-am6eur05on2072.outbound.protection.outlook.com ([40.107.22.72]:44282
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725919AbgCJIOx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Mar 2020 04:14:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OqFMrwVE4YuOvg4ELNKlKqqfPppfrx8Ix0IK9imSbHZLP2i3xtoTx+PLWpujtpJC2SPvRTFrkQ65sCyZBjfnxrMxpnwbbMu8UQB7WHIdL49MbJ+slmR1non86wIYqGGoFEK2sDoZWgfeV7sWxnTZKurfW/DNRxOkci2PNk1YBebv8CqM5SCukWKgUDmUOhIcupV4BOGUAEpV7wXwwT0BpHriPXUISQruNcpUuPUAO4ttBVFmw797Vd+YUxu3WQESzDryXuI7D5+x4XVFk7Qc6X8bP/F5H77mkKTIiymb+/63pMThFndLUAD5eIPUNUdwZ0CfOjmMEbKhXoIGyAtEPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APcFK7GAffeujSGWJkhKw8eseRnSwDlGyHUiK/aOzKk=;
 b=UTHdmNcgB3C0jUHRaqqUOvF2LbCWymKY45OXabwrv5ODrgtmxfpNjqzpGt/cxAk8om9L1O+R5mkKSlhelN3LVqcA2AWHmnZaGvmc5PRowHIAX5KlFBuF8Y4chvxtPxHUWDO5fnH6IVAloLr+GX7acB8LnpRzQulco0fVFSh0xlhOrxtOaeFNvQT0uwTYzB5YKfk7NEIHVYN5Tb3+rcRVI3zJHpBYa4myz1gdVNEGmas7DrpwrVUU921FRL/I8zsN74wJcT/19xLUr1ojvBGMuZd2Chl9tYJdlo9PDSaczrhkVwKRiqNji0H1nBdSCAEjjUIkg6JAztvXhrrXEfT9/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APcFK7GAffeujSGWJkhKw8eseRnSwDlGyHUiK/aOzKk=;
 b=MXQvKPtFZzwxG/gWjU20xVnRw9V5b28FkX231boZ/aa4ZdcT9CdA10Qjqbz1eTmb84sYJIrPH7caaBA5yuPJsn3cY3WOKCtHBzn3cbyDuPBA0ulCC/nmjjJx7UAwdJx/TgZ32mWM5K910wS5I//apQM5qg+OdHa7odZWxV91ywo=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB6287.eurprd04.prod.outlook.com (20.179.27.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.17; Tue, 10 Mar 2020 08:14:49 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1%7]) with mapi id 15.20.2793.013; Tue, 10 Mar 2020
 08:14:49 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Jonas Karlsson <jonas.karlsson@actia.se>
CC:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Oliver Neukum <oneukum@suse.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: Re: USB transaction errors causing RCU stalls and kernel panics
Thread-Topic: USB transaction errors causing RCU stalls and kernel panics
Thread-Index: AdXxbFdECZ2tmAAoQZaxVkfgHyprqgADgE2AAAdLkAAAIaJ9AAAEO3aAAAR/HgAARWqdUACx3DMAACV4xgA=
Date:   Tue, 10 Mar 2020 08:14:49 +0000
Message-ID: <20200310081452.GA14625@b29397-desktop>
References: <ddf8c3971b8544e983a9d2bbdc7f2010@actia.se>
 <20200303163945.GB652754@kroah.com>
 <ca6f029a57f24ee9aea39385a9ad55bd@actia.se>
 <6909d182-6cc5-c07f-ed79-02c741aec60b@linux.intel.com>
 <1583331173.12738.26.camel@suse.com>
 <4fa64e92-64ce-07f3-ed8e-ea4e07d091bb@linux.intel.com>
 <VI1PR04MB532785057FD52DFE3A21ACA88BE30@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <699a49f2f69e494ea6558b99fad23cc4@actia.se>
In-Reply-To: <699a49f2f69e494ea6558b99fad23cc4@actia.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6efcae2d-d386-466b-fbd3-08d7c4cb1a2b
x-ms-traffictypediagnostic: VI1PR04MB6287:
x-microsoft-antispam-prvs: <VI1PR04MB62873C491B4B94AFB37D44978BFF0@VI1PR04MB6287.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 033857D0BD
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(7916004)(376002)(396003)(346002)(136003)(366004)(39860400002)(189003)(199004)(81156014)(6512007)(86362001)(66446008)(81166006)(8936002)(9686003)(54906003)(91956017)(66476007)(478600001)(66946007)(64756008)(316002)(6486002)(76116006)(8676002)(66556008)(2906002)(44832011)(6916009)(186003)(26005)(33656002)(5660300002)(1076003)(4326008)(6506007)(33716001)(71200400001)(53546011);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB6287;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Tniu3Wk3Tvjd11ZwK4OZnF6A7haj0kTRSrALUdGeB5VCUWuBF8JAxr0ykjUSO8h5E97AQbiyCa9oEBKDGsUT7ciE039/PwB9lNizlLDxj66lxeTRtijXR08ZweSmzdH7uXncd96m+1AFvs2kCV0XLotu84Q0wgcGRC5w5gLizq4b+56D4W4Df8pzEkP7rYALogx3h6gKYPQVfsQBrnOVHcAcRnc/lF2Qo+ezBsHc0gwAtFSpuUoIKQ4cm4mk9kTR5po9W9+5cwBkhUHPhNfLXRYaD/ZXZznkiLvr6L5lj6gxbSX3u66T3TGJMI/N/defSMhXLa1ZGQTzLX1SWoHqVSU3JDs93mYSBXtQI8nz7JwEEjaUY+x3aZkw0RoLiBdkXr8wJp3nhUMz1+4MSUxlpc0UeKNrOrArExZy/2OGvUdovbLcW2wp1CMvPXAEro+t
x-ms-exchange-antispam-messagedata: ich2WbqBCfR/Ipw0OYZUaJPxw/v3aLuF8BWcO+wfVQzjRcjtfppCGgjucKfJCVS8Oc8mpwStILeqZ3hkHAD8cCkOCRlsMn+8J4k+XaddpC+0JCPRYIYmbKmfzJZSrVfA56ZhUb3MkTSDWs5YaDWkIg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <70E10BD5720F714A92AB6D4410D71782@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6efcae2d-d386-466b-fbd3-08d7c4cb1a2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2020 08:14:49.1650
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DnaufGuY+VneSS/8npWeA2/s84M/54HQ1fazHANMWF6XpTfXB2oHaM4GrOR1gtBSIoJgu8DYW/7SyGWz7adkmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6287
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-03-09 14:21:56, Jonas Karlsson wrote:
> >=20
> > If autosuspend is suspicious, Jonas, could you please try to disable au=
tosuspend
> > for all USB devices (including the roothub and controller) to see what =
happens?
> >=20
> > Peter
>=20
> I have run some tests with autosuspend turned off by doing this:
> for i in $(find /sys -name control | grep usb);do echo on > $i;echo "echo=
 on > $i";done;
>=20
> To make our modem misbehave we need to cool it down in a temp chamber whi=
ch I haven't had
> access to the past days. However we have found two other ways to reproduc=
e the event storm causing
> event ring full messages spamming the logs. The pattern in the attached f=
ile repeats itself until I
> unbind the driver.

Hi Jonas,

Do you have below commit at your local tree? If you have, I am puzzled
why you still get "Event Ring Full Error" error, maybe Mathias have the
answer?

commit dc0ffbea5729a3abafa577ebfce87f18b79e294b
Author: Peter Chen <peter.chen@nxp.com>
Date:   Fri Nov 15 18:50:00 2019 +0200

    usb: host: xhci: update event ring dequeue pointer on purpose

@Mathias, could xhci design some software retry limits for transaction
error? It may avoid retry storm due to hardware issue (eg, signal
issue). For EHCI, there is a design to define QH_XACTERR_MAX at
qh_completions for that.

Peter

>=20
> 1. If we power up the modem and wait until the modem is enumerated and th=
en turn off the=20
> VUSB supply to modem which supplies the USB port on the modem we see a co=
ntinuous flow=20
> of Unknown event type 37.
>=20
> Or
>=20
> 2. If we power up the modem and wait until the modem is enumerated and th=
en pull the reset
> pin of the USB hub that sits between the modem and the SoC we also see a =
continuous flow of=20
> Unknown event type 37.
>=20
> According to the USB hub datasheet this happens when the reset pin is pul=
led:
> "The PHYs are disabled, and the differential pairs will be in a high-impe=
dance state."
>=20
> Having autosuspend enabled or disabled does not seem to make a difference=
 in this case.=20
>=20
> BR,
> Jonas

> [  674.915892] cdc_acm 1-1.1:1.5: acm_read_bulk_callback - nonzero urb st=
atus received: -71
> [  674.915902]  xhci-cdns3: Ignoring reset ep completion code of 1
> [  674.915912]  xhci-cdns3: Successful Set TR Deq Ptr cmd, deq =3D @960d4=
570
> [  674.915968]  xhci-cdns3: Transfer error for slot 2 ep 10 on endpoint
> [  674.915979]  xhci-cdns3: Cleaning up stalled endpoint ring
> [  674.915983]  xhci-cdns3: Finding endpoint context
> [  674.915988]  xhci-cdns3: Cycle state =3D 0x1
> [  674.915993]  xhci-cdns3: New dequeue segment =3D 00000000641e49ab (vir=
tual)
> [  674.915998]  xhci-cdns3: New dequeue pointer =3D 0x960d4580 (DMA)
> [  674.916002]  xhci-cdns3: Queueing new dequeue state
> [  674.916009]  xhci-cdns3: Set TR Deq Ptr cmd, new deq seg =3D 000000006=
41e49ab (0x960d4000 dma), new deq ptr =3D 00000000dae0365c (0x960d4580 dma)=
, new cycle =3D 1
> [  674.916014]  xhci-cdns3: // Ding dong!
> [  674.916020]  xhci-cdns3: Giveback URB 0000000007a5ed65, len =3D 0, exp=
ected =3D 1024, status =3D -71
> [  674.916028] cdc_acm 1-1.1:1.5: acm_read_bulk_callback - nonzero urb st=
atus received: -71
> [  674.916035]  xhci-cdns3: Ignoring reset ep completion code of 1
> [  674.916044]  xhci-cdns3: Successful Set TR Deq Ptr cmd, deq =3D @960d4=
580
> [  674.916064]  xhci-cdns3: Transfer error for slot 2 ep 10 on endpoint
> [  674.916073]  xhci-cdns3: Cleaning up stalled endpoint ring
> [  674.916077]  xhci-cdns3: Finding endpoint context
> [  674.916081]  xhci-cdns3: Cycle state =3D 0x1
> [  674.916086]  xhci-cdns3: New dequeue segment =3D 00000000641e49ab (vir=
tual)
> [  674.916091]  xhci-cdns3: New dequeue pointer =3D 0x960d4590 (DMA)
> [  674.916094]  xhci-cdns3: Queueing new dequeue state
> [  674.916102]  xhci-cdns3: Set TR Deq Ptr cmd, new deq seg =3D 000000006=
41e49ab (0x960d4000 dma), new deq ptr =3D 00000000d9f5f1c1 (0x960d4590 dma)=
, new cycle =3D 1
> [  674.916106]  xhci-cdns3: // Ding dong!
> [  674.916113]  xhci-cdns3: Giveback URB 000000008a0a9417, len =3D 0, exp=
ected =3D 1024, status =3D -71
> [  674.916119] cdc_acm 1-1.1:1.5: acm_read_bulk_callback - nonzero urb st=
atus received: -71
> [  674.916126]  xhci-cdns3: Ignoring reset ep completion code of 1
> [  674.916135]  xhci-cdns3: Successful Set TR Deq Ptr cmd, deq =3D @960d4=
590
> [  674.916149]  xhci-cdns3: Transfer error for slot 2 ep 10 on endpoint
> [  674.916157]  xhci-cdns3: Cleaning up stalled endpoint ring
> [  674.916161]  xhci-cdns3: Finding endpoint context
> [  674.916166]  xhci-cdns3: Cycle state =3D 0x1
> [  674.916170]  xhci-cdns3: New dequeue segment =3D 00000000641e49ab (vir=
tual)
> [  674.916175]  xhci-cdns3: New dequeue pointer =3D 0x960d45a0 (DMA)
> [  674.916178]  xhci-cdns3: Queueing new dequeue state
> [  674.916186]  xhci-cdns3: Set TR Deq Ptr cmd, new deq seg =3D 000000006=
41e49ab (0x960d4000 dma), new deq ptr =3D 0000000094b88dce (0x960d45a0 dma)=
, new cycle =3D 1
> [  674.916190]  xhci-cdns3: // Ding dong!
> [  674.916197]  xhci-cdns3: Giveback URB 000000003dad7325, len =3D 0, exp=
ected =3D 1024, status =3D -71
> [  674.916204] cdc_acm 1-1.1:1.5: acm_read_bulk_callback - nonzero urb st=
atus received: -71
> [  674.916211]  xhci-cdns3: Ignoring reset ep completion code of 1
> [  674.916219]  xhci-cdns3: Successful Set TR Deq Ptr cmd, deq =3D @960d4=
5a0
> [  674.916251]  xhci-cdns3: Transfer error for slot 2 ep 10 on endpoint
> [  674.916261]  xhci-cdns3: Cleaning up stalled endpoint ring
> [  674.916265]  xhci-cdns3: Finding endpoint context
> [  674.916270]  xhci-cdns3: Cycle state =3D 0x1
> [  674.916274]  xhci-cdns3: New dequeue segment =3D 00000000641e49ab (vir=
tual)
> [  674.916279]  xhci-cdns3: New dequeue pointer =3D 0x960d45b0 (DMA)
> [  674.916282]  xhci-cdns3: Queueing new dequeue state
> [  674.916290]  xhci-cdns3: Set TR Deq Ptr cmd, new deq seg =3D 000000006=
41e49ab (0x960d4000 dma), new deq ptr =3D 0000000000ad0b83 (0x960d45b0 dma)=
, new cycle =3D 1
> [  674.916294]  xhci-cdns3: // Ding dong!
> [  674.916301]  xhci-cdns3: Giveback URB 0000000077103065, len =3D 0, exp=
ected =3D 1024, status =3D -71


--=20

Thanks,
Peter Chen=
