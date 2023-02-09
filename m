Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5324D6901E7
	for <lists+linux-usb@lfdr.de>; Thu,  9 Feb 2023 09:12:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbjBIILw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Feb 2023 03:11:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjBIILv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Feb 2023 03:11:51 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A96612F19
        for <linux-usb@vger.kernel.org>; Thu,  9 Feb 2023 00:11:49 -0800 (PST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3194ocDQ012551;
        Thu, 9 Feb 2023 08:11:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=0P1YVDFTgQj19QZx8sCKe2QTipe9p1PsG0CIekI0DdQ=;
 b=Tp87Xth1ZieiSWlReoP0D3Jafqe+v3sX9FabviKJS0pbL98qmq10rGtm4EI/C3/9JDkh
 GspfI+M/Fq/BdlORuhNM0/4Za5AGIANH1XQs6sGx+ijXFZCkpAkQR2kIXrEr3IHMT6gS
 VJ6tALf1RcheQWqwQB3P5TsITPBa0GvgJlTLNiNiBDzYYxpPV5vVSSseNs7tulo2eJxD
 AQgtTU3XERWx8i3qLpHd1854NmGb6GqyD2S5TTdVmDgmktlAFjRpUVxFfuYuyBFJ0kj9
 RtT0201wEH4bTZ5gAyqhUq5dQCKT/Jko4hL4M4kHUuuLvn8NQVOW/PB/we1KOdOhRTDG SQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nmg9ehqqx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 09 Feb 2023 08:11:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3198Bi1c024315
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 9 Feb 2023 08:11:44 GMT
Received: from hu-jackp-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 9 Feb 2023 00:11:43 -0800
Date:   Thu, 9 Feb 2023 00:11:36 -0800
From:   Jack Pham <quic_jackp@quicinc.com>
To:     Jerry Zhang <jerry@skydio.com>
CC:     <balbi@kernel.org>, <linux-usb@vger.kernel.org>,
        Alex Mallery <alex.mallery@skydio.com>,
        <quic_wcheng@quicinc.com>, <quic_ppratap@quicinc.com>
Subject: Re: dwc3 stuck in U3 state on USB3-only link
Message-ID: <20230209081136.GA31049@hu-jackp-lv.qualcomm.com>
References: <CAMKO5Cs69cN+RZNvszobqpHwNNsPFafAaSUxg63sWhSGPXcjyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMKO5Cs69cN+RZNvszobqpHwNNsPFafAaSUxg63sWhSGPXcjyw@mail.gmail.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SarEw1BYFfA8uHMqZf_YlZTE7_gR0zLN
X-Proofpoint-ORIG-GUID: SarEw1BYFfA8uHMqZf_YlZTE7_gR0zLN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-09_04,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1011 lowpriorityscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302090077
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Jerry,

On Wed, Feb 08, 2023 at 07:27:04PM -0800, Jerry Zhang wrote:
> We have a custom board with two linux systems connected by USB 3 wires
> only, vbus and USB2 are omitted for space savings. This has pretty
> much worked as the controllers are independent, except for the
> following bug:
> 
> - When the host system (tegra xhci host driver) reboots, the device
> (msm-dwc3) enters the U3 state and never leaves it, even after the
> host powers back up.
> - Also if the device system happens to finish booting before the host,
> the same thing happens, dwc3 gets stuck in U3 and never enumerates.

In both of these scenarios when the host is momentarily offline, what
is state of the superspeed signal lines?  Specifically, does the host
remove terminations from its SSTX lines?
 
> I'm able to get these messages from the dwc3 driver when the host reboots
> 
> [   34.549834] msm-dwc3 a600000.ssusb: msm_dwc3_pwr_irq received
> [   34.555749] msm-dwc3 a600000.ssusb: dwc3_pwr_event_handler irq_stat=28100C
> [   34.562902] msm-dwc3 a600000.ssusb: dwc3_pwr_event_handler link
> state = 0x0006
> [   34.570319] msm-dwc3 a600000.ssusb: dwc3_pwr_event_handler:
> unexpected PWR_EVNT, irq_stat=281000
> [   34.663734] msm-dwc3 a600000.ssusb: msm_dwc3_pwr_irq received
> [   34.669644] msm-dwc3 a600000.ssusb: dwc3_pwr_event_handler irq_stat=2C1004
> [   34.676698] msm-dwc3 a600000.ssusb: dwc3_pwr_event_handler:
> unexpected PWR_EVNT, irq_stat=2C1000
> [   34.686082] dwc3 a600000.dwc3: dwc3_gadget_suspend_interrupt Entry to 3
> [   34.692919] dwc3 a600000.dwc3: Notify controller from
> dwc3_gadget_vbus_draw. mA = 2
> [   34.700777] msm-dwc3 a600000.ssusb:
> DWC3_CONTROLLER_SET_CURRENT_DRAW_EVENT received
> [   34.708648] dwc3 a600000.dwc3: Notify OTG from dwc3_gadget_suspend_interrupt
> [   34.715888] msm-dwc3 a600000.ssusb: DWC3_CONTROLLER_NOTIFY_OTG_EVENT received

(BTW I notice from these msm-dwc3 logs you must be using a Qualcomm SoC
with a downstream kernel.  Though I think the issue is generic enough to
debug with the upstream dwc3 gadget, if it does turn out to be some
vendor-specific behavior then I would ask you to contact us directly for
more focused support.)

If possible please enable dwc3 tracing events as we might be able to see
more info about the specific events that occur when the host reboots.

> I think the main thing I'm looking for is validating my existing
> understanding and confirming a few things I suspect, but am not sure
> of due to unfamiliarity with the details of the USB3 spec:
> 
> - iiuc USB3 power management and states should actually be independent
> from both vbus and usb2 lines as all the negotiation happens with LFPS
> over the USB3 wires.

Yes, but in the corner scenario above with the host going offline, you
might be in a situation in which the device abrutly exits its U0 state
due to a perceived disconnection or lack of communication on the SS
pins.  It might be that the LTSSM could have transitioned to SS.Disabled
state--in which case one of the only ways out of that state is, to quote
from the USB3.2 spec (7.5.1.1.2 Exit from eSS.Disabled):

  "An upstream port shall transition to Rx.Detect only when VBUS
   transitions to valid or a USB 2.0 bus reset is detected."

But since you don't have VBUS nor usb2 lines connected, it's possible
the controller could have gotten stuck here and not have a way out.

:) there is a reason that spec compliant USB3.x implementations must
also provide D+/D- connectivity; not only for backwards compatibility
but also for these sorts of fallback scenarios.

