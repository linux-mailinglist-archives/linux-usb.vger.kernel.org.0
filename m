Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E02E6196382
	for <lists+linux-usb@lfdr.de>; Sat, 28 Mar 2020 05:11:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725875AbgC1ELi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 28 Mar 2020 00:11:38 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:56638 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbgC1ELi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 28 Mar 2020 00:11:38 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02S49OIb061558
        for <linux-usb@vger.kernel.org>; Sat, 28 Mar 2020 04:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : content-type :
 content-transfer-encoding : mime-version : subject : message-id : date :
 to; s=corp-2020-01-29; bh=pbw8qRSKE6Y1iQQALzUDjVTtUkvXbohAY5ncu0MCNeY=;
 b=saECKuJyfvkjFad5b1c+vIOv5/sA++ebd34DRugCLjVnGQq51JVv07lmj+Egv1U45Dh0
 DlGEcnfANRFoPMlxrFxHICPAnyRSExj0cRTjSzc4qK93HK2iYgpAa8fgSkR3NgV3cjKI
 N1fpUFCN8NowAfA5uLitvdNtBXEKe36rfamMqvBKh2U4QdDTtI8SFWgXxJK/1vSCs/6D
 oTP8AjUpM70XaK0ywMB+GPu4f209mL9LdFZ+XRzUCR5XoHC6LpxZa/949pVNGgKlMpNC
 +3wjo/Egu3+NNnYryJuYyrtErwT2zLauhG8P0Hfi1ZvRS+CniwBGSDAWqLk9rSqMWCU6 SQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 301xhkg1x3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-usb@vger.kernel.org>; Sat, 28 Mar 2020 04:11:36 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02S46oPk188394
        for <linux-usb@vger.kernel.org>; Sat, 28 Mar 2020 04:11:35 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 301upr1d6m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-usb@vger.kernel.org>; Sat, 28 Mar 2020 04:11:35 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 02S4BYK2003597
        for <linux-usb@vger.kernel.org>; Sat, 28 Mar 2020 04:11:34 GMT
Received: from dhcp-10-154-135-12.vpn.oracle.com (/10.154.135.12)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 27 Mar 2020 21:11:34 -0700
From:   John Donnelly <john.p.donnelly@oracle.com>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: ehci-pci :   WARNING: CPU: 0 PID: 347 at kernel/dma/direct.c:34 
Message-Id: <F5A0CCCB-4503-40B1-A24D-323F5B89C1F4@oracle.com>
Date:   Fri, 27 Mar 2020 23:11:33 -0500
To:     linux-usb@vger.kernel.org
X-Mailer: Apple Mail (2.3445.9.1)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9573 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=5 mlxscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003280036
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9573 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 mlxscore=0
 suspectscore=5 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003280036
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

I am seeing this WARNING  event with iommu=3Doff when booting a DL380 =
server with a  5.4.17 kernel.



[    7.292703] ehci-pci 0000:00:1a.0: swiotlb buffer is full (sz: 8 =
bytes), total 0 (slots), used 0 (slots)
[    7.309834] ehci-pci 0000:00:1a.0: overflow 0x0000000a1c8f9a60+8 of =
DMA mask ffffffff bus limit 0
[    7.325937] ------------[ cut here ]------------
[    7.326927] WARNING: CPU: 0 PID: 347 at kernel/dma/direct.c:34 =
report_addr+0x7b/0x7f
[    7.326927] Modules linked in:
[    7.326927] CPU: 0 PID: 347 Comm: kworker/0:6 Not tainted =
5.4.17-2013.el7uek.x86_64 #2
[    7.326927] Hardware name: HP ProLiant DL360 Gen9/ProLiant DL360 =
Gen9, BIOS P89 10/21/2019
[    7.326927] Workqueue: usb_hub_wq hub_event
[    7.326927] RIP: 0010:report_addr+0x7b/0x7f
[    7.326927] Code: 59 be 4e 01 00 75 23 4c 8b 8f 78 02 00 00 48 89 d1 =
48 8d 55 f8 48 c7 c6 08 ff c3 b5 31 c0 c6 05 39 be 4e 01 01 e8 84 47 4d =
00 <0f> 0b c9 c3 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 55
[    7.326927] RSP: 0000:ffffbcc186b179a8 EFLAGS: 00010246
[    7.326927] RAX: 0000000000000000 RBX: ffff936f1f9ef0b0 RCX: =
0000000000000000
[    7.326927] RDX: 0000000000000001 RSI: 0000000000000086 RDI: =
0000000000000246
[    7.326927] RBP: ffffbcc186b179b0 R08: 00000000000004b3 R09: =
00000000000004b3
[    7.326927] R10: 0000000000000001 R11: 0000000000aaaaaa R12: =
0000000000000008
[    7.326927] R13: 0000000000000c00 R14: ffff936f84430800 R15: =
ffff936f84434800
[    7.326927] FS:  0000000000000000(0000) GS:ffff936f57800000(0000) =
knlGS:0000000000000000
[    7.326927] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    7.326927] CR2: ffff937098201000 CR3: 0000000b96e0a001 CR4: =
00000000003606f0
[    7.326927] DR0: 0000000000000000 DR1: 0000000000000000 DR2: =
0000000000000000
[    7.326927] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: =
0000000000000400
[    7.326927] Call Trace:
[    7.326927]  dma_direct_map_page+0xd7/0xe2
[    7.326927]  usb_hcd_map_urb_for_dma+0x506/0x64d
[    7.326927]  usb_hcd_submit_urb+0x364/0xbcc
[    7.326927]  ? dev_vprintk_emit+0x21c/0x242
[    7.326927]  usb_submit_urb.part.8+0x24c/0x564
[    7.326927]  usb_submit_urb+0x34/0x5e
[    7.326927]  usb_start_wait_urb+0x6e/0x16d
[    7.326927]  ? _cond_resched+0x19/0x2c
[    7.326927]  usb_control_msg+0xde/0x13f
[    7.326927]  hub_port_init+0x6fd/0xc61
[    7.326927]  hub_port_connect+0x16c/0xa04
[    7.326927]  port_event+0x208/0x7d4
[    7.326927]  ? __switch_to_asm+0x34/0x62
[    7.326927]  hub_event+0x234/0x3c3
[    7.326927]  ? __switch_to_asm+0x40/0x62
[    7.326927]  process_one_work+0x179/0x389
[    7.326927]  worker_thread+0x4f/0x3df
[    7.326927]  kthread+0x105/0x138
[    7.326927]  ? max_active_store+0x80/0x7c
[    7.326927]  ? kthread_bind+0x20/0x15
[    7.326927]  ret_from_fork+0x3e/0x49
[    7.326927] ---[ end trace 38bdc7707d62cfd7 ]=E2=80=94


