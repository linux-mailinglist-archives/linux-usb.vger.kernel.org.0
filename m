Return-Path: <linux-usb+bounces-21636-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BB0A5C0B6
	for <lists+linux-usb@lfdr.de>; Tue, 11 Mar 2025 13:22:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1D98189DE81
	for <lists+linux-usb@lfdr.de>; Tue, 11 Mar 2025 12:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A27BF25C70F;
	Tue, 11 Mar 2025 12:10:27 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED742561C7
	for <linux-usb@vger.kernel.org>; Tue, 11 Mar 2025 12:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741695027; cv=none; b=tkOaIoS2mMxBKrZwARSiyi3+HFlTXX62WJqmF3zfuTBTjMpWyOyka0+aJSgMbCVigyVidQ/8KQMpqaORxZqUoSZ/MtlGw5csRiUjs4FsAhjfyOEC9B89WjPj9Zxv8LuNDPblt8+nW3XS8TilGEvYu0Q6UpXCL8zqT32mhJcjlGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741695027; c=relaxed/simple;
	bh=Uuq8rZzsRYGC/onbxvemKeCljp70P9FL4SMhc3BkNV0=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Td2QatNNHQgqFY7/tCOZ2vvEijPrewNOKXBQzsBaEGqlKWdoTnOjx9lq3bOOD5OiRKgRqkimF6DM1xEShsYKW+tj9Seak6e9i0yxz30uthGz5MtzwW/DNldSoTYeR5D1/Pv+N9cB2HjNpdfys5KG2BJuIWryIoDCRUXL01vJLr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4ZBst12DJlz2RTQH;
	Tue, 11 Mar 2025 20:06:01 +0800 (CST)
Received: from kwepemo500001.china.huawei.com (unknown [7.202.194.211])
	by mail.maildlp.com (Postfix) with ESMTPS id A938B140158;
	Tue, 11 Mar 2025 20:10:21 +0800 (CST)
Received: from kwepemn200006.china.huawei.com (7.202.194.129) by
 kwepemo500001.china.huawei.com (7.202.194.211) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 11 Mar 2025 20:10:21 +0800
Received: from kwepemn200006.china.huawei.com ([7.202.194.129]) by
 kwepemn200006.china.huawei.com ([7.202.194.129]) with mapi id 15.02.1544.011;
 Tue, 11 Mar 2025 20:10:21 +0800
From: liudingyuan <liudingyuan@huawei.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"patchwork-bot@kernel.org" <patchwork-bot@kernel.org>, "mricon@kernel.org"
	<mricon@kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC: "Fangjian (Jay)" <f.fangjian@huawei.com>, Kangfenglong
	<kangfenglong@huawei.com>, yangxingui <yangxingui@huawei.com>, "fengsheng
 (A)" <fengsheng5@huawei.com>, lingmingqiang <lingmingqiang@huawei.com>,
	liulongfang <liulongfang@huawei.com>, zhonghaoquan
	<zhonghaoquan@hisilicon.com>, "yanzhili (A)" <yanzhili7@huawei.com>, "huyihua
 (A)" <huyihua4@huawei.com>, "Zengtao (B)" <prime.zeng@hisilicon.com>,
	"shenjian (K)" <shenjian15@huawei.com>, liuyonglong <liuyonglong@huawei.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: re: [RFT PATCH] xhci: Limit time spent with interrupts disabled
 during bus resume
Thread-Topic: [RFT PATCH] xhci: Limit time spent with interrupts disabled
 during bus resume
Thread-Index: AduSewHx+L+mpxq5Qm+NrRpgWQ50AA==
Date: Tue, 11 Mar 2025 12:10:21 +0000
Message-ID: <67e9da93c747479baa6c4de54e55b8e2@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi

We have received the patch changing the way of interrupt disabling, thank y=
ou very much!
Over the past couple of days, we have also conducted tests using the modifi=
ed kernel in the problematic scenarios.
I believe that this patch can resolve the issue and avoid some potential in=
terrupt loss problems. Thank you once again!

We plan to conduct further testing on some basic USB functionalities based =
on the latest Linux kernel and our kernel in the coming period=20
(including read/write operations with USB drives or hard disks, multi-level=
 devices, and basic read/write stress tests, etc.).=20

The testing is expected to take approximately two weeks to complete. We wil=
l finish the further verification process and provide you with feedback
about the results as soon as possible.=20

During this period, we may also engage in further discussions with hardware=
 personnel to ensure that the hardware implementation aligns with expectati=
ons.

Thanks.
Best regards!
Devyn

>
>  [RFT PATCH] xhci: Limit time spent with interrupts disabled during bus r=
esume
>
>  Current xhci bus resume implementation prevents xHC host from generating=
 interrupts during high-speed USB 2 and super-speed USB 3 bus resume.
