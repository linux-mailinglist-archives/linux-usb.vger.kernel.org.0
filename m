Return-Path: <linux-usb+bounces-92-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4AF7A109A
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 00:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C71301C210C9
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 22:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22DE0273D4;
	Thu, 14 Sep 2023 22:10:39 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A1126E24
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 22:10:36 +0000 (UTC)
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8BEB1FE5
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 15:10:35 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-d7225259f52so1502810276.0
        for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 15:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694729435; x=1695334235; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ydz4VNWHxl7vquKRgl2cF7wVYd1wnbI72/KihA7USaQ=;
        b=RnsOATJWMEfBx0+rCA7ysgGavV7tWEgGoqtTunxJyGd4bPOFh8GUKnZVtRg4YiY434
         2yGKDXhut9OXG5vScAnBNkaA1FjF1/vG0UwCKylp5Vfi79pBq3qnPqDcq4zzk49X6VtM
         fkrgUNJ36yPJoVWaorE1pjGNXuQ3x2F/fSni/AJjPrLYmA9F7i+z4rgblP/uwaPtVKC2
         2ZFlKkN9gFUwO6JOl74yNB85lHlo/5Oc9CAJdZLqFnqBkZDk56HlFaSypZZXU7chQ/iC
         xbV29mup82kL+nnE5Tz84hDUV782wOi7e4G+gsWl8c8dPp/wNKZAx3mV+Hok8M0P2IGY
         69hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694729435; x=1695334235;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ydz4VNWHxl7vquKRgl2cF7wVYd1wnbI72/KihA7USaQ=;
        b=TP2Y0c4+2VftixYOwOFTIJMOrdWwLsn0KYYxKSc0EdxEmLh0KHAW4tH7vLaIERrnZU
         STSqRZsy5ByxzoOE/1DeouWusbTXsoCf58X1zzl4qlJ+KY+quaY6pMkaBWARr4k23BU8
         EmWY6trJZ+VyOWbiLD4zNHbpigqOerpufbGl/zoWFbIkIkJvuRDpJV+iFeiHoISg/sHp
         t+MM2NCGB1dxbBDhvvu/PuXDnKWBOhKjkjQgkRQn+4EqXSiXdNjTZbc169bju5H71PTg
         IJ2GwMgMgh7hmXeEn7zYFky343/PPoFyhp+LF+u5SxqK1FEPmkvwd76/xXIi9CGK0FNt
         KKCA==
X-Gm-Message-State: AOJu0Yw/Fecb8gu6asKLAnIty6pycn8cRv50nxnaDc2woxB9bDfLc6Rw
	rZ0saPbkBozpwh6+v8b72xc1C09Cnca6YXhdo+aF0Q==
X-Google-Smtp-Source: AGHT+IGXs3YdLZIpSHR4XnGKwzk3ARY+nqGST2uf+bqwIFUcO/ZO1Nfc2mvXSXIJT9v00dyqaQJIj4SjhBurj1bltNY=
X-Received: by 2002:a5b:84f:0:b0:d77:c0b9:b182 with SMTP id
 v15-20020a5b084f000000b00d77c0b9b182mr6188622ybq.46.1694729434741; Thu, 14
 Sep 2023 15:10:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230817145516.5924-1-dmitry.baryshkov@linaro.org>
 <20230822141735.GA14396@pendragon.ideasonboard.com> <20230822141918.GB14396@pendragon.ideasonboard.com>
 <c266b761-ddd3-4b29-aeb7-fc40348f0662@linaro.org> <20230914212339.GA11890@pendragon.ideasonboard.com>
