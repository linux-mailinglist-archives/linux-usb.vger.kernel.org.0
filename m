Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89DF173A593
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jun 2023 18:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbjFVQJC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Jun 2023 12:09:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbjFVQI7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Jun 2023 12:08:59 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BA311BD3
        for <linux-usb@vger.kernel.org>; Thu, 22 Jun 2023 09:08:57 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3422161e53bso2004625ab.1
        for <linux-usb@vger.kernel.org>; Thu, 22 Jun 2023 09:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687450136; x=1690042136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FHqSAo1JZFanbNc68ZGVvrcnODGDqqndEldpZ02Ty/Y=;
        b=i0Y2Zkfbv3qyClhoc71j511MNGlWNG6Ms6VywWhZKnX8KP3hFdweVFzOjNZLh2P7Sz
         wy8UdWbBE5pBMTOPwh1On/bpDaAotEB4KiKb87PWnwVelUk/dcwmop4eUjYILm+iTTTa
         3smUhRvuPi+b80MWbipjILYZJ4xNEtU6KfET8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687450136; x=1690042136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHqSAo1JZFanbNc68ZGVvrcnODGDqqndEldpZ02Ty/Y=;
        b=loXrAIkBJtdsYRZg9vO8CiNOEWnSKi4yxTbuO86UR6NJmHFPs5cE9XYyp+QKbcyFLv
         FiHhSqMhMuU5ZSN2V+uerMJMP+cN8kicbgbKIWlWc2bLJTjhDbWQX+GxdXxl55Y9kOC7
         TaneRAhvue7oj3fhn/Y70+TS0N+Dd0ooIlBq3lvmZMYDkt/BLB/hXggAwh+tuUwJj4vU
         r/lCRWx3WFsm681uXfsMcqq5zJcOEwGEAXRFBwIVhmhvt/gXDUW9qOn7a4cjInvIZbY9
         xMt7mlehi6O9LlmvASDXlAwCwT6U40xGjvAXjM/ZdGDJsCCrTQmn5i4GEry8fLhYyeK9
         zL/g==
X-Gm-Message-State: AC+VfDyZExAfLe4NgLVW4O1tLij4MLFM3pMG1he/VDJyqZWw815KKS+P
        EFLyAUUeUbybdla1lSWnBpyLOQM/uORejllqJxM=
X-Google-Smtp-Source: ACHHUZ4MQeQVPmH/HSaMbKwgi7GQaFA9OfMedxFR7y2OD1NdAPYzYZwI6KCk8FlOsRCworIhRHHBdQ==
X-Received: by 2002:a92:dc45:0:b0:33e:c0b:9ff2 with SMTP id x5-20020a92dc45000000b0033e0c0b9ff2mr13218599ilq.1.1687450136255;
        Thu, 22 Jun 2023 09:08:56 -0700 (PDT)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id j18-20020a926e12000000b00341c0710169sm2068424ilc.46.2023.06.22.09.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 09:08:55 -0700 (PDT)
Date:   Thu, 22 Jun 2023 16:08:55 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Benjamin Bara <bbara93@gmail.com>
Cc:     lkp@intel.com, alexander.stein@ew.tq-group.com,
        benjamin.bara@skidata.com, conor+dt@kernel.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
        krzk@kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
        robh+dt@kernel.org
Subject: Re: [PATCH v5 1/3] usb: misc: onboard-hub: support multiple power
 supplies
Message-ID: <ZJRyF45Ui5U4FraP@google.com>
References: <202306221742.xnLvAlnW-lkp@intel.com>
 <20230622102601.2244054-1-bbara93@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230622102601.2244054-1-bbara93@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 22, 2023 at 12:26:01PM +0200, Benjamin Bara wrote:
> On Thu, 22 Jun 2023 at 11:29, kernel test robot <lkp@intel.com> wrote:
> >
> > Hi Benjamin,
> >
> > kernel test robot noticed the following build warnings:
> >
> > [auto build test WARNING on 45a3e24f65e90a047bef86f927ebdc4c710edaa1]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Bara/usb-misc-onboard-hub-support-multiple-power-supplies/20230622-161859
> > base:   45a3e24f65e90a047bef86f927ebdc4c710edaa1
> > patch link:    https://lore.kernel.org/r/20230620-hx3-v5-1-319c9c4c846f%40skidata.com
> > patch subject: [PATCH v5 1/3] usb: misc: onboard-hub: support multiple power supplies
> > config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230622/202306221742.xnLvAlnW-lkp@intel.com/config)
> > compiler: alpha-linux-gcc (GCC) 12.3.0
> > reproduce: (https://download.01.org/0day-ci/archive/20230622/202306221742.xnLvAlnW-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202306221742.xnLvAlnW-lkp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >    drivers/usb/misc/onboard_usb_hub.c: In function 'onboard_hub_probe':
> > >> drivers/usb/misc/onboard_usb_hub.c:262:58: warning: format '%d' expects argument of type 'int', but argument 4 has type 'long unsigned int' [-Wformat=]
> >      262 |                 return dev_err_probe(dev, -EINVAL, "max %d supplies supported!\n",
> >          |                                                         ~^
> >          |                                                          |
> >          |                                                          int
> >          |                                                         %ld
> 
> Thanks Mr. Robot, seems like I forgot to compile with Werr :/
> I will wait for other feedback and fix this in the next round.

The patch looks good to me with the above fixed.
