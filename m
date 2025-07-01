Return-Path: <linux-usb+bounces-25358-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F60AEF930
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 14:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A69B189C20E
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 12:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B2B4272E70;
	Tue,  1 Jul 2025 12:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UEBAX8u+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4842D26A1DE
	for <linux-usb@vger.kernel.org>; Tue,  1 Jul 2025 12:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751374278; cv=none; b=Mh+fYSYaqeu6dll5tYawS4XxowO4ntVL1Zqq5etJFRdHtvWSRwceyZsjC/SMhrQ5h486hIn+Ly6/B7MuZjcrBUze5AzTcppe0R7qDVMPzndBGHKSVB6/HU9IE/TErrWqhkXoJDzPa6UBAs/CqhCHyeemHjNdw+P95IDt+Qu9NuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751374278; c=relaxed/simple;
	bh=VvJUaFAyOO3avK2/nhcPIc97N9VAbBwoiduS7uXM1R4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GsSqBnIRbWAqG24ht9N6nRkGOyGa+83cDguTPGKXCJMfB/OuHO7/b4hdrAyDaoKxbJkcfLMRtj1traKzRrH7UGlpn8o4xKB6L8eQTPeR2MjzvI8Nnz4/GO8qjvwF8GgYbu5PrXyOQ1dGhXnEkZrPSaCKg1tz1iI1HSJVYJWxzDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UEBAX8u+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751374277; x=1782910277;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VvJUaFAyOO3avK2/nhcPIc97N9VAbBwoiduS7uXM1R4=;
  b=UEBAX8u+wQjHss4Mb60gmmWx0kXQyOUmWd8QiLiRRonFtGnp1jv0lGvP
   jnNzC7kpMEA7siPwZm27M9kOeQannAwyomEO8uhCGmag6W+hjL/T5c6g3
   lPyIMGsHmehDkkpBhNlC/oVnGNFbiMbahDjhadM1xpp5X7KumZPUv7d0Z
   1Oyktn4namR1oRhr6pgGgOsF59I7iLtsa2+8xj/sMT3yYdTbhEL8q/1p4
   ncRLV3Pn76IMeagm/bcFT6hZDPPcyo/zjUzNbXmKSKQiGXxk3eKg0hnRw
   19Tc1ygy1yZ6UDu1L410auD4ewtVKBljBNlVWypup3xmETp6pEJ6kYBpf
   g==;
X-CSE-ConnectionGUID: x/nJAgdNRyuJsJjK8PuLEg==
X-CSE-MsgGUID: XiJ1B7XORLafF7bW077yIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="79079105"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="79079105"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 05:51:16 -0700
X-CSE-ConnectionGUID: yYUbbvsvQ5aTtyaXI76DJQ==
X-CSE-MsgGUID: J0UxMruyTbuhr2TMsz7sPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="158323346"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa004.jf.intel.com with SMTP; 01 Jul 2025 05:51:15 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 01 Jul 2025 15:51:13 +0300
Date: Tue, 1 Jul 2025 15:51:12 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/3] usb: typec: ucsi: Add support for message out
 data structure
Message-ID: <aGPZwGekEihFjB-4@kuha.fi.intel.com>
References: <cover.1751042810.git.pooja.katiyar@intel.com>
 <cc0b7701c4ea3d1001fefeb3df65caeb3e624722.1751042810.git.pooja.katiyar@intel.com>
 <2025062813-untying-hesitancy-088a@gregkh>
 <aGOgeSIOK-nDRGHB@kuha.fi.intel.com>
 <de4c73cc-2aaf-4987-a49c-dff2f38ba0f6@oss.qualcomm.com>
 <aGOy0qEUXQ7Rl3Cw@kuha.fi.intel.com>
 <45d5003d-87e1-4e8c-9eda-b1f67c7e57f5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45d5003d-87e1-4e8c-9eda-b1f67c7e57f5@oss.qualcomm.com>

On Tue, Jul 01, 2025 at 01:11:24PM +0300, Dmitry Baryshkov wrote:
> On 01/07/2025 13:05, Heikki Krogerus wrote:
> > On Tue, Jul 01, 2025 at 11:50:21AM +0300, Dmitry Baryshkov wrote:
> > > On 01/07/2025 11:46, Heikki Krogerus wrote:
> > > > Hi,
> > > > 
> > > > On Sat, Jun 28, 2025 at 04:51:56PM +0200, Greg KH wrote:
> > > > > On Fri, Jun 27, 2025 at 11:10:10AM -0700, Pooja Katiyar wrote:
> > > > > > Add support for updating message out data structure for UCSI ACPI
> > > > > > interface for UCSI 2.1 and UCSI 3.0 commands such as Set PDOs and
> > > > > > LPM Firmware Update.
> > > > > > 
> > > > > > Additionally, update ucsi_send_command to accept message_out data
> > > > > > and .sync_control function to pass message_out data to
> > > > > > write_message_out function if the command is UCSI_SET_PDOS.
> > > > > 
> > > > > Normally when you say "additionally" that implies that the patch should
> > > > > be split up into pieces.  Why not do that here?
> > > > > 
> > > > > And do you _really_ need to add a new parameter to all of these
> > > > > functions?  It's now getting even worse, look at this:
> > > > > 
> > > > > >    		ret = ucsi_send_command(ucsi, val,
> > > > > >    					&ucsi->debugfs->response,
> > > > > > -					sizeof(ucsi->debugfs->response));
> > > > > > +					sizeof(ucsi->debugfs->response), NULL);
> > > > > 
> > > > > You can kind of guess what the parameters mean before the NULL change,
> > > > > but now you have to go look up "what is the last pointer for"
> > > > > everywhere.
> > > > > 
> > > > > This feels very fragile and horrible to maintain over time, please
> > > > > reconsider this type of api change.
> > > > 
> > > > So I think what Pooja was proposing in the first version of this
> > > > series, where you had a dedicated function for filling the
> > > > message_out, was better after all.
> > > > 
> > > > Pooja, I'm really sorry about this, but can you revert back to that,
> > > > and send it as v3? Let's start over.
> > > 
> > > But that breaks the sync_control logic - currently it is possible to handle
> > > the command in .sync_control completely. If for any reason we need to
> > > implement workarounds for commands using MESSAGE_OUT field, we'd have to
> > > introduce additional logic (which we just got rid of).
> > 
> > Okay. So how about a data structure for the entire mailbox that we can
> > pass to these functions?
> > 
> > struct ucsi_mailbox {
> >          u32 cci;
> >          u64 control;
> >          void *message_in;
> >          size_t message_in_size;
> >          void *message_out;
> >          size_t message_out_size;
> > };
> 
> What about a slightly different proposal (following ucsi_ccg design):
> 
> 
> struct ucsi {
>    // .....
>    u32 cci;
>    u8 message_in[UCSI_MAX_MESSAGE_IN];
>    u8 message_out[UCSI_MAX_MESSAGE_OUT];
> };
> 
> The caller will fill ucsi->message_out, call sync_control with a proper
> length specified, then read UCSI_CCI_LENGTH(ucsi->cci) bytes from
> ucsi->message_in.

Looks better indeed.

> Note: I'm positive that we can handle message buffers in this way. I'm not
> so sure about the CCI, it might be too dynamic.

Pooja, I'm sorry about the extra work needed. Can you check this?

P.S. I'm already on vacation so there will be delays with my
responses.

-- 
heikki

