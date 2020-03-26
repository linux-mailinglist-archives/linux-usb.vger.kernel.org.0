Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2784D19482A
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 21:03:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727719AbgCZUDR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 16:03:17 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:55346 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727446AbgCZUDQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Mar 2020 16:03:16 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02QJx8Xv046765
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2020 20:03:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : content-type :
 content-transfer-encoding : mime-version : date : subject : message-id :
 to; s=corp-2020-01-29; bh=s9UEpIW+lsCLg2gmVx11CrymPRIPFMo/MMcp/jgu5vs=;
 b=mYMuXMpX/i4a/jpW1Ey58xIfrZCyIzrsiHdqhPHYQN1C97w0bGE465Y9QMpjhNcZrVdI
 gNGGNaqaRjU+RomTYFDXfFbSXrB506jjbjSPaQ8jAOM2g2CHZ4y5V/QeEU9X0jTfgfFd
 YqfSsneD9EAIS3zvw/qxzxoiSqY7FVIV0b0m3G97ENAGd7/GxoHBBl9Ku/c6EZfZzY0/
 XkymoWy0mfULgnlbXeSu6QU8D9hKUDL4D/QtKj4cQN90M0czuLKHMXxtmzsILEW1s6fe
 dyhqFnF+AxwjEpfa+bSfncBPPzDldS1WsA6bTbjWmsRqS47tV/Ea3cst3MqmwZZ5usP7 ag== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 2ywavmhy6e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2020 20:03:14 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02QJud2X190600
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2020 20:03:14 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 30073ecdp6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2020 20:03:14 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02QK3D6h027269
        for <linux-usb@vger.kernel.org>; Thu, 26 Mar 2020 20:03:14 GMT
Received: from dhcp-10-154-182-169.vpn.oracle.com (/10.154.182.169)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 26 Mar 2020 13:03:13 -0700
From:   John Donnelly <john.p.donnelly@oracle.com>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date:   Thu, 26 Mar 2020 15:03:12 -0500
Subject: Question :  remote "ILO" setup - keyboard and mouse enumeration 
Message-Id: <7A2988F9-C174-4A13-8F0E-B3D73A33DF47@oracle.com>
To:     linux-usb@vger.kernel.org
X-Mailer: Apple Mail (2.3445.9.1)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9572 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=891 adultscore=0
 suspectscore=5 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003260146
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9572 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 suspectscore=5 mlxlogscore=933 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003260146
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

This is 10,000 foot question for a issue I am looking at :

Quite a few servers have a BCM that expose a USB keyboard and mouse when =
a " iLo client session " is started  that also provides a remote =
console.

For instance on Bus 01.Port 1: Dev 1, Port 8 there are these devices :

 lsusb -t
/:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/10p, 5000M
/:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/16p, 480M
    |__ Port 8: Dev 2, If 0, Class=3DHub, Driver=3Dhub/7p, 480M
        |__ Port 3: Dev 3, If 0, Class=3DCommunications, =
Driver=3Dcdc_ether, 480M
        |__ Port 3: Dev 3, If 1, Class=3DCDC Data, Driver=3Dcdc_ether, =
480M


When a remote viewer ( iLO ) session is started, two HID appear under =
Port 8 :


 lsusb -t
/:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/10p, 5000M
/:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/16p, 480M
    |__ Port 8: Dev 2, If 0, Class=3DHub, Driver=3Dhub/7p, 480M
        |__ Port 1: Dev 7, If 0, Class=3DHuman Interface Device, =
Driver=3Dusbhid,480M
        |__ Port 2: Dev 6, If 0, Class=3DHuman Interface Device, =
Driver=3Dusbhid,480M
        |__ Port 3: Dev 3, If 0, Class=3DCommunications, =
Driver=3Dcdc_ether, 480M
        |__ Port 3: Dev 3, If 1, Class=3DCDC Data, Driver=3Dcdc_ether, =
480M


Is this device tree showing me the Port 8 is somehow wired to the BCM ?  =
And the BCM did some sort of operation that causes the xhci_hcd driver =
to enumerate a new device ? =20

The driver :  =E2=80=9C usbhid =E2=80=9C in real life appears to be a =
built-in component to the kernel - Not a loadable module .  I suspect =
that is so keyboards always work.=20

When the iLO session is terminated the two HID devices disappear .=20

If anyone can point me documentation how this works I would appreciate =
it. =20


Thank you for your time.=20

JD











