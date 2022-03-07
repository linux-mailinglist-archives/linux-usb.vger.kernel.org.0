Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A5BD4D002E
	for <lists+linux-usb@lfdr.de>; Mon,  7 Mar 2022 14:36:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242647AbiCGNhG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Mar 2022 08:37:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232918AbiCGNhG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Mar 2022 08:37:06 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FB737D028
        for <linux-usb@vger.kernel.org>; Mon,  7 Mar 2022 05:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646660172; x=1678196172;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4FAPk6SSza2GNELGXO6GZK3HwiOlSRBVCNzLI8qsGa0=;
  b=RCiZOJtMHXFsA2e1BsXOdTKrw4LiiQYZlbreYSOC3K1GfM5R+S97NnNW
   jR4WWPLVdr9M2w61Yg55DR8Pue/yLk0IZXUHb6/N87cIth+Nq1SqXkPj7
   IisflPUiwUtd6h9ZL/7tyIzvS00tqbVJUXecKocRXjfer6NR94BUcqmIt
   wKgwjSn8tiG7ohYpNuHbo5lWUwwL/L72pDwHgHu7YeR/40E/Xy8FDJtLX
   IWCOeL0iVBCF/A4/AH701yj0RhTF9OIwCVsmUlaNNd4Gvr/fWUjLXQ5BU
   qXN9C73En35U/TwBl+Uf+XIfu0O2hAimkQQPWv1b6+0BghCu9V7eKGYqT
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="254327372"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; 
   d="scan'208";a="254327372"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2022 05:36:11 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; 
   d="scan'208";a="711105884"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2022 05:36:08 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 07 Mar 2022 15:35:01 +0200
Date:   Mon, 7 Mar 2022 15:35:01 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Basavaraj.Natikar@amd.com,
        mario.limonciello@amd.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: handle runtime pm for tunnelled pci root
 port
Message-ID: <YiYKBe7ogL5uacWt@lahna>
References: <1646658319-59532-1-git-send-email-Sanju.Mehta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1646658319-59532-1-git-send-email-Sanju.Mehta@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Sanjay,

On Mon, Mar 07, 2022 at 07:05:19AM -0600, Sanjay R Mehta wrote:
> From: Sanjay R Mehta <sanju.mehta@amd.com>
> 
> Carry out runtime-resume of PCI tunnelled root port to handle
> hotplug interrupts synchronously.

What problem does this solve?

Typically the root ports should be able to wake from D3 when the PCIe
tunnel gets established. Is it not the case here?
