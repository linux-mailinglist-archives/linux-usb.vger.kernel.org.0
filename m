Return-Path: <linux-usb+bounces-1989-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2547D1293
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 17:25:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 777561F23ABD
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 15:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 490A61DDC7;
	Fri, 20 Oct 2023 15:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AENinO4y"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBEA14285
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 15:25:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5E2DD5F
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 08:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697815499; x=1729351499;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=npVUPUUOhMBGZhgEL3b6DPBFLw/2y8lfzs3o6Y3qDQQ=;
  b=AENinO4y0iddAWTdXevaPS1kQdV1y9tgJILGEDO8qHDTtbFN1KCDUiao
   JiycCKJ1/4AC6zu1Yi4mQ37asSy/k7QvxjAGENoCNYHmndvJnribcsC1D
   Yy6R7eDfiz2oVfGuJr/XULk6HZRtIjI4iI6MjglM9K0lBd/9ciJzM5i8Z
   FSEQrwTTJLSY0SFieVay8Wq94Tvrm6Ga5ExHiamyJjFiXeHjcFRBRMN9M
   WoYbDfAx9AEhf3fweQFRQ8oRV4e4k9RLv6MvgrEDsc6VUhIxU8ZKcrgnb
   bkKRikkxoUgg41qRPNKZkQ7yYOGw45SAgp01OYbFgMcl6udbXhishZBvQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="417646303"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="417646303"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 08:24:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="901170404"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="901170404"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 20 Oct 2023 08:22:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 86408130; Fri, 20 Oct 2023 18:24:56 +0300 (EEST)
Date: Fri, 20 Oct 2023 18:24:56 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>
Subject: Re: [PATCH v2 00/10] thunderbolt: USB4 v2 asymmetric switching and
 more
Message-ID: <20231020152456.GB3208943@black.fi.intel.com>
References: <20231013120640.709255-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231013120640.709255-1-mika.westerberg@linux.intel.com>

On Fri, Oct 13, 2023 at 03:06:30PM +0300, Mika Westerberg wrote:
> Gil Fine (5):
>   thunderbolt: Make is_gen4_link() available to the rest of the driver
>   thunderbolt: Change bandwidth reservations to comply USB4 v2
>   thunderbolt: Introduce tb_port_path_direction_downstream()
>   thunderbolt: Add support for asymmetric link
>   thunderbolt: Configure asymmetric link if needed and bandwidth allows
> 
> Mika Westerberg (5):
>   thunderbolt: Use constants for path weight and priority
>   thunderbolt: Use weight constants in tb_usb3_consumed_bandwidth()
>   thunderbolt: Set path power management packet support bit for USB4 v2 routers
>   thunderbolt: Introduce tb_for_each_upstream_port_on_path()
>   thunderbolt: Introduce tb_switch_depth()

All applied to thunderbolt.git/next.

