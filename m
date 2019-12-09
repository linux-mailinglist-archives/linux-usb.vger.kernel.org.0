Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2629B117296
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2019 18:15:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbfLIRP5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Dec 2019 12:15:57 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53536 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbfLIRP5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Dec 2019 12:15:57 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB9HFscA105484;
        Mon, 9 Dec 2019 11:15:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1575911754;
        bh=B2EM5qdVTztuJ+UR7js2tErJpeKKCpmU7oTmwJi/d/k=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=Q+kmJI9QZ0IrNyUOFF0qekg3HFL16g2W/4Vfzlrh6r2udyO01ETX8v+NcrB/udviL
         3Mcu9FfSJmhUAJC9LcgtLO0UTzonI6WoC5wlezBhhUDSDmjyGKChn35bK4x8bKSugb
         f4o+vwZRRqlyPNcrYbh7nsuSTt2/xVClzv/IDxjU=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB9HFsuq043397
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 9 Dec 2019 11:15:54 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 9 Dec
 2019 11:15:54 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 9 Dec 2019 11:15:54 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB9HFsnx102714;
        Mon, 9 Dec 2019 11:15:54 -0600
Date:   Mon, 9 Dec 2019 11:15:22 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     Roger Quadros <rogerq@ti.com>, <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: turn off VBUS when leaving host mode
Message-ID: <20191209171522.GA26131@uda0271908>
Mail-Followup-To: Bin Liu <b-liu@ti.com>, Felipe Balbi <balbi@kernel.org>,
        Roger Quadros <rogerq@ti.com>, linux-usb@vger.kernel.org
References: <20191113141521.1696-1-b-liu@ti.com>
 <87blt9psrd.fsf@gmail.com>
 <f12d3637-ad95-b5f5-f331-df791e85ab3a@ti.com>
 <87r21ncgy1.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87r21ncgy1.fsf@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Felipe,

On Mon, Dec 02, 2019 at 09:41:42AM +0200, Felipe Balbi wrote:
> 
> Hi,
> 
> Roger Quadros <rogerq@ti.com> writes:
> > On 18/11/2019 09:07, Felipe Balbi wrote:
> >> Hi,
> >> 
> >> Bin Liu <b-liu@ti.com> writes:
> >> 
> >>> VBUS should be turned off when leaving the host mode.
> >>> Set GCTL_PRTCAP to device mode in teardown to de-assert DRVVBUS pin to
> >>> turn off VBUS power.
> >>>
> >>> Fixes: 5f94adfeed97 ("usb: dwc3: core: refactor mode initialization to its own function")
> >>> Signed-off-by: Bin Liu <b-liu@ti.com>
> >>> ---
> >>>   drivers/usb/dwc3/core.c | 1 +
> >>>   1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> >>> index 97d6ae3c4df2..76ac9cd54e64 100644
> >>> --- a/drivers/usb/dwc3/core.c
> >>> +++ b/drivers/usb/dwc3/core.c
> >>> @@ -1201,6 +1201,7 @@ static void dwc3_core_exit_mode(struct dwc3 *dwc)
> >>>   		break;
> >>>   	case USB_DR_MODE_HOST:
> >>>   		dwc3_host_exit(dwc);
> >>> +		dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_DEVICE);
> >> 
> >> seems like this should be done as part of dwc3_host_exit()
> >> 
> >
> > That wouldn't work well with OTG case as dwc3_host_exit(dwc) is
> > called when switching roles and we don't want PRTCAP
> > to change from DWC3_GCTL_PRTCAP_OTG.
> 
> if (port != OTG)
>   set_prtcap(DEVICE)

During init, the PRTCAP is set in dwc3_core_init_mode() besides
dwc3_{host,gadget,drd}_init(). So for tearing down setting it in
dwc3_core_exit_mode() would make the code logic symmetric and easy to
understand.

Also it turns out that setting PRTCAP is required for OTG mode too to
de-assert DRVVBUS. If left GCTL[PRTCAP] to OTG, grounding the ID pin
would make the controller to assert DRVVBUS without any software
involved. So the fix should be the following. Please let me know you
comments.

-Bin.

-----------8<------------
diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 97d6ae3c4df2..cede7a8e3605 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1209,6 +1209,9 @@ static void dwc3_core_exit_mode(struct dwc3 *dwc)
                /* do nothing */
                break;
        }
+
+       /* de-assert DRVVBUS for HOST and OTG mode */
+       dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_DEVICE);
 }

 static void dwc3_get_properties(struct dwc3 *dwc)

> 
> -- 
> balbi


