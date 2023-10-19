Return-Path: <linux-usb+bounces-1891-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DC27CF26F
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 10:23:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB09FB21015
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 08:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2C381548D;
	Thu, 19 Oct 2023 08:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DdcHIQin"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B619514F6D
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 08:23:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40470196;
	Thu, 19 Oct 2023 01:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697703822; x=1729239822;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2MAyMgwN/G69lLL1g6/v1UJJ3TximyIFM4Z4LTNraxE=;
  b=DdcHIQin5T7tpFmMTCNCwk6MxJaIU8bEwrzaeyJOvpf1cnyeTGbD3KdO
   2OlCwen+WUkJ8k7PtEiPppQCl+G0wKkgbrLayb3n9bJZhNvHmv4BPe2Q5
   W7ZZ7rK5Cdpvc6VO5UTlIzhAoI9muCDIvrFJ5h1o1yJaCeQRrCCIiO4mb
   rTlI6rSBsAzk0mps7pGoPO9uS1o/EHFhQajRMsEXdpQ3aiDtipkuayqAT
   6pn5OZzY1cHScddLDbqxeSk39elJuSVo8A3kUORKjsnRpXPIcxzD+7oe+
   fwVAU0Oe+EXSUXkNEHe/eNb+UeomHA+S4LO2e1NRiirpW53xRp5QN64kq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="452668937"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="452668937"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 01:23:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="930523829"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="930523829"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orsmga005.jf.intel.com with SMTP; 19 Oct 2023 01:23:33 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 19 Oct 2023 11:23:33 +0300
Date: Thu, 19 Oct 2023 11:23:33 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Jimmy Hu <hhhuuu@google.com>
Cc: linux@roeck-us.net, gregkh@linuxfoundation.org, kyletso@google.com,
	badhri@google.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: Fix NULL pointer dereference in
 tcpm_pd_svdm()
Message-ID: <ZTDnhbYDq7kq8vBj@kuha.fi.intel.com>
References: <20231019060616.1988631-1-hhhuuu@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019060616.1988631-1-hhhuuu@google.com>

On Thu, Oct 19, 2023 at 06:06:16AM +0000, Jimmy Hu wrote:
> It is possible that typec_register_partner() returns ERR_PTR on failure.
> When port->partner is an error, a NULL pointer dereference may occur as
> shown below.
> 
> [91222.095236][  T319] typec port0: failed to register partner (-17)
> ...
> [91225.061491][  T319] Unable to handle kernel NULL pointer dereference
> at virtual address 000000000000039f
> [91225.274642][  T319] pc : tcpm_pd_data_request+0x310/0x13fc
> [91225.274646][  T319] lr : tcpm_pd_data_request+0x298/0x13fc
> [91225.308067][  T319] Call trace:
> [91225.308070][  T319]  tcpm_pd_data_request+0x310/0x13fc
> [91225.308073][  T319]  tcpm_pd_rx_handler+0x100/0x9e8
> [91225.355900][  T319]  kthread_worker_fn+0x178/0x58c
> [91225.355902][  T319]  kthread+0x150/0x200
> [91225.355905][  T319]  ret_from_fork+0x10/0x30
> 
> Add a check for port->partner to avoid dereferencing a NULL pointer.
> 
> Fixes: 5e1d4c49fbc8 ("usb: typec: tcpm: Determine common SVDM Version")
> Signed-off-by: Jimmy Hu <hhhuuu@google.com>

No CC stable...?

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 6e843c511b85..792ec4ac7d8d 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -1625,6 +1625,9 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
>  			if (PD_VDO_VID(p[0]) != USB_SID_PD)
>  				break;
>  
> +			if (IS_ERR_OR_NULL(port->partner))
> +				break;
> +
>  			if (PD_VDO_SVDM_VER(p[0]) < svdm_version) {
>  				typec_partner_set_svdm_version(port->partner,
>  							       PD_VDO_SVDM_VER(p[0]));

-- 
heikki

