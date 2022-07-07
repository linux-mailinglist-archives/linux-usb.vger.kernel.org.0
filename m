Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A795656AE1C
	for <lists+linux-usb@lfdr.de>; Fri,  8 Jul 2022 00:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236803AbiGGWGh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Jul 2022 18:06:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236775AbiGGWGg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Jul 2022 18:06:36 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B35415A2DB
        for <linux-usb@vger.kernel.org>; Thu,  7 Jul 2022 15:06:34 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 64so25626671ybt.12
        for <linux-usb@vger.kernel.org>; Thu, 07 Jul 2022 15:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7UFGapQUmVzze+bPOzX448q4o7gbh7fA6vE58zBhvvM=;
        b=ZP8qKMGpzxTcxHpyX+YtpLCre0I0SLiX8dNkR8f1hwUFCt8K0TvDtqClFnq/w5L0y9
         cOcFu5jmvSQaMMLyPQMZEZytUZO4bCtIFApl70ZnFq5Db+3RXsPhWy0AoUmubKqhZ4So
         bw1yhLs9WWrUn7z2sQ9FUW77rqTD7DgTUYGfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7UFGapQUmVzze+bPOzX448q4o7gbh7fA6vE58zBhvvM=;
        b=yGJy9okzmqiVv0+GRP7M9mCD38n8cRyQrdJ4NFn9NVUsRUIzw81MdM/Lf/j8TC9BrP
         7p3MXB0z4/KCHf7PISOmqQsPrTkzKUYAwuodQrvJuiN2ynVguJBwC8rc3SdICTIKJG8d
         TQbOpA/mDccAFMt8d6PrbRpD2RivnFimKql4/UAy1AiU0l/5pj1iwuU8PtpXX5ys6CWL
         lC6A8NxpqDPlujbvQfZIKhlOjVAfUFUXXkQUt7mIGqq4mrUgOjPXQJ1ZYHIvE+MubVoR
         0V3E+sxJG81jRZUQUz4Z24lH9kNlWCW2OFTBFO1Sg9x75vxo62+INJRa0LXsEEFgtyYw
         iM/g==
X-Gm-Message-State: AJIora9iRNfU0GLP5Giv0YdtwJMVpOjfvCILpvJXK9wWeZZRlC8BfoPD
        6c62qYsLAuBlRgOa/t7Rv63gUNGU6Ln3PcILElzEaw==
X-Google-Smtp-Source: AGRyM1tA88lK8bMldivq5Q8tXTohFQGXUUrPduGItjYoy9GpwYyOXFyU3HX0TeVAhcOPU/AITKKPXUEpF+NN+gSsVRg=
X-Received: by 2002:a25:b7cf:0:b0:66e:2ddc:dda7 with SMTP id
 u15-20020a25b7cf000000b0066e2ddcdda7mr88408ybj.197.1657231593901; Thu, 07 Jul
 2022 15:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220706171601.807042-7-pmalani@chromium.org> <202207071256.63ElDHIG-lkp@intel.com>
In-Reply-To: <202207071256.63ElDHIG-lkp@intel.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Thu, 7 Jul 2022 15:06:23 -0700
Message-ID: <CACeCKadwM7VVZadZxDr-TQ0DB1Dy5mv2bwY=p+p3Y1uVNHE8Tg@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] platform/chrome: cros_typec_switch: Add event check
To:     kernel test robot <lkp@intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        chrome-platform@lists.linux.dev, kbuild-all@lists.01.org,
        bleung@chromium.org, heikki.krogerus@linux.intel.com,
        Daisuke Nojiri <dnojiri@chromium.org>,
        "Dustin L. Howett" <dustin@howett.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <groeck@chromium.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tzung-Bi Shih <tzungbi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 6, 2022 at 9:26 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Prashant,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on usb/usb-testing]
> [cannot apply to chrome-platform/for-next linus/master balbi-usb/testing/next peter-chen-usb/for-usb-next v5.19-rc5]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Prashant-Malani/platform-chrome-Type-C-switch-driver-and-Type-C-framework-updates/20220707-012614
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220707/202207071256.63ElDHIG-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
> reproduce (this is a W=1 build):
>         # https://github.com/intel-lab-lkp/linux/commit/60e03c1b36c0e3533e481b44152faab38448be5b
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Prashant-Malani/platform-chrome-Type-C-switch-driver-and-Type-C-framework-updates/20220707-012614
>         git checkout 60e03c1b36c0e3533e481b44152faab38448be5b
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/platform/chrome/ kernel/bpf/
>
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/platform/chrome/cros_typec_switch.c:81:6: warning: no previous prototype for 'cros_typec_check_event' [-Wmissing-prototypes]
>       81 | bool cros_typec_check_event(struct cros_typec_switch_data *sdata, int port_num, u32 mask)
>          |      ^~~~~~~~~~~~~~~~~~~~~~
>    drivers/platform/chrome/cros_typec_switch.c:159:6: warning: no previous prototype for 'cros_typec_unregister_switches' [-Wmissing-prototypes]
>      159 | void cros_typec_unregister_switches(struct cros_typec_switch_data *sdata)
>          |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/platform/chrome/cros_typec_switch.c:170:5: warning: no previous prototype for 'cros_typec_register_retimer' [-Wmissing-prototypes]
>      170 | int cros_typec_register_retimer(struct cros_typec_port *port, struct fwnode_handle *fwnode)
>          |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
I'll fix these warnings and send out a v3.
Apologies for the churn.

-Prashant