In-Reply-To: <20230914212339.GA11890@pendragon.ideasonboard.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 15 Sep 2023 01:10:23 +0300
Message-ID: <CAA8EJpqzGimMmD=jbGQVsuJTfgoCjUf3HV0JGCFimaS73Qq6VQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] drm: simplify support for transparent DRM bridges
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-usb@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 Sept 2023 at 00:23, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Neil,
>
> Sorry about the delay, the series got burried in my inbox.
>
> On Tue, Aug 22, 2023 at 04:27:37PM +0200, Neil Armstrong wrote:
> > On 22/08/2023 16:19, Laurent Pinchart wrote:
> > > On Tue, Aug 22, 2023 at 05:17:37PM +0300, Laurent Pinchart wrote:
> > >> On Thu, Aug 17, 2023 at 05:55:13PM +0300, Dmitry Baryshkov wrote:
> > >>> Supporting DP/USB-C can result in a chain of several transparent
> > >>> bridges (PHY, redrivers, mux, etc). This results in drivers having
> > >>> similar boilerplate code for such bridges.
> > >>
> > >> What do you mean by transparent bridge here ? Bridges are a DRM concept,
> > >> and as far as I can tell, a PHY isn't a bridge. Why does it need to be
> > >> handled as one, especially if it's completely transparent ?
> > >>
> > >>> Next, these drivers are susceptible to -EPROBE_DEFER loops: the next
> > >>> bridge can either be probed from the bridge->attach callback, when it is
> > >>> too late to return -EPROBE_DEFER, or from the probe() callback, when the
> > >>> next bridge might not yet be available, because it depends on the
> > >>> resources provided by the probing device.
> > >>
> > >> Can't device links help avoiding defer probing in those cases ?
> > >>
> > >>> Last, but not least, this results in the the internal knowledge of DRM
> > >>> subsystem slowly diffusing into other subsystems, like PHY or USB/TYPEC.
> > >>
> > >> Why so ? The PHY subsystem should provide a PHY, without considering
> > >> what subsystem it will be used by. This patch series seems to me to
> > >> actually create this DRM dependency in other subsystems,
> > >
> > > I was wrong on this one, there are indeed existing drm_bridge instances
> > > in drivers/usb/ and drivers/phy/. That's certainly not nice. Why do we
> > > even need drm_bridge there, why can't the PHYs be acquired by their
> > > consumers in DRM (and anywhere else) using the PHY API ?
> >
> > Because with USB-C Altmode/USB4/Thunderbolt, DisplayPort is one of the
> > data streams handled by PHYs, USB-C PD manager, re-timers, SBU muxes...
> > and all this must be coordinated with the display controller and can
> > be considered as bridges between the DP controller and the USB-C connector.
> >
> > As of today, it has been handled by OOB events on Intel & AMD, but the entirety
> > of USB-C chain is handled in firmare, so this scales.
> > When we need to describe the entire USB-C data stream chain as port/endpoint
> > in DT, OOB handling doesn't work anymore since we need to sync the entire
> > USB-C chain (muxes, switches, retimers, phys...) handled by Linux before
> > starting the DP stream.
>
> No disagreement here. Handling the component as part of the bridges
> chain certainly helps. Ideally, this should be done without spreading
> usage of drm_bridge outside of the DRM subsystem. For instance, we
> handle (some) D-PHYs in DRM and V4L2 by exposing them as PHYs, and
> acquiring them in DSI or CSI-2 controller drivers.

This is true. We tried doing that. This quickly results in DT not
describing the actual hardware.
Consider the SS lanes of the USB-C controller. They should go to some
kind of mux that switches them between DP and USB-SS controllers. In
our case such a mux is the USB+DP PHY. So it becomes used both via tha
phys = <> property and via the OF graph. And as we do not want to
circumvent the drm_bridge OF-related code, this OF graph link results
in an extra drm_bridge being created on the path to the final
drm_bridge in TCPM, which actually implements HPD ops.

