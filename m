Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75A651989CF
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2020 04:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729567AbgCaCKV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Mar 2020 22:10:21 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:51168 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729142AbgCaCKV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Mar 2020 22:10:21 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02V29r1O104816;
        Tue, 31 Mar 2020 02:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=acoTlSg/X7BFGjqzvd3W6ND/18AMT3L1+kNEuZHFEjc=;
 b=hP560a5FlZ+h6Pq6jo2v8Rbl49N/5cJj+HvXSN+qGZqa3pKgi29dv4yKyoAckL8B3+nW
 pHXQsVKX1D5K1RsKAx4SgP70d9etGxBjgQAXWuTOJRzG+h+6BTchYT2Su+ujq8PqnvlM
 DzZSuU8+7SicVSm4dtAooKbiEHEv1Ph+zhrHenOxXqUKARQpEA+XB2lKIeYHgzLa7PxY
 oPDM0Gy5gnG/QBHn3Z1IHubyyaCV3SxWdUxhbh5zacXetVporniMirA5nW1i7iwtEKsr
 N7uouPJp4b3C69NjKlDcTHzHBEzDBnJcqQe95Uz9AGVTnQvZTDHbSYZ8Pt5o+I3rKcnn bA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 303ceuvwma-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 31 Mar 2020 02:10:17 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02V27xIv161303;
        Tue, 31 Mar 2020 02:10:17 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 302g9war1b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 31 Mar 2020 02:10:17 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 02V2AFkQ031146;
        Tue, 31 Mar 2020 02:10:16 GMT
Received: from [192.168.1.126] (/47.220.71.223)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 30 Mar 2020 19:10:15 -0700
Subject: Re: ehci-pci : WARNING: CPU: 0 PID: 347 at kernel/dma/direct.c:34
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
References: <Pine.LNX.4.44L0.2003301510250.3390-100000@netrider.rowland.org>
 <C1C80BF9-9E4F-444B-81D8-554409A372D5@oracle.com>
From:   John Donnelly <John.P.Donnelly@Oracle.com>
Message-ID: <eefd3438-69a5-6c08-1aca-7705f69cd9d0@Oracle.com>
Date:   Mon, 30 Mar 2020 21:10:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <C1C80BF9-9E4F-444B-81D8-554409A372D5@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9576 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003310015
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9576 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003310015
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 3/30/20 3:11 PM, John Donnelly wrote:

   See below
