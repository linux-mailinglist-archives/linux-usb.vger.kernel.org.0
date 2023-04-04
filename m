Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 147476D61CB
	for <lists+linux-usb@lfdr.de>; Tue,  4 Apr 2023 15:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234786AbjDDNCc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Apr 2023 09:02:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234694AbjDDNCY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Apr 2023 09:02:24 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A648635AC
        for <linux-usb@vger.kernel.org>; Tue,  4 Apr 2023 06:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680613343; x=1712149343;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jl26p0uLy5pGyQg+PBiK7/Htqnr8oujJZAhkydb1DXw=;
  b=JBBOZJ6S0YEjFeJvCKOVX0eXto3dVa2eUe3EUE6o4L01nSRcN7BL6i6c
   ZWecVEZO8bYHPiKRY09iQw+ykLyh0lH7bFKOzKe+dgImZ8qPHSFZ8TDth
   glgIQXtfEY1dfn1jZ2D/FxCSb9zVL/KgFLRadScUfP8S1vyj7k8mBXiQn
   4+0du4Tp8WTfH1WuOvFueHpaJ5h0YrNqf3ezti3QjC6eHw7c7zrOvi7Gy
   FmVemrzWxRo5dpuH83ZPBNKX+PQnZ2SA+FxkQj2x6rL4tw5jq5/Y1jS8R
   rCa9RjvtaH9bla0JxCEvWeuNRnKAXSbbHgAkhOMlsY5bT6tIbLmvWjNrM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="339660955"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208";a="339660955"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 06:02:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="829969606"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400"; 
   d="scan'208";a="829969606"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 04 Apr 2023 06:02:19 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 04 Apr 2023 16:02:18 +0300
Date:   Tue, 4 Apr 2023 16:02:18 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Samuel =?utf-8?B?xIxhdm9q?= <samuel@cavoj.net>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: introduce read_explicit operation
Message-ID: <ZCwf2rvsoFjH5D91@kuha.fi.intel.com>
References: <20230120233920.752245-1-samuel@cavoj.net>
 <Y8uRnc3Cxb1ADad6@kroah.com>
 <Y8+/Lgp7fWaxFsri@kuha.fi.intel.com>
 <ZAi1KO+WUs+9nNOn@kuha.fi.intel.com>
 <ZBMUsweZjfqxZJdc@kuha.fi.intel.com>
 <c5223adc99dd9bf849071e8fdfed4bb1@cavoj.net>
 <3ae633095973c747baea1a23f3b7f6f4@cavoj.net>
 <ZCWXZ1KwzYeSdJhv@kuha.fi.intel.com>
 <3525bf85c78a5805c4b4bff42dd49c39@cavoj.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3525bf85c78a5805c4b4bff42dd49c39@cavoj.net>
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Sam,

On Sat, Apr 01, 2023 at 08:06:57PM +0200, Samuel Čavoj wrote:
> > 
> > Okay... Did you see those errors with your original patch?
> 
> I'm pretty sure that it's the same, yeah. The specific error is
> one (or a seemingly random sequence) of the following:
> 
> - con2: failed to register partner alt modes (-22)
> - con2: failed to register partner alt modes (-5)
> - GET_CURRENT_CAM command failed (also caused by a -22 from exec_command)
> 
> Doesn't occur with nothing or only a charger plugged in. Once I plug
> a USB-C to DP adapter or a cheap USB-C hub (with an internal DP->HDMI
> converter, USB3 hub and GbE in one of the hub ports), the errors
> randomly show up when reloading the module or when plugging in once
> already loaded. Not consistent at all.
> 
> So seems to be alt-mode related. Will probably need some more
> investigation on my part, unless you've got any ideas off the
> bat.

The alt mode stuff is very annoying with UCSI. I think Windows is only
interested in the connector alt modes. With the partner alt modes the
responses differ on almost every system, and several platforms
actually never return anything when you request the partner alt modes
with GET_ALTERNATE_MODES.

But I think we can move forward with this fix. I'll send it tomorrow.

Br,

-- 
heikki
