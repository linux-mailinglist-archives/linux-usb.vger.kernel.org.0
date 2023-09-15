Return-Path: <linux-usb+bounces-138-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EC67A1E47
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 14:15:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A15D31C20C01
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 12:15:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C7C51078F;
	Fri, 15 Sep 2023 12:15:08 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3E41078A
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 12:15:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C1AF211E;
	Fri, 15 Sep 2023 05:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694780105; x=1726316105;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jH6v5bbbkkEM6BDUb1aHP3gU8Bm1CEPG4JUxxTB7iDI=;
  b=fsde/vXU3HuwMCrzIEoccDRLDRxXJbMaO4meSXbukv8h/Cv8NPkjeSlI
   0++bxDPznL7/I8Uwztgo9F4AQsmZaJi9+6mtQpcciLOPQqCR6KPbn5/qq
   fBgReRRf42tQhD5gc0QjpOKb0pvWWzaUMl4cTO64J8dUD+M4gdYaJJnKY
   tF2dT9R3WJueQfa0IwC64xxmdxx0oFRMnmSq320lPSDK1gU0f5dWDuzZn
   4cHRptDHWoRS9FF9DDdsMup8wgVkt0MlYXwt7IxQZ9c/kbRYsjE5yXqD/
   P+9wFLnUY3QJ85W4TaYxVQTp9DfhSj5fJfTRR3N9Cmet+SnQl7vXVSonW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="359490902"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="359490902"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 05:14:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="835190933"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="835190933"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by FMSMGA003.fm.intel.com with SMTP; 15 Sep 2023 05:14:36 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 15 Sep 2023 15:14:35 +0300
Date: Fri, 15 Sep 2023 15:14:35 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>, Janne Grunau <j@jannau.net>,
	Simon Ser <contact@emersion.fr>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: Re: [RFC PATCH v1 12/12] usb: typec: qcom: define the bridge's path
Message-ID: <ZQRKq7K8jKlH/Y4X@kuha.fi.intel.com>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
 <20230903214150.2877023-13-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230903214150.2877023-13-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi Dmitry,

On Mon, Sep 04, 2023 at 12:41:50AM +0300, Dmitry Baryshkov wrote:
> In order to notify the userspace about the DRM connector's USB-C port,
> export the corresponding port's name as the bridge's path field.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c     | 11 +++++++----
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.c |  4 +++-
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.h |  6 ++++--
>  3 files changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> index b9d4856101c7..452dc6437861 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> @@ -156,6 +156,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>  	struct device_node *np = dev->of_node;
>  	const struct pmic_typec_resources *res;
>  	struct regmap *regmap;
> +	char *tcpm_name;
>  	u32 base[2];
>  	int ret;
>  
> @@ -211,10 +212,6 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>  	mutex_init(&tcpm->lock);
>  	platform_set_drvdata(pdev, tcpm);
>  
> -	tcpm->pmic_typec_drm = qcom_pmic_typec_init_drm(dev);
> -	if (IS_ERR(tcpm->pmic_typec_drm))
> -		return PTR_ERR(tcpm->pmic_typec_drm);
> -
>  	tcpm->tcpc.fwnode = device_get_named_child_node(tcpm->dev, "connector");
>  	if (!tcpm->tcpc.fwnode)
>  		return -EINVAL;
> @@ -225,6 +222,12 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>  		goto fwnode_remove;
>  	}
>  
> +	tcpm_name = tcpm_port_get_name(tcpm->tcpm_port);
> +	tcpm->pmic_typec_drm = qcom_pmic_typec_init_drm(dev, tcpm_name);

So I got some questions and concerns off-list. This was one of the
concerns. That tcpm_name is now the actual port device name, so I'm
afraid this is not acceptable.

You can't use device name as a reference, ever. There is no way to
guarantee that a device with a specific name is what you meant it to
be by the time it's accessed.

If you need to deal with a device, then you have to get an actual
reference to it (class_find_device_by_fwnode() should work in this
case).

Ideally you would get the reference in the place where you actually
use it (so drm_connector.c or more likely drm_sysfs.c) but that would
mean a dependency on typec in there, if the component framework or
something like that (device links?) is not an option. You could of
course try to confine the dependency somehow. drm_class does not have
implementation for dev_uevent, so you could take over that as a
temporary solution.

The only way to avoid the dependency completely would be to pass that
device reference from here through your drm bridge chain somehow.
But that's also really fragile. But it could be acceptable as a
temporary solution perhaps, if it's even possible.

Br,

-- 
heikki

