Return-Path: <linux-usb+bounces-2876-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D355F7EAFC1
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 13:22:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63404B20A84
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 12:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C8443FB0A;
	Tue, 14 Nov 2023 12:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k0cFwMG9"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E793E47D;
	Tue, 14 Nov 2023 12:22:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C157C130;
	Tue, 14 Nov 2023 04:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699964540; x=1731500540;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=83oVHOMWmo585ZtLA1OZ4XOOSq7Vg/fHO3TUuPuK0GU=;
  b=k0cFwMG97mv084oKamncnPK9pEm4cTpTxAiidTzJEkZuVRwLbrdr2nHY
   rQabH8EDlgzMWMUEj4Eml+ZBE+9S1PYSr8Cg47c5tNN6Iif2fB31MF8aF
   xjsAtRr53Kh8flQKl3tIMcbquOPk9JJSF4LqeAlo5q9fL1oiDp4T/OQ8I
   +zgD5GrfZ1nZsr2Y4u70zKugKrKJVZ5JPLoJz9THHZi7tGrlEHCgUfZ8m
   pgm/xfTp/yiKZ2nlQibT4LnD5wPZUBIzWOA6FrSnEb4/jriFQ9gvuEL7S
   zQqLg2jAabWtC+bnjG4Y7HsTJ03BNSZLimVyq5DFHZ2WnfT0jEX1aDhit
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="9283010"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="9283010"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 04:22:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="938075811"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="938075811"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 14 Nov 2023 04:22:17 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 0B0AF5E2; Tue, 14 Nov 2023 14:22:15 +0200 (EET)
Date: Tue, 14 Nov 2023 14:22:15 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] thunderbolt: remove duplicated re-assignment of
 pointer 'out'
Message-ID: <20231114122215.GX17433@black.fi.intel.com>
References: <20231111201543.338893-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231111201543.338893-1-colin.i.king@gmail.com>

On Sat, Nov 11, 2023 at 08:15:43PM +0000, Colin Ian King wrote:
> The pointer 'out' is initialized and then a few statments later being
> re-assigned the same value. The second re-assignment is redundant and
> can be removed.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied to thunderbolt.git/next, thanks!

