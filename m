Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD7A54DDF5
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jun 2022 11:11:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376598AbiFPJLZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jun 2022 05:11:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358507AbiFPJLY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jun 2022 05:11:24 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AC725537E;
        Thu, 16 Jun 2022 02:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1655370682; x=1686906682;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=RAIhqL2xeDknD95cNLZqPbz62ihnEMqznkDfqUykBmo=;
  b=nXxCyTE8/3lbaqdCmB8/BhVuvZNTnA1d533K8fHP60oPPKEvW2cxm5lj
   JrQnA99JFBXzrISSCVj362kN+qGXVqnIC/x2pOZTfQWlKTlOwaTgShHKx
   tskdjFerqty+Ue94ivZsBW/VAuiLzcdH7DNyGGbwHMUzJ9H5QI6BRcgGT
   4=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 16 Jun 2022 02:11:21 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 02:11:21 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 16 Jun 2022 02:11:21 -0700
Received: from hu-pkondeti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 16 Jun 2022 02:11:14 -0700
Date:   Thu, 16 Jun 2022 14:41:10 +0530
From:   Pavan Kondeti <quic_pkondeti@quicinc.com>
To:     Matthias Kaehlcke <mka@chromium.org>
CC:     Krishna Kurapati <quic_kriskura@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Andy Gross" <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-pm@vger.kernel.org>, <quic_pkondeti@quicinc.com>,
        <quic_ppratap@quicinc.com>, <quic_vpulyala@quicinc.com>
Subject: Re: [PATCH v20 2/5] usb: dwc3: core: Host wake up support from
 system suspend
Message-ID: <20220616091110.GA24114@hu-pkondeti-hyd.qualcomm.com>
References: <1654158277-12921-1-git-send-email-quic_kriskura@quicinc.com>
 <1654158277-12921-3-git-send-email-quic_kriskura@quicinc.com>
 <YpkRDi2m7cLaKYEf@google.com>
 <Yp5nf2w8uVZ38/XZ@google.com>
 <Yqd9IHQEj3Ex+FcF@google.com>
 <YqjLHyUVEjf7I3MI@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YqjLHyUVEjf7I3MI@google.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Matthias/Krishna,

On Tue, Jun 14, 2022 at 10:53:35AM -0700, Matthias Kaehlcke wrote:
> On Mon, Jun 13, 2022 at 11:08:32AM -0700, Matthias Kaehlcke wrote:
> > On Mon, Jun 06, 2022 at 01:45:51PM -0700, Matthias Kaehlcke wrote:
> > > On Thu, Jun 02, 2022 at 12:35:42PM -0700, Matthias Kaehlcke wrote:
> > > > Hi Krishna,
> > > > 
> > > > with this version I see xHCI errors on my SC7180 based system, like
> > > > these:
> > > > 
> > > > [   65.352605] xhci-hcd xhci-hcd.13.auto: xHC error in resume, USBSTS 0x401, Reinit
> > > > 
> > > > [  101.307155] xhci-hcd xhci-hcd.13.auto: WARN: xHC CMD_RUN timeout
> > > > 
> > > > After resume a downstream hub isn't enumerated again.
> > > > 
> > > > So far I didn't see those with v13, but I aso saw the first error with
> > > > v16.
> > > 
> > > It also happens with v13, but only when a wakeup capable vUSB <= 2
> > > device is plugged in. Initially I used a wakeup capable USB3 to
> > > Ethernet adapter to trigger the wakeup case, however older versions
> > > of this series that use usb_wakeup_enabled_descendants() to check
> > > for wakeup capable devices didn't actually check for vUSB > 2
> > > devices.
> > > 
> > > So the case were the controller/PHYs is powered down works, but
> > > the controller is unhappy when the runtime PM path is used during
> > > system suspend.
> > 
> > The issue isn't seen on all systems using dwc3-qcom and the problem starts
> > during probe(). The expected probe sequence is something like this:
> > 
> > dwc3_qcom_probe
> >   dwc3_qcom_of_register_core
> >     dwc3_probe
> > 
> >   if (device_can_wakeup(&qcom->dwc3->dev))
> >     ...
> > 
> > The important part is that device_can_wakeup() is called after dwc3_probe()
> > has completed. That's what I see on a QC SC7280 system, where wakeup is
> > generally working with these patches.
> > 
> > However on a QC SC7180 system dwc3_probe() is deferred and only executed after
> > dwc3_qcom_probe(). As a result the device_can_wakeup() call returns false.
> > With that the controller/driver ends up in an unhappy state after system
> > suspend.
> > 
> > Probing is deferred on SC7180 because device_links_check_suppliers() finds
> > that '88e3000.phy' isn't ready yet.
> 
> It seems device links could be used to make sure the dwc3 core is present:
> 
>   Another example for an inconsistent state would be a device link that
>   represents a driver presence dependency, yet is added from the consumer’s
>   ->probe callback while the supplier hasn’t probed yet: Had the driver core
>   known about the device link earlier, it wouldn’t have probed the consumer
>   in the first place. The onus is thus on the consumer to check presence of
>   the supplier after adding the link, and defer probing on non-presence.
> 
>   https://www.kernel.org/doc/html/v5.18/driver-api/device_link.html#usage
> 
> 
> You could add something like this to dwc3_qcom_of_register_core():
> 
> 
>   device_link_add(dev, &qcom->dwc3->dev,
>   		  DL_FLAG_AUTOREMOVE_CONSUMER | DL_FLAG_AUTOPROBE_CONSUMER);
> 
>   if (qcom->dwc3->dev.links.status != DL_DEV_DRIVER_BOUND)
>       ret = -EPROBE_DEFER;
> 
> 
I am not very sure how the device_link_add() API works. we are the parent and
creating a depdency on child probe. That does not sound correct to me. Any
ways, I have another question.

When dwc3_qcom_of_register_core() returns error back to dwc3_qcom_probe(), we
goto depopulate label which calls of_platform_depopulate() which destroy the
child devices that are populated. how does that ensure that child probe is
completed by the time, our probe is called again. The child device it self is
gone. Is this working because when our probe is called next time, the child
probe depenencies are resolved?

Thanks,
Pavan