> - I see that entry to U3 requires an LFPS message, but in this case
> the host wouldn't have been able to send a message as it is powering
> off. Is the device also capable of entering U3 due to timeouts and is
> it expected to enter U3 in this situation?

In this case since it's obviously not a U3 entry due to LFPS, the only
other interpretation of the dwc3's U3 link state is that it is a
HS/FS/LS Suspend/L2 state.  This can occur simply by not having activity
on D+/D- lines.

> - Similarly I've seen that exiting from U3 requires an LFPS message.
> My expectation is that the host would wake up all devices on the bus
> with LFPS messages shortly after bootup, and either this isn't
> happening, or the device is failing to receive or process the message.
> If the entry to U3 is expected, how is it then expected to exit U3?

I think what might have happened is that when the host rebooted, the
device must have abruptly exited U0 and went into eSS.Disabled; at that
point the dwc3 controller "falls back" into USB2 mode but since D+/D-
are not connected, it is then perceived as entering USB2 suspend.
Being in eSS.Disabled could explain why it doesn't respond to further
LFPS signaling from the host.

You'd somehow need to get the controller to go back into Rx.Detect.
Since you don't have a way to do USB2 reset on D+/D-, you may need to at
least simulate a VBUS toggle, or forcefully reset the dwc3 controller.

With the QCOM HW there is a register that can do this.  Please refer to
dwc3_qcom_vbus_override_enable() in dwc3-qcom.c for the upstream
implementation.

> I've also tried relevant looking quirks on the gadget side including
> ssp-u3-u0-quirk, u2exit_lfps_quirk, disable_scramble_quirk. I don't
> see a way to explicitly prevent the controller from entering U3 mode,
> is this possible with a register setting?
> 
> Would appreciate any thoughts. If I haven't misunderstood anything,
> the next step would probably be to find a beagle 5000 analyzer and
> track down the LFPS messages.

I this is still a good idea, if at least to see what's happening on the
signal lines at a lower level.  Would be great if it could show the
state of terminatination when the host is rebooting.

Hope that helps,
Jack
