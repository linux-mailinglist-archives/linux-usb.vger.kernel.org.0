Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 281E16E72EF
	for <lists+linux-usb@lfdr.de>; Wed, 19 Apr 2023 08:15:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231532AbjDSGPA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Apr 2023 02:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231796AbjDSGOr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Apr 2023 02:14:47 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CDB91B5
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 23:14:37 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-2fde2879eabso826906f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 23:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681884876; x=1684476876;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SQwYf25Qlfs+qKG9Lr1OKtT5gdFHla7zNr/1YdTEv6I=;
        b=FQxjN73Pj5KGIQV2CnO/5RrVnmvgLW+qQ6C+TnX5UQK6Pwk/LM7ztPsgC+sSUsF3PR
         qRYi8uA7UdHH5y+YSkDH2XuTrVsJOg5zQKj7/zQ/Lp+3GJovkuk6eqM0hPT+xRdTWz7L
         tj9lI1CjqQeiVcE0gkI3rJLElsRbBSBg+Aps7496LwGeO1dQIlmusP+7mVi0U7G/Dxx+
         7w9eidKWM+8N+2JZxh3CE/nHtzUM1a5YHkYqd84Vgg/MinPpCBdHsA6hZJuMZSyL+wgH
         8VBqG41curFpPSjcNSDhurPzvpOMpTdxppqnY9KMe/6JEymnys5yXMDO/HF8g6IvQboS
         NSDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681884876; x=1684476876;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQwYf25Qlfs+qKG9Lr1OKtT5gdFHla7zNr/1YdTEv6I=;
        b=WQJckl7G9/74K2eZgFPd1wU+e3em2rBskCq6r7ZPkeJrfUv+C4WgiEHS7C5TIjw83g
         JN5cIjT3WyncCr2t8v+z1krSinJEU1O02raR4iLFLlceS7K60tzsSbKhPbgwOpzAsc1O
         9SY4ExqqDJBmmhkdSos5PvM+mAhHVG/sZjt3wFMqLK4ewObSni/k6/D0Sw8XhQRz93Vg
         wpi2pvKrWNAHR3NtQqpFP2UepaAIx1fj2qIe+YxkM5aiGO/wOGK+JOgRpqaAQr5WJPt/
         2+0F3EOsUt+FnAJosVJOmzer2E/5hEu6z93cL9J/U8XZ8aqSIOLYIx2DzDY4EP+NcJyj
         yEhQ==
X-Gm-Message-State: AAQBX9fSow4yv7grNCk+6upLhQokI5YXs7t/tco5auru+rPowDUauUDe
        nmAiqKBOtYe8X0oR8eDLeU8=
X-Google-Smtp-Source: AKy350ZKiWvF3vnXAECKoI9j9rtTtW7/t+Y5TrimA6/MGDFGU8paBfjnxm7EmjuwhE6eyDVHSvLZ6A==
X-Received: by 2002:a5d:428c:0:b0:2ef:ae66:c0e3 with SMTP id k12-20020a5d428c000000b002efae66c0e3mr3419754wrq.12.1681884875935;
        Tue, 18 Apr 2023 23:14:35 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a1-20020a05600c224100b003f175b360e5sm1125271wmm.0.2023.04.18.23.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 23:14:35 -0700 (PDT)
From:   kernel test robot <error27@gmail.com>
X-Google-Original-From: kernel test robot <lkp@intel.com>
Date:   Wed, 19 Apr 2023 09:14:32 +0300
To:     oe-kbuild@lists.linux.dev,
        Udipto Goswami <quic_ugoswami@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     lkp@intel.com, Dan Carpenter <error27@gmail.com>,
        oe-kbuild-all@lists.linux.dev,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>, linux-usb@vger.kernel.org,
        Oliver Neukum <oneukum@suse.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Udipto Goswami <quic_ugoswami@quicinc.com>
Subject: Re: [PATCH v5] usb: dwc3: debugfs: Prevent any register access when
 devices
Message-ID: <ZD+GyFCRUc6SdUl+@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418121835.17550-1-quic_ugoswami@quicinc.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Udipto,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus westeri-thunderbolt/next linus/master v6.3-rc7 next-20230418]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Udipto-Goswami/usb-dwc3-debugfs-Prevent-any-register-access-when-devices/20230418-202039
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230418121835.17550-1-quic_ugoswami%40quicinc.com
patch subject: [PATCH v5] usb: dwc3: debugfs: Prevent any register access when devices
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230419/202304191354.gk7ee6Gf-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304191354.gk7ee6Gf-lkp@intel.com/

