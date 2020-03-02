Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9F01763AD
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2020 20:15:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727487AbgCBTP2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Mar 2020 14:15:28 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:56888 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726451AbgCBTP1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Mar 2020 14:15:27 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 022JE0LY180086
        for <linux-usb@vger.kernel.org>; Mon, 2 Mar 2020 19:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : content-type :
 content-transfer-encoding : mime-version : date : subject : message-id :
 to; s=corp-2020-01-29; bh=kc7wiM+pQVDne63DA9GbBX46NxcebZypxYtGP4a8XWA=;
 b=lkc4sKsi7vTuNl+mT79F8pfz9bvSsE7fxGFsmxNgFfbwlC0vzJm+adDCebhMHTxau7fl
 MOws6HyxAY8k4kzSTgxbWAzsa+y2rv2hMGgWQvf9ju8tDQ60YshIncmzE2KfpRTIUmj9
 mWeRR0q/gjBU8L1Ou1ABLrFbL2KD1rfcY1CvR18Cnij7RuvybThpRogrKv2fQw44DqrP
 C81pdSCnlu5z5jBso+QUyQs3gRC1tB28upWICQ88pCqh/QUkSnmJKBr5CvkfFBQfteXY
 zHS/k1lTebp2ffND6NYZDYhglYuyzvmIT12mjc0y+fRr1VXOKnQWRCv7ENjrMCcYIaVr fQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 2yffwqht7q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-usb@vger.kernel.org>; Mon, 02 Mar 2020 19:15:26 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 022JEfs7016064
        for <linux-usb@vger.kernel.org>; Mon, 2 Mar 2020 19:15:25 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 2yg1rgar2m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-usb@vger.kernel.org>; Mon, 02 Mar 2020 19:15:25 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 022JFOUd031066
        for <linux-usb@vger.kernel.org>; Mon, 2 Mar 2020 19:15:24 GMT
Received: from [10.39.227.144] (/10.39.227.144)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 02 Mar 2020 11:15:24 -0800
From:   John Donnelly <john.p.donnelly@oracle.com>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date:   Mon, 2 Mar 2020 13:15:22 -0600
Subject: Spurious EHCI  interrupts with 5.2 and later on shutdown / init 6
 reboot .
Message-Id: <F005B4A6-67E1-43EE-915F-F382208F6B32@oracle.com>
To:     linux-usb@vger.kernel.org
X-Mailer: Apple Mail (2.3445.9.1)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9548 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999
 suspectscore=1 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003020125
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9548 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 suspectscore=1
 phishscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003020125
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Hello linux-usb.


I am seeing this message every time a server is rebooted, and it started =
around 5.2 release. It is benign behavior but it does not occur in prior =
4.18 Linux kernels.=20


Kernel 5.6.0-rc1.01.el8uek.rc1.x86_64 on an x86_64=20


[  836.063284] irq 18: nobody cared (try booting with the "irqpoll" =
option)=20
[  836.143498] CPU: 24 PID: 0 Comm: swapper/24 Kdump: loaded Not tainted=20=

5.3.6.jpd.01.+ #5=20
[  836.239310] Hardware name: Oracle Corporation ORACLE SERVER=20
X5-2/ASM,MOTHERBOARD,1U, BIOS 30140300 09/20/2018=20
[  836.358010] Call Trace:=20
[  836.387248]  <IRQ>=20
[  836.411298]  dump_stack+0x63/0x8a=20
[  836.450951]  __report_bad_irq+0x3c/0xb6=20
[  836.496830]  note_interrupt.cold.10+0xb/0x5d=20
[  836.547916]  handle_irq_event_percpu+0x6f/0x80=20
[  836.601077]  handle_irq_event+0x3b/0x5a=20
[  836.646962]  handle_fasteoi_irq+0x90/0x130=20
[  836.695968]  handle_irq+0x20/0x30=20
[  836.711139] megaraid_sas 0000:23:00.0: megasas_disable_intr_fusion is=20=

called outbound_intr_mask:0x40000009=20
[  836.735612]  do_IRQ+0x4e/0xe0=20
[  836.735616]  common_interrupt+0xf/0xf=20
[  836.735619]  </IRQ>

[  336.622666] [<0000000010b50533>] usb_hcd_irq=20
[  336.673746] [<0000000010b50533>] usb_hcd_irq


Device info :


lsusb -t=20
/:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dehci-pci/2p, 480M=20=

   |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/8p, 480M=20
/:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dehci-pci/2p, 480M=20=

   |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/6p, 480M=20
[root@ca-dev55 ~]#



PCI inf=C3=B6 :

[root@ca-dev55 kernel]# lspci -s 00:1d.0 -k -vv
00:1d.0 USB controller: Intel Corporation C610/X99 series chipset USB =
Enhanced Host Controller #1 (rev 05) (prog-if 20 [EHCI])
	Subsystem: Oracle/SUN Device 4852
	Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- =
ParErr+ Stepping- SERR+ FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=3Dmedium =
>TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin C routed to IRQ 18
	NUMA node: 0
	Region 0: Memory at c7501000 (32-bit, non-prefetchable) =
[size=3D1K]
	Capabilities: [50] Power Management version 2
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D375mA =
PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 NoSoftRst- PME-Enable- DSel=3D0 DScale=3D0 =
PME-
	Capabilities: [58] Debug port: BAR=3D1 offset=3D00a0
	Capabilities: [98] PCI Advanced Features
		AFCap: TP+ FLR+
		AFCtrl: FLR-
		AFStatus: TP-
	Kernel modules: ehci_pci


# cat  /sys/kernel/irq/18/*=20
ehci_hcd:usb1,ehci_hcd:usb2=20
IR-IO-APIC=20
18=20
fasteoi=20
0,0,0,0,0,0,0,0,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0=20=

level



There are no USB devices attached to these ports ( like a keyboard or =
mouse ) so I am not sure why it would be producing spurious interrupts .

We have ehci_pci and echo_hcd  components compiled in the kernel ,but =
the behavior also occurs when those drivers are created as loadable  =
modules .=20

If I removed the modules using rmmod  prior to Linux shutdown the issue =
does not occur . =20

Any suggestions ? =20

Thank you.=20

John

Oracle Linux  team.=20


