Return-Path: <linux-usb+bounces-19812-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B47AA209AE
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 12:27:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4188188A15D
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 11:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93521A072C;
	Tue, 28 Jan 2025 11:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PNCB9jEk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B6219EEC0;
	Tue, 28 Jan 2025 11:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738063649; cv=none; b=rNtDm9j7vfngFMYGbScQvWfKpZPThQ8lTymG22A48obb/wS9mKC/sX6GSUNL1ypYqsjxr46zABO7+oDWMQWJR6NE3cUNI3VF9W8WIEgLCCfBwV/RljFAN7lV8psVI8Mjm5Qu5WpOr4jLV9601Dh2bT/1HONA1nGOJKTz64h/TPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738063649; c=relaxed/simple;
	bh=YHpocDv2mcARG4XfcT+wsAGbMutkeQKxjw1/zAWHynY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I2+2fBJ8mh8YUhr42nyfHbxybJ0TSmuLFYx4SOmlpDA1w2oXNR49mDPyGZ7FwIzFNYmEu+8hNUx+1BEh1k1Y7l03SNEbD5CQbQKSgfByV3o63qN39YfJBXSIH9l+RIlUwRKuLifDfge/FuaPCUfwihIOhQ/sxvEp2aaJybpVH3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PNCB9jEk; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738063648; x=1769599648;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YHpocDv2mcARG4XfcT+wsAGbMutkeQKxjw1/zAWHynY=;
  b=PNCB9jEk5Svx/PypwJvsgOol39YTAfJZYe98GXJZCFSu76tCCki5cK8w
   ibdIfAu3g/7kVnGSzNvbFN6fNQwEdcbqTRhPAeluIKSozFhW7bUZW2E5b
   NxEdWLldR9tXyCH4UvMuL9FzIaOt+joct20YBTtDXwuzZmhruWV6CRvrJ
   +JGY0EL9nQbGcJrg1JlQEGhJ0UBfAwoldcuIchayrSez0ZjJ8aOSFFhCC
   ygQIFngLs55xv99rnT7Z8fQVxsyVVdooJIWhORiKwCtrmeeD8+siXTacf
   tpfB46u993g94Ri8tiLI8zVNyjJw17k1o844U6+NdYBaNnvJO3wLEPdTl
   w==;
X-CSE-ConnectionGUID: LZQX6eStQ8mTBK0moOhi0Q==
X-CSE-MsgGUID: l9mvDLgsReKXqMqBtjhvRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="63904543"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; 
   d="scan'208";a="63904543"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 03:27:27 -0800
X-CSE-ConnectionGUID: rvqwxV4OR/aK0E7NZE3YTg==
X-CSE-MsgGUID: CnvWH1/zR+qHAH4IhiySTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; 
   d="scan'208";a="113756615"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 28 Jan 2025 03:27:24 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id D216D1AC; Tue, 28 Jan 2025 13:27:22 +0200 (EET)
Date: Tue, 28 Jan 2025 13:27:22 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [RFC v2 29/38] docs: thunderbolt: Allow creating
 cross-references for ABI
Message-ID: <20250128112722.GS3713119@black.fi.intel.com>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
 <3895db4d11575b2d3e98b066a35498aeadf749dd.1738020236.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3895db4d11575b2d3e98b066a35498aeadf749dd.1738020236.git.mchehab+huawei@kernel.org>

On Tue, Jan 28, 2025 at 01:06:18AM +0100, Mauro Carvalho Chehab wrote:
> Now that Documentation/ABI is processed by automarkup, let it
> generate cross-references for the corresponding ABI file.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Looks good to me,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

