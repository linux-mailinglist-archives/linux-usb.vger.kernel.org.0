Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A93FE480720
	for <lists+linux-usb@lfdr.de>; Tue, 28 Dec 2021 08:53:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235435AbhL1HxR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Dec 2021 02:53:17 -0500
Received: from mga02.intel.com ([134.134.136.20]:20929 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235425AbhL1HxR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Dec 2021 02:53:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640677996; x=1672213996;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5TZVoB+V/tX3qFpJap/fHz9uXseltn3wjrQURaeshFg=;
  b=FKt+K2c4picFLcD0/aP5n8c68DC4uhuFarfzq2wo5F9nZZDgRndy9V0M
   jRqI0q+BguXWFVCalqUa+P3KL70qAL1i+2naoYdhC0xIIE4YsCKMIbMce
   1cSJVsSEFlQYiRHj+XOX8y5Ry/dLoeWZz5WnNi78gK7Zy7k87VNbC/6cp
   jC0FLVuJKgxuKSLaCPwGjTmPd+5I2gwojh79+iu4AzxW0S5D46HmjMAJM
   rPcoPILN4/9ed316xzp+l18sErcX3eMoY9AVysx3lzg2jfKNdjJVa9yN9
   GC425mrzt/y5E/k12ZKcxbsKypAfDgD3yhfczZQ5neVmplMen988vhvtR
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10210"; a="228633475"
X-IronPort-AV: E=Sophos;i="5.88,241,1635231600"; 
   d="scan'208";a="228633475"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2021 23:53:16 -0800
X-IronPort-AV: E=Sophos;i="5.88,241,1635231600"; 
   d="scan'208";a="524481772"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2021 23:53:13 -0800
Received: by lahna (sSMTP sendmail emulation); Tue, 28 Dec 2021 09:52:07 +0200
Date:   Tue, 28 Dec 2021 09:52:07 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Gil Fine <gil.fine@intel.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH v2 0/7] thunderbolt: CLx support for USB4 and Titan Ridge
Message-ID: <YcrCJ+WlUsqKFtsW@lahna>
References: <20211217011644.21634-1-gil.fine@intel.com>
 <YcMzwjicgQlDYljP@lahna>
 <20211227161344.GJ24036@ccdjLinux26>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211227161344.GJ24036@ccdjLinux26>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Gil,

On Mon, Dec 27, 2021 at 06:13:44PM +0200, Gil Fine wrote:
> Hi Mika,
> About latest patches series adding CL0s in thunderbolt/next.git
> 1.
> Attached fix for CL0s enabled check - w/o it, the CL0s enabling fails

Thanks, I folded this to patch "thunderbolt: Enable CL0s for Intel
Titan Ridge".

> 2.
> Maybe it is better not to mention "Intel limitation..." about the first-hop
> router since I am not sure this is correct. Attached patch w/ my proposal.

Well it is targeted only for Intel Titan Ridge so I think we can keep
it for documentation purposes :)

> 3.
> Don't we prefer to stay with the name: "tb_switch_titan_ridge_pcie_l1_enable" ?
> so that it is clear that the function is Titan Ridge specific?
> If so, sending patch for this

It works with any router (as it specifically checks for Titan Ridge
before going further), I think we can keep the name more generic too.
