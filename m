Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8059F5478ED
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jun 2022 06:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232577AbiFLExB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 12 Jun 2022 00:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbiFLExA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 12 Jun 2022 00:53:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0520AEAD
        for <linux-usb@vger.kernel.org>; Sat, 11 Jun 2022 21:52:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5BB8360917
        for <linux-usb@vger.kernel.org>; Sun, 12 Jun 2022 04:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DA8AC3411C;
        Sun, 12 Jun 2022 04:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1655009577;
        bh=zKn4jUGmdPWmr6mFSkwvU1cgEXYVkyrRTV7qxdeiFgI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ThJ7zT7w00MXDclZrjDZG2L7Ukvy4Z4VilsZC4JbbOwADhEO1llpNhA9h/NcnNpOO
         z+MmbO6SLUabadsAW7RLLeKlv6R8QBvnfB4ZDcZ90d9QgwqDoGg1UGi9XHMhYgSr+X
         LNxdIKuVXN63TrhL3+ccZkJ4AVSXsfWE38V/k0Xg=
Date:   Sun, 12 Jun 2022 06:52:55 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Cc:     kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        linux-usb@vger.kernel.org,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Krishna Kurapati <quic_kriskura@quicinc.com>
Subject: Re: [usb:usb-testing 39/44] drivers/usb/dwc3/dwc3-qcom.c:301:23:
 warning: no previous prototype for 'dwc3_qcom_read_usb2_speed'
Message-ID: <YqVxJwdbeK01qljC@kroah.com>
References: <202206110832.2zOQ2T8f-lkp@intel.com>
 <YqVv/PYkpm0Y9cBM@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqVv/PYkpm0Y9cBM@kroah.com>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jun 12, 2022 at 06:47:56AM +0200, Greg Kroah-Hartman wrote:
> On Sat, Jun 11, 2022 at 08:55:47AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> > head:   477122a1eec325621cefd62da8bd8ac20a66fb8e
> > commit: 4387ea43e3a9dac058adfe5fc68e0e82750201e5 [39/44] usb: dwc3: qcom: Configure wakeup interrupts during suspend
> > config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20220611/202206110832.2zOQ2T8f-lkp@intel.com/config)
> > compiler: riscv64-linux-gcc (GCC) 11.3.0
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=4387ea43e3a9dac058adfe5fc68e0e82750201e5
> >         git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
> >         git fetch --no-tags usb usb-testing
> >         git checkout 4387ea43e3a9dac058adfe5fc68e0e82750201e5
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/usb/dwc3/
> > 
> > If you fix the issue, kindly add following tag where applicable
> > Reported-by: kernel test robot <lkp@intel.com>
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> drivers/usb/dwc3/dwc3-qcom.c:301:23: warning: no previous prototype for 'dwc3_qcom_read_usb2_speed' [-Wmissing-prototypes]
> >      301 | enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom)
> >          |                       ^~~~~~~~~~~~~~~~~~~~~~~~~
> 
> I will go drop this commit now, please send a fixed up version if you
> still want it accepted.

I've dropped the whole 5 patch series now.
