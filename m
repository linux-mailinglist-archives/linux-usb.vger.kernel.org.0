Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF906B0E68
	for <lists+linux-usb@lfdr.de>; Wed,  8 Mar 2023 17:18:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbjCHQSL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Mar 2023 11:18:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231292AbjCHQRv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Mar 2023 11:17:51 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E21FB952A
        for <linux-usb@vger.kernel.org>; Wed,  8 Mar 2023 08:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678292267; x=1709828267;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kLfHFrQbdMZ5Df/XH37DdO2/imCTJ0yMvtnKV8/8NxU=;
  b=NO3hEyIMhf1axIop6bWDEsbvEkstA43ubaYNfczbp3siQGh3c9IuuMA7
   5iDnIct4+A00mY6YMXYF6ursoaqNtS6bfq3s5rdW1HnTN5/bu6JTRL2g4
   L1YkL3ieOY3/i7C6CUZ2seqtMm8Faup4FIZ3fDyEjLdDzchwewCZYOQfB
   7m8nraKzWANqFR/ELPEAjOWEAnrfDCeKlHzQ/JfY8xWYtSc0nYCyFtkXP
   wVtfde/1e9DpjDASSywdHTwPlIJiwN6WErIAMftr4zfMtMQwvFrsx/Oo0
   WpkYu4OqPTLzzXj6iSMDXccYbCXdFwUyxQOwdXUksOV02eaK9cXpCJRVX
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="422469709"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="422469709"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 08:17:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="820285233"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="820285233"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 08 Mar 2023 08:17:45 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 08 Mar 2023 18:17:44 +0200
Date:   Wed, 8 Mar 2023 18:17:44 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Samuel =?utf-8?B?xIxhdm9q?= <samuel@cavoj.net>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: introduce read_explicit operation
Message-ID: <ZAi1KO+WUs+9nNOn@kuha.fi.intel.com>
References: <20230120233920.752245-1-samuel@cavoj.net>
 <Y8uRnc3Cxb1ADad6@kroah.com>
 <Y8+/Lgp7fWaxFsri@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8+/Lgp7fWaxFsri@kuha.fi.intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Samuel,

> I asked that Samuel to share this here, but perhaps we should consider
> it still as an RFC. I have tested this with some of my platforms, but
> I want to test more.

Sorry about the slow progress, but this is causing commands to fail on
some platforms. I've been trying to figure out how to fix those, but
nothing has worked so far.

I think we have to handle this with a DMI quick in ucsi_acpi.c. I
don't have any other ideas. I'll try a few more things, and then
prepare a patch for that.

thanks,

-- 
heikki
