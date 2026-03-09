Return-Path: <linux-usb+bounces-34290-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AED6GiOwrmkSHwIAu9opvQ
	(envelope-from <linux-usb+bounces-34290-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 12:33:55 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E3081237FB4
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 12:33:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9881302BDEE
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 11:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D9623A4F2C;
	Mon,  9 Mar 2026 11:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ayqJ6rVS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505383859CC;
	Mon,  9 Mar 2026 11:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773056006; cv=none; b=O3vJv+1powejEnczIRHQ2GcD7EVVtcfYyyC+YPpDy6aBbOtXPWz2bvJLGQK3yRWcGy4wiXqvubxyh6qpaSXC2t9XYYEcCTYsYA3JgwwQKGCawSCztuV+2Hx/NbWX8uOfO7HkpC6r4pOexnssnlAc4t/I+jmES3OLy4/NCEan9xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773056006; c=relaxed/simple;
	bh=COjXwEJ25kVZpwij3BU7lSfwlt1fv9gndUQDTyoI8DU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JecnYv/Yk69wqYywRTlu2qqfNbXSzLcSAoDJ9mbmafwfF1rX5iStJOtMmdgqlOjqrxRf4fw1Qnn8dg9+sG/8qm0uzhZ7YCIXSOH8fMczXMB/oxN9P0XLzcr8UyuoXfYg7Cje112Ms9USMc70xnNjXFWAG2/Zruq5/oLzqI96MQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ayqJ6rVS; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773056003; x=1804592003;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=COjXwEJ25kVZpwij3BU7lSfwlt1fv9gndUQDTyoI8DU=;
  b=ayqJ6rVSsesRq1hmxSq4GhfGT5oqdRMkhDRvs7xDCpLN2jJUXNIBsbpw
   q7Y7j88zyWINFZWfGYIKHsFN+JhBQoEg2C8/pCVzCeH3ZtwmGm2WJFcrA
   s1RbsAHirtpCTtlYLsgOKLgYklY/XtxAATsfSMUZXkuIWj1ylEqTm9dBg
   XTYdabK+TyMS3FzWX/W8nUdqkunL3jhBWBJ200Q3/Sq7GjAhpy1R0gew+
   dwjw4qKhBpibif1hPQhx9NSBe7GGEKWOpZTme3jWm2bcTefGSqbaUZy2M
   SKJY9+q3BQN7tBuSgSVNfpKavjYUBcTFqg1gPvsfmctkT6OKutlBv5grv
   g==;
X-CSE-ConnectionGUID: Tq4NOfcIToSwhylMGp62CA==
X-CSE-MsgGUID: EYWO+xBgQVe84ivsAAy6zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="73270170"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="73270170"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 04:33:22 -0700
X-CSE-ConnectionGUID: q64Hs8M/SdC+7/WZfvqm9w==
X-CSE-MsgGUID: Rq11eDK+QEC0piW7kM+wFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="245703874"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 09 Mar 2026 04:33:21 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id D6F2498; Mon, 09 Mar 2026 12:33:19 +0100 (CET)
Date: Mon, 9 Mar 2026 13:32:40 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: badhri@google.com, gregkh@linuxfoundation.org,
	arnaud.ferraris@collabora.com, dsimic@manjaro.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 0/2] improve usb_role_switch_is_parent()
Message-ID: <aa6v2JcjQyEQajKh@kuha>
References: <20260309074313.2809867-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309074313.2809867-1-xu.yang_2@nxp.com>
X-Rspamd-Queue-Id: E3081237FB4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34290-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.956];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.22:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim,intel.com:email]
X-Rspamd-Action: no action

Mon, Mar 09, 2026 at 03:43:11PM +0800, Xu Yang kirjoitti:
> This patchset will revert a recent fix patch which will introduce another
> regression, and fix the true underlying issue.
> 
> Arnaud pushed a fix patch commit 1366cd228b0c ("tcpm: allow looking for
> role_sw device in the main node") because commit 2d8713f807a4
> ("tcpm: switch check for role_sw device with fw_node") swap the order of
> usb_role_switch_get() and fwnode_usb_role_switch_get() and this cause the
> fwnode_usb_role_switch_get() return "-EPROBE_DEFER" all the time in his
> usecase.
> 
> The said dts use below property to get role switch device: 
> 
>   fusb0: typec-portc@22 {
>   	  compatible = "fcs,fusb302";
>   	  usb-role-switch = <&typec_extcon_bridge>;
>   	  ...
>    
>   	  connector {
>   	  }
>   }
> 
> So the fix patch works because usb_role_switch_get() will correctly find
> the role switch device in case fwnode_usb_role_switch_get() is failed.
> However, usb_role_switch_get() shouldn't be called at all in this case
> because tcpc->fwnode is already correctly set to @connector. And worse
> more, this bring another issue that is once fwnode_usb_role_switch_get()
> return "-EPROBE_DEFER" this info may be lost if usb_role_switch_get()
> then return NULL.
> 
> After further research into this issue, finally I found
> usb_role_switch_is_parent() not work properly when it parse non-boolean
> "usb-role-switch" property which is for back compatibility purpose. To fix
> the issue, patch#2 is added.
> 
> Xu Yang (2):
>   Revert "tcpm: allow looking for role_sw device in the main node"
>   usb: roles: get usb role switch from parent only for usb-b-connector
> 
>  drivers/usb/roles/class.c     | 7 ++++++-
>  drivers/usb/typec/tcpm/tcpm.c | 2 +-
>  2 files changed, 7 insertions(+), 2 deletions(-)

For the series:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Thanks Xu!

-- 
heikki

