Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8073AEFC66
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2019 12:31:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730804AbfKELbC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Nov 2019 06:31:02 -0500
Received: from smtprelay-out1.synopsys.com ([198.182.47.102]:59686 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730757AbfKELbC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Nov 2019 06:31:02 -0500
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 79E2DC0E9A;
        Tue,  5 Nov 2019 11:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1572953461; bh=VGgwZ4E28SmEX+4TQdaNc39IBoIjQR73fNZBGBUmv2Y=;
        h=From:To:Subject:Date:References:In-Reply-To:From;
        b=FNxbb+q5p4V4jtBX4I1oH9FMndKJmTv/Tm2xtboMzf+ff5J3w9bM/fbfKz+fAYQ9N
         uci8PoxgZkJbGJikT6BmyBAu2XDOScDPJG+YX9dj3FRT+hr6MmkQK3fZh8w4ztEf5C
         4DNQaVrs/55EXEU1QhBlg4oWnM4HbttS8s2eRqpBPaixi42FMpyUkioc3xJ+e3ByW0
         qXgbwhuTvdihINSlqfXgLJfPNUBOe+9XWIAlQ50PxAzsL0CxRUuNdNuJWsb8mEoOTQ
         Y/opi1kgnqEVWaWHQjCDqgbNoY0T3mnvJOkFwtvv7cr+EmBQIuQO+eLPtunJxaFWI0
         NVeaSDV4E38ug==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 10A34A006B;
        Tue,  5 Nov 2019 11:30:51 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 5 Nov 2019 03:30:46 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 5 Nov 2019 03:30:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HoAavoIDpn7+XrkYzpN1jPMk7FU05OmzhCd/jwwEEyAK7kHyTjkKXSslDjwc7Cu9wDQ+oFANkCeMrmreXEMco/aAWc5HjI3ZSwbC3DtVXLEjtbLIgTXVk9kZvS+Lxp4IAr93Hf/N3NIHMfIdZ2qtDGdCGPJuB467nH6jS+NEm+xfccHKcIeEOmr1mQBTE55Xyqq9UhrMr6ELW7VliHNtkg9alZErQF0c/bBLTzXomG5JQMJr1B/1PtPsmRtN2PBhR8wJ2qA2LTxrxUHo25s4+X0yrFPMqAEs8e2FGRCfQAe7hCqEN5gNi/OAJosShiqE1OxO/Iytbnhfk1t7kaaJrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4TVJe1U3RSOKD27H08bkZKuhqg/WWHadH5xh+I5eR0=;
 b=nOHi4q6JrQcuzunBNLDtB7vZBjAd++ob0thvMuicqQ7qBn4qzqQnJv1pwhO7m5FwnGSSaf0aGj6J27eVK0Ps+Y1XUS6YYcHp4O+uaPWBQbTKqmhQCDNQpYI8ivdFTz9newjaULaOPJeYQ6+a0TpXTAbaUtQuxvaywhMJNql02NryRqgnpfgZDfgFrW4+u7M6/X94LEyxIitWG0hqEPOTVbP0HPGD98XtxaloPTJG1bU7pJ2vMm5PXfqKLK8S6DI8qhxIGEhPd4jx1eUtLPx3gpvHFvAdFFQf3gVsPk6QXWi3RoqLw+Voe/coMecnPZjSqqNHnFpWqnal1bVvcusBMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4TVJe1U3RSOKD27H08bkZKuhqg/WWHadH5xh+I5eR0=;
 b=AIxaMxkDHf/HE5gPo7lMyZIRAMuW3k/TOVw6jV2JuQ4HVu7en6Z/jwP7YL5Cxomzzr0bpsijiLnXq/6gHy1IciQ5v73S8L+lV58fo4p8nMRxSK0QAZ0iO+GCJUJBjjJLNdLl0DJ8KNywrw0flm7U0+EONFYhw9NJEUpA2S/6Fqc=
Received: from MN2PR12MB4093.namprd12.prod.outlook.com (52.135.51.203) by
 MN2PR12MB4064.namprd12.prod.outlook.com (52.135.48.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Tue, 5 Nov 2019 11:30:45 +0000
Received: from MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::85e4:7eb9:af8d:8a9]) by MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::85e4:7eb9:af8d:8a9%3]) with mapi id 15.20.2430.020; Tue, 5 Nov 2019
 11:30:45 +0000
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: usb: dwc2: Re: Maximum packet size in dwc2 gadget HS mode < 1024
Thread-Topic: usb: dwc2: Re: Maximum packet size in dwc2 gadget HS mode < 1024
Thread-Index: AQHVijUBxoK/MK6P90arc2M4mai0sadpvf8AgA30FACABNJvAA==
Date:   Tue, 5 Nov 2019 11:30:45 +0000
Message-ID: <7f1b3cc0-718c-731a-4069-809bf2b2dca4@synopsys.com>
References: <3496ebef-c3b6-d884-8bd8-fed48e875b10@ivitera.com>
 <52dc70dc-86e4-c47a-ae49-1f201b066b2e@ivitera.com>
 <97fed6c8-e780-021f-4f93-64701a14bc3f@synopsys.com>
 <60def6a9-89f3-d7b9-4bc1-2f1a7a5ce769@synopsys.com>
 <deb8918a-14f5-ca3f-53d5-0d99d406fc3c@ivitera.com>
 <79aba6ae-befe-878e-cc17-e1fde9ac6a80@ivitera.com>
 <926c3136-1979-4df7-0afb-a91df9a2ab01@synopsys.com>
 <5f7cc638-ed27-8f8f-95db-c1b198ebb8f5@ivitera.com>
