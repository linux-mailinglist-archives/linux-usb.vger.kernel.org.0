Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 630CC6FD890
	for <lists+linux-usb@lfdr.de>; Wed, 10 May 2023 09:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236168AbjEJHua (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 May 2023 03:50:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235883AbjEJHu3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 May 2023 03:50:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1E2310D
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 00:50:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6A33F63314
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 07:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE824C433EF;
        Wed, 10 May 2023 07:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683705026;
        bh=0a3KDNS9EntPX6zp9bXq/Bn0VjPc6M7v7iH1uKbn8Cc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YARodS+jqNbsK5PXJ6MLtwXumXJE1XY7AvuLGSpwPgOPNTQ6+sWJu+mY8bR/emIV1
         /RNn8XaIR/MNAv22v6WOn+Rp3PBsEvm+Eug9CAN0wCyie+our6c3RaUIKaFbv184oU
         67xn4RIpoVGRJX8H4YDBYsBCP5QR82dFbPd+wuUs7CAbXRYbkl9dId6Isk0rTZDqmp
         Eqi6IFQuAaFEBl1XRzaAbcxELVWvdMOk4bgdEyFz9Mm0Cj626A+cCKEu4IudQ8xxtG
         ocJfan4cPTTJURClNjza2QfhtN6njXGREkYTKO2j1AEw3RoMK5o+5iIH5wTjZkytuv
         q/dLbvPbxHjWg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1pweb2-000739-RK; Wed, 10 May 2023 09:50:48 +0200
Date:   Wed, 10 May 2023 09:50:48 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     oe-kbuild@lists.linux.dev,
        Udipto Goswami <quic_ugoswami@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>, lkp@intel.com,
        oe-kbuild-all@lists.linux.dev,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v8] usb: dwc3: debugfs: Prevent any register access when
 devices is runtime suspended
Message-ID: <ZFtM2NKsj7Md9jFC@hovoldconsulting.com>
References: <20230504045052.22347-1-quic_ugoswami@quicinc.com>
 <df7bd9f8-f327-42cb-a5d4-42a804b9790d@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df7bd9f8-f327-42cb-a5d4-42a804b9790d@kili.mountain>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 10, 2023 at 10:32:54AM +0300, Dan Carpenter wrote:
> Hi Udipto,
> 
> kernel test robot noticed the following build warnings:
> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Udipto-Goswami/usb-dwc3-debugfs-Prevent-any-register-access-when-devices-is-runtime-suspended/20230504-125225
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> patch link:    https://lore.kernel.org/r/20230504045052.22347-1-quic_ugoswami%40quicinc.com
> patch subject: [PATCH v8] usb: dwc3: debugfs: Prevent any register access when devices is runtime suspended
> config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230510/202305101451.V2D0cM4S-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Link: https://lore.kernel.org/r/202305101451.V2D0cM4S-lkp@intel.com/
> 
> New smatch warnings:
> drivers/usb/dwc3/debugfs.c:647 dwc3_link_state_write() warn: missing error code? 'ret'
> drivers/usb/dwc3/debugfs.c:720 dwc3_rx_fifo_size_show() warn: curly braces intended?
> drivers/usb/dwc3/debugfs.c:722 dwc3_rx_fifo_size_show() warn: inconsistent indenting
> drivers/usb/dwc3/debugfs.c:722 dwc3_rx_fifo_size_show() warn: ignoring unreachable code.
> 
> Old smatch warnings:
> drivers/usb/dwc3/debugfs.c:657 dwc3_link_state_write() warn: missing error code? 'ret'
> 
> vim +/ret +647 drivers/usb/dwc3/debugfs.c
> 
> 1c53edaeee3338 Udipto Goswami 2023-05-04  638  	ret = pm_runtime_resume_and_get(dwc->dev);
> 1c53edaeee3338 Udipto Goswami 2023-05-04  639  	if (ret < 0)
> 1c53edaeee3338 Udipto Goswami 2023-05-04  640  		return ret;
> 1c53edaeee3338 Udipto Goswami 2023-05-04  641  
> 138801aaa566ec Felipe Balbi   2012-01-02  642  	spin_lock_irqsave(&dwc->lock, flags);
> d102444cac1564 Thinh Nguyen   2018-11-07  643  	reg = dwc3_readl(dwc->regs, DWC3_GSTS);
> d102444cac1564 Thinh Nguyen   2018-11-07  644  	if (DWC3_GSTS_CURMOD(reg) != DWC3_GSTS_CURMOD_DEVICE) {
> d102444cac1564 Thinh Nguyen   2018-11-07  645  		spin_unlock_irqrestore(&dwc->lock, flags);
> 1c53edaeee3338 Udipto Goswami 2023-05-04  646  		pm_runtime_put_sync(dwc->dev);
> 1c53edaeee3338 Udipto Goswami 2023-05-04 @647  		return ret;
> 
> ret is not necessarily an error code.
> 
> d102444cac1564 Thinh Nguyen   2018-11-07  648  	}
> d102444cac1564 Thinh Nguyen   2018-11-07  649  
> 0d36dede457873 Thinh Nguyen   2018-11-07  650  	reg = dwc3_readl(dwc->regs, DWC3_DSTS);
> 0d36dede457873 Thinh Nguyen   2018-11-07  651  	speed = reg & DWC3_DSTS_CONNECTSPD;
> 0d36dede457873 Thinh Nguyen   2018-11-07  652  
> 0d36dede457873 Thinh Nguyen   2018-11-07  653  	if (speed < DWC3_DSTS_SUPERSPEED &&
> 0d36dede457873 Thinh Nguyen   2018-11-07  654  	    state != DWC3_LINK_STATE_RECOV) {
> 0d36dede457873 Thinh Nguyen   2018-11-07  655  		spin_unlock_irqrestore(&dwc->lock, flags);
> 1c53edaeee3338 Udipto Goswami 2023-05-04  656  		pm_runtime_put_sync(dwc->dev);
> 1c53edaeee3338 Udipto Goswami 2023-05-04  657  		return ret;
> 0d36dede457873 Thinh Nguyen   2018-11-07  658  	}
> 
> [ snip ]
> 
> 2c85a1817e4ba0 Thinh Nguyen   2018-11-07  708  static int dwc3_rx_fifo_size_show(struct seq_file *s, void *unused)
> 818ec3aba883f5 Felipe Balbi   2016-04-14  709  {
> 818ec3aba883f5 Felipe Balbi   2016-04-14  710  	struct dwc3_ep		*dep = s->private;
> 818ec3aba883f5 Felipe Balbi   2016-04-14  711  	struct dwc3		*dwc = dep->dwc;
> 818ec3aba883f5 Felipe Balbi   2016-04-14  712  	unsigned long		flags;
> d00be779cc5016 Thinh Nguyen   2021-03-27  713  	u32			mdwidth;
> 818ec3aba883f5 Felipe Balbi   2016-04-14  714  	u32			val;
> 1c53edaeee3338 Udipto Goswami 2023-05-04  715  	int			ret;
> 1c53edaeee3338 Udipto Goswami 2023-05-04  716  
> 1c53edaeee3338 Udipto Goswami 2023-05-04  717  	ret = pm_runtime_resume_and_get(dwc->dev);
> 1c53edaeee3338 Udipto Goswami 2023-05-04  718  	if (ret < 0)
> 1c53edaeee3338 Udipto Goswami 2023-05-04  719  		pm_runtime_put_sync(dwc->dev);
> 1c53edaeee3338 Udipto Goswami 2023-05-04 @720  		return ret;
> 
> Needs curly braces.

I believe this was all fixed in v9/v10.

Johan
