Return-Path: <linux-usb+bounces-90-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA6E7A0FFE
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 23:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79A4B28244D
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 21:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15571273C0;
	Thu, 14 Sep 2023 21:44:08 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367BE208D4
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 21:44:05 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56755270A;
	Thu, 14 Sep 2023 14:44:05 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B570DE5;
	Thu, 14 Sep 2023 23:42:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1694727750;
	bh=Ls6Iqpj4d+iGrGYu3xYKdLqh+5iuBjo1ZErfbO+0uUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vrlss3I858TYlhOLMdeM85lhnvtnyVS7sPPwsOqa+Kb8N/JxxiCff0loPMEIDgw62
	 1nM6YuwsRts4UkZ0MZkjY9DqerhRGs9JvBtp8J29XNHGIc7EiIjUD3PuM5c33b6E9m
	 R1gnv8htcFXotv/S0J6hCiF2TNumyyDdc7wZeUsw=
Date: Fri, 15 Sep 2023 00:44:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 0/3] drm: simplify support for transparent DRM bridges
Message-ID: <20230914214416.GB11890@pendragon.ideasonboard.com>
References: <20230817145516.5924-1-dmitry.baryshkov@linaro.org>
 <20230822141735.GA14396@pendragon.ideasonboard.com>
 <CAA8EJpp_FYOKHziHOWF6E1RTkHEJ8oXXH90EDmJbLG1UDO1ofA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAA8EJpp_FYOKHziHOWF6E1RTkHEJ8oXXH90EDmJbLG1UDO1ofA@mail.gmail.com>

Hi Dmitry,

On Mon, Sep 04, 2023 at 12:02:18AM +0300, Dmitry Baryshkov wrote:
> On Tue, 22 Aug 2023 at 17:17, Laurent Pinchart wrote:
> > On Thu, Aug 17, 2023 at 05:55:13PM +0300, Dmitry Baryshkov wrote:
> > > Supporting DP/USB-C can result in a chain of several transparent
> > > bridges (PHY, redrivers, mux, etc). This results in drivers having
> > > similar boilerplate code for such bridges.
> >
> > What do you mean by transparent bridge here ? Bridges are a DRM concept,
> > and as far as I can tell, a PHY isn't a bridge. Why does it need to be
> > handled as one, especially if it's completely transparent ?
> >
> > > Next, these drivers are susceptible to -EPROBE_DEFER loops: the next
> > > bridge can either be probed from the bridge->attach callback, when it is
> > > too late to return -EPROBE_DEFER, or from the probe() callback, when the
> > > next bridge might not yet be available, because it depends on the
> > > resources provided by the probing device.
> >
> > Can't device links help avoiding defer probing in those cases ?
> 
> It looks like both Neil and I missed this question.

And I missed this reply before replying to Neil and pointing to device
links again :-)

> Two items wrt devlinks. First, I view them as a helper. So if one
> disables the devlinks enforcement, he'd still get a deferral loop.

That may be true, but I don't think that's a compelling argument. If one
disables components meant to avoid probe deferral, they should expect
probe deferral :-)

> Second, in this case we can not enforce devlinks (or return
> -EPROBE_DEFER from the probe() function) because the next bridge is
> not yet available when the main driver probes. Unfortunately bridges
> are allocated in the opposite order. So, using AUX devices helps us to
> break it. Because first typec mux/retimer/switch/etc devices probe (in
> the direction from the typec source to the typec port). Then DRM
> bridge devices are probed starting from the end of the chain
> (connector) to the DP source (root DP bridge/controller).

I'm not too familiar with the drivers involved in the typec chain. Do
you mean that the sink driver needs to get hold of the source device at
probe time, deferring probe if the source is not available ? Does the
driver handler the USB connector need to do the same ? I'm looking at
the qcom_pmic_typec driver and I don't immediately see where it would
defer probing if its source isn't available, but I may well be missing
something.

> > > Last, but not least, this results in the the internal knowledge of DRM
> > > subsystem slowly diffusing into other subsystems, like PHY or USB/TYPEC.
> >
> > Why so ? The PHY subsystem should provide a PHY, without considering
> > what subsystem it will be used by. This patch series seems to me to
> > actually create this DRM dependency in other subsystems, which I don't
> > think is a very good idea. Resources should be registered in their own
> > subsystem with the appropriate API, not in a way that is tied to a
> > particular consumer.
> >
> > > To solve all these issues, define a separate DRM helper, which creates
> > > separate aux device just for the bridge. During probe such aux device
> > > doesn't result in the EPROBE_DEFER loops. Instead it allows the device
> > > drivers to probe properly, according to the actual resource
> > > dependencies. The bridge auxdevs are then probed when the next bridge
> > > becomes available, sparing drivers from drm_bridge_attach() returning
> > > -EPROBE_DEFER.
> >
> > I'm not thrilled :-( Let's discuss the questions above first.
> 
> Laurent, please excuse me for the ping. Any further response from your side?
> I'd like to send the next iteration of this patchset.
> 
> > > Proposed merge strategy: immutable branch with the drm commit, which is
> > > then merged into PHY and USB subsystems together with the corresponding
> > > patch.

-- 
Regards,

Laurent Pinchart

