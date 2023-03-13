Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE52E6B7366
	for <lists+linux-usb@lfdr.de>; Mon, 13 Mar 2023 11:06:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjCMKGg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Mar 2023 06:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjCMKGf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Mar 2023 06:06:35 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54FF8457EA
        for <linux-usb@vger.kernel.org>; Mon, 13 Mar 2023 03:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678701993; x=1710237993;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3Hs7unokPairClzUtG01l/r4ibh4ojj4NSC0hoK2fT8=;
  b=JbAj2ZYql5IyVjJuXpHHyf3Goh0wVuXhDD7nORPAMqw250IPeexZKegE
   k8DH4TCh0aQTxQvrZcerIZ77fujNHyL8QisJG73IIjrsch5KYaPi41Xc3
   u8hyBj9wFnzHv4OX+ufDBD7d6SjOAgY152oGf0tCoJ/IQ2j4Z2MbenpBF
   Y/mfxt2uWaFHGEgnBlrrnyeRwcXsHI6G6BliU7VJb+0Utng6R2B2Ggok3
   u+bTly3lvPmfeW3tIqRsiDyGj5QzZPJBMF/BllDIT5sBaBArWrKWCNeFR
   0mpW47AybcW2X/zDJS8glfXyMqU0fgIKIU4b8zIW9fgUEcX0mBMs75t/m
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="334585448"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="334585448"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 03:06:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="711071874"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="711071874"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 13 Mar 2023 03:06:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id D9F29163; Mon, 13 Mar 2023 12:07:00 +0200 (EET)
Date:   Mon, 13 Mar 2023 12:07:00 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Christian =?utf-8?Q?Schaubschl=C3=A4ger?= 
        <christian.schaubschlaeger@gmx.at>,
        Gil Fine <gil.fine@linux.intel.com>
Subject: Re: [PATCH 0/5] thunderbolt: A couple of fixes
Message-ID: <20230313100700.GF62143@black.fi.intel.com>
References: <20230306113605.46137-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230306113605.46137-1-mika.westerberg@linux.intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 06, 2023 at 01:36:00PM +0200, Mika Westerberg wrote:
> Hi,
> 
> This series includes a couple of fixes for issues found. I'm planning to
> get these into v6.3-rc.
> 
> The first one is a memory leak fix.
> 
> The second one is fixing a reboot time issue reported by Christian that
> we finally were able to reproduce in the lab. The reason this happened
> only in Linux is that we enumerate retimers during link bring up and
> there is certain step missing after the enumeration that leads the link
> to not come up properly after soft-reboot. This should be fixed with
> issuing UNSET_INBOUND_SBTX after retimer access and this works in the
> lab.
> 
> @Christian, can you check that it solves the issue for you too?
> 
> The third one is a quirk that is needed for Intel hardware to limit the
> USB3 bandwidth accordingly.
> 
> Gil Fine (2):
>   thunderbolt: Add missing UNSET_INBOUND_SBTX for retimer access
>   thunderbolt: Limit USB3 bandwidth of certain Intel USB4 host routers
> 
> Mika Westerberg (3):
>   thunderbolt: Fix memory leak in margining
>   thunderbolt: Call tb_check_quirks() after initializing adapters
>   thunderbolt: Use scale field when allocating USB3 bandwidth

Fixed the typo reported by Yehezkel and applied all to
thunderbolt.git/fixes.
