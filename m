Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4333D3EEB4D
	for <lists+linux-usb@lfdr.de>; Tue, 17 Aug 2021 13:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238994AbhHQLBM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Aug 2021 07:01:12 -0400
Received: from mga18.intel.com ([134.134.136.126]:38352 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231515AbhHQLBK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 17 Aug 2021 07:01:10 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="203194050"
X-IronPort-AV: E=Sophos;i="5.84,328,1620716400"; 
   d="scan'208";a="203194050"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2021 04:00:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,328,1620716400"; 
   d="scan'208";a="593312813"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 17 Aug 2021 04:00:33 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 17 Aug 2021 14:00:33 +0300
Date:   Tue, 17 Aug 2021 14:00:33 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: always rediscover when swapping DR
Message-ID: <YRuW0fENBEcIVkZb@kuha.fi.intel.com>
References: <20210813043131.833006-1-icenowy@aosc.io>
 <YRuDG78N2mB5w37p@kuha.fi.intel.com>
 <E91C97D0-7DB9-4455-AED2-4C25B7D2D22D@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E91C97D0-7DB9-4455-AED2-4C25B7D2D22D@aosc.io>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> >Why is it necessary to do discovery with data role swap in general?
> 
> I think it could be possible for devices to expose different altmode
> with different role.

OK. FWIW:

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

thanks,

-- 
heikki
