Return-Path: <linux-usb+bounces-2346-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 986B07DB66B
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 10:48:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 965D11C209BA
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 09:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53463DF5E;
	Mon, 30 Oct 2023 09:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RdAbLCTD"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FCBDDD2
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 09:47:47 +0000 (UTC)
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6713EC4
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 02:47:45 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-5a7e5dc8573so37867147b3.0
        for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 02:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698659264; x=1699264064; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VNqVOafoli2UlL22BBZlG8If4F8EihISHX/NTqTcwEU=;
        b=RdAbLCTD64CjfR9vjoNwPMnxOjeZSOeYr/CtJp0AV7i0sqVfhpTGOY3+Vb1LGkTEoT
         kCM5+hatJVP8mvAMedrKLiwtv24YoeYF+p1t1GGGGs9iutIsRvNtBsNiASMkOw6os17B
         J7Cwr+BTVREhYpFGJK67jqJ+lnrhjSRAfCKQiAsOcP+Z07qMT1XbNhkW40T5/AhXjQE+
         +9dKZFQzrbQdgmnzNht64JD6jA5S4h2KQoawts96x0xAEloufPJ/M3kvGmhKzS9pcJBn
         K8douAFF2nCjVudIf3iYV3Ndqs205MCmIi13XIkeWY/72IQlgvfGYewYs5hGQvH9mOMN
         PbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698659264; x=1699264064;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VNqVOafoli2UlL22BBZlG8If4F8EihISHX/NTqTcwEU=;
        b=aCiBhDIBCvLWq/5XE1jPte3HXaJWVHls3CQmJ6lFY8Sl9QY13PolNyaaG9AEAClsg+
         O4Ll6nsOz2WRKZW3GKlJUiXAqem6FmBRuHqUdXrRdJb+/9FusZL7yH8NWsbQ6YlPmnvE
         dJ7ot86gztesys4ZH6ALmiouiavvbv+6Q54Y2lF0AsZxcxdXGr1H5KgZ57XST8st93+c
         oWoJQoc2M4WFWA8cNE5HwW1LxjEg909lL78SqEiIB5QJyOe70x2QmoxAbWlMWpqgl8ws
         bYcMaOtyhBQk9Uxr0Dd/h9wFI+Maur3p2Jky2IE3XKK8hf5QDm9mMHtfeqMiIqEGPHek
         3VfQ==
X-Gm-Message-State: AOJu0Yy5O5Tr7g3d2Ua18MXdvc+zEJcRprGS6E+KKw8ZdUdij/jMZjDY
	mKZiqarKfaQeEwexhyjDwhVoVHacp9bWWQrcKO7UbA==
X-Google-Smtp-Source: AGHT+IH4vGEQN2ht9HEWJL1x66zGUn2ZBD0Ei507AWcGjNS0lN6B3REXl08u1/DpS4NjeE917SoyGVG+xW8qvzQFjvI=
X-Received: by 2002:a81:e249:0:b0:59b:cfe1:bcf1 with SMTP id
 z9-20020a81e249000000b0059bcfe1bcf1mr8771096ywl.44.1698659264481; Mon, 30 Oct
 2023 02:47:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
 <20230903214150.2877023-13-dmitry.baryshkov@linaro.org> <ZQRKq7K8jKlH/Y4X@kuha.fi.intel.com>
 <0F1BE090-92C4-4233-A77A-9B4C653DA1A7@linaro.org> <ZT9m/OoFUiZaWy9s@kuha.fi.intel.com>
