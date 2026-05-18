Return-Path: <linux-usb+bounces-37600-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHPZNLL4CmoA+wQAu9opvQ
	(envelope-from <linux-usb+bounces-37600-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 13:32:02 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D27CC56B97E
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 13:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9C41B305817D
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 11:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B260F3F58FE;
	Mon, 18 May 2026 11:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QOl9zvhb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F2B368275;
	Mon, 18 May 2026 11:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779103033; cv=none; b=QLioprpkw/qJct68ZT9amohAaX0+IVDdM3sbW6v3rmNpK7Cx63fCDWJ+QaRZZ/P8l2W7miyB9Y2gjnCYA2Fuy2KNaSFFqSaPVjXupyYmITTvGzzRExIeQm8U3Dt9Atr7c6Wtg1eArgfQzTqPfWz8dabNftO8bykuJ0DOijcoN/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779103033; c=relaxed/simple;
	bh=GTGKuOWSaIHci1lse2ZmJAGQfwyaZX4CiaUzYQ+GUfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=esmljUbiBb6H8sL2Jaw1LdDE8vG9i9wP25//6fUOxqepZeUXTQCap6/QabJQ7Hg64JBDJIRMJyTsNtZXZF4izNm5lGtKv7dAd1Pe7MRo4ieBxVQxWsUCRbsYx6LFKBHgXX/t7d3R+imdAhpMzs7UtkYng2Rjo06ip6fq0p6BsNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QOl9zvhb; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779103023; x=1810639023;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GTGKuOWSaIHci1lse2ZmJAGQfwyaZX4CiaUzYQ+GUfg=;
  b=QOl9zvhbaN7cTNTf/pWf1ZyKC5X/cpTe8iJ611ZV93B7Uhjegl5pY595
   Id1TEKizz2Sl4kG4Vur+L+lOFSQdBnZg22WNRXfHlFkVIH16d/LywFUuz
   n60PXTOvwfTD28OeDbQBYrkfMmP88L3ECYG2Lu4TmyzPRhE8GrDwq2Qzn
   TLJt3xgEzLTbB15SfjAuZ+53JcmRgmXsFNBxQB8N05dhtNO7NwQqk2mC6
   yOZXuDfyBckfFQIILECsVLKFnarmcAcFVmGudIPbrQzfIB9QdwUTy+Hx1
   rnd5coiAGLNEKOhQ6axluosrQUut/G8zc4u1rEhJGoxeCgeQPJeDrgoOI
   A==;
X-CSE-ConnectionGUID: 2hrAzPCQSvGvvfG+0ZVz2g==
X-CSE-MsgGUID: ZXbgRDmZRCOKazEFue91yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="80073561"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="80073561"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 04:16:55 -0700
X-CSE-ConnectionGUID: jRNviuakTE6jn0E/12Tnag==
X-CSE-MsgGUID: vO8mIECESlSeGgc4On7ewQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="235160149"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 18 May 2026 04:16:53 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id C390F95; Mon, 18 May 2026 13:16:51 +0200 (CEST)
Date: Mon, 18 May 2026 14:16:50 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Nathan Rebello <nathan.c.rebello@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Abel Vesa <abelvesa@kernel.org>, stable <stable@kernel.org>
Subject: Re: [PATCH 8/8] usb: typec: ucsi: validate connector number in
 ucsi_connector_change()
Message-ID: <agr1Ijj-RX2Cf2Oo@kuha>
References: <2026051347-clustered-deflected-9543@gregkh>
 <2026051351-truck-steadfast-df48@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026051351-truck-steadfast-df48@gregkh>
X-Rspamd-Queue-Id: D27CC56B97E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,chromium.org,google.com,gmail.com,kernel.org,intel.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37600-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linuxfoundation.org:email,intel.com:email,intel.com:dkim,chromium.org:email]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 05:52:55PM +0200, Greg Kroah-Hartman wrote:
> The connector number in a UCSI CCI notification is a 7-bit field
> supplied by the PPM.  ucsi_connector_change() uses it to index the
> ucsi->connector[] array without checking it against the number of
> connectors the PPM reported at init time, so a buggy or malicious PPM
> (EC firmware, or an I2C-attached UCSI controller on the ccg / stm32g0 /
> glink transports) can drive schedule_work() on memory past the end of
> the array.
> 
> Reject connector numbers that are zero or exceed cap.num_connectors
> before dereferencing the array.
> 
> Assisted-by: gkh_clanker_t1000
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Jameson Thies <jthies@google.com>
> Cc: Nathan Rebello <nathan.c.rebello@gmail.com>
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Pooja Katiyar <pooja.katiyar@intel.com>
> Cc: Hsin-Te Yuan <yuanhsinte@chromium.org>
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: stable <stable@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 5b7ad9e99cb9..539dc706798d 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1380,13 +1380,22 @@ static void ucsi_handle_connector_change(struct work_struct *work)
>   */
>  void ucsi_connector_change(struct ucsi *ucsi, u8 num)
>  {
> -	struct ucsi_connector *con = &ucsi->connector[num - 1];
> +	struct ucsi_connector *con;
>  
>  	if (!(ucsi->ntfy & UCSI_ENABLE_NTFY_CONNECTOR_CHANGE)) {
>  		dev_dbg(ucsi->dev, "Early connector change event\n");
>  		return;
>  	}
>  
> +	if (!num || num > ucsi->cap.num_connectors) {
> +		dev_warn_ratelimited(ucsi->dev,
> +				     "Bogus connector change on %u (max %u)\n",
> +				     num, ucsi->cap.num_connectors);
> +		return;
> +	}
> +
> +	con = &ucsi->connector[num - 1];
> +
>  	if (!test_and_set_bit(EVENT_PENDING, &ucsi->flags))
>  		schedule_work(&con->work);
>  }
> -- 
> 2.54.0

-- 
heikki