>
>  Only reason to disable interrupts during bus resume would be to prevent =
the interrupt handler from interfering with the resume process of USB 2 por=
ts.
>
>  Host initiated resume of USB 2 ports is done in two stages.
>
>  The xhci driver first transitions the port from 'U3' to 'Resume' state, =
then wait in Resume for 20ms, and finally moves port to U0 state.
>  xhci driver can't prevent interrupts by taking and keeping the xhci spin=
lock with spin_lock_irqsave() due to this 20ms sleep.
>
>  Limit interrupt disabling to the USB 2 port resume case only.
>  resuming USB 2 ports in bus resume is only done in special cases where U=
SB 2 ports had to be forced to suspend during bus suspend.
>
>  The current way of preventing interrupts by clearing the 'Interrupt Enab=
le' (INTE) bit in USBCMD register won't prevent the Interrupter registers '=
Interrupt Pending' (IP), 'Event Handler Busy' (EHB) and USBSTS register Eve=
nt Interrupt (EINT) bits from being set.
>
>  New interrupts can't be issued before those bits are properly clered.
>
>  This way IP, EHB and INTE won't be set before IE is enabled again and a =
new interrupt is triggered.
>
>  Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>  ---
>  drivers/usb/host/xhci-hub.c | 30 ++++++++++++++++--------------
>  drivers/usb/host/xhci.c     |  4 ++--
>  drivers/usb/host/xhci.h     |  2 ++
>  3 files changed, 20 insertions(+), 16 deletions(-)
>
>  diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c i=
ndex 9693464c0520..d11b60f705bb 100644
>  --- a/drivers/usb/host/xhci-hub.c
>  +++ b/drivers/usb/host/xhci-hub.c
>  @@ -1870,9 +1870,10 @@ int xhci_bus_resume(struct usb_hcd *hcd)
>   	int max_ports, port_index;
>   	int sret;
>   	u32 next_state;
>  -	    u32 temp, portsc;
>  +	u32 portsc;
>   	struct xhci_hub *rhub;
>  	    struct xhci_port **ports;
>  +	bool disabled_irq =3D false;
> =20
>  	    rhub =3D xhci_get_rhub(hcd);
>  	    ports =3D rhub->ports;
> @@ -1888,17 +1889,20 @@ int xhci_bus_resume(struct usb_hcd *hcd)
>   		return -ESHUTDOWN;
>   	}
>  =20
>  -	    /* delay the irqs */
>  -	    temp =3D readl(&xhci->op_regs->command);
>  -	    temp &=3D ~CMD_EIE;
>  -	    writel(temp, &xhci->op_regs->command);
>  -
>    	/* bus specific resume for ports we suspended at bus_suspend */
>  - 	if (hcd->speed >=3D HCD_USB3)
>  +	if (hcd->speed >=3D HCD_USB3) {
>  		next_state =3D XDEV_U0;
>  - 	else
>  +	} else {
>  		next_state =3D XDEV_RESUME;
>  -
>  +	if (bus_state->bus_suspended) {
>  +			/*
>  +			 * prevent port event interrupts from interfering
>  +			 * with usb2 port resume process
>  +			 */
>  +			xhci_disable_interrupter(xhci->interrupters[0]);
>  +			disabled_irq =3D true;
>  +		}
>  +	}
>   	    port_index =3D max_ports;
>   	    while (port_index--) {
>   		portsc =3D readl(ports[port_index]->addr); @@ -1966,11 +1970,9 @@ int=
 xhci_bus_resume(struct usb_hcd *hcd)
>   	(void) readl(&xhci->op_regs->command);
>  =20
>   	bus_state->next_statechange =3D jiffies + msecs_to_jiffies(5);
>  -	    /* re-enable irqs */
>  -  	temp =3D readl(&xhci->op_regs->command);
>  -  	temp |=3D CMD_EIE;
>  - 	writel(temp, &xhci->op_regs->command);
>  -	    temp =3D readl(&xhci->op_regs->command);
>  +	/* re-enable interrupter */
>  +	if (disabled_irq)
>  +		xhci_enable_interrupter(xhci->interrupters[0]);
>  =20
>   	spin_unlock_irqrestore(&xhci->lock, flags);
>   	return 0;
>  diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c index 0c2=
2b78358b9..ad229cb9a90b 100644
>  --- a/drivers/usb/host/xhci.c
>  +++ b/drivers/usb/host/xhci.c
>  @@ -322,7 +322,7 @@ static void xhci_zero_64b_regs(struct xhci_hcd *xhci=
)
>   		xhci_info(xhci, "Fault detected\n");
>    }=20
>  =20
>  -static int xhci_enable_interrupter(struct xhci_interrupter *ir)
>  +int xhci_enable_interrupter(struct xhci_interrupter *ir)
> =20
>   	u32 iman;
> =20
>  @@ -335,7 +335,7 @@ static int xhci_enable_interrupter(struct xhci_inter=
rupter *ir)
>   	return 0;
>   }
>  =20
>  -static int xhci_disable_interrupter(struct xhci_interrupter *ir)
>  +int xhci_disable_interrupter(struct xhci_interrupter *ir)
>   {
>   	u32 iman;
>  =20
>  diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h index 6c0=
0062a9acc..10572336fabe 100644
>  --- a/drivers/usb/host/xhci.h
>  +++ b/drivers/usb/host/xhci.h
>  @@ -1891,6 +1891,8 @@ int xhci_alloc_tt_info(struct xhci_hcd *xhci,
>   		struct usb_tt *tt, gfp_t mem_flags);
>   int xhci_set_interrupter_moderation(struct xhci_interrupter *ir,
>   				    u32 imod_interval);
>  +int xhci_enable_interrupter(struct xhci_interrupter *ir); int=20
>  +xhci_disable_interrupter(struct xhci_interrupter *ir);
>  =20
>   /* xHCI ring, segment, TRB, and TD functions */  dma_addr_t xhci_trb_vi=
rt_to_dma(struct xhci_segment *seg, union xhci_trb *trb);
>  --
>  2.43.0



