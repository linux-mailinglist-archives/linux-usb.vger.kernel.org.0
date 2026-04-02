Return-Path: <linux-usb+bounces-35892-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8K+FEeRwzmkcnwYAu9opvQ
	(envelope-from <linux-usb+bounces-35892-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:36:36 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DC3389D69
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 15:36:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 32358300B3D0
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 13:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79583033E8;
	Thu,  2 Apr 2026 13:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QbREZC0k"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139522DE6F1
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 13:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775136444; cv=none; b=CeJkiHMhlCdtw2V2BQ6XFARgXFIoGCZdPoG1CjhVAUxWzy4nvnKYAwum6OflfhMXo2KJnQM5hLVWRcUTAq57fzDpj1kZM3bMqtD4nt/XtKvb3tmoF6U15I9p6pZUkPOuugtGHVb7W2PUgXyR8ea9OK6cw6S8HJZTJUovIy35OQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775136444; c=relaxed/simple;
	bh=JBb9IwnJDZwk7/fZtSNLcwOkjn1hzwNXw5xjCyapWug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lpa5RFiaP1qZenhlJn7Bv47CrfUxXTmxHrZZuAfEJwJ+hLBx17rYeENDvrTTgKFn3skaUHk99fsjIwHfGyWHrr9CmLoEaHigGIpFIvIn+IFgjxDhq7qmyyW4BYfTSwZwQbY3EMLKbX0mnos4X3sImL75uD46a57cDaCvZXLeT5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QbREZC0k; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775136444; x=1806672444;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JBb9IwnJDZwk7/fZtSNLcwOkjn1hzwNXw5xjCyapWug=;
  b=QbREZC0kCjHeMbY1WlzgyOPaNZqre5+W6S4uZi2CHN6pALnlf3vsF78n
   Zo669uX1iNW08Bp/AZcAUjvuK9yV0DBltoHgx5MmrZKmnq8l8l8B5nAZ5
   7fsugnB8PzNjUHD+4gPHZ/XOY4Otv7r9jCCnWZOTT6NSi8+G6L9KDtj0M
   /aLLsXb+mgtVg2QwCTFHuekKvYQDbP9toXaTgJETUkyEOt5YLWGMgSCDx
   z+yq8hEO2oSPQhq0TeIYBWevGiB5IpP3lKRrJuz9jFzM9zm5AvyzePQ/U
   FjWiJnqqwMdextEckZwNzNq5kUaB6KOoXRRCv0NChK4zPuGV1Nc+l4BVJ
   A==;
X-CSE-ConnectionGUID: p6PMfEQgRJCJfAwA265fzA==
X-CSE-MsgGUID: s8w1NU3kQuONjYYQG8JYwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76081230"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="76081230"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:27:23 -0700
X-CSE-ConnectionGUID: hHsHpX+iQ9mN9VM5snX15g==
X-CSE-MsgGUID: ylERFZw2RIy3VV1vnJZkzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="231906524"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 02 Apr 2026 06:27:22 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id BA95495; Thu, 02 Apr 2026 15:27:20 +0200 (CEST)
Date: Thu, 2 Apr 2026 16:26:31 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: =?iso-8859-1?Q?Fran=E7ois?= Scala <francois@scala.name>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: altmode: Fix altmode to handle multiple
 parners
Message-ID: <ac5uh_3N3q61efIb@kuha>
References: <20260402120433.22967-1-francois@scala.name>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260402120433.22967-1-francois@scala.name>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35892-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,scala.name:email]
X-Rspamd-Queue-Id: B0DC3389D69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Thu, Apr 02, 2026 at 02:04:32PM +0200, François Scala wrote:
> From: François Scala <francois@scala.name>
> 
> The partner field in the altmode struct is a single pointer and the sysfs
> symlink uses a fixed name. This cause an error when a second partner is
> registered.
> 
>   sysfs: cannot create duplicate filename '/devices/platform/USBC000:00/typec/port0/port0.0/partner'

I think what you seeing here is either a bug in our ucsi driver, or
(more likely) a problem in the firmware.

> The field is replaced by an array of pointers and the symlink use the
> device name to avoid conflict.
> 
>   /sys/devices/platform/USBC000:00/typec/port0/port0.0/
>   lrwxrwxrwx 1 root root    0 Apr  2 09:12 port0-partner.0 -> ../port0-partner/port0-partner.0
>   lrwxrwxrwx 1 root root    0 Apr  2 09:12 port0-partner.1 -> ../port0-partner/port0-partner.1

No. You can not have more than a single partner per mode. Let's figure
out the root issue. Please check the svids of the partner altmodes:

        grep . /sys/class/typec/port0-partner/port0-partner.*/svid

Then provide the trace output from the ucsi driver, dmesg output
(full), and also acpidump of your system. The ucsi trace you can
get like this (assuming you have the debugfs mounted at
/sys/kernel/debug):

        cd /sys/kernel/debug/tracing
        echo 1 > events/ucsi/enable
        # plug-in your device
        # wait for a few seconds
        cat trace

For acpidump you need the acpica-tools installed:

        acpidump -o my_acpi.dump

thanks,

-- 
heikki