> 
> 
>> On Mar 30, 2020, at 2:41 PM, Alan Stern <stern@rowland.harvard.edu> wrote:
>>
>> On Mon, 30 Mar 2020, John Donnelly wrote:
>>
>>> Hi,
>>>
>>>
>>> I discovered this particular server doesn’t continue probing the
>>> ports behind BCM is due to iommu being on.
>>>
>>> With  “ iommu=on “
>>>
>>> USB Initialization stops after the BCM "  3:1.0 hub with 2 ports
>>> detected” , but no additional probing is done to discover the other
>>> end-points behind 3:1.0 :
>>>
>>>
>>> [    9.467008] hub 2-1:1.0: 8 ports detected
>>> [    9.538361] usb 4-3: new high-speed USB device number 2 using xhci_hcd
>>> [    9.564504] usb 4-3: New USB device found, idVendor=0424, idProduct=2660, bcdDevice= 8.01
>>> [    9.580454] usb 4-3: New USB device strings: Mfr=0, Product=0,SerialNumber=0
>>> [    9.596642] hub 4-3:1.0: USB hub found
>>> [    9.611040] hub 4-3:1.0: 2 ports detected.
>>>
>>>    ** NO ADDITIONAL DISCOVERY **
>>>
>>>
>>>
>>> 2. With intel_iommu=off, the BCM ports are probed after " 3:1.0: 2
>>> ports detected "  state:
>>>
>>> [    5.705072] usb 3-1: new full-speed USB device number 2 using uhci_hcd
>>> [    5.772363] usb 4-3: new high-speed USB device number 2 using xhci_hcd
>>> [    5.800528] usb 4-3: New USB device found, idVendor=0424, idProduct=2660,bcdDevice= 8.01
>>> [    5.816439] usb 4-3: New USB device strings: Mfr=0, Product=0, SerialNumber=0
>>> [    5.832298] hub 4-3:1.0: USB hub found
>>> [    5.845786] hub 4-3:1.0: 2 ports detected. <----    AFTER THIS WE CONTINUE TO PROBE
>>> [    5.889503] usb 3-1: New USB device found, idVendor=03f0, idProduct=7029, bcdDevice= 0.02
>>> [    5.905380] usb 3-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
>>> [    5.920997] usb 3-1: Product: Virtual Keyboard
>>> [    5.934493] usb 3-1: Manufacturer: BMC
>>>
>>>
>>> What prompts the discovery to look beyond : "hub 4-3:1.0: 2 ports
>>> detected. “ ? Could there some state that needs examined before it
>>> continues ?  ( I’ve never dealt with USB before on Linux ) .
>>
>> Were there any differences between your two tests other than the iommu
>> setting?
> 
>     No !
> 
> 
>>
>>> The end result is the usbhid devices ( kdb and mouse ) are found :
>>>
>>> /:  Bus 05.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/6p, 5000M
>>> /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/15p, 480M
>>>     |__ Port 3: Dev 2, If 0, Class=Hub, Driver=hub/2p, 480M
>>> /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=uhci_hcd/2p, 12M
>>>     |__ Port 1: Dev 2, If 0, Class=Human Interface Device, Driver=usbhid, 12M
>>>     |__ Port 1: Dev 2, If 1, Class=Human Interface Device, Driver=usbhid, 12M
>>> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/2p, 480M
>>>     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/8p, 480M
>>> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/2p, 480M
>>>
>>>
>>> Is there a way I can turn on debug messages for the usb driver(s) to
>>> increase verbosity during boot since these are build-in modules ?
>>
>> You can turn on kernel debugging for USB during boot-up by manually
>> adding:
>>
>> 	dyndbg="module usbcore =p"
>>
>> to the boot command line.  (See the file
>> Documentation/admin-guide/dynamic-debug-howto.rst in the kernel source
>> for an explanation.)  The debugging messages will then appear in the
>> output from the dmesg command.
>>
>> It might be even more enlightening to collect a couple of usbmon
>> traces.  (See Documentation/usb/usbmon.rst.)  Here's what you should
>> do, first with iommu=on and then again with iommu=off.  After booting,
>> as root:
>>
>> 	echo 0 >/sys/bus/usb/devices/usb3/bConfigurationValue
>> 	cat /sys/kernel/debug/usb/usbmon/3u >mon-on.txt &
>> 	echo 1 >/sys/bus/usb/devices/usb3/bConfigurationValue
>> 	fg
>> 	... wait a few seconds ...
>> 	^C
>>
>> For the iommu=off test, replace the "mon-on.txt" with "mon-off.txt"
>> (this is the name of the file where the usbmon trace will be stored --
>> you can use other names if you want).  Then attach the two trace
>> files to your next email message.
>>
>> Alan Stern
>>
> 
>    Thanks for the hints !    I will probe around more !
> 
> 

The debug method produces the following:

iommu=on  ( no BCM is discovered )

