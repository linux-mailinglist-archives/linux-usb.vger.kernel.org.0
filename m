Return-Path: <linux-usb+bounces-25347-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C30AEF47A
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 12:07:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C155188B56B
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 10:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B3B270EDD;
	Tue,  1 Jul 2025 10:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LFx4u9+U"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CFD270579
	for <linux-usb@vger.kernel.org>; Tue,  1 Jul 2025 10:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751364311; cv=none; b=BH2gWm+lrcreHGBLY+XIm5z6IwfKXscm8OKwtZgT9tf0WuO5w6qX79yBzdSDrgT+A3JLXJ5eO/dLyWjUFUYG55EtYrvX7ZcKq1/sdQvryuHUVajYDmUP8pe55WuDDrHx4rNHR9bz8AMczPsTUjl2BrLgFkcR1NVfdC5byPJJq4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751364311; c=relaxed/simple;
	bh=J7qT1OUPscvTmlY96P19fQFaP+YgV/3SbogtR5auHzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+aAaMllGk91evFw7feZPoj1+AXU057YUB44deCaAg3cwLnNUTeRHyNMyVKZKZdZsWceZCcRhYNpi9cr4b5qeKP9jgFNuDDt/UneS/bjsqWheqbywAd4Aq2otcLJMTtPnROlKOH/PRoeB3EaLckNVeAatLPthlYuZ8TtXZRUG08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LFx4u9+U; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751364310; x=1782900310;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J7qT1OUPscvTmlY96P19fQFaP+YgV/3SbogtR5auHzo=;
  b=LFx4u9+Ufap9Ki2nD7XzE88dP5O/pwwFk9Ks+hemlY/wuxORlfzEYfn9
   MM93ILqSk1YdjQyvTtvRzzS9eHDdQix4GdHdUZQT9zGGxSD9/USO5p38G
   19qDIlRQxVsWjh4cdzFw1oeE3of7IebPx5rOaGAG21cMndD8TQwPbiHP+
   bvuYitGb6uUAOuALEULV5hmvFvftYdqyKzPYZJf59i4FXD7o9wVZUeLJT
   e53wvInb3RfeGgH1ahXr2qgzQPGxGlB093ieGC8wjB0OuSYU+NSb/rs8f
   rSTRQZnAwIhs7DVmQa24PAp5rvgbRCFejtQe2FApPl3ZhOHR3LGjZMV22
   Q==;
X-CSE-ConnectionGUID: nLCu+Vq0TjSDLYpKl9MEtA==
X-CSE-MsgGUID: hUPkl1G+T+q+G88vvAbmRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="52736592"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="52736592"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 03:05:09 -0700
X-CSE-ConnectionGUID: W/49GWTIROKtQyvwr6vuEQ==
X-CSE-MsgGUID: SgBuIVHGTiKx+XGgOyNC4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153339462"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa007.fm.intel.com with SMTP; 01 Jul 2025 03:05:07 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 01 Jul 2025 13:05:06 +0300
Date: Tue, 1 Jul 2025 13:05:06 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/3] usb: typec: ucsi: Add support for message out
 data structure
Message-ID: <aGOy0qEUXQ7Rl3Cw@kuha.fi.intel.com>
References: <cover.1751042810.git.pooja.katiyar@intel.com>
 <cc0b7701c4ea3d1001fefeb3df65caeb3e624722.1751042810.git.pooja.katiyar@intel.com>
 <2025062813-untying-hesitancy-088a@gregkh>
 <aGOgeSIOK-nDRGHB@kuha.fi.intel.com>
 <de4c73cc-2aaf-4987-a49c-dff2f38ba0f6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de4c73cc-2aaf-4987-a49c-dff2f38ba0f6@oss.qualcomm.com>

On Tue, Jul 01, 2025 at 11:50:21AM +0300, Dmitry Baryshkov wrote:
> On 01/07/2025 11:46, Heikki Krogerus wrote:
> > Hi,
> > 
> > On Sat, Jun 28, 2025 at 04:51:56PM +0200, Greg KH wrote:
> > > On Fri, Jun 27, 2025 at 11:10:10AM -0700, Pooja Katiyar wrote:
> > > > Add support for updating message out data structure for UCSI ACPI
> > > > interface for UCSI 2.1 and UCSI 3.0 commands such as Set PDOs and
> > > > LPM Firmware Update.
> > > > 
> > > > Additionally, update ucsi_send_command to accept message_out data
> > > > and .sync_control function to pass message_out data to
> > > > write_message_out function if the command is UCSI_SET_PDOS.
> > > 
> > > Normally when you say "additionally" that implies that the patch should
> > > be split up into pieces.  Why not do that here?
> > > 
> > > And do you _really_ need to add a new parameter to all of these
> > > functions?  It's now getting even worse, look at this:
> > > 
> > > >   		ret = ucsi_send_command(ucsi, val,
> > > >   					&ucsi->debugfs->response,
> > > > -					sizeof(ucsi->debugfs->response));
> > > > +					sizeof(ucsi->debugfs->response), NULL);
> > > 
> > > You can kind of guess what the parameters mean before the NULL change,
> > > but now you have to go look up "what is the last pointer for"
> > > everywhere.
> > > 
> > > This feels very fragile and horrible to maintain over time, please
> > > reconsider this type of api change.
> > 
> > So I think what Pooja was proposing in the first version of this
> > series, where you had a dedicated function for filling the
> > message_out, was better after all.
> > 
> > Pooja, I'm really sorry about this, but can you revert back to that,
> > and send it as v3? Let's start over.
> 
> But that breaks the sync_control logic - currently it is possible to handle
> the command in .sync_control completely. If for any reason we need to
> implement workarounds for commands using MESSAGE_OUT field, we'd have to
> introduce additional logic (which we just got rid of).

Okay. So how about a data structure for the entire mailbox that we can
pass to these functions?

struct ucsi_mailbox {
        u32 cci;
        u64 control;
        void *message_in;
        size_t message_in_size;
        void *message_out;
        size_t message_out_size;
};

thanks,

-- 
heikki

