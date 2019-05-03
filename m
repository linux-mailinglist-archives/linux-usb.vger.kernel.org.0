Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 321E712F97
	for <lists+linux-usb@lfdr.de>; Fri,  3 May 2019 15:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbfECNwN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 May 2019 09:52:13 -0400
Received: from mail1.bemta26.messagelabs.com ([85.158.142.1]:51083 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726047AbfECNwN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 May 2019 09:52:13 -0400
Received: from [85.158.142.103] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 8D/BB-22995-A874CCC5; Fri, 03 May 2019 13:52:10 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMKsWRWlGSWpSXmKPExsUyo1hfUrfT/Uy
  MwY2PJhZvHv9jtzjW9oTdonnxejaLRctamS2WXr/IZHFx/U5Gi9a9R9gtrjydyujA4bFm3hpG
  j52z7rJ7dDU1s3tsWtXJ5rF/7hp2j8+b5Dz2fv7NEsAexZqZl5RfkcCase/eOaaCCWIVz05vZ
  Gtg7BTqYuTiEBJYwyjx+/xT5i5GTg5eAROJZV+ng9nCAkESDS2LgWwODjYBXYmuO6Yg9SICpx
  klnj37zwLiMAv0M0pc7L0H1sAioCJxpuMRmM0pECsxc/smMFtI4CSjxNQ9CiA2s4CmROv23+w
  gtoSAhsSGm8eYIBYLSpyc+YQFokZeonnrbLDFQgKyEkcvxUKUK0ic3TKREcJOkjjXd4VtAqPA
  LCRTZyGZNAvJpAWMzKsYLZOKMtMzSnITM3N0DQ0MdA0NjXWNdI2MLfUSq3QT9VJLdZNT80qKE
  oGyeonlxXrFlbnJOSl6eaklmxiBEZRSyPR+B+P99vRDjJIcTEqivAaiZ2KE+JLyUyozEosz4o
  tKc1KLDzHKcHAoSfDmuQLlBItS01Mr0jJzgLEMk5bg4FES4Z0MkuYtLkjMLc5Mh0idYtTl+NL
  +aC6zEEtefl6qlDhvEEiRAEhRRmke3AhYWrnEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZj3
  IcgUnsy8ErhNr4COYAI64vmkUyBHlCQipKQaGF3vNJoJK/Ap3NA7VzH5i/6mZx8NX2de8e/65
  DGDo1p13qPbtrXbay9e/rLusFjbxm1vvTuZlsrz9G5Mu+Kyy1h7S8YU41pZpdvKlvJts9yLmd
  flcEmUdDYkH7knqmvTOcng2xqrO2tNucvsbzVd63+pvODP+dpMdlu3vddYwy9qXPu872R6vRJ
  LcUaioRZzUXEiAAZDf64mAwAA
X-Env-Sender: cst@phaseone.com
X-Msg-Ref: server-5.tower-228.messagelabs.com!1556891529!5892599!1
X-Originating-IP: [152.115.47.25]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6064 invoked from network); 3 May 2019 13:52:09 -0000
Received: from unknown (HELO Exchange2.phaseone.com) (152.115.47.25)
  by server-5.tower-228.messagelabs.com with AES256-SHA encrypted SMTP; 3 May 2019 13:52:09 -0000
Received: from cstu16.phaseone.com (172.16.2.207) by Exchange2.phaseone.com
 (172.16.1.180) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 3 May
 2019 15:52:06 +0200
Message-ID: <1556891523.24062.31.camel@phaseone.com>
Subject: Re: [PATCH 0/3] usb: gadget: Add support for disabling U1 and U2
 entries
From:   "Claus H. Stovgaard" <cst@phaseone.com>
To:     Anurag Kumar Vulisha <anuragku@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "v.anuragkumar@gmail.com" <v.anuragkumar@gmail.com>,
        Rob Weber <rob@gnarbox.com>
Date:   Fri, 3 May 2019 15:52:03 +0200
In-Reply-To: <BYAPR02MB55917AF9083F9718B713FBB4A7350@BYAPR02MB5591.namprd02.prod.outlook.com>
References: <1556792423-4833-1-git-send-email-anurag.kumar.vulisha@xilinx.com>
         <1556832986.22007.15.camel@gmail.com>
         <BYAPR02MB55917AF9083F9718B713FBB4A7350@BYAPR02MB5591.namprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.16.2.207]
X-ClientProxiedBy: Exchange3.phaseone.com (172.16.1.184) To
 Exchange2.phaseone.com (172.16.1.180)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Anurag

On Fri, 2019-05-03 at 07:34 +0000, Anurag Kumar Vulisha wrote:
> Hi Claus,
> Thanks for testing and voting for this patch.

I have first tested your patches today. My test setup is a ZynqMP
device, running kernel 4.14 (Xilinx version) with your patches.
I then create an overlay for the devicetree with the new parameters,
and unbind/bind the dwc3 driver.

Next I have a host running Windows 10 and a MacBook pro with Type-C
ports. For logging the communication I use a Total Phase Beagle USB3
5000 V2 analyzer.

The test showed that OS-X does as expected. When BOS descriptor
(bU1DevExtLat and bU2DevExtLat) returns 0, it does not enable LPM.

Windows 10 on the other hand does not, and even though it received 0 as
bU1DevExtLat and bU2DevExtLat it send Set Sel with U1SEL 85 us, U1PEL 0
us, U2SEL 85 us and U2PEL 0 us.
Next the Windows 10 host sends the U1 Enable and the U2 enable as Set
Device Feature, resulting in the system entering U2.

> > 
> > Just today I was making another solution for this feature, using
> > the
> > configfs instead of the devicetree. Though thinks your solution is
> > better, as it uses the U1DevExitLat and U2DevExitLat instead. I
> > just
> > added my solution to the bottem of the mail for reference.
> > 
> > [1] https://www.spinics.net/lists/linux-usb/msg179393.html
> > 
> Your approach below is also good, but you are just avoiding the
> gadget dwc3
> controller from entering into U1 and U2 states by disabling the
> ACCEPTU1ENA
> and ACCEPTU2ENA bits in DCTL but not preventing the host from sending
> the
> LG0_U1 and LGO_U2 link command signaling to the gadget. The host will
> keep
> on trying to get the link into U1 or U2 by sending LGO_U1 or LGO_U2
> and the
> gadget rejects these signals by sending LXU link command. To avoid
> this extra
> overhead I thought that sending zero  value in the BOS descriptor's
> U1DevExitLat and U2DevExitLat fields would be the best option. Host
> on seeing
> U 1 & U2 Exit Latencies doesn't initiate LPM U1 and U2 commands.
> 
> Thanks,
> Anurag Kumar Vulisha

Correct that it does not prevent the host from sending LG0_U1 and
LG0_U2, and there is your solution better on hosts using the BOS
descriptor for disabling LPM. So based on my test with Windows 10, I
think we should combine the solutions. To prevent LG0_U1/LG0_U2 when
possible and still being able to completely disable U1/U2.

Regarding interface for controlling it. I am very novice regarding
Linux kernel development, but would think the BOS descriptor control
would be better from a configfs interface then devicetree as I don't
see BOS descriptor as hardware specific. I am more in doubt about the
forcing of U1/U2 as I did with setting hardware registers, as it
control hardware registers. So will like to hear from other more
experienced developers.

Regards
Claus
