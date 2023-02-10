Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A005691722
	for <lists+linux-usb@lfdr.de>; Fri, 10 Feb 2023 04:29:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230452AbjBJD3a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Feb 2023 22:29:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230450AbjBJD33 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Feb 2023 22:29:29 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD2EB12048
        for <linux-usb@vger.kernel.org>; Thu,  9 Feb 2023 19:29:27 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31A3SeM8019695;
        Fri, 10 Feb 2023 03:29:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=basxZ0F0TrFypBHeKnLeCOdgJ+Ofwb8ehYE66OLnvbw=;
 b=mregVtNkBG91Z9HzvC5jlcuLyRZu2l3hrBDh86QnbAGQN3fueVqxPTLvJj8P2UjcZL4U
 7gSnKS5fKkm3jsukDTOvd6PVJ0rUWtzfrPYax13uiUnRXI3ah4Dz3UxOFh/sllH2kQPZ
 BkNj1wt1DWDgJ9G9d74nfyI9gCv854IC1ya4f8r9NagvaMX8GydErhhc4vEwph/flThx
 hIxhZ4pshwFFk9gn04dgIFYTz8jalkEMGZYcSs2jKpel7U9HiqTbvU6NJZ2Fwr/C2CY+
 JcxG13CkeuWMq6589p3zq7goizTNyPvYhvymYTsftMJGwzDHMnjPPzty0pldys50Vpin Fg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nmjfpugcd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 10 Feb 2023 03:29:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31A3TNjg020201
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 10 Feb 2023 03:29:23 GMT
Received: from hu-jackp-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 9 Feb 2023 19:29:23 -0800
Date:   Thu, 9 Feb 2023 19:29:21 -0800
From:   Jack Pham <quic_jackp@quicinc.com>
To:     Jerry Zhang <jerry@skydio.com>
CC:     <balbi@kernel.org>, <linux-usb@vger.kernel.org>,
        Alex Mallery <alex.mallery@skydio.com>,
        <quic_wcheng@quicinc.com>, <quic_ppratap@quicinc.com>
Subject: Re: dwc3 stuck in U3 state on USB3-only link
Message-ID: <20230210032921.GB31049@hu-jackp-lv.qualcomm.com>
References: <CAMKO5Cs69cN+RZNvszobqpHwNNsPFafAaSUxg63sWhSGPXcjyw@mail.gmail.com>
 <20230209081136.GA31049@hu-jackp-lv.qualcomm.com>
 <CAMKO5CvCbABxEauXiojEPLK6q8543wm2SBsLisMEZ2b_-Gkx1w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMKO5CvCbABxEauXiojEPLK6q8543wm2SBsLisMEZ2b_-Gkx1w@mail.gmail.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mFoQZQnZrw5vF78L0cCOayJSKFOcizO1
X-Proofpoint-GUID: mFoQZQnZrw5vF78L0cCOayJSKFOcizO1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-09_17,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302100029
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Jerry,

On Thu, Feb 09, 2023 at 05:41:43PM -0800, Jerry Zhang wrote:
> On Thu, Feb 9, 2023 at 12:11 AM Jack Pham <quic_jackp@quicinc.com> wrote:
> > On Wed, Feb 08, 2023 at 07:27:04PM -0800, Jerry Zhang wrote:
> > (BTW I notice from these msm-dwc3 logs you must be using a Qualcomm SoC
> > with a downstream kernel.  Though I think the issue is generic enough to
> > debug with the upstream dwc3 gadget, if it does turn out to be some
> > vendor-specific behavior then I would ask you to contact us directly for
> > more focused support.)
> Yep the issue can be reproduced with a QRB5165 devkit plugged into a
> linux desktop using a cable with USB2 snipped. dwc3-msm in our kernel
> is identical to that in
> https://git.codelinaro.org/clo/la/kernel/msm-5.4.git.

Thanks for pointing out the product & kernel.  Again the dwc3-msm is
downstream only but since we are the vendor, I can try to provide some
feedback here on list before turning you over to our usual support
channels.

> > If possible please enable dwc3 tracing events as we might be able to see
> > more info about the specific events that occur when the host reboots.
> I did this by mounting tracefs and echo 1 > events/dwc3/enable and it
> produces a trace file, however the events end the end of the trace
> looks like

> These seem to be data events from the end of the connection, and I
> don't see any events related to suspend or power state.

