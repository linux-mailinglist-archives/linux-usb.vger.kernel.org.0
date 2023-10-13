Return-Path: <linux-usb+bounces-1557-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E5D7C7D48
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 07:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3789B209F5
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 05:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1CF263B8;
	Fri, 13 Oct 2023 05:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OWrspikT"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218CA5693
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 05:55:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58574D9
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 22:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697176526; x=1728712526;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z7uWCw4mOxWFZWMvYd9pWRR+6yexveilScMX3PESAaY=;
  b=OWrspikTdV7gbMCPkxteCddW6ageO5UtW1VOtfv+SKxNeG1jyJRlUxWr
   UPWTIFwmZz4ZqZno4Xy60IqetBG+x3bf4h0+uf/rqgOYsQrUwujoO1BYJ
   2VBJ865s/3vJLPW1zb75yL8g07lSIyuSpnu0mwFs1SWkJZtCkW2x3yYT3
   XcJyuS7npfBhqtalDug0kNUu/S3GBnhoNjAzifKcYEGjLxnkky9QTyLwW
   SZauXadjxBrV029boTI/riWRF2zM27WR3yQpTEhIS3jM16hiojgRH9eXs
   eyFc/j9nh9mZ8TOM0yKxRtdMy8a8oZA9FB7drd+Y/WXX0QltzDrYnBQhG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="449299649"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="449299649"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 22:55:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="845306939"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="845306939"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Oct 2023 22:55:24 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id A2D5B666; Fri, 13 Oct 2023 08:55:22 +0300 (EEST)
Date: Fri, 13 Oct 2023 08:55:22 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>
Subject: Re: [PATCH 00/13] thunderbolt: DisplayPort and logging improvements
 & cleanups
Message-ID: <20231013055522.GS3208943@black.fi.intel.com>
References: <20231003094005.2676823-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231003094005.2676823-1-mika.westerberg@linux.intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Oct 03, 2023 at 12:39:52PM +0300, Mika Westerberg wrote:
> Gil Fine (5):
>   thunderbolt: Fix debug log when DisplayPort adapter not available for pairing
>   thunderbolt: Fix typo of HPD bit for Hot Plug Detect
>   thunderbolt: Log NVM version of routers and retimers
>   thunderbolt: Create multiple DisplayPort tunnels if there are more DP IN/OUT pairs
>   thunderbolt: Add DP IN added last in the head of the list of DP resources
> 
> Mika Westerberg (8):
>   thunderbolt: dma_test: Use enum tb_link_width
>   thunderbolt: Get rid of usb4_usb3_port_actual_link_rate()
>   thunderbolt: Make tb_switch_clx_is_supported() static
>   thunderbolt: Check for unplugged router in tb_switch_clx_disable()
>   thunderbolt: Fix typo in enum tb_link_width kernel-doc
>   thunderbolt: Use tb_tunnel_dbg() where possible to make logging more consistent
>   thunderbolt: Expose tb_tunnel_xxx() log macros to the rest of the driver
>   thunderbolt: Use tb_tunnel_xxx() log macros in tb.c

All applied to thunderbolt.git/next.

