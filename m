Return-Path: <linux-usb+bounces-30889-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADD7C83F99
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 09:27:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C88ED3AF75A
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 08:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 397032D8DAF;
	Tue, 25 Nov 2025 08:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KdVa4NGW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F3C2D8768;
	Tue, 25 Nov 2025 08:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764059249; cv=none; b=mIJNAP+AM7M2wsTxF/DvYohfUbhja1RZrAHZpi62j0JAYcfe9nVYeGk2XTDxQVIC1rZZ8KFFBgjh7mc4RIeTfI3xHMk7eMswJ30RuLf7zfwsQxfSqYhKKsX8pmVh2O1pXrmTDc8NX2CdRqfQ/DSGh4xzOkIVMpap7JgusNbhuBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764059249; c=relaxed/simple;
	bh=gBjHZf4aVpQwRjGF+jL44Q0ZpyYCoEqCax0a6sY3SrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLjTSbaBx5nMIk50ztaRyWebxWDyeDaA3yw7xzAAtwEaDm/NXic7CvEfCfB7GVVw1mb1URNsx06OATImDTnP5OlFIT8OvMO6Fq4n642lTfupX9S50MY95qHKgMbtSXdGqA4GeQfZmEixOkRcdNh038RfgeYuEmnJUyKnHJT+h9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KdVa4NGW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764059247; x=1795595247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gBjHZf4aVpQwRjGF+jL44Q0ZpyYCoEqCax0a6sY3SrQ=;
  b=KdVa4NGWipqB9ls4aEFPBiSgLv7Cy8iXnXGTr/PMlvVodleYQJIGEWsn
   TcaswvLJQWLjp2blnkjamtAjuW/m2Py2cqPQu7ad3X+5iQtfmF+tGGIM2
   cNFrEi6W7ZurSuh3vQJjN6M4PyADrbNBzAfUAc5z84O9OK7O3UiYCL0Kr
   GX1d7qRe13c/GPRTwjL0WCRVQXTO/hk8dQMk8zdr1ipDGzprwaC8gPeM0
   oT9asH4RkNdtYla9kTF2+oV/ZuJaAmb7e9vNuNrwjnHS6MppJKMoieuii
   VgoTGsyUVzrTrvmgL1vw4iNZml8ra9kCa+wMnvEUmzgUIY1h4Z6psKwMc
   w==;
X-CSE-ConnectionGUID: iieokU5JRkyhxqwDBS73Kw==
X-CSE-MsgGUID: chRyQnmqSwuGWZEVLessjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65255012"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="65255012"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 00:27:26 -0800
X-CSE-ConnectionGUID: /RhNzov7Q32JPQaf3eX58Q==
X-CSE-MsgGUID: 5E7fPU1aTH2P4LHNEn7bdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="197687981"
Received: from vverma7-mobl3.amr.corp.intel.com (HELO kuha) ([10.124.222.196])
  by orviesa005.jf.intel.com with SMTP; 25 Nov 2025 00:27:19 -0800
Received: by kuha (sSMTP sendmail emulation); Tue, 25 Nov 2025 10:27:13 +0200
Date: Tue, 25 Nov 2025 10:27:13 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Fix missing typec_unregister_port on
 error paths
Message-ID: <aSVoYbBqC_h3mqcA@kuha>
References: <20251124122030.1759-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124122030.1759-1-vulab@iscas.ac.cn>

Mon, Nov 24, 2025 at 08:20:30PM +0800, Haotian Zhang kirjoitti:
> The ucsi_register_port()  registers a Type-C port with
> typec_register_port(), but several error paths after a successful
> registration returned directly to cleanup without calling
> typec_unregister_port(). This lead to a potential resource leak.
> 
> Add a common error-unwind path that calls typec_unregister_port()
> for all failures to ensure proper cleanup.
> 
> Fixes: c1b0bc2dabfa ("usb: typec: Add support for UCSI interface")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 3f568f790f39..096c4911e8bf 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1656,14 +1656,14 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
>  	if (ret) {
>  		dev_err(ucsi->dev, "con%d: failed to register alt modes\n",
>  			con->num);
> -		goto out;
> +		goto out_unregister;
>  	}
>  
>  	/* Get the status */
>  	ret = ucsi_get_connector_status(con, false);
>  	if (ret) {
>  		dev_err(ucsi->dev, "con%d: failed to get status\n", con->num);
> -		goto out;
> +		goto out_unregister;
>  	}
>  
>  	if (ucsi->ops->connector_status)
> @@ -1717,6 +1717,10 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
>  
>  	trace_ucsi_register_port(con->num, con);
>  
> +	goto out;
> +
> +out_unregister:
> +	typec_unregister_port(con->port);

No. We don't destroy the port if status or alt modes fail. The alt
modes can't be considered critical because the firmware quite often
claims alt modes are supported even though they are not. That should
be explained, if not in documentation, then at least in the commit
messages.

Try something like this instead.

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index ec6c8f928dda..8de8935320be 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1682,6 +1682,7 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
        if (ret) {
                dev_err(ucsi->dev, "con%d: failed to register alt modes\n",
                        con->num);
+               ret = 0;
                goto out;
        }
 
@@ -1689,6 +1690,7 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
        ret = ucsi_get_connector_status(con, false);
        if (ret) {
                dev_err(ucsi->dev, "con%d: failed to get status\n", con->num);
+               ret = 0;
                goto out;
        }


And the commit you want to fix is b9aa02ca39a4 ("usb: typec: ucsi: Add
polling mechanism for partner tasks like alt mode checking").

thanks,

-- 
heikki