> Do I understand correctly that, in this case, the video stream is fully
> handled by the PHY (& related) component, without any other device (in
> the OF sense) wrapping the PHY like the DSI and CSI-2 controllers do ?
> If so that would indeed make it difficult to create the drm_bridge in a
> DRM driver that would acquire the PHY. We could come up with a different
> mechanism, but that's likely overkill to solve this particular issue (at
> least until other similar use cases create a critical mass that will
> call for a major refactoring).
>
> In this specific case, however, I'm a bit puzzled. What coordination is
> required between the PHYs and the display controller ? The two drivers
> modified in patches 2/3 and 3/3 indeed create bridges, but those bridges
> don't implement any operation other than attach. Is this needed only
> because the PHY has an OF node that sits between the display controller
> and the connector, requiring a drm_bridge to exist to bridge the gap and
> create a complete chain of bridges up to the connector ? This would
> simplify the use case, but probably still call for creating a
> drm_bridge in the PHY driver, as other solutions are likely still too
> complex.

Yes, these bridges just fill gaps in the bridge chain. HPD events are
generated in the TCPM / altmode driver, so there should be a bridge
there.

>
> It seems to me that this series tries to address two issues. One of them
> is minimizing the DRM-specific amount of code needed in the PHY drivers.
> The second one is to avoid probe deferrals. For the first issue, I agree
> that a helper is currently a good option. For the second issue, however,
> couldn't device links help avoiding probe deferral ? If so, the helper
> could be simplified, avoiding the need to create an auxiliary device.

This is largely discussed in the other subthread.

>
> > >> which I don't
> > >> think is a very good idea. Resources should be registered in their own
> > >> subsystem with the appropriate API, not in a way that is tied to a
> > >> particular consumer.
> > >>
> > >>> To solve all these issues, define a separate DRM helper, which creates
> > >>> separate aux device just for the bridge. During probe such aux device
> > >>> doesn't result in the EPROBE_DEFER loops. Instead it allows the device
> > >>> drivers to probe properly, according to the actual resource
> > >>> dependencies. The bridge auxdevs are then probed when the next bridge
> > >>> becomes available, sparing drivers from drm_bridge_attach() returning
> > >>> -EPROBE_DEFER.
> > >>
> > >> I'm not thrilled :-( Let's discuss the questions above first.
> > >>
> > >>> Proposed merge strategy: immutable branch with the drm commit, which is
> > >>> then merged into PHY and USB subsystems together with the corresponding
> > >>> patch.
> > >>>
> > >>> Changes since v3:
> > >>>   - Moved bridge driver to gpu/drm/bridge (Neil Armstrong)
> > >>>   - Renamed it to aux-bridge (since there is already a simple_bridge driver)
> > >>>   - Made CONFIG_OF mandatory for this driver (Neil Armstrong)
> > >>>   - Added missing kfree and ida_free (Dan Carpenter)
> > >>>
> > >>> Changes since v2:
> > >>>   - ifdef'ed bridge->of_node access (LKP)
> > >>>
> > >>> Changes since v1:
> > >>>   - Added EXPORT_SYMBOL_GPL / MODULE_LICENSE / etc. to drm_simple_bridge
> > >>>
> > >>> Dmitry Baryshkov (3):
> > >>>    drm/bridge: add transparent bridge helper
> > >>>    phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE
> > >>>    usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE
> > >>>
> > >>>   drivers/gpu/drm/bridge/Kconfig            |   9 ++
> > >>>   drivers/gpu/drm/bridge/Makefile           |   1 +
> > >>>   drivers/gpu/drm/bridge/aux-bridge.c       | 132 ++++++++++++++++++++++
> > >>>   drivers/phy/qualcomm/Kconfig              |   2 +-
> > >>>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c |  44 +-------
> > >>>   drivers/usb/typec/mux/Kconfig             |   2 +-
> > >>>   drivers/usb/typec/mux/nb7vpq904m.c        |  44 +-------
> > >>>   include/drm/bridge/aux-bridge.h           |  19 ++++
> > >>>   8 files changed, 167 insertions(+), 86 deletions(-)
> > >>>   create mode 100644 drivers/gpu/drm/bridge/aux-bridge.c
> > >>>   create mode 100644 include/drm/bridge/aux-bridge.h
>
> --
> Regards,
>
> Laurent Pinchart



-- 
With best wishes
Dmitry

