Return-Path: <linux-usb+bounces-31703-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00683CD92C9
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 13:07:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA28E301CC77
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 12:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D05F32E6AC;
	Tue, 23 Dec 2025 12:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BzVKOu1I"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46F82D2496
	for <linux-usb@vger.kernel.org>; Tue, 23 Dec 2025 12:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766491625; cv=none; b=C3YrxH+FZThBVL7Fiely4aPWTP4AeugU5Wm6uz3kfUF9eIPJH4GB9PiqwTPSDmiyvfk0XEsjxBg4lhPjqo6iB4WYMlsY9heFFx8G4D1+vFS14MK/843Ftk8fuW5xN0JWQQQo87SOLaedGUHO8cQm5PTPBctL4gSKFhnN0+4RknA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766491625; c=relaxed/simple;
	bh=sT8pHCCS8jQB+TSfNuYVh7NcZp6Y5HCDDuwS/BuHwIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WVK7JNeDTDwTLUiThxIXcnJ/uhCiQRY4qqHj6gMhXqh4Dn64kL4wPkwvQ/HW+2qHU7DmQ9MJb8TnhPSj3643Ash4qrT0lc6JZUloACLMCqlDjBcmQy/MXhcIPZV6Un7kVEWyss0CJLZGZu0PRGohTxeRokAxOJeTsNbpx7ep1yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BzVKOu1I; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766491625; x=1798027625;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sT8pHCCS8jQB+TSfNuYVh7NcZp6Y5HCDDuwS/BuHwIE=;
  b=BzVKOu1IRZ3xGjYTBKk7cCWCQHFO1HzqbB5ivfb5vsk/dmQbChrpoBB2
   y+qstjatFkWE8qb4koXTOwWB+iRibjpnSUshRHAp5QmC4GO6moJE0vFkc
   +VW+v88qdSXhVv2WFj6z6yFgTOQcKfSY/zq0HZ4D7NQEVp8wWqmgNjS1N
   fDMEm190hS6yzC1DRbWVJEVS8I7Y4nkw1YkDR4lIdf/wOxJ9VR6y8jnFf
   abldKeQFsLTT+54gpPmeziZnM/Zk0JsKkGiNHl7kP+lUDmNqMSZsLp/CU
   6pfbUEZSAHtxtHEm40Rxah/jDSuGcuT9SGHC/rLRNPtoKqgBOvZFP7ddw
   A==;
X-CSE-ConnectionGUID: JEzo/51BTCiBwGFPS/5WRg==
X-CSE-MsgGUID: qwoj60scRXKhPPUJ6V+Sdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="90997071"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="90997071"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 04:07:04 -0800
X-CSE-ConnectionGUID: a7i0/HGiSs6AO8WBLCtHGg==
X-CSE-MsgGUID: 2CClESY6RbSeWHUuJsCQvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="199680656"
Received: from bkammerd-mobl.amr.corp.intel.com (HELO kuha) ([10.124.220.158])
  by fmviesa006.fm.intel.com with SMTP; 23 Dec 2025 04:06:59 -0800
Received: by kuha (sSMTP sendmail emulation); Tue, 23 Dec 2025 14:06:44 +0200
Date: Tue, 23 Dec 2025 14:06:44 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Katiyar, Pooja" <pooja.katiyar@linux.intel.com>
Cc: Pooja Katiyar <pooja.katiyar@intel.com>, linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH v5 1/4] usb: typec: ucsi: Update UCSI structure to have
 message in and message out fields
Message-ID: <aUqF1EGxbiY1A1Eq@kuha>
References: <cover.1761773881.git.pooja.katiyar@intel.com>
 <214b0a90c3220db33084ab714f4f33a004f70a41.1761773881.git.pooja.katiyar@intel.com>
 <2tlusuyqp2jif37smm57skeo3g2trzdspirv6minlopo5cey7m@z23tworiljkg>
 <66950556-3313-470b-bb51-82e14ce144cd@linux.intel.com>
 <349e1f70-7e40-4e3e-b078-6e001bbb5f1a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <349e1f70-7e40-4e3e-b078-6e001bbb5f1a@oss.qualcomm.com>

Hi,

