Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4658030DE6E
	for <lists+linux-usb@lfdr.de>; Wed,  3 Feb 2021 16:43:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234441AbhBCPmN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Feb 2021 10:42:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233746AbhBCPkB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Feb 2021 10:40:01 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B98E5C061797
        for <linux-usb@vger.kernel.org>; Wed,  3 Feb 2021 07:39:18 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id s77so61557qke.4
        for <linux-usb@vger.kernel.org>; Wed, 03 Feb 2021 07:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i2UDsqpc8a2GtzcTvjLa967ATK0u+ZQ0CBibCSaKxNg=;
        b=W2H1hpWm1hkvLxjo3nWoca9aJobjsF0nB0Ag88X+OhIvyMUphbfLtk2gujbRlAyaCs
         EeKIDpQeXbShLYyUEJVjkGGnl+4+bhn2JH98ADXqHeHcSIp6hsUAk6htaAEjidLfwO5g
         A3djYi0Cho9Xcz5TPNVXo07fXbAkq1GmQwaRIltPs7gV2Fk+0VqiSe/SumvAmZ1G5Rul
         8+cYD8K07A+MBbMVHQs2sjPhW539WPW0QrCNtkz3B6Jnj1tmbaPlM9kzaToe6zrne5OJ
         TiA4PyAeKCjL66JZogTfuN07X9Jz5LpK3RY2tWkh4sBtafioSH8ea8DmGzS3BUVuMrhA
         YdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i2UDsqpc8a2GtzcTvjLa967ATK0u+ZQ0CBibCSaKxNg=;
        b=UoIa62Zqgd8/pSrdlP0vpFiJ68Td4Gb1kkTxcVKiu4eJt9I3+VHwwm+4lhDnyHLBU7
         VRVvzNwAoksXFraW5YQnpL//g2jT6D344ICN5vy3CLgGSyA4F/zH4pVPE2u7kJHd0GjJ
         vP0/S8LyINQGRxF7xXysDEIVSa75JeGwSDPA3CdL9B8ZDVLhyisN/JVHQv0FIz4XJq5s
         SvSyi8nMjHCs1KAzM2gpRoTMPRdcKuNGEngDGTXBO1fGcUyr2sjJwn4YuGhn24X3b8Ff
         wi6wX3xtKZksiEEf2FkXdlGQ0q16C0hCegF7qPmBS+fJ78zG8y8yopMbqqLcKUTu6uhD
         vcZQ==
X-Gm-Message-State: AOAM532gx+3GhE8rC9uurAw7rKnhywq/qf52xi85jTUM6OfRGavhJS7B
        86Nw4YpA7ijGL3niXBs+1TNZ9s0nNgr+Ndgja9tVWQ==
X-Google-Smtp-Source: ABdhPJwGJeYwTuPFqIvo6rrTNfWDkrJ9lr7xhMGSS/MIIkMnwK+vdOlOWEa/Ly/kV0+jC3siA+30VJ1LGYce+6qcEK8=
X-Received: by 2002:a37:b346:: with SMTP id c67mr3144685qkf.212.1612366757359;
 Wed, 03 Feb 2021 07:39:17 -0800 (PST)
MIME-Version: 1.0
References: <202102032303.xnvdBAo2-lkp@intel.com>
In-Reply-To: <202102032303.xnvdBAo2-lkp@intel.com>
From:   Kyle Tso <kyletso@google.com>
Date:   Wed, 3 Feb 2021 23:39:00 +0800
Message-ID: <CAGZ6i=2RTX3O9pLSt8xrnCmmKbVx26nnRN9h_Ci08dzmuJwJmQ@mail.gmail.com>
Subject: Re: [usb:usb-testing 155/155] drivers/platform/chrome/cros_ec_typec.c:778:8:
 error: 'CABLE_ATYPE' undeclared; did you mean
To:     pmalani@google.com, Benson Leung <bleung@google.com>
Cc:     USB <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Prashant and Benson,

I just got this notification that my patch "usb: pd: Update VDO
definitions" caused this build break.
The root cause is that I removed the definitions of Type-A and Type-B
in Product Type VDOs as they have already been deprecated.
And it's my bad that I didn't notice that someone else uses these definitions...

I can fix it by simply removing them in the switch case but I am not
sure whether they need to be kept for some reason (compatibility ?)
What do you think?

thanks,
Kyle


