Return-Path: <linux-usb+bounces-14948-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E929E975436
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 15:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63D0FB28277
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 13:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E09719E981;
	Wed, 11 Sep 2024 13:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XuHMFnRn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0C71885A7
	for <linux-usb@vger.kernel.org>; Wed, 11 Sep 2024 13:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726061770; cv=none; b=SLV6mvfIvLgylMLC5JbVFGW9SxLHr9j2jWVmx19ps7/PMpciX0Oggyhse6Gfp7H1+QzkIX6glnft6O2Gm+DpxIzhrYaL4c6S2Rjqy/G2uroGoPl6/IYSZh1KZX4IPDLAKreQ66fftRfgFI8B+9Ck6GBVB1+iLRXybsoCUpqzVtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726061770; c=relaxed/simple;
	bh=IkzL+oko964etG66AiIEc6xx+3lEBojWO3716ErMKS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sF6A66PdEl5/Q5xm/97nI8ANaDvf6XhvY/n5Rjs2rB8xd4E34wpPK9/8dxaapY9DoUA0aEiNt4o+aiOPqwQDq2EnHJRIGbwVlPox9qMqs6PyJOKI+rTeJBvVKyv/QlvPzMtquY2FOJYiuwUML9Rlm8EMfAfTX6RY4wEmM2a7D1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XuHMFnRn; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726061769; x=1757597769;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IkzL+oko964etG66AiIEc6xx+3lEBojWO3716ErMKS0=;
  b=XuHMFnRnSakg5ydLb76YkFNU1qURgScP5aoZkOa+KNhoxAbM1jeq1Xsk
   vMDET82HOvWbu03i7KS6RukmlUP1L6pzXGbOiYQeJ1/Spd101iJ+1tD3P
   NFcHO3GVizgFL0jWfDUXAcbSKZf/6HZVRtPIZy4ND17yQzeTS5Lc/gWf2
   9wNTjN5YQmd+gTIBoQjv+S7hueHRQJSqd6pbjY5Y8kr4muGYG/PVM1KTm
   sIFUiM5+15MXIBmXeewrx7CSEj7nITzI3TJB5WxRr9B9C3xEnh6lkSAKh
   K2AABEEjJVG3MYEqv8q1vz40m0HyO6Btkc9O+P6po4+ANcGS2DoJEZ42C
   g==;
X-CSE-ConnectionGUID: Xb3dEoY7SyOsPJdG6ueNTA==
X-CSE-MsgGUID: Fg038WtNStqIzNOeDKaNCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24402050"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="24402050"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 06:36:08 -0700
X-CSE-ConnectionGUID: rwXh9nqyS3q1wQfUUl4VAQ==
X-CSE-MsgGUID: yGTtJT3KQzGAJQuhEp+4dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="71962476"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmviesa004.fm.intel.com with SMTP; 11 Sep 2024 06:36:04 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 11 Sep 2024 16:36:03 +0300
Date: Wed, 11 Sep 2024 16:36:03 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v6 5/8] usb: typec: cros_ec_ucsi: Add trace events
Message-ID: <ZuGcw9y0hIiuIXvK@kuha.fi.intel.com>
References: <20240910101527.603452-1-ukaszb@chromium.org>
 <20240910101527.603452-6-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240910101527.603452-6-ukaszb@chromium.org>

