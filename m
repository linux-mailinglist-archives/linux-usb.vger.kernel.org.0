Return-Path: <linux-usb+bounces-2343-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 220767DB5BF
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 10:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFD05280DE3
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 09:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD16D515;
	Mon, 30 Oct 2023 09:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="St3EgCDl"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC416AD9
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 09:06:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BCFDAF;
	Mon, 30 Oct 2023 02:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698656768; x=1730192768;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b2hfpvqWcMJ6z+4+1eokRuqHS/bV7QdXuC5gbITo4n4=;
  b=St3EgCDlsGrv5u0SGb/5RpUsFvv93nHfLWL1edjYfqjVUb6X4rFpAY5v
   Kc6TDDHnzfh0CuactWnErPX6vSWm+mox72mwS6LKgD+ttr8B0Yv2sohRr
   yCWwDJH1tjK5wXQv6lZHHNxNj/nriubm4EWPp+dYYM1TttuoDNWLKtt3k
   z040ZDoK9/nWeHAZAWM4W3FlyS8w+kp8gda8lCbY6zPwdlXUDe5g7D6n7
   sw1VSMbelwrFZv82RzI65Q+FY2Bdb91AWyFnBFi78vBP6g00wYz4sv/Iq
   O0Uw1oG7VlZ8ZZuPCCH7wQ+F7NMh/ryD47djDnrFO/GL3J/+cdJow4KQp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="368253323"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="368253323"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 02:06:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="933723386"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="933723386"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orsmga005.jf.intel.com with SMTP; 30 Oct 2023 02:06:04 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 30 Oct 2023 11:06:03 +0200
Date: Mon, 30 Oct 2023 11:06:03 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] usb: typec: ucsi: fix UCSI on buggy Qualcomm
 devices
Message-ID: <ZT9x+z4XNOFK2lFv@kuha.fi.intel.com>
References: <20231025115620.905538-1-dmitry.baryshkov@linaro.org>
 <20231025115620.905538-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025115620.905538-2-dmitry.baryshkov@linaro.org>

On Wed, Oct 25, 2023 at 02:49:29PM +0300, Dmitry Baryshkov wrote:
> On sevral Qualcomm platforms (SC8180X, SM8350, SC8280XP) a call to
> UCSI_GET_PDOS for non-PD partners will cause a firmware crash with no
> easy way to recover from it. Since we have no easy way to determine
> whether the partner really has PD support, shortcut UCSI_GET_PDOS on
> such platforms. This allows us to enable UCSI support on such devices.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi.c       |  3 +++
>  drivers/usb/typec/ucsi/ucsi.h       |  3 +++
>  drivers/usb/typec/ucsi/ucsi_glink.c | 13 +++++++++++++
>  3 files changed, 19 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 61b64558f96c..5392ec698959 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -578,6 +578,9 @@ static int ucsi_read_pdos(struct ucsi_connector *con,
>  	u64 command;
>  	int ret;
>  
> +	if (ucsi->quirks & UCSI_NO_PARTNER_PDOS)
> +		return 0;
> +
>  	command = UCSI_COMMAND(UCSI_GET_PDOS) | UCSI_CONNECTOR_NUMBER(con->num);
>  	command |= UCSI_GET_PDOS_PARTNER_PDO(is_partner);
>  	command |= UCSI_GET_PDOS_PDO_OFFSET(offset);
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index 474315a72c77..6478016d5cb8 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -317,6 +317,9 @@ struct ucsi {
>  #define EVENT_PENDING	0
>  #define COMMAND_PENDING	1
>  #define ACK_PENDING	2
> +
> +	unsigned long quirks;
> +#define UCSI_NO_PARTNER_PDOS	BIT(0)	/* Don't read partner's PDOs */
>  };
>  
>  #define UCSI_MAX_SVID		5
> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> index db6e248f8208..a94e2df6fd45 100644
> --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> @@ -6,6 +6,7 @@
>  #include <linux/auxiliary_bus.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/of_device.h>
>  #include <linux/property.h>
>  #include <linux/soc/qcom/pdr.h>
>  #include <linux/usb/typec_mux.h>
> @@ -296,11 +297,19 @@ static void pmic_glink_ucsi_destroy(void *data)
>  	mutex_unlock(&ucsi->lock);
>  }
>  
> +static const struct of_device_id pmic_glink_ucsi_of_quirks[] = {
> +	{ .compatible = "qcom,sc8180x-pmic-glink", .data = (void *)UCSI_NO_PARTNER_PDOS, },
> +	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = (void *)UCSI_NO_PARTNER_PDOS, },
> +	{ .compatible = "qcom,sm8350-pmic-glink", .data = (void *)UCSI_NO_PARTNER_PDOS, },
> +	{}
> +};
> +
>  static int pmic_glink_ucsi_probe(struct auxiliary_device *adev,
>  				 const struct auxiliary_device_id *id)
>  {
>  	struct pmic_glink_ucsi *ucsi;
>  	struct device *dev = &adev->dev;
> +	const struct of_device_id *match;
>  	struct fwnode_handle *fwnode;
>  	int ret;
>  
> @@ -327,6 +336,10 @@ static int pmic_glink_ucsi_probe(struct auxiliary_device *adev,
>  	if (ret)
>  		return ret;
>  
> +	match = of_match_device(pmic_glink_ucsi_of_quirks, dev->parent);
> +	if (match)
> +		ucsi->ucsi->quirks = (unsigned long)match->data;
> +
>  	ucsi_set_drvdata(ucsi->ucsi, ucsi);
>  
>  	device_for_each_child_node(dev, fwnode) {
> -- 
> 2.42.0

-- 
heikki