Thu, Dec 18, 2025 at 03:22:43AM +0200, Dmitry Baryshkov kirjoitti:
> On 18/12/2025 03:17, Katiyar, Pooja wrote:
> > Hello,
> > 
> > On Fri, Dec 12, 2025 at 06:58:06PM -0800, Dmitry Baryshkov wrote:
> > > On Thu, Oct 30, 2025 at 07:48:55AM -0700, Pooja Katiyar wrote:
> > > > Update UCSI structure by adding fields for incoming and outgoing
> > > > messages. Update .sync_control function and other related functions
> > > > to use these new fields within the UCSI structure, instead of handling
> > > > them as separate parameters.
> > > > 
> > > > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > > Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
> > > > ---
> > > > Changelog v3:
> > > > - Added message fields to UCSI structure and updated sync_control handling.
> > > 
> > > Colleagues, after looking at this patch I have a question. What prevents
> > > message_{in,out}{,_size} to be modified concurrently? While we have PPM
> > > lock around command submission, size fields and buffers are modified /
> > > accessed outside of the lock. Granted all the notifications and async
> > > nature of the UCSI and USB-C protocols, what prevents two commands from
> > > being executed at the same time with one of the execution threads
> > > accessing the results returned by the other command?
> > > 
> > > In other words:
> > > 
> > > - thread A sets message_in_size, calls ucsi_send_command(CMD_A), which
> > >    takes PPM lock
> > > 
> > >     - meanwhile thread B writes another value to message_in_size and
> > >       calls ucsi_send_command(CMD_B), which now waits on PPM lock
> > > 
> > > - thread A finishes execution of the CMD_A, copies data (with the
> > >    wrong size!) to the message_in_buf, then it releases PPM lock.
> > > 
> > > - thread A gets preempted
> > > 
> > >      - thread B gets scheduled, it takes PPM lock, executes CMD_B, gets
> > >        data into the message_in_buf and finally it releases PPM lock
> > > 
> > > - finally at some later point thread A gets scheduled, it accesses
> > >    message_in_buf, reading data that has been overwritten by CMD_B
> > >    execution.
> > > 
> > > WDYT?
> > 
> > Thank you for identifying this race condition. You are correct about the
> > concurrent access issue with the message buffer fields.
> > 
> > Here are two potential approaches I see to resolve this:
> > 
> > Option 1: Separate mutex locks for message variables
> > Add a dedicated message_lock mutex to protect message_{in,out}{,_size}.
> > message_{in,out}{,_size} will only be modified within the message_lock
> > protection.
> > 
> > 	mutex_lock(&ucsi->message_lock);
> > 	ucsi->message_in_size = size;
> > 	ret = ucsi_send_command(ucsi, cmd);
> > 	memcpy(buffer, ucsi->message_in, size);
> > 	mutex_unlock(&ucsi->message_lock);
> > 
> > Option 2: Pass message variables as function arguments
> > Pass message buffers and sizes as parameters down to where ppm_lock is
> > acquired, ensuring protection throughout command execution.
> > 
> > 	int ucsi_send_command(ucsi, cmd, msg_in_buf, msg_in_size, msg_out_buf,
> > 			      msg_out_size) {
> >      		mutex_lock(&ucsi->ppm_lock);
> >      		ucsi->message_in_size = msg_in_size;
> >      		// execute command and copy results to msg_in_buf
> > 		memcpy(msg_in_buf, ucsi->message_in, msg_in_size);
> >      		mutex_unlock(&ucsi->ppm_lock);
> > 	}
> > 
> > I'm leaning toward Option 1 as it resolves the concern of passing too many args.
> > What are your thoughts on the suggested options or do you have alternative
> > suggestions?
> 
> I'm slightly biased towards  the second option (it doesn't required extra
> locks and it also is a bit more idiomatic), but I'm fine either way.
> 
> Looking forward to seeing the fixing patch!

I don't think you are fully solving the problem.

Pooja, you know my opinion. This whole approach of using separate
files is wrong. IMO we should only have a single file for the entire
UCSI mailbox, and the mailbox should be allocated searately for
everyone that opens the file. I don't think there is any way to
guarantee that the data in these separate files isn't for somebody
else.

thanks,

-- 
heikki

