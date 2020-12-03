Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 886672CDDE8
	for <lists+linux-usb@lfdr.de>; Thu,  3 Dec 2020 19:42:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726206AbgLCSmH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Dec 2020 13:42:07 -0500
Received: from mx0a-000eb902.pphosted.com ([205.220.165.212]:41918 "EHLO
        mx0a-000eb902.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726012AbgLCSmH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Dec 2020 13:42:07 -0500
Received: from pps.filterd (m0220294.ppops.net [127.0.0.1])
        by mx0a-000eb902.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0B3IYPKJ029051;
        Thu, 3 Dec 2020 12:41:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps1;
 bh=2va6tgwT3yobqZ3Z9tC9dFUqebWcx03GzM3N9a1tpgI=;
 b=Q8IOCZhkEcoey4z7RewzdGYenV+NX4btWA6+YtbKOewlr3T41+GYO1HQxNM703o4ca1n
 i0oO8ct4BQqAxpNeT9cEdFvvUswUngWRXnVRVYT+mk5qwY6U9GoIpVpz2XQzykJz6XCc
 82h0zxyOtskJQxP/JrQP4WGsg+ZgPALzWECsWUnjfpH9aolzsiEda8xNL7ZrNRVUtc09
 YF6qmJ4kOofSuzFuWYjoA581GtBLHKtPvoipghYeuEb4K8l+2ckQ65/LpmqQdw6Zd/2m
 1VhBJrwB6bS4SXxJ6xDe79C493mbTnSZHwcyS1JJRG/dTCUmryl0R/W5S42IcGIGOOPk rQ== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
        by mx0a-000eb902.pphosted.com with ESMTP id 355wc8337c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 03 Dec 2020 12:41:21 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XBhPqH58CJiPESWTfrTtTaiMDHhimlRzIl+mlqVdqRLZ+L1iqYODizJ3DCtPZPu3LdIA8hlmbD1oEvTxpUSAe2GSfDS4WXEM8aN+o1SlGS2mJ3p5o2m4XsZpXZJmF5q2scEsNQTTR+zkwLA6PKr8UF5o+pLTEdmRxXoNNKpEpNLtZwPR0y/RUVQAselSPd/vyHuh5RojCV2rh4Bx2UGETdi/M44lfepTT9aKFtsv66ScP0N/a0cbDbPAKH6EMCkp4IlYiAjXPC5uLDq9sOaRQ3uub2TDixFCpbjLuKW4LcaZ41Eey6sj4H/f62rG0qxy1rgm4EfUB5HhJvG9P3UAJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2va6tgwT3yobqZ3Z9tC9dFUqebWcx03GzM3N9a1tpgI=;
 b=cioDKK0T1UChbswE6RWH8qfHk7jiIB2mTVy1PzWGx/L5cbj0TrEqO51FU4erSzQWNRJJl6StoolStJnXMEubTfWKZ5JvpTrxF/Vw3B+tD/pPQ0j/FCHE2tUK0M1//eLwARR8Xhf/WB01Sqz1Vr1Wzlic9e0/ZA1/LjyVPrmZJcP8n5fRChUdHs18gaMrQ+zosnYtnb70bEZRRdxqQHrOMQbRvvT456hnAcRBosa19WGEXh2GqVY8yxCz4AWBsCGFMF1GTmbzwSDcD+fhz50IxJR0xbs7e3CwiMyaEaycxIdrqAfoC9kkGA6cX7ebJrYdIOcIsCzuVH9yZQQ/SYfn6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=garmin.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=garmin.onmicrosoft.com; s=selector1-garmin-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2va6tgwT3yobqZ3Z9tC9dFUqebWcx03GzM3N9a1tpgI=;
 b=pNe2q2YzEB7J3b7Itewz5SuVuR7hrxDYVesiUGrCLhWcilL3pvVKfabSQw1tOJULpa8RDSA8iVw7vsKts+cLnSFhwHEm/AGSiV0pmfCYwVfh9zFM4jClZ1KW/0xYEOvPl6HgZkOpUGLNUtLbgUEmlKRD2SAWZCA1Nouaf7B2vfPOHtXEW+9gPrFFJwHwNmsoiVjzAxBzHrjZEgXXE4RrXXyLgjNTRehplyYByQGDRny+7jcwAIJNpROh6IXp9Zcr4ScYE4lmLivSkhewBBRSMdnY5Wqcxk32x4OFhdqodtZZNK3tmmbwHXO8J7yDFmDVbveGORIN7uT8TQmcODSTeA==
Received: from DM6PR14CA0041.namprd14.prod.outlook.com (2603:10b6:5:18f::18)
 by BYAPR04MB4918.namprd04.prod.outlook.com (2603:10b6:a03:4a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Thu, 3 Dec
 2020 18:41:19 +0000
Received: from DM6NAM10FT034.eop-nam10.prod.protection.outlook.com
 (2603:10b6:5:18f:cafe::24) by DM6PR14CA0041.outlook.office365.com
 (2603:10b6:5:18f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Thu, 3 Dec 2020 18:41:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
 DM6NAM10FT034.mail.protection.outlook.com (10.13.153.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.20 via Frontend Transport; Thu, 3 Dec 2020 18:41:18 +0000
Received: from OLAWPA-EXMB9.ad.garmin.com (10.5.144.19) by
 olawpa-edge3.garmin.com (10.60.4.226) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2106.2; Thu, 3 Dec 2020 12:41:18 -0600
Received: from OLAWPA-EXMB8.ad.garmin.com (10.5.144.18) by
 OLAWPA-EXMB9.ad.garmin.com (10.5.144.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Thu, 3 Dec 2020 12:41:18 -0600
Received: from OLAWPA-EXMB8.ad.garmin.com ([fe80::acc8:480a:b46f:6ce3]) by
 OLAWPA-EXMB8.ad.garmin.com ([fe80::acc8:480a:b46f:6ce3%23]) with mapi id
 15.01.2106.004; Thu, 3 Dec 2020 12:41:18 -0600
From:   "Neuenschwander, Bowe" <Bowe.Neuenschwander@garmin.com>
To:     Peter Chen <peter.chen@nxp.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: USB Gadget EEM Suspend/Resume
Thread-Topic: USB Gadget EEM Suspend/Resume
Thread-Index: AQHWvG1JL2Kd5y1bZE+t7tgpTs7zZanLi/CAgADydl+AC6Q3gIANqW0j
Date:   Thu, 3 Dec 2020 18:41:17 +0000
Message-ID: <f67e27987f164142ab954b924810b84d@garmin.com>
References: <09f87aed186f4c8cb56aee1d2409ae65@garmin.com>
 <20201117013849.GA5967@b29397-desktop>
 <bb22f96493394335909c5e85b09b0e9e@garmin.com>,<20201125015313.GE9929@b29397-desktop>
In-Reply-To: <20201125015313.GE9929@b29397-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.50.4.7]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1fea7d3-10a3-47d1-da50-08d897bb0626
X-MS-TrafficTypeDiagnostic: BYAPR04MB4918:
X-Microsoft-Antispam-PRVS: <BYAPR04MB4918DF71F4877BAA0EA972329CF20@BYAPR04MB4918.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WqVImjVWAv5ntKa3T0Nmpv0rXu39SiyMvh+2I1hrm/ugDlJHON9PVTKMPJ6rY4NOOyJ4v5sXR+QN7VEBIe5U6Lf/xrbKymEKprGWd+r1NevozMsAMoaWy4yoakMffhTAjwndxtaVy1RVg6QjD69YAHwT6JBsyiw+KORTOBvv5Ij6DVsf45LMzlAuVfHIX2vD2eiHl6Utt0Aurp9jfU8gge4BPqmTWau7sjqp6iAQ+8NNHb9cUmbUxb5Qk+j+CMAecwEFe1/AgJQzKu5Q63MBWsg8aKTknxS6398WVyM6wnLwB3UusptKGuQ5wcO1FwF/GjGdzCV5+y8jFZlVO0SE81ejwtG9ypSMIFagcAzx90V/1xsxJerbM11K3wnire4s6zWPAAgWWItBJNLSLu8B8g==
X-Forefront-Antispam-Report: CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(346002)(39860400002)(376002)(136003)(396003)(46966005)(36756003)(8676002)(336012)(5660300002)(316002)(478600001)(426003)(2616005)(15650500001)(7696005)(24736004)(53546011)(83380400001)(4326008)(2906002)(70206006)(70586007)(86362001)(26005)(356005)(8936002)(7636003)(82310400003)(82740400003)(108616005)(186003)(47076004)(6916009);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 18:41:18.9763
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1fea7d3-10a3-47d1-da50-08d897bb0626
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM10FT034.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4918
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-12-03_11:2020-12-03,2020-12-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012030109
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I gave that a try and it works in general; but unfortunately, it is not qui=
ck
enough.  Even if our daemon is re-niced to be high priority, the problemati=
c
process still consumes the CPU and causes problems before it is able to tak=
e
down the interface.

Therefore, we are planning to move forward with the original patch for our
local kernel, and will not submit it upstream.  I am open to other suggesti=
ons
if anybody has them; but at this point, I'm not convinced this is something
wrong or lacking in kernel like I originally thought might be the case.

Thanks,
-Bowe



From: Peter Chen <peter.chen@nxp.com>
Sent: Tuesday, November 24, 2020 7:53 PM
To: Neuenschwander, Bowe
Cc: linux-usb@vger.kernel.org
Subject: Re: USB Gadget EEM Suspend/Resume

CAUTION - EXTERNAL EMAIL: Do not click any links or open any attachments un=
less you trust the sender and know the content is safe.


On 20-11-17 18:30:34, Neuenschwander, Bowe wrote:
> Thanks for your quick reply.  I think your ping test/example tells me qui=
te a
> bit about the expected behavior.  I do have concerns though on what this =
would
> do to TCP connections.  Could that cause quite a bit of packet build up a=
s
> the connection attempts to re-transmit packets that were not ACKed (but s=
till
> sitting in the queue)?  In the case that the suspend is long (say 10-60 m=
in),
> it seems this could cause quite a lot of packet build up, though I assume=
 its
> TX queue will fill up pretty quickly and send will start returning failur=
e).
>
> The issue we are seeing is when USB is physically disconnected, the suspe=
nd
> hooks are called, but the disconnect hooks are not.  The device side of t=
he
> USB link (the one configured with Gadget EEM) is externally powered and h=
as
> a hub as well.  The host is disconnected from the hub, but the link betwe=
en
> the hub and Gadget EEM remains intact, so the Gadget EEM processor does n=
ot
> see VUSB go low.  See below for a crude diagram (monospaced font needed):
>      ____________________________
>     |           Device           |
>     |  ________       ________   |        ________
>     | |        |     |        |  |       |        |
>     | |  USB   |     |  USB   |  |       |  USB   |
>     | | Gadget |-----|  HUB   |--|---X---|  Host  |
>     | |  EEM   |     |        |  |       |        |
>     | |________|     |________|  |       |________|
>     |                            |
>     |____________________________|
>
> Therefore, it stays in that suspend state until USB is reconnected, at wh=
ich
> point the disconnect hook gets called and the connection is reset and set=
 back
> up.  See below for dmesg (note that the USB Gadget EEM interface is vis0)=
:
>
> USB Disconnected:
>     [ 4047.888922] g_ether gadget: suspend
>     [ 4048.442846] vis0: stop stats: rx/tx 13079/13406, errs 0/0
>     [ 4048.442967] vis0: host still using in/out endpoints
>
> USB Reconnected:
>     [ 4054.891454] g_ether gadget: reset config
>     [ 4054.891487] g_ether gadget: eem deactivated
>     [ 4054.891500] vis0: gether_disconnect
>     [ 4054.897743] g_ether gadget: suspend
>     [ 4055.273258] g_ether gadget: suspend
>     [ 4055.662466] g_ether gadget: high-speed config #1: CDC Ethernet (EE=
M)
>     [ 4055.668899] g_ether gadget: reset eem
>     [ 4055.668912] vis0: gether_disconnect
>     [ 4055.668924] g_ether gadget: init eem
>     [ 4055.668934] g_ether gadget: activate eem
>     [ 4055.668974] vis0: qlen 10
>     [ 4055.674126] g_ether gadget: reset eem
>     [ 4055.674161] vis0: gether_disconnect
>     [ 4055.674219] g_ether gadget: init eem
>     [ 4055.674230] g_ether gadget: activate eem
>     [ 4055.674267] vis0: qlen 10
>     [ 4055.847697] vis0: eth_open
>     [ 4055.847729] vis0: eth_start
>
> The problem we have is when it goes into that suspend state, that interfa=
ce
> remains up but cannot actually send/receive.  There is a process (for whi=
ch
> we do not have source code available) that starts consuming a large porti=
on
> of the CPU (according to top/htop), which in turn causes other issues.  W=
e
> have have a little daemon to detect when USB gets disconnected and bring =
down
> that interface (ifdown), and we have tried adjusting the offending proces=
s's
> nice value, but these do not fix the issue (they help, but do not elminat=
e
> it).  The only fix we have found so far to eliminate this issue is someth=
ing
> similar to the patch I previously sent; but again, I have questions of if=
 it
> is acceptable handling for USB suspend.

Since suspend is one of USB bus state, the USB host may suspend the
device at some situations, it seems it is your HUB's issue that does not
disconnect its downstream ports that the host disconnects it.

Could your daemon poll suspend state for gadget through
/sys/class/udc/<YOUR UDC NAME>/state and bring down the interface?
You need below change at kernel for that.

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.=
c
index c6d455f2bb92..bf11488de93b 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -2330,6 +2330,7 @@ void composite_suspend(struct usb_gadget *gadget)

        usb_gadget_set_selfpowered(gadget);
        usb_gadget_vbus_draw(gadget, 2);
+       usb_gadget_set_state(gadget, USB_STATE_SUSPENDED);
 }

 void composite_resume(struct usb_gadget *gadget)

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
