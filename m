Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71B25C348D
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 14:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387885AbfJAMmJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 08:42:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:39166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725821AbfJAMmJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Oct 2019 08:42:09 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4FBB020842;
        Tue,  1 Oct 2019 12:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569933728;
        bh=ziXabjQefZOqdn9BB2Sz51JC3wWZtC43f1Db8s7tSMQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W28iKxyy2iy1gtjHs3VvPXi9Q4/acUsTJ1C9cx4XVeeGggYXZSEY1NAkMH7Nq0lD5
         WR2HTDkLy4rOfuswpg9+BUeUjkJPD3n+J5rdo1+uEehHl64353uuJocVEtfQtT+YRA
         00nhZH+NaXYeVMsq3U+iy6lAR7jqGFETlUSK80h8=
Date:   Tue, 1 Oct 2019 14:42:06 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>,
        Lukas Wunner <lukas@wunner.de>,
        Alan Stern <stern@rowland.harvard.edu>,
        Mario.Limonciello@dell.com,
        Anthony Wong <anthony.wong@canonical.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 10/22] thunderbolt: Convert PCIe adapter register
 names to use USB4 names
Message-ID: <20191001124206.GE2954373@kroah.com>
References: <20191001113830.13028-1-mika.westerberg@linux.intel.com>
 <20191001113830.13028-11-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191001113830.13028-11-mika.westerberg@linux.intel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 01, 2019 at 02:38:18PM +0300, Mika Westerberg wrote:
> Now that USB4 spec has names for these PCIe adapter registers we can use
> them instead. This makes it easier to match certain register to the spec.
> 
> No functional changes.

Same here, can we merge this now?

thanks,

greg k-h
