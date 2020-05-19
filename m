Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E52A91D9354
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2020 11:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbgESJ3V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 May 2020 05:29:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:36962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726494AbgESJ3U (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 19 May 2020 05:29:20 -0400
Received: from localhost (unknown [122.182.207.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B4A60207C4;
        Tue, 19 May 2020 09:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589880560;
        bh=yuwfD33ETp67B1hISVEQdtBNL3DVTjerEDtXZFePrKU=;
        h=Date:From:To:Cc:From;
        b=Gmv0CSjUdtgMlM69LBAkh9vhFB5NYmGcS/AmBdvk7xEzXce759Qe1ZEV+tSrjNlHi
         JOzrA3WU4V91LPnq3Sp9iLE/q5J/OQv74YGoEoXoPizIEWB0DYpeSNRihX7sqMf5DA
         J3MOVGqLGxlwi8mJlLwrnWVENJGbEz6yyGELQHDA=
Date:   Tue, 19 May 2020 14:59:14 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        kbuild test robot <lkp@intel.com>
Message-ID: <20200519092914.GM374218@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Bcc: 
Subject: Re: [usb:usb-testing 57/64] drivers/usb/host/xhci-pci.h:13:5:
 warning: no previous prototype for 'renesas_xhci_check_request_fw'
Reply-To: 
In-Reply-To: <202005191716.5gO1jQGg%lkp@intel.com>

On 19-05-20, 17:08, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> head:   df00731cffa0edb454ee0c490696ce0c1745e680
> commit: a66d21d7dba84deeaf3b296c43eafc11094b6f09 [57/64] usb: xhci: Add support for Renesas controller with memory
> config: m68k-randconfig-r012-20200519 (attached as .config)
> compiler: m68k-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout a66d21d7dba84deeaf3b296c43eafc11094b6f09
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=m68k 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>

Thanks for the report, yes missed making these symbols static when
CONFIG_USB_XHCI_PCI_RENESAS is not set

Greg,

Sending the patch now, and sorry for too much noise on these :(

-- 
~Vinod
