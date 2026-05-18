Return-Path: <linux-usb+bounces-37599-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OP2EJ7v4CmpZ+QQAu9opvQ
	(envelope-from <linux-usb+bounces-37599-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 13:32:11 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAA656B986
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 13:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E035C30D1A00
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 11:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26B4E3F39D1;
	Mon, 18 May 2026 11:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ACc1kxwA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40EA3E3D9A;
	Mon, 18 May 2026 11:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102804; cv=none; b=cAEmuj3QneBJx3/ak/hN7fOYB2roBtJEGQYfbiIIC/Z1NqHttQXGPAx7zH8Vsm/jXw4A44IMVtfp7P3sMLvKAC+RiROmQyQ5dp7AwzJlbCLeleB98HAzksYBon2xKTicMWAEu4ozMhiEVGXmb3YcIeh4MknV0zsKknWHIIFHPE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102804; c=relaxed/simple;
	bh=Bb0D3u2XRdVebzy7qrjknnQF9Rb9pvne5/CBYLy++/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sp1Np5i1Lczgt0IE9qkwz2vf7k9uyfk06KybG0w/PQW4vG5gRWN9A9jLHaetcfKR1X0nieJyLBYokGlhWh7qo5qhQiPEs9sr5uUk3eNxjlOX35OwOOVJaalTbTp8a2QWAasMJ2Fh3+YMhkdWn6cfXc8OkAEs4fWKrBPkVe4aGBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ACc1kxwA; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779102801; x=1810638801;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bb0D3u2XRdVebzy7qrjknnQF9Rb9pvne5/CBYLy++/4=;
  b=ACc1kxwAEgL6VXV+7R1hOwtUwFapQoRIo+iRWlYempJdlrFBUkL/C6mb
   K67rqMkbMhIIiF9RcR9jrptZyNqXzvcVoSqc3rFuhkkBamouTrJTLrFEx
   iKboPud6fYBGYip1z49yZcIIvMyCePt5XLOL8aSyYoOvz7WSFSYTHTvhM
   iB0ej8YifEqoNRN+Ps/J1iB+zTXWYCjFAoj/O4o/nK1WqgulIrtfi/XS/
   2K9arnZc0xvNEazNZaToy6dIhZMCP7OfOt7Xal21IcQC8NrUCWSNkLUGE
   9EB9k/UUYqGnOI5P3OBsCNMUguLLvO51aQ1HPTIUj/QR8pqHazMZWxPJq
   Q==;
X-CSE-ConnectionGUID: qjFHc3kvTy+r2XiCibvAJQ==
X-CSE-MsgGUID: pL170yZNT9acCBKAEvgWzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79668012"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="79668012"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 04:13:16 -0700
X-CSE-ConnectionGUID: Ozl8eH0tRsWx2NzuZM8cdQ==
X-CSE-MsgGUID: 7kOWupuETsOLbfibWEPzSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="238401727"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 18 May 2026 04:13:15 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id B30FE95; Mon, 18 May 2026 13:13:13 +0200 (CEST)
Date: Mon, 18 May 2026 14:13:12 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>, stable <stable@kernel.org>
Subject: Re: [PATCH 7/8] usb: typec: ucsi: displayport: NAK DP_CMD_CONFIGURE
 without a payload VDO
Message-ID: <agr0SJll8b95Z82W@kuha>
References: <2026051347-clustered-deflected-9543@gregkh>
 <2026051351-vividly-flattered-eb3d@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026051351-vividly-flattered-eb3d@gregkh>
X-Rspamd-Queue-Id: 1CAA656B986
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-37599-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,linuxfoundation.org:email]
X-Rspamd-Action: no action

Wed, May 13, 2026 at 05:52:54PM +0200, Greg Kroah-Hartman kirjoitti:
> ucsi_displayport_vdm() handles a DP_CMD_CONFIGURE by copying the first
> payload VDO from data[], but unlike the equivalent handler in
> altmodes/displayport.c it does not check that count covers a VDO beyond
> the header.  A header-only Configure VDM (count == 1) would read one u32
> past the caller's array.
> 
> In the normal UCSI path the caller controls count, so this is hardening
> for non-standard delivery paths.  NAK and bail when no configuration VDO
> is present, matching the generic DP altmode driver's existing guard.
> 
> Assisted-by: gkh_clanker_t1000
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Pooja Katiyar <pooja.katiyar@intel.com>
> Cc: Johan Hovold <johan@kernel.org>
> Cc: stable <stable@kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/displayport.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
> index 8aae80b457d7..67a0991a7b76 100644
> --- a/drivers/usb/typec/ucsi/displayport.c
> +++ b/drivers/usb/typec/ucsi/displayport.c
> @@ -240,6 +240,10 @@ static int ucsi_displayport_vdm(struct typec_altmode *alt,
>  				dp->header |= VDO_CMDT(CMDT_RSP_ACK);
>  			break;
>  		case DP_CMD_CONFIGURE:
> +			if (count < 2) {
> +				dp->header |= VDO_CMDT(CMDT_RSP_NAK);
> +				break;
> +			}
>  			dp->data.conf = *data;
>  			if (ucsi_displayport_configure(dp)) {
>  				dp->header |= VDO_CMDT(CMDT_RSP_NAK);
> -- 
> 2.54.0

-- 
heikki