In-Reply-To: <ZT9m/OoFUiZaWy9s@kuha.fi.intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 30 Oct 2023 11:47:33 +0200
Message-ID: <CAA8EJprgpfh_GOeV+557YHWUJC-9W1Tw7nzb0jy5mPAv35VuGA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 12/12] usb: typec: qcom: define the bridge's path
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Guenter Roeck <linux@roeck-us.net>, Janne Grunau <j@jannau.net>, Simon Ser <contact@emersion.fr>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 Oct 2023 at 10:19, Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Mon, Oct 23, 2023 at 09:24:33PM +0300, Dmitry Baryshkov wrote:
> > On 15 September 2023 15:14:35 EEST, Heikki Krogerus <heikki.krogerus@linux.intel.com> wrote:
> > >Hi Dmitry,
> > >
> > >On Mon, Sep 04, 2023 at 12:41:50AM +0300, Dmitry Baryshkov wrote:
> > >> In order to notify the userspace about the DRM connector's USB-C port,
> > >> export the corresponding port's name as the bridge's path field.
> > >>
> > >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >> ---
> > >>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c     | 11 +++++++----
> > >>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.c |  4 +++-
> > >>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.h |  6 ++++--
> > >>  3 files changed, 14 insertions(+), 7 deletions(-)
> > >>
> > >> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> > >> index b9d4856101c7..452dc6437861 100644
> > >> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> > >> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> > >> @@ -156,6 +156,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
> > >>    struct device_node *np = dev->of_node;
> > >>    const struct pmic_typec_resources *res;
> > >>    struct regmap *regmap;
> > >> +  char *tcpm_name;
> > >>    u32 base[2];
> > >>    int ret;
> > >>
> > >> @@ -211,10 +212,6 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
> > >>    mutex_init(&tcpm->lock);
> > >>    platform_set_drvdata(pdev, tcpm);
> > >>
> > >> -  tcpm->pmic_typec_drm = qcom_pmic_typec_init_drm(dev);
> > >> -  if (IS_ERR(tcpm->pmic_typec_drm))
> > >> -          return PTR_ERR(tcpm->pmic_typec_drm);
> > >> -
> > >>    tcpm->tcpc.fwnode = device_get_named_child_node(tcpm->dev, "connector");
> > >>    if (!tcpm->tcpc.fwnode)
> > >>            return -EINVAL;
> > >> @@ -225,6 +222,12 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
> > >>            goto fwnode_remove;
> > >>    }
> > >>
> > >> +  tcpm_name = tcpm_port_get_name(tcpm->tcpm_port);
> > >> +  tcpm->pmic_typec_drm = qcom_pmic_typec_init_drm(dev, tcpm_name);
> > >
> > >So I got some questions and concerns off-list. This was one of the
> > >concerns. That tcpm_name is now the actual port device name, so I'm
> > >afraid this is not acceptable.
> > >
> > >You can't use device name as a reference, ever. There is no way to
> > >guarantee that a device with a specific name is what you meant it to
> > >be by the time it's accessed.
> >
> > Hmm, could you please be more specific, why? I mean, class devices are not
> > that easy to be renamed in sysfs, are they? Or are you concerned about the
> > device being destroyed behind userspace's back? At least for MSM this will be
> > a huge problem already, with the bridge driver suddenly being removed.
>
> The race exists even in your case, but please do not look at this as a
> solution for only your platform.

Yes!

>
> This is about showing the user space a link between two device
> instances (struct device), and the way you do that is by creating a
> symlink. That way the kernel can take care of reference counting and
> guarantee that the link always points to the correct device. That way
> the link will also be always visible in user space without requirement
> for any specific ABI like it should.

I'm fine with the symlink approach (and I'll follow that up after
finishing the UCSI glue driver rework). However I feel several
deficiencies there:

1) It creates asymmetry with the DP MST case. Do we want to have
symlinks in each of the MST connectors? Or do we follow the PATH
properties in the MST case until we find the root port, which has
symlink? Please note, that fine X11 renames DP MST connectors
internally, so in xrandr I see DP-2-1, which maps to
/sys/class/drm/card0-DP-2. Kind of hard to follow.

2) For the multi-card cases, one has to remap the connector to the
card index + connector path. And this needs to be done by all user
space applications, which would like to present this kind of
information for the user.

3) If we were to support non-USB-C connectors (e.g. MyDP / SlimPort
and MHL used simple micro-USB connectors) there would be a completely
new uABI. And any external port / wrapper will also require a
completely new symlink kind.

I understand your concerns regarding mentioning external device in the
PATH property. However I think we should make it easier for the
userspace app to determine the kind of the external connector. What
would you think about extending the PATH property in the following
way:

For the USB-C connectors the PATH property has the value of
`typec:cardN-DP-m` value. Userspace app can then look for the
typec_connector symlink at the /sys/class/drm/cardN-DP-m subdir to
find the information about the corresponding USB-C port.

In future this will allow us to define e.g.:

For the SlimPort / MyDP the PATH property has the value of
`micro_usb:cardN-HDMI-m` or `micro_usb:cardN-DP-m`. The symlink is
called /sys/class/drm/cardN-DP-m/micro_usb_connector.

Or:

For the SlimPort / MyDP the PATH property has the value of
`mydp:cardN-HDMI-m` or `mydp:cardN-DP-m`. The symlink is called
/sys/class/drm/cardN-DP-m/mydp_connector.


-- 
With best wishes
Dmitry