>           <idle>-0       [006] d.s5   140.648282: dwc3_gadget_ep_cmd:
> ep1in: cmd 'Update Transfer' [30007] params 00000000 00000000 00000000
> --> status: Successful
>           <idle>-0       [000] dnh1   140.736735: dwc3_readl: addr
> 00000000f7508d19 value 00000004
>           <idle>-0       [000] dnh1   140.736739: dwc3_readl: addr
> 00000000967e799a value 00001000
>           <idle>-0       [000] dnh1   140.736741: dwc3_writel: addr
> 00000000967e799a value 80001000
>           <idle>-0       [000] dnh1   140.736743: dwc3_writel: addr
> 00000000f7508d19 value 00000004
>   kworker/u17:10-767     [002] d..1   140.736770: dwc3_event: event
> (00030601): End-Of-Frame [U3]
              ^^^^^^^^^^^^^^^^^
Here it is.  Despite the description this is actually the Suspend event
the controller receives.  commit 6f26ebb79a84 ("usb: dwc3: gadget:
Rename EOPF event macros to Suspend") fixed the tracing log.

Again, probably due to controller having given up on superspeed, falling
back to USB2 and detecting idle condition on D+/D- lines.

> > :) there is a reason that spec compliant USB3.x implementations must
> > also provide D+/D- connectivity; not only for backwards compatibility
> > but also for these sorts of fallback scenarios.
> Understood, we knew we were getting into sketchy territory with this
> but we're actually port splitting on the host side and using that USB2
> slot for a different device, which helps us avoid the need for a hub.
> For embedded systems with a fixed topology, this strategy has a lot of
> advantages if we can get it working.

Understood.  Neat idea if it can work.

> > You'd somehow need to get the controller to go back into Rx.Detect.
> > Since you don't have a way to do USB2 reset on D+/D-, you may need to at
> > least simulate a VBUS toggle, or forcefully reset the dwc3 controller.
> >
> > With the QCOM HW there is a register that can do this.  Please refer to
> > dwc3_qcom_vbus_override_enable() in dwc3-qcom.c for the upstream
> > implementation.
> The equivalent of this is already being called in dwc3-msm.c as
> dwc3_override_vbus_status, except for missing the SW_SESSVLD_SEL flag,
> but I added that and I didn't notice any difference.

Did you toggle off, then on, or just called it only with 'true'?
Toggling off first should signal to the controller the equivalent of a
VBUS disconnect.  The thought is that it would correctly generate a
Disconnect event (please confirm in the tracing logs) and allow the
controller to return back to a nominal state, such that toggling the
VBUS override on again would allow it to start up again from Rx.Detect.

> I'm assuming dwc3-msm and dwc3-qcom are different implementations
> targeting the same device?

Yes.

> I did manage to finally find a quirk that seems promising though. I
> see in dwc-msm that resume_work is skipped if the enable_bus_suspend
> bit is not set
> 
>      case DWC3_CONTROLLER_NOTIFY_OTG_EVENT:
>          dev_err(mdwc->dev, "DWC3_CONTROLLER_NOTIFY_OTG_EVENT received\n");
>          if (dwc->enable_bus_suspend) {
>              mdwc->suspend = dwc->b_suspend;
>              queue_work(mdwc->dwc3_wq, &mdwc->resume_work);
>          }
>          break;
> 
> and indeed we don't have it set so I tried enabling
> snps,bus-suspend-enable.
<snip>
> and we get these messages when the host powers back up. I can verify
> that the timing of these changes depending on how long the host is
> held in reset, so it's definitely detecting the host here rather than
> hitting some time based event. All these events look correct though as
> it claims to be resuming, however there still isn't enumeration and
> the link state still is in U3. The last line still claims to be in the
> suspend state and this is probably what's preventing the resume from
> completing. Looking through the code it seems like it depends on the
> B_SESS_VLD  bit
> 
>      if (!test_bit(B_SESS_VLD, &mdwc->inputs)) {
>          dev_err(mdwc->dev, "BSUSP: !bsv\n");
>          mdwc->drd_state = DRD_STATE_IDLE;
>          cancel_delayed_work_sync(&mdwc->sdp_check);
>          dwc3_otg_start_peripheral(mdwc, 0);
> 
> so somehow this if statement isn't triggering. Does this seem like the
> right track?

I'm doubtful this would help much.  This enable_bus_suspend is another
downstream-only feature intended to allow the dwc3-msm to runtime
suspend during a legitmate (U3 or L2) bus suspend.  You are seeing the
additional logs for the out-of-band signal handler when the LFPS signal
is detected.  However, this assumes that the dwc3 controller itself was
correctly in a state to process the resume or wakeup event from said
signaling but I think you are still in the same boat as before --
superspeed is disabled and there is no activity on D+/D- to reset it.

I'm going to refrain from further discussing downstream-only code here
since its out of scope for the mail list, but hopefully it's also not as
relevant to your problem.  If the above suggestion (toggling VBUS
override off then on) doesn't help then please contact our customer
engineering channel so we can help you more on this specific product.

Thanks,
Jack
