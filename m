Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95B71630E7B
	for <lists+linux-usb@lfdr.de>; Sat, 19 Nov 2022 12:38:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbiKSLiF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 19 Nov 2022 06:38:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbiKSLiF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 19 Nov 2022 06:38:05 -0500
Received: from mr85p00im-ztdg06021701.me.com (mr85p00im-ztdg06021701.me.com [17.58.23.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 821BF942FD
        for <linux-usb@vger.kernel.org>; Sat, 19 Nov 2022 03:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
        t=1668857884; bh=wmRJd6++Xr4B9UxunEe8OF2nsCKlhE82frnamP2FVNI=;
        h=From:Content-Type:Mime-Version:Subject:Message-Id:To:Date;
        b=VBh93KvfcnesnWg7OJIsJ1prRsBmZFqiNWuvIKMl8TQ2FtRCYthL+sgpj78bBX6N3
         6gbZ/3HpPNuoaBrBMuNfgns7XxK6ZmW5Z2RvqpW43fMmwkfkVPjQtEtvBCav09EkKw
         iiaxH/bFn6cRDV41ZDAjNEwArxMO+pOgVV5Mb33nlsSRAnXynD60DcwQXbnhc68U3B
         EQ/06HyTYWCICCDiD6/3AZlsqwcOOI5mfhW4yTEFXdSsYnxn25hCWv6gMevv7XfPno
         4UzGpjhpsvsLcXK+QMrYmqlpch3ZakuuzgoaVM+qXF/6QwCMoWuX/1liVrz/Sr4rHw
         8CoX+P32Q2UNg==
Received: from smtpclient.apple (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
        by mr85p00im-ztdg06021701.me.com (Postfix) with ESMTPSA id C98D59A0AE9
        for <linux-usb@vger.kernel.org>; Sat, 19 Nov 2022 11:38:03 +0000 (UTC)
From:   Andrew McNaughton <andrewmcnaughton@me.com>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.96\))
Subject: How to get USB bluetooth device supported?
Message-Id: <A14CCC2A-F874-4B61-B888-DCC12A5E7CEA@me.com>
References: <8AA450C9-623F-45C0-9981-93F3A3A7AAA0@me.com>
To:     linux-usb@vger.kernel.org
Date:   Sat, 19 Nov 2022 11:37:51 +0000
X-Mailer: Apple Mail (2.3731.300.96)
X-Proofpoint-GUID: qfRabGDOVN83tigd_OSyS9KBuvG-RFzF
X-Proofpoint-ORIG-GUID: qfRabGDOVN83tigd_OSyS9KBuvG-RFzF
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.816,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-18=5F01:2022-01-14=5F01,2022-01-18=5F01,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 clxscore=1015
 adultscore=0 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=665 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2211190086
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

How does one go about getting a device that should work with btusb but =
doesn=E2=80=99t? It works fine with Microsoft generic bt drivers.

I can see people adding new VID/PID=E2=80=99s to btusb but I don=E2=80=99t=
 know if that=E2=80=99s all that=E2=80=99s needed here. This is for a =
Bluetooth 5.3 transceiver. There=E2=80=99s not a lot of these about yet =
but I think important for accessing newer/upcoming audio purposes.


=46rom /sys/kernel/debug/usb/devices:

T:  Bus=3D02 Lev=3D02 Prnt=3D02 Port=3D01 Cnt=3D01 Dev#=3D  3 Spd=3D12   =
MxCh=3D 0
D:  Ver=3D 2.00 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 MxPS=3D64 #Cfgs=3D  1
P:  Vendor=3D10d7 ProdID=3Db012 Rev=3D88.91
S:  Manufacturer=3DActions
S:  Product=3Dgeneral adapter
S:  SerialNumber=3DACTIONS1234
C:* #Ifs=3D 2 Cfg#=3D 1 Atr=3Dc0 MxPwr=3D100mA
I:* If#=3D 0 Alt=3D 0 #EPs=3D 3 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 =
Driver=3Dbtusb
E:  Ad=3D81(I) Atr=3D03(Int.) MxPS=3D  64 Ivl=3D1ms
E:  Ad=3D02(O) Atr=3D02(Bulk) MxPS=3D  64 Ivl=3D0ms
E:  Ad=3D82(I) Atr=3D02(Bulk) MxPS=3D  64 Ivl=3D0ms
I:* If#=3D 1 Alt=3D 0 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 =
Driver=3Dbtusb
E:  Ad=3D01(O) Atr=3D01(Isoc) MxPS=3D   0 Ivl=3D1ms
E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D   0 Ivl=3D1ms
I:  If#=3D 1 Alt=3D 1 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 =
Driver=3Dbtusb
E:  Ad=3D01(O) Atr=3D01(Isoc) MxPS=3D   9 Ivl=3D1ms
E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D   9 Ivl=3D1ms
I:  If#=3D 1 Alt=3D 2 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 =
Driver=3Dbtusb
E:  Ad=3D01(O) Atr=3D01(Isoc) MxPS=3D  17 Ivl=3D1ms
E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D  17 Ivl=3D1ms
I:  If#=3D 1 Alt=3D 3 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 =
Driver=3Dbtusb
E:  Ad=3D01(O) Atr=3D01(Isoc) MxPS=3D  25 Ivl=3D1ms
E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D  25 Ivl=3D1ms
I:  If#=3D 1 Alt=3D 4 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 =
Driver=3Dbtusb
E:  Ad=3D01(O) Atr=3D01(Isoc) MxPS=3D  33 Ivl=3D1ms
E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D  33 Ivl=3D1ms
I:  If#=3D 1 Alt=3D 5 #EPs=3D 2 Cls=3De0(wlcon) Sub=3D01 Prot=3D01 =
Driver=3Dbtusb
E:  Ad=3D01(O) Atr=3D01(Isoc) MxPS=3D  49 Ivl=3D1ms
E:  Ad=3D83(I) Atr=3D01(Isoc) MxPS=3D  49 Ivl=3D1ms


This is on Linux Kernel: 6.0.8-300.fc37.aarch64


This needs to be added to the usb.ids (I=E2=80=99ve tried submitting to =
the update robot but I don=E2=80=99t know if that is still alive):

10d7 Actions Semiconductor Co., Ltd
b012 ATS2851 Bluetooth 5.3 Transceiver [Ugreen CM591]



Thanks in advance.
--
Andrew McNaughton

email: andrewmcnaughton@me.com


