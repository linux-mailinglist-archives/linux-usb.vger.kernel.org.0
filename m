Return-Path: <linux-usb+bounces-1127-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A91787B9D99
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 15:51:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 578AC282253
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 13:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D41E273DE;
	Thu,  5 Oct 2023 13:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hCMswHYv"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47E026E1E
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 13:50:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5BA51BFF
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 06:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696513801; x=1728049801;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r4zSMdv2D0l/K4htRYiDWAf7oxWqMxKtQD3xWfbuLlM=;
  b=hCMswHYvE0vGW8co+UEdkACH69V2qs0YekKOcAiFcKi/+0qRMdmwxUg5
   tE8pOsyQhstamiXKYAQrnzjqqPRrmrkZIFHrTrFStSIaM8uzI5uaQEgqc
   jOEc7cNh/+s7rP8cuNLNMb5pmlTMQGB9XeTJmND5kE4bal3Qf3jY784mp
   SiKD/NYF6EPOdpEZYbhE/yB1JXCi2QVpRe4HUPMU17xHIbgPmDEO5czbB
   bDFIifKnGYDiinET2IhMtz634x83hWOcz914yAIAc2hhcsJQsI6TFy01o
   cmU/DyeCEXPij81ZN8BMfELskkUNQeUHOUtNxxljnlOuAsLF8TF3x3qN6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="383353487"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="383353487"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 02:14:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="728365953"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="728365953"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 05 Oct 2023 02:14:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id EECDA35A; Thu,  5 Oct 2023 12:14:11 +0300 (EEST)
Date: Thu, 5 Oct 2023 12:14:11 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>
Subject: Re: [PATCH] thunderbolt: Call tb_switch_put() once DisplayPort
 bandwidth request is finished
Message-ID: <20231005091411.GR3208943@black.fi.intel.com>
References: <20231003092302.2672156-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231003092302.2672156-1-mika.westerberg@linux.intel.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Oct 03, 2023 at 12:23:02PM +0300, Mika Westerberg wrote:
> From: Gil Fine <gil.fine@linux.intel.com>
> 
> When handling DisplayPort bandwidth request tb_switch_find_by_route() is
> called and it returns a router structure with reference count increased.
> In order to avoid resource leak call tb_switch_put() when finished.
> 
> Fixes: 6ce3563520be ("thunderbolt: Add support for DisplayPort bandwidth allocation mode")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/fixes.