The end result is this USB port is not configured when =
dma_direct_map_page() is called and it returns return DMA_MAPPING_ERROR;


When I boot the server with iommu=3Don I don=E2=80=99t see  this =
sequence :


[    7.245241] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) =
Driver
[    7.247303] ehci-pci: EHCI PCI platform driver
[    7.249348] ehci-pci 0000:00:1a.0: EHCI Host Controller
[    7.251175] ehci-pci 0000:00:1a.0: new USB bus registered, assigned =
bus number 1
[    7.253527] ehci-pci 0000:00:1a.0: debug port 2
[    7.258974] ehci-pci 0000:00:1a.0: cache line size of 64 is not =
supported
[    7.261222] ehci-pci 0000:00:1a.0: irq 18, io mem 0x9a501000
[    7.269345] ehci-pci 0000:00:1a.0: USB 2.0 started, EHCI 1.00
[    7.271297] usb usb1: New USB device found, idVendor=3D1d6b, =
idProduct=3D0002, bcdDevice=3D 5.06
[    7.273913] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, =
SerialNumber=3D1
[    7.276300] usb usb1: Product: EHCI Host Controller
[    7.277854] usb usb1: Manufacturer: Linux =
5.6.0-rc7.master.20200327.ol7.x86_64 ehci_hcd
[    7.280372] usb usb1: SerialNumber: 0000:00:1a.0
[    7.282019] hub 1-0:1.0: USB hub found
[    7.283339] hub 1-0:1.0: 2 ports detected
[    7.285464] ehci-pci 0000:00:1d.0: EHCI Host Controller
[    7.287229] ehci-pci 0000:00:1d.0: new USB bus registered, assigned =
bus number 2
[    7.289595] ehci-pci 0000:00:1d.0: debug port 2
[    7.294922] ehci-pci 0000:00:1d.0: cache line size of 64 is not =
supported
[    7.297113] ehci-pci 0000:00:1d.0: irq 18, io mem 0x9a500000
[    7.305345] ehci-pci 0000:00:1d.0: USB 2.0 started, EHCI 1.00
[    7.307273] usb usb2: New USB device found, idVendor=3D1d6b, =
idProduct=3D0002, bcdDevice=3D 5.06
[    7.309893] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, =
SerialNumber=3D1
[    7.312172] usb usb2: Product: EHCI Host Controller
[    7.313721] usb usb2: Manufacturer: Linux =
5.6.0-rc7.master.20200327.ol7.x86_64 ehci_hcd
[    7.316289] usb usb2: SerialNumber: 0000:00:1d.0
[    7.317913] hub 2-0:1.0: USB hub found
[    7.319219] hub 2-0:1.0: 2 ports detected


This is related to my previous question how the BCM devices export USB =
virtual keyboards and  mouse .

On an older kernel  5.3. flavor I am not seeing this behavior, and the =
usbhib devices  appear as expected :

lsusb -t
/:  Bus 05.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/6p, 5000M
/:  Bus 04.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/15p, 480M
    |__ Port 3: Dev 2, If 0, Class=3DHub, Driver=3Dhub/2p, 480M
/:  Bus 03.Port 1: Dev 1, Class=3Droot_hub, Driver=3Duhci_hcd/2p, 12M
    |__ Port 1: Dev 2, If 0, Class=3DHuman Interface Device, =
Driver=3Dusbhid, 12M
    |__ Port 1: Dev 2, If 1, Class=3DHuman Interface Device, =
Driver=3Dusbhid, 12M


Has anyone seen this before ?






