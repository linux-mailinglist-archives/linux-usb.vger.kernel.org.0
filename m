Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A312E15A9EA
	for <lists+linux-usb@lfdr.de>; Wed, 12 Feb 2020 14:19:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727582AbgBLNTd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Feb 2020 08:19:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:46226 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726728AbgBLNTd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Feb 2020 08:19:33 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E78AC2073C;
        Wed, 12 Feb 2020 13:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581513572;
        bh=Dm8KBP4tZLANhxx40m6/61H/JdRrAj9Jg1WuWwPxtw0=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=lIwX5oepcA1AsEFn8gE7J49ZD9Z1prkvxIbmVg3zKl08/5x6tb8IV15Lv6bOJ2xpT
         gkPcISL5hJ2nXp39FWk9Hli0LSpCTv9Sw2Aqx6Gr6aOVHdYIDD+DmGwzAMmKz6YP7S
         oyHc/BDzMeDZZKJHhuXIAaE1V8lJKg9pm5wzuH7A=
Date:   Wed, 12 Feb 2020 14:19:29 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Johan Korsnes <jkorsnes@cisco.com>
cc:     linux-usb@vger.kernel.org,
        Armando Visconti <armando.visconti@st.com>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v2 1/2] HID: core: fix off-by-one memset in
 hid_report_raw_event()
In-Reply-To: <20200117120836.2354966-1-jkorsnes@cisco.com>
Message-ID: <nycvar.YFH.7.76.2002121419180.3144@cbobk.fhfr.pm>
References: <20200117120836.2354966-1-jkorsnes@cisco.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Johan,

both patches now applied, sorry for the delay.

-- 
Jiri Kosina
SUSE Labs

