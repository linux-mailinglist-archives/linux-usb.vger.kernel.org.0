Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF7B532858
	for <lists+linux-usb@lfdr.de>; Tue, 24 May 2022 12:57:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236430AbiEXKza (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 May 2022 06:55:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236424AbiEXKz2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 May 2022 06:55:28 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E81BA70906
        for <linux-usb@vger.kernel.org>; Tue, 24 May 2022 03:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653389727; x=1684925727;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e02kOghg8fnq2Pvf8EPQ0+8r8NY13VDEsJfrDbmJHYM=;
  b=K68yf2cRcX2uuG94OPDe5bgG/1BsO4AiSLbJE8foEatJu+Ix3IzZcTZh
   2E6nzO9JMllu+nbitioof7Q7YvV9WexHbjqYAKHZX7hUIwMENmLqUtq5F
   /7QrZSiXvfFEe2pz1Ou7JwH8geBL1+zVJfNfXfasVvdqQPegRdaty6SGJ
   wlpRJsdAlFHd3u8Hm4aHB7frmSpkhD+WZilut4O7s05cygyKQQf8jgQwX
   9JYpqON9Pyvb4voMSSskh4XSIN+6kAtSaZQop3558aI+4CpWEw3yG38l9
   mxdYGpKXmZnTc9U6RgeAKgNTiXv17o/5A3nQCtNVLvT5kFqH58q+mnt8r
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="253370432"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="253370432"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2022 03:55:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="717122071"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 24 May 2022 03:55:24 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 24 May 2022 13:55:23 +0300
Date:   Tue, 24 May 2022 13:55:23 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Stefan Hoffmeister <stefan.hoffmeister@gmail.com>
Cc:     linux-usb@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: Thunderbolt: One missing DisplayPort?
Message-ID: <Yoy5m3Aa6QwVcFhf@kuha.fi.intel.com>
References: <CALhB_QNhzHkf4Yw6TqZAbCisMK6TBy8ecw0M_Sq=EQXPN728fg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALhB_QNhzHkf4Yw6TqZAbCisMK6TBy8ecw0M_Sq=EQXPN728fg@mail.gmail.com>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

+Mika

On Fri, May 20, 2022 at 12:22:50PM +0200, Stefan Hoffmeister wrote:
> I am trying to diagnose a problem where I get video output on
> Thunderbolt on one DisplayPort, but no output on the second
> DisplayPort.
> 
> I would love to turn on all the (kernel-level) logging output that
> there is, but do not know how to do that.
> 
> Basically, on a Dell Inspiron 16 Plus (7610) laptop with Thunderbolt
> 4, I am running Fedora Linux 36 with kernel 5.17+.
> 
> Connecting that laptop to a Thunderbolt docking station (Intel
> Thunderbolt 3 chip inside),
> with two screens attached via DisplayPort, I get only one screen up and running.
> 
> I'd like to discover more about this apparent error mode, because
> attaching a different TB3
> setup works fine. I am looking for some means to enable logging or to
> get debugging insight.
> 
> Generally speaking, I suspect that this specific Dell laptop
> (configuration) has some challenges
> in the BIOS, and with Thunderbolt in general, but am totally blind to
> what is going on.
> 
> This system offers potential for fun, this being a hybrid PRIME
> configuration, with an Intel iGPU passing through to an Nvidia dGPU
> which seems to be the only wired-up way to get DisplayPort output.

-- 
heikki
