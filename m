Return-Path: <linux-usb+bounces-3341-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 914237F9E06
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 11:59:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1EB1DB20E63
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 10:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B8DD18C29;
	Mon, 27 Nov 2023 10:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="igN3vDDx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34827111;
	Mon, 27 Nov 2023 02:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701082758; x=1732618758;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=80De8qycEWjfHCnBb/Miiu/rgN7Tlt+pCnZshwbCFUQ=;
  b=igN3vDDx48vwnEeqbHZlT5GnpgDKPjctTxmaI1UOeVlMnJ75zp+PDZVW
   3CZjvSQA2NzZIYTF8axokEOlSc2WmESR0TvaZrLs4/2dSy3d0Zvxkst8C
   DO0ChWf8jBYIoiMUUPAIWdmJaNlwgHtJYx5XdthKHRakXTT/dOKqp1K/H
   0TNhmXbodwb1kwlQhsWafDyqlgXCKv3hMRYWEyFTUdOK5c6tx8fMamMMX
   cCkc1CdGSpnGL1DBibbvme+MTsfD0SU+46MGiHXoeu0LX4UlH0ug2WaiW
   4TwFZV9rT5Rs1TJiYEdC1zTfZ8PLYcic9dsFRJIRAijqTlzoic1ujjLiP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="5869179"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="5869179"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 02:59:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="859010494"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="859010494"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Nov 2023 02:59:15 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 834A82A2; Mon, 27 Nov 2023 12:59:14 +0200 (EET)
Date: Mon, 27 Nov 2023 12:59:14 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yaxiong Tian <iambestgod@outlook.com>
Cc: michael.jamet@intel.com, gregkh@linuxfoundation.org,
	andreas.noever@gmail.com, YehezkelShB@gmail.com,
	tianyaxiong@kylinos.cn, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt:debugfs:Fix memory leak with using
 debugfs_lookup()
Message-ID: <20231127105914.GL1074920@black.fi.intel.com>
References: <TYZPR01MB478461E6616835634D0718F8D5BAA@TYZPR01MB4784.apcprd01.prod.exchangelabs.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TYZPR01MB478461E6616835634D0718F8D5BAA@TYZPR01MB4784.apcprd01.prod.exchangelabs.com>

On Wed, Nov 22, 2023 at 04:02:43PM +0800, Yaxiong Tian wrote:
> From: Yaxiong Tian <tianyaxiong@kylinos.cn>
> 
> As Greg said,When calling debugfs_lookup() the result must have dput()
> called on it,otherwise the memory will leak over time.
> So just call debugfs_lookup_and_remove() instead.
> 
> Fixes: d0f1e0c2a699 ("thunderbolt: Add support for receiver lane margining")
> Signed-off-by: Yaxiong Tian <tianyaxiong@kylinos.cn>

Slightly modified the commit log and applied to thunderbolt.git/fixes, thanks!