On Wed, Feb 3, 2021 at 11:19 PM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> head:   0e1d6f55a12e47942ce207dfb93e23049b454c9e
> commit: 0e1d6f55a12e47942ce207dfb93e23049b454c9e [155/155] usb: pd: Update VDO definitions
> config: arm-randconfig-r005-20210202 (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=0e1d6f55a12e47942ce207dfb93e23049b454c9e
>         git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
>         git fetch --no-tags usb usb-testing
>         git checkout 0e1d6f55a12e47942ce207dfb93e23049b454c9e
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=arm
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    drivers/platform/chrome/cros_ec_typec.c: In function 'cros_typec_handle_sop_prime_disc':
> >> drivers/platform/chrome/cros_ec_typec.c:778:8: error: 'CABLE_ATYPE' undeclared (first use in this function); did you mean 'CABLE_CTYPE'?
>      778 |   case CABLE_ATYPE:
>          |        ^~~~~~~~~~~
>          |        CABLE_CTYPE
>    drivers/platform/chrome/cros_ec_typec.c:778:8: note: each undeclared identifier is reported only once for each function it appears in
> >> drivers/platform/chrome/cros_ec_typec.c:781:8: error: 'CABLE_BTYPE' undeclared (first use in this function); did you mean 'CABLE_CTYPE'?
>      781 |   case CABLE_BTYPE:
>          |        ^~~~~~~~~~~
>          |        CABLE_CTYPE
>
>
> vim +778 drivers/platform/chrome/cros_ec_typec.c
>
> 8fab2755191f86 Prashant Malani 2020-11-16  750
> 3b3dd1f0dbfe92 Benson Leung    2021-01-28  751  static int cros_typec_handle_sop_prime_disc(struct cros_typec_data *typec, int port_num, u16 pd_revision)
> 8b46a212ad11f2 Prashant Malani 2020-11-16  752  {
> 8b46a212ad11f2 Prashant Malani 2020-11-16  753          struct cros_typec_port *port = typec->ports[port_num];
> 8b46a212ad11f2 Prashant Malani 2020-11-16  754          struct ec_response_typec_discovery *disc = port->disc_data;
> f4edab68e10119 Prashant Malani 2020-11-16  755          struct typec_cable_desc c_desc = {};
> f4edab68e10119 Prashant Malani 2020-11-16  756          struct typec_plug_desc p_desc;
> 8b46a212ad11f2 Prashant Malani 2020-11-16  757          struct ec_params_typec_discovery req = {
> 8b46a212ad11f2 Prashant Malani 2020-11-16  758                  .port = port_num,
> 8b46a212ad11f2 Prashant Malani 2020-11-16  759                  .partner_type = TYPEC_PARTNER_SOP_PRIME,
> 8b46a212ad11f2 Prashant Malani 2020-11-16  760          };
> 72d6e32bd85bd1 Prashant Malani 2020-11-16  761          u32 cable_plug_type;
> 8b46a212ad11f2 Prashant Malani 2020-11-16  762          int ret = 0;
> 8b46a212ad11f2 Prashant Malani 2020-11-16  763
> 8b46a212ad11f2 Prashant Malani 2020-11-16  764          memset(disc, 0, EC_PROTO2_MAX_RESPONSE_SIZE);
> 8b46a212ad11f2 Prashant Malani 2020-11-16  765          ret = cros_typec_ec_command(typec, 0, EC_CMD_TYPEC_DISCOVERY, &req, sizeof(req),
> 8b46a212ad11f2 Prashant Malani 2020-11-16  766                                      disc, EC_PROTO2_MAX_RESPONSE_SIZE);
> 8b46a212ad11f2 Prashant Malani 2020-11-16  767          if (ret < 0) {
> 8b46a212ad11f2 Prashant Malani 2020-11-16  768                  dev_err(typec->dev, "Failed to get SOP' discovery data for port: %d\n", port_num);
> 8b46a212ad11f2 Prashant Malani 2020-11-16  769                  goto sop_prime_disc_exit;
> 8b46a212ad11f2 Prashant Malani 2020-11-16  770          }
> 8b46a212ad11f2 Prashant Malani 2020-11-16  771
> 8b46a212ad11f2 Prashant Malani 2020-11-16  772          /* Parse the PD identity data, even if only 0s were returned. */
> 8b46a212ad11f2 Prashant Malani 2020-11-16  773          cros_typec_parse_pd_identity(&port->c_identity, disc);
> 8b46a212ad11f2 Prashant Malani 2020-11-16  774
> 72d6e32bd85bd1 Prashant Malani 2020-11-16  775          if (disc->identity_count != 0) {
> 72d6e32bd85bd1 Prashant Malani 2020-11-16  776                  cable_plug_type = VDO_TYPEC_CABLE_TYPE(port->c_identity.vdo[0]);
> 72d6e32bd85bd1 Prashant Malani 2020-11-16  777                  switch (cable_plug_type) {
> 72d6e32bd85bd1 Prashant Malani 2020-11-16 @778                  case CABLE_ATYPE:
> f4edab68e10119 Prashant Malani 2020-11-16  779                          c_desc.type = USB_PLUG_TYPE_A;
> 72d6e32bd85bd1 Prashant Malani 2020-11-16  780                          break;
> 72d6e32bd85bd1 Prashant Malani 2020-11-16 @781                  case CABLE_BTYPE:
> f4edab68e10119 Prashant Malani 2020-11-16  782                          c_desc.type = USB_PLUG_TYPE_B;
> 72d6e32bd85bd1 Prashant Malani 2020-11-16  783                          break;
> 72d6e32bd85bd1 Prashant Malani 2020-11-16  784                  case CABLE_CTYPE:
> f4edab68e10119 Prashant Malani 2020-11-16  785                          c_desc.type = USB_PLUG_TYPE_C;
> 72d6e32bd85bd1 Prashant Malani 2020-11-16  786                          break;
> 72d6e32bd85bd1 Prashant Malani 2020-11-16  787                  case CABLE_CAPTIVE:
> f4edab68e10119 Prashant Malani 2020-11-16  788                          c_desc.type = USB_PLUG_CAPTIVE;
> 72d6e32bd85bd1 Prashant Malani 2020-11-16  789                          break;
> 72d6e32bd85bd1 Prashant Malani 2020-11-16  790                  default:
> f4edab68e10119 Prashant Malani 2020-11-16  791                          c_desc.type = USB_PLUG_NONE;
> 72d6e32bd85bd1 Prashant Malani 2020-11-16  792                  }
> f4edab68e10119 Prashant Malani 2020-11-16  793                  c_desc.active = PD_IDH_PTYPE(port->c_identity.id_header) == IDH_PTYPE_ACABLE;
> 72d6e32bd85bd1 Prashant Malani 2020-11-16  794          }
> 8b46a212ad11f2 Prashant Malani 2020-11-16  795
> f4edab68e10119 Prashant Malani 2020-11-16  796          c_desc.identity = &port->c_identity;
> 3b3dd1f0dbfe92 Benson Leung    2021-01-28  797          c_desc.pd_revision = pd_revision;
> 8b46a212ad11f2 Prashant Malani 2020-11-16  798
> f4edab68e10119 Prashant Malani 2020-11-16  799          port->cable = typec_register_cable(port->port, &c_desc);
> 8b46a212ad11f2 Prashant Malani 2020-11-16  800          if (IS_ERR(port->cable)) {
> 8b46a212ad11f2 Prashant Malani 2020-11-16  801                  ret = PTR_ERR(port->cable);
> 8b46a212ad11f2 Prashant Malani 2020-11-16  802                  port->cable = NULL;
> f4edab68e10119 Prashant Malani 2020-11-16  803                  goto sop_prime_disc_exit;
> f4edab68e10119 Prashant Malani 2020-11-16  804          }
> f4edab68e10119 Prashant Malani 2020-11-16  805
> f4edab68e10119 Prashant Malani 2020-11-16  806          p_desc.index = TYPEC_PLUG_SOP_P;
> f4edab68e10119 Prashant Malani 2020-11-16  807          port->plug = typec_register_plug(port->cable, &p_desc);
> f4edab68e10119 Prashant Malani 2020-11-16  808          if (IS_ERR(port->plug)) {
> f4edab68e10119 Prashant Malani 2020-11-16  809                  ret = PTR_ERR(port->plug);
> f4edab68e10119 Prashant Malani 2020-11-16  810                  port->plug = NULL;
> f4edab68e10119 Prashant Malani 2020-11-16  811                  goto sop_prime_disc_exit;
> 8b46a212ad11f2 Prashant Malani 2020-11-16  812          }
> 8b46a212ad11f2 Prashant Malani 2020-11-16  813
> 1563090965421f Prashant Malani 2020-11-16  814          ret = cros_typec_register_altmodes(typec, port_num, false);
> 1563090965421f Prashant Malani 2020-11-16  815          if (ret < 0) {
> 1563090965421f Prashant Malani 2020-11-16  816                  dev_err(typec->dev, "Failed to register plug altmodes, port: %d\n", port_num);
> 1563090965421f Prashant Malani 2020-11-16  817                  goto sop_prime_disc_exit;
> 1563090965421f Prashant Malani 2020-11-16  818          }
> 1563090965421f Prashant Malani 2020-11-16  819
> f4edab68e10119 Prashant Malani 2020-11-16  820          return 0;
> f4edab68e10119 Prashant Malani 2020-11-16  821
> 8b46a212ad11f2 Prashant Malani 2020-11-16  822  sop_prime_disc_exit:
> f4edab68e10119 Prashant Malani 2020-11-16  823          cros_typec_remove_cable(typec, port_num);
> 8b46a212ad11f2 Prashant Malani 2020-11-16  824          return ret;
> 8b46a212ad11f2 Prashant Malani 2020-11-16  825  }
> 8b46a212ad11f2 Prashant Malani 2020-11-16  826
>
> :::::: The code at line 778 was first introduced by commit
> :::::: 72d6e32bd85bd1e5cb5aa467f4eb5d0a69559953 platform/chrome: cros_ec_typec: Store cable plug type
>
> :::::: TO: Prashant Malani <pmalani@chromium.org>
> :::::: CC: Benson Leung <bleung@chromium.org>
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
