Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A781D2B6D64
	for <lists+linux-usb@lfdr.de>; Tue, 17 Nov 2020 19:31:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727552AbgKQSaw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Nov 2020 13:30:52 -0500
Received: from mx0a-000eb902.pphosted.com ([205.220.165.212]:27752 "EHLO
        mx0a-000eb902.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726766AbgKQSav (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Nov 2020 13:30:51 -0500
Received: from pps.filterd (m0220294.ppops.net [127.0.0.1])
        by mx0a-000eb902.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0AHIRYjc011871;
        Tue, 17 Nov 2020 12:30:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps1;
 bh=+OGVJMX2IzdsoChsICvhsrZ9buJ8FEHn5dQsPaWJWGA=;
 b=LyJf8LeCHPZO5nIha0dGQEwxUWnNYtoVp3vCzdFxXnjK+QZEB7IOP4+btnCGBifNIhmn
 EALlCg2IMPgyHsPzLYl6F0E7z9IisGsG4TV27nPwBv+h8xz4mZ2eqvAP17famF8IcI6r
 EeB1khbjk4aB5GE7iEetll9IB9dYDd5dFI9T81VUIxuQ8+vuzrHRj8JKL+Ftg6SLDouh
 5rCh6F+GeE+PX1zXNSb3qP5D0oBaLrw+gd4WhIUhZ59EntWaUvp4a2GLdtxB+T6ex479
 hfW0cTH/CYR8v05hZErewdF5Uko9vWLjPc9VBOm6FYnH4UydwMSFDvkz+wjV/TXedc4q 4g== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
        by mx0a-000eb902.pphosted.com with ESMTP id 34tbr54dyk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 17 Nov 2020 12:30:44 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZ+o8x0fa7KGjvGbuVZUOj2/ufV20U20OFbltpzKeMRNqLvWDo25/qQBfVv4Y3BCX7CEfh/s+4bNXnoiAzk8PZm7hvNFcHGUibZ5rAGKo68H7mWkUu0S9QmOm6bMm268qsBYuLtPvySLM50mnH8tq8xz08kqHOyd6WxNQvRDzVQ9GiTU9WJSvbDxbxQl+f5BqbRCoyHRE9uidJhrFrCGWpGabPcdn+49bbJmUhuf8z7wq1WFKSKMqs3EuaubepwHvsIVod0/vHMqgo3cCKAN7qdAKegrCN296sxYji3BeIRJd+2dlKq/x2D8OdwsBd5qVjtCL8QQlv2+FdUF9VkkhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+OGVJMX2IzdsoChsICvhsrZ9buJ8FEHn5dQsPaWJWGA=;
 b=cS0d1SFNydz0xIGC5fopzwUPKxBIiTSsxSbn6iPDbh9fneP8ptDDHd1ECUj1XHIavaQMDefcO5b8M9Eu0aevj5Vr7LodbU8qI4qwN3IV2nAwgLji5gNlnOxsz795DcE5Qa7WrHHrKVFXrOA3lkHFvsN63roorLoEuYUlpyz1J1/86LcvYaitSHY3bw5Rh19Dj+3EwDhQ6PBcyQeuGSANMPBgdWyDiboG3QXx2VceQST20DnOR7i3PyVRR/3+rIglwtJZOKtDZSeYLfTcFne61U8FnelsIW2qCsxRrCKLgmCoKYdAjPBTI8XCMit/9Fc8ye+n+xMQF7t63SAT6G203A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=garmin.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=garmin.onmicrosoft.com; s=selector1-garmin-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+OGVJMX2IzdsoChsICvhsrZ9buJ8FEHn5dQsPaWJWGA=;
 b=pdHV+ke3FDJrkWSiM2UmgZFgltS0WhG8QWF8UUplU6SsN3cufFXmW54r9X0NRcmLrDOejjBdIm3IIejSwl0+P3qxFmyzlMBwhCoqLI9VPYqTg9PqAoiC1GL46kDTdhnLw1JV630L8k7sRNkYTCXkF4F6JonbrM7/zuUbHzy0ofyvySwmtKDMzDeqZQO56xemlPNkiidQFLJ60AZNYKITyUsC0nm0HqnM70KUAhN32A8rd6k89HkQURgQ8GuhAEN8GaDiaqr/baOMEd5Oyz3mtbodj7e6g7GzniSggwtN6zKb986a0Z8dY7Ovga/jbA0VYliD6MDQtshjTUk8VMkVMw==
Received: from DM6PR05CA0041.namprd05.prod.outlook.com (2603:10b6:5:335::10)
 by PH0PR04MB7592.namprd04.prod.outlook.com (2603:10b6:510:4f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Tue, 17 Nov
 2020 18:30:36 +0000
Received: from DM6NAM10FT063.eop-nam10.prod.protection.outlook.com
 (2603:10b6:5:335:cafe::67) by DM6PR05CA0041.outlook.office365.com
 (2603:10b6:5:335::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.15 via Frontend
 Transport; Tue, 17 Nov 2020 18:30:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
 DM6NAM10FT063.mail.protection.outlook.com (10.13.152.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Tue, 17 Nov 2020 18:30:35 +0000
Received: from OLAWPA-EXMB9.ad.garmin.com (10.5.144.19) by
 olawpa-edge5.garmin.com (10.60.4.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2106.2; Tue, 17 Nov 2020 12:30:24 -0600
Received: from OLAWPA-EXMB8.ad.garmin.com (10.5.144.18) by
 OLAWPA-EXMB9.ad.garmin.com (10.5.144.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Tue, 17 Nov 2020 12:30:34 -0600
Received: from OLAWPA-EXMB8.ad.garmin.com ([fe80::acc8:480a:b46f:6ce3]) by
 OLAWPA-EXMB8.ad.garmin.com ([fe80::acc8:480a:b46f:6ce3%23]) with mapi id
 15.01.2106.004; Tue, 17 Nov 2020 12:30:34 -0600
From:   "Neuenschwander, Bowe" <Bowe.Neuenschwander@garmin.com>
To:     Peter Chen <peter.chen@nxp.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: USB Gadget EEM Suspend/Resume
Thread-Topic: USB Gadget EEM Suspend/Resume
Thread-Index: AQHWvG1JL2Kd5y1bZE+t7tgpTs7zZanLi/CAgADydl8=
Date:   Tue, 17 Nov 2020 18:30:34 +0000
Message-ID: <bb22f96493394335909c5e85b09b0e9e@garmin.com>
References: <09f87aed186f4c8cb56aee1d2409ae65@garmin.com>,<20201117013849.GA5967@b29397-desktop>
In-Reply-To: <20201117013849.GA5967@b29397-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.50.4.6]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e77b60c-a665-465f-21ba-08d88b26e03a
X-MS-TrafficTypeDiagnostic: PH0PR04MB7592:
X-Microsoft-Antispam-PRVS: <PH0PR04MB75921D76541D11229E1D67119CE20@PH0PR04MB7592.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SHI04MA2Fqhw59mFZfCLcU8doM6Pgo/YG7LKIoE6qkasFy561G9ctvPzirKhBoy4+QuiWISKCzSkuMCdrX6w4gzZmwVBxESrHSz0TgAzx74J1oDlbQBXhnP+nRNsU0E9rzk8UP9i6XaBqXJc2lJhvahDIR5ZTsBeNvVWMmrCaIrMCBqWDqjU6hYvlftGHkpu2e7N4BLTOp8W/8bpmdQVgJw89GyaL19eRj781tYtilWUQZqXQzhzycME/BqTYW2ACLvFLO5bT2tPCpkDx8evib3oeolmozI+gC5zwRV7bJJVxhnQRkMpQIZIDVyfhY/GKLNUYEtjk6Jof2wclQvsJbSJ0rckv7bPwDO0n8AteHvy2NRXiUIWdb/tiYZ+VSe+2xvqMd9seHkfyrES3OSobQ==
X-Forefront-Antispam-Report: CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(136003)(376002)(346002)(396003)(39860400002)(46966005)(356005)(5660300002)(70586007)(36756003)(82740400003)(8936002)(47076004)(70206006)(186003)(8676002)(53546011)(478600001)(7696005)(108616005)(82310400003)(2616005)(24736004)(6916009)(7636003)(15650500001)(2906002)(86362001)(26005)(426003)(83380400001)(316002)(336012)(4326008);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 18:30:35.8829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e77b60c-a665-465f-21ba-08d88b26e03a
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM10FT063.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7592
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-17_07:2020-11-17,2020-11-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 adultscore=0 clxscore=1011 mlxscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011170133
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks for your quick reply.  I think your ping test/example tells me quite=
 a
bit about the expected behavior.  I do have concerns though on what this wo=
uld
do to TCP connections.  Could that cause quite a bit of packet build up as
the connection attempts to re-transmit packets that were not ACKed (but sti=
ll
sitting in the queue)?  In the case that the suspend is long (say 10-60 min=
),
it seems this could cause quite a lot of packet build up, though I assume i=
ts
TX queue will fill up pretty quickly and send will start returning failure)=
.

The issue we are seeing is when USB is physically disconnected, the suspend
hooks are called, but the disconnect hooks are not.  The device side of the
USB link (the one configured with Gadget EEM) is externally powered and has
a hub as well.  The host is disconnected from the hub, but the link between
the hub and Gadget EEM remains intact, so the Gadget EEM processor does not
see VUSB go low.  See below for a crude diagram (monospaced font needed):
     ____________________________
    |           Device           |
    |  ________       ________   |        ________
    | |        |     |        |  |       |        |
    | |  USB   |     |  USB   |  |       |  USB   |
    | | Gadget |-----|  HUB   |--|---X---|  Host  |
    | |  EEM   |     |        |  |       |        |
    | |________|     |________|  |       |________|
    |                            |
    |____________________________|

Therefore, it stays in that suspend state until USB is reconnected, at whic=
h
point the disconnect hook gets called and the connection is reset and set b=
ack
up.  See below for dmesg (note that the USB Gadget EEM interface is vis0):

USB Disconnected:
    [ 4047.888922] g_ether gadget: suspend
    [ 4048.442846] vis0: stop stats: rx/tx 13079/13406, errs 0/0
    [ 4048.442967] vis0: host still using in/out endpoints

USB Reconnected:
    [ 4054.891454] g_ether gadget: reset config
    [ 4054.891487] g_ether gadget: eem deactivated
    [ 4054.891500] vis0: gether_disconnect
    [ 4054.897743] g_ether gadget: suspend
    [ 4055.273258] g_ether gadget: suspend
    [ 4055.662466] g_ether gadget: high-speed config #1: CDC Ethernet (EEM)
    [ 4055.668899] g_ether gadget: reset eem
    [ 4055.668912] vis0: gether_disconnect
    [ 4055.668924] g_ether gadget: init eem
    [ 4055.668934] g_ether gadget: activate eem
    [ 4055.668974] vis0: qlen 10
    [ 4055.674126] g_ether gadget: reset eem
    [ 4055.674161] vis0: gether_disconnect
    [ 4055.674219] g_ether gadget: init eem
    [ 4055.674230] g_ether gadget: activate eem
    [ 4055.674267] vis0: qlen 10
    [ 4055.847697] vis0: eth_open
    [ 4055.847729] vis0: eth_start

The problem we have is when it goes into that suspend state, that interface
remains up but cannot actually send/receive.  There is a process (for which
we do not have source code available) that starts consuming a large portion
of the CPU (according to top/htop), which in turn causes other issues.  We
have have a little daemon to detect when USB gets disconnected and bring do=
wn
that interface (ifdown), and we have tried adjusting the offending process'=
s
nice value, but these do not fix the issue (they help, but do not elminate
it).  The only fix we have found so far to eliminate this issue is somethin=
g
similar to the patch I previously sent; but again, I have questions of if i=
t
is acceptable handling for USB suspend.

 -Bowe



From: Peter Chen <peter.chen@nxp.com>
Sent: Monday, November 16, 2020 7:39 PM
To: Neuenschwander, Bowe
Cc: linux-usb@vger.kernel.org
Subject: Re: USB Gadget EEM Suspend/Resume

On 20-11-16 23:11:20, Neuenschwander, Bowe wrote:
> Hello,
>
> I was hoping for some input on how USB Ethernet Gadget drivers should han=
dle
> USB suspend/resume  events.  We have a case where the USB suspend hook is=
 being
> called for an EEM Gadget; but since that hook is currently unimplemented,=
 the
> interface remains in an active/enabled state.  I have attached a patch th=
at
> seems to fix this issue for EEM devices by calling gether_disconnect() on
> suspend and gether_connect() on resume; but I do not know if this is actu=
ally
> correct behavior, so I was looking for some advice on that.  It seems tha=
t
> since the gadget driver cannot send data until the USB host resumes the U=
SB
> link, that the interface should be considered disconnected.
>

Please wrap up to 80 characters per line, that's easy for reading.
Would you please describe the real issue you have met? I have a simply
ping test for EEM, it could work after resume, the packet is pending
if host is suspended.


64 bytes from 192.168.1.1: icmp_seq=3D154 ttl=3D64 time=3D0.358 ms
64 bytes from 192.168.1.1: icmp_seq=3D155 ttl=3D64 time=3D0.375 ms
64 bytes from 192.168.1.1: icmp_seq=3D156 ttl=3D64 time=3D0.364 ms
64 bytes from 192.168.1.1: icmp_seq=3D157 ttl=3D64 time=3D0.359 ms
64 bytes from 192.168.1.1: icmp_seq=3D158 ttl=3D64 time=3D3223 ms
64 bytes from 192.168.1.1: icmp_seq=3D159 ttl=3D64 time=3D2199 ms
64 bytes from 192.168.1.1: icmp_seq=3D160 ttl=3D64 time=3D1175 ms
64 bytes from 192.168.1.1: icmp_seq=3D161 ttl=3D64 time=3D151 ms
64 bytes from 192.168.1.1: icmp_seq=3D162 ttl=3D64 time=3D0.407 ms
64 bytes from 192.168.1.1: icmp_seq=3D163 ttl=3D64 time=3D0.352 ms
64 bytes from 192.168.1.1: icmp_seq=3D164 ttl=3D64 time=3D0.351 ms
64 bytes from 192.168.1.1: icmp_seq=3D165 ttl=3D64 time=3D0.378 ms
64 bytes from 192.168.1.1: icmp_seq=3D166 ttl=3D64 time=3D0.351 ms

64 bytes from 192.168.1.1: icmp_seq=3D167 ttl=3D64 time=3D0.353 ms
fg
^C
--- 192.168.1.1 ping statistics ---
167 packets transmitted, 158 received, +9 errors, 5.38922% packet loss,
time 791ms
rtt min/avg/max/mdev =3D 0.330/1511.202/9886.157/2799.059 ms, pipe 10
root@imx8qmmek:~# dmesg -c
[ 1620.382457] configfs-gadget gadget: suspend
[ 1622.840007] configfs-gadget gadget: resume
[ 1631.275452] configfs-gadget gadget: suspend
[ 1633.839442] configfs-gadget gadget: resume
[ 1648.257668] configfs-gadget gadget: suspend
[ 1657.837955] configfs-gadget gadget: resume
[ 1669.252874] configfs-gadget gadget: suspend
[ 1679.836613] configfs-gadget gadget: resume
[ 1692.245250] configfs-gadget gadget: suspend
[ 1695.835642] configfs-gadget gadget: resume
[ 1711.255216] configfs-gadget gadget: suspend

Peter


> From 7cdc1cebe4092393e1de33f59fd2f1cd4355d494 Mon Sep 17 00:00:00 2001
> From: Bowe Neuenschwander <bowe.neuenschwander@garmin.com>
> Date: Tue, 10 Nov 2020 15:55:51 -0600
> Subject: [PATCH 1/2] usb: gadget: eem: Add suspend/resume handling
>
> Add suspend/resume handling to the USB Gadget EEM driver.  On suspend,
> disconnect the interface; on resume, attempt to reconnect the interface.
>
> Change-Id: I1c7a2bb1d68a99c774a415b13f6cdabb507ada92
> ---
>  drivers/usb/gadget/function/f_eem.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/drivers/usb/gadget/function/f_eem.c b/drivers/usb/gadget/fun=
ction/f_eem.c
> index cad35a502d3f..4fbdbb8ee295 100644
> --- a/drivers/usb/gadget/function/f_eem.c
> +++ b/drivers/usb/gadget/function/f_eem.c
> @@ -238,6 +238,33 @@ static void eem_disable(struct usb_function *f)
>               gether_disconnect(&eem->port);
>  }
>
> +static void eem_suspend(struct usb_function *f)
> +{
> +     struct f_eem            *eem =3D func_to_eem(f);
> +     struct usb_composite_dev *cdev =3D f->config->cdev;
> +
> +     DBG(cdev, "eem suspended\n");
> +
> +     if (eem->port.in_ep->enabled)
> +             gether_disconnect(&eem->port);
> +}
> +
> +static void eem_resume(struct usb_function *f)
> +{
> +     struct f_eem            *eem =3D func_to_eem(f);
> +     struct usb_composite_dev *cdev =3D f->config->cdev;
> +     struct net_device       *net;
> +
> +     DBG(cdev, "eem resumed\n");
> +
> +     if (!eem->port.in_ep->enabled) {
> +             net =3D gether_connect(&eem->port);
> +             if (IS_ERR(net))
> +                     ERROR(cdev, "%s: eem resume failed, err %d\n",
> +                           f->name, PTR_ERR(net));
> +     }
> +}
> +
>  /*----------------------------------------------------------------------=
---*/
>
>  /* EEM function driver setup/binding */
> @@ -636,6 +663,8 @@ static struct usb_function *eem_alloc(struct usb_func=
tion_instance *fi)
>       eem->port.func.set_alt =3D eem_set_alt;
>       eem->port.func.setup =3D eem_setup;
>       eem->port.func.disable =3D eem_disable;
> +     eem->port.func.suspend =3D eem_suspend;
> +     eem->port.func.resume =3D eem_resume;
>       eem->port.func.free_func =3D eem_free;
>       eem->port.wrap =3D eem_wrap;
>       eem->port.unwrap =3D eem_unwrap;
> --
> 2.29.2
>


--

Thanks,
Peter Chen


________________________________

CONFIDENTIALITY NOTICE: This email and any attachments are for the sole use=
 of the intended recipient(s) and contain information that may be Garmin co=
nfidential and/or Garmin legally privileged. If you have received this emai=
l in error, please notify the sender by reply email and delete the message.=
 Any disclosure, copying, distribution or use of this communication (includ=
ing attachments) by someone other than the intended recipient is prohibited=
. Thank you.
