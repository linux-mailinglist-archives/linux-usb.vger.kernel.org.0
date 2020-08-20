Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B88924BD8B
	for <lists+linux-usb@lfdr.de>; Thu, 20 Aug 2020 15:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729489AbgHTNHp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Aug 2020 09:07:45 -0400
Received: from mga09.intel.com ([134.134.136.24]:25018 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730360AbgHTNHm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 Aug 2020 09:07:42 -0400
IronPort-SDR: ycAS5br71QCKfLgMFA/Cx9JDENqbHKOCN7jd9c5agpNRshh7Qtmac3c/srZnfViN0ZwnAwAcf3
 3EXMiGnXNXbQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9718"; a="156356085"
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; 
   d="scan'208";a="156356085"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2020 06:07:40 -0700
IronPort-SDR: a9wp5Dp3Qn7U36oQAwJlRK3h37ZzGB8vBF3yVklXrmgIumab/lnyRiNQ2xE0Ak1/B7BCoWakBk
 qHs+hfHtLaWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; 
   d="scan'208";a="401153251"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 20 Aug 2020 06:07:37 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 20 Aug 2020 16:07:37 +0300
Date:   Thu, 20 Aug 2020 16:07:37 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Raymond Tan <raymond.tan@intel.com>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] usb: dwc3: pci: Allow Elkhart Lake to utilize DSM
 method for PM functionality
Message-ID: <20200820130737.GA3362430@kuha.fi.intel.com>
References: <1596478284-69661-1-git-send-email-raymond.tan@intel.com>
 <1596478284-69661-3-git-send-email-raymond.tan@intel.com>
 <87a6ytzaex.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a6ytzaex.fsf@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 17, 2020 at 04:09:26PM +0300, Felipe Balbi wrote:
> Raymond Tan <raymond.tan@intel.com> writes:
> 
> > Similar to some other IA platforms, Elkhart Lake too depends on the PMU
> > register write to request transition of Dx power state.
> >
> > Thus, we add the PCI_DEVICE_ID_INTEL_EHL to the list of devices that shall
> > execute the ACPI _DSM method during D0/D3 sequence.
> >
> > Signed-off-by: Raymond Tan <raymond.tan@intel.com>
> > ---
> >  drivers/usb/dwc3/dwc3-pci.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
> > index 4f436b3..4d50187 100644
> > --- a/drivers/usb/dwc3/dwc3-pci.c
> > +++ b/drivers/usb/dwc3/dwc3-pci.c
> > @@ -149,7 +149,8 @@ static int dwc3_pci_quirks(struct dwc3_pci *dwc)
> >  
> >  	if (pdev->vendor == PCI_VENDOR_ID_INTEL) {
> >  		if (pdev->device == PCI_DEVICE_ID_INTEL_BXT ||
> > -				pdev->device == PCI_DEVICE_ID_INTEL_BXT_M) {
> > +		    pdev->device == PCI_DEVICE_ID_INTEL_BXT_M ||
> > +		    pdev->device == PCI_DEVICE_ID_INTEL_EHL) {
> 
> this looks like a bug fix which could be added during -rc cycle. As
> such, it should be patch 1 in this series. Renaming the macro is less
> critical. Can you update your series so I can take patch 1 during -rc
> and patch 2 for next merge window? Please, don't forget to add the
> Fixes: tag ;-)

Raymond, I'll take care of this patch (and the other one too). I have
now some changes that need to be made on top of this patch, and I
don't want to wait with them anymore, so I'll include these in my
series.


thanks,

-- 
heikki
