Return-Path: <linux-usb+bounces-34731-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eML+KvHQs2ncbAAAu9opvQ
	(envelope-from <linux-usb+bounces-34731-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 09:55:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A9327FFF6
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 09:55:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3233530480CC
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 08:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2916315D23;
	Fri, 13 Mar 2026 08:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FTLTyZ0w"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB8A36AB5A;
	Fri, 13 Mar 2026 08:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773392084; cv=none; b=mgtmBejlo4UIzxrNJ9r0+AW7Gpa/vpvF+6mhctyC8ax+dKsEpgHgVc/o8YyQEsx927u2CHz+zpdP/0yVV5r8TW/As4ho8bgrujTkiSYOaER9NG1FrPc3kIBxyYT0I977x6puj94VvzUixY9TDErCCd+pdSbuCOtvaLDJ8F+IIO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773392084; c=relaxed/simple;
	bh=0CzPQ+Rl49DllXZ3KhRpAnpGuVHnL0ukzeTephVhYbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gkI58QgY24U4pngRJYBSJvob/Pbp4539AIUJv9lw12PTyLsMS8ynE2C68ocVko1xHmtmVYk6mL4b3k10wHBsNBcEU092wC64iyMFtsh8yaKL1uDK6KC2ax5T6CSQdaNBwnoITRjmmVY/43c4quaoVRCKNlx2nS7yRvAJCXii9ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FTLTyZ0w; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773392082; x=1804928082;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0CzPQ+Rl49DllXZ3KhRpAnpGuVHnL0ukzeTephVhYbA=;
  b=FTLTyZ0w1i6KODvXIEmEKYylrezkssbQn6k+MjbcyI0aS1zQrMeI0Fd2
   josZYuYrR1yOBRQ1MWVDBz0E/hEzTEYT8dnZkGaHGAeyAuajoskpk06dK
   Tt1DYJH2xVLYutGE3G7S8A528Uk2+XFuKe4nRU8cXwL6AGs465UIukYqc
   Dn+ohtaX0wKO3g0eCaEHvZcWqMHadn2A5nXjx3id+7vXafBA+AUMQ+nwR
   9H0eoeZ+/tAwv9Y7O+FsS0CL290w+to5MWNMWLzmhCrvnPdsjhV+/XRJc
   meU3fAnc6RjuIhLdpe4D6/R2h6yTkmHYYgovhuZr0NoxsRc0oawHE43GR
   w==;
X-CSE-ConnectionGUID: yOAyMEJISGKvpV09p7xcRQ==
X-CSE-MsgGUID: ploTVVhvRnqqWA6eSwP98g==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74378291"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="74378291"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 01:54:41 -0700
X-CSE-ConnectionGUID: xB91/nA7QUWe3j+2Tc3Zgw==
X-CSE-MsgGUID: GLPTkGKASV2hC6UZZQuGIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="217549088"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 13 Mar 2026 01:54:38 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id F06B795; Fri, 13 Mar 2026 09:54:36 +0100 (CET)
Date: Fri, 13 Mar 2026 10:53:53 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Jameson Thies <jthies@google.com>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Add UCSI_USB4_IMPLIES_USB quirk for
 X1E80100
Message-ID: <abPQodYcXFT2qxlq@kuha>
References: <20260312101431.2375709-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312101431.2375709-1-krishna.kurapati@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34731-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 14A9327FFF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thu, Mar 12, 2026 at 03:44:31PM +0530, Krishna Kurapati kirjoitti:
> On X1E80100, when we connect a USB4 capable dock, the PARTNER_FLAGS
> indicate USB4_GEN3 being set whilst keeping the PARTNER_FLAGS_USB
> cleared. Due to this, during ucsi_partner_change call, the usb role
> is marked as ROLE_NONE and passed to DWC3 controller the same way.
> 
> Fix this by adding UCSI_USB4_IMPLIES_USB quirk and check for it to
> decide and pass on proper ROLE information to DWC3 layer.

Do we need a quirk for this - can't we just always check the
USB4_GET<X>? With USB4, don't we always support USB2?

thanks,

> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  drivers/usb/typec/ucsi/ucsi.c       | 6 ++++--
>  drivers/usb/typec/ucsi/ucsi.h       | 3 +++
>  drivers/usb/typec/ucsi/ucsi_glink.c | 2 ++
>  3 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index f38a4d7ebc42..e042499613c9 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1182,8 +1182,10 @@ static void ucsi_partner_change(struct ucsi_connector *con)
>  		}
>  	}
>  
> -	/* Only notify USB controller if partner supports USB data */
> -	if (!(UCSI_CONSTAT(con, PARTNER_FLAG_USB)))
> +	if ((!UCSI_CONSTAT(con, PARTNER_FLAG_USB)) &&
> +	    ((con->ucsi->quirks & UCSI_USB4_IMPLIES_USB) &&
> +	     (!(UCSI_CONSTAT(con, PARTNER_FLAG_USB4_GEN3) ||
> +		UCSI_CONSTAT(con, PARTNER_FLAG_USB4_GEN4)))))
>  		u_role = USB_ROLE_NONE;
>  
>  	ret = usb_role_switch_set_role(con->usb_role_sw, u_role);
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index 43a0d01ade8f..cff9ddc2ae21 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -497,6 +497,9 @@ struct ucsi {
>  	unsigned long quirks;
>  #define UCSI_NO_PARTNER_PDOS	BIT(0)	/* Don't read partner's PDOs */
>  #define UCSI_DELAY_DEVICE_PDOS	BIT(1)	/* Reading PDOs fails until the parter is in PD mode */
> +
> +/* USB4 connection can imply that USB communcation is supported */
> +#define UCSI_USB4_IMPLIES_USB	BIT(2)
>  };
>  
>  #define UCSI_MAX_DATA_LENGTH(u) (((u)->version < UCSI_VERSION_2_0) ? 0x10 : 0xff)
> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> index 11b3e24e34e2..1cb519cc0532 100644
> --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> @@ -371,6 +371,7 @@ static void pmic_glink_ucsi_destroy(void *data)
>  static unsigned long quirk_sc8180x = UCSI_NO_PARTNER_PDOS;
>  static unsigned long quirk_sc8280xp = UCSI_NO_PARTNER_PDOS | UCSI_DELAY_DEVICE_PDOS;
>  static unsigned long quirk_sm8450 = UCSI_DELAY_DEVICE_PDOS;
> +static unsigned long quirk_x1e80100 = UCSI_DELAY_DEVICE_PDOS | UCSI_USB4_IMPLIES_USB;
>  
>  static const struct of_device_id pmic_glink_ucsi_of_quirks[] = {
>  	{ .compatible = "qcom,qcm6490-pmic-glink", .data = &quirk_sc8280xp, },
> @@ -379,6 +380,7 @@ static const struct of_device_id pmic_glink_ucsi_of_quirks[] = {
>  	{ .compatible = "qcom,sm8350-pmic-glink", .data = &quirk_sc8180x, },
>  	{ .compatible = "qcom,sm8450-pmic-glink", .data = &quirk_sm8450, },
>  	{ .compatible = "qcom,sm8550-pmic-glink", .data = &quirk_sm8450, },
> +	{ .compatible = "qcom,x1e80100-pmic-glink", .data = &quirk_x1e80100, },
>  	{}
>  };
>  
> -- 
> 2.34.1

-- 
heikki

