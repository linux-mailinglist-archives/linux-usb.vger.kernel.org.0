Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72124527FC1
	for <lists+linux-usb@lfdr.de>; Mon, 16 May 2022 10:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241767AbiEPIe2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 May 2022 04:34:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241769AbiEPIe0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 May 2022 04:34:26 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6282E0AC
        for <linux-usb@vger.kernel.org>; Mon, 16 May 2022 01:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652690064; x=1684226064;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L7oasj7FVQzcfjoOaRhoEj5BOikipfC4bJbWU4Srrjs=;
  b=fMetpKMyHU+fmOJLhWyLBBnyECDEG0kFetdNK7z9oR6S8FNWIp0p+mud
   bYIcOVCgI5JL2WqKzGd4LJkDvZN+L/6KaTa6LTnJbpUN70xzFE962nCbl
   xkjsQHDjK51FtG2peSaYTGA/ZDdwyZhXRaGOD/akOUrQbrYUUOdU2IGLH
   2H69oPe1GaOt+i1BpXKQ2d7jfY41SiNcGZO7TgkUptTZu5/hCbsTnQ2Cw
   VjmBU6rx9igEaIjCYE3s7fWg82M6ui6vvVraipEtixcOnYJPJZ1g2qXsS
   zBi/CcbrekJlmFhO/jtGSUvIh47r5Fy9lJVYC+wt38ZxRCagS2TJwTXNa
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="258340744"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="258340744"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 01:34:22 -0700
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="741142049"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 01:34:19 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 16 May 2022 11:34:15 +0300
Date:   Mon, 16 May 2022 11:34:15 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Gil Fine <gil.fine@intel.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH v3 6/6] thunderbolt: Change TMU mode to HiFi
 uni-directional once DisplayPort tunneled
Message-ID: <YoIMh0Di7QtALQ/Z@lahna>
References: <20220511140549.10571-1-gil.fine@intel.com>
 <20220511140549.10571-7-gil.fine@intel.com>
 <Yn4qld89AVEd3cRD@lahna>
 <20220515202746.GA8368@ccdjLinux26>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220515202746.GA8368@ccdjLinux26>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Gil,

On Sun, May 15, 2022 at 11:27:46PM +0300, Gil Fine wrote:
> > > +int tb_switch_tmu_config_enable(struct device *dev, void *data)
> > 
> > Also can we please make it take some real type and not something
> > arbitrary?
> You mean the names, right?
> Something like:
> int tb_switch_tmu_config_enable(struct device *parent, void *rate)
> If so, yes, I will

I mean use a real type, not void *.

> > 
> > Can it be const too?
> IIUC, it shall be a function pointer with specified signature otherwise it will fail
> at compilation

Okay then I suggest to make a reasonable "API" function that handles
all this internally that does not take arbitrary pointers. Remember to
document it in kernel-doc too.
