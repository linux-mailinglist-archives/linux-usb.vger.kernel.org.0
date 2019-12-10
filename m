Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DDD4118A23
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2019 14:48:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727305AbfLJNsv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Dec 2019 08:48:51 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:44476 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727007AbfLJNsu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Dec 2019 08:48:50 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBADmnaC076096;
        Tue, 10 Dec 2019 07:48:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1575985729;
        bh=Q9/OagdDUbYInqHRhJeVcEGpFupRk+48siu8IHvpk+A=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=YpaEZjvM3cKQ5o6mbK/MM5toMEC6dONdbMH/ieXyiEBsbhJX2/aBZEHnKmxIMnb3E
         Ac3gJ6zxRZG5uyovs4fD9o54P4dxhtXiQCN8SQ5Rxipu97E6kNi418E/1BtBDypRMz
         SlbzWMUda4BxZ1I7YH+l6n/4K5fBSVbhSSgu/2N8=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBADmmJn093269
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 10 Dec 2019 07:48:49 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 10
 Dec 2019 07:48:48 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 10 Dec 2019 07:48:48 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBADmmBj068557;
        Tue, 10 Dec 2019 07:48:48 -0600
Date:   Tue, 10 Dec 2019 07:48:15 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     Roger Quadros <rogerq@ti.com>, <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: turn off VBUS when leaving host mode
Message-ID: <20191210134815.GC26131@uda0271908>
Mail-Followup-To: Bin Liu <b-liu@ti.com>, Felipe Balbi <balbi@kernel.org>,
        Roger Quadros <rogerq@ti.com>, linux-usb@vger.kernel.org
References: <20191113141521.1696-1-b-liu@ti.com>
 <87blt9psrd.fsf@gmail.com>
 <f12d3637-ad95-b5f5-f331-df791e85ab3a@ti.com>
 <87r21ncgy1.fsf@gmail.com>
 <20191209171522.GA26131@uda0271908>
 <875ziol7q5.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <875ziol7q5.fsf@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 10, 2019 at 01:50:58PM +0200, Felipe Balbi wrote:
> 
> Hi,
> 
> Bin Liu <b-liu@ti.com> writes:
> >> >>> VBUS should be turned off when leaving the host mode.
> >> >>> Set GCTL_PRTCAP to device mode in teardown to de-assert DRVVBUS pin to
> >> >>> turn off VBUS power.
> >> >>>
> >> >>> Fixes: 5f94adfeed97 ("usb: dwc3: core: refactor mode initialization to its own function")
> >> >>> Signed-off-by: Bin Liu <b-liu@ti.com>
> >> >>> ---
> >> >>>   drivers/usb/dwc3/core.c | 1 +
> >> >>>   1 file changed, 1 insertion(+)
> >> >>>
> >> >>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> >> >>> index 97d6ae3c4df2..76ac9cd54e64 100644
> >> >>> --- a/drivers/usb/dwc3/core.c
> >> >>> +++ b/drivers/usb/dwc3/core.c
> >> >>> @@ -1201,6 +1201,7 @@ static void dwc3_core_exit_mode(struct dwc3 *dwc)
> >> >>>   		break;
> >> >>>   	case USB_DR_MODE_HOST:
> >> >>>   		dwc3_host_exit(dwc);
> >> >>> +		dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_DEVICE);
> >> >> 
> >> >> seems like this should be done as part of dwc3_host_exit()
> >> >> 
> >> >
> >> > That wouldn't work well with OTG case as dwc3_host_exit(dwc) is
> >> > called when switching roles and we don't want PRTCAP
> >> > to change from DWC3_GCTL_PRTCAP_OTG.
> >> 
> >> if (port != OTG)
> >>   set_prtcap(DEVICE)
> >
> > During init, the PRTCAP is set in dwc3_core_init_mode() besides
> > dwc3_{host,gadget,drd}_init(). So for tearing down setting it in
> > dwc3_core_exit_mode() would make the code logic symmetric and easy to
> > understand.
> 
> Fair enough, makes sense.
> 
> > Also it turns out that setting PRTCAP is required for OTG mode too to
> 
> But, then, how do we go back to OTG?

This new setting (PRTCAP = DEVICE) is in dwc3_core_exit_mode() which is
called in platform driver .remove(). So PRTCAP will be set to OTG for
dr_mode = 'otg' in dwc3_core_init_mode() at the next time in the
platform driver .probe().

> 
> > de-assert DRVVBUS. If left GCTL[PRTCAP] to OTG, grounding the ID pin
> > would make the controller to assert DRVVBUS without any software
> > involved. So the fix should be the following. Please let me know you
> > comments.
> 
> But that's expected, no? If port is OTG, then it must obey ID pin rules
> specified by OTG. IIRC, dwc3 is OTG 2.x compliant, at least the version
> TI uses.

It is expected when the usb drivers are bind to the controller. I am
trying to solve the issue that DRVVBUS is still asserted on both host
port and otg port with ID pin grounded when the drivers are unbind from
the controller (after modprobe -r dwc3-omap, DRVVBUS should be
de-asserted).

-Bin.
