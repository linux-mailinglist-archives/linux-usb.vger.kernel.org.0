Return-Path: <linux-usb+bounces-24686-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 202FFAD4EE3
	for <lists+linux-usb@lfdr.de>; Wed, 11 Jun 2025 10:53:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B71463A5DF5
	for <lists+linux-usb@lfdr.de>; Wed, 11 Jun 2025 08:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E26227E89;
	Wed, 11 Jun 2025 08:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OJhdtKg4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3401723F40C
	for <linux-usb@vger.kernel.org>; Wed, 11 Jun 2025 08:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749631982; cv=none; b=geMWLLbiDlLTjJmrnhPXwUHG3gB1GNfbrxt5VZZ8YKB5TbNLws6LT8W6SzFqQP6WsdtN9FdncLQ+TYYgFcoYnEXAKu4B3S3TgHYFSPPWBsfYxk6jncd0WetPCsYep18A58lnLdZiMWqz3ux7li3SF4ALORINfMgR37TS2sOhCGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749631982; c=relaxed/simple;
	bh=WAD/QXh7mGLXLpFBQNSmkUNmAA6Qk6llpAPvcGqTJwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MXNiL44IvNYJtUi62nkIcls3q6w6j5mGmFE+tCW8Ee9Fx4rR2UrLiSaoVkJQwx1qfWI9fbblpUT1PNb6iJzliMbAvCaLgv0tgPRHrItn5vYhiH4eN3NVBn11sw73REX++2bfs1fl5MxMoPuN2m8KDeurqEpufv0KhTdMsjb7lQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OJhdtKg4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749631981; x=1781167981;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WAD/QXh7mGLXLpFBQNSmkUNmAA6Qk6llpAPvcGqTJwY=;
  b=OJhdtKg4nXEjbtxyyzvtx3XmuTtM8yZ2Hgs1QX8Kc+DDFaIO0xetT93J
   nDvhcXHCKupw72OebUfrhP9OnfX8tSSsQcwgzZxKjBMRIC1nbAEiczERZ
   gyxG/bf4r7kpNpnSOtp3plb2FygRAinbW288GPwtLZfO6699CS/WYwliN
   dkG479vki2ImreDj7hVEyCjWN3RXG2hoIopL5i+BO9X9+hC/2p8hVmVp0
   xUKwEWpr48jC7dASm1OVwr8/5S5zGFCMhURGUZCXSa+wIXxZAfykYvNXF
   pfF88eyiivdTyEti18U5Vz2J2UXhrO4Wap3SqiEZiVqmBUJrmR91IcF7F
   A==;
X-CSE-ConnectionGUID: fgsb33eiTsW7yPTkML0CKQ==
X-CSE-MsgGUID: Rs8CpOrVRAewntLGJWd8PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="50990082"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="50990082"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 01:53:00 -0700
X-CSE-ConnectionGUID: /1drkylLR8aRszhiyCvnBg==
X-CSE-MsgGUID: i3uiOHUdR4ei3PFUihMyrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="178045052"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa002.jf.intel.com with SMTP; 11 Jun 2025 01:52:58 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 11 Jun 2025 11:52:57 +0300
Date: Wed, 11 Jun 2025 11:52:57 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Pooja Katiyar <pooja.katiyar@intel.com>, linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org, andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH 3/3] usb: typec: ucsi: Add support for SET_PDOS command
Message-ID: <aElD6dwH6v9voSz8@kuha.fi.intel.com>
References: <cover.1749142912.git.pooja.katiyar@intel.com>
 <72f048b49e5b9375a57ff69e47151ae19a05169f.1749142912.git.pooja.katiyar@intel.com>
 <zimwy2vru7iouhc4zu7vckv6onr7agg4oljpgth7apnkhmkdtd@ka76nwq3q53a>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zimwy2vru7iouhc4zu7vckv6onr7agg4oljpgth7apnkhmkdtd@ka76nwq3q53a>

On Fri, Jun 06, 2025 at 06:24:06AM +0300, Dmitry Baryshkov wrote:
> On Thu, Jun 05, 2025 at 06:38:15PM -0700, Pooja Katiyar wrote:
> > Add support for UCSI SET_PDOS command as per UCSI specification v2.1 and
> > above to debugfs.
> > 
> > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
> > ---
> >  drivers/usb/typec/ucsi/debugfs.c | 6 ++++++
> >  drivers/usb/typec/ucsi/ucsi.h    | 4 ++++
> >  2 files changed, 10 insertions(+)
> > 
> > diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
> > index 004587ce3427..1c8003121d6e 100644
> > --- a/drivers/usb/typec/ucsi/debugfs.c
> > +++ b/drivers/usb/typec/ucsi/debugfs.c
> > @@ -36,6 +36,12 @@ static int ucsi_cmd(void *data, u64 val)
> >  	case UCSI_SET_NEW_CAM:
> >  		ret = ucsi_send_command(ucsi, val, NULL, 0);
> >  		break;
> > +	case UCSI_SET_PDOS:
> > +		ret = ucsi_send_message_out(ucsi, ucsi->debugfs->message_out,
> > +					    UCSI_COMMAND_DATA_LEN(val));
> 
> I think this goes against current UCSI command support code. I'd suggest
> you to:
> 
> - extend .sync_control to also include message_out fields
> - return -EINVAL if the write_message_out() callback is not set
> - make ucsi_send_command() accept message_out data.

This makes sense to me.

thanks,

-- 
heikki