smatch warnings:
drivers/usb/dwc3/debugfs.c:338 dwc3_lsp_show() warn: pm_runtime_get_sync() also returns 1 on success
drivers/usb/dwc3/debugfs.c:409 dwc3_mode_show() warn: pm_runtime_get_sync() also returns 1 on success
drivers/usb/dwc3/debugfs.c:485 dwc3_testmode_show() warn: pm_runtime_get_sync() also returns 1 on success
drivers/usb/dwc3/debugfs.c:555 dwc3_testmode_write() warn: pm_runtime_get_sync() also returns 1 on success
drivers/usb/dwc3/debugfs.c:586 dwc3_link_state_show() warn: pm_runtime_get_sync() also returns 1 on success
drivers/usb/dwc3/debugfs.c:649 dwc3_link_state_write() warn: pm_runtime_get_sync() also returns 1 on success
drivers/usb/dwc3/debugfs.c:702 dwc3_tx_fifo_size_show() warn: pm_runtime_get_sync() also returns 1 on success
drivers/usb/dwc3/debugfs.c:732 dwc3_rx_fifo_size_show() warn: pm_runtime_get_sync() also returns 1 on success
drivers/usb/dwc3/debugfs.c:761 dwc3_tx_request_queue_show() warn: pm_runtime_get_sync() also returns 1 on success
drivers/usb/dwc3/debugfs.c:784 dwc3_rx_request_queue_show() warn: pm_runtime_get_sync() also returns 1 on success
drivers/usb/dwc3/debugfs.c:807 dwc3_rx_info_queue_show() warn: pm_runtime_get_sync() also returns 1 on success
drivers/usb/dwc3/debugfs.c:830 dwc3_descriptor_fetch_queue_show() warn: pm_runtime_get_sync() also returns 1 on success
drivers/usb/dwc3/debugfs.c:853 dwc3_event_queue_show() warn: pm_runtime_get_sync() also returns 1 on success
drivers/usb/dwc3/debugfs.c:911 dwc3_trb_ring_show() warn: pm_runtime_get_sync() also returns 1 on success
drivers/usb/dwc3/debugfs.c:960 dwc3_ep_info_register_show() warn: pm_runtime_get_sync() also returns 1 on success

vim +338 drivers/usb/dwc3/debugfs.c

62ba09d6bb6330 Thinh Nguyen              2018-11-07  329  static int dwc3_lsp_show(struct seq_file *s, void *unused)
62ba09d6bb6330 Thinh Nguyen              2018-11-07  330  {
62ba09d6bb6330 Thinh Nguyen              2018-11-07  331  	struct dwc3		*dwc = s->private;
62ba09d6bb6330 Thinh Nguyen              2018-11-07  332  	unsigned int		current_mode;
62ba09d6bb6330 Thinh Nguyen              2018-11-07  333  	unsigned long		flags;
62ba09d6bb6330 Thinh Nguyen              2018-11-07  334  	u32			reg;
86f75fd9ae2609 Udipto Goswami            2023-04-18  335  	int			ret;
86f75fd9ae2609 Udipto Goswami            2023-04-18  336  
86f75fd9ae2609 Udipto Goswami            2023-04-18  337  	ret = pm_runtime_get_sync(dwc->dev);
86f75fd9ae2609 Udipto Goswami            2023-04-18 @338  	if (!ret || ret < 0) {
86f75fd9ae2609 Udipto Goswami            2023-04-18  339  		pm_runtime_put(dwc->dev);
86f75fd9ae2609 Udipto Goswami            2023-04-18  340  		return 0;

I don't know what's going on here, but Smatch doesn't like it.  :P

86f75fd9ae2609 Udipto Goswami            2023-04-18  341  	}
62ba09d6bb6330 Thinh Nguyen              2018-11-07  342  
62ba09d6bb6330 Thinh Nguyen              2018-11-07  343  	spin_lock_irqsave(&dwc->lock, flags);
62ba09d6bb6330 Thinh Nguyen              2018-11-07  344  	reg = dwc3_readl(dwc->regs, DWC3_GSTS);
62ba09d6bb6330 Thinh Nguyen              2018-11-07  345  	current_mode = DWC3_GSTS_CURMOD(reg);
62ba09d6bb6330 Thinh Nguyen              2018-11-07  346  
62ba09d6bb6330 Thinh Nguyen              2018-11-07  347  	switch (current_mode) {
62ba09d6bb6330 Thinh Nguyen              2018-11-07  348  	case DWC3_GSTS_CURMOD_HOST:
62ba09d6bb6330 Thinh Nguyen              2018-11-07  349  		dwc3_host_lsp(s);
62ba09d6bb6330 Thinh Nguyen              2018-11-07  350  		break;
62ba09d6bb6330 Thinh Nguyen              2018-11-07  351  	case DWC3_GSTS_CURMOD_DEVICE:
62ba09d6bb6330 Thinh Nguyen              2018-11-07  352  		dwc3_gadget_lsp(s);
62ba09d6bb6330 Thinh Nguyen              2018-11-07  353  		break;
62ba09d6bb6330 Thinh Nguyen              2018-11-07  354  	default:
62ba09d6bb6330 Thinh Nguyen              2018-11-07  355  		seq_puts(s, "Mode is unknown, no LSP register printed\n");
62ba09d6bb6330 Thinh Nguyen              2018-11-07  356  		break;
62ba09d6bb6330 Thinh Nguyen              2018-11-07  357  	}
62ba09d6bb6330 Thinh Nguyen              2018-11-07  358  	spin_unlock_irqrestore(&dwc->lock, flags);
86f75fd9ae2609 Udipto Goswami            2023-04-18  359  	pm_runtime_put(dwc->dev);
62ba09d6bb6330 Thinh Nguyen              2018-11-07  360  
62ba09d6bb6330 Thinh Nguyen              2018-11-07  361  	return 0;
62ba09d6bb6330 Thinh Nguyen              2018-11-07  362  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