In-Reply-To: <5f7cc638-ed27-8f8f-95db-c1b198ebb8f5@ivitera.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hminas@synopsys.com; 
x-originating-ip: [195.10.9.50]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 19f3c559-4c17-4ad9-314a-08d761e3992e
x-ms-traffictypediagnostic: MN2PR12MB4064:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4064F9AF5E58C22FAEC9AD94A77E0@MN2PR12MB4064.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0212BDE3BE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(376002)(396003)(136003)(366004)(346002)(52314003)(189003)(199004)(305945005)(486006)(256004)(2501003)(36756003)(102836004)(76176011)(6486002)(6246003)(6512007)(8676002)(3846002)(6116002)(5024004)(66476007)(66556008)(71200400001)(6436002)(14454004)(66946007)(64756008)(31696002)(316002)(14444005)(76116006)(476003)(31686004)(478600001)(186003)(58126008)(2906002)(86362001)(6506007)(26005)(8936002)(7736002)(91956017)(71190400001)(66446008)(11346002)(53546011)(65806001)(66066001)(99286004)(5660300002)(446003)(65956001)(2616005)(229853002)(81166006)(81156014)(25786009)(110136005);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR12MB4064;H:MN2PR12MB4093.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PB5k97jCB/7YiiR+PPxkcTaUeNN5BXaUAuzNH5oINqo5g/B3yend75be/6P9ew9bV+va7tZwd/KtDXW9HZSzkkMA/GNiCR4ciuE8E9ndUx+prVS5VjiJXtgzBPBlN5SlwNbSimab03k8tO9uRqsAGa/cjczik13fU+Hg/nY/L5ocCYsxW/mDPmPJLEIENMTM/QC7uPvhQxSJW81pOq4pH2HCSURa459+8HApqHJ+NQ1TFOPjoKzDNZ/cjDIJxeXgdZHS4QIBNJA+zJFlpOaOJNR+dy6EM/irVltm3EE8HPtnP2eFNIK5I3jOWdqTdjCfF5SiZgN7VITuptpZGpErpHKEhfRGmJwYRqebpSL55EwZWRHg8LbeIsF+KvizEmkAIxBfNYzuQwiHKYdEMJ1NR0WFtME31MIWG3+cR+Db9szyXjxi01CblDoFQKyaVvOW
Content-Type: text/plain; charset="iso-8859-2"
Content-ID: <865A31395421A8448807EF5EE28CB487@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 19f3c559-4c17-4ad9-314a-08d761e3992e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2019 11:30:45.0839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9EOgFdWdwInQPFfCa4+eoerr/G+0rWK9xRduycOO4I2yUceA2NzggspzkeKxzXyomUgHpN1srs/or64GxnJKpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4064
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Pavel,

