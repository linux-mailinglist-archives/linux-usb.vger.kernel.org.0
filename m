Return-Path: <linux-usb+bounces-33038-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFVLCQLJgWl1JwMAu9opvQ
	(envelope-from <linux-usb+bounces-33038-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 11:08:02 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9261FD7501
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 11:08:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C646301D32F
	for <lists+linux-usb@lfdr.de>; Tue,  3 Feb 2026 10:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A8339C638;
	Tue,  3 Feb 2026 10:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NW/Qs7zF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8513D394465;
	Tue,  3 Feb 2026 10:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770113277; cv=none; b=uSWbz/3pMH8i2ESzPcC+ysPO25KfjPAexC6Af1wYURrjSudtTUwlL5tmYEQt221cxkjvsM50BvG5zwANm4STcC6Mc4slRCARmeEBVyq9DEk+i4aBvlrZsV0nT1ORiBznS1j5AFzUfrYZED4IrRXkn4GVUfk9Wol3W+gHAEHAs9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770113277; c=relaxed/simple;
	bh=vCGyuChu7M/9n3Xwfqbi+FG81rb5OOAjyYN1EVw9aTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYVIv7TRDXn8DMW5tiv6gbiKJcPG84bmJ6eO+vxqAsiu7TRv7NFG68IN+G4wpKuwQosI8+xe2x1Kv5fpSEWu27SYop2Mjm3JnP0VDXmO9Qqs6R55L/cO4EX+8gDCH1HdSgN8sCydUaKudzxhzb2o/7HOzNasKo1S7oOU8tFdDpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NW/Qs7zF; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770113276; x=1801649276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vCGyuChu7M/9n3Xwfqbi+FG81rb5OOAjyYN1EVw9aTQ=;
  b=NW/Qs7zFtjC2+F6yFhqDrhGO4CGVO9DD0xzSa81jj9bLp/Nr/ZiJAxj6
   jBPDWdGuC8R6dGRdOk4uqSQf2dWyAkjdY0/WWSmQwxgra3YGy1KTmJ0s/
   eE1pnzRA6cLRH6oMhTvbrF9yApBIN1XrPhb7JgkVYh+14CnvmLObE7xKJ
   8zhqVSQjehV4tVJblMbWUCfYd2hAmzsd+ylXnHuXrm9XcslyfONZzjlzU
   qU3JFWhC5dQtgOHBNZLOR+Tl3BgBF7HYM9XD9TUwh4Cc8BaQnoA+9n6Fk
   C4XA7oTY/SrG/7X6EWHb0/ERKnv2lgIwA6yzS0wT5U7eVOV7mrHGmhoNL
   A==;
X-CSE-ConnectionGUID: 1RUpoz7MQlqrv5jxU8lovg==
X-CSE-MsgGUID: 3HiAZ0BMSzKmXqWXqmk/VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71187118"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="71187118"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 02:07:56 -0800
X-CSE-ConnectionGUID: iU/NNIUSSEqgV0MgBrPj3Q==
X-CSE-MsgGUID: aNRk9T9jQR6bcD8YUB4F5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="209536001"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 03 Feb 2026 02:07:54 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 970D595; Tue, 03 Feb 2026 11:07:52 +0100 (CET)
Date: Tue, 3 Feb 2026 11:07:52 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Jayi Li <lijiayi@kylinos.cn>
Cc: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Gil Fine <gil.fine@linux.intel.com>
Subject: Re: [PATCH] thunderbolt: Fix PCIe device enumeration with delayed
 rescan
Message-ID: <20260203100752.GF2275908@black.igk.intel.com>
References: <aXcWNw9Qfo5L9WVi@acelan-Precision-5480>
 <20260126115654.GS2275908@black.igk.intel.com>
 <aXg1eBudRAaCZpmR@acelan-Precision-5480>
 <20260127084513.GC2275908@black.igk.intel.com>
 <20260127101701.GI2275908@black.igk.intel.com>
 <aXrZK-WigVeqxBTT@acelan-Precision-5480>
 <20260129065003.GS2275908@black.igk.intel.com>
 <cd006977-513f-43d6-9238-1b9f39313976@kylinos.cn>
 <20260203093957.GD2275908@black.igk.intel.com>
 <087dcbe3-ad68-4f45-877b-8f78721efa4b@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <087dcbe3-ad68-4f45-877b-8f78721efa4b@kylinos.cn>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[canonical.com,gmail.com,kernel.org,vger.kernel.org,linux.intel.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-33038-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,black.igk.intel.com:mid]
X-Rspamd-Queue-Id: 9261FD7501
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 06:00:06PM +0800, Jayi Li wrote:
> > > I'm not sure if this is relevant to this issue, but sharing just in case.
> > Thanks for sharing!
> > 
> > It could be. What device this is?
> The device is Targus DOCK221.

Is the host Intel or AMD (well can you share bit more details about the
topology)? Then if you block runtime PM of the PCIe Downstream Port that
leads to the TB3 device like:

 # echo on > /sys/bus/pci/devices/DEVICE/power/control

Does it work?

