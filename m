Return-Path: <linux-usb+bounces-132-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0313A7A1BCC
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 12:11:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA2632824E4
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 10:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC94DF6F;
	Fri, 15 Sep 2023 10:11:02 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE64FD29A
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 10:11:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC4FE1BCA
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 03:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694772633; x=1726308633;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J6DGDjIxdlClHVfcBX8AN2zdhVrWWEME9J+HGI8b6Ig=;
  b=BQ8Nd4c1oAJnuQoTigSjfnuV2AogQR9PlpKYAGyV56PyydiqPGxYecZb
   NZsq9VVtisHfajfHhk8iTNCa0/VklrFEU7bvjEv/QZjTwFyqDAcyIuWnG
   idcGnoj4ld5F3IuiuS/kDokhTLclrgB7dGJh/4SSVuWQm3GBqVTfT73NC
   FKXhWsCalgpvUtvJLPfGJsDVREJl5G8YZAt+cTsTAVjAC+k6w2dLdB5F8
   qDOb9BmflST1SEedkDWn1mSYVhRptyL5ZEF/6EPkNeZa6q+GHwiY15Dr9
   e57fk90aYwpBc6t1jhGFXosAF7ZfPPlO0R1VgxLyoQcJ5ggmnQPgTK+SM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="381941823"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="381941823"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 03:10:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="918608666"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="918608666"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 15 Sep 2023 03:10:24 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 53BE98C9; Fri, 15 Sep 2023 13:10:23 +0300 (EEST)
Date: Fri, 15 Sep 2023 13:10:23 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Werner Sembach <wse@tuxedocomputers.com>,
	Konrad J Hambrick <kjhambrick@gmail.com>,
	Calvin Walton <calvin.walton@kepstin.ca>,
	Marek =?utf-8?B?xaBhbnRh?= <teslan223@gmail.com>,
	David Binderman <dcb314@hotmail.com>,
	Alex Balcanquall <alex@alexbal.com>
Subject: Re: [PATCH 0/5] thunderbolt: Couple of fixes and improvements
Message-ID: <20230915101023.GP1599918@black.fi.intel.com>
References: <20230911100445.3612655-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230911100445.3612655-1-mika.westerberg@linux.intel.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Sep 11, 2023 at 01:04:40PM +0300, Mika Westerberg wrote:
> Hi all,
> 
> This series contains fixes for various issues folks have reported and
> also a few not so critical improvements.
> 
> I was planning to take patches 1-3 through my fixes branch into v6.6-rc
> and the patches 4 and 5 to my next branch where they can sit some more
> time in linux-next until they go into v6.7.
> 
> Mika Westerberg (5):
>   thunderbolt: Workaround an IOMMU fault on certain systems with Intel Maple Ridge
>   thunderbolt: Check that lane 1 is in CL0 before enabling lane bonding
>   thunderbolt: Correct TMU mode initialization from hardware

Applied these to fixes.

>   thunderbolt: Apply USB 3.x bandwidth quirk only in software connection manager
>   thunderbolt: Restart XDomain discovery handshake after failure

And decided to apply this too to fixes. I think this is pretty major
problem if someone is using Thunderbolt/USB4 peer-to-peer.

The patch 4 went into next as that's pretty cosmetic.

