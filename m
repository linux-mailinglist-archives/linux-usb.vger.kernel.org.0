Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F25D030DFE7
	for <lists+linux-usb@lfdr.de>; Wed,  3 Feb 2021 17:41:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbhBCQl1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Feb 2021 11:41:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbhBCQlY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Feb 2021 11:41:24 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA97AC0613ED
        for <linux-usb@vger.kernel.org>; Wed,  3 Feb 2021 08:40:43 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id r12so17473ejb.9
        for <linux-usb@vger.kernel.org>; Wed, 03 Feb 2021 08:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M0i4ZC++Omwox1TY1Blwn3vGW+dEn4HG2BCXyp9UmWc=;
        b=aEMjotauD/7YDi6lrZjLooQ1QhopmsmaamvA/kMMofFhUZjCL0pAvUQoUXHbcjIaQe
         fQRe1BT1g739Qgi2R9IHfL3+dMEtDB6Z7gJuXdLDvN/Df8yh7YnXQIQgDUQM17IXY/Lx
         7HZIQFAETD7ggwFupxkhDpNV6nk85H2TvcMReBe290efwH3VtoYsy+ofE2OuA8H2cEik
         abnxoEjzKWf8EQ2Avar7SNxl7v9yWf1CtsvF7mQ81LpibSdPRpQVUfiC8d5CL0ZQgFQh
         rAJGlQYWUAxTa9Bu06KtzpKnoudWuhETtvVN4huOglMukjPgbo7r+Q+Y8F4v/qoF8rok
         CS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M0i4ZC++Omwox1TY1Blwn3vGW+dEn4HG2BCXyp9UmWc=;
        b=sBXp7dXwTKgGfa+l/uGdTDvFoZPjiPQxC31y8hnpv+cYrNYP/0AugMR9XGuLkggzaL
         wDu/RsGd4j7JC3nO8bCEja6nhRR8TVoBeu5O3bfkG9V7dlAZHUU5c58/lEdt4I3SxBkI
         FhuhIo6iWnrKjnomSH6qKCwC93at7YOi/Z2cbJf36amCDzUeod/GkvdtCtjQFxe/OAO7
         G3z3ktvFnWC8mRaG+DluUV+NuQTlNkn0Wv4UvM99/At6MM1MkaaHjBGbezH6PQmZxBO3
         ju+QlSNDu2KDrK/Co178UAwB4Xy5tDETvurwMlSMtPkgdMicZGXprfmDI/lfzMM2JlVT
         l36Q==
X-Gm-Message-State: AOAM530mh8biKpKxmfLHuuSQc5kTpsbkparV7npf6Oc9g3aVLu35Jsms
        KuirH3X9/9Y97zyUovQyk+SPsXT+1varzKTfHYL17A==
X-Google-Smtp-Source: ABdhPJwBv7nNsWTq+uifun//6JAo4xU6c0a9JAg+6okQfd0yeq6w3pW85GFxw18RR9wH/LpPeDRlW7kQbLhDv5e/T+k=
X-Received: by 2002:a17:906:388a:: with SMTP id q10mr3967223ejd.496.1612370442152;
 Wed, 03 Feb 2021 08:40:42 -0800 (PST)
MIME-Version: 1.0
References: <202102032303.xnvdBAo2-lkp@intel.com> <CAGZ6i=2RTX3O9pLSt8xrnCmmKbVx26nnRN9h_Ci08dzmuJwJmQ@mail.gmail.com>
In-Reply-To: <CAGZ6i=2RTX3O9pLSt8xrnCmmKbVx26nnRN9h_Ci08dzmuJwJmQ@mail.gmail.com>
From:   Benson Leung <bleung@google.com>
Date:   Wed, 3 Feb 2021 08:40:30 -0800
Message-ID: <CANLzEktC3gL9vxsFOmQQ=0ymgPB+0AWQ+NL_tQVB3Jvr4B5LCw@mail.gmail.com>
Subject: Re: [usb:usb-testing 155/155] drivers/platform/chrome/cros_ec_typec.c:778:8:
 error: 'CABLE_ATYPE' undeclared; did you mean
