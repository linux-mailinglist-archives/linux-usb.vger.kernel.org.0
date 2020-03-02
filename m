Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D716C1767B0
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2020 23:54:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgCBWyF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Mar 2020 17:54:05 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:44038 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726744AbgCBWyF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Mar 2020 17:54:05 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 022Ms2v2038288;
        Mon, 2 Mar 2020 22:54:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=jBXvbosMzLr8cNEtRtdBhjMAdDP77QDG44MQUpfa6gU=;
 b=gDBo6Ni+nkLNe59RHOfg2HXrm2z+ctivp9jNPcEYD27T49h9x4KXeqtgI8rnK1rlH0MS
 MgYCGxe046qYe/8rJ7oDLPknRRTetvziUElVQL5dM+Jp/zF/ShJPU3aQqp7oygiFb8iA
 ZvNzT+6ecCN/FeoZQtryJaa9p7401QbBpyFYOhaOWmjul5h4sLzs6IWfdaZq+Q+PL+d/
 rojsszOpLT36H0kagQyI5bqLtQKZ+2sZHxqLXODt4VCNKXIY81kbHGcjJ9hKq7LeFSpb
 gbIltPuguZaPVFhyV5j7sBgF5sZpBBWgsRqc6LNO/I0gWOivLCxNfbtNKJRoAn7rS9hY mQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 2yffcub1ka-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 02 Mar 2020 22:54:02 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 022MqPFC044541;
        Mon, 2 Mar 2020 22:54:02 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 2yg1p2u6rr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 02 Mar 2020 22:54:02 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 022Ms1sQ009564;
        Mon, 2 Mar 2020 22:54:01 GMT
Received: from [192.168.1.140] (/47.220.71.223)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 02 Mar 2020 14:54:00 -0800
Subject: Re: Spurious EHCI interrupts with 5.2 and later on shutdown / init 6
 reboot .
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
References: <Pine.LNX.4.44L0.2003021651590.1555-100000@iolanthe.rowland.org>
From:   John Donnelly <John.P.Donnelly@Oracle.com>
Message-ID: <42c1a8c5-aaa6-b875-d173-136509838a32@Oracle.com>
Date:   Mon, 2 Mar 2020 16:54:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.44L0.2003021651590.1555-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9548 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003020149
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9548 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003020149
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 3/2/20 3:56 PM, Alan Stern wrote:
> On Mon, 2 Mar 2020, John Donnelly wrote:
> 
>> Hello linux-usb.
>>
>>
>> I am seeing this message every time a server is rebooted, and it started around 5.2 release. It is benign behavior but it does not occur in prior 4.18 Linux kernels.
> 
> What about 4.19?  4.20?  5.0?  And so on...
> 
> It still think your best bet for finding out what is happening is to do
> a bisection.

   Thank you for the feedback.  This could take awhile !  I will update 
you on my findings.



> 
>> Kernel 5.6.0-rc1.01.el8uek.rc1.x86_64 on an x86_64
>>
>>
>> [  836.063284] irq 18: nobody cared (try booting with the "irqpoll" option)
>> [  836.143498] CPU: 24 PID: 0 Comm: swapper/24 Kdump: loaded Not tainted
>> 5.3.6.jpd.01.+ #5
>> [  836.239310] Hardware name: Oracle Corporation ORACLE SERVER
>> X5-2/ASM,MOTHERBOARD,1U, BIOS 30140300 09/20/2018
>> [  836.358010] Call Trace:
>> [  836.387248]  <IRQ>
>> [  836.411298]  dump_stack+0x63/0x8a
>> [  836.450951]  __report_bad_irq+0x3c/0xb6
>> [  836.496830]  note_interrupt.cold.10+0xb/0x5d
>> [  836.547916]  handle_irq_event_percpu+0x6f/0x80
>> [  836.601077]  handle_irq_event+0x3b/0x5a
>> [  836.646962]  handle_fasteoi_irq+0x90/0x130
>> [  836.695968]  handle_irq+0x20/0x30
>> [  836.711139] megaraid_sas 0000:23:00.0: megasas_disable_intr_fusion is
>> called outbound_intr_mask:0x40000009
>> [  836.735612]  do_IRQ+0x4e/0xe0
>> [  836.735616]  common_interrupt+0xf/0xf
>> [  836.735619]  </IRQ>
>>
>> [  336.622666] [<0000000010b50533>] usb_hcd_irq
>> [  336.673746] [<0000000010b50533>] usb_hcd_irq
>>
>>
>> Device info :
>>
>>
>> lsusb -t
>> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/2p, 480M
>>     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/8p, 480M
>> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/2p, 480M
>>     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/6p, 480M
>> [root@ca-dev55 ~]#
>>
>>
>>
>> PCI infö :
>>
>> [root@ca-dev55 kernel]# lspci -s 00:1d.0 -k -vv
>> 00:1d.0 USB controller: Intel Corporation C610/X99 series chipset USB Enhanced Host Controller #1 (rev 05) (prog-if 20 [EHCI])
>> 	Subsystem: Oracle/SUN Device 4852
>> 	Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx-
>> 	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>> 	Interrupt: pin C routed to IRQ 18
>> 	NUMA node: 0
>> 	Region 0: Memory at c7501000 (32-bit, non-prefetchable) [size=1K]
>> 	Capabilities: [50] Power Management version 2
>> 		Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
>> 		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>> 	Capabilities: [58] Debug port: BAR=1 offset=00a0
>> 	Capabilities: [98] PCI Advanced Features
>> 		AFCap: TP+ FLR+
>> 		AFCtrl: FLR-
>> 		AFStatus: TP-
>> 	Kernel modules: ehci_pci
>>
>>
>> # cat  /sys/kernel/irq/18/*
>> ehci_hcd:usb1,ehci_hcd:usb2
>> IR-IO-APIC
>> 18
>> fasteoi
>> 0,0,0,0,0,0,0,0,60,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
>> level
>>
>>
>>
>> There are no USB devices attached to these ports ( like a keyboard or mouse ) so I am not sure why it would be producing spurious interrupts .
>>
>> We have ehci_pci and echo_hcd  components compiled in the kernel ,but the behavior also occurs when those drivers are created as loadable  modules .
>>
>> If I removed the modules using rmmod  prior to Linux shutdown the issue does not occur .
> 
> So at least you have a workaround, if nothing else.
> 
>> Any suggestions ?
> 
> Since the messages are benign, you can simply ignore them.
> 
> Or you can try to track down the code that causes them to appear, as
> described above.
> 
> Alan Stern
> 


-- 
Thank You,
John
