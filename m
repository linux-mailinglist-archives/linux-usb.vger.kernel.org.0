Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61A246FD84C
	for <lists+linux-usb@lfdr.de>; Wed, 10 May 2023 09:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236531AbjEJHep (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 May 2023 03:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236422AbjEJHeO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 May 2023 03:34:14 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC3AC7ECE
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 00:33:45 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-2f27a9c7970so6440026f8f.2
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 00:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683703979; x=1686295979;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LiXRW62f0/Z/R/WEDonIEk4qJucqCg+jSVKRIPWZXwA=;
        b=QVJdGUO5ZFtZyjJ1xF9wc0mHXPALIWDRgiKe0vgkRCHo2rPVwyaVbqunv5Vz22Anx1
         BPP0yuZGPdxAKnDCD9EHIk+WzB+O4jNEF6hpNRLurJVD1VTI28Ag8DF3vxAhWGXGbmLr
         Qid4VqNX0ALRiosUASy2b3reC2Mx9UfV3t66I+8uDZfPRwvKM1a1ZYNtC1oL2MCUohGv
         euTfxiaowDL/jyeAHQxcos+vtiHtyH+66FBqle1ka744kULSK9Wp9l4EBg7CW9WsYyQM
         VDhZbS7jv3xcSg5n1ixWMqJIcwJhchuLnS8/8NFKwrcgcnFUWtMRRZXsQ/iV3/snSWoF
         qr1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683703979; x=1686295979;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LiXRW62f0/Z/R/WEDonIEk4qJucqCg+jSVKRIPWZXwA=;
        b=epzYu7WNed2fxvGamoN+1viIXADvfVk4N2TzZ+DxqB2b2+m8G7h3neSdRnH4Dovt/W
         ykWGV9tH7TNtsJ/bTAMB+baL5o9i88d3Zblf657z1fkCNqQvmRmqbjbdypjMb9/5sVVG
         3VSOdVelkNGVhoZb9nFn+LgSVb6oRBRmSG1uwh6pLHEBRz6FMfivxlW3+PSz9HCzIopw
         i1/EiqTN7FDjeLE8/7aKDT9wtXkfVyFCO9OvSW2vCj7Rh9hZKqcGmWmYzA/HR2gcEoKn
         zWN7E2NVPych22RoE/kb08I/6HReCPUT03wkwoTiCqUEhkUuDrcxg5c1H16tgPN0JsVN
         iI7w==
X-Gm-Message-State: AC+VfDxm63sVOPYSOZhn3XuwjFOq0vOd4dQzRq0jwRj+O6fM0dSlQzBH
        ili7i+vhjI8Y1Uc+VwHrClxJ2Q==
X-Google-Smtp-Source: ACHHUZ5MzeYPoI8TOT/LH4G0uy7/rknIvx39CXUDBCQF81g65KQjd3SM2WJ+V6dzB8lU+vaJOMUekA==
X-Received: by 2002:a05:6000:1191:b0:306:462a:b78d with SMTP id g17-20020a056000119100b00306462ab78dmr9804937wrx.53.1683703978695;
        Wed, 10 May 2023 00:32:58 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k9-20020adfe8c9000000b0030642f5da27sm16415712wrn.37.2023.05.10.00.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 00:32:57 -0700 (PDT)
Date:   Wed, 10 May 2023 10:32:54 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     oe-kbuild@lists.linux.dev,
        Udipto Goswami <quic_ugoswami@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     lkp@intel.com, oe-kbuild-all@lists.linux.dev,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org,
        Udipto Goswami <quic_ugoswami@quicinc.com>
Subject: Re: [PATCH v8] usb: dwc3: debugfs: Prevent any register access when
 devices is runtime suspended
Message-ID: <df7bd9f8-f327-42cb-a5d4-42a804b9790d@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504045052.22347-1-quic_ugoswami@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Udipto,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Udipto-Goswami/usb-dwc3-debugfs-Prevent-any-register-access-when-devices-is-runtime-suspended/20230504-125225
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230504045052.22347-1-quic_ugoswami%40quicinc.com
patch subject: [PATCH v8] usb: dwc3: debugfs: Prevent any register access when devices is runtime suspended
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230510/202305101451.V2D0cM4S-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305101451.V2D0cM4S-lkp@intel.com/

New smatch warnings:
drivers/usb/dwc3/debugfs.c:647 dwc3_link_state_write() warn: missing error code? 'ret'
drivers/usb/dwc3/debugfs.c:720 dwc3_rx_fifo_size_show() warn: curly braces intended?
drivers/usb/dwc3/debugfs.c:722 dwc3_rx_fifo_size_show() warn: inconsistent indenting
drivers/usb/dwc3/debugfs.c:722 dwc3_rx_fifo_size_show() warn: ignoring unreachable code.

Old smatch warnings:
drivers/usb/dwc3/debugfs.c:657 dwc3_link_state_write() warn: missing error code? 'ret'

vim +/ret +647 drivers/usb/dwc3/debugfs.c

1c53edaeee3338 Udipto Goswami 2023-05-04  638  	ret = pm_runtime_resume_and_get(dwc->dev);
1c53edaeee3338 Udipto Goswami 2023-05-04  639  	if (ret < 0)
1c53edaeee3338 Udipto Goswami 2023-05-04  640  		return ret;
1c53edaeee3338 Udipto Goswami 2023-05-04  641  
138801aaa566ec Felipe Balbi   2012-01-02  642  	spin_lock_irqsave(&dwc->lock, flags);
d102444cac1564 Thinh Nguyen   2018-11-07  643  	reg = dwc3_readl(dwc->regs, DWC3_GSTS);
d102444cac1564 Thinh Nguyen   2018-11-07  644  	if (DWC3_GSTS_CURMOD(reg) != DWC3_GSTS_CURMOD_DEVICE) {
d102444cac1564 Thinh Nguyen   2018-11-07  645  		spin_unlock_irqrestore(&dwc->lock, flags);
1c53edaeee3338 Udipto Goswami 2023-05-04  646  		pm_runtime_put_sync(dwc->dev);
1c53edaeee3338 Udipto Goswami 2023-05-04 @647  		return ret;

ret is not necessarily an error code.

d102444cac1564 Thinh Nguyen   2018-11-07  648  	}
d102444cac1564 Thinh Nguyen   2018-11-07  649  
0d36dede457873 Thinh Nguyen   2018-11-07  650  	reg = dwc3_readl(dwc->regs, DWC3_DSTS);
0d36dede457873 Thinh Nguyen   2018-11-07  651  	speed = reg & DWC3_DSTS_CONNECTSPD;
0d36dede457873 Thinh Nguyen   2018-11-07  652  
0d36dede457873 Thinh Nguyen   2018-11-07  653  	if (speed < DWC3_DSTS_SUPERSPEED &&
0d36dede457873 Thinh Nguyen   2018-11-07  654  	    state != DWC3_LINK_STATE_RECOV) {
0d36dede457873 Thinh Nguyen   2018-11-07  655  		spin_unlock_irqrestore(&dwc->lock, flags);
1c53edaeee3338 Udipto Goswami 2023-05-04  656  		pm_runtime_put_sync(dwc->dev);
1c53edaeee3338 Udipto Goswami 2023-05-04  657  		return ret;
0d36dede457873 Thinh Nguyen   2018-11-07  658  	}

[ snip ]

2c85a1817e4ba0 Thinh Nguyen   2018-11-07  708  static int dwc3_rx_fifo_size_show(struct seq_file *s, void *unused)
818ec3aba883f5 Felipe Balbi   2016-04-14  709  {
818ec3aba883f5 Felipe Balbi   2016-04-14  710  	struct dwc3_ep		*dep = s->private;
818ec3aba883f5 Felipe Balbi   2016-04-14  711  	struct dwc3		*dwc = dep->dwc;
818ec3aba883f5 Felipe Balbi   2016-04-14  712  	unsigned long		flags;
d00be779cc5016 Thinh Nguyen   2021-03-27  713  	u32			mdwidth;
818ec3aba883f5 Felipe Balbi   2016-04-14  714  	u32			val;
1c53edaeee3338 Udipto Goswami 2023-05-04  715  	int			ret;
1c53edaeee3338 Udipto Goswami 2023-05-04  716  
1c53edaeee3338 Udipto Goswami 2023-05-04  717  	ret = pm_runtime_resume_and_get(dwc->dev);
1c53edaeee3338 Udipto Goswami 2023-05-04  718  	if (ret < 0)
1c53edaeee3338 Udipto Goswami 2023-05-04  719  		pm_runtime_put_sync(dwc->dev);
1c53edaeee3338 Udipto Goswami 2023-05-04 @720  		return ret;

Needs curly braces.

818ec3aba883f5 Felipe Balbi   2016-04-14  721  
818ec3aba883f5 Felipe Balbi   2016-04-14 @722  	spin_lock_irqsave(&dwc->lock, flags);
2c85a1817e4ba0 Thinh Nguyen   2018-11-07  723  	val = dwc3_core_fifo_space(dep, DWC3_RXFIFO);
0f874f79dc81ae Thinh Nguyen   2018-11-07  724  
0f874f79dc81ae Thinh Nguyen   2018-11-07  725  	/* Convert to bytes */
d00be779cc5016 Thinh Nguyen   2021-03-27  726  	mdwidth = dwc3_mdwidth(dwc);
4244ba02edb850 Thinh Nguyen   2020-04-11  727  
4244ba02edb850 Thinh Nguyen   2020-04-11  728  	val *= mdwidth;
0f874f79dc81ae Thinh Nguyen   2018-11-07  729  	val >>= 3;
818ec3aba883f5 Felipe Balbi   2016-04-14  730  	seq_printf(s, "%u\n", val);
818ec3aba883f5 Felipe Balbi   2016-04-14  731  	spin_unlock_irqrestore(&dwc->lock, flags);
818ec3aba883f5 Felipe Balbi   2016-04-14  732  
1c53edaeee3338 Udipto Goswami 2023-05-04  733  	pm_runtime_put_sync(dwc->dev);
818ec3aba883f5 Felipe Balbi   2016-04-14  734  	return 0;
818ec3aba883f5 Felipe Balbi   2016-04-14  735  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

