Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE09719837B
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2020 20:37:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726960AbgC3ShK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Mar 2020 14:37:10 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:41852 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726830AbgC3ShK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Mar 2020 14:37:10 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02UIJ047006324;
        Mon, 30 Mar 2020 18:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=BbxSwUyJCAZs5gpwJnGpAgqospu3/Gq4fW6jkynlh/g=;
 b=x0fEkGiL/HfQprhL7aoaDWRy9IGnkjyZrWUGcMmn7Kc+jvFB1FH5aRGCUsTJo5lnvOW1
 ZfIU4bZO+1oCHVKYuKzOfq3N/EbCIhuHpcTCGYXGrtRI753PrIng3W1aNs5glQZnos7U
 NTlTL7THZi0fIO0twiHvehfR0vo5SZHbdU++qtk35qH0nm6vQ39P0I4AgvGReStael9M
 gIWiI1sBAgbl9434/2lLl49NNsr6IM2hEICKAzgvZGoHcizJflxkivBNC7eKI30KylOs
 LQ5k6gzXg3wAgtc7HwEEx+Fk9aA0kBaFw60EB8ebX6bkZ8Obq5ONmjl9xLADmA33TEuM 0w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 303aqhbwwv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 30 Mar 2020 18:36:59 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02UIKGZ8080923;
        Mon, 30 Mar 2020 18:36:58 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 302g4q5j6e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 30 Mar 2020 18:36:58 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 02UIau2p016286;
        Mon, 30 Mar 2020 18:36:58 GMT
Received: from dhcp-10-154-130-55.vpn.oracle.com (/10.154.130.55)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 30 Mar 2020 11:36:53 -0700
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: ehci-pci :   WARNING: CPU: 0 PID: 347 at kernel/dma/direct.c:34 
From:   John Donnelly <john.p.donnelly@oracle.com>
In-Reply-To: <Pine.LNX.4.44L0.2003281135130.1088-100000@netrider.rowland.org>
Date:   Mon, 30 Mar 2020 13:36:52 -0500
Cc:     linux-usb@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D9164381-96EF-4BD6-ACB2-6ABB20EF7397@oracle.com>
References: <Pine.LNX.4.44L0.2003281135130.1088-100000@netrider.rowland.org>
To:     Alan Stern <stern@rowland.harvard.edu>
X-Mailer: Apple Mail (2.3445.9.1)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9576 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=3
 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003300156
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9576 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=3
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003300156
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> On Mar 28, 2020, at 10:37 AM, Alan Stern <stern@rowland.harvard.edu> =
wrote:
>=20
> On Fri, 27 Mar 2020, John Donnelly wrote:
>=20
>> Hi,
>>=20
>> I am seeing this WARNING event with iommu=3Doff when booting a DL380
>> server with a 5.4.17 kernel.
>=20
> ...
>=20
>> The end result is this USB port is not configured when
>> dma_direct_map_page() is called and it returns return
>> DMA_MAPPING_ERROR;
>>=20
>>=20
>> When I boot the server with iommu=3Don I don=E2=80=99t see  this =
sequence :
>=20
> ...
>=20
>> On an older kernel  5.3. flavor I am not seeing this behavior, and =
the usbhib devices  appear as expected :
>=20
> I forgot to mention: Since you have one kernel where the WARNING =
occurs=20
> and one where it doesn't, you can use bisection to find the commit =
that=20
> was responsible for the change in behavior.  If you care to go to the=20=

> trouble...
>=20
> Alan Stern
>=20

Hi,


I discovered this particular server doesn=E2=80=99t continue probing the =
ports behind BCM is due to iommu being on.=20

With  =E2=80=9C iommu=3Don =E2=80=9C =20

USB Initialization stops after the  BCM "  3:1.0 hub with  2 ports =
detected=E2=80=9D , but no additional probing is done to discover the =
other end-points behind 3:1.0 :


[    9.467008] hub 2-1:1.0: 8 ports detected
[    9.538361] usb 4-3: new high-speed USB device number 2 using =
xhci_hcd
[    9.564504] usb 4-3: New USB device found, idVendor=3D0424, =
idProduct=3D2660, bcdDevice=3D 8.01
[    9.580454] usb 4-3: New USB device strings: Mfr=3D0, =
Product=3D0,SerialNumber=3D0
[    9.596642] hub 4-3:1.0: USB hub found
[    9.611040] hub 4-3:1.0: 2 ports detected.=20

   ** NO ADDITIONAL DISCOVERY **=20



2. With intel_iommu=3Doff, the BCM ports are probed after " 3:1.0: 2 =
ports detected "  state:=20

[    5.705072] usb 3-1: new full-speed USB device number 2 using =
uhci_hcd
[    5.772363] usb 4-3: new high-speed USB device number 2 using =
xhci_hcd
[    5.800528] usb 4-3: New USB device found, idVendor=3D0424, =
idProduct=3D2660,bcdDevice=3D 8.01
[    5.816439] usb 4-3: New USB device strings: Mfr=3D0, Product=3D0, =
SerialNumber=3D0
[    5.832298] hub 4-3:1.0: USB hub found
[    5.845786] hub 4-3:1.0: 2 ports detected. <----    AFTER THIS WE =
CONTINUE TO PROBE =20
[    5.889503] usb 3-1: New USB device found, idVendor=3D03f0, =
idProduct=3D7029, bcdDevice=3D 0.02
[    5.905380] usb 3-1: New USB device strings: Mfr=3D1, Product=3D2, =
SerialNumber=3D0
[    5.920997] usb 3-1: Product: Virtual Keyboard
[    5.934493] usb 3-1: Manufacturer: BMC


What prompts the discovery to look beyond : "hub 4-3:1.0: 2 ports =
detected. =E2=80=9C  ? Could there some state that needs examined  =
before it continues ?  ( I=E2=80=99ve never dealt with USB before on =
Linux ) .=20

The end result is the usbhid devices ( kdb and mouse ) are found :

/:  Bus 05.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/6p, 5000M
/:  Bus 04.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/15p, 480M
    |__ Port 3: Dev 2, If 0, Class=3DHub, Driver=3Dhub/2p, 480M
/:  Bus 03.Port 1: Dev 1, Class=3Droot_hub, Driver=3Duhci_hcd/2p, 12M
    |__ Port 1: Dev 2, If 0, Class=3DHuman Interface Device, =
Driver=3Dusbhid, 12M
    |__ Port 1: Dev 2, If 1, Class=3DHuman Interface Device, =
Driver=3Dusbhid, 12M
/:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dehci-pci/2p, 480M
    |__ Port 1: Dev 2, If 0, Class=3DHub, Driver=3Dhub/8p, 480M
/:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dehci-pci/2p, 480M


Is there a way I can turn on debug messages for the usb driver(s) to =
increase verbosity during boot since these are build-in modules ? =20




