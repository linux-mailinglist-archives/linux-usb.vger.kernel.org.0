Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A57315BCF0
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2020 11:37:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729494AbgBMKh4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Feb 2020 05:37:56 -0500
Received: from mx2.suse.de ([195.135.220.15]:59804 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729428AbgBMKh4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Feb 2020 05:37:56 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id C099AABE7;
        Thu, 13 Feb 2020 10:37:54 +0000 (UTC)
Message-ID: <1581590267.21415.12.camel@suse.de>
Subject: Re: [usb:usb-testing 18/18]
 drivers/usb/misc/apple-mfi-fastcharge.c:173:29: sparse: sparse: restricted
 __le16 degrades to integer
From:   Oliver Neukum <oneukum@suse.de>
To:     Bastien Nocera <hadess@hadess.net>,
        kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date:   Thu, 13 Feb 2020 11:37:47 +0100
In-Reply-To: <034bc43c35a75a84787bc786c8694607552a8139.camel@hadess.net>
References: <202002131558.UH2wlHsI%lkp@intel.com>
         <034bc43c35a75a84787bc786c8694607552a8139.camel@hadess.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Donnerstag, den 13.02.2020, 09:56 +0100 schrieb Bastien Nocera:
> 
> Is that something I should be fixing? I'm guessing that I just need to
> cast the constant side to a type the same size as those fields, but is
> that necessary?

Hi,

I am on it. Expect a patch in half an hour.

	Regards
		Oliver