On Tue, Sep 10, 2024 at 10:15:24AM +0000, Łukasz Bartosik wrote:
> Add trace events to ChromeOS UCSI driver to enable debugging.
> 
> Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
> ---
>  MAINTAINERS                                 |  1 +
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c       |  8 ++
>  drivers/usb/typec/ucsi/cros_ec_ucsi_trace.h | 92 +++++++++++++++++++++
>  3 files changed, 101 insertions(+)
>  create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi_trace.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8c030ea0b503..d084f32208f0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5306,6 +5306,7 @@ M:	Łukasz Bartosik <ukaszb@chromium.org>
>  L:	chrome-platform@lists.linux.dev
>  S:	Maintained
>  F:	drivers/usb/typec/ucsi/cros_ec_ucsi.c
> +F:	drivers/usb/typec/ucsi/cros_ec_ucsi_trace.h
>  
>  CHRONTEL CH7322 CEC DRIVER
>  M:	Joe Tessler <jrt@google.com>
> diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> index 422b3b14028c..70185616ec86 100644
> --- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
> @@ -16,7 +16,9 @@
>  #include <linux/slab.h>
>  #include <linux/wait.h>
>  
> +#define CREATE_TRACE_POINTS
>  #include "ucsi.h"
> +#include "cros_ec_ucsi_trace.h"
>  
>  /*
>   * Maximum size in bytes of a UCSI message between AP and EC
> @@ -62,6 +64,8 @@ static int cros_ucsi_read(struct ucsi *ucsi, unsigned int offset, void *val,
>  		dev_warn(udata->dev, "Failed to send EC message UCSI_PPM_GET: error=%d", ret);
>  		return ret;
>  	}
> +
> +	trace_cros_ec_opm_to_ppm_rd(offset, val, val_len);
>  	return 0;
>  }
>  
> @@ -96,6 +100,8 @@ static int cros_ucsi_async_control(struct ucsi *ucsi, u64 cmd)
>  		dev_warn(udata->dev, "Failed to send EC message UCSI_PPM_SET: error=%d", ret);
>  		return ret;
>  	}
> +
> +	trace_cros_ec_opm_to_ppm_wr(req->offset, &cmd, sizeof(cmd));
>  	return 0;
>  }
>  
> @@ -138,6 +144,8 @@ static void cros_ucsi_work(struct work_struct *work)
>  	struct cros_ucsi_data *udata = container_of(work, struct cros_ucsi_data, work);
>  	u32 cci;
>  
> +	trace_cros_ec_ppm_to_opm(0);
> +
>  	if (cros_ucsi_read_cci(udata->ucsi, &cci))
>  		return;
>  
> diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi_trace.h b/drivers/usb/typec/ucsi/cros_ec_ucsi_trace.h
> new file mode 100644
> index 000000000000..b765ef5c8236
> --- /dev/null
> +++ b/drivers/usb/typec/ucsi/cros_ec_ucsi_trace.h
> @@ -0,0 +1,92 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM cros_ec_ucsi
> +
> +#if !defined(__CROS_EC_UCSI_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define __CROS_EC_UCSI_TRACE_H
> +
> +#include <linux/tracepoint.h>
> +
> +#define decode_cmd(cmd)									\
> +	__print_symbolic(cmd,								\
> +		{ 0,				"Unknown command"		},	\
> +		{ UCSI_PPM_RESET,		"PPM_RESET"			},	\
> +		{ UCSI_CONNECTOR_RESET,		"CONNECTOR_RESET,"		},	\
> +		{ UCSI_ACK_CC_CI,		"ACK_CC_CI"			},	\
> +		{ UCSI_SET_NOTIFICATION_ENABLE,	"SET_NOTIFICATION_ENABLE"	},	\
> +		{ UCSI_GET_CAPABILITY,		"GET_CAPABILITY"		},	\
> +		{ UCSI_GET_CONNECTOR_CAPABILITY, "GET_CONNECTOR_CAPABILITY"	},	\
> +		{ UCSI_SET_UOM,			"SET_UOM"			},	\
> +		{ UCSI_SET_UOR,			"SET_UOR"			},	\
> +		{ UCSI_SET_PDM,			"SET_PDM"			},	\
> +		{ UCSI_SET_PDR,			"SET_PDR"			},	\
> +		{ UCSI_GET_ALTERNATE_MODES,	"GET_ALTERNATE_MODES"		},	\
> +		{ UCSI_GET_CAM_SUPPORTED,	"GET_CAM_SUPPORTED"		},	\
> +		{ UCSI_GET_CURRENT_CAM,		"GET_CURRENT_CAM"		},	\
> +		{ UCSI_SET_NEW_CAM,		"SET_NEW_CAM"			},	\
> +		{ UCSI_GET_PDOS,		"GET_PDOS"			},	\
> +		{ UCSI_GET_CABLE_PROPERTY,	"GET_CABLE_PROPERTY"		},	\
> +		{ UCSI_GET_CONNECTOR_STATUS,	"GET_CONNECTOR_STATUS"		},	\
> +		{ UCSI_GET_ERROR_STATUS,	"GET_ERROR_STATUS"		})

Couldn't you just export ucsi_cmd_str() ?

> +#define decode_offset(offset)					\
> +	__print_symbolic(offset,				\
> +		{ UCSI_VERSION,		"VER"		},	\
> +		{ UCSI_CCI,		"CCI"		},	\
> +		{ UCSI_CONTROL,		"CTRL"		},	\
> +		{ UCSI_MESSAGE_IN,	"MSG_IN"	},	\
> +		{ UCSI_MESSAGE_OUT,	"MSG_OUT"	},	\
> +		{ UCSIv2_MESSAGE_OUT,	"MSG_OUTv2"	})
> +
> +DECLARE_EVENT_CLASS(cros_ec_opm_to_ppm,
> +	TP_PROTO(u16 offset, const void *value, size_t length),
> +	TP_ARGS(offset, value, length),
> +	TP_STRUCT__entry(
> +		__field(u8, cmd)
> +		__field(u16, offset)
> +		__field(size_t, length)
> +		__dynamic_array(char, msg, length)
> +	),
> +	TP_fast_assign(
> +		__entry->cmd = *((u64 *) value + 3);
> +		__entry->offset = offset;
> +		__entry->length = length;
> +		memcpy(__get_dynamic_array(msg), value, length);
> +	),
> +	TP_printk("(%s) %s: %s",
> +		decode_offset(__entry->offset),
> +		__entry->offset == UCSI_CONTROL ?
> +		decode_cmd(__entry->cmd) : "",
> +		__print_hex(__get_dynamic_array(msg), __entry->length))
> +);
> +
> +DEFINE_EVENT(cros_ec_opm_to_ppm, cros_ec_opm_to_ppm_rd,
> +	TP_PROTO(u16 offset, const void *value, size_t length),
> +	TP_ARGS(offset, value, length)
> +);
> +
> +DEFINE_EVENT(cros_ec_opm_to_ppm, cros_ec_opm_to_ppm_wr,
> +	TP_PROTO(u16 offset, const void *value, size_t length),
> +	TP_ARGS(offset, value, length)
> +);
> +
> +TRACE_EVENT(cros_ec_ppm_to_opm,
> +	TP_PROTO(int x),
> +	TP_ARGS(x),
> +	TP_STRUCT__entry(__array(char, x, 0)),
> +	TP_fast_assign((void)x),
> +	TP_printk("notification%s", "")
> +);

This does not look cros_ec specific. Could you check if this could be
made part of the ucsi core tracepoints?

I can also look into this more carefully, and throw ideas if you like.
Let me know.

Br,

-- 
heikki

