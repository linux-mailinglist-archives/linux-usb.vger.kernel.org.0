Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2991637A148
	for <lists+linux-usb@lfdr.de>; Tue, 11 May 2021 09:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbhEKIAd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 May 2021 04:00:33 -0400
Received: from mga17.intel.com ([192.55.52.151]:30623 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229995AbhEKIAd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 11 May 2021 04:00:33 -0400
IronPort-SDR: IuDvNN09AMqEtziFsK/u7fnVtLzGZJGcWZC4YwE8u/E116Nmm3bOexApdVeRS1wJc624jlJKs8
 wdJOPJst8yrg==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="179646030"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; 
   d="scan'208";a="179646030"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2021 00:59:14 -0700
IronPort-SDR: UmzJCLRPSyWtFn3HP87ws6XNskkRfiRO+W06UlW364LNgduZCoyF1G3tTJX4ULfDeeCH7EDeXn
 HgOdoLwJ0K1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; 
   d="scan'208";a="536884378"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 11 May 2021 00:59:11 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 11 May 2021 10:59:10 +0300
Date:   Tue, 11 May 2021 10:59:10 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Jun Li <jun.li@nxp.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "thunder.leizhen@huawei.com" <thunder.leizhen@huawei.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: imx8mp: detect dwc3 core node via compatible
 string
Message-ID: <YJo5Tl7SDuv4Yu6D@kuha.fi.intel.com>
References: <1619765836-20387-1-git-send-email-jun.li@nxp.com>
 <8735v8ji31.fsf@kernel.org>
 <VI1PR04MB5935F1D26E1F281B7273993F895E9@VI1PR04MB5935.eurprd04.prod.outlook.com>
 <87r1ishz2t.fsf@kernel.org>
 <VI1PR04MB5935825AD977B4180894541589589@VI1PR04MB5935.eurprd04.prod.outlook.com>
 <87h7jggch0.fsf@kernel.org>
 <VI1PR04MB59354B7D5843B612D50937B589579@VI1PR04MB5935.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI1PR04MB59354B7D5843B612D50937B589579@VI1PR04MB5935.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi guys,

On Fri, May 07, 2021 at 07:31:43AM +0000, Jun Li wrote:
> Hi
> 
> > -----Original Message-----
> > From: Felipe Balbi <balbi@kernel.org>
> > Sent: Thursday, May 6, 2021 10:32 PM
> > To: Jun Li <jun.li@nxp.com>; gregkh@linuxfoundation.org
> > Cc: shawnguo@kernel.org; dl-linux-imx <linux-imx@nxp.com>;
> > thunder.leizhen@huawei.com; linux-usb@vger.kernel.org
> > Subject: RE: [PATCH] usb: dwc3: imx8mp: detect dwc3 core node via compatible
> > string
> > 
> > 
> > Hi,
> > 
> > Jun Li <jun.li@nxp.com> writes:
> > >> > 	val = readl(dwc3_imx->glue_base + USB_WAKEUP_CTRL);
> > >> >
> > >> > 	if ((dwc3->current_dr_role == DWC3_GCTL_PRTCAP_HOST) && dwc3->xhci)
> > >> > 		val |= USB_WAKEUP_EN | USB_WAKEUP_SS_CONN |
> > >> > 		       USB_WAKEUP_U3_EN | USB_WAKEUP_DPDM_EN;
> > >> > 	else if (dwc3->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE)
> > >> > 		val |= USB_WAKEUP_EN | USB_WAKEUP_VBUS_EN |
> > >> > 		       USB_WAKEUP_VBUS_SRC_SESS_VAL;
> > >>
> > >> for this, you could register a listener to the extcon notifier and
> > >> update these bits accordingly. With that, you would already *know*
> > >> that
> > >> dwc3 is probed.
> > >
> > > With usb role switch class, there no extcon provider, so I think this
> > > way can't work for me.
> > 
> > perhaps role switch class could learn about notifiers ;-)
> > 
> > >> > static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx) {
> > >> > 	struct dwc3_imx8mp	*dwc3_imx = _dwc3_imx;
> > >> > 	struct dwc3		*dwc = platform_get_drvdata(dwc3_imx->dwc3);
> > >> >
> > >> > 	if (!dwc3_imx->pm_suspended)
> > >> > 		return IRQ_HANDLED;
> > >> >
> > >> > 	disable_irq_nosync(dwc3_imx->irq);
> > >> > 	dwc3_imx->wakeup_pending = true;
> > >> >
> > >> > 	if ((dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST) && dwc->xhci)
> > >> > 		pm_runtime_resume(&dwc->xhci->dev);
> > >> > 	else if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE)
> > >> > 		pm_runtime_get(dwc->dev);
> > >> >
> > >> > 	return IRQ_HANDLED;
> > >> > }
> > >>
> > >> for this, maybe you need to teach dwc3 core about wakeup irqs
> > >> instead. Have a look dev_pm_set_dedicated_wake_irq().
> > >
> > > Good suggestion, but if extcon notifier listener can't work for me, my
> > > understanding is this *teach* in glue layer driver still need access
> > > dwc3 core instance struct, right?
> > 
> > for now, maybe. But it may be better to implement a notifier method in role
> > switch class.
> 
> I am not sure if introduce notifier in role switch class is a good idea,
> I had the impression extcon is not encouraged to use if possible.

I'm not against role switch notifiers. They were proposed before
already couple of years ago, but at that time there just were no users
them notifier, so the patch was just dropped from the series [1].
But I don't think anybody was against the idea. Please feel free to
add them to the class if you have use for them.

Or, are we talking about some other notifier here?

[1] https://lore.kernel.org/linux-usb/20191002231617.3670-3-john.stultz@linaro.org/


thanks,

-- 
heikki
