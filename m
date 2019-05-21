Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAA2224FC2
	for <lists+linux-usb@lfdr.de>; Tue, 21 May 2019 15:09:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbfEUNJT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 May 2019 09:09:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:50886 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727812AbfEUNJT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 May 2019 09:09:19 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8F6902173C;
        Tue, 21 May 2019 13:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558444159;
        bh=UMiTSP3vE2C3S2QMDxEcaTerhYT+4tA555NRkGhW3Uk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cIeB0EEo/G7r4GRPeZaKjbu2Yxx10MGHqEVxGhh24XsyQNpg/7sCmXzJcgWeaPGE3
         8djxcUX0UkNwDATSVlWUVLiE3b1moOa5H4Lqxj/LPRJqdxy/SsTv/Suude/gS0K33Q
         i0VfhWKqVpVL3HbstcYJNdxFBsUBHG51AnITZnQM=
Date:   Tue, 21 May 2019 15:09:13 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     kbuild test robot <lkp@intel.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>, kbuild-all@01.org,
        linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: Re: [usb:usb-linus 3/10] drivers/media//usb/siano/smsusb.c:447:37:
 warning: 'in_maxp' may be used uninitialized in this function
Message-ID: <20190521130913.GA7273@kroah.com>
References: <201905211645.tumqhfAz%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201905211645.tumqhfAz%lkp@intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 21, 2019 at 04:48:47PM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
> head:   53c7b63f797c96a30c21dd3b781fafaae096a12b
> commit: 31e0456de5be379b10fea0fa94a681057114a96e [3/10] media: usb: siano: Fix general protection fault in smsusb
> config: mips-allmodconfig (attached as .config)
> compiler: mips-linux-gcc (GCC) 8.1.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 31e0456de5be379b10fea0fa94a681057114a96e
>         # save the attached .config to linux build tree
>         GCC_VERSION=8.1.0 make.cross ARCH=mips 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
> http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

False positive, gcc isn't smart enough here.

greg k-h
