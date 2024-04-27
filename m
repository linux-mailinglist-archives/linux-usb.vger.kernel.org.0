Return-Path: <linux-usb+bounces-9853-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9978B4439
	for <lists+linux-usb@lfdr.de>; Sat, 27 Apr 2024 07:08:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE59E1C221EA
	for <lists+linux-usb@lfdr.de>; Sat, 27 Apr 2024 05:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 999073E47F;
	Sat, 27 Apr 2024 05:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H1g5Ozcf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707A539ACD
	for <linux-usb@vger.kernel.org>; Sat, 27 Apr 2024 05:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714194486; cv=none; b=ckGN4bY0yk961RL7SqmUrGvBLWR4qkpPCWHOyVA5BrNY0JQdzTJw+Ev/Fv/W+NehnC9dU2KWTmmgrw0yTeMd7XNHbVGgTDwymaYqcJULWHdgQfjs41ZB4WmqEENzKBncGC7xqX+UKH6JjUaNVU4XVDOi2hYYrrHfhmQu37wXGi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714194486; c=relaxed/simple;
	bh=H6tZFzBJEvKPhlW/fLYwF7Eh6nyn6owuwe3o4dpfg9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQcPJHRuCk1Mywq4mA0/txw0Dos6J/1tISTByGj2ktuZN5rfp97UUzANsQFzcYMMYQNXv95YoZHzftupAt3y/4FtvHEwOBU/qdx3xhjo5VUjtLPxms3Z71/VtdBjimc2Mi9CF9tCYR7QLMEsj+lpuXMpbQTREeQ7F/WJ6PRVYpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H1g5Ozcf; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714194484; x=1745730484;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H6tZFzBJEvKPhlW/fLYwF7Eh6nyn6owuwe3o4dpfg9U=;
  b=H1g5OzcfAXlAGvAeUE7hzFeElzutX0kT3qPSYSa/0a+wG8tX+AxczArE
   ldwGd7gK9IC/UQTiqpa/8SbrN4aLhRkwSItmnbHVVWix0W8HSmigywrjo
   ZE49Eu1bql6kpNYN2yFRhd08SeK2woEkymp5rl72SN8naxGZ8iR21erDK
   284DL9WjgHHlu0vGz30G2rHffih9DCxyXtBXc3uHBFRROYcGjdANIdXWL
   BrCRHobKEgkAuFakjIoQ9KAAx/TjE210muzDTzpJZoH3dgsKh/bnnTPpY
   gTJOX8bbSYqdoAr1VzALttfMoRNCgC6IQuotG/32JwEtsNzV5JcsSWzs3
   A==;
X-CSE-ConnectionGUID: USyXNumtTt2HuqK9I5A21Q==
X-CSE-MsgGUID: s6cr9jLGSmuqZBwl+cyCQA==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="27453356"
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; 
   d="scan'208";a="27453356"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 22:08:04 -0700
X-CSE-ConnectionGUID: K4WNn1yFS1aq7XddmVQKnA==
X-CSE-MsgGUID: Bg1DtsipRD6lATLykqBcew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,234,1708416000"; 
   d="scan'208";a="56527372"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 26 Apr 2024 22:08:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id BFAF4329; Sat, 27 Apr 2024 08:08:00 +0300 (EEST)
Date: Sat, 27 Apr 2024 08:08:00 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Gil Fine <gil.fine@linux.intel.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com,
	YehezkelShB@gmail.com, gil.fine@intel.com,
	linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH] thunderbolt: Fix kernel-doc for tb_tunnel_alloc_dp()
Message-ID: <20240427050800.GB3969176@black.fi.intel.com>
References: <20240425233754.3510505-1-gil.fine@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240425233754.3510505-1-gil.fine@linux.intel.com>

On Fri, Apr 26, 2024 at 02:37:54AM +0300, Gil Fine wrote:
> In case of no bandwidth available for DP tunnel, the function get the arguments
> @max_up and @max_down set to zero. Fix the kernel-doc to describe more
> accurately the purpose of the function.
> 
> Signed-off-by: Gil Fine <gil.fine@linux.intel.com>

Applied to thunderbolt.git/next, thanks!