On 11/2/2019 1:52 PM, Pavel Hofman wrote:
> Hi Minas,
> Dne 24. 10. 19 v 14:47 Minas Harutyunyan napsal(a):
>>
>> Sorry for delay. I haven't enough time to investigate deeper.
>=20
> I apologize for the delay.
>=20
>> This type of issue depend on timings: packet sizes and board DMA
>> performance.
>> Anyway, could you please elaborate:
>> 1. 960 bytes case. Is it high bandwidth transfer? I mean how many
>> packets sending in 1 (u)frame?
>=20
> It is HS (480Mbps). There is only one device (the RPi gadget) connected=20
> to the USB host port. Frame interval is 1ms (i.e. every 8th uframe,=20
> bInterval =3D 4).
>=20
> USB tree on the host machine shows 480M:
>=20
> pavel@precision:~/tools/arm-bcm2708$ lsusb -t
> /:=A0 Bus 08.Port 1: Dev 1, Class=3Droot_hub, Driver=3Duhci_hcd/2p, 12M
> /:=A0 Bus 07.Port 1: Dev 1, Class=3Droot_hub, Driver=3Duhci_hcd/2p, 12M
> /:=A0 Bus 06.Port 1: Dev 1, Class=3Droot_hub, Driver=3Duhci_hcd/2p, 12M
> /:=A0 Bus 05.Port 1: Dev 1, Class=3Droot_hub, Driver=3Duhci_hcd/2p, 12M
> /:=A0 Bus 04.Port 1: Dev 1, Class=3Droot_hub, Driver=3Duhci_hcd/2p, 12M
> /:=A0 Bus 03.Port 1: Dev 1, Class=3Droot_hub, Driver=3Duhci_hcd/2p, 12M
> /:=A0 Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dehci-pci/6p, 480M
> /:=A0 Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dehci-pci/6p, 480M
>  =A0=A0=A0 |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
>  =A0=A0=A0=A0=A0=A0=A0 |__ Port 1: Dev 3, If 0, Class=3DHuman Interface D=
evice,=20
> Driver=3Dusbhid, 1.5M
>  =A0=A0=A0=A0=A0=A0=A0 |__ Port 4: Dev 4, If 0, Class=3DHuman Interface D=
evice,=20
> Driver=3Dusbhid, 1.5M
>  =A0=A0=A0=A0=A0=A0=A0 |__ Port 4: Dev 4, If 1, Class=3DHuman Interface D=
evice,=20
> Driver=3Dusbhid, 1.5M
>  =A0=A0 |__ Port 2: Dev 23, If 2, Class=3DAudio, Driver=3Dsnd-usb-audio, =
480M
>  =A0=A0 |__ Port 2: Dev 23, If 0, Class=3DAudio, Driver=3Dsnd-usb-audio, =
480M
>  =A0=A0 |__ Port 2: Dev 23, If 1, Class=3DAudio, Driver=3Dsnd-usb-audio, =
480M <--
>=20
>=20
>=20
>=20
>> 2. Could you please print hsotg->frame_number in function
>> dwc2_gadget_handle_out_token_ep_disabled().
>=20
> I added the printout to the beginning of the function:
>=20
> --- a/drivers/usb/dwc2/gadget.c
> +++ b/drivers/usb/dwc2/gadget.c
> @@ -2856,6 +2856,8 @@ static void=20
> dwc2_gadget_handle_out_token_ep_disabled(struct dwc2_hsotg_ep *ep)
>  =A0=A0=A0=A0=A0=A0=A0 if (dir_in || !ep->isochronous)
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return;
>=20
> +=A0=A0=A0=A0=A0=A0 dev_dbg(hsotg->dev, "%s: frame_number: %d\n",__func__=
,=20
> hsotg->frame_number);
>=20
>  =A0=A0=A0=A0=A0=A0=A0 if (using_desc_dma(hsotg)) {
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ep->target_frame =3D=
=3D TARGET_FRAME_INITIAL) {
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /*=
 Start first ISO Out */
>=20
> The dmesg.log is attached. It includes everything from start of playback=
=20
> on host side. The printout (frame_number) was called only once shortly=20
> after the begining, when zero-length packet was received=A0 (only one zlp=
=20
> during the whole playback).
>=20
>=20
>> 3. No any chance to record USB trace?
>=20
> I am afraid not, I have no access to any HW USB analyzer.
>=20
> I am enclosing wireshark screenshots for the (nonworking) 960bytes case=20
> - list of the URBs, detail of the 5-frame request and of its=20
> corresponding response (URBs as either 5 frames or 4 frames). IMO they=20
> look OK. Two different USB hosts result in the same problem, I think the=
=20
> host side is OK.
>=20
>=20
>=20
> Thanks a lot,
>=20
> Pavel.

Could you please perform follow 3 tests:

1. Test#1. Disable all debug prints for dwc2 driver and test again 960=20
bytes mps.

2. Test#2. If not help above then re-enable debug prints and apply below=20
patch, test again and provide me full dmesg.

diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
index 6af6add3d4c0..bb5859739663 100644
--- a/drivers/usb/dwc2/core_intr.c
+++ b/drivers/usb/dwc2/core_intr.c
@@ -798,6 +798,10 @@ irqreturn_t dwc2_handle_common_intr(int irq, void *dev=
)
                 hsotg->frame_number =3D (dwc2_readl(hsotg, HFNUM)
                                        & HFNUM_FRNUM_MASK) >>=20
HFNUM_FRNUM_SHIFT;

+       dev_dbg(hsotg->dev, "%s: frame_number: %d\n", __func__,
+               hsotg->frame_number);
+
+
         gintsts =3D dwc2_read_common_intr(hsotg);
         if (gintsts & ~GINTSTS_PRTINT)
                 retval =3D IRQ_HANDLED;
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 6be10e496e10..8c1b0ff0fe2f 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -2856,6 +2856,9 @@ static void=20
dwc2_gadget_handle_out_token_ep_disabled(struct dwc2_hsotg_ep *ep)
         if (dir_in || !ep->isochronous)
                 return;

+       dev_dbg(hsotg->dev, "%s: frame_number: %d\n", __func__,
+               hsotg->frame_number);
+
         if (using_desc_dma(hsotg)) {
                 if (ep->target_frame =3D=3D TARGET_FRAME_INITIAL) {
                         /* Start first ISO Out */
@@ -3613,6 +3616,10 @@ static void=20
dwc2_gadget_handle_incomplete_isoc_out(struct dwc2_hsotg *hsotg)
                 if ((BIT(idx) & ~daintmsk) || !hs_ep->isochronous)
                         continue;

+               dev_dbg(hsotg->dev, "ep%d current_frame=3D%d,=20
target_frame=3D%d\n", idx,
+                               (dwc2_readl(hsotg, DSTS) & DSTS_SOFFN_MASK)
+                               >> DSTS_SOFFN_SHIFT, hs_ep->target_frame);
+
                 epctrl =3D dwc2_readl(hsotg, DOEPCTL(idx));
                 if ((epctrl & DXEPCTL_EPENA) &&
                     dwc2_gadget_target_frame_elapsed(hs_ep)) {


3. Test#3. Try to increase Periodic Frame Interval (PerFInt) by using=20
follow patch in gadget.c:

@@ -3383,6 +3386,8 @@ void dwc2_hsotg_core_init_disconnected(struct=20
dwc2_hsotg *hsotg,
         if (hsotg->params.ipg_isoc_en)
                 dcfg |=3D DCFG_IPG_ISOC_SUPPORDED;

+       dcfg |=3D DCFG_PERFRINT(3);
+
         dwc2_writel(hsotg, dcfg,  DCFG);

         /* Clear any pending OTG interrupts */


Thanks,
Minas
