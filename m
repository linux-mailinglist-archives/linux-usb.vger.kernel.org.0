Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F9AE516DCD
	for <lists+linux-usb@lfdr.de>; Mon,  2 May 2022 12:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384359AbiEBKDp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 May 2022 06:03:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384544AbiEBJ7G (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 May 2022 05:59:06 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5922213D65
        for <linux-usb@vger.kernel.org>; Mon,  2 May 2022 02:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651485156; x=1683021156;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LBUt2JpBReBDNa/dKnDzDxJuoYH7XVMUPCezeNcaCbc=;
  b=aCHgkilnFyjPCNbiHKROWZ9bE07ImBJ6cRtDHs618XQo78dQ1iDo4xyv
   /Xn7y+dz2KJ9OZQRQFedZ8462dPcYynin5VlwID3E9Vh4/F6ydCc+Vik3
   66NOrMUq5tAxRqslyI09GBy/zI/OXn6hDT9ktL/4k/4k3WZIrujoH+85Y
   CSiy/Gylz4kyxYja0iqpyRemchRMTPIQAqErpPU7hfNLTFnWu9fa+omi6
   +yqk392sW6gSOc4pYa7HVGhT4XHPALCePQIDJf670VGgOaPlIMTDD8Fpy
   7acfsc9rtDZS5T75ORwE5Xsq5PWxlmsN/SUxl35X8SDag+L2evT+DPwm9
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="249148064"
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="249148064"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2022 02:52:34 -0700
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; 
   d="scan'208";a="810154228"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2022 02:52:31 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 02 May 2022 12:52:19 +0300
Date:   Mon, 2 May 2022 12:52:19 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Gil Fine <gil.fine@intel.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH 2/5] thunderbolt: CLx disable before system suspend only
 if previously enabled
Message-ID: <Ym+p02MdXKkusMFR@lahna>
References: <20220501203321.19021-1-gil.fine@intel.com>
 <20220501203321.19021-3-gil.fine@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220501203321.19021-3-gil.fine@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Gil,

On Sun, May 01, 2022 at 11:33:18PM +0300, Gil Fine wrote:
> Disable CLx before system suspended only if previously was enabled.
> Also fix few typos.

Can you make that a separate patch?
