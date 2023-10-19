Return-Path: <linux-usb+bounces-1890-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B487CF24D
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 10:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63EE8281EF7
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 08:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF17E14F92;
	Thu, 19 Oct 2023 08:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wbq10O7X"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992D514F6D
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 08:19:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79F3310F;
	Thu, 19 Oct 2023 01:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697703588; x=1729239588;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ck3Nj7TeuDIaUGkikDZDIlu7/KYPSN+1S/hD16NfZXM=;
  b=Wbq10O7XS+GnVKs+FbTT4Y6inD6wbNumyFFBKLjsw459nRfBaPIXHYog
   XsNuciBNI4h13cGLq6M1TNbTf8Hx7qJ2++wE96MumcvoNnFh+pe1UKdAK
   CJHc25brC4rByzbiQvU9J1xSnmnS+yLQBJdIVa2oHlbO8FKvSx5b6TPG3
   3q5m+ox+U1kochiTGFezJtOxdzi9Ho5S/7JkiWnn49bLk4LChzst+w5lP
   R0k23T4aqh8F3sBQ8Pk+we3r4oDu0LOGKheUEu1ouaOcgfI7LNI58i87J
   0isEN/rJtGlI9KEoFfTZ+cydH4gk37PNU/4oqPb1oIeHQmQJw88lGEaUb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="7754659"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="7754659"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 01:19:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="733480694"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="733480694"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orsmga006.jf.intel.com with SMTP; 19 Oct 2023 01:19:45 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 19 Oct 2023 11:19:44 +0300
Date: Thu, 19 Oct 2023 11:19:44 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: RD Babiera <rdbabiera@google.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, badhri@google.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: altmodes/displayport: verify compatible
 source/sink role combination
Message-ID: <ZTDmoGh9atof6itF@kuha.fi.intel.com>
References: <20231018203408.202845-2-rdbabiera@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018203408.202845-2-rdbabiera@google.com>

On Wed, Oct 18, 2023 at 08:34:09PM +0000, RD Babiera wrote:
> DisplayPort Alt Mode CTS test 10.3.8 states that both sides of the
> connection shall be compatible with one another such that the connection
> is not Source to Source or Sink to Sink.
> 
> The DisplayPort driver currently checks for a compatible pin configuration
> that resolves into a source and sink combination. The CTS test is designed
> to send a Discover Modes message that has a compatible pin configuration
> but advertises the same port capability as the device; the current check
> fails this.
> 
> Verify that the port and port partner resolve into a valid source and sink
> combination before checking for a compatible pin configuration.
> 
> ---
> Changes since v1:
> * Fixed styling errors
> * Added DP_CAP_IS_UFP_D and DP_CAP_IS_DFP_D as macros to typec_dp.h
> ---
> 
> Fixes: 0e3bb7d6894d ("usb: typec: Add driver for DisplayPort alternate mode")
> Cc: stable@vger.kernel.org
> Signed-off-by: RD Babiera <rdbabiera@google.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/altmodes/displayport.c | 5 +++++
>  include/linux/usb/typec_dp.h             | 2 ++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index 718da02036d8..9c17955da570 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -578,6 +578,11 @@ int dp_altmode_probe(struct typec_altmode *alt)
>  
>  	/* FIXME: Port can only be DFP_U. */
>  
> +	/* Make sure that the port and partner can resolve into source and sink */
> +	if (!(DP_CAP_IS_DFP_D(port->vdo) && DP_CAP_IS_UFP_D(alt->vdo)) &&
> +	    !(DP_CAP_IS_UFP_D(port->vdo) && DP_CAP_IS_DFP_D(alt->vdo)))
> +		return -ENODEV;
> +
>  	/* Make sure we have compatiple pin configurations */
>  	if (!(DP_CAP_PIN_ASSIGN_DFP_D(port->vdo) &
>  	      DP_CAP_PIN_ASSIGN_UFP_D(alt->vdo)) &&
> diff --git a/include/linux/usb/typec_dp.h b/include/linux/usb/typec_dp.h
> index 1f358098522d..4e6c0479307f 100644
> --- a/include/linux/usb/typec_dp.h
> +++ b/include/linux/usb/typec_dp.h
> @@ -67,6 +67,8 @@ enum {
>  #define   DP_CAP_UFP_D			1
>  #define   DP_CAP_DFP_D			2
>  #define   DP_CAP_DFP_D_AND_UFP_D	3
> +#define DP_CAP_IS_UFP_D(_cap_)		(!!(DP_CAP_CAPABILITY(_cap_) & DP_CAP_UFP_D))
> +#define DP_CAP_IS_DFP_D(_cap_)		(!!(DP_CAP_CAPABILITY(_cap_) & DP_CAP_DFP_D))
>  #define DP_CAP_DP_SIGNALLING(_cap_)	(((_cap_) & GENMASK(5, 2)) >> 2)
>  #define   DP_CAP_SIGNALLING_HBR3	1
>  #define   DP_CAP_SIGNALLING_UHBR10	2
> 
> base-commit: 5220d8b04a840fa09434072c866d032b163419e3
> -- 
> 2.42.0.655.g421f12c284-goog

-- 
heikki