To:     Kyle Tso <kyletso@google.com>
Cc:     Prashant Malani <pmalani@google.com>,
        USB <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Kyle,

On Wed, Feb 3, 2021 at 7:39 AM Kyle Tso <kyletso@google.com> wrote:
>
> Hi Prashant and Benson,
>
> I just got this notification that my patch "usb: pd: Update VDO
> definitions" caused this build break.
> The root cause is that I removed the definitions of Type-A and Type-B
> in Product Type VDOs as they have already been deprecated.
> And it's my bad that I didn't notice that someone else uses these definitions...
>
> I can fix it by simply removing them in the switch case but I am not
> sure whether they need to be kept for some reason (compatibility ?)
> What do you think?

Strictly speaking, Type-A and Type-B definitions here are deprecated
in PD 3.0, but PD 3.0 implementations have to be able to fall back to
PD 2.0 protocol when the port partner or cable is PD 2.0 only.

In the last version of the PD 2.0 specification released, the Type-A
and Type-B definitions still remain, so we can't really remove them
from the Kernel until all of PD 2.0 is deprecated.

They're very rare cables, but I have seen a PD 2.0 cable with an
e-marker that indicates Type-B here.

Hope this helps,
Benson

>
> thanks,
> Kyle
>
>
> On Wed, Feb 3, 2021 at 11:19 PM kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> > head:   0e1d6f55a12e47942ce207dfb93e23049b454c9e
> > commit: 0e1d6f55a12e47942ce207dfb93e23049b454c9e [155/155] usb: pd: Update VDO definitions
> > config: arm-randconfig-r005-20210202 (attached as .config)
> > compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=0e1d6f55a12e47942ce207dfb93e23049b454c9e
> >         git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
> >         git fetch --no-tags usb usb-testing
> >         git checkout 0e1d6f55a12e47942ce207dfb93e23049b454c9e
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=arm
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> >    drivers/platform/chrome/cros_ec_typec.c: In function 'cros_typec_handle_sop_prime_disc':
> > >> drivers/platform/chrome/cros_ec_typec.c:778:8: error: 'CABLE_ATYPE' undeclared (first use in this function); did you mean 'CABLE_CTYPE'?
> >      778 |   case CABLE_ATYPE:
> >          |        ^~~~~~~~~~~
> >          |        CABLE_CTYPE
> >    drivers/platform/chrome/cros_ec_typec.c:778:8: note: each undeclared identifier is reported only once for each function it appears in
> > >> drivers/platform/chrome/cros_ec_typec.c:781:8: error: 'CABLE_BTYPE' undeclared (first use in this function); did you mean 'CABLE_CTYPE'?
> >      781 |   case CABLE_BTYPE:
> >          |        ^~~~~~~~~~~
> >          |        CABLE_CTYPE
> >
> >
> > vim +778 drivers/platform/chrome/cros_ec_typec.c
> >
> > 8fab2755191f86 Prashant Malani 2020-11-16  750
> > 3b3dd1f0dbfe92 Benson Leung    2021-01-28  751  static int cros_typec_handle_sop_prime_disc(struct cros_typec_data *typec, int port_num, u16 pd_revision)
> > 8b46a212ad11f2 Prashant Malani 2020-11-16  752  {
> > 8b46a212ad11f2 Prashant Malani 2020-11-16  753          struct cros_typec_port *port = typec->ports[port_num];
> > 8b46a212ad11f2 Prashant Malani 2020-11-16  754          struct ec_response_typec_discovery *disc = port->disc_data;
> > f4edab68e10119 Prashant Malani 2020-11-16  755          struct typec_cable_desc c_desc = {};
> > f4edab68e10119 Prashant Malani 2020-11-16  756          struct typec_plug_desc p_desc;
> > 8b46a212ad11f2 Prashant Malani 2020-11-16  757          struct ec_params_typec_discovery req = {
> > 8b46a212ad11f2 Prashant Malani 2020-11-16  758                  .port = port_num,
> > 8b46a212ad11f2 Prashant Malani 2020-11-16  759                  .partner_type = TYPEC_PARTNER_SOP_PRIME,
> > 8b46a212ad11f2 Prashant Malani 2020-11-16  760          };
> > 72d6e32bd85bd1 Prashant Malani 2020-11-16  761          u32 cable_plug_type;
> > 8b46a212ad11f2 Prashant Malani 2020-11-16  762          int ret = 0;
> > 8b46a212ad11f2 Prashant Malani 2020-11-16  763
> > 8b46a212ad11f2 Prashant Malani 2020-11-16  764          memset(disc, 0, EC_PROTO2_MAX_RESPONSE_SIZE);
> > 8b46a212ad11f2 Prashant Malani 2020-11-16  765          ret = cros_typec_ec_command(typec, 0, EC_CMD_TYPEC_DISCOVERY, &req, sizeof(req),
> > 8b46a212ad11f2 Prashant Malani 2020-11-16  766                                      disc, EC_PROTO2_MAX_RESPONSE_SIZE);
> > 8b46a212ad11f2 Prashant Malani 2020-11-16  767          if (ret < 0) {
> > 8b46a212ad11f2 Prashant Malani 2020-11-16  768                  dev_err(typec->dev, "Failed to get SOP' discovery data for port: %d\n", port_num);
> > 8b46a212ad11f2 Prashant Malani 2020-11-16  769                  goto sop_prime_disc_exit;
> > 8b46a212ad11f2 Prashant Malani 2020-11-16  770          }
> > 8b46a212ad11f2 Prashant Malani 2020-11-16  771
> > 8b46a212ad11f2 Prashant Malani 2020-11-16  772          /* Parse the PD identity data, even if only 0s were returned. */
> > 8b46a212ad11f2 Prashant Malani 2020-11-16  773          cros_typec_parse_pd_identity(&port->c_identity, disc);
> > 8b46a212ad11f2 Prashant Malani 2020-11-16  774
> > 72d6e32bd85bd1 Prashant Malani 2020-11-16  775          if (disc->identity_count != 0) {
> > 72d6e32bd85bd1 Prashant Malani 2020-11-16  776                  cable_plug_type = VDO_TYPEC_CABLE_TYPE(port->c_identity.vdo[0]);
> > 72d6e32bd85bd1 Prashant Malani 2020-11-16  777                  switch (cable_plug_type) {
> > 72d6e32bd85bd1 Prashant Malani 2020-11-16 @778                  case CABLE_ATYPE:
> > f4edab68e10119 Prashant Malani 2020-11-16  779                          c_desc.type = USB_PLUG_TYPE_A;
> > 72d6e32bd85bd1 Prashant Malani 2020-11-16  780                          break;
> > 72d6e32bd85bd1 Prashant Malani 2020-11-16 @781                  case CABLE_BTYPE:
> > f4edab68e10119 Prashant Malani 2020-11-16  782                          c_desc.type = USB_PLUG_TYPE_B;
> > 72d6e32bd85bd1 Prashant Malani 2020-11-16  783                          break;
> > 72d6e32bd85bd1 Prashant Malani 2020-11-16  784                  case CABLE_CTYPE:
> > f4edab68e10119 Prashant Malani 2020-11-16  785                          c_desc.type = USB_PLUG_TYPE_C;
> > 72d6e32bd85bd1 Prashant Malani 2020-11-16  786                          break;
> > 72d6e32bd85bd1 Prashant Malani 2020-11-16  787                  case CABLE_CAPTIVE:
> > f4edab68e10119 Prashant Malani 2020-11-16  788                          c_desc.type = USB_PLUG_CAPTIVE;
> > 72d6e32bd85bd1 Prashant Malani 2020-11-16  789                          break;
> > 72d6e32bd85bd1 Prashant Malani 2020-11-16  790                  default:
> > f4edab68e10119 Prashant Malani 2020-11-16  791                          c_desc.type = USB_PLUG_NONE;
> > 72d6e32bd85bd1 Prashant Malani 2020-11-16  792                  }
> > f4edab68e10119 Prashant Malani 2020-11-16  793                  c_desc.active = PD_IDH_PTYPE(port->c_identity.id_header) == IDH_PTYPE_ACABLE;
> > 72d6e32bd85bd1 Prashant Malani 2020-11-16  794          }
> > 8b46a212ad11f2 Prashant Malani 2020-11-16  795
> > f4edab68e10119 Prashant Malani 2020-11-16  796          c_desc.identity = &port->c_identity;
> > 3b3dd1f0dbfe92 Benson Leung    2021-01-28  797          c_desc.pd_revision = pd_revision;
> > 8b46a212ad11f2 Prashant Malani 2020-11-16  798
> > f4edab68e10119 Prashant Malani 2020-11-16  799          port->cable = typec_register_cable(port->port, &c_desc);
> > 8b46a212ad11f2 Prashant Malani 2020-11-16  800          if (IS_ERR(port->cable)) {
> > 8b46a212ad11f2 Prashant Malani 2020-11-16  801                  ret = PTR_ERR(port->cable);
> > 8b46a212ad11f2 Prashant Malani 2020-11-16  802                  port->cable = NULL;
> > f4edab68e10119 Prashant Malani 2020-11-16  803                  goto sop_prime_disc_exit;
> > f4edab68e10119 Prashant Malani 2020-11-16  804          }
> > f4edab68e10119 Prashant Malani 2020-11-16  805
> > f4edab68e10119 Prashant Malani 2020-11-16  806          p_desc.index = TYPEC_PLUG_SOP_P;
> > f4edab68e10119 Prashant Malani 2020-11-16  807          port->plug = typec_register_plug(port->cable, &p_desc);
> > f4edab68e10119 Prashant Malani 2020-11-16  808          if (IS_ERR(port->plug)) {
> > f4edab68e10119 Prashant Malani 2020-11-16  809                  ret = PTR_ERR(port->plug);
> > f4edab68e10119 Prashant Malani 2020-11-16  810                  port->plug = NULL;
> > f4edab68e10119 Prashant Malani 2020-11-16  811                  goto sop_prime_disc_exit;
> > 8b46a212ad11f2 Prashant Malani 2020-11-16  812          }
> > 8b46a212ad11f2 Prashant Malani 2020-11-16  813
> > 1563090965421f Prashant Malani 2020-11-16  814          ret = cros_typec_register_altmodes(typec, port_num, false);
> > 1563090965421f Prashant Malani 2020-11-16  815          if (ret < 0) {
> > 1563090965421f Prashant Malani 2020-11-16  816                  dev_err(typec->dev, "Failed to register plug altmodes, port: %d\n", port_num);
> > 1563090965421f Prashant Malani 2020-11-16  817                  goto sop_prime_disc_exit;
> > 1563090965421f Prashant Malani 2020-11-16  818          }
> > 1563090965421f Prashant Malani 2020-11-16  819
> > f4edab68e10119 Prashant Malani 2020-11-16  820          return 0;
> > f4edab68e10119 Prashant Malani 2020-11-16  821
> > 8b46a212ad11f2 Prashant Malani 2020-11-16  822  sop_prime_disc_exit:
> > f4edab68e10119 Prashant Malani 2020-11-16  823          cros_typec_remove_cable(typec, port_num);
> > 8b46a212ad11f2 Prashant Malani 2020-11-16  824          return ret;
> > 8b46a212ad11f2 Prashant Malani 2020-11-16  825  }
> > 8b46a212ad11f2 Prashant Malani 2020-11-16  826
> >
> > :::::: The code at line 778 was first introduced by commit
> > :::::: 72d6e32bd85bd1e5cb5aa467f4eb5d0a69559953 platform/chrome: cros_ec_typec: Store cable plug type
> >
> > :::::: TO: Prashant Malani <pmalani@chromium.org>
> > :::::: CC: Benson Leung <bleung@chromium.org>
> >
> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org



-- 
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org
