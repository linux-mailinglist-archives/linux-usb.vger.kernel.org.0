Return-Path: <linux-usb+bounces-28109-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D224B57AC4
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 14:24:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16B734824CF
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 12:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7610D30B504;
	Mon, 15 Sep 2025 12:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XlnGu/QN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723973074B7
	for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 12:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757938977; cv=none; b=nRwSEKKbE3CjGWN0Ibj+N9RHLV+LTEpbpQHf6a939MNfZkUjO/oVM1JFOKmia2SY8p8SBWqNQ7NA6hBPvLunWSOj9+JqoGVG16Arzn1FfrHbQE94WSafMP0Y/qaIrriNrt5XsnHFU3EQ88FVJ1bN/FH2JT1MRMLD+5ZZ2vmYMtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757938977; c=relaxed/simple;
	bh=SmrCL28GAjsbU/AGRJmWPNTDM+wz8OJR28D+aH2m6qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jIdz1S0FQAFXu546jFfRazL3cbMA+LU5aL3qxFDVfPzpzUvGMPqQ77+LW035SWsGbR4wwVm3HqL/JSWaE8HiA+Ja2gC1iXgkZhJBshiSb4P6winHSn3Fcxy+r8+8WCToIRPTX8Aydt9j7Eu49LJHxXDCOKIRGygGk7yZVVh0rF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XlnGu/QN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757938976; x=1789474976;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SmrCL28GAjsbU/AGRJmWPNTDM+wz8OJR28D+aH2m6qc=;
  b=XlnGu/QNFXefrnYnf9yHLiVSCK+xRBkpRQ0f7Gy2+kX1JYoqLRzh1que
   It+cO0Sk+YJiLPqH2bsbmQXS3u7UCf0fAfGayC6dOW7EU3rASV0sIYCg7
   KDRMvQj7BlO/tUEBuBNQx3KZ2XYiS8QNHysdVs1S/AI3qh7P8hLwqFfoB
   02gwMH00ep5L5tUySP9eAgm96tlNIf0luEtKsMTZFlo3IBJUUGHn0TckX
   EHiILuSKuyCcd5/huZOVxc277/hBtMGTZNWQkdLME4aKEuwy7Odi1itU+
   NlZvxnc3y8Nafh31VJ7mvdW7qoTOyYSQabFo2ly/2N2oM6JDWj0j/exjq
   g==;
X-CSE-ConnectionGUID: 5itYY7MPS3iLe8rZgvzjIA==
X-CSE-MsgGUID: cVj8Qr7BQtKegNHp44H5kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="64008129"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="64008129"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 05:22:55 -0700
X-CSE-ConnectionGUID: ll7eqTNTSJ2IfOduqdCFdg==
X-CSE-MsgGUID: NXKsOtBPSHWvh9ShbfKDSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="173757220"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa006.jf.intel.com with SMTP; 15 Sep 2025 05:22:53 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 15 Sep 2025 15:22:51 +0300
Date: Mon, 15 Sep 2025 15:22:51 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: badhri@google.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2] usb: typec: tcpci: add wakeup support
Message-ID: <aMgFG9WRBqOe5POT@kuha.fi.intel.com>
References: <20250910105042.695146-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910105042.695146-1-xu.yang_2@nxp.com>

On Wed, Sep 10, 2025 at 06:50:42PM +0800, Xu Yang wrote:
> Add wakeup support for tcpci. If the user enables the wakeup file, call
> enable_irq_wake() during system suspend and disable_irq_wake() during
> system resume. Since this driver supports shared interrupts, mask the
> chip interrupt by default when wakeup is disabled to avoid affecting
> other IRQ users.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in v2:
>  - improve commit message
>  - add Rb tag
> ---
>  drivers/usb/typec/tcpm/tcpci.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index a56e31b20c21..2a951c585e92 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -949,6 +949,8 @@ static int tcpci_probe(struct i2c_client *client)
>  	if (err < 0)
>  		goto unregister_port;
>  
> +	device_set_wakeup_capable(chip->tcpci->dev, true);
> +
>  	return 0;
>  
>  unregister_port:
> @@ -969,6 +971,36 @@ static void tcpci_remove(struct i2c_client *client)
>  	tcpci_unregister_port(chip->tcpci);
>  }
>  
> +static int tcpci_suspend(struct device *dev)
> +{
> +	struct i2c_client *i2c = to_i2c_client(dev);
> +	struct tcpci_chip *chip = i2c_get_clientdata(i2c);
> +	int ret;
> +
> +	if (device_may_wakeup(dev))
> +		ret = enable_irq_wake(i2c->irq);
> +	else
> +		ret = tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, 0);
> +
> +	return ret;
> +}
> +
> +static int tcpci_resume(struct device *dev)
> +{
> +	struct i2c_client *i2c = to_i2c_client(dev);
> +	struct tcpci_chip *chip = i2c_get_clientdata(i2c);
> +	int ret;
> +
> +	if (device_may_wakeup(dev))
> +		ret = disable_irq_wake(i2c->irq);
> +	else
> +		ret = tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, chip->tcpci->alert_mask);
> +
> +	return ret;
> +}
> +
> +DEFINE_SIMPLE_DEV_PM_OPS(tcpci_pm_ops, tcpci_suspend, tcpci_resume);
> +
>  static const struct i2c_device_id tcpci_id[] = {
>  	{ "tcpci" },
>  	{ }
> @@ -987,6 +1019,7 @@ MODULE_DEVICE_TABLE(of, tcpci_of_match);
>  static struct i2c_driver tcpci_i2c_driver = {
>  	.driver = {
>  		.name = "tcpci",
> +		.pm = pm_sleep_ptr(&tcpci_pm_ops),
>  		.of_match_table = of_match_ptr(tcpci_of_match),
>  	},
>  	.probe = tcpci_probe,
> -- 
> 2.34.1

-- 
heikki

