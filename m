Return-Path: <linux-usb+bounces-12874-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D454945852
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 09:01:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1D0C287B0D
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 07:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A63C43ADE;
	Fri,  2 Aug 2024 07:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XCGWgeFe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E26DDD9
	for <linux-usb@vger.kernel.org>; Fri,  2 Aug 2024 07:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722582084; cv=none; b=kFUeKYakrdoNJK1A75gjwpyAbLWl1RQYE1aRPXiXnc+dECH8Vdm0/IRFa0Hs6aILXkAhlfIba8NFS0metLIAIFB5m95uzZ67FjbpOY7PgSNu394NCsimsiqIXy90EpWfsA0bofLskw7A8K0ds9leBT6DbnvWB16WQMvSq2JYSd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722582084; c=relaxed/simple;
	bh=rghX1ZVmIrE1phMsjaFrDWnPveP12Eo3tMOkhZAafe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g3DHqLc64mgvMnH9NcEmfuMxU1DXFrs32JZjD/VX5gv/ASPYAM+RMAI9aa0Gru+PTRA1ckODBnRoXTHgynPNzdgsCg6o9Bbjgfejq4G6RePpWS7VJxDUDy47Z3FMqr3MseUcrPuR/FjfhEmyZb8DGA/uaKkCjQj/ox7nuqBQ15I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XCGWgeFe; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722582083; x=1754118083;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rghX1ZVmIrE1phMsjaFrDWnPveP12Eo3tMOkhZAafe8=;
  b=XCGWgeFelQPaacTtFMNjS9aQMoxsEGdPbiMyOhndrCfAF8GQywmaatuZ
   b74mlblph5EoDc1EkFHjg/1jYqfUkzweaN7TKScIik5zIDyKoZG4PiDzq
   25T0hliJ5eVYq2Bc9RqFNX4Q++qigI1dzAdpm7T/FcB2qrGMnEHmnqCIa
   Lch+Olov1o7CCEzQ9UchjMnRtSeqRvUMWSxtHl/F5ThfWp0lvJkl56ERu
   FRqcAZG4GSGu5As9yH51FqQ7V5vUFwYQTfIURp+DegKP+V9lWHMEM6qU2
   dK4gXwb3e2gaE2AAEeNzT9LVrgjtosp6HLgXBK93KS0T1lV2F+govaEMd
   Q==;
X-CSE-ConnectionGUID: jRLhK/MAS3e2njeUavRO8w==
X-CSE-MsgGUID: N2wMmHtJSduGKjI724oF/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="31984938"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="31984938"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 00:01:22 -0700
X-CSE-ConnectionGUID: svH1aMhHQqOTizwvfhitIg==
X-CSE-MsgGUID: OKWnlys+TgOG8WywrxA0sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="54969866"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 02 Aug 2024 00:01:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 9AD531F2; Fri, 02 Aug 2024 10:01:08 +0300 (EEST)
Date: Fri, 2 Aug 2024 10:01:08 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: Aapo Vienamo <aapo.vienamo@linux.intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Fix memory leaks in
 {port|retimer}_sb_regs_write()
Message-ID: <20240802070108.GV1532424@black.fi.intel.com>
References: <20240731091536.964112-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240731091536.964112-1-mika.westerberg@linux.intel.com>

On Wed, Jul 31, 2024 at 12:15:36PM +0300, Mika Westerberg wrote:
> From: Aapo Vienamo <aapo.vienamo@linux.intel.com>
> 
> Add missing free_page() call for the memory allocated by
> validate_and_copy_from_user().
> 
> Fixes: 6d241fa00159 ("thunderbolt: Add sideband register access to debugfs")
> Signed-off-by: Aapo Vienamo <aapo.vienamo@linux.intel.com>
> Reviewed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/fixes.