[    9.911027] hub 4-0:1.0: state 7 ports 6 chg 0000 evt 0000
[    9.923028] usb 3-3: new high-speed USB device number 2 using xhci_hcd
[    9.950106] In hub_port_connect .. init
[    9.963879] usb 3-3: udev 2, busnum 3, minor = 257
[    9.963882] usb 3-3: New USB device found, idVendor=0424, 
idProduct=2660, bcdDevice= 8.01
[    9.978980] usb 3-3: New USB device strings: Mfr=0, Product=0, 
SerialNumber=0
[    9.994524] usb 3-3: usb_probe_device
[    9.994527] usb 3-3: configuration #1 chosen from 1 choice
[    9.994790] usb 3-3: adding 3-3:1.0 (config #1, interface 0)
[    9.994826] hub 3-3:1.0: usb_probe_interface
[    9.994828] hub 3-3:1.0: usb_probe_interface - got id
[    9.994831] hub 3-3:1.0: USB hub found
[   10.008224] hub 3-3:1.0: 2 ports detected
[   10.021669] hub 3-3:1.0: compound device; port removable status: FR
[   10.021671] hub 3-3:1.0: individual port power switching
[   10.021672] hub 3-3:1.0: individual port over-current protection
[   10.021674] hub 3-3:1.0: Single TT
[   10.021676] hub 3-3:1.0: TT requires at most 8 FS bit times (666 ns)
[   10.021678] hub 3-3:1.0: power on to power good time: 100ms
[   10.021753] hub 3-3:1.0: local power source is good
[   10.021872] hub 3-3:1.0: enabling power on all ports
[   10.022120] hub 2-1:1.0: state 7 ports 8 chg 0000 evt 0000
[   10.127115] hub 3-3:1.0: state 7 ports 2 chg 0000 evt 0000
[   10.327902] i8042: Can't read CTR while initializing i8042


Produces this configuration without the BCM devices :


lsusb -t
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/6p, 5000M
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/15p, 480M
     |__ Port 3: Dev 2, If 0, Class=Hub, Driver=hub/2p, 480M
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/2p, 480M
     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/8p, 480M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/2p, 480M
     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/6p, 480M



BCM is discovered  intel_iommu=off :


[    8.947539] usb 4-3: adding 4-3:1.0 (config #1, interface 0)
[    8.947569] hub 4-3:1.0: usb_probe_interface
[    8.947571] hub 4-3:1.0: usb_probe_interface - got id
[    8.947574] hub 4-3:1.0: USB hub found
[    8.960496] usb 3-1: skipped 1 descriptor after interface
[    8.960499] usb 3-1: skipped 1 descriptor after interface
[    8.960562] hub 4-3:1.0: 2 ports detected
[    8.974067] usb 3-1: default language 0x0409
[    8.974074] hub 4-3:1.0: compound device; port removable status: FR
[    8.974075] hub 4-3:1.0: individual port power switching
[    8.974077] hub 4-3:1.0: individual port over-current protection
[    8.974079] hub 4-3:1.0: Single TT
[    8.974081] hub 4-3:1.0: TT requires at most 8 FS bit times (666 ns)
[    8.974083] hub 4-3:1.0: power on to power good time: 100ms
[    8.974157] hub 4-3:1.0: local power source is good
[    8.974259] hub 4-3:1.0: enabling power on all ports
[    8.979469] usb 3-1: udev 2, busnum 3, minor = 257
[    8.979473] usb 3-1: New USB device found, idVendor=03f0, 
idProduct=7029, bcdDevice= 0.02
[    8.994797] usb 3-1: New USB device strings: Mfr=1, Product=2, 
SerialNumber=0
[    9.010633] usb 3-1: Product: Virtual Keyboard
[    9.024416] usb 3-1: Manufacturer: BMC
[    9.037858] usb 3-1: usb_probe_device
[    9.037860] usb 3-1: configuration #1 chosen from 1 choice
[    9.039418] usb 3-1: adding 3-1:1.0 (config #1, interface 0)
[    9.041507] usb 3-1: adding 3-1:1.1 (config #1, interface 1)
[    9.076272] hub 4-3:1.0: state 7 ports 2 chg 0000 evt 0000

I am not accustomed to looking the USB Bus.port.dev mappings , obviously 
with BCM discovered there are 05 Bus instead of 4 .

/:  Bus 05.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/6p, 5000M
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/15p, 480M
     |__ Port 3: Dev 2, If 0, Class=Hub, Driver=hub/2p, 480M
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=uhci_hcd/2p, 12M
     |__ Port 1: Dev 2, If 0, Class=Human Interface Device, 
Driver=usbhid, 12M
     |__ Port 1: Dev 2, If 1, Class=Human Interface Device, 
Driver=usbhid, 12M
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/2p, 480M
     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/8p, 480M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/2p, 480M
     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/6p, 480M


Here are the pci mappings:

[    6.381615] input: BMC Virtual Keyboard  as 
/devices/pci0000:00/0000:00:1c.2/0000:01:00.4/usb3/3-1/3-1:1.0/0003:03F0:7029.0001/input/input1
[    6.463638] hid-generic 0003:03F0:7029.0001: input,hidraw0: USB HID 
v1.01 Keyboard [BMC Virtual Keyboard ] on usb-0000:01:00.4-1/input0
[    6.496589] input: BMC Virtual Keyboard  as 
/devices/pci0000:00/0000:00:1c.2/0000:01:00.4/usb3/3-1/3-1:1.1/0003:03F0:7029.0002/input/input2
[    6.529449] hid-generic 0003:03F0:7029.0002: input,hidraw1: USB HID 
v1.01 Mouse [BMC Virtual Keyboard ] on usb-0000:01:00.4-1/input1
[    6.563139] usbcore: registered new interface driver usbhid
[    6.580222] usbhid: USB HID core driver



The last activity done seen on both traces is :

     "  enabling power on all ports  "

Is this when the BCM discovery is suppose to  occur ? In the function 
example is when the udev appears:

    usb 3-1: udev 2, busnum 3, minor = 257


-- 
Thank You,
John
