Return-Path: <linux-usb+bounces-21387-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E57A4FB3D
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 11:08:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D73C3A5321
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 10:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1264205E09;
	Wed,  5 Mar 2025 10:08:03 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6358A1D6DAA
	for <linux-usb@vger.kernel.org>; Wed,  5 Mar 2025 10:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741169283; cv=none; b=Kz1qGSaeapOWzwY8iZwakdcQ969ATozcHoHylkAfu7qzTqv0Is7RnKafl5EnzseZdYgQYLnQJ0r08NPAb9NKW1fXLX1+NlqqSYCCMRLTRnc0ZnPeL2FIqkhzAhBJoY05p+e5k0vug4+/yz3Lp/o6nxmJQSUmCU8Za75sw/fBLpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741169283; c=relaxed/simple;
	bh=FPHHZ1I3NM6vurA8mnfLTwrHB3fU5N2h1HSCat9NKWw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JKSVWI/Ybw2+ULe8YqcYN+tML+s9nyR2g3xEGF4B/+ibaNd4xNfJSJS0TOlSa/wX9x8sLAx6DLMPNO1Os0pzgkP85Bdak71QoDrg3c2h2JRmEHiZCTpeoVqycQposClB8ur/62vCUK3UWlQ2KsyAQfkXUweBIPQvR83glazjGZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Z77Vg1GfYz1R66c;
	Wed,  5 Mar 2025 18:06:19 +0800 (CST)
Received: from kwepemd200023.china.huawei.com (unknown [7.221.188.117])
	by mail.maildlp.com (Postfix) with ESMTPS id 3719D14022E;
	Wed,  5 Mar 2025 18:07:57 +0800 (CST)
Received: from kwepemn200006.china.huawei.com (7.202.194.129) by
 kwepemd200023.china.huawei.com (7.221.188.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 5 Mar 2025 18:07:56 +0800
Received: from kwepemn200006.china.huawei.com ([7.202.194.129]) by
 kwepemn200006.china.huawei.com ([7.202.194.129]) with mapi id 15.02.1544.011;
 Wed, 5 Mar 2025 18:07:56 +0800
From: liudingyuan <liudingyuan@huawei.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "greg@kroah.com"
	<greg@kroah.com>, "patchwork-bot@kernel.org" <patchwork-bot@kernel.org>,
	"mricon@kernel.org" <mricon@kernel.org>
CC: "Fangjian (Jay)" <f.fangjian@huawei.com>, Kangfenglong
	<kangfenglong@huawei.com>, yangxingui <yangxingui@huawei.com>, "fengsheng
 (A)" <fengsheng5@huawei.com>, lingmingqiang <lingmingqiang@huawei.com>,
	liulongfang <liulongfang@huawei.com>, zhonghaoquan
	<zhonghaoquan@hisilicon.com>, "yanzhili (A)" <yanzhili7@huawei.com>, "huyihua
 (A)" <huyihua4@huawei.com>, "Zengtao (B)" <prime.zeng@hisilicon.com>,
	"shenjian (K)" <shenjian15@huawei.com>, liuyonglong <liuyonglong@huawei.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PROBLEM] usb: xhci_bus_resume cause irq lost issue
Thread-Topic: [PROBLEM] usb: xhci_bus_resume cause irq lost issue
Thread-Index: AduNrIrYhJvmXzPhSt6gspKRwQpFQgACVCWQ
Date: Wed, 5 Mar 2025 10:07:56 +0000
Message-ID: <b1a9e2d51b4d4ff7a304f77c5be8164e@huawei.com>
References: <ea84165273814a41ae7187a008c4144b@huawei.com>
In-Reply-To: <ea84165273814a41ae7187a008c4144b@huawei.com>
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

I'm running into an issue where the enumeration of a USB2.0 device failed d=
ue to lost interrupts.

This issue appears to occur randomly and we can only reproduce it on xHCI c=
ontrollers that provide both USB3.0 and USB2.0 root hubs. Additionally, it =
is necessary to ensure that the first-level device under this controller is=
 a SB2.0 device.
The above scenario can be referred to in the following figure.
   ------------------------------------------------------------------------=
----
  |         +---------------------------------+               |
  |         |    xHCI Controller    |               |
  |         +---------------------------------+               |
  |                /       \                      |
  |               /         \                     |
  |              /           \                    |
  |  +-------------------------+      +---------------------------+   |
  |  | USB 3.0 Root Hub |      | USB 2.0 Root Hub  |   |
  |  +------------------------+      +----------------------------+   |
  --------------|-------------------------------------|--------------------=
-----         =20
          |                       |
          | [NO device]             | [Device A]
          |                       |
                            =20
                              =20

The USB topology displayed in the OS looks like this:
/:  Bus 03.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/ , 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
    |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/4p, 480M

/:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/ , 5000M
    ID 1d6b:0003 Linux Foundation 3.0 root hub

This issue only occurs when the system reboot or when we insmod the xhci dr=
iver or ingister the xhci controller.
When the issue occurs, we can observe that the CPU receives fewer interrupt=
s than what would normally be generated during the enumeration process, and=
 there are error logs indicating command timeouts.
	[ 2040.039438]xhci_hcd 0000:8a:00.7: Command timeout, USBSTS: 0x00000018 E=
INT PCD
	[ 2040.039444] xhci_hcd 0000:8a:00.7: Command timeout
	[ 2040.039446] xhci_hcd 0000:8a:00.7: Abort command ring
	[ 2042.055435] xhci_hcd 0000:8a:00.7: No stop event for abort, ring start =
fail?
	[ 2042.055469] xhci_hcd 0000:8a:00.7: Timeout while waiting for setup devi=
ce command
	[ 2042.064048] usb 15-1: hub failed to enable device, error -62
	[ 2054.343446] xhci_hcd 0000:8a:00.7: Unsuccessful disable slot 1 command,=
 status 25
 	[ 2066.631449] xhci_hcd 0000:8a:00.7: Error while assigning device slot I=
D: Command Aborted
	[ 2066.640633] xhci_hcd 0000:8a:00.7: Max number of devices this xHCI host=
 supports is 64.
	[ 2066.649713] usb usb15-port1: couldn't allocate usb_device

After verification, we can confirm that the reason for the interrupt loss i=
s that during the enumeration of U2 device,
U3 port is in a suspend procedure and performs an operation to disable inte=
rrupts in this function:

	drivers/usb/host/xhci-hub.c
		xhci_bus_resume()
			/* delay the irqs */
			temp =3D readl(&xhci->op_regs->command);
			temp &=3D ~CMD_EIE;
			writel(temp, &xhci->op_regs->command);

we can temporarily avoid this issue by modifying parameters.
echo -1 > /sys/module/usbcore/parameters/autosuspend

I am wondering whether there is a chance of interrupt loss occurring, regar=
dless of whether or not it belongs to the scenario mentioned above? As long=
 as an interrupt from a controller is triggered at exactly the same time as=
 the process of disabling the controller's interrupts?

I read the xHCI protocol version 1.2 and haven't found detailed description=
s for such special cases. So I was wondering what is the main reason for di=
sabling interrupts in xHCI driver during the resume process?

Additionally, given that there is a conflict between interrupt handling and=
 the resume process, does our protocol require controllers to ensure they s=
hould trigger interrupt signals after interrupt has been re-enabled, even i=
f the driver hasn't cleared the EHB? (This should also apply in cases where=
 edge-triggered interrupts are used.)

Or should the xHCI driver software check and handle the controller's interr=
upt status when an error occurs, by polling for interrupt flags?

Thanks in advance for any insights!

Devyn Liu
liudingyuan@huawei.com

