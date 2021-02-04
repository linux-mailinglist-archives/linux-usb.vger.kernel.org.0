Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2639830FA20
	for <lists+linux-usb@lfdr.de>; Thu,  4 Feb 2021 18:50:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238522AbhBDRqg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Feb 2021 12:46:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237445AbhBDRqU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Feb 2021 12:46:20 -0500
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07334C0613D6
        for <linux-usb@vger.kernel.org>; Thu,  4 Feb 2021 09:45:40 -0800 (PST)
Received: by mail-qv1-xf2e.google.com with SMTP id es14so2121669qvb.3
        for <linux-usb@vger.kernel.org>; Thu, 04 Feb 2021 09:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cqyjoq8OoX0qfgab+vhSM3IoqZR0KCLAhoUlCdPfvrw=;
        b=F1KC94JxK9vzZOPa4+NiloSSAfW9MmQF9Atq/22yT0gC0Aq20A4lAQm6HJ4v0y99k5
         bquTdo/F2n6UDSVmhkk6RIeQ4rGIjusFCtsIe8Soj7GImsnjFS5miZMibolVGuudUpL3
         GBDhDBR/Y8SZo2mneEIoKizdDNwjHTQBnF1J22DyS+uOzRfozlDmsNSXUOk6VY9Yc9WD
         A2WACyczee7BjlGoJdW5BKY7sp/pCtws6mEQ34m/1UM46Xm1Uu/VP4HrS2XEHcjLeQmC
         o/7/pnREI6P11P+pMFinGs0IzKUw53F+6dgQz74zGIRsA8q4eC/I06RTwM8HWy8N9PwQ
         31Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cqyjoq8OoX0qfgab+vhSM3IoqZR0KCLAhoUlCdPfvrw=;
        b=fzCRIGPDtrWZVn6MI1P0mNPQ8scgjBvzzKrD2SfLYc3s1vzfAUjErTGDA6jcFq5ool
         alXkxC6jcY7PzWy+JYTHTXXMG74bIc+RrCcD6kbZjRUIZ/WBK1AlYkag7kfcwE16miOq
         Cuhg18IiRn48QQTmOWKSvtheEEJClJOD0alZH6iMAnp7ITBiqbTqWZuGB/FtNGHhCYIc
         fjXtgIdwQcL1AktH7kzG57kALDnNOQCd1YaZsuVOlXPMi31Sa2VHTkovQpCCygmqWkaX
         I8dr9GdHKDF6/JOZ+aKKB7wKOHvPqpFciZLTgFWpy9d/ySTxUhfjA+SckzvjCCaHoPX+
         2H9A==
X-Gm-Message-State: AOAM531of2MZ8oQ7asbZ2TODCELjSkBQZgUZQ70khumO/uzCCSp0lQeJ
        TKM6PsV/FMbPEados0w9lkiyZhQJw4uIbDKl442RBg==
X-Google-Smtp-Source: ABdhPJxHGXtirzsrASChTfPQmuAgXzRXrtJ8UDiuhToq3sxfEoNiWOfX5uvsFiKZ401axqx8TRSZ/YlaEk1L+k6oWcg=
X-Received: by 2002:a05:6214:11ab:: with SMTP id u11mr550555qvv.17.1612460738789;
 Thu, 04 Feb 2021 09:45:38 -0800 (PST)
MIME-Version: 1.0
References: <202102050042.DpTJdrHK-lkp@intel.com>
In-Reply-To: <202102050042.DpTJdrHK-lkp@intel.com>
From:   Kyle Tso <kyletso@google.com>
Date:   Fri, 5 Feb 2021 01:45:22 +0800
Message-ID: <CAGZ6i=0t1W0Qm99b6FO9+F-YQtreNnZuQxF2V_09PMm32uRppw@mail.gmail.com>
Subject: Re: [usb:usb-testing 155/158] drivers/platform/chrome/cros_ec_typec.c:778:8:
 error: use of undeclared identifier 'CABLE_ATYPE'
To:     kernel test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        USB <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Feb 5, 2021 at 12:24 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi Kyle,
>
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> head:   d021e0694d77ee3cdc5d3fca2c8d53ae7575499a
> commit: 0e1d6f55a12e47942ce207dfb93e23049b454c9e [155/158] usb: pd: Update VDO definitions

Hi,
This seems to be the old buggy patch.

commit: 0e1d6f55a12e47942ce207dfb93e23049b454c9e [155/158] usb: pd:
Update VDO definitions

thanks,
Kyle

> config: mips-randconfig-r011-20210204 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 275c6af7d7f1ed63a03d05b4484413e447133269)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install mips cross compiling tool for clang build
>         # apt-get install binutils-mips-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=0e1d6f55a12e47942ce207dfb93e23049b454c9e
>         git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
>         git fetch --no-tags usb usb-testing
>         git checkout 0e1d6f55a12e47942ce207dfb93e23049b454c9e
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=mips
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> drivers/platform/chrome/cros_ec_typec.c:778:8: error: use of undeclared identifier 'CABLE_ATYPE'
>                    case CABLE_ATYPE:
>                         ^
> >> drivers/platform/chrome/cros_ec_typec.c:781:8: error: use of undeclared identifier 'CABLE_BTYPE'
>                    case CABLE_BTYPE:
>                         ^
>    drivers/platform/chrome/cros_ec_typec.c:1000:3: warning: format specifies type 'unsigned char' but the argument has type 'unsigned int' [-Wformat]
>                    typec->pd_ctrl_ver);
>                    ^~~~~~~~~~~~~~~~~~
>    include/linux/dev_printk.h:123:39: note: expanded from macro 'dev_dbg'
>            dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
>                                         ~~~     ^~~~~~~~~~~
>    include/linux/dynamic_debug.h:162:19: note: expanded from macro 'dynamic_dev_dbg'
>                               dev, fmt, ##__VA_ARGS__)
>                                    ~~~    ^~~~~~~~~~~
>    include/linux/dynamic_debug.h:147:56: note: expanded from macro '_dynamic_func_call'
>            __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
>                                                                  ^~~~~~~~~~~
>    include/linux/dynamic_debug.h:129:15: note: expanded from macro '__dynamic_func_call'
>                    func(&id, ##__VA_ARGS__);               \
>                                ^~~~~~~~~~~
>    1 warning and 2 errors generated.
>
>
> vim +/CABLE_ATYPE +778 drivers/platform/chrome/cros_ec_typec.c
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
